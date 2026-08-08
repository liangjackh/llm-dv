"""Generate an integer ALU read-after-write dependency chain."""

import json
import random
import copy
from pathlib import Path

import vsc

from pygen_src.isa.riscv_instr import riscv_instr
from pygen_src.riscv_directed_instr_lib import riscv_directed_instr_stream
from pygen_src.riscv_instr_gen_config import cfg
from pygen_src.riscv_instr_pkg import riscv_instr_name_t, riscv_reg_t


def _load_config():
    path = Path(__file__).with_suffix(".json")
    data = json.loads(path.read_text(encoding="utf-8"))
    minimum = data.get("sequence_count_min")
    maximum = data.get("sequence_count_max")
    names = data.get("allowed_instructions")
    if not isinstance(minimum, int) or not isinstance(maximum, int) or not 2 <= minimum <= maximum:
        raise ValueError("sequence_count must be an ordered integer range with minimum >= 2")
    if not isinstance(names, list) or not names:
        raise ValueError("allowed_instructions must be a non-empty list")
    allowed = []
    for name in names:
        try:
            allowed.append(riscv_instr_name_t[name])
        except KeyError as exc:
            raise ValueError(f"unsupported instruction name {name!r}") from exc
    return minimum, maximum, allowed


@vsc.randobj
class riscv_llm_alu_raw_stream(riscv_directed_instr_stream):
    """Emit R-type ALU instructions whose rs1 consumes the previous rd."""

    def __init__(self):
        super().__init__()
        self.name = "riscv_llm_alu_raw_stream"
        self.sequence_count_min, self.sequence_count_max, self.allowed_instr = _load_config()

    @staticmethod
    def _available_registers():
        reserved = set(cfg.reserved_regs)
        return [reg for reg in riscv_reg_t
                if reg != riscv_reg_t.ZERO and reg not in reserved]

    def post_randomize(self):
        registers = self._available_registers()
        if len(registers) < 3:
            raise RuntimeError("not enough non-reserved GPRs for an ALU RAW chain")
        sequence_count = random.randint(self.sequence_count_min, self.sequence_count_max)
        previous_rd = random.choice(registers)

        for index in range(sequence_count):
            # get_instr() returns a shallow copy whose pyvsc fields can still be
            # shared with later instances of the same opcode.
            instr = copy.deepcopy(riscv_instr.get_instr(random.choice(self.allowed_instr)))
            rd_candidates = [reg for reg in registers if reg != previous_rd]
            rd = random.choice(rd_candidates)
            rs1 = random.choice(registers) if index == 0 else previous_rd
            rs2_candidates = [reg for reg in registers if reg not in (rd, rs1)]
            rs2 = random.choice(rs2_candidates)
            with instr.randomize_with():
                instr.rd == rd
                instr.rs1 == rs1
                instr.rs2 == rs2
            self.instr_list.append(instr)
            previous_rd = rd

        if not self.instr_list:
            raise RuntimeError("ALU RAW pattern generated an empty instruction stream")
        super().post_randomize()
