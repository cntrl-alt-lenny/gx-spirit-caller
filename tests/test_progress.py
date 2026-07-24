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
    ASYMPTOTIC_HEADROOM_FRACTIONS,
    ASYMPTOTIC_MODULES,
    CODE_SECTIONS,
    DATA_SECTIONS,
    FINISHABLE_HEADROOM_FRACTION,
    _discover_module_delinks,
    classify_c_source,
    c_code_bytes,
    c_code_bytes_by_class,
    c_code_total_bytes,
    canary_reconciliation,
    count_functions_in_symbols,
    count_total_functions,
    done_class,
    parse_delinks_file,
    summarize_by_module,
    summarize_delinks,
    three_region_module_gaps,
    tractable_ceiling_bytes,
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

    def test_classifies_natural_c(self):
        self.assertEqual(classify_c_source("void f(void) { return; }"), "natural-c")

    def test_classifies_asm_c(self):
        self.assertEqual(classify_c_source("asm void f(void) { nop; }"), "asm-c")
        self.assertEqual(classify_c_source("void f(void) { asm { nop; } }"), "asm-c")

    def test_comment_mention_does_not_classify_as_asm(self):
        self.assertEqual(
            classify_c_source("/* asm void fake(void) */ void f(void) { return; }"),
            "natural-c",
        )

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
        self.assertEqual(sum(c_code_bytes_by_class(root).values()), 0x40)

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


class TestDiscoverModuleDelinks(unittest.TestCase):
    """[(module_name, delinks_path)] in main/itcm/dtcm/ovNNN order."""

    def test_empty_config_dir(self):
        with tempfile.TemporaryDirectory() as tmp:
            self.assertEqual(_discover_module_delinks(Path(tmp)), [])

    def test_main_only(self):
        tmp = tempfile.mkdtemp()
        arm9 = Path(tmp) / "arm9"
        arm9.mkdir()
        (arm9 / "delinks.txt").write_text("    .text start:0x0 end:0x10 kind:code\n")
        found = _discover_module_delinks(Path(tmp))
        self.assertEqual([name for name, _ in found], ["main"])

    def test_itcm_dtcm_and_overlays_discovered_in_order(self):
        tmp = tempfile.mkdtemp()
        for sub in ("arm9", "arm9/itcm", "arm9/dtcm",
                    "arm9/overlays/ov002", "arm9/overlays/ov000"):
            d = Path(tmp) / sub
            d.mkdir(parents=True)
            (d / "delinks.txt").write_text("    .text start:0x0 end:0x10 kind:code\n")
        found = _discover_module_delinks(Path(tmp))
        self.assertEqual(
            [name for name, _ in found],
            ["main", "itcm", "dtcm", "ov000", "ov002"],  # overlays sorted
        )

    def test_missing_delinks_txt_skipped(self):
        # A module directory that exists but has no delinks.txt yet
        # (e.g. dtcm with only symbols.txt) must not be reported.
        tmp = tempfile.mkdtemp()
        arm9 = Path(tmp) / "arm9"
        (arm9 / "dtcm").mkdir(parents=True)
        (arm9 / "dtcm" / "symbols.txt").write_text("")   # no delinks.txt
        self.assertEqual(_discover_module_delinks(Path(tmp)), [])

    def test_non_ov_prefixed_overlay_dirs_ignored(self):
        tmp = tempfile.mkdtemp()
        junk = Path(tmp) / "arm9" / "overlays" / "not_an_overlay"
        junk.mkdir(parents=True)
        (junk / "delinks.txt").write_text("    .text start:0x0 end:0x10 kind:code\n")
        self.assertEqual(_discover_module_delinks(Path(tmp)), [])


class TestSummarizeByModule(unittest.TestCase):
    """Per-module code%/C% breakdown (brief 587 / improvement-swarm r5:
    no tool previously reported C% per module at all)."""

    def _make_multi_module_config(self) -> Path:
        tmp = tempfile.mkdtemp()
        root = Path(tmp)
        (root / "arm9").mkdir()
        (root / "arm9" / "delinks.txt").write_text(
            "    .text       start:0x0 end:0x100 kind:code\n"
            "\n"
            "src/main/func_a.c:\n"
            "    complete\n"
            "    .text start:0x0 end:0x40\n"
            "\n"
            "src/main/func_b.s:\n"
            "    complete\n"
            "    .text start:0x40 end:0x80\n"
        )
        ov002 = root / "arm9" / "overlays" / "ov002"
        ov002.mkdir(parents=True)
        (ov002 / "delinks.txt").write_text(
            "    .text       start:0x0 end:0x80 kind:code\n"
            "\n"
            "src/overlay002/func_c.c:\n"
            "    complete\n"
            "    .text start:0x0 end:0x20\n"
        )
        return root

    def test_empty_config_dir_returns_empty_list(self):
        with tempfile.TemporaryDirectory() as tmp:
            self.assertEqual(summarize_by_module(Path(tmp)), [])

    def test_per_module_rows_in_discovery_order(self):
        root = self._make_multi_module_config()
        rows = summarize_by_module(root)
        self.assertEqual([r["module"] for r in rows], ["main", "ov002"])

    def test_main_module_code_and_c_bytes(self):
        # main: matched_code = func_a (.c, 0x40) + func_b (.s, 0x40) = 0x80
        # (code% counts BOTH .c and .s ships identically -- the whole
        # point of the separate C% column). c_bytes counts ONLY the .c
        # TU: 0x40.
        root = self._make_multi_module_config()
        rows = {r["module"]: r for r in summarize_by_module(root)}
        main = rows["main"]
        self.assertEqual(main["total_code"], 0x100)
        self.assertEqual(main["matched_code"], 0x80)
        self.assertEqual(main["c_total"], 0x100)
        self.assertEqual(main["c_bytes"], 0x40)   # only func_a.c, not func_b.s

    def test_ov002_module_code_and_c_bytes(self):
        root = self._make_multi_module_config()
        rows = {r["module"]: r for r in summarize_by_module(root)}
        ov002 = rows["ov002"]
        self.assertEqual(ov002["total_code"], 0x80)
        self.assertEqual(ov002["matched_code"], 0x20)
        self.assertEqual(ov002["c_total"], 0x80)
        self.assertEqual(ov002["c_bytes"], 0x20)

    def test_gap_tu_never_counts_as_matched_or_c(self):
        tmp = tempfile.mkdtemp()
        root = Path(tmp)
        (root / "arm9").mkdir()
        (root / "arm9" / "delinks.txt").write_text(
            "    .text       start:0x0 end:0x100 kind:code\n"
            "\n"
            "_dsd_gap@main_0:\n"
            "    complete\n"   # still a gap even if stamped complete
            "    .text start:0x0 end:0x100\n"
        )
        rows = summarize_by_module(root)
        self.assertEqual(rows[0]["matched_code"], 0)
        self.assertEqual(rows[0]["c_bytes"], 0)

    def test_cpp_source_counts_toward_c_bytes(self):
        tmp = tempfile.mkdtemp()
        root = Path(tmp)
        (root / "arm9").mkdir()
        (root / "arm9" / "delinks.txt").write_text(
            "    .text       start:0x0 end:0x40 kind:code\n"
            "\n"
            "src/main/func_a.cpp:\n"
            "    complete\n"
            "    .text start:0x0 end:0x40\n"
        )
        rows = summarize_by_module(root)
        self.assertEqual(rows[0]["c_bytes"], 0x40)

    def test_init_counts_toward_code_but_not_c(self):
        # CODE_SECTIONS (.text + .init) feeds matched_code/total_code;
        # C%'s .text-only convention (brief 566 / r4 A3) must exclude
        # .init even when a .c TU owns it.
        tmp = tempfile.mkdtemp()
        root = Path(tmp)
        (root / "arm9").mkdir()
        (root / "arm9" / "delinks.txt").write_text(
            "    .text       start:0x0 end:0x40 kind:code\n"
            "    .init       start:0x40 end:0x60 kind:code\n"
            "\n"
            "src/main/func_a.c:\n"
            "    complete\n"
            "    .init start:0x40 end:0x60\n"
        )
        rows = summarize_by_module(root)
        self.assertEqual(rows[0]["total_code"], 0x60)   # .text + .init
        self.assertEqual(rows[0]["matched_code"], 0x20)  # the .init TU
        self.assertEqual(rows[0]["c_total"], 0x40)       # .text ONLY
        self.assertEqual(rows[0]["c_bytes"], 0)          # .init excluded from C%

    def test_incomplete_tu_not_counted(self):
        tmp = tempfile.mkdtemp()
        root = Path(tmp)
        (root / "arm9").mkdir()
        (root / "arm9" / "delinks.txt").write_text(
            "    .text       start:0x0 end:0x40 kind:code\n"
            "\n"
            "src/main/func_a.c:\n"
            "    .text start:0x0 end:0x40\n"   # no `complete` stamp
        )
        rows = summarize_by_module(root)
        self.assertEqual(rows[0]["matched_code"], 0)
        self.assertEqual(rows[0]["c_bytes"], 0)

    def test_sum_across_modules_matches_summarize_delinks_region_total(self):
        """Self-consistency: summing this function's per-module rows
        must equal summarize_delinks()'s region-wide totals exactly --
        both read the same underlying parse_delinks_file data, just
        grouped differently."""
        root = self._make_multi_module_config()
        rows = summarize_by_module(root)
        sum_matched = sum(r["matched_code"] for r in rows)
        sum_total = sum(r["total_code"] for r in rows)

        region = summarize_delinks(root)
        self.assertEqual(sum_matched, int(region["measures"]["matched_code"]))
        self.assertEqual(sum_total, int(region["measures"]["total_code"]))

        sum_c = sum(r["c_bytes"] for r in rows)
        sum_ctotal = sum(r["c_total"] for r in rows)
        self.assertEqual(sum_c, c_code_bytes(root))
        self.assertEqual(sum_ctotal, c_code_total_bytes(root))


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


class TestDoneClass(unittest.TestCase):
    """r7-15's module-tier classification (brief 615)."""

    def test_asymptotic_modules(self):
        self.assertEqual(done_class("main"), "asymptotic")
        self.assertEqual(done_class("ov002"), "asymptotic")

    def test_other_modules_are_finishable(self):
        for module in ("ov000", "ov004", "itcm", "dtcm", "ov023"):
            self.assertEqual(done_class(module), "finishable")

    def test_asymptotic_modules_set_is_exactly_main_and_ov002(self):
        # Pins the hard-coded set itself, not just done_class()'s
        # membership test -- a future edit that widens/narrows the set
        # without updating this test (and its brief-615 doc citation)
        # should fail loudly.
        self.assertEqual(ASYMPTOTIC_MODULES, frozenset({"main", "ov002"}))


class TestTractableCeilingBytes(unittest.TestCase):
    """The tiered, wall-enriched ceiling estimate (brief 615 / r7-14)."""

    def test_zero_c_total_returns_zero(self):
        # dtcm-shaped: no .text bytes at all in any region.
        self.assertEqual(tractable_ceiling_bytes("dtcm", 0, 0), 0)

    def test_asymptotic_module_uses_asymptotic_headroom(self):
        # main: c_bytes=100, c_total=1000 -> remaining=900,
        # ceiling = 100 + round(0.75 * 900) = 100 + 675 = 775.
        ceiling = tractable_ceiling_bytes("main", 100, 1000)
        self.assertEqual(ceiling, 100 + round(ASYMPTOTIC_HEADROOM_FRACTIONS["main"] * 900))
        self.assertEqual(ceiling, 775)

    def test_ov002_module_uses_asymptotic_headroom(self):
        # ASYMPTOTIC_MODULES membership, not a name-prefix check --
        # confirms ov002 specifically routes through the same branch
        # as main, not e.g. any module starting with "ov".
        ceiling = tractable_ceiling_bytes("ov002", 100, 1000)
        self.assertEqual(ceiling, 100 + round(ASYMPTOTIC_HEADROOM_FRACTIONS["ov002"] * 900))

    def test_asymptotic_rates_are_per_module(self):
        self.assertEqual(ASYMPTOTIC_HEADROOM_FRACTIONS, {"main": 0.75, "ov002": 0.10})

    def test_finishable_module_uses_finishable_headroom(self):
        # ov004: c_bytes=100, c_total=1000 -> remaining=900,
        # ceiling = 100 + round(0.75 * 900) = 100 + 675 = 775.
        ceiling = tractable_ceiling_bytes("ov004", 100, 1000)
        self.assertEqual(ceiling, 100 + round(FINISHABLE_HEADROOM_FRACTION * 900))
        self.assertEqual(ceiling, 775)

    def test_ceiling_never_below_c_bytes(self):
        # Invariant: attainment = c_bytes / ceiling can never read above
        # 100%, for either tier, at any c_bytes/c_total split.
        for module in ("main", "ov002", "ov004", "itcm"):
            for c_bytes, c_total in ((0, 1000), (500, 1000), (1000, 1000), (999, 1000)):
                with self.subTest(module=module, c_bytes=c_bytes, c_total=c_total):
                    self.assertGreaterEqual(
                        tractable_ceiling_bytes(module, c_bytes, c_total), c_bytes)

    def test_ceiling_never_exceeds_c_total(self):
        for module in ("main", "ov002", "ov004", "itcm"):
            for c_bytes, c_total in ((0, 1000), (500, 1000), (1000, 1000)):
                with self.subTest(module=module, c_bytes=c_bytes, c_total=c_total):
                    self.assertLessEqual(
                        tractable_ceiling_bytes(module, c_bytes, c_total), c_total)

    def test_fully_converted_module_ceiling_equals_c_total(self):
        # c_bytes == c_total (already 100% C) -> zero remaining headroom
        # regardless of tier -> ceiling == c_total exactly.
        self.assertEqual(tractable_ceiling_bytes("main", 1000, 1000), 1000)
        self.assertEqual(tractable_ceiling_bytes("ov004", 1000, 1000), 1000)

    def test_finishable_ceiling_strictly_above_asymptotic_for_same_input(self):
        # The whole point of the two-tier split: identical current/total
        # bytes must NOT produce the same ceiling as the conservative
        # asymptotic policy dial.
        asymptotic = tractable_ceiling_bytes("ov002", 100, 1000)
        finishable = tractable_ceiling_bytes("ov004", 100, 1000)
        self.assertLess(asymptotic, finishable)


class TestSummarizeByModuleHonestMetricColumns(unittest.TestCase):
    """summarize_by_module()'s three brief-615 additions, on top of the
    same fixture shape TestSummarizeByModule already exercises."""

    def _make_config(self, c_bytes: int, c_total: int, module_dir: str = "arm9") -> Path:
        tmp = tempfile.mkdtemp()
        root = Path(tmp)
        (root / module_dir).mkdir(parents=True)
        lines = [f"    .text       start:0x0 end:0x{c_total:x} kind:code\n", "\n"]
        if c_bytes:
            lines += [
                "src/main/func_a.c:\n",
                "    complete\n",
                f"    .text start:0x0 end:0x{c_bytes:x}\n",
            ]
        (root / module_dir / "delinks.txt").write_text("".join(lines))
        return root

    def test_new_fields_present(self):
        root = self._make_config(c_bytes=0x40, c_total=0x100)
        row = summarize_by_module(root)[0]
        self.assertIn("tractable_ceiling", row)
        self.assertIn("attainment", row)
        self.assertIn("done_class", row)

    def test_main_module_is_asymptotic_with_matching_ceiling(self):
        root = self._make_config(c_bytes=0x40, c_total=0x100)  # 64/256
        row = summarize_by_module(root)[0]
        self.assertEqual(row["module"], "main")
        self.assertEqual(row["done_class"], "asymptotic")
        expected_ceiling = tractable_ceiling_bytes("main", 0x40, 0x100)
        self.assertEqual(row["tractable_ceiling"], expected_ceiling)
        self.assertAlmostEqual(row["attainment"], 0x40 / expected_ceiling)

    def test_attainment_is_none_when_c_total_zero(self):
        # dtcm-shaped: a module dir with a delinks.txt carrying no
        # .text section at all (module_sections stays empty -> c_total
        # 0) must not raise ZeroDivisionError.
        tmp = tempfile.mkdtemp()
        root = Path(tmp)
        (root / "arm9" / "dtcm").mkdir(parents=True)
        (root / "arm9" / "dtcm" / "delinks.txt").write_text("")
        rows = summarize_by_module(root)
        self.assertEqual(len(rows), 1)
        self.assertEqual(rows[0]["tractable_ceiling"], 0)
        self.assertIsNone(rows[0]["attainment"])

    def test_ov002_overlay_is_asymptotic(self):
        tmp = tempfile.mkdtemp()
        root = Path(tmp)
        ov002 = root / "arm9" / "overlays" / "ov002"
        ov002.mkdir(parents=True)
        (ov002 / "delinks.txt").write_text(
            "    .text       start:0x0 end:0x80 kind:code\n"
            "\n"
            "src/overlay002/func_c.c:\n"
            "    complete\n"
            "    .text start:0x0 end:0x20\n"
        )
        row = summarize_by_module(root)[0]
        self.assertEqual(row["module"], "ov002")
        self.assertEqual(row["done_class"], "asymptotic")

    def test_ov004_overlay_is_finishable(self):
        tmp = tempfile.mkdtemp()
        root = Path(tmp)
        ov004 = root / "arm9" / "overlays" / "ov004"
        ov004.mkdir(parents=True)
        (ov004 / "delinks.txt").write_text(
            "    .text       start:0x0 end:0x80 kind:code\n"
        )
        row = summarize_by_module(root)[0]
        self.assertEqual(row["module"], "ov004")
        self.assertEqual(row["done_class"], "finishable")


class TestCanaryReconciliation(unittest.TestCase):
    """The mandatory ov004=36.2%-of-3-region-gap reconciliation (brief
    615/583). canary_reconciliation() is pure -- these pin the
    tolerance-check MATH on fixture gap dicts, independent of the live
    (and constantly drifting) repo tree; the live check itself is
    exercised separately (not pinned, since it's expected to drift) via
    `python tools/progress.py --canary`."""

    def test_exact_ledger_snapshot_reconciles(self):
        # The endgame-ledger.md 2026-07-16 snapshot's own numbers,
        # verbatim (ov004 20,110 of 55,540 total = 36.2...%).
        gaps = {"ov004": 20110, "main": 11474, "itcm": 6252, "ov019": 3000,
                "ov014": 2712, "ov003": 2704, "ov001": 1356, "ov006": 968,
                "ov020": 952, "ov015": 748, "ov010": 736, "ov018": 696,
                "ov002": 608, "ov017": 568, "ov005": 448, "ov016": 440,
                "ov007": 440, "ov022": 320, "ov009": 272, "ov008": 216,
                "ov023": 200, "ov021": 176, "ov011": 104, "ov013": 40}
        self.assertEqual(sum(gaps.values()), 55540)
        result = canary_reconciliation(gaps)
        self.assertTrue(result["ok"])
        self.assertAlmostEqual(result["actual_pct"], 36.2, places=1)

    def test_mismatch_outside_tolerance_flagged_not_silently_passed(self):
        # ov004 at half its ledger share -- a real regression shape
        # (e.g. a section-set or gap-tu-exclusion bug half-counting it).
        gaps = {"ov004": 10000, "everything_else": 45540}
        result = canary_reconciliation(gaps)
        self.assertFalse(result["ok"])
        self.assertLess(result["actual_pct"], 36.2 - result["tolerance_pct"])

    def test_missing_module_is_zero_gap_not_a_crash(self):
        gaps = {"main": 100, "ov004": 0}
        result = canary_reconciliation(gaps, module="nonexistent_module")
        self.assertEqual(result["module_gap"], 0)
        self.assertFalse(result["ok"])

    def test_empty_gaps_no_zero_division(self):
        result = canary_reconciliation({})
        self.assertEqual(result["actual_pct"], 0.0)
        self.assertFalse(result["ok"])

    def test_tolerance_is_a_hard_boundary(self):
        # 36.2% target, default 1.0pp tolerance -> 37.2% must pass,
        # 37.21% must not (delta computed on the RAW float, not rounded
        # display text).
        total = 1000000
        just_inside = round(total * 0.372)
        just_outside = round(total * 0.3721)
        ok_result = canary_reconciliation({"ov004": just_inside, "rest": total - just_inside})
        bad_result = canary_reconciliation({"ov004": just_outside, "rest": total - just_outside})
        self.assertTrue(ok_result["ok"])
        self.assertFalse(bad_result["ok"])


class TestThreeRegionModuleGaps(unittest.TestCase):
    """three_region_module_gaps() sums summarize_by_module()'s per-module
    gap across eur/usa/jpn config dirs -- the live-data half of the
    CANARY check (canary_reconciliation covers the pure-math half)."""

    def _write_region(self, root: Path, region: str, main_gap: int) -> None:
        arm9 = root / "config" / region / "arm9"
        arm9.mkdir(parents=True)
        matched_end = 0x1000 - main_gap
        (arm9 / "delinks.txt").write_text(
            "    .text       start:0x0 end:0x1000 kind:code\n"
            "\n"
            "src/main/func_a.c:\n"
            "    complete\n"
            f"    .text start:0x0 end:0x{matched_end:x}\n"
        )

    def test_sums_gap_across_all_three_regions(self):
        tmp = tempfile.mkdtemp()
        root = Path(tmp)
        self._write_region(root, "eur", main_gap=0x10)
        self._write_region(root, "usa", main_gap=0x20)
        self._write_region(root, "jpn", main_gap=0x30)
        gaps = three_region_module_gaps(root)
        self.assertEqual(gaps["main"], 0x10 + 0x20 + 0x30)

    def test_missing_region_dir_contributes_nothing(self):
        tmp = tempfile.mkdtemp()
        root = Path(tmp)
        self._write_region(root, "eur", main_gap=0x10)
        # usa/jpn config dirs simply don't exist.
        gaps = three_region_module_gaps(root)
        self.assertEqual(gaps["main"], 0x10)


if __name__ == "__main__":
    unittest.main()
