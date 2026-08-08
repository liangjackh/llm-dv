"""Architecture-independent BPU capacity-pressure directed stream."""
import copy
import json
import re
from pathlib import Path

import vsc

from pygen_src.isa.riscv_instr import riscv_instr
from pygen_src.riscv_directed_instr_lib import riscv_directed_instr_stream
from pygen_src.riscv_instr_pkg import riscv_instr_name_t, riscv_reg_t


def _load_config():
    data = json.loads(Path(__file__).with_suffix(".json").read_text(encoding="utf-8"))
    for key in ("branch_sites", "minimum_unique_targets", "call_return_pairs"):
        if not isinstance(data.get(key), int) or data[key] <= 0:
            raise ValueError(f"{key} must be a positive integer")
    if data["minimum_unique_targets"] > data["branch_sites"]:
        raise ValueError("minimum_unique_targets cannot exceed branch_sites")
    outcomes = data.get("branch_outcomes")
    if (not isinstance(outcomes, list) or not outcomes or
            not set(outcomes) <= {"taken", "not_taken"} or len(set(outcomes)) != 2):
        raise ValueError("branch_outcomes must contain taken and not_taken")
    return data


def _instr(name):
    return copy.deepcopy(riscv_instr.get_instr(name))


def _safe_prefix(name):
    return re.sub(r"[^A-Za-z0-9_]", "_", name or "bpu_pressure")


@vsc.randobj
class riscv_llm_bpu_capacity_pressure_stream(riscv_directed_instr_stream):
    """Emit many safe, uniquely labeled control-flow sites and targets."""

    def __init__(self):
        super().__init__()
        self.name = "riscv_llm_bpu_capacity_pressure_stream"
        self.pattern_config = _load_config()

    @staticmethod
    def _branch(taken, target):
        instr = _instr(riscv_instr_name_t.BEQ if taken else riscv_instr_name_t.BNE)
        with instr.randomize_with():
            instr.rs1 == riscv_reg_t.ZERO
            instr.rs2 == riscv_reg_t.ZERO
        instr.imm_str = target
        instr.branch_assigned = 1
        return instr

    @staticmethod
    def _jal(rd, target):
        instr = _instr(riscv_instr_name_t.JAL)
        with instr.randomize_with():
            instr.rd == rd
        instr.imm_str = target
        instr.branch_assigned = 1
        return instr

    @staticmethod
    def _jalr_return():
        instr = _instr(riscv_instr_name_t.JALR)
        with instr.randomize_with():
            instr.rd == riscv_reg_t.ZERO
            instr.rs1 == riscv_reg_t.RA
            instr.imm == 0
        instr.imm_str = "0"
        instr.branch_assigned = 1
        return instr

    @staticmethod
    def _nop(label=None):
        instr = _instr(riscv_instr_name_t.NOP)
        with instr.randomize_with():
            instr.rd == riscv_reg_t.ZERO
            instr.rs1 == riscv_reg_t.ZERO
            instr.imm == 0
        if label:
            instr.label = label
            instr.has_label = 1
        return instr

    def _taken_for(self, index):
        outcomes = self.pattern_config["branch_outcomes"]
        return outcomes[index % len(outcomes)] == "taken"

    def post_randomize(self):
        prefix = _safe_prefix(self.name)
        for index in range(self.pattern_config["branch_sites"]):
            target = f"{prefix}_branch_target_{index}"
            self.instr_list.append(self._branch(self._taken_for(index), target))
            self.instr_list.append(self._nop(target))

        for index in range(self.pattern_config["call_return_pairs"]):
            callee = f"{prefix}_callee_{index}"
            resume = f"{prefix}_resume_{index}"
            after = f"{prefix}_after_call_{index}"
            self.instr_list.append(self._jal(riscv_reg_t.RA, callee))
            self.instr_list.append(self._nop(resume))
            self.instr_list.append(self._jal(riscv_reg_t.ZERO, after))
            self.instr_list.append(self._nop(callee))
            self.instr_list.append(self._jalr_return())
            self.instr_list.append(self._nop(after))

        exit_label = f"{prefix}_exit"
        self.instr_list.append(self._jal(riscv_reg_t.ZERO, exit_label))
        self.instr_list.append(self._nop(exit_label))
        if not self.instr_list:
            raise RuntimeError("BPU pressure pattern generated an empty stream")

        saved_labels = [(instr.label, instr.has_label) for instr in self.instr_list]
        super().post_randomize()
        for instr, (label, has_label) in zip(self.instr_list, saved_labels):
            if label:
                instr.label = label
                instr.has_label = has_label
