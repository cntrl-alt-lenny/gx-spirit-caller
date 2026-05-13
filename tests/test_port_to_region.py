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
    SYMBOL_RE,
    SymbolRef,
    Resolution,
    apply_substitutions,
    compute_output_path,
    infer_module_from_path,
    module_to_src_dir,
    parse_symbols_in_source,
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


if __name__ == "__main__":
    unittest.main()
