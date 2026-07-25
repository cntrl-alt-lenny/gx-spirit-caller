"""Unit tests for tools/generate_progress_bars.py.

Pins the q-readable-c-done-definition (2026-07-25) fix: the README's
top-of-page SVG bar's green "decompiled to C" slice must count
NATURAL-C bytes only, not natural-C + asm-C combined. Before the fix,
`region_metrics()["c"]` was `sum(c_split.values())`, folding asm-C
(byte-matched `asm {}`-bodied `.c` files, not real decompilation) into
the same numerator progress.py's own CLI/JSON output had already split
out everywhere else -- this was the last asm-inflated surface.
"""

from __future__ import annotations

import sys
import tempfile
import unittest
from pathlib import Path
from unittest import mock

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

import progress as progress_module  # noqa: E402
import generate_progress_bars as gpb  # noqa: E402


def _make_config(root: Path, module_dir: str = "arm9") -> None:
    # One natural-C TU (0x40 B) + one asm-C TU (0x20 B) in the same
    # module, matching the c_code_bytes_by_class() fixture shape used
    # in test_progress.py's TestSummarizeByModuleHonestMetricColumns.
    mod = root / "config" / "eur" / module_dir
    mod.mkdir(parents=True)
    (mod / "delinks.txt").write_text(
        "    .text       start:0x0 end:0x100 kind:code\n"
        "\n"
        "src/main/func_natural.c:\n"
        "    complete\n"
        "    .text start:0x0 end:0x40\n"
        "\n"
        "src/main/func_asm.c:\n"
        "    complete\n"
        "    .text start:0x40 end:0x60\n"
    )
    src = root / "src" / "main"
    src.mkdir(parents=True)
    (src / "func_natural.c").write_text("void f(void) { return; }")
    (src / "func_asm.c").write_text("asm void g(void) { nop; }")


def _region_metrics(fake_root: Path) -> dict:
    # Two distinct ROOT globals need patching: generate_progress_bars'
    # own (builds the "eur" config_dir path) and progress.py's (resolves
    # each TU's source file to classify natural-c vs asm-c).
    with mock.patch.object(gpb, "ROOT", fake_root), \
         mock.patch.object(progress_module, "ROOT", fake_root):
        return gpb.region_metrics("eur")


class TestRegionMetricsNaturalCOnly(unittest.TestCase):
    """region_metrics()'s c/c_pct must exclude asm-C."""

    def test_c_excludes_asm_c_bytes(self):
        tmp = Path(tempfile.mkdtemp())
        _make_config(tmp)
        mm = _region_metrics(tmp)
        # natural-C only: 0x40 == 64 bytes, NOT 0x40+0x20 == 96.
        self.assertEqual(mm["natural_c"], 0x40)
        self.assertEqual(mm["asm_c"], 0x20)
        self.assertEqual(mm["c"], 0x40)

    def test_c_pct_uses_natural_c_numerator(self):
        tmp = Path(tempfile.mkdtemp())
        _make_config(tmp)
        mm = _region_metrics(tmp)
        self.assertAlmostEqual(mm["c_pct"], 0x40 / mm["c_total"])
        # Sanity: the excluded asm-C bytes would have produced a
        # strictly larger (wrong) c_pct if summed in.
        self.assertLess(mm["c_pct"], (0x40 + 0x20) / mm["c_total"])


if __name__ == "__main__":
    unittest.main()
