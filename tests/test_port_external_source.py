"""Unit tests for tools/port_external_source.py.

Brief 070 D1 (callee remap via .o reloc table) + skip-reason
taxonomy for D2/D3/D4 (deferred to follow-up PRs).

Pins the pure-function pieces — body extraction, substitution
ordering, skip-reason detection, output-path / delinks-entry
shape. The end-to-end `port_function` + `sweep_brief_068_csv`
have a wine + mwccarm + region-bin dependency that isn't
suitable for CI; scaffolder verifies those manually pre-push via the
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
    _COMPLETE_RANGES_CACHE,
    _VENDORED_CACHE,
    aggregate_skip_reasons,
    build_parallel_reloc_data_map,
    compute_delinks_entry,
    compute_output_path,
    detect_skip_reasons,
    extract_function_body,
    is_addr_complete,
    load_complete_ranges,
    load_vendored_identifiers,
    CalleeResolution,
    remap_callees_in_body,
    remap_data_refs_in_body,
)


# --------------------------------------------------------------------------- #
# Skip-reason taxonomy (D2 / D3 / D4 deferral signals)
# --------------------------------------------------------------------------- #


class TestDetectSkipReasons(unittest.TestCase):
    def test_data_ref_takes_precedence(self):
        # Pre-D4 behaviour: unresolved data refs refuse the port.
        # (D4 callers pass `data_resolved=True` after running the
        # parallel-reloc map, which skips this check.)
        body = "void f(void) { int x = 0; }"
        callees = []
        data_refs = ["OSi_TickCounter"]
        out = detect_skip_reasons(body, callees, data_refs)
        self.assertIsNotNone(out)
        self.assertEqual(out[0], "data-ref")
        self.assertIn("OSi_TickCounter", out[1])

    def test_data_resolved_skips_data_check(self):
        # When D4's parallel-reloc map has resolved the data refs,
        # the caller passes data_resolved=True and detect_skip_reasons
        # falls through to the struct + macro checks.
        body = "u32 f(void) { return OSi_TickCounter; }"
        out = detect_skip_reasons(
            body, [], ["OSi_TickCounter"], data_resolved=True,
        )
        self.assertIsNone(out)

    def test_struct_arrow_detected(self):
        # Default LIBS_NITRO doesn't vendor `Thread` so the
        # struct-access check refuses with the unvendored type
        # name in the detail.
        body = "void f(Thread *t) { t->state = 1; }"
        out = detect_skip_reasons(body, [], [])
        self.assertIsNotNone(out)
        self.assertEqual(out[0], "struct-access")
        self.assertIn("Thread", out[1])

    def test_struct_dot_detected(self):
        body = "void f(void) { Thread t; t.state = 1; }"
        out = detect_skip_reasons(body, [], [])
        self.assertIsNotNone(out)
        self.assertEqual(out[0], "struct-access")
        self.assertIn("Thread", out[1])

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


def _unique(name: str, addr: int) -> CalleeResolution:
    """Test helper: build a unique-match CalleeResolution."""
    return CalleeResolution(candidates=((name, addr),))


def _ambiguous(*candidates: tuple[str, int]) -> CalleeResolution:
    """Test helper: build an ambiguous-match CalleeResolution."""
    return CalleeResolution(candidates=tuple(candidates))


class TestRemapCalleesInBody(unittest.TestCase):
    def test_basic_substitution(self):
        body = ("void OS_InitTick(void) {\n"
                "    OSi_CountUpTick();\n"
                "}\n")
        callees = ["OSi_CountUpTick"]
        index = {"OSi_CountUpTick": _unique("func_02093160",
                                              0x02093160)}
        rewritten, remaps, unresolvable, ambiguous = (
            remap_callees_in_body(body, callees, index)
        )
        self.assertIn("func_02093160", rewritten)
        self.assertNotIn("OSi_CountUpTick(", rewritten)
        self.assertEqual(remaps, {"OSi_CountUpTick": "func_02093160"})
        self.assertEqual(unresolvable, [])
        self.assertEqual(ambiguous, {})

    def test_unresolvable_callee_reported(self):
        body = "void f(void) { mystery(); }"
        callees = ["mystery"]
        out, remaps, unresolvable, ambiguous = remap_callees_in_body(
            body, callees, {},  # empty index
        )
        # No substitution because unresolvable
        self.assertIn("mystery()", out)
        self.assertEqual(remaps, {})
        self.assertEqual(unresolvable, ["mystery"])
        self.assertEqual(ambiguous, {})

    def test_ambiguous_callee_reported(self):
        # D1 v2 (wave-2 follow-up): OS_UnlockCartridge had two
        # candidates in our pool at sim=1.0; the arbitrary-first
        # pick was wrong. Now reported as ambiguous → caller
        # refuses with `callee-ambiguous`.
        body = "void f(void) { OS_UnlockCartridge(); }"
        callees = ["OS_UnlockCartridge"]
        index = {
            "OS_UnlockCartridge": _ambiguous(
                ("func_02009800", 0x02009800),
                ("func_02009900", 0x02009900),
            ),
        }
        out, remaps, unresolvable, ambiguous = remap_callees_in_body(
            body, callees, index,
        )
        # No substitution applied for ambiguous candidates
        self.assertIn("OS_UnlockCartridge", out)
        self.assertEqual(remaps, {})
        self.assertEqual(unresolvable, [])
        self.assertIn("OS_UnlockCartridge", ambiguous)
        self.assertEqual(len(ambiguous["OS_UnlockCartridge"]), 2)

    def test_longest_first_ordering(self):
        body = "void caller(void) { func(); func_helper(); }"
        callees = ["func", "func_helper"]
        index = {
            "func": _unique("our_func", 0x1000),
            "func_helper": _unique("our_helper", 0x2000),
        }
        rewritten, _remaps, _, _ = remap_callees_in_body(
            body, callees, index,
        )
        self.assertIn("our_func", rewritten)
        self.assertIn("our_helper", rewritten)
        self.assertNotIn("our_func_helper", rewritten)

    def test_word_boundary_strict(self):
        body = "void f(void) { OS_Init(); OS_InitTick(); }"
        callees = ["OS_Init", "OS_InitTick"]
        index = {
            "OS_Init": _unique("local_init", 0x1000),
            "OS_InitTick": _unique("local_inittick", 0x2000),
        }
        rewritten, _remaps, _, _ = remap_callees_in_body(
            body, callees, index,
        )
        self.assertIn("local_init()", rewritten)
        self.assertIn("local_inittick()", rewritten)
        self.assertNotIn("local_initTick", rewritten)


class TestCalleeResolution(unittest.TestCase):
    """Dataclass invariants for the new CalleeResolution shape."""

    def test_empty_is_neither_unique_nor_ambiguous(self):
        r = CalleeResolution()
        self.assertFalse(r.is_unique)
        self.assertFalse(r.is_ambiguous)
        self.assertIsNone(r.primary)

    def test_single_candidate_is_unique(self):
        r = CalleeResolution(candidates=(("x", 0x100),))
        self.assertTrue(r.is_unique)
        self.assertFalse(r.is_ambiguous)
        self.assertEqual(r.primary, ("x", 0x100))

    def test_multiple_candidates_is_ambiguous(self):
        r = CalleeResolution(candidates=(
            ("x", 0x100), ("y", 0x200),
        ))
        self.assertFalse(r.is_unique)
        self.assertTrue(r.is_ambiguous)
        # primary returns None for ambiguous — caller must use
        # candidates explicitly
        self.assertIsNone(r.primary)


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
        # Sanity: contains the right path, start, end. The path is
        # in POSIX form (forward slashes) regardless of host —
        # `compute_delinks_entry` uses `Path.as_posix()` so the
        # checked-in `delinks.txt` convention is preserved across
        # Linux / macOS / Windows authors.
        expected_path = (
            LIBS_NITRO.relative_to(LIBS_NITRO.parent.parent).as_posix()
            + "/func_02093160.legacy.c"
        )
        self.assertIn(expected_path, entry)
        # And explicitly: no backslashes leak through on Windows.
        self.assertNotIn("\\", entry)
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


# --------------------------------------------------------------------------- #
# D2 / D3 — Vendored identifier scanner
# --------------------------------------------------------------------------- #


class TestLoadVendoredIdentifiers(unittest.TestCase):
    def _make_libs(self, headers: dict[str, str]) -> Path:
        """Build a synthetic libs/nitro/include/ tree."""
        tmp = Path(tempfile.mkdtemp())
        include = tmp / "include"
        for rel_path, content in headers.items():
            path = include / rel_path
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(content)
        # Clear cache so per-test fixtures don't bleed.
        _VENDORED_CACHE.clear()
        return tmp

    def test_macros_extracted(self):
        libs = self._make_libs({
            "nitro/types.h": (
                "#define BOOL int\n"
                "#define TRUE 1\n"
                "#define OS_CONSOLE_DEBUG 0x1\n"
            ),
        })
        macros, structs, enums = load_vendored_identifiers(libs)
        self.assertIn("BOOL", macros)
        self.assertIn("TRUE", macros)
        self.assertIn("OS_CONSOLE_DEBUG", macros)

    def test_typedefs_extracted_into_both_sets(self):
        # typedef'd names appear in both macros (for `#define`-like
        # source uses) and structs (for type-name source uses).
        libs = self._make_libs({
            "nitro/os.h": (
                "typedef struct OSi_Mutex OSMutex;\n"
                "typedef int OSi_BoolType;\n"
            ),
        })
        macros, structs, _ = load_vendored_identifiers(libs)
        self.assertIn("OSMutex", macros)
        self.assertIn("OSMutex", structs)
        self.assertIn("OSi_BoolType", structs)

    def test_struct_defs_extracted(self):
        libs = self._make_libs({
            "nitro/os.h": (
                "struct CardiCommon { int x; };\n"
                "union Foo { int x; char y; };\n"
            ),
        })
        _, structs, _ = load_vendored_identifiers(libs)
        self.assertIn("CardiCommon", structs)
        self.assertIn("Foo", structs)

    def test_enum_values_extracted(self):
        libs = self._make_libs({
            "nitro/os.h": (
                "enum OSArenaId {\n"
                "    OS_ARENA_MAIN = 0,\n"
                "    OS_ARENA_ITCM = 1,\n"
                "    OS_ARENA_DTCM = 2,\n"
                "};\n"
            ),
        })
        _, structs, enums = load_vendored_identifiers(libs)
        self.assertIn("OSArenaId", structs)
        self.assertIn("OS_ARENA_MAIN", enums)
        self.assertIn("OS_ARENA_ITCM", enums)

    def test_missing_libs_returns_empty_sets(self):
        tmp = Path(tempfile.mkdtemp())
        # No `include/` subdir → empty
        _VENDORED_CACHE.clear()
        macros, structs, enums = load_vendored_identifiers(tmp)
        self.assertEqual((len(macros), len(structs), len(enums)),
                         (0, 0, 0))


class TestVendoredAwareSkipReasons(unittest.TestCase):
    """detect_skip_reasons now consults vendored identifiers —
    macros and struct types that are in libs/nitro/include/
    don't trigger refusals."""

    def _make_libs_with_macros(self, *names: str) -> Path:
        tmp = Path(tempfile.mkdtemp())
        include = tmp / "include" / "nitro"
        include.mkdir(parents=True)
        defs = "".join(f"#define {n} 1\n" for n in names)
        (include / "stubs.h").write_text(defs)
        _VENDORED_CACHE.clear()
        return tmp

    def _make_libs_with_typedefs(self, *names: str) -> Path:
        tmp = Path(tempfile.mkdtemp())
        include = tmp / "include" / "nitro"
        include.mkdir(parents=True)
        defs = "".join(f"typedef int {n};\n" for n in names)
        (include / "types.h").write_text(defs)
        _VENDORED_CACHE.clear()
        return tmp

    def test_vendored_macro_not_refused(self):
        libs = self._make_libs_with_macros("OS_CONSOLE_DEBUG")
        body = "void f(void) { u32 x = OS_CONSOLE_DEBUG; }"
        out = detect_skip_reasons(body, [], [], libs_root=libs)
        self.assertIsNone(out)

    def test_unvendored_macro_still_refused(self):
        libs = self._make_libs_with_macros("OS_CONSOLE_DEBUG")
        body = "void f(void) { u32 x = OS_UNKNOWN_FLAG; }"
        out = detect_skip_reasons(body, [], [], libs_root=libs)
        self.assertIsNotNone(out)
        self.assertEqual(out[0], "undefined-macro")
        self.assertEqual(out[1], "OS_UNKNOWN_FLAG")

    def test_vendored_struct_type_allows_arrow_access(self):
        # `CardCommon` is vendored as a typedef → struct-access
        # check accepts `card->field` because CardCommon is in the
        # vendored struct-type set.
        libs = self._make_libs_with_typedefs("CardCommon")
        body = "void f(CardCommon *card) { card->lock = 1; }"
        out = detect_skip_reasons(body, [], [], libs_root=libs)
        self.assertIsNone(out)

    def test_unvendored_struct_type_still_refused(self):
        libs = self._make_libs_with_typedefs("CardCommon")
        body = "void f(Thread *t) { t->state = 1; }"
        out = detect_skip_reasons(body, [], [], libs_root=libs)
        self.assertIsNotNone(out)
        self.assertEqual(out[0], "struct-access")
        self.assertIn("Thread", out[1])


# --------------------------------------------------------------------------- #
# D4 — Data-ref remap via parallel-reloc map
# --------------------------------------------------------------------------- #


class TestRemapDataRefsInBody(unittest.TestCase):
    def test_basic_substitution(self):
        body = "u32 f(void) { return OSi_TickCounter; }"
        data_map = {"OSi_TickCounter": "data_020c3f48"}
        out = remap_data_refs_in_body(body, data_map)
        self.assertIn("data_020c3f48", out)
        self.assertNotIn("OSi_TickCounter", out)

    def test_empty_map_passthrough(self):
        body = "u32 f(void) { return 0; }"
        self.assertEqual(remap_data_refs_in_body(body, {}), body)

    def test_longest_first_for_overlapping_names(self):
        # `OSi_Tick` is a prefix of `OSi_TickCounter`. Longest-first
        # prevents wrong substitution.
        body = "u32 f(void) { return OSi_TickCounter + OSi_Tick; }"
        data_map = {
            "OSi_Tick": ("data_aaaa"),
            "OSi_TickCounter": ("data_bbbb"),
        }
        out = remap_data_refs_in_body(body, data_map)
        self.assertIn("data_aaaa", out)
        self.assertIn("data_bbbb", out)
        # `data_aaaa` is not nested inside `data_bbbb` from a partial match
        self.assertNotIn("data_aaaaCounter", out)

    def test_word_boundary_no_partial_match(self):
        body = "void f(void) { OSi_Tick(); OSi_TickPrefix; }"
        data_map = {"OSi_Tick": "data_xxx"}
        out = remap_data_refs_in_body(body, data_map)
        # `OSi_Tick(` (with paren) gets substituted because the
        # word boundary fires between `k` and `(`. That's fine —
        # the regex is correct.
        self.assertIn("data_xxx()", out)
        # `OSi_TickPrefix` is the same word from `OSi_Tick`'s
        # perspective — \b doesn't fire between `k` and `P`.
        # Verify it stays unchanged.
        self.assertIn("OSi_TickPrefix", out)


class TestBuildParallelRelocDataMap(unittest.TestCase):
    """The cross-project analogue of port_to_region's parallel-
    reloc data symbol map. Same invariant: byte-identical
    functions share offset+kind reloc structure; addresses differ
    per project. Tested via mocked region data."""

    def _make_external_func(self, name: str, size: int,
                            relocs: list):
        from external_obj import ExternalFunc
        return ExternalFunc(
            name=name, section_index=1,
            bytes_=b"\x00" * size, size=size,
            relocs=tuple(relocs),
        )

    def test_single_data_ref_mapped(self):
        from external_obj import RelocRef
        from unittest import mock
        ext = self._make_external_func("OS_GetTick", 0xb0, [
            RelocRef(offset=0x10, target="OSi_TickCounter", kind="data"),
        ])
        # Mock region data: at our address, offset 0x10 has a data
        # reloc pointing to addr 0x020c3f48 in module "main"; our
        # symbols.txt names that addr `data_020c3f48`.
        fake_relocs = {
            "main": {0x020930c0: [("arm-data", 0x020c3f48, "main")]},
        }
        fake_data_symbols = {0x020c3f48: "data_020c3f48"}
        with mock.patch("port_external_source._load_region_data",
                         return_value=(fake_relocs, fake_data_symbols)):
            mapping, unresolved = build_parallel_reloc_data_map(
                ext, "main", 0x020930b0, 0xb0, "eur",
            )
        self.assertEqual(mapping, {"OSi_TickCounter": "data_020c3f48"})
        self.assertEqual(unresolved, [])

    def test_unresolved_when_no_local_reloc_at_offset(self):
        from external_obj import RelocRef
        from unittest import mock
        ext = self._make_external_func("OS_GetTick", 0xb0, [
            RelocRef(offset=0x10, target="OSi_TickCounter", kind="data"),
        ])
        # Our local has no reloc at offset 0x10 — collision.
        fake_relocs = {"main": {}}
        fake_data_symbols = {}
        with mock.patch("port_external_source._load_region_data",
                         return_value=(fake_relocs, fake_data_symbols)):
            mapping, unresolved = build_parallel_reloc_data_map(
                ext, "main", 0x020930b0, 0xb0, "eur",
            )
        self.assertEqual(mapping, {})
        self.assertEqual(unresolved, ["OSi_TickCounter"])

    def test_unresolved_when_addr_not_in_symbols(self):
        from external_obj import RelocRef
        from unittest import mock
        ext = self._make_external_func("OS_GetTick", 0xb0, [
            RelocRef(offset=0x10, target="OSi_TickCounter", kind="data"),
        ])
        # Reloc exists but the target addr isn't in symbols.txt
        # (shouldn't happen in healthy config, but defensive).
        fake_relocs = {
            "main": {0x020930c0: [("arm-data", 0x99999999, "main")]},
        }
        fake_data_symbols = {0x020c3f48: "data_020c3f48"}
        with mock.patch("port_external_source._load_region_data",
                         return_value=(fake_relocs, fake_data_symbols)):
            mapping, unresolved = build_parallel_reloc_data_map(
                ext, "main", 0x020930b0, 0xb0, "eur",
            )
        self.assertEqual(mapping, {})
        self.assertEqual(unresolved, ["OSi_TickCounter"])

    def test_function_callees_ignored(self):
        from external_obj import RelocRef
        from unittest import mock
        ext = self._make_external_func("OS_InitTick", 0x9c, [
            # func kind — not D4's scope
            RelocRef(offset=0x20, target="OSi_CountUpTick", kind="func"),
            # data kind — D4 handles it
            RelocRef(offset=0x30, target="OSi_NeedResetTimer", kind="data"),
        ])
        # Local reloc at 0x020931f8 + 0x30 = 0x02093228
        fake_relocs = {
            "main": {0x02093228: [("arm-data", 0x020c3f4c, "main")]},
        }
        fake_data_symbols = {0x020c3f4c: "data_020c3f4c"}
        with mock.patch("port_external_source._load_region_data",
                         return_value=(fake_relocs, fake_data_symbols)):
            mapping, unresolved = build_parallel_reloc_data_map(
                ext, "main", 0x020931f8, 0x9c, "eur",
            )
        # Only the data reloc shows up — func reloc skipped
        self.assertEqual(mapping, {"OSi_NeedResetTimer": "data_020c3f4c"})

    def test_multiple_data_refs_at_different_offsets(self):
        from external_obj import RelocRef
        from unittest import mock
        ext = self._make_external_func("f", 0x40, [
            RelocRef(offset=0x10, target="OSi_A", kind="data"),
            RelocRef(offset=0x20, target="OSi_B", kind="data"),
            RelocRef(offset=0x30, target="OSi_C", kind="data"),
        ])
        # Our local has 3 data relocs at the matching offsets
        fake_relocs = {
            "main": {
                0x02000010: [("arm-data", 0x020c1000, "main")],
                0x02000020: [("arm-data", 0x020c2000, "main")],
                0x02000030: [("arm-data", 0x020c3000, "main")],
            },
        }
        fake_data_symbols = {
            0x020c1000: "data_020c1000",
            0x020c2000: "data_020c2000",
            0x020c3000: "data_020c3000",
        }
        with mock.patch("port_external_source._load_region_data",
                         return_value=(fake_relocs, fake_data_symbols)):
            mapping, _ = build_parallel_reloc_data_map(
                ext, "main", 0x02000000, 0x40, "eur",
            )
        self.assertEqual(mapping, {
            "OSi_A": "data_020c1000",
            "OSi_B": "data_020c2000",
            "OSi_C": "data_020c3000",
        })


class TestPortResultDataRemaps(unittest.TestCase):
    """PortResult exposes D4's data_remaps separately from D1's
    callee_remaps for downstream metrics aggregation."""

    def test_default_empty(self):
        res = PortResult(status="ok", reason="ok")
        self.assertEqual(res.data_remaps, {})

    def test_to_dict_includes_data_remaps(self):
        res = PortResult(
            status="ok", reason="ok",
            callee_remaps={"caller": "local_caller"},
            data_remaps={"OSi_X": "data_xxx"},
        )
        d = res.to_dict()
        self.assertIn("callee_remaps", d)
        self.assertIn("data_remaps", d)
        self.assertEqual(d["data_remaps"]["OSi_X"], "data_xxx")


# --------------------------------------------------------------------------- #
# Wave-1 follow-ups (PR #443): TU-collision pre-filter + ish-mismatch
# --------------------------------------------------------------------------- #


class TestLoadCompleteRanges(unittest.TestCase):
    """`load_complete_ranges` parses `delinks.txt` entries marked
    `complete` and returns their `.text` address ranges. Used by
    the sweep to skip already-claimed addresses early."""

    def _make_config(self, region: str, files: dict[str, str]) -> Path:
        tmp = Path(tempfile.mkdtemp())
        for rel, content in files.items():
            path = tmp / region / rel
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(content)
        return tmp

    def test_parses_single_complete_entry(self):
        from unittest import mock
        tmp = self._make_config("eur", {
            "arm9/delinks.txt": (
                "src/main/CpuSet.c:\n"
                "    complete\n"
                "    .text start:0x02000254 end:0x02000258\n"
            ),
        })
        _COMPLETE_RANGES_CACHE.clear()
        with mock.patch("port_external_source.CONFIG_DIR", tmp):
            ranges = load_complete_ranges("eur")
        self.assertEqual(ranges, ((0x02000254, 0x02000258),))

    def test_skips_incomplete_entries(self):
        # An entry without `complete` shouldn't contribute.
        from unittest import mock
        tmp = self._make_config("eur", {
            "arm9/delinks.txt": (
                "src/main/Done.c:\n"
                "    complete\n"
                "    .text start:0x02000100 end:0x02000110\n"
                "\n"
                "src/main/InProgress.c:\n"
                "    .text start:0x02000200 end:0x02000210\n"
            ),
        })
        _COMPLETE_RANGES_CACHE.clear()
        with mock.patch("port_external_source.CONFIG_DIR", tmp):
            ranges = load_complete_ranges("eur")
        self.assertEqual(ranges, ((0x02000100, 0x02000110),))

    def test_walks_overlays_and_subdirs(self):
        from unittest import mock
        tmp = self._make_config("eur", {
            "arm9/delinks.txt": (
                "src/main/A.c:\n"
                "    complete\n"
                "    .text start:0x02000000 end:0x02000010\n"
            ),
            "arm9/itcm/delinks.txt": (
                "src/itcm/B.c:\n"
                "    complete\n"
                "    .text start:0x01ff8000 end:0x01ff8010\n"
            ),
            "arm9/overlays/ov002/delinks.txt": (
                "src/overlay002/C.c:\n"
                "    complete\n"
                "    .text start:0x021a0000 end:0x021a0010\n"
            ),
        })
        _COMPLETE_RANGES_CACHE.clear()
        with mock.patch("port_external_source.CONFIG_DIR", tmp):
            ranges = load_complete_ranges("eur")
        self.assertIn((0x02000000, 0x02000010), ranges)
        self.assertIn((0x01ff8000, 0x01ff8010), ranges)
        self.assertIn((0x021a0000, 0x021a0010), ranges)

    def test_missing_region_returns_empty(self):
        from unittest import mock
        tmp = Path(tempfile.mkdtemp())
        _COMPLETE_RANGES_CACHE.clear()
        with mock.patch("port_external_source.CONFIG_DIR", tmp):
            ranges = load_complete_ranges("nonexistent")
        self.assertEqual(ranges, ())

    def test_dedup(self):
        # Same range in two different delinks.txt files → reported once.
        from unittest import mock
        tmp = self._make_config("eur", {
            "arm9/delinks.txt": (
                "src/A.c:\n"
                "    complete\n"
                "    .text start:0x02000000 end:0x02000010\n"
            ),
            "arm9/itcm/delinks.txt": (
                "src/B.c:\n"
                "    complete\n"
                "    .text start:0x02000000 end:0x02000010\n"
            ),
        })
        _COMPLETE_RANGES_CACHE.clear()
        with mock.patch("port_external_source.CONFIG_DIR", tmp):
            ranges = load_complete_ranges("eur")
        self.assertEqual(ranges, ((0x02000000, 0x02000010),))


class TestIsAddrComplete(unittest.TestCase):
    def test_addr_in_range(self):
        ranges = ((0x02000100, 0x02000200), (0x02001000, 0x02001100))
        self.assertTrue(is_addr_complete(0x02000150, ranges))
        self.assertTrue(is_addr_complete(0x02000100, ranges))  # start inclusive
        self.assertTrue(is_addr_complete(0x020010ff, ranges))

    def test_addr_at_end_exclusive(self):
        # `end` is exclusive (matches delinks.txt convention).
        ranges = ((0x02000100, 0x02000200),)
        self.assertFalse(is_addr_complete(0x02000200, ranges))

    def test_addr_outside(self):
        ranges = ((0x02000100, 0x02000200),)
        self.assertFalse(is_addr_complete(0x020000ff, ranges))
        self.assertFalse(is_addr_complete(0x02000300, ranges))

    def test_empty_ranges(self):
        self.assertFalse(is_addr_complete(0x02000000, ()))


class TestIshFieldOnExternalFunc(unittest.TestCase):
    """Brief 070 wave-1 follow-up: ExternalFunc exposes `ish`
    ("arm" / "thumb") so the port driver can refuse-fast on
    instruction-set mismatch. MI_Zero36B worked example."""

    def test_defaults_to_arm(self):
        from external_obj import ExternalFunc
        f = ExternalFunc(
            name="f", section_index=1,
            bytes_=b"\x00" * 4, size=4,
        )
        self.assertEqual(f.ish, "arm")

    def test_thumb_ish_settable(self):
        from external_obj import ExternalFunc
        f = ExternalFunc(
            name="f", section_index=1,
            bytes_=b"\x00" * 4, size=4,
            ish="thumb",
        )
        self.assertEqual(f.ish, "thumb")


# --------------------------------------------------------------------------- #
# Brief 077 — strip leading `static` from rewritten port body
# --------------------------------------------------------------------------- #


class TestStaticKeywordStrip(unittest.TestCase):
    """Brief 077: dsd-gap TUs are never static; preserving the
    keyword shifts mwldarm's symbol allocation and breaks
    layout. _compose_port_source strips leading `static` from
    the rewritten body before emitting the final source."""

    def _compose(self, body: str) -> str:
        from external_obj import ExternalFunc
        from port_external_source import (
            PortRequest, _compose_port_source,
        )
        req = PortRequest(
            repo="pokediamond",
            src_rel="arm9/lib/NitroSDK/src/OS_thread.c",
            upstream_func="OSi_IdleThreadProc",
            our_region="eur",
            our_addr=0x02007218,
            our_name="func_02007218",
        )
        ext_fn = ExternalFunc(
            name="OSi_IdleThreadProc",
            section_index=1,
            bytes_=b"\x00" * 0x18, size=0x18,
        )
        return _compose_port_source(
            body, "func_02007218", req, ext_fn, remaps={},
        )

    def test_static_qualifier_stripped(self):
        # Brief 074 wave 3 worked example: OSi_IdleThreadProc
        # was declared `static void OSi_IdleThreadProc(void) { ... }`
        # upstream. Driver pre-077 preserved the keyword;
        # mwldarm shifted allocation by 8 bytes.
        body = (
            "static void OSi_IdleThreadProc(void) {\n"
            "    while (1) {}\n"
            "}\n"
        )
        out = self._compose(body)
        # `static ` removed from the function-signature line
        self.assertNotIn("static void OSi", out)
        # The function body itself survives
        self.assertIn("void OSi_IdleThreadProc(void)", out)
        self.assertIn("while (1) {}", out)

    def test_local_scope_static_preserved(self):
        # `static int x = 0;` inside the function body MUST be
        # preserved — it has different semantics (file-scope
        # storage class for the local). count=1 + ^ anchor in
        # the regex ensures only the outer static is stripped.
        body = (
            "void counter(void) {\n"
            "    static int x = 0;\n"
            "    x++;\n"
            "}\n"
        )
        out = self._compose(body)
        # Local-scope static still there
        self.assertIn("static int x = 0;", out)
        # Function signature unchanged
        self.assertIn("void counter(void)", out)

    def test_no_static_no_change(self):
        # Non-static function passes through unchanged.
        body = (
            "void OSi_NotStatic(void) {\n"
            "    return;\n"
            "}\n"
        )
        out = self._compose(body)
        self.assertIn("void OSi_NotStatic(void)", out)
        self.assertNotIn("static void", out)

    def test_static_with_leading_whitespace_stripped(self):
        # Belt-and-suspenders: if the body has a leading newline
        # before `static`, the `^\s*` portion handles it. (In
        # practice the body extractor strips this, but defensive.)
        body = "\n    static void f(void) { return; }\n"
        out = self._compose(body)
        self.assertNotIn("static void f", out)
        self.assertIn("void f(void)", out)

    def test_static_in_inner_function_after_brace_preserved(self):
        # A nested static (e.g. inside an inline asm or a
        # second function defined after the first) MUST be
        # preserved — count=1 only strips the FIRST match,
        # which is the outermost function's signature.
        body = (
            "void outer(void) { return; }\n"
            "static void inner(void) { return; }\n"
        )
        out = self._compose(body)
        # The second `static` keyword is preserved because
        # ^\s*static\s+ only matches start-of-string.
        self.assertIn("static void inner", out)

    def test_static_inline_both_stripped(self):
        # Brief 077.b: pokediamond's NitroSDK has 9 `static
        # inline` functions (CARDi_*, _GX_OBJ_PTR, PXIi_*, …).
        # If any pass the byte-fingerprint match, the prior
        # `static` strip alone left `inline` behind — which
        # shifts mwldarm's symbol allocation the same way bare
        # static did. Both keywords stripped together.
        body = (
            "static inline BOOL CARDi_OnReadPageDirect"
            "(CARDRomStat *arg) {\n"
            "    return TRUE;\n"
            "}\n"
        )
        out = self._compose(body)
        self.assertNotIn("static inline", out)
        self.assertNotIn("inline BOOL", out)
        # Function body itself survives
        self.assertIn("BOOL CARDi_OnReadPageDirect", out)
        self.assertIn("return TRUE;", out)

    def test_static_inline_with_extra_whitespace(self):
        # `\s+` between static + inline tolerates multiple
        # spaces/tabs (some upstream sources do this).
        body = (
            "static  inline\tu32 foo(void) { return 0; }\n"
        )
        out = self._compose(body)
        # Both keywords stripped from the function signature.
        # (Note: "inline" string elsewhere — e.g. the wrapper
        # provenance comment — doesn't appear, so the global
        # assertNotIn is fine here.)
        self.assertNotIn("static", out)
        self.assertNotIn("inline", out)
        # Function signature preserved
        self.assertIn("u32 foo(void)", out)

    def test_bare_inline_without_static_preserved(self):
        # Defensive: pokediamond's NitroSDK has zero standalone
        # `inline foo(...)` at file scope (only `static inline`).
        # But IF a future upstream has bare `inline`, the
        # regex should NOT strip it — that's a different case
        # (linkage semantics differ). Confirmed by surveying
        # pokediamond NitroSDK src: zero bare-inline matches.
        body = (
            "inline void foo(void) { return; }\n"
        )
        out = self._compose(body)
        # Bare `inline` is NOT stripped by the regex
        # (which requires `static` first)
        self.assertIn("inline void foo", out)


if __name__ == "__main__":
    unittest.main()
