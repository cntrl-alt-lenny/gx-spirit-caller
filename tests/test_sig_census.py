"""Tests for tools/sig_census.py (brief 569).

Pure-logic pieces only — sampling/name-derivation, dsd log-output
classification, the reference-catalogue cross-check, and the
cross-validation address extraction — all tested on fixtures, no real
`dsd` binary or build needed (matches tests/test_size_census.py's
split between pure scoring logic and one real-config integration
check).

`resolved_addr_from_target_name` pins the brief-569 cross-validation
bug fix directly: comparing against `main_func_resolution["addr"]`
(the EUR source address, useless — identical for every target region)
instead of deriving the target address from `target_name`'s embedded
hex suffix made every cross-validated pair look like a disagreement
even when the two independent methods actually agreed.
"""

from __future__ import annotations

import sys
import tempfile
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from sig_census import (  # noqa: E402
    ApplyOutcome,
    addr_in_references,
    module_label,
    parse_apply_output,
    resolved_addr_from_target_name,
    sample_matched_functions,
    unit_symbol_name,
)


class TestUnitSymbolName(unittest.TestCase):
    def test_plain_c_file_unchanged(self):
        self.assertEqual(unit_symbol_name("src/main/func_0208904c.c"), "func_0208904c")

    def test_legacy_infix_stripped(self):
        self.assertEqual(
            unit_symbol_name("src/main/func_02096434.legacy.c"), "func_02096434"
        )

    def test_legacy_sp3_infix_stripped(self):
        self.assertEqual(
            unit_symbol_name("src/main/func_0208bcf8.legacy_sp3.c"), "func_0208bcf8"
        )

    def test_thumb_infix_stripped(self):
        # brief-569 bug: dsd's real symbol (symbols.txt) never carries the
        # `.thumb` routing infix — only the ninja/mwcc rule needs it. Before
        # the fix this returned "func_ov004_021dc19c.thumb" and `sig new -f`
        # failed with "No function found with name ...".
        self.assertEqual(
            unit_symbol_name("src/overlay004/func_ov004_021dc19c.thumb.c"),
            "func_ov004_021dc19c",
        )

    def test_friendly_name_no_infix(self):
        self.assertEqual(unit_symbol_name("src/main/Rand_Next.c"), "Rand_Next")

    def test_cpp_extension(self):
        self.assertEqual(unit_symbol_name("src/main/Foo_Bar.cpp"), "Foo_Bar")


class TestModuleLabel(unittest.TestCase):
    def test_main_arm9(self):
        self.assertEqual(module_label(Path("arm9/delinks.txt")), "main")

    def test_overlay(self):
        self.assertEqual(
            module_label(Path("arm9/overlays/ov005/delinks.txt")), "ov005"
        )

    def test_fallback_uses_parent_dir_name(self):
        self.assertEqual(module_label(Path("something/delinks.txt")), "something")


class TestAddrInReferences(unittest.TestCase):
    REFS = [
        ("docs/a.md", "known family at func_0208904c and 0x0226af64.\n"),
        ("docs/b.md", "nothing relevant here.\n"),
    ]

    def test_hit_without_0x_prefix(self):
        hits = addr_in_references(0x0208904C, self.REFS)
        self.assertEqual(hits, ["docs/a.md"])

    def test_hit_with_0x_prefix(self):
        hits = addr_in_references(0x0226AF64, self.REFS)
        self.assertEqual(hits, ["docs/a.md"])

    def test_case_insensitive(self):
        hits = addr_in_references(0x0208904C, [("docs/c.md", "FUNC_0208904C\n")])
        self.assertEqual(hits, ["docs/c.md"])

    def test_no_hit_returns_empty(self):
        hits = addr_in_references(0x0BADF00D, self.REFS)
        self.assertEqual(hits, [])


class TestResolvedAddrFromTargetName(unittest.TestCase):
    """Pins the brief-569 cross-validation bug fix — see module docstring."""

    def test_plain_address_name(self):
        self.assertEqual(resolved_addr_from_target_name("func_0208904c"), 0x0208904C)

    def test_overlay_address_name(self):
        self.assertEqual(
            resolved_addr_from_target_name("func_ov002_0226af64"), 0x0226AF64
        )

    def test_uppercase_hex_suffix(self):
        self.assertEqual(resolved_addr_from_target_name("func_0208904C"), 0x0208904C)

    def test_none_input(self):
        self.assertIsNone(resolved_addr_from_target_name(None))

    def test_empty_string(self):
        self.assertIsNone(resolved_addr_from_target_name(""))

    def test_friendly_name_no_addr_suffix(self):
        # e.g. Rand_Next / Ov008_Rand in the real census — a name that was
        # already human-renamed in the target region carries no address,
        # so this must return None (not comparable), never a false match.
        self.assertIsNone(resolved_addr_from_target_name("Rand_Next"))

    def test_short_hex_suffix_not_matched(self):
        # only an exact 8-hex-digit trailing suffix counts.
        self.assertIsNone(resolved_addr_from_target_name("func_af64"))


class TestParseApplyOutput(unittest.TestCase):
    """dsd's `sig apply --dry` log-line classification (pure — no
    subprocess needed). Real captured shapes from the brief-569 census."""

    def test_applied_rename(self):
        log = (
            "[INFO  ds_decomp_cli::cmd::sig::apply] Applying signature: "
            "func_ov002_0226b054\n"
            "Renamed function at 0x0226af64 in overlay 2 to 'func_ov002_0226b054'\n"
            "[INFO ...] Dry run enabled, no changes were written\n"
        )
        outcome = parse_apply_output(0, log)
        self.assertEqual(outcome.kind, "applied_rename")
        self.assertEqual(
            outcome.renamed_function,
            ("0x0226af64", "overlay 2", "func_ov002_0226b054"),
        )

    def test_applied_rename_with_symbol_renames(self):
        log = (
            "Renamed function at 0x02096340 in main to 'func_02096434'\n"
            "Renamed symbol at 0x021a81a8 in main to 'data_021a8288'\n"
        )
        outcome = parse_apply_output(0, log)
        self.assertEqual(outcome.kind, "applied_rename")
        self.assertEqual(
            outcome.renamed_symbols, [("0x021a81a8", "main", "data_021a8288")]
        )

    def test_multiple_matches(self):
        log = "[ERROR ds_decomp_cli::cmd::sig::apply] Multiple matching functions found\n"
        outcome = parse_apply_output(1, log)
        self.assertEqual(outcome.kind, "multiple")

    def test_not_found(self):
        log = "[ERROR ds_decomp_cli::cmd::sig::apply] No matching function found\n"
        outcome = parse_apply_output(1, log)
        self.assertEqual(outcome.kind, "not_found")

    def test_applied_noop_on_clean_self_match(self):
        # Real dsd behaviour: a self-consistent match (already correctly
        # named) prints nothing beyond routine INFO/DEBUG loading lines.
        log = "[INFO ds_rom::rom::rom] Loading ROM from config/eur/arm9/../../../extract/eur/config.yaml\n"
        outcome = parse_apply_output(0, log)
        self.assertEqual(outcome.kind, "applied_noop")

    def test_nonzero_returncode_without_known_pattern_is_error(self):
        outcome = parse_apply_output(1, "some unrecognised crash text\n")
        self.assertEqual(outcome.kind, "error")

    def test_rename_takes_priority_over_multiple_text(self):
        # defensive: if a log line elsewhere mentions "Multiple" in passing
        # but a rename still fired, the rename is the actual outcome.
        log = (
            "Renamed function at 0x02005d38 in main to 'func_02005d54'\n"
            "note: Multiple candidate signatures were considered internally\n"
        )
        outcome = parse_apply_output(0, log)
        self.assertEqual(outcome.kind, "applied_rename")


class TestApplyOutcomeDataclassDefaults(unittest.TestCase):
    def test_defaults(self):
        o = ApplyOutcome("applied_noop")
        self.assertIsNone(o.renamed_function)
        self.assertEqual(o.renamed_symbols, [])
        self.assertEqual(o.raw, "")


class TestSampleMatchedFunctions(unittest.TestCase):
    DELINKS_MAIN = "\n".join([
        "src/main/func_02096434.legacy.c:",
        "    complete",
        "    .text start:0x02096434 end:0x020964a0",  # 0x6c bytes
        "src/main/func_0208904c.c:",
        "    complete",
        "    .text start:0x0208904c end:0x0208905c",  # 0x10 bytes (tiny)
        "src/main/BitUnPack.s:",  # not .c/.cpp — must be skipped
        "    complete",
        "    .text start:0x02090000 end:0x020900a0",
        "src/main/func_02091000.c:",  # incomplete — must be skipped
        "    .text start:0x02091000 end:0x02091100",
        "_dsd_gap@main_3:",  # gap TU — no source ext — must be skipped
        "    .text start:0x02092000 end:0x02092010",
    ])

    def _write_tree(self, tmp: str) -> Path:
        root = Path(tmp)
        (root / "arm9").mkdir(parents=True)
        (root / "arm9" / "delinks.txt").write_text(self.DELINKS_MAIN)
        return root

    def test_filters_incomplete_gap_and_asm(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = self._write_tree(tmp)
            sample = sample_matched_functions(root, n=10, min_size=0, seed=1)
            names = {c["name"] for c in sample}
            self.assertEqual(names, {"func_02096434", "func_0208904c"})

    def test_min_size_filters_tiny_functions(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = self._write_tree(tmp)
            sample = sample_matched_functions(root, n=10, min_size=0x20, seed=1)
            names = {c["name"] for c in sample}
            self.assertEqual(names, {"func_02096434"})  # 0x10-byte one dropped

    def test_module_and_addr_wired_through(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = self._write_tree(tmp)
            sample = sample_matched_functions(root, n=10, min_size=0, seed=1)
            by_name = {c["name"]: c for c in sample}
            self.assertEqual(by_name["func_02096434"]["module"], "main")
            self.assertEqual(by_name["func_02096434"]["addr"], 0x02096434)
            self.assertEqual(by_name["func_02096434"]["size"], 0x6C)

    def test_n_caps_sample_size(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = self._write_tree(tmp)
            sample = sample_matched_functions(root, n=1, min_size=0, seed=1)
            self.assertEqual(len(sample), 1)

    def test_seed_is_deterministic(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = self._write_tree(tmp)
            a = sample_matched_functions(root, n=10, min_size=0, seed=7)
            b = sample_matched_functions(root, n=10, min_size=0, seed=7)
            self.assertEqual([c["name"] for c in a], [c["name"] for c in b])

    def test_empty_tree(self):
        with tempfile.TemporaryDirectory() as tmp:
            sample = sample_matched_functions(Path(tmp), n=10, min_size=0, seed=1)
            self.assertEqual(sample, [])


if __name__ == "__main__":
    unittest.main()
