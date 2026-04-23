"""Unit tests for tools/nitro_dict.py.

The header parser underpins the suggest-renames tool. If parsing
silently drops a function or misclassifies a signature, every
downstream rename recommendation gets polluted. Pinning:

  - parse_header across the common NitroSDK declaration shapes:
      void F(void)                           (0-arg void stub)
      int F(void)                            (scalar return)
      Type *F(args)                          (pointer return)
      void F(type (*cb)(u32), ...)           (function-pointer args)
      static inline F(...)                   (must be skipped)
      multi-line arg lists                    (must be joined)
  - _strip_comments removes block + line comments without eating
    line counts (used by the line-aware scanner)
  - _split_args respects nested parens in function-pointer arg types
  - _subsystem_for_name derives the canonical uppercase prefix
  - build_dictionary + walk_headers end-to-end against a synthetic
    NitroSDK fixture
  - query + stats slice the dictionary as expected
  - _load_dict rejects wrong schema versions
"""

from __future__ import annotations

import json
import sys
import tempfile
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from nitro_dict import (  # noqa: E402
    SCHEMA_VERSION,
    NitroFunction,
    _load_dict,
    _split_args,
    _strip_comments,
    _subsystem_for_name,
    build_dictionary,
    parse_header,
    query,
    stats,
    walk_headers,
)


# --------------------------------------------------------------------------- #
# Header fixture builder
# --------------------------------------------------------------------------- #


def _write_fixture(root: Path) -> Path:
    """Build a synthetic NitroSDK tree under `root` with a handful of
    representative headers. Returns the sdk-root path that should be
    passed to build_dictionary."""
    include = root / "include" / "nitro"
    (include / "os").mkdir(parents=True)
    (include / "os" / "emulator.h").write_text(
        "#ifndef NITRO_OS_EMULATOR_H\n"
        "#define NITRO_OS_EMULATOR_H\n"
        "#ifdef __cplusplus\n"
        'extern "C" {\n'
        "#endif\n"
        "\n"
        "/* Wait until the next VBlank interrupt fires. */\n"
        "void OS_WaitVBlankIntr(void);\n"
        "\n"
        "int OS_GetCurrentThreadPriority(void);\n"
        "\n"
        "/* Set up an IRQ handler with extra args. Multi-line\n"
        "   with a function-pointer middle arg. */\n"
        "void OS_SetIrqHandler(\n"
        "    u32 mask,\n"
        "    void (*handler)(u32),\n"
        "    void *userdata);\n"
        "\n"
        "static inline u32 OS_InlinedAccessor(u32 x) { return x + 1; }\n"
        "\n"
        "void OS_Reset(void);\n"
        "\n"
        "#ifdef __cplusplus\n"
        "}\n"
        "#endif\n"
        "#endif\n"
    )
    (include / "gx").mkdir()
    (include / "gx" / "gx.h").write_text(
        "#ifndef NITRO_GX_H\n"
        "#define NITRO_GX_H\n"
        "\n"
        "void GX_Init(void);\n"
        "\n"
        "void GX_LoadBG0Char(const void *src, u32 offset, u32 size);\n"
        "\n"
        "GXRgb *GX_AllocRgb(u32 nentries);\n"
        "\n"
        "#endif\n"
    )
    return root


# --------------------------------------------------------------------------- #
# Low-level helpers
# --------------------------------------------------------------------------- #


class TestStripComments(unittest.TestCase):
    def test_block_comment_preserves_newlines(self):
        src = "a\n/* hello\nworld */\nb"
        out = _strip_comments(src)
        # Block comment replaced by `\n` to preserve line positions.
        self.assertEqual(out.count("\n"), src.count("\n"))
        self.assertNotIn("hello", out)

    def test_line_comment(self):
        out = _strip_comments("int a; // comment\nint b;")
        self.assertNotIn("comment", out)
        self.assertIn("int a;", out)
        self.assertIn("int b;", out)

    def test_nested_comment_styles(self):
        src = "/* /* nested */ */  // then line"
        # Block comments in C don't nest; the first `*/` closes.
        out = _strip_comments(src).strip()
        self.assertNotIn("line", out)


class TestSubsystemForName(unittest.TestCase):
    def test_standard_prefix(self):
        self.assertEqual(_subsystem_for_name("OS_WaitVBlankIntr"), "OS")
        self.assertEqual(_subsystem_for_name("GX_LoadBG0Char"), "GX")
        self.assertEqual(_subsystem_for_name("FS_ReadFile"), "FS")

    def test_long_prefix(self):
        # NitroSDK has a handful of 3-4-letter subsystems (MB_, MBP_,
        # WVR_); allow up to 6 chars to be generous.
        self.assertEqual(_subsystem_for_name("WVR_Init"), "WVR")

    def test_no_prefix_is_misc(self):
        self.assertEqual(_subsystem_for_name("memcpy"), "misc")
        self.assertEqual(_subsystem_for_name("_sprintf"), "misc")


class TestSplitArgs(unittest.TestCase):
    def test_void(self):
        self.assertEqual(_split_args("void"), ["void"])

    def test_empty(self):
        self.assertEqual(_split_args(""), [])

    def test_simple(self):
        self.assertEqual(
            _split_args("int a, char *b, u32 c"),
            ["int a", "char *b", "u32 c"],
        )

    def test_nested_parens(self):
        # A function-pointer arg must stay as one arg; the inner `,`
        # isn't a top-level separator.
        self.assertEqual(
            _split_args("u32 mask, void (*cb)(u32, void *), void *userdata"),
            ["u32 mask", "void (*cb)(u32, void *)", "void *userdata"],
        )


# --------------------------------------------------------------------------- #
# parse_header
# --------------------------------------------------------------------------- #


class TestParseHeader(unittest.TestCase):
    def test_void_void(self):
        fns = parse_header("void OS_Reset(void);\n")
        self.assertEqual(len(fns), 1)
        fn = fns[0]
        self.assertEqual(fn.name, "OS_Reset")
        self.assertEqual(fn.return_type, "void")
        self.assertEqual(fn.arg_count, 0)
        self.assertEqual(fn.subsystem, "OS")

    def test_pointer_return(self):
        fns = parse_header("GXRgb *GX_AllocRgb(u32 n);\n")
        self.assertEqual(len(fns), 1)
        fn = fns[0]
        self.assertEqual(fn.name, "GX_AllocRgb")
        # Pointer stars survive reconstruction.
        self.assertIn("*", fn.return_type)
        self.assertEqual(fn.arg_count, 1)

    def test_function_pointer_arg(self):
        # The inner `)` on the function-pointer arg used to terminate
        # the outer regex prematurely. Regression check.
        fns = parse_header(
            "void OS_SetIrqHandler(u32 mask, "
            "void (*handler)(u32), void *userdata);\n"
        )
        self.assertEqual(len(fns), 1)
        fn = fns[0]
        self.assertEqual(fn.name, "OS_SetIrqHandler")
        self.assertEqual(fn.arg_count, 3)
        # The fp-arg stays as a single arg (comma inside `(u32)` ignored).
        self.assertEqual(len(fn.args), 3)
        self.assertIn("handler", fn.args[1])

    def test_multi_line_args_joined(self):
        fns = parse_header(
            "void OS_Multi(\n"
            "    u32 a,\n"
            "    u32 b,\n"
            "    u32 c);\n"
        )
        self.assertEqual(len(fns), 1)
        self.assertEqual(fns[0].arg_count, 3)

    def test_static_inline_skipped(self):
        fns = parse_header(
            "static inline u32 OS_Accessor(u32 x);\n"
            "void OS_ExternalFn(void);\n"
        )
        names = [f.name for f in fns]
        self.assertNotIn("OS_Accessor", names)
        self.assertIn("OS_ExternalFn", names)

    def test_preprocessor_lines_dropped(self):
        # Nothing inside a `#ifdef __cplusplus` / `#endif` guard should
        # parse — but the body between guards must still parse cleanly.
        fns = parse_header(
            "#ifdef __cplusplus\n"
            'extern "C" {\n'
            "#endif\n"
            "void OS_BoundedFn(void);\n"
            "#ifdef __cplusplus\n"
            "}\n"
            "#endif\n"
        )
        self.assertEqual([f.name for f in fns], ["OS_BoundedFn"])

    def test_multiple_in_one_header(self):
        fns = parse_header(
            "void OS_A(void);\n"
            "int OS_B(void);\n"
            "void OS_C(u32 x);\n"
        )
        self.assertEqual(
            [f.name for f in fns], ["OS_A", "OS_B", "OS_C"],
        )
        self.assertEqual(
            [f.arg_count for f in fns], [0, 0, 1],
        )


# --------------------------------------------------------------------------- #
# walk_headers + build_dictionary
# --------------------------------------------------------------------------- #


class TestWalkHeaders(unittest.TestCase):
    def test_prefers_nitro_subdir(self):
        with tempfile.TemporaryDirectory() as td:
            sdk = _write_fixture(Path(td))
            paths = walk_headers(sdk)
            # Both fixture headers discovered.
            names = {p.name for p in paths}
            self.assertEqual(names, {"emulator.h", "gx.h"})

    def test_falls_back_to_include_root(self):
        with tempfile.TemporaryDirectory() as td:
            sdk = Path(td)
            inc = sdk / "include"
            inc.mkdir(parents=True)
            (inc / "foo.h").write_text("void OS_Foo(void);\n")
            paths = walk_headers(sdk)
            self.assertEqual([p.name for p in paths], ["foo.h"])

    def test_no_include_dir_returns_empty(self):
        with tempfile.TemporaryDirectory() as td:
            self.assertEqual(walk_headers(Path(td)), [])


class TestBuildDictionary(unittest.TestCase):
    def test_end_to_end(self):
        with tempfile.TemporaryDirectory() as td:
            sdk = _write_fixture(Path(td))
            payload = build_dictionary(sdk)
        self.assertEqual(payload["version"], SCHEMA_VERSION)
        self.assertIn("functions", payload)
        names = [f["name"] for f in payload["functions"]]
        # Expected: OS_{WaitVBlankIntr, GetCurrentThreadPriority,
        # SetIrqHandler, Reset} + GX_{Init, LoadBG0Char, AllocRgb}
        # — 7 total, with static inline skipped.
        self.assertEqual(len(names), 7)
        self.assertIn("OS_WaitVBlankIntr", names)
        self.assertIn("OS_SetIrqHandler", names)
        self.assertIn("GX_AllocRgb", names)
        self.assertNotIn("OS_InlinedAccessor", names)

    def test_subsystems_assigned(self):
        with tempfile.TemporaryDirectory() as td:
            sdk = _write_fixture(Path(td))
            payload = build_dictionary(sdk)
        subs = {f["name"]: f["subsystem"] for f in payload["functions"]}
        self.assertEqual(subs["OS_WaitVBlankIntr"], "OS")
        self.assertEqual(subs["GX_AllocRgb"], "GX")

    def test_missing_sdk_raises(self):
        with tempfile.TemporaryDirectory() as td:
            # Empty directory — no include/ subdir.
            with self.assertRaises(FileNotFoundError):
                build_dictionary(Path(td))

    def test_dedup_across_headers(self):
        # Same function declared in two headers → only counted once.
        with tempfile.TemporaryDirectory() as td:
            sdk = Path(td)
            inc = sdk / "include" / "nitro" / "os"
            inc.mkdir(parents=True)
            (inc / "a.h").write_text("void OS_Shared(void);\n")
            (inc / "b.h").write_text("void OS_Shared(void);\n")
            payload = build_dictionary(sdk)
        names = [f["name"] for f in payload["functions"]]
        self.assertEqual(names.count("OS_Shared"), 1)


# --------------------------------------------------------------------------- #
# query + stats
# --------------------------------------------------------------------------- #


def _dict_payload_fixture() -> dict:
    return {
        "version": SCHEMA_VERSION,
        "source": "/fixture",
        "generated_at": "2026-04-22T00:00:00+00:00",
        "functions": [
            {"name": "OS_Reset", "return_type": "void", "args": ["void"],
             "arg_count": 0, "subsystem": "OS", "header": "os/a.h"},
            {"name": "OS_WaitVBlankIntr", "return_type": "void",
             "args": ["void"], "arg_count": 0,
             "subsystem": "OS", "header": "os/a.h"},
            {"name": "GX_Init", "return_type": "void", "args": ["void"],
             "arg_count": 0, "subsystem": "GX", "header": "gx/a.h"},
            {"name": "GX_AllocRgb", "return_type": "GXRgb *",
             "args": ["u32 n"], "arg_count": 1,
             "subsystem": "GX", "header": "gx/a.h"},
        ],
    }


class TestQuery(unittest.TestCase):
    def test_name_substring(self):
        p = _dict_payload_fixture()
        m = query(p, name_contains="VBlank")
        self.assertEqual([x["name"] for x in m], ["OS_WaitVBlankIntr"])

    def test_case_insensitive_substring(self):
        p = _dict_payload_fixture()
        m = query(p, name_contains="reset")
        self.assertEqual([x["name"] for x in m], ["OS_Reset"])

    def test_subsystem_filter(self):
        p = _dict_payload_fixture()
        m = query(p, subsystem="GX")
        self.assertCountEqual(
            [x["name"] for x in m], ["GX_Init", "GX_AllocRgb"],
        )

    def test_argcount_filter(self):
        p = _dict_payload_fixture()
        m = query(p, argcount=1)
        self.assertEqual([x["name"] for x in m], ["GX_AllocRgb"])

    def test_return_type_filter(self):
        p = _dict_payload_fixture()
        m = query(p, return_type="GXRgb *")
        self.assertEqual([x["name"] for x in m], ["GX_AllocRgb"])

    def test_combined_filters(self):
        p = _dict_payload_fixture()
        m = query(p, subsystem="OS", argcount=0)
        self.assertEqual(len(m), 2)


class TestStats(unittest.TestCase):
    def test_per_subsystem_counts(self):
        p = _dict_payload_fixture()
        s = stats(p)
        self.assertEqual(s, {"OS": 2, "GX": 2})


class TestLoadDict(unittest.TestCase):
    def test_missing_file_raises(self):
        with tempfile.TemporaryDirectory() as td:
            with self.assertRaises(FileNotFoundError):
                _load_dict(Path(td) / "nope.json")

    def test_schema_mismatch_raises(self):
        with tempfile.TemporaryDirectory() as td:
            p = Path(td) / "d.json"
            p.write_text(json.dumps({"version": 999, "functions": []}))
            with self.assertRaises(ValueError):
                _load_dict(p)


class TestNitroFunctionArgCount(unittest.TestCase):
    def test_void_means_zero(self):
        fn = NitroFunction("X", "void", ["void"])
        self.assertEqual(fn.arg_count, 0)

    def test_empty_means_zero(self):
        fn = NitroFunction("X", "void", [])
        self.assertEqual(fn.arg_count, 0)

    def test_real_args_counted(self):
        fn = NitroFunction("X", "void", ["u32 a", "int b"])
        self.assertEqual(fn.arg_count, 2)


if __name__ == "__main__":
    unittest.main()
