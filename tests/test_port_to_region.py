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
    KIND_DATA_RE,
    SYMBOL_RE,
    SymbolRef,
    Resolution,
    _fmt_shift,
    apply_substitutions,
    collect_new_symbols_txt_lines,
    compute_neighbor_shift_consensus,
    compute_output_path,
    derive_data_shift_consensus,
    find_rename_collisions,
    function_symbol_for,
    infer_module_from_path,
    module_to_src_dir,
    normalize_module_name,
    parse_filename_stem,
    parse_symbols_in_source,
    resolve_symbol,
    symbols_txt_path_for,
    synthesize_data_symbol_name,
    target_stem_for_prefix,
)


class TestFmtShift(unittest.TestCase):
    """_fmt_shift renders signed hex correctly for both directions."""

    def test_positive_shift(self):
        self.assertEqual(_fmt_shift(0x8), "+0x8")
        self.assertEqual(_fmt_shift(0x1000), "+0x1000")

    def test_negative_shift(self):
        # USA addresses sometimes sit *below* EUR (negative shift).
        # We must NOT render this as `+0x-20`; that string is what
        # the brief 095 v1 prototype produced and looks malformed.
        self.assertEqual(_fmt_shift(-0x20), "-0x20")
        self.assertEqual(_fmt_shift(-0x1c), "-0x1c")

    def test_zero_shift(self):
        self.assertEqual(_fmt_shift(0), "0x0")


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


class TestSynthesizeDataSymbolName(unittest.TestCase):
    """Brief 526 — the `data_*` analogue of function_symbol_for(): the
    RAW address-encoded name dsd assigns a data/bss symbol before
    semantic retriage."""

    def test_main_module(self):
        self.assertEqual(
            synthesize_data_symbol_name("main", 0x021040ac),
            "data_021040ac",
        )

    def test_overlay_module(self):
        self.assertEqual(
            synthesize_data_symbol_name("ov022", 0x021ab9bc),
            "data_ov022_021ab9bc",
        )

    def test_high_overlay_pads_to_three_digits(self):
        self.assertEqual(
            synthesize_data_symbol_name("ov6", 0x0224f3e0),
            "data_ov006_0224f3e0",
        )

    def test_matches_real_b523_eur_symbol_names(self):
        # The two b523-blocked functions' EUR data symbols are
        # THEMSELVES already RETRIAGE-tier raw-address names (that's
        # what "no semantic name yet" means) — confirm the synthesis
        # convention round-trips them exactly, addr-for-addr.
        self.assertEqual(
            synthesize_data_symbol_name("ov006", 0x0224f3e0),
            "data_ov006_0224f3e0",
        )
        self.assertEqual(
            synthesize_data_symbol_name("main", 0x021040ac),
            "data_021040ac",
        )
        self.assertEqual(
            synthesize_data_symbol_name("ov022", 0x021ab9bc),
            "data_ov022_021ab9bc",
        )


class TestNormalizeModuleName(unittest.TestCase):
    """Brief 526 — relocs.txt's `module:` field uses dsd's own
    `overlay(N)` / `overlays(N,M,...)` syntax, NOT the `ovNNN` form every
    other module key in this tool uses. This was silently defeating the
    parallel-reloc data-symbol map for every OVERLAY-targeted reference
    (the actual root cause behind b523's 2 "blocked" ports — the
    address was always computable, the lookup key just never matched).
    """

    def test_main_passes_through(self):
        self.assertEqual(normalize_module_name("main"), "main")

    def test_already_normalized_passes_through(self):
        self.assertEqual(normalize_module_name("ov006"), "ov006")

    def test_singular_overlay_form(self):
        self.assertEqual(normalize_module_name("overlay(6)"), "ov006")
        self.assertEqual(normalize_module_name("overlay(22)"), "ov022")

    def test_singular_overlay_pads_to_three_digits(self):
        self.assertEqual(normalize_module_name("overlay(2)"), "ov002")

    def test_plural_overlay_swap_form_uses_first_listed(self):
        # Matches _port_overlay.py's prior _norm_mod fix (brief 459) for
        # the identical convention — an overlay-swap zone referenced
        # from either sibling lists all swap members; the first is used.
        self.assertEqual(normalize_module_name("overlays(5,9)"), "ov005")
        self.assertEqual(normalize_module_name("overlays(0,2)"), "ov000")

    def test_unrecognized_string_passes_through_unchanged(self):
        # Defensive: an unexpected format is returned verbatim rather
        # than silently mangled.
        self.assertEqual(normalize_module_name("something_else"), "something_else")


class TestSymbolsTxtPathFor(unittest.TestCase):
    """Brief 526 — the config/ path a synthesized data symbol's new
    line needs to be appended to."""

    def test_main_module(self):
        self.assertEqual(
            symbols_txt_path_for("usa", "main"),
            "config/usa/arm9/symbols.txt",
        )

    def test_overlay_module(self):
        self.assertEqual(
            symbols_txt_path_for("jpn", "ov022"),
            "config/jpn/arm9/overlays/ov022/symbols.txt",
        )


class TestKindDataRE(unittest.TestCase):
    """Brief 526 — the kind-capturing companion to DATA_RE, used by
    load_region_data_symbol_kinds() to preserve kind:data / kind:bss /
    kind:data(any) when proposing a new symbols.txt line."""

    def test_plain_bss(self):
        m = KIND_DATA_RE.match(
            "data_021040ac kind:bss addr:0x021040ac")
        self.assertIsNotNone(m)
        self.assertEqual(m.group("kind"), "bss")
        self.assertEqual(m.group("addr"), "021040ac")

    def test_plain_data(self):
        m = KIND_DATA_RE.match(
            "data_ov006_0224f3e0 kind:data addr:0x0224f3e0")
        self.assertIsNotNone(m)
        self.assertEqual(m.group("kind"), "data")

    def test_data_with_qualifier(self):
        # The `(any)` qualifier must be captured VERBATIM so the
        # synthesized symbols.txt line reproduces it exactly.
        m = KIND_DATA_RE.match(
            "data_ov022_021ab9bc kind:data(any) addr:0x021ab9bc")
        self.assertIsNotNone(m)
        self.assertEqual(m.group("kind"), "data(any)")

    def test_function_kind_does_not_match(self):
        m = KIND_DATA_RE.match(
            "func_02006164 kind:function(arm,size=0x20) addr:0x02006164")
        self.assertIsNone(m)


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


# --------------------------------------------------------------------------- #
# Brief 095 — D2 v2 neighbor-shift auto-promote
# --------------------------------------------------------------------------- #


class _FakeFunc:
    """Minimal Function stand-in for the consensus/resolve tests.

    Mirrors find_region_siblings.Function's read-only fields used by
    port_to_region — addr, name. The full Function dataclass is
    frozen and has more fields, but the consensus helper only needs
    addr + name.
    """
    __slots__ = ("addr", "size", "name", "module", "rank")

    def __init__(self, addr: int, name: str = "", module: str = "main",
                 size: int = 0x20, rank: int = 0):
        self.addr = addr
        self.size = size
        self.name = name
        self.module = module
        self.rank = rank


class _FakeMatch:
    """Stand-in for find_region_siblings.Match — just .func +
    .confidence are read by port_to_region."""
    __slots__ = ("func", "confidence", "score", "rationale")

    def __init__(self, func: _FakeFunc, confidence: str,
                 score: float = 0.5, rationale: str = ""):
        self.func = func
        self.confidence = confidence
        self.score = score
        self.rationale = rationale


def _make_find_siblings_fn(matches: dict[int, _FakeMatch]):
    """Build a stub find_siblings_fn for tests. Returns the
    pre-canned match for `eur_func.addr`; empty list if not in the
    table."""
    def _fn(eur_func, target_regions, *,
            max_results=1, source_region="eur",
            target_region_name=None, byte_disambiguate=True):
        m = matches.get(eur_func.addr)
        return [m] if m is not None else []
    return _fn


class TestComputeNeighborShiftConsensus(unittest.TestCase):
    """Brief 095 D2 v2 — neighbor-shift consensus helper.

    The shift the brief targets is constant per module-region for DS
    overlays: EUR functions in a kbyte all shift by the same +N to
    their USA twin. We synthesise 8 EUR neighbors around a target
    address, return HIGH matches with a consensus +8 shift, and check
    the helper finds it.
    """

    def _eur_region(self) -> dict[str, list]:
        # 8 EUR functions in module "main", addresses 0x02006d00 .. 0x02006e54
        addrs = [
            0x02006d00, 0x02006d40, 0x02006d80, 0x02006dc0,
            0x02006e00, 0x02006e40, 0x02006e54, 0x02006e80,
        ]
        return {"main": [_FakeFunc(addr=a, rank=i)
                         for i, a in enumerate(addrs)]}

    def test_consensus_8_from_5_neighbors(self):
        eur = self._eur_region()
        # Every neighbor matches HIGH with +8 shift in USA.
        matches = {
            a: _FakeMatch(_FakeFunc(addr=a + 0x8), "HIGH")
            for a in (0x02006d00, 0x02006d40, 0x02006d80, 0x02006dc0,
                      0x02006e00, 0x02006e40, 0x02006e80)
        }
        fn = _make_find_siblings_fn(matches)
        shift, sampled = compute_neighbor_shift_consensus(
            eur_addr=0x02006e54, module="main",
            eur_regions=eur, target_regions={},
            find_siblings_fn=fn, target_region_name="usa",
        )
        self.assertEqual(shift, 0x8)
        # 5 neighbors sampled (n_neighbors default).
        self.assertEqual(len(sampled), 5)

    def test_consensus_when_4_of_5_agree(self):
        # 4 of 5 neighbors agree on +8; 1 anomalous +16. Default
        # min_agreement is 3 → +8 wins.
        eur = self._eur_region()
        addrs = [0x02006d00, 0x02006d40, 0x02006d80, 0x02006dc0, 0x02006e00]
        matches = {
            addrs[0]: _FakeMatch(_FakeFunc(addr=addrs[0] + 0x8), "HIGH"),
            addrs[1]: _FakeMatch(_FakeFunc(addr=addrs[1] + 0x8), "HIGH"),
            addrs[2]: _FakeMatch(_FakeFunc(addr=addrs[2] + 0x8), "HIGH"),
            addrs[3]: _FakeMatch(_FakeFunc(addr=addrs[3] + 0x10), "HIGH"),
            addrs[4]: _FakeMatch(_FakeFunc(addr=addrs[4] + 0x8), "HIGH"),
        }
        fn = _make_find_siblings_fn(matches)
        shift, sampled = compute_neighbor_shift_consensus(
            eur_addr=0x02006e54, module="main",
            eur_regions=eur, target_regions={},
            find_siblings_fn=fn, target_region_name="usa",
        )
        self.assertEqual(shift, 0x8)
        self.assertEqual(len(sampled), 5)

    def test_no_consensus_when_split_2_2_1(self):
        # 2 vote +8, 2 vote +16, 1 votes +24 → no mode reaches 3 →
        # consensus is None.
        eur = self._eur_region()
        addrs = [0x02006d00, 0x02006d40, 0x02006d80, 0x02006dc0, 0x02006e00]
        matches = {
            addrs[0]: _FakeMatch(_FakeFunc(addr=addrs[0] + 0x8), "HIGH"),
            addrs[1]: _FakeMatch(_FakeFunc(addr=addrs[1] + 0x10), "HIGH"),
            addrs[2]: _FakeMatch(_FakeFunc(addr=addrs[2] + 0x8), "HIGH"),
            addrs[3]: _FakeMatch(_FakeFunc(addr=addrs[3] + 0x10), "HIGH"),
            addrs[4]: _FakeMatch(_FakeFunc(addr=addrs[4] + 0x18), "HIGH"),
        }
        fn = _make_find_siblings_fn(matches)
        shift, sampled = compute_neighbor_shift_consensus(
            eur_addr=0x02006e54, module="main",
            eur_regions=eur, target_regions={},
            find_siblings_fn=fn, target_region_name="usa",
        )
        self.assertIsNone(shift)
        self.assertEqual(len(sampled), 5)

    def test_no_consensus_when_too_few_high_neighbors(self):
        # Only 2 HIGH neighbors found (rest are MEDIUM / no match).
        # min_agreement is 3 → no consensus.
        eur = self._eur_region()
        matches = {
            0x02006d00: _FakeMatch(_FakeFunc(addr=0x02006d08), "HIGH"),
            0x02006d40: _FakeMatch(_FakeFunc(addr=0x02006d48), "HIGH"),
            0x02006d80: _FakeMatch(_FakeFunc(addr=0x02006d88), "MEDIUM"),
        }
        fn = _make_find_siblings_fn(matches)
        shift, sampled = compute_neighbor_shift_consensus(
            eur_addr=0x02006e54, module="main",
            eur_regions=eur, target_regions={},
            find_siblings_fn=fn, target_region_name="usa",
        )
        self.assertIsNone(shift)
        # 2 HIGH samples collected, not enough for consensus.
        self.assertEqual(len(sampled), 2)

    def test_pivot_not_in_module_returns_none(self):
        eur = self._eur_region()
        fn = _make_find_siblings_fn({})
        shift, sampled = compute_neighbor_shift_consensus(
            eur_addr=0xdeadbeef, module="main",
            eur_regions=eur, target_regions={},
            find_siblings_fn=fn, target_region_name="usa",
        )
        self.assertIsNone(shift)
        self.assertEqual(sampled, [])


class TestResolveSymbolAutoPromote(unittest.TestCase):
    """Brief 095 D2 v2 — resolve_symbol promotes LOW→MEDIUM when
    the candidate's shift matches the neighbor consensus."""

    def _eur_region(self) -> dict[str, list]:
        addrs = [
            0x02006d00, 0x02006d40, 0x02006d80, 0x02006dc0,
            0x02006e00, 0x02006e40, 0x02006e54, 0x02006e80,
        ]
        return {"main": [_FakeFunc(addr=a, rank=i)
                         for i, a in enumerate(addrs)]}

    def _target_region(self) -> dict[str, list]:
        # USA has 8 functions at EUR+8 each.
        return {"main": [_FakeFunc(addr=a + 0x8) for a in (
            0x02006d00, 0x02006d40, 0x02006d80, 0x02006dc0,
            0x02006e00, 0x02006e40, 0x02006e54, 0x02006e80,
        )]}

    def test_low_promoted_to_medium_on_consensus_match(self):
        eur = self._eur_region()
        target = self._target_region()
        # 6 HIGH neighbors + the candidate which comes back LOW.
        # All shifts are +8.
        matches = {}
        for a in (0x02006d00, 0x02006d40, 0x02006d80, 0x02006dc0,
                  0x02006e00, 0x02006e40, 0x02006e80):
            matches[a] = _FakeMatch(
                _FakeFunc(addr=a + 0x8, name=f"func_{a + 0x8:08x}"),
                "HIGH",
            )
        # The candidate has no relocs → comes back LOW.
        matches[0x02006e54] = _FakeMatch(
            _FakeFunc(addr=0x02006e5c, name="func_02006e5c"),
            "LOW",
            rationale="size+ish match, no relocs to compare",
        )
        fn = _make_find_siblings_fn(matches)
        ref = SymbolRef(text="func_02006e54", kind="func",
                        module="main", addr=0x02006e54)
        cache: dict = {}
        res = resolve_symbol(
            ref, "usa", eur, target, {},
            fn, consensus_cache=cache,
        )
        self.assertEqual(res.confidence, "MEDIUM")
        self.assertEqual(res.target_name, "func_02006e5c")
        self.assertIn("auto-promoted LOW→MEDIUM", res.notes)
        self.assertIn("+0x8", res.notes)
        # Sanity: no malformed `+0x-N` strings should appear.
        self.assertNotIn("+0x-", res.notes)
        # Cache populated for re-use.
        self.assertIn(("main", "usa"), cache)

    def test_low_stays_low_on_wrong_shift_anti_match(self):
        # Brief 095 spec: candidate whose shift differs from consensus
        # stays LOW. This is the intentional anti-match safeguard.
        eur = self._eur_region()
        target = self._target_region()
        matches = {}
        for a in (0x02006d00, 0x02006d40, 0x02006d80, 0x02006dc0,
                  0x02006e00, 0x02006e40, 0x02006e80):
            matches[a] = _FakeMatch(
                _FakeFunc(addr=a + 0x8, name=f"func_{a + 0x8:08x}"),
                "HIGH",
            )
        # Candidate at WRONG shift +0x40 (vs consensus +0x8).
        matches[0x02006e54] = _FakeMatch(
            _FakeFunc(addr=0x02006e94, name="func_02006e94"),
            "LOW",
            rationale="size+ish match, no relocs to compare",
        )
        fn = _make_find_siblings_fn(matches)
        ref = SymbolRef(text="func_02006e54", kind="func",
                        module="main", addr=0x02006e54)
        res = resolve_symbol(
            ref, "usa", eur, target, {},
            fn,
        )
        self.assertEqual(res.confidence, "LOW")
        self.assertEqual(res.target_name, "func_02006e94")
        self.assertIn("anti-match", res.notes)

    def test_low_stays_low_when_no_consensus(self):
        # Brief 095: if no consensus, default behavior — keep LOW.
        eur = self._eur_region()
        target = self._target_region()
        # Only 2 HIGH neighbors, not enough for min_agreement=3.
        matches = {
            0x02006d00: _FakeMatch(
                _FakeFunc(addr=0x02006d08, name="x"), "HIGH"),
            0x02006d40: _FakeMatch(
                _FakeFunc(addr=0x02006d48, name="y"), "HIGH"),
            0x02006e54: _FakeMatch(
                _FakeFunc(addr=0x02006e5c, name="func_02006e5c"),
                "LOW",
                rationale="size+ish match, no relocs to compare",
            ),
        }
        fn = _make_find_siblings_fn(matches)
        ref = SymbolRef(text="func_02006e54", kind="func",
                        module="main", addr=0x02006e54)
        res = resolve_symbol(
            ref, "usa", eur, target, {}, fn,
        )
        self.assertEqual(res.confidence, "LOW")
        self.assertIn("no neighbor consensus", res.notes)

    def test_auto_promote_disabled_keeps_low(self):
        # --no-auto-promote opt-out: even with consensus, LOW stays LOW.
        eur = self._eur_region()
        target = self._target_region()
        matches = {}
        for a in (0x02006d00, 0x02006d40, 0x02006d80, 0x02006dc0,
                  0x02006e00, 0x02006e40, 0x02006e80):
            matches[a] = _FakeMatch(
                _FakeFunc(addr=a + 0x8, name=f"func_{a + 0x8:08x}"),
                "HIGH",
            )
        matches[0x02006e54] = _FakeMatch(
            _FakeFunc(addr=0x02006e5c, name="func_02006e5c"),
            "LOW",
            rationale="size+ish match, no relocs to compare",
        )
        fn = _make_find_siblings_fn(matches)
        ref = SymbolRef(text="func_02006e54", kind="func",
                        module="main", addr=0x02006e54)
        res = resolve_symbol(
            ref, "usa", eur, target, {}, fn,
            auto_promote_low=False,
        )
        self.assertEqual(res.confidence, "LOW")
        self.assertNotIn("auto-promoted", res.notes)

    def test_high_resolution_unaffected_by_promote(self):
        # Sanity: HIGH matches don't touch the consensus path.
        eur = self._eur_region()
        target = self._target_region()
        matches = {0x02006e54: _FakeMatch(
            _FakeFunc(addr=0x02006e5c, name="func_02006e5c"),
            "HIGH",
        )}
        fn = _make_find_siblings_fn(matches)
        ref = SymbolRef(text="func_02006e54", kind="func",
                        module="main", addr=0x02006e54)
        res = resolve_symbol(ref, "usa", eur, target, {}, fn)
        self.assertEqual(res.confidence, "HIGH")
        self.assertNotIn("auto-promote", res.notes)

    def test_data_parallel_reloc_map_hit_with_named_target(self):
        # Sanity/regression: the ORIGINAL tier-1 success path (map hit +
        # target already named) is unaffected by brief 526 — still
        # EXACT_ADDR, not SYNTHESIZED.
        data_addr_map = {("ov006", 0x0224f3e0): ("ov006", 0x0224f3e0)}
        target_data = {"ov006": {0x0224f3e0: "g_cardSortBitmask"}}
        ref = SymbolRef(text="data_ov006_0224f3e0", kind="data",
                        module="ov006", addr=0x0224f3e0)
        res = resolve_symbol(
            ref, "usa", {}, {}, target_data,
            find_siblings_fn=None,
            data_addr_map=data_addr_map,
        )
        self.assertEqual(res.confidence, "EXACT_ADDR")
        self.assertEqual(res.target_name, "g_cardSortBitmask")
        self.assertIsNone(res.new_symbols_txt_line)

    def test_data_parallel_reloc_map_hit_synthesizes_when_unnamed(self):
        # Brief 526 — the exact b523 scenario: `find_siblings` fingerprint-
        # matches the (still-.s) target function, so derive_data_address_
        # mapping's parallel-reloc pairing DOES determine the correct
        # target address for a data ref inside it — but the target
        # region's symbols.txt has never named anything there (RETRIAGE-
        # tier: nothing else in that region references this address yet).
        # Previously fell through silently to the next tier and
        # eventually NONE; now synthesizes immediately at this tier.
        data_addr_map = {("ov022", 0x021ab9bc): ("ov022", 0x021ab9bc)}
        target_data = {"ov022": {
            0x021ab998: "data_ov022_021ab998",
            0x021ab9c0: "data_ov022_021ab9c0",
            # nothing named at 0x021ab9bc itself
        }}
        ref = SymbolRef(text="data_ov022_021ab9bc", kind="data",
                        module="ov022", addr=0x021ab9bc)
        res = resolve_symbol(
            ref, "usa", {}, {}, target_data,
            find_siblings_fn=None,
            data_addr_map=data_addr_map,
            eur_data_kinds={"ov022": {0x021ab9bc: "data(any)"}},
        )
        self.assertEqual(res.confidence, "SYNTHESIZED")
        self.assertEqual(res.target_name, "data_ov022_021ab9bc")
        self.assertEqual(
            res.new_symbols_txt_line,
            "data_ov022_021ab9bc kind:data(any) addr:0x021ab9bc",
        )
        self.assertEqual(
            res.new_symbols_txt_path,
            "config/usa/arm9/overlays/ov022/symbols.txt",
        )
        self.assertIn("parallel-reloc map", res.notes)
        self.assertIn("NOT YET NAMED", res.notes)

    def test_data_parallel_reloc_map_synthesis_uses_mapped_module(self):
        # The synthesized name/path must use the MAPPED module (from
        # data_addr_map's value), not the ref's own module — matters for
        # cross-module data refs (main code referencing overlay data or
        # vice versa).
        data_addr_map = {("main", 0x02100000): ("ov004", 0x021c0000)}
        target_data = {"ov004": {}}
        ref = SymbolRef(text="data_02100000", kind="data",
                        module="main", addr=0x02100000)
        res = resolve_symbol(
            ref, "usa", {}, {}, target_data,
            find_siblings_fn=None,
            data_addr_map=data_addr_map,
        )
        self.assertEqual(res.confidence, "SYNTHESIZED")
        self.assertEqual(res.target_name, "data_ov004_021c0000")
        self.assertEqual(
            res.new_symbols_txt_path,
            "config/usa/arm9/overlays/ov004/symbols.txt",
        )

    def test_data_d3_shift_consensus_resolves_unmapped_symbol(self):
        # Brief 095 D3 — when a data symbol misses the
        # parallel-reloc map AND misses exact-addr match, derive
        # the shift from other same-module mappings and try the
        # shifted address.
        eur = self._eur_region()
        target = self._target_region()
        # 2 known mappings establish consensus shift -0xe0.
        data_addr_map = {
            ("main", 0x021a18b8): ("main", 0x021a17d8),
            ("main", 0x021a19e8): ("main", 0x021a1908),
        }
        # USA symbols.txt has data_021a1938 at the shifted address
        # (021a1a18 - 0xe0).
        target_data = {"main": {
            0x021a17d8: "data_021a17d8",
            0x021a1908: "data_021a1908",
            0x021a1938: "data_021a1938",
        }}
        # Unmapped data ref — must NOT exact-addr-match (021a1a18
        # is not in target_data) and the parallel-reloc map doesn't
        # cover it.
        ref = SymbolRef(text="data_021a1a18", kind="data",
                        module="main", addr=0x021a1a18)
        # find_siblings_fn is not used by the data path.
        res = resolve_symbol(
            ref, "usa", eur, target, target_data,
            find_siblings_fn=None,
            data_addr_map=data_addr_map,
        )
        self.assertEqual(res.confidence, "EXACT_ADDR")
        self.assertEqual(res.target_name, "data_021a1938")
        self.assertIn("D3 data-shift consensus", res.notes)
        self.assertIn("-0xe0", res.notes)

    def test_data_d3_keeps_none_when_no_consensus(self):
        # < min_agreement mappings → no consensus → fall through
        # to NONE.
        data_addr_map = {
            ("main", 0x021a18b8): ("main", 0x021a17d8),
        }
        target_data = {"main": {0x021a17d8: "data_021a17d8"}}
        ref = SymbolRef(text="data_021a1a18", kind="data",
                        module="main", addr=0x021a1a18)
        res = resolve_symbol(
            ref, "usa", {}, {}, target_data,
            find_siblings_fn=None,
            data_addr_map=data_addr_map,
        )
        self.assertEqual(res.confidence, "NONE")
        self.assertIn("parallel-reloc map didn't cover", res.notes)

    def test_data_d3_synthesizes_when_shifted_addr_unnamed(self):
        # Brief 526 — consensus shift exists (ground-truth address is
        # KNOWN), but target region has never named a symbol at the
        # shifted address (RETRIAGE-tier gap). Previously fell through
        # to NONE, blocking the whole port; now SYNTHESIZED with the
        # raw address-encoded name + a companion symbols.txt-line note.
        data_addr_map = {
            ("main", 0x021a18b8): ("main", 0x021a17d8),
            ("main", 0x021a19e8): ("main", 0x021a1908),
        }
        # Note: 0x021a1938 (021a1a18 - 0xe0) is NOT in target_data.
        target_data = {"main": {
            0x021a17d8: "data_021a17d8",
            0x021a1908: "data_021a1908",
        }}
        ref = SymbolRef(text="data_021a1a18", kind="data",
                        module="main", addr=0x021a1a18)
        res = resolve_symbol(
            ref, "usa", {}, {}, target_data,
            find_siblings_fn=None,
            data_addr_map=data_addr_map,
            eur_data_kinds={"main": {0x021a1a18: "bss"}},
        )
        self.assertEqual(res.confidence, "SYNTHESIZED")
        self.assertEqual(res.target_name, "data_021a1938")
        self.assertEqual(res.new_symbols_txt_line,
                         "data_021a1938 kind:bss addr:0x021a1938")
        self.assertEqual(res.new_symbols_txt_path,
                         "config/usa/arm9/symbols.txt")
        self.assertIn("D3 data-shift consensus", res.notes)
        self.assertIn("NOT YET NAMED", res.notes)

    def test_data_d3_synthesis_defaults_kind_to_data_when_kinds_omitted(self):
        # eur_data_kinds is optional — omitting it defaults to "data"
        # rather than crashing.
        data_addr_map = {
            ("main", 0x021a18b8): ("main", 0x021a17d8),
            ("main", 0x021a19e8): ("main", 0x021a1908),
        }
        target_data = {"main": {
            0x021a17d8: "data_021a17d8",
            0x021a1908: "data_021a1908",
        }}
        ref = SymbolRef(text="data_021a1a18", kind="data",
                        module="main", addr=0x021a1a18)
        res = resolve_symbol(
            ref, "usa", {}, {}, target_data,
            find_siblings_fn=None,
            data_addr_map=data_addr_map,
        )
        self.assertEqual(res.confidence, "SYNTHESIZED")
        self.assertIn("kind:data ", res.new_symbols_txt_line)

    def test_derive_data_shift_consensus_skips_cross_module(self):
        # Cross-module entries (main → ov002) MUST NOT contribute to
        # the same-module consensus calculation — overlay layouts
        # have their own shifts independent of main.
        data_addr_map = {
            ("main", 0x100): ("main", 0xc0),    # main shift -0x40
            ("main", 0x200): ("main", 0x1c0),   # main shift -0x40
            ("main", 0x300): ("main", 0x2c0),   # main shift -0x40
            ("ov002", 0x300): ("ov002", 0x340), # ov002 shift +0x40
        }
        # 3 main entries agree on -0x40 (default min_agreement=3).
        self.assertEqual(
            derive_data_shift_consensus(data_addr_map, "main"),
            -0x40,
        )
        # ov002 only has 1 entry → no consensus at min_agreement=3.
        self.assertIsNone(
            derive_data_shift_consensus(
                data_addr_map, "ov002", min_agreement=3,
            ),
        )

    def test_derive_data_shift_consensus_min_agreement_2(self):
        # The data-path default in resolve_symbol uses
        # min_agreement=2 (smaller maps than the func-path's =3).
        # Verify the helper respects the override.
        data_addr_map = {
            ("main", 0x100): ("main", 0xc0),
            ("main", 0x200): ("main", 0x1c0),
        }
        self.assertEqual(
            derive_data_shift_consensus(
                data_addr_map, "main", min_agreement=2,
            ),
            -0x40,
        )
        # Default min_agreement=3 has only 2 entries → None.
        self.assertIsNone(
            derive_data_shift_consensus(data_addr_map, "main"),
        )

    def test_consensus_cache_reused_across_calls(self):
        # Two LOW resolutions in the same (module, target_region)
        # should share the consensus computation.
        eur = self._eur_region()
        target = self._target_region()
        matches = {}
        for a in (0x02006d00, 0x02006d40, 0x02006d80, 0x02006dc0,
                  0x02006e00, 0x02006e40, 0x02006e80):
            matches[a] = _FakeMatch(
                _FakeFunc(addr=a + 0x8, name=f"func_{a + 0x8:08x}"),
                "HIGH",
            )
        matches[0x02006e54] = _FakeMatch(
            _FakeFunc(addr=0x02006e5c, name="x"), "LOW",
            rationale="size+ish match")

        # Counter call-tracking find_siblings_fn
        call_count = [0]
        inner = _make_find_siblings_fn(matches)

        def counting_fn(*a, **kw):
            call_count[0] += 1
            return inner(*a, **kw)

        cache: dict = {}
        ref = SymbolRef(text="x", kind="func", module="main",
                        addr=0x02006e54)
        resolve_symbol(ref, "usa", eur, target, {},
                       counting_fn, consensus_cache=cache)
        first_call_count = call_count[0]
        # Second resolution at a different addr (same module/region):
        # consensus should hit the cache.
        ref2 = SymbolRef(text="y", kind="func", module="main",
                         addr=0x02006e40)
        # Make addr 0x02006e40 also come back LOW for this round
        matches[0x02006e40] = _FakeMatch(
            _FakeFunc(addr=0x02006e48, name="y"), "LOW",
            rationale="size+ish match")
        resolve_symbol(ref2, "usa", eur, target, {},
                       counting_fn, consensus_cache=cache)
        # Second call must NOT re-walk the neighbors — only the
        # candidate's own find_siblings call counts.
        self.assertEqual(call_count[0], first_call_count + 1)


class TestCollectNewSymbolsTxtLines(unittest.TestCase):
    """Brief 526 — groups every SYNTHESIZED resolution's companion
    symbols.txt line by target path, so landing a synthesized port is
    copy-paste mechanical."""

    def _synth(self, module, addr, line, path):
        return Resolution(
            eur_ref=SymbolRef(text=f"data_{addr:08x}", kind="data",
                              module=module, addr=addr),
            target_name=f"data_{addr:08x}",
            confidence="SYNTHESIZED",
            notes="test",
            new_symbols_txt_line=line,
            new_symbols_txt_path=path,
        )

    def test_empty_when_no_synthesized(self):
        resolutions = [
            Resolution(eur_ref=SymbolRef(text="func_x", kind="func",
                                         module="main", addr=1),
                      target_name="func_y", confidence="HIGH", notes=""),
        ]
        self.assertEqual(collect_new_symbols_txt_lines(resolutions), {})

    def test_single_synthesized_resolution(self):
        resolutions = [
            self._synth("ov022", 0x021ab9bc,
                       "data_ov022_021ab9bc kind:data(any) addr:0x021ab9bc",
                       "config/usa/arm9/overlays/ov022/symbols.txt"),
        ]
        out = collect_new_symbols_txt_lines(resolutions)
        self.assertEqual(out, {
            "config/usa/arm9/overlays/ov022/symbols.txt": [
                "data_ov022_021ab9bc kind:data(any) addr:0x021ab9bc",
            ],
        })

    def test_groups_by_path_and_sorts(self):
        # Two synthesized symbols in the SAME module (func_ov022_021ab460
        # references both an ov022 AND a main data symbol) group under
        # their respective paths, each internally sorted.
        resolutions = [
            self._synth("ov022", 0x021ab9bc,
                       "data_ov022_021ab9bc kind:data(any) addr:0x021ab9bc",
                       "config/usa/arm9/overlays/ov022/symbols.txt"),
            self._synth("main", 0x021040ac,
                       "data_021040ac kind:bss addr:0x021040ac",
                       "config/usa/arm9/symbols.txt"),
        ]
        out = collect_new_symbols_txt_lines(resolutions)
        self.assertEqual(list(out.keys()), [
            "config/usa/arm9/overlays/ov022/symbols.txt",
            "config/usa/arm9/symbols.txt",
        ])
        self.assertEqual(
            out["config/usa/arm9/symbols.txt"],
            ["data_021040ac kind:bss addr:0x021040ac"],
        )

    def test_deduplicates_identical_lines(self):
        # The same data symbol referenced twice in one source (e.g. once
        # for read, once for write) must not produce a duplicate line.
        resolutions = [
            self._synth("ov006", 0x0224f3e0,
                       "data_ov006_0224f3e0 kind:bss addr:0x0224f3e0",
                       "config/usa/arm9/overlays/ov006/symbols.txt"),
            self._synth("ov006", 0x0224f3e0,
                       "data_ov006_0224f3e0 kind:bss addr:0x0224f3e0",
                       "config/usa/arm9/overlays/ov006/symbols.txt"),
        ]
        out = collect_new_symbols_txt_lines(resolutions)
        self.assertEqual(
            out["config/usa/arm9/overlays/ov006/symbols.txt"],
            ["data_ov006_0224f3e0 kind:bss addr:0x0224f3e0"],
        )

    def test_ignores_exact_addr_and_none(self):
        # Only SYNTHESIZED resolutions contribute; EXACT_ADDR (already
        # named) and NONE (unresolved) must not leak a phantom line.
        resolutions = [
            Resolution(eur_ref=SymbolRef(text="data_x", kind="data",
                                         module="main", addr=1),
                      target_name="data_y", confidence="EXACT_ADDR",
                      notes=""),
            Resolution(eur_ref=SymbolRef(text="data_z", kind="data",
                                         module="main", addr=2),
                      target_name=None, confidence="NONE", notes=""),
        ]
        self.assertEqual(collect_new_symbols_txt_lines(resolutions), {})


if __name__ == "__main__":
    unittest.main()
