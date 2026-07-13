"""Unit tests for tools/progress.py.

The CI progress-badge workflow (`.github/workflows/...`) runs
progress.py on every push to main, and the badge on the README renders
directly from its output. A parser regression here silently corrupts
the badge — these tests pin the three tiers (report.json, delinks.txt,
symbols.txt) against schema drift.
"""

from __future__ import annotations

import json
import sys
import tempfile
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from progress import (  # noqa: E402
    CODE_SECTIONS,
    DATA_SECTIONS,
    c_code_bytes,
    c_code_total_bytes,
    count_functions_in_symbols,
    count_total_functions,
    parse_delinks_file,
    summarize_delinks,
)


# --------------------------------------------------------------------------- #
# Section classifications
# --------------------------------------------------------------------------- #

class TestSectionSets(unittest.TestCase):
    """The CODE / DATA section classifier is shared with
    generate_heatmap.py's delinks fallback. If it drifts, both tools
    mis-classify the same sections in lockstep — pinning it here
    fails loudly instead."""

    def test_code_sections(self):
        self.assertEqual(CODE_SECTIONS, {".text", ".init"})

    def test_data_sections(self):
        self.assertEqual(
            DATA_SECTIONS,
            {".data", ".rodata", ".ctor", ".dtor", ".bss"},
        )

    def test_sets_disjoint(self):
        # A section should never be in both sets; if it were,
        # summarize_delinks would double-count the same bytes.
        self.assertEqual(CODE_SECTIONS & DATA_SECTIONS, set())


# --------------------------------------------------------------------------- #
# count_functions_in_symbols / count_total_functions
# --------------------------------------------------------------------------- #

class TestCountFunctionsInSymbols(unittest.TestCase):
    def _write(self, content: str) -> Path:
        with tempfile.NamedTemporaryFile("w", suffix=".txt", delete=False) as f:
            f.write(content)
            return Path(f.name)

    def test_missing_file_zero(self):
        self.assertEqual(count_functions_in_symbols(Path("/nonexistent")), 0)

    def test_counts_kind_function(self):
        p = self._write(
            "Entry kind:function(arm,size=0x13c) addr:0x02000800\n"
            "Halt kind:function(thumb,size=0x4) addr:0x02000584\n"
            "data_020b4320 kind:data(any) addr:0x020b4320\n"
        )
        try:
            self.assertEqual(count_functions_in_symbols(p), 2)
        finally:
            p.unlink(missing_ok=True)

    def test_skips_comments_and_blanks(self):
        p = self._write(
            "# comment\n"
            "\n"
            "Entry kind:function(arm,size=0x4) addr:0x02000800\n"
        )
        try:
            self.assertEqual(count_functions_in_symbols(p), 1)
        finally:
            p.unlink(missing_ok=True)


class TestCountTotalFunctions(unittest.TestCase):
    def test_walks_subtree(self):
        # Build a synthetic config tree with multiple symbols.txt files.
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            (root / "arm9").mkdir()
            (root / "arm9" / "overlays" / "ov005").mkdir(parents=True)
            (root / "arm9" / "symbols.txt").write_text(
                "Entry kind:function(arm,size=0x4) addr:0x02000800\n"
                "Halt kind:function(thumb,size=0x4) addr:0x02000584\n"
            )
            (root / "arm9" / "overlays" / "ov005" / "symbols.txt").write_text(
                "func_a kind:function(arm,size=0x4) addr:0x021aa4a0\n"
            )
            self.assertEqual(count_total_functions(root), 3)

    def test_empty_tree_zero(self):
        with tempfile.TemporaryDirectory() as tmp:
            self.assertEqual(count_total_functions(Path(tmp)), 0)


# --------------------------------------------------------------------------- #
# parse_delinks_file
# --------------------------------------------------------------------------- #

class TestParseDelinksFile(unittest.TestCase):
    """The parser must distinguish module-level sections (authoritative
    totals at the top of the file) from TU-level sections (per-
    translation-unit, only `complete` ones count as matched)."""

    def _write(self, content: str) -> Path:
        with tempfile.NamedTemporaryFile("w", suffix=".txt", delete=False) as f:
            f.write(content)
            return Path(f.name)

    def test_missing_file_empty(self):
        sections, tus = parse_delinks_file(Path("/nonexistent"))
        self.assertEqual(sections, [])
        self.assertEqual(tus, [])

    def test_module_sections_only(self):
        p = self._write(
            "    .text       start:0x021aa4a0 end:0x021b1568 kind:code\n"
            "    .rodata     start:0x021b1568 end:0x021b16e4 kind:rodata\n"
        )
        try:
            sections, tus = parse_delinks_file(p)
            self.assertEqual(len(sections), 2)
            self.assertEqual(sections[0], (".text", 0x021aa4a0, 0x021b1568))
            self.assertEqual(sections[1], (".rodata", 0x021b1568, 0x021b16e4))
            self.assertEqual(tus, [])
        finally:
            p.unlink(missing_ok=True)

    def test_tu_with_complete_status(self):
        p = self._write(
            "    .text       start:0x021aa4a0 end:0x021b1568 kind:code\n"
            "\n"
            "src/overlay005/foo.c:\n"
            "    complete\n"
            "    .text start:0x021aa4a0 end:0x021aa4ac\n"
        )
        try:
            sections, tus = parse_delinks_file(p)
            self.assertEqual(len(tus), 1)
            tu = tus[0]
            self.assertEqual(tu["source"], "src/overlay005/foo.c")
            self.assertEqual(tu["status"], "complete")
            self.assertEqual(tu["sections"],
                             [(".text", 0x021aa4a0, 0x021aa4ac)])
        finally:
            p.unlink(missing_ok=True)

    def test_tu_without_status(self):
        # A gap TU — no `complete` marker, counts as uncarved.
        p = self._write(
            "_dsd_gap@ov005_0:\n"
            "    .text start:0x021aa4a0 end:0x021b1568\n"
        )
        try:
            _sections, tus = parse_delinks_file(p)
            self.assertEqual(len(tus), 1)
            self.assertEqual(tus[0]["status"], None)
            self.assertTrue(tus[0]["source"].startswith("_dsd_gap"))
        finally:
            p.unlink(missing_ok=True)

    def test_multiple_tus_boundary(self):
        p = self._write(
            "src/a.c:\n"
            "    complete\n"
            "    .text start:0x100 end:0x200\n"
            "\n"
            "src/b.c:\n"
            "    complete\n"
            "    .text start:0x200 end:0x300\n"
        )
        try:
            _sections, tus = parse_delinks_file(p)
            self.assertEqual(len(tus), 2)
            self.assertEqual(tus[0]["source"], "src/a.c")
            self.assertEqual(tus[1]["source"], "src/b.c")
        finally:
            p.unlink(missing_ok=True)

    def test_tu_multiple_sections(self):
        p = self._write(
            "src/foo.c:\n"
            "    complete\n"
            "    .text start:0x100 end:0x200\n"
            "    .rodata start:0x300 end:0x400\n"
            "    .bss start:0x500 end:0x600\n"
        )
        try:
            _sections, tus = parse_delinks_file(p)
            self.assertEqual(len(tus), 1)
            self.assertEqual(len(tus[0]["sections"]), 3)
        finally:
            p.unlink(missing_ok=True)

    def test_comments_and_blanks_skipped(self):
        p = self._write(
            "# comment\n"
            "    .text       start:0x100 end:0x200 kind:code\n"
            "\n"
            "# another comment\n"
            "src/foo.c:\n"
            "    complete\n"
            "    .text start:0x100 end:0x200\n"
        )
        try:
            sections, tus = parse_delinks_file(p)
            self.assertEqual(len(sections), 1)
            self.assertEqual(len(tus), 1)
        finally:
            p.unlink(missing_ok=True)

    def test_malformed_section_skipped(self):
        # A .text line missing start/end shouldn't blow up parsing.
        p = self._write(
            "    .text start:0x100 kind:code\n"
            "    .rodata start:0x200 end:0x300 kind:rodata\n"
        )
        try:
            sections, _tus = parse_delinks_file(p)
            # Only the fully-formed .rodata line survives.
            self.assertEqual(len(sections), 1)
            self.assertEqual(sections[0][0], ".rodata")
        finally:
            p.unlink(missing_ok=True)


# --------------------------------------------------------------------------- #
# summarize_delinks
# --------------------------------------------------------------------------- #

class TestSummarizeDelinks(unittest.TestCase):
    def _make_config(self, delinks_content: str) -> Path:
        """Build a minimal config/<ver>/arm9/delinks.txt tree."""
        tmp = tempfile.mkdtemp()
        arm9 = Path(tmp) / "arm9"
        arm9.mkdir()
        (arm9 / "delinks.txt").write_text(delinks_content)
        return Path(tmp)

    def test_no_delinks_returns_none(self):
        with tempfile.TemporaryDirectory() as tmp:
            self.assertIsNone(summarize_delinks(Path(tmp)))

    def test_module_totals_from_section_map(self):
        root = self._make_config(
            "    .text       start:0x0 end:0x100 kind:code\n"
            "    .rodata     start:0x100 end:0x180 kind:rodata\n"
            "    .data       start:0x180 end:0x200 kind:data\n"
        )
        report = summarize_delinks(root)
        self.assertIsNotNone(report)
        m = report["measures"]
        # str-coded to survive JS safe-int range downstream.
        self.assertEqual(m["total_code"], str(0x100))
        self.assertEqual(m["total_data"], str(0x80 + 0x80))  # rodata + data
        self.assertEqual(m["matched_code"], "0")
        self.assertEqual(m["matched_data"], "0")

    def test_complete_tu_matched(self):
        root = self._make_config(
            "    .text       start:0x0 end:0x100 kind:code\n"
            "\n"
            "src/foo.c:\n"
            "    complete\n"
            "    .text start:0x0 end:0x40\n"
        )
        report = summarize_delinks(root)
        m = report["measures"]
        self.assertEqual(m["matched_code"], str(0x40))
        self.assertEqual(m["complete_units"], 1)

    def test_gap_tu_not_matched(self):
        # _dsd_gap@ TUs never count as matched even if something
        # stamped them 'complete'. (The parser only recognises
        # 'complete' on non-gap names per summarize_delinks's rules.)
        root = self._make_config(
            "    .text       start:0x0 end:0x100 kind:code\n"
            "\n"
            "_dsd_gap@ov005_0:\n"
            "    complete\n"  # still counted as gap — must not match
            "    .text start:0x0 end:0x100\n"
        )
        report = summarize_delinks(root)
        m = report["measures"]
        self.assertEqual(m["matched_code"], "0")

    def test_total_units_counts_both_kinds(self):
        # total_units = complete TUs + gap TUs.
        root = self._make_config(
            "    .text       start:0x0 end:0x100 kind:code\n"
            "\n"
            "src/foo.c:\n"
            "    complete\n"
            "    .text start:0x0 end:0x40\n"
            "\n"
            "_dsd_gap@ov005_0:\n"
            "    .text start:0x40 end:0x100\n"
        )
        report = summarize_delinks(root)
        m = report["measures"]
        self.assertEqual(m["total_units"], 2)
        self.assertEqual(m["complete_units"], 1)

    def test_source_stamp_present(self):
        # Downstream tools can tell 'which tier was used' from this.
        root = self._make_config(
            "    .text       start:0x0 end:0x100 kind:code\n"
        )
        report = summarize_delinks(root)
        self.assertEqual(report.get("source"), "delinks")


# --------------------------------------------------------------------------- #
# Round-trip: report shape is JSON-compatible
# --------------------------------------------------------------------------- #

class TestCCodeBytes(unittest.TestCase):
    """The true "readable C" metric (brief 561, improvement-swarm r3
    REFRAME): unlike matched_code/complete_units above, this must NOT
    count a `.s` ship — only bytes from a `.c`/`.cpp`-sourced TU."""

    def _make_config(self, delinks_content: str) -> Path:
        tmp = tempfile.mkdtemp()
        arm9 = Path(tmp) / "arm9"
        arm9.mkdir()
        (arm9 / "delinks.txt").write_text(delinks_content)
        return Path(tmp)

    def test_no_delinks_zero(self):
        with tempfile.TemporaryDirectory() as tmp:
            self.assertEqual(c_code_bytes(Path(tmp)), 0)

    def test_c_tu_counted(self):
        root = self._make_config(
            "    .text       start:0x0 end:0x100 kind:code\n"
            "\n"
            "src/foo.c:\n"
            "    complete\n"
            "    .text start:0x0 end:0x40\n"
        )
        self.assertEqual(c_code_bytes(root), 0x40)

    def test_cpp_tu_counted(self):
        root = self._make_config(
            "    .text       start:0x0 end:0x100 kind:code\n"
            "\n"
            "src/foo.cpp:\n"
            "    complete\n"
            "    .text start:0x0 end:0x40\n"
        )
        self.assertEqual(c_code_bytes(root), 0x40)

    def test_s_tu_not_counted(self):
        # The exact case the metric exists to fix: a byte-identical .s
        # ship is real progress toward `matched_code`, but NOT toward
        # "readable C" — it must contribute 0 here even though it's
        # `complete` and would count fully in summarize_delinks().
        root = self._make_config(
            "    .text       start:0x0 end:0x100 kind:code\n"
            "\n"
            "src/foo.s:\n"
            "    complete\n"
            "    .text start:0x0 end:0x40\n"
        )
        self.assertEqual(c_code_bytes(root), 0)

    def test_mixed_c_and_s_only_c_summed(self):
        root = self._make_config(
            "    .text       start:0x0 end:0x100 kind:code\n"
            "\n"
            "src/foo.c:\n"
            "    complete\n"
            "    .text start:0x0 end:0x40\n"
            "\n"
            "src/bar.s:\n"
            "    complete\n"
            "    .text start:0x40 end:0x100\n"
        )
        self.assertEqual(c_code_bytes(root), 0x40)   # only foo.c's range

    def test_libs_prefix_counted(self):
        # c_code_bytes matches both src/... and libs/... TU headers (SDK
        # code lives under libs/), same as the module-map scan elsewhere.
        root = self._make_config(
            "    .text       start:0x0 end:0x100 kind:code\n"
            "\n"
            "libs/nitro/foo.c:\n"
            "    complete\n"
            "    .text start:0x0 end:0x20\n"
        )
        self.assertEqual(c_code_bytes(root), 0x20)

    def test_incomplete_c_tu_still_counted(self):
        # c_code_bytes's DEFAULT is a pure "which file was this TU
        # carved from" source-scan -- it does NOT gate on `complete`
        # status the way summarize_delinks's matched_code does. An
        # incomplete .c draft is still real C on disk (arguably
        # readable, just not yet byte-verified) -- counting it is the
        # documented behaviour inherited unchanged from
        # generate_progress_bars.c_code_bytes. Pass
        # require_complete=True for the stricter view (see
        # test_require_complete_excludes_incomplete below).
        root = self._make_config(
            "    .text       start:0x0 end:0x100 kind:code\n"
            "\n"
            "src/foo.c:\n"
            "    .text start:0x0 end:0x40\n"
        )
        self.assertEqual(c_code_bytes(root), 0x40)

    def test_require_complete_excludes_incomplete(self):
        # brief 566 / improvement-swarm r4 A3: the "no complete gate"
        # variant -- require_complete=True gates out .c/.cpp TUs
        # without status=='complete', the same status
        # summarize_delinks's matched_code requires. An incomplete TU
        # contributes 0 under this stricter view even though it still
        # counts under the default (see test above).
        root = self._make_config(
            "    .text       start:0x0 end:0x100 kind:code\n"
            "\n"
            "src/foo.c:\n"
            "    .text start:0x0 end:0x40\n"
        )
        self.assertEqual(c_code_bytes(root, require_complete=True), 0)

    def test_require_complete_still_counts_complete(self):
        root = self._make_config(
            "    .text       start:0x0 end:0x100 kind:code\n"
            "\n"
            "src/foo.c:\n"
            "    complete\n"
            "    .text start:0x0 end:0x40\n"
        )
        self.assertEqual(c_code_bytes(root, require_complete=True), 0x40)

    def test_walks_subtree(self):
        tmp = tempfile.mkdtemp()
        for sub, content in (
            ("arm9", "src/foo.c:\n    complete\n    .text start:0x0 end:0x10\n"),
            ("arm9/overlays/ov002",
             "src/overlay002/bar.c:\n    complete\n    .text start:0x0 end:0x20\n"),
        ):
            d = Path(tmp) / sub
            d.mkdir(parents=True)
            (d / "delinks.txt").write_text(content)
        self.assertEqual(c_code_bytes(Path(tmp)), 0x10 + 0x20)

    def test_gap_tu_after_c_tu_not_leaked(self):
        # brief 566 / improvement-swarm r4 A3: regression test for the
        # "ext-leak across _dsd_gap" bug in the old regex-based scan.
        # The old implementation tracked "current TU's source
        # extension" as a variable that persisted across TU
        # boundaries; a `_dsd_gap@...` header never matched the
        # src/libs regex, so it never reset that variable -- a gap
        # TU's .text bytes immediately following a .c/.cpp TU got
        # silently misattributed to C. parse_delinks_file scopes
        # `source` per-TU, eliminating this by construction: only
        # foo.c's own 0x40 bytes should count, never the gap's 0xc0.
        root = self._make_config(
            "    .text       start:0x0 end:0x100 kind:code\n"
            "\n"
            "src/foo.c:\n"
            "    complete\n"
            "    .text start:0x0 end:0x40\n"
            "\n"
            "_dsd_gap@mod_1:\n"
            "    .text start:0x40 end:0x100\n"
        )
        self.assertEqual(c_code_bytes(root), 0x40)

    def test_gap_tu_between_two_c_tus_not_leaked(self):
        # Same bug, sandwiched: a gap TU between two real .c TUs must
        # not pick up either neighbour's extension.
        root = self._make_config(
            "    .text       start:0x0 end:0x180 kind:code\n"
            "\n"
            "src/a.c:\n"
            "    complete\n"
            "    .text start:0x0 end:0x40\n"
            "\n"
            "_dsd_gap@mod_1:\n"
            "    .text start:0x40 end:0x100\n"
            "\n"
            "src/b.c:\n"
            "    complete\n"
            "    .text start:0x100 end:0x180\n"
        )
        self.assertEqual(c_code_bytes(root), 0x40 + 0x80)  # a.c + b.c only


class TestCCodeTotalBytes(unittest.TestCase):
    """c_code_bytes()'s correct denominator (brief 566 / improvement-
    swarm r4 A3): `.text`-only from the module-level section map,
    NOT `.text` + `.init` like summarize_delinks's total_code. Pairing
    the .text-only numerator against a .text+.init denominator
    structurally caps the ratio below 100% even at full decomp --
    these tests pin the .init-exclusion specifically."""

    def _make_config(self, delinks_content: str) -> Path:
        tmp = tempfile.mkdtemp()
        arm9 = Path(tmp) / "arm9"
        arm9.mkdir()
        (arm9 / "delinks.txt").write_text(delinks_content)
        return Path(tmp)

    def test_no_delinks_zero(self):
        with tempfile.TemporaryDirectory() as tmp:
            self.assertEqual(c_code_total_bytes(Path(tmp)), 0)

    def test_text_only_counted(self):
        root = self._make_config(
            "    .text       start:0x0 end:0x100 kind:code\n"
            "    .rodata     start:0x100 end:0x180 kind:rodata\n"
        )
        self.assertEqual(c_code_total_bytes(root), 0x100)

    def test_init_excluded(self):
        # The acute bug this function fixes: total_code (summarize_delinks)
        # sums .text + .init (CODE_SECTIONS), but c_code_bytes' numerator
        # never counts .init even when it's owned by a .c TU -- so this
        # denominator must be .text ONLY, dropping .init entirely.
        root = self._make_config(
            "    .text       start:0x0 end:0x100 kind:code\n"
            "    .init       start:0x100 end:0x140 kind:code\n"
        )
        self.assertEqual(c_code_total_bytes(root), 0x100)  # .init's 0x40 dropped

    def test_ignores_tu_level_sections(self):
        # Only the MODULE-level section map counts (matching total_code's
        # own source) -- TU-level .text ranges (per-function, a subset
        # of the module total) must not be double-counted on top.
        root = self._make_config(
            "    .text       start:0x0 end:0x100 kind:code\n"
            "\n"
            "src/foo.c:\n"
            "    complete\n"
            "    .text start:0x0 end:0x40\n"
        )
        self.assertEqual(c_code_total_bytes(root), 0x100)

    def test_walks_subtree(self):
        tmp = tempfile.mkdtemp()
        for sub, content in (
            ("arm9", "    .text start:0x0 end:0x100 kind:code\n"),
            ("arm9/overlays/ov002", "    .text start:0x0 end:0x80 kind:code\n"),
        ):
            d = Path(tmp) / sub
            d.mkdir(parents=True)
            (d / "delinks.txt").write_text(content)
        self.assertEqual(c_code_total_bytes(Path(tmp)), 0x100 + 0x80)


class TestReportJsonRoundtrip(unittest.TestCase):
    def test_summarize_delinks_output_is_json_serialisable(self):
        # CI pipes summarize_delinks output into update_progress_badge.py
        # via json.dumps — the dict must survive the round-trip without
        # hitting non-serialisable fields (e.g. set, Path, bytes).
        with tempfile.TemporaryDirectory() as tmp:
            (Path(tmp) / "arm9").mkdir()
            (Path(tmp) / "arm9" / "delinks.txt").write_text(
                "    .text start:0x0 end:0x100 kind:code\n"
            )
            report = summarize_delinks(Path(tmp))
            # json.dumps will raise if anything's non-serialisable.
            s = json.dumps(report)
            self.assertIn("source", json.loads(s))


if __name__ == "__main__":
    unittest.main()
