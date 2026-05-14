"""Unit tests for tools/port_external_source.py.

Brief 070 D1 (callee remap via .o reloc table) + skip-reason
taxonomy for D2/D3/D4 (deferred to follow-up PRs).

Pins the pure-function pieces — body extraction, substitution
ordering, skip-reason detection, output-path / delinks-entry
shape. The end-to-end `port_function` + `sweep_brief_068_csv`
have a wine + mwccarm + region-bin dependency that isn't
suitable for CI; cloud verifies those manually pre-push via the
smoke-test on brief 069 wave 1's candidate list (see PR
description).

Run locally:
    python -m unittest tests.test_port_external_source
"""

from __future__ import annotations

import sys
import tempfile
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from port_external_source import (  # noqa: E402
    PortRequest,
    PortResult,
    aggregate_skip_reasons,
    compute_delinks_entry,
    compute_output_path,
    detect_skip_reasons,
    extract_function_body,
    remap_callees_in_body,
)


# --------------------------------------------------------------------------- #
# Skip-reason taxonomy (D2 / D3 / D4 deferral signals)
# --------------------------------------------------------------------------- #


class TestDetectSkipReasons(unittest.TestCase):
    def test_data_ref_takes_precedence(self):
        # Data refs are the cleanest signal (we know them by name
        # from the reloc table) so they get checked first.
        body = "void f(void) { int x = 0; }"
        callees = []
        data_refs = ["OSi_TickCounter"]
        out = detect_skip_reasons(body, callees, data_refs)
        self.assertIsNotNone(out)
        self.assertEqual(out[0], "data-ref")
        self.assertIn("OSi_TickCounter", out[1])

    def test_struct_arrow_detected(self):
        body = "void f(Thread *t) { t->state = 1; }"
        out = detect_skip_reasons(body, [], [])
        self.assertIsNotNone(out)
        self.assertEqual(out[0], "struct-access")
        self.assertIn("->", out[1])

    def test_struct_dot_detected(self):
        body = "void f(void) { Thread t; t.state = 1; }"
        out = detect_skip_reasons(body, [], [])
        self.assertIsNotNone(out)
        self.assertEqual(out[0], "struct-access")

    def test_undefined_macro_detected(self):
        # ALL_CAPS macros like OS_CONSOLE_DEBUG
        body = ("void f(void) { volatile u32 *r = (void*)REG_CP_DIVCNT;"
                " *r = OS_CONSOLE_DEBUG; }")
        out = detect_skip_reasons(body, [], [])
        self.assertIsNotNone(out)
        self.assertEqual(out[0], "undefined-macro")
        self.assertIn(out[1], ("REG_CP_DIVCNT", "OS_CONSOLE_DEBUG"))

    def test_nitro_mmio_reg_macro_detected(self):
        # NitroSDK MMIO register convention: `reg_<UPPER>` with
        # lowercase prefix. Brief 069 wave 1's smoke test on
        # OS_GetTickLo surfaced this — without the `reg_` clause
        # the heuristic missed it and emitted an uncompilable
        # port.
        body = "u16 f(void) { return reg_OS_TM0CNT_L; }"
        out = detect_skip_reasons(body, [], [])
        self.assertIsNotNone(out)
        self.assertEqual(out[0], "undefined-macro")
        self.assertEqual(out[1], "reg_OS_TM0CNT_L")

    def test_reg_lowercase_prefix_strict(self):
        # Only `reg_<UPPER>` is treated as a macro family. A bare
        # local variable like `reg` shouldn't trip it.
        body = "void f(int reg) { reg = 1; }"
        out = detect_skip_reasons(body, [], [])
        self.assertIsNone(out)

    def test_clean_body_returns_none(self):
        body = ("void f(void) {\n"
                "    helper(1);\n"
                "    helper2();\n"
                "}\n")
        # callees would be returned by extract_functions; both are
        # in the callees list so they don't trigger macro
        # detection.
        out = detect_skip_reasons(body, ["helper", "helper2"], [])
        self.assertIsNone(out)

    def test_function_call_not_macro(self):
        # `OS_GetTick()` is a function call (callee), not a macro.
        # As long as `OS_GetTick` is in the callees list it should
        # be allowed.
        body = "u64 f(void) { return OS_GetTick(); }"
        out = detect_skip_reasons(body, ["OS_GetTick"], [])
        self.assertIsNone(out)

    def test_short_caps_ignored(self):
        # 3-char ALL_CAPS shouldn't trip the macro heuristic
        # (the regex requires 4+ chars).
        body = "void f(void) { OK; }"
        out = detect_skip_reasons(body, [], [])
        self.assertIsNone(out)

    def test_allowlist_macros_pass(self):
        # NULL / TRUE / FALSE are in the allowlist.
        body = "void *f(void) { return NULL; }"
        out = detect_skip_reasons(body, [], [])
        self.assertIsNone(out)
        body = "int f(void) { return TRUE; }"
        out = detect_skip_reasons(body, [], [])
        self.assertIsNone(out)

    def test_floating_point_literals_not_struct(self):
        # `1.0` shouldn't trip the struct-dot heuristic
        # (the regex requires letters on both sides of the dot).
        body = "float f(void) { return 1.0; }"
        out = detect_skip_reasons(body, [], [])
        self.assertIsNone(out)


# --------------------------------------------------------------------------- #
# Source body extraction
# --------------------------------------------------------------------------- #


class TestExtractFunctionBody(unittest.TestCase):
    def test_simple_function(self):
        src = ("u32 OS_GetTick(void) {\n"
               "    return OSi_TickCounter;\n"
               "}\n")
        result = extract_function_body(src, "OS_GetTick")
        self.assertIsNotNone(result)
        body, start, end = result
        self.assertIn("OS_GetTick", body)
        self.assertTrue(body.rstrip().endswith("}"))

    def test_skips_prototype(self):
        # The matcher must NOT pick up a declaration like
        # `void f(void);` — only definitions with `{`.
        src = ("void f(void);\n"
               "\n"
               "void f(void) {\n"
               "    return;\n"
               "}\n")
        result = extract_function_body(src, "f")
        self.assertIsNotNone(result)
        body, _start, _end = result
        # Body must include the actual definition, not the prototype
        self.assertIn("return", body)

    def test_nested_braces_balanced(self):
        src = ("void f(void) {\n"
               "    if (1) { do_x(); }\n"
               "    if (2) { do_y(); }\n"
               "}\n"
               "void g(void) {}\n")
        result = extract_function_body(src, "f")
        self.assertIsNotNone(result)
        body, _start, _end = result
        self.assertIn("do_x", body)
        self.assertIn("do_y", body)
        self.assertNotIn("void g", body)

    def test_missing_function_returns_none(self):
        src = "void other(void) {}"
        result = extract_function_body(src, "nonexistent")
        self.assertIsNone(result)


# --------------------------------------------------------------------------- #
# Callee remap (D1)
# --------------------------------------------------------------------------- #


class TestRemapCalleesInBody(unittest.TestCase):
    def test_basic_substitution(self):
        body = ("void OS_InitTick(void) {\n"
                "    OSi_CountUpTick();\n"
                "}\n")
        callees = ["OSi_CountUpTick"]
        index = {"OSi_CountUpTick": ("func_02093160", 0x02093160)}
        rewritten, remaps, unresolvable = remap_callees_in_body(
            body, callees, index,
        )
        self.assertIn("func_02093160", rewritten)
        self.assertNotIn("OSi_CountUpTick(", rewritten)
        self.assertEqual(remaps, {"OSi_CountUpTick": "func_02093160"})
        self.assertEqual(unresolvable, [])

    def test_unresolvable_callee_reported(self):
        body = "void f(void) { mystery(); }"
        callees = ["mystery"]
        out, remaps, unresolvable = remap_callees_in_body(
            body, callees, {},  # empty index
        )
        # No substitution because unresolvable
        self.assertIn("mystery()", out)
        self.assertEqual(remaps, {})
        self.assertEqual(unresolvable, ["mystery"])

    def test_longest_first_ordering(self):
        # `func` is a prefix of `func_helper`. Longest-first
        # ordering prevents `func` from being substituted inside
        # `func_helper`.
        body = "void caller(void) { func(); func_helper(); }"
        callees = ["func", "func_helper"]
        index = {
            "func": ("our_func", 0x1000),
            "func_helper": ("our_helper", 0x2000),
        }
        rewritten, _remaps, _ = remap_callees_in_body(
            body, callees, index,
        )
        # Both names get substituted to their distinct local names
        self.assertIn("our_func", rewritten)
        self.assertIn("our_helper", rewritten)
        # `our_helper` is not corrupted by a partial `func`→`our_func`
        # substitution (e.g. `our_func_helper`)
        self.assertNotIn("our_func_helper", rewritten)

    def test_word_boundary_strict(self):
        # `OS_Init` substitution should NOT rewrite `OS_InitTick`
        # (longest-first handles this correctly).
        body = "void f(void) { OS_Init(); OS_InitTick(); }"
        callees = ["OS_Init", "OS_InitTick"]
        index = {
            "OS_Init": ("local_init", 0x1000),
            "OS_InitTick": ("local_inittick", 0x2000),
        }
        rewritten, _remaps, _ = remap_callees_in_body(
            body, callees, index,
        )
        self.assertIn("local_init()", rewritten)
        self.assertIn("local_inittick()", rewritten)
        # No mangled `local_initTick` from a partial substitution
        self.assertNotIn("local_initTick", rewritten)


# --------------------------------------------------------------------------- #
# Output path + delinks shape
# --------------------------------------------------------------------------- #


class TestComputeOutputPath(unittest.TestCase):
    def test_routes_to_libs_nitro_legacy_c(self):
        with tempfile.TemporaryDirectory() as td:
            libs = Path(td) / "libs" / "nitro"
            out = compute_output_path("func_02093160",
                                       libs_root=libs)
            self.assertEqual(out, libs / "func_02093160.legacy.c")

    def test_named_function(self):
        with tempfile.TemporaryDirectory() as td:
            libs = Path(td) / "libs" / "nitro"
            out = compute_output_path("OS_GetTick", libs_root=libs)
            self.assertEqual(out, libs / "OS_GetTick.legacy.c")


class TestComputeDelinksEntry(unittest.TestCase):
    def test_format_matches_existing_convention(self):
        # The delinks.txt format we already use:
        #   libs/nitro/<func>.legacy.c:
        #       complete
        #       .text start:0x<addr> end:0x<addr+size>
        # We're using ROOT-relative paths; test via the
        # default LIBS_NITRO under the real project root.
        from port_external_source import LIBS_NITRO
        entry = compute_delinks_entry(
            "func_02093160", 0x02093160, 0x9c,
        )
        # Sanity: contains the right path, start, end
        self.assertIn(str(LIBS_NITRO.relative_to(
            LIBS_NITRO.parent.parent)) + "/func_02093160.legacy.c",
            entry)
        self.assertIn("complete", entry)
        self.assertIn("start:0x02093160", entry)
        # 0x02093160 + 0x9c = 0x020931fc
        self.assertIn("end:0x020931fc", entry)


# --------------------------------------------------------------------------- #
# Sweep aggregation
# --------------------------------------------------------------------------- #


class TestAggregateSkipReasons(unittest.TestCase):
    def _make_result(self, reason: str) -> tuple[PortRequest, PortResult]:
        req = PortRequest(
            repo="r", src_rel="s.c", upstream_func="f",
            our_region="eur", our_addr=0x1000, our_name=None,
        )
        res = PortResult(status="ok" if reason == "ok" else "refused",
                         reason=reason)
        return (req, res)

    def test_counts_by_reason(self):
        results = [
            self._make_result("ok"),
            self._make_result("ok"),
            self._make_result("struct-access"),
            self._make_result("struct-access"),
            self._make_result("data-ref"),
            self._make_result("undefined-macro"),
            self._make_result("callee-unresolvable"),
        ]
        counts = aggregate_skip_reasons(results)
        self.assertEqual(counts["ok"], 2)
        self.assertEqual(counts["struct-access"], 2)
        self.assertEqual(counts["data-ref"], 1)
        self.assertEqual(counts["undefined-macro"], 1)
        self.assertEqual(counts["callee-unresolvable"], 1)

    def test_empty_input(self):
        self.assertEqual(aggregate_skip_reasons([]), {})


# --------------------------------------------------------------------------- #
# External_obj augmentation (brief 070 D1+D4 — reloc table exposure)
# --------------------------------------------------------------------------- #


class TestExternalObjRelocs(unittest.TestCase):
    """The augmented ExternalFunc exposes per-function callee
    + data-ref names from the ELF reloc table. Brief 070 D1+D4
    rely on this; the sort-pair heuristic that tripped brief
    069 wave 1 dies here."""

    def test_relocref_dataclass_shape(self):
        from external_obj import RelocRef
        rr = RelocRef(offset=4, target="OS_GetTick", kind="func")
        self.assertEqual(rr.offset, 4)
        self.assertEqual(rr.target, "OS_GetTick")
        self.assertEqual(rr.kind, "func")

    def test_callee_names_filters_to_func_kind(self):
        from external_obj import ExternalFunc, RelocRef
        relocs = (
            RelocRef(offset=4, target="OSi_CountUpTick", kind="func"),
            RelocRef(offset=8, target="OSi_TickCounter", kind="data"),
            RelocRef(offset=16, target="OSi_CountUpTick", kind="func"),
        )
        f = ExternalFunc(
            name="OS_InitTick", section_index=1,
            bytes_=b"\x00" * 20, size=20,
            relocs=relocs,
        )
        # Distinct func names, sorted
        self.assertEqual(f.callee_names(), ["OSi_CountUpTick"])

    def test_data_refs_filters_to_data_kind(self):
        from external_obj import ExternalFunc, RelocRef
        relocs = (
            RelocRef(offset=4, target="OSi_CountUpTick", kind="func"),
            RelocRef(offset=8, target="OSi_TickCounter", kind="data"),
            RelocRef(offset=12, target="OSi_UseTick", kind="data"),
        )
        f = ExternalFunc(
            name="OS_InitTick", section_index=1,
            bytes_=b"\x00" * 20, size=20,
            relocs=relocs,
        )
        self.assertEqual(f.data_refs(),
                         ["OSi_TickCounter", "OSi_UseTick"])

    def test_empty_relocs_returns_empty_lists(self):
        from external_obj import ExternalFunc
        f = ExternalFunc(
            name="f", section_index=1,
            bytes_=b"\x00" * 4, size=4,
        )
        self.assertEqual(f.callee_names(), [])
        self.assertEqual(f.data_refs(), [])


if __name__ == "__main__":
    unittest.main()
