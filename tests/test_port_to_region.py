"""Unit tests for tools/port_to_region.py.

Pins the source-rewriting logic. The library functions are
deterministic and pure-Python; the integration path (full
EUR→USA port) is exercised by manual smoke tests on real sources
(see PR description for brief 064 deliverable 2).

Run locally:
    python -m unittest tests.test_port_to_region
"""

from __future__ import annotations

import sys
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from port_to_region import (  # noqa: E402
    FILENAME_RE,
    SYMBOL_RE,
    SymbolRef,
    Resolution,
    apply_substitutions,
    compute_output_path,
    find_rename_collisions,
    function_symbol_for,
    infer_module_from_path,
    module_to_src_dir,
    parse_filename_stem,
    parse_symbols_in_source,
    target_stem_for_prefix,
)


class TestSymbolPattern(unittest.TestCase):
    def test_bare_func(self):
        m = SYMBOL_RE.search("extern int func_02006164(void);")
        self.assertIsNotNone(m)
        self.assertEqual(m.group("kind"), "func")
        self.assertIsNone(m.group("overlay"))
        self.assertEqual(m.group("addr"), "02006164")

    def test_overlay_func(self):
        m = SYMBOL_RE.search("call func_ov002_021b41e8")
        self.assertIsNotNone(m)
        self.assertEqual(m.group("kind"), "func")
        self.assertEqual(m.group("overlay"), "002")
        self.assertEqual(m.group("addr"), "021b41e8")

    def test_data_symbol(self):
        m = SYMBOL_RE.search("extern T data_02103d74;")
        self.assertIsNotNone(m)
        self.assertEqual(m.group("kind"), "data")
        self.assertEqual(m.group("addr"), "02103d74")

    def test_overlay_data(self):
        m = SYMBOL_RE.search("data_ov002_022cd744")
        self.assertIsNotNone(m)
        self.assertEqual(m.group("kind"), "data")
        self.assertEqual(m.group("overlay"), "002")

    def test_partial_match_rejected(self):
        # 7-hex isn't a full address — should not match
        self.assertIsNone(SYMBOL_RE.search("func_0200616"))
        # 9-hex shouldn't match either (bounded length)
        # … actually re does match the leading 8 chars; word boundary
        # at position 8 followed by another hex digit means it's not
        # a word boundary, so it shouldn't match.
        self.assertIsNone(SYMBOL_RE.search("func_020061640"))


class TestInferModule(unittest.TestCase):
    def test_main(self):
        self.assertEqual(
            infer_module_from_path(_TOOLS.parent / "src/main/func_X.c"),
            "main",
        )

    def test_overlay(self):
        self.assertEqual(
            infer_module_from_path(_TOOLS.parent / "src/overlay002/func_X.c"),
            "ov002",
        )

    def test_region_prefixed(self):
        self.assertEqual(
            infer_module_from_path(_TOOLS.parent / "src/usa/main/func_X.c"),
            "main",
        )
        self.assertEqual(
            infer_module_from_path(_TOOLS.parent / "src/jpn/overlay011/func_X.c"),
            "ov011",
        )


class TestModuleToSrcDir(unittest.TestCase):
    def test_main(self):
        self.assertEqual(module_to_src_dir("main"), "main")

    def test_overlay(self):
        self.assertEqual(module_to_src_dir("ov002"), "overlay002")
        self.assertEqual(module_to_src_dir("ov011"), "overlay011")


class TestParseSymbols(unittest.TestCase):
    def test_full_source_parse(self):
        src = """\
extern int func_02006c0c(int a, int b, int c, int d);
extern T data_02103d74;
int func_0201ed28(int a, int unused1, int unused2, int d) {
    return func_02006c0c(a, 4, 0x0, d);
}
"""
        refs = parse_symbols_in_source(src, default_module="main")
        # Expect 3 unique symbols: the defined func, the called func,
        # and the data reference.
        names = sorted(r.text for r in refs.values())
        # Sorted lexicographically: "data_…" < "func_02006…" < "func_0201…"
        self.assertEqual(names, ["data_02103d74", "func_02006c0c", "func_0201ed28"])

    def test_overlay_prefix_routes_to_overlay(self):
        src = "extern int func_ov002_021b3c10(int);\n"
        refs = parse_symbols_in_source(src, default_module="main")
        ref = next(iter(refs.values()))
        self.assertEqual(ref.module, "ov002")

    def test_bare_func_routes_to_main(self):
        # Bare func_<addr> should default to "main" regardless of
        # the source's own module.
        src = "extern int func_02006c0c(int);\n"
        refs = parse_symbols_in_source(src, default_module="ov002")
        ref = next(iter(refs.values()))
        self.assertEqual(ref.module, "main")


class TestApplySubstitutions(unittest.TestCase):
    def test_basic_substitution(self):
        src = "extern int func_02006c0c(int); int func_0201ed28(int x);"
        resolutions = [
            Resolution(
                eur_ref=SymbolRef(text="func_02006c0c", kind="func",
                                  module="main", addr=0x02006c0c),
                target_name="func_02006bf0", confidence="HIGH",
                notes="",
            ),
            Resolution(
                eur_ref=SymbolRef(text="func_0201ed28", kind="func",
                                  module="main", addr=0x0201ed28),
                target_name="func_0201ecd4", confidence="HIGH",
                notes="",
            ),
        ]
        out = apply_substitutions(src, resolutions)
        self.assertEqual(
            out,
            "extern int func_02006bf0(int); int func_0201ecd4(int x);",
        )

    def test_unresolved_skipped(self):
        # target_name=None should not substitute
        src = "func_02006c0c();"
        resolutions = [
            Resolution(
                eur_ref=SymbolRef(text="func_02006c0c", kind="func",
                                  module="main", addr=0x02006c0c),
                target_name=None, confidence="NONE",
                notes="",
            ),
        ]
        out = apply_substitutions(src, resolutions)
        self.assertEqual(out, "func_02006c0c();")

    def test_word_boundary_no_partial_match(self):
        # `func_02006164` substitution should NOT match
        # `func_020061640` (9-hex extended).
        src = "func_02006164 func_020061640"
        resolutions = [
            Resolution(
                eur_ref=SymbolRef(text="func_02006164", kind="func",
                                  module="main", addr=0x02006164),
                target_name="func_02006148", confidence="HIGH",
                notes="",
            ),
        ]
        out = apply_substitutions(src, resolutions)
        # Both should be replaced because `func_020061640` is
        # the same word — actually re's \b sees the 9th hex char
        # as a word char, so `func_02006164` followed by `0` is
        # one word. The regex \b after `func_02006164` doesn't
        # match before `0`. So the substitution should NOT fire.
        # Verify:
        self.assertEqual(out, "func_02006148 func_020061640")

    def test_longest_first_ordering(self):
        # `func_ov002_021b3c10` and a hypothetical `func_021b3c10`
        # could conflict. Longer-first sort means we always replace
        # the more specific name first.
        src = "func_ov002_021b3c10 + func_021b3c10"
        resolutions = [
            Resolution(
                eur_ref=SymbolRef(text="func_ov002_021b3c10", kind="func",
                                  module="ov002", addr=0x021b3c10),
                target_name="func_ov002_021b3b30", confidence="HIGH",
                notes="",
            ),
            Resolution(
                eur_ref=SymbolRef(text="func_021b3c10", kind="func",
                                  module="main", addr=0x021b3c10),
                target_name="func_021b3aaa", confidence="HIGH",
                notes="",
            ),
        ]
        out = apply_substitutions(src, resolutions)
        self.assertEqual(
            out,
            "func_ov002_021b3b30 + func_021b3aaa",
        )


class TestComputeOutputPath(unittest.TestCase):
    def test_main(self):
        ROOT = _TOOLS.parent
        out = compute_output_path(
            ROOT / "src/main/func_02006164.c",
            "usa", "func_02006148", "main",
        )
        self.assertEqual(out, ROOT / "src/usa/main/func_02006148.c")

    def test_overlay(self):
        ROOT = _TOOLS.parent
        out = compute_output_path(
            ROOT / "src/overlay002/func_ov002_021b41e8.c",
            "usa", "func_ov002_021b4108", "ov002",
        )
        self.assertEqual(out, ROOT / "src/usa/overlay002/func_ov002_021b4108.c")

    def test_legacy_suffix_preserved(self):
        ROOT = _TOOLS.parent
        out = compute_output_path(
            ROOT / "src/main/func_X.legacy.c",
            "usa", "func_Y", "main",
        )
        self.assertEqual(out, ROOT / "src/usa/main/func_Y.legacy.c")

    def test_legacy_sp3_suffix_preserved(self):
        ROOT = _TOOLS.parent
        out = compute_output_path(
            ROOT / "src/main/func_X.legacy_sp3.c",
            "jpn", "func_Y", "main",
        )
        self.assertEqual(out, ROOT / "src/jpn/main/func_Y.legacy_sp3.c")


# --------------------------------------------------------------------------- #
# Filename-pattern patch (brief 062 follow-up — accept <module>_<addr>.c)
# --------------------------------------------------------------------------- #


class TestFilenameRE(unittest.TestCase):
    """Pin the four accepted filename patterns + rejection cases."""

    def test_func_addr(self):
        m = FILENAME_RE.match("func_02006164")
        self.assertIsNotNone(m)
        self.assertEqual(m.group("prefix"), "func")
        self.assertEqual(m.group("addr"), "02006164")

    def test_func_ov_addr(self):
        m = FILENAME_RE.match("func_ov002_021b41e8")
        self.assertIsNotNone(m)
        self.assertEqual(m.group("prefix"), "func_ov002")
        self.assertEqual(m.group("addr"), "021b41e8")

    def test_main_addr(self):
        m = FILENAME_RE.match("main_020498dc")
        self.assertIsNotNone(m)
        self.assertEqual(m.group("prefix"), "main")
        self.assertEqual(m.group("addr"), "020498dc")

    def test_ov_addr(self):
        m = FILENAME_RE.match("ov002_021aff78")
        self.assertIsNotNone(m)
        self.assertEqual(m.group("prefix"), "ov002")
        self.assertEqual(m.group("addr"), "021aff78")

    def test_partial_hex_rejected(self):
        # 7-hex address: not enough digits.
        self.assertIsNone(FILENAME_RE.match("func_0200616"))
        self.assertIsNone(FILENAME_RE.match("main_0200616"))

    def test_extended_hex_rejected(self):
        # 9-hex address: anchored regex must reject.
        self.assertIsNone(FILENAME_RE.match("func_020061640"))
        self.assertIsNone(FILENAME_RE.match("ov002_021aff780"))

    def test_unrelated_prefix_rejected(self):
        # `sinit_ov002_<addr>` is NOT accepted — sinit files are a
        # different convention (static initialisers); decomper
        # handles them separately.
        self.assertIsNone(FILENAME_RE.match("sinit_ov002_021b2f64"))
        # Already-renamed task files don't have an address suffix
        # at all → reject.
        self.assertIsNone(FILENAME_RE.match("Task_StartLockedSubTask"))
        # `ov<NNN>_stubs_<short>` (multi-function stub file) — not
        # the same shape; brief 062 follow-up explicitly scopes to
        # the address-keyed single-function convention.
        self.assertIsNone(FILENAME_RE.match("ov009_stubs_ab840"))


class TestParseFilenameStem(unittest.TestCase):
    """Pin the (prefix, module, addr) tuple for each accepted shape."""

    def test_func_addr_routes_to_main(self):
        self.assertEqual(
            parse_filename_stem("func_02006164"),
            ("func", "main", 0x02006164),
        )

    def test_func_ov_addr_routes_to_overlay(self):
        self.assertEqual(
            parse_filename_stem("func_ov002_021b41e8"),
            ("func_ov002", "ov002", 0x021b41e8),
        )

    def test_main_addr_routes_to_main(self):
        self.assertEqual(
            parse_filename_stem("main_020498dc"),
            ("main", "main", 0x020498dc),
        )

    def test_ov_addr_routes_to_overlay(self):
        self.assertEqual(
            parse_filename_stem("ov002_021aff78"),
            ("ov002", "ov002", 0x021aff78),
        )

    def test_unrecognised_returns_none(self):
        self.assertIsNone(parse_filename_stem("sinit_ov007_021b2f64"))
        self.assertIsNone(parse_filename_stem("Task_DrawHand"))


class TestFunctionSymbolFor(unittest.TestCase):
    """The function-symbol *inside* the source is always
    `func_<addr>` / `func_ov<NNN>_<addr>` regardless of filename
    convention. This helper builds it from (module, addr)."""

    def test_main_module(self):
        self.assertEqual(
            function_symbol_for("main", 0x02006164),
            "func_02006164",
        )

    def test_overlay_module(self):
        self.assertEqual(
            function_symbol_for("ov002", 0x021b41e8),
            "func_ov002_021b41e8",
        )

    def test_high_overlay_pads_to_three_digits(self):
        # Defensive: ov0 / ov12 → ov000 / ov012 in the symbol name.
        self.assertEqual(
            function_symbol_for("ov0", 0x021b41e8),
            "func_ov000_021b41e8",
        )
        self.assertEqual(
            function_symbol_for("ov12", 0x021b41e8),
            "func_ov012_021b41e8",
        )


class TestTargetStemForPrefix(unittest.TestCase):
    """The output filename stem preserves the input's prefix style;
    only the address changes to the resolved target's address."""

    def test_func_prefix_passthrough(self):
        # The classic case — input was func_<eur>.c, output is
        # func_<usa>.c (existing behaviour, unchanged).
        self.assertEqual(
            target_stem_for_prefix("func", "func_02006148"),
            "func_02006148",
        )

    def test_main_prefix_preserved(self):
        # Brief 062 follow-up: main_<eur>.c → main_<usa>.c.
        # The resolved symbol is still `func_<usa_addr>`, but the
        # filename keeps the `main_` prefix.
        self.assertEqual(
            target_stem_for_prefix("main", "func_02006148"),
            "main_02006148",
        )

    def test_func_ov_prefix_passthrough(self):
        self.assertEqual(
            target_stem_for_prefix("func_ov002", "func_ov002_021b4108"),
            "func_ov002_021b4108",
        )

    def test_ov_prefix_preserved(self):
        # ov002_<eur>.c → ov002_<usa>.c.
        self.assertEqual(
            target_stem_for_prefix("ov002", "func_ov002_021b4108"),
            "ov002_021b4108",
        )

    def test_renamed_symbol_falls_back_to_verbatim(self):
        # If the target symbol has been renamed (no trailing 8-hex),
        # we can't derive an address — fall back to using the name
        # verbatim. The decomper can re-derive the filename later.
        self.assertEqual(
            target_stem_for_prefix("main", "Task_DrawHand"),
            "Task_DrawHand",
        )


class TestComputeOutputPathWithModulePrefix(unittest.TestCase):
    """End-to-end: a `main_<eur>.c` or `ov002_<eur>.c` input
    produces a same-prefix output. Validates the full pipeline
    from filename-pattern parsing through path computation."""

    def test_main_addr_input_preserves_prefix(self):
        ROOT = _TOOLS.parent
        prefix, module, _addr = parse_filename_stem("main_020498dc")
        target_stem = target_stem_for_prefix(prefix, "func_020488f0")
        out = compute_output_path(
            ROOT / "src/main/main_020498dc.c",
            "usa", target_stem, module,
        )
        self.assertEqual(out, ROOT / "src/usa/main/main_020488f0.c")

    def test_ov_addr_input_preserves_prefix(self):
        ROOT = _TOOLS.parent
        prefix, module, _addr = parse_filename_stem("ov002_021aff78")
        target_stem = target_stem_for_prefix(prefix, "func_ov002_021afe00")
        out = compute_output_path(
            ROOT / "src/overlay002/ov002_021aff78.c",
            "usa", target_stem, module,
        )
        self.assertEqual(out, ROOT / "src/usa/overlay002/ov002_021afe00.c")

    def test_main_addr_input_with_legacy_suffix_preserves_both(self):
        # Brief 062 follow-up + .legacy.c routing tier interaction.
        ROOT = _TOOLS.parent
        prefix, module, _addr = parse_filename_stem("main_020498dc")
        target_stem = target_stem_for_prefix(prefix, "func_020488f0")
        out = compute_output_path(
            ROOT / "src/main/main_020498dc.legacy.c",
            "usa", target_stem, module,
        )
        self.assertEqual(
            out, ROOT / "src/usa/main/main_020488f0.legacy.c",
        )


# --------------------------------------------------------------------------- #
# Rename-collision detection (brief 065 wave 3 follow-up)
# --------------------------------------------------------------------------- #


class TestFindRenameCollisions(unittest.TestCase):
    """Catches parent ↔ callee target-name collisions before they
    emit self-recursive code. Surfaced by brief 065 wave 3."""

    def _res(self, eur_name: str, eur_addr: int,
             target: str | None,
             confidence: str = "HIGH") -> Resolution:
        return Resolution(
            eur_ref=SymbolRef(text=eur_name, kind="func",
                              module="main", addr=eur_addr),
            target_name=target,
            confidence=confidence,
            notes="",
        )

    def test_no_collisions_when_targets_distinct(self):
        # Normal case: each EUR ref resolves to a different USA name.
        resolutions = [
            self._res("func_02006164", 0x02006164, "func_02006148"),
            self._res("func_02006c0c", 0x02006c0c, "func_02006bf0"),
            self._res("func_0201ed28", 0x0201ed28, "func_0201ecd4"),
        ]
        self.assertEqual(find_rename_collisions(resolutions), [])

    def test_parent_callee_collision_detected(self):
        # Brief 065 wave 3's failure mode: function being ported
        # (parent) and one of its callees both resolve to the same
        # target → substitution emits self-recursive code.
        resolutions = [
            # parent function being ported
            self._res("func_02006164", 0x02006164, "func_02006148"),
            # callee — resolved to same target! (false-positive)
            self._res("func_02006c0c", 0x02006c0c, "func_02006148"),
        ]
        collisions = find_rename_collisions(resolutions)
        self.assertEqual(len(collisions), 1)
        target_name, colliding = collisions[0]
        self.assertEqual(target_name, "func_02006148")
        self.assertEqual(len(colliding), 2)
        # Both EUR sources are surfaced
        eur_names = sorted(r.eur_ref.text for r in colliding)
        self.assertEqual(
            eur_names, ["func_02006164", "func_02006c0c"],
        )

    def test_three_way_collision(self):
        # Triple collision (rare but possible if find_siblings
        # returns the same HIGH for multiple distinct candidates).
        resolutions = [
            self._res("func_a", 0x1000, "func_X"),
            self._res("func_b", 0x2000, "func_X"),
            self._res("func_c", 0x3000, "func_X"),
        ]
        collisions = find_rename_collisions(resolutions)
        self.assertEqual(len(collisions), 1)
        target_name, colliding = collisions[0]
        self.assertEqual(target_name, "func_X")
        self.assertEqual(len(colliding), 3)

    def test_unresolved_targets_ignored(self):
        # `target_name=None` (NONE-confidence symbols) shouldn't
        # contribute to collisions — they get surfaced separately
        # by the confidence-floor check.
        resolutions = [
            self._res("func_a", 0x1000, None, confidence="NONE"),
            self._res("func_b", 0x2000, None, confidence="NONE"),
            self._res("func_c", 0x3000, "func_X"),
        ]
        self.assertEqual(find_rename_collisions(resolutions), [])

    def test_data_symbol_collision_also_detected(self):
        # Two data symbols resolving to the same target name is
        # also a collision (would emit duplicate `extern` decls
        # with conflicting types).
        resolutions = [
            Resolution(
                eur_ref=SymbolRef(text="data_02103d74", kind="data",
                                  module="main", addr=0x02103d74),
                target_name="data_02103c94",
                confidence="EXACT_ADDR", notes="",
            ),
            Resolution(
                eur_ref=SymbolRef(text="data_02103d78", kind="data",
                                  module="main", addr=0x02103d78),
                target_name="data_02103c94",
                confidence="EXACT_ADDR", notes="",
            ),
        ]
        collisions = find_rename_collisions(resolutions)
        self.assertEqual(len(collisions), 1)

    def test_only_one_resolution_no_collision(self):
        # Trivial case: single resolution → never a collision.
        self.assertEqual(find_rename_collisions([
            self._res("func_a", 0x1000, "func_X"),
        ]), [])

    def test_empty_resolutions_no_collision(self):
        self.assertEqual(find_rename_collisions([]), [])


if __name__ == "__main__":
    unittest.main()
