"""Copy and specialize this skeleton; do not use it unchanged."""

import vsc

from pygen_src.riscv_directed_instr_lib import riscv_directed_instr_stream


@vsc.randobj
class riscv_llm_PATTERN_stream(riscv_directed_instr_stream):
    def __init__(self):
        super().__init__()
        self.name = "riscv_llm_PATTERN_stream"
        # Define randomized and configured fields here.

    @vsc.constraint
    def pattern_c(self):
        # Express legal ranges and relationships here.
        pass

    def post_randomize(self):
        # Construct riscv_instr objects and append them to self.instr_list.
        if not self.instr_list:
            raise RuntimeError("pattern generated an empty instruction stream")
        super().post_randomize()

