"""Tests for tools/generate_state_table.py.

The table is committed and drift-gated, so the properties that matter are:
`--check` genuinely fails on a stale file (a check that cannot fail is the
project's most-repeated defect class), and the band accounting excludes gap TUs
and attributes module-wide section maps correctly.

That last one is not hypothetical: a hand-rolled delinks parser that failed to
reset at module boundaries attributed the module section map to the preceding
TU and reported ~99% of the ROM as shipped C, against a true ~12%. This tool
avoids that by reusing progress.py's own parser; the fixture test below pins
the behaviour so a future refactor cannot quietly reintroduce it.
"""
from __future__ import annotations

import subprocess
import sys
import textwrap
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
TOOL = ROOT / "tools" / "generate_state_table.py"
OUT = ROOT / "docs" / "state-table.md"

sys.path.insert(0, str(ROOT / "tools"))
import generate_state_table as gst  # noqa: E402
import progress  # noqa: E402


def _run(*args: str) -> subprocess.CompletedProcess:
    return subprocess.run([sys.executable, str(TOOL), *args],
                          capture_output=True, text=True, cwd=ROOT)


class TestCommittedTableIsCurrent(unittest.TestCase):
    def test_check_passes_on_the_committed_table(self):
        r = _run("--check")
        self.assertEqual(
            r.returncode, 0,
            msg="docs/state-table.md is stale — run "
                "`python tools/generate_state_table.py` and commit.\n" + r.stderr,
        )

    def test_check_fails_on_a_stale_table(self):
        """The regression that matters: --check must actually be able to fail."""
        original = OUT.read_text(encoding="utf-8")
        try:
            OUT.write_text(original + "\nstale line\n", encoding="utf-8")
            r = _run("--check")
            self.assertEqual(r.returncode, 1)
            self.assertIn("out of date", r.stderr)
        finally:
            OUT.write_text(original, encoding="utf-8")

    def test_stdout_mode_does_not_write(self):
        before = OUT.read_text(encoding="utf-8")
        r = _run("--stdout")
        self.assertEqual(r.returncode, 0)
        self.assertIn("Project state table", r.stdout)
        self.assertEqual(OUT.read_text(encoding="utf-8"), before)


class TestBandAccounting(unittest.TestCase):
    def _fixture(self, body: str) -> Path:
        import tempfile
        d = Path(tempfile.mkdtemp())
        self.addCleanup(lambda: __import__("shutil").rmtree(d, ignore_errors=True))
        (d / "arm9").mkdir(parents=True)
        (d / "arm9" / "delinks.txt").write_text(textwrap.dedent(body).lstrip(),
                                                encoding="utf-8")
        return d

    def test_module_section_map_is_not_attributed_to_a_tu(self):
        """The 99%-vs-12% bug. The module map is 0x100000 bytes; if it were
        credited to the .c TU below it, 'shipped' would dwarf the real 0x40."""
        cfg = self._fixture("""
            .text       start:0x02000000 end:0x02100000 kind:code align:32

            src/main/func_a.c:
                .text start:0x02000000 end:0x02000040
            src/main/func_b.s:
                .text start:0x02000040 end:0x02000100
        """)
        rows, shipped, remaining = gst._band_rows(cfg)
        self.assertEqual(shipped, 0x40)
        self.assertEqual(remaining, 0xC0)

    def test_gap_tus_are_excluded_from_both_sides(self):
        cfg = self._fixture("""
            .text       start:0x02000000 end:0x02100000 kind:code align:32

            src/main/func_a.c:
                .text start:0x02000000 end:0x02000040
            _dsd_gap@main_0:
                .text start:0x02000040 end:0x02001000
        """)
        _rows, shipped, remaining = gst._band_rows(cfg)
        self.assertEqual(shipped, 0x40)
        self.assertEqual(remaining, 0, "gap TUs are filler, not candidates")

    def test_sizes_land_in_the_right_bands(self):
        cfg = self._fixture("""
            .text       start:0x02000000 end:0x02100000 kind:code align:32

            src/main/small.s:
                .text start:0x02000000 end:0x02000064
            src/main/mid.s:
                .text start:0x02001000 end:0x02001600
            src/main/huge.s:
                .text start:0x02002000 end:0x02002800
        """)
        rows, _s, _r = gst._band_rows(cfg)
        by_band = {r["band"]: r for r in rows}
        self.assertEqual(by_band["1–148"]["todo"], 1)        # 0x64  = 100 B
        self.assertEqual(by_band["1024–2047"]["todo"], 1)    # 0x600 = 1536 B
        self.assertEqual(by_band["1024–2047"]["mean_todo"], 0x600)
        # Boundary: 0x800 == 2048 is the FIRST value of the 2048+ band, not the
        # last of 1024-2047. Pinned because I got this wrong writing the test.
        self.assertEqual(by_band["2048+"]["todo"], 1)

    def test_cpp_counts_as_shipped(self):
        cfg = self._fixture("""
            .text       start:0x02000000 end:0x02100000 kind:code align:32

            src/main/thing.cpp:
                .text start:0x02000000 end:0x02000040
        """)
        _rows, shipped, remaining = gst._band_rows(cfg)
        self.assertEqual((shipped, remaining), (0x40, 0))


class TestConsistencyWithProgress(unittest.TestCase):
    def test_natural_c_figure_matches_progress_py(self):
        """The table must never disagree with the real metric."""
        cfg = ROOT / "config" / "eur"
        split = progress.c_code_bytes_by_class(cfg)
        text = gst.render()
        self.assertIn(f"{split['natural-c']:,}", text)


if __name__ == "__main__":
    unittest.main()
