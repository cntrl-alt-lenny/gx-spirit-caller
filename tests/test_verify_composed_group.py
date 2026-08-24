"""Unit tests for tools/verify_composed_group.py.

The PURE layer (escaping, source rendering, objdump-output parsing,
pass/reject classification) is fully unit-tested here with real fixture
data captured from actual compiled objects — no build, no mwcc, no
subprocess. The one thing that genuinely requires the toolchain
(compile_and_inspect / verify_group's IMPURE half) is smoke-tested
separately and skipped when the compiler isn't available, matching how
this project's other toolchain-dependent test files handle CI without a
downloaded compiler.
"""
from __future__ import annotations

import sys
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT / "tools"))

from verify_composed_group import (  # noqa: E402
    Member,
    classify_group,
    escape_c_string,
    members_from_json,
    parse_data_sections,
    render_composed_c,
)


def _member(name: str, addr: int, size: int, content: bytes) -> Member:
    return Member(name=name, addr=addr, size=size, content=content)


# --------------------------------------------------------------------------- #
# escape_c_string / render_composed_c
# --------------------------------------------------------------------------- #

class TestEscapeCString(unittest.TestCase):
    def test_plain_ascii_unescaped(self):
        self.assertEqual(escape_c_string(b"hello"), "hello")

    def test_backslash_escaped(self):
        self.assertEqual(escape_c_string(b"a\\b"), "a\\\\b")

    def test_quote_escaped(self):
        self.assertEqual(escape_c_string(b'a"b'), 'a\\"b')

    def test_newline_and_tab_escaped(self):
        self.assertEqual(escape_c_string(b"a\nb\tc"), "a\\nb\\tc")


class TestRenderComposedC(unittest.TestCase):
    def test_one_declaration_per_member_in_order(self):
        members = [
            _member("data_a", 0x100, 8, b"foo\x00\x00\x00\x00\x00"),
            _member("data_b", 0x108, 8, b"bar\x00\x00\x00\x00\x00"),
        ]
        text = render_composed_c(members)
        lines = text.splitlines()
        self.assertEqual(lines[0], 'char data_a[8] = "foo";')
        self.assertEqual(lines[1], 'char data_b[8] = "bar";')

    def test_truncates_literal_at_first_null_not_full_content(self):
        # The array size carries the full padded length; the C literal
        # itself should only encode the string up to its terminator —
        # the compiler zero-pads the rest (verified separately by the
        # section-content check, not re-encoded here).
        members = [_member("data_a", 0x100, 12, b"hi\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00")]
        text = render_composed_c(members)
        self.assertEqual(text.strip(), 'char data_a[12] = "hi";')

    def test_content_with_no_null_uses_full_content(self):
        # Defensive: a member with no NUL anywhere (shouldn't occur for
        # real string candidates, which are always null-terminated) must
        # not crash -- falls back to the full content as the literal.
        members = [_member("data_a", 0x100, 4, b"abcd")]
        text = render_composed_c(members)
        self.assertEqual(text.strip(), 'char data_a[4] = "abcd";')


# --------------------------------------------------------------------------- #
# parse_data_sections — fixtures captured from real objdump output
# --------------------------------------------------------------------------- #

class TestParseDataSections(unittest.TestCase):
    def test_two_sections_simple_content(self):
        # Captured verbatim from `objdump -s -j .data` on a real
        # cm-restock-carve-11 composed object.
        text = (
            "file format elf32-littlearm\n\n"
            "Contents of section .data:\n"
            " 0000 7061636b 5f65665f 30305f6d 6174616e  pack_ef_00_matan\n"
            " 0010 6d2e6269 6e00                        m.bin.          \n"
            "Contents of section .data:\n"
            " 0000 7061636b 5f65665f 30305f74 6578616e  pack_ef_00_texan\n"
            " 0010 6d2e6269 6e00                        m.bin.\n"
        )
        sections = parse_data_sections(text)
        self.assertEqual(sections, [
            b"pack_ef_00_matanm.bin\x00",
            b"pack_ef_00_texanm.bin\x00",
        ])

    def test_embedded_single_space_in_ascii_repr_does_not_break_parsing(self):
        # The real torture case: a space (0x20) inside the string content
        # renders as a literal space in objdump's ASCII column, which
        # would break a naive whitespace-split. Captured from a real
        # compile of `char x[16] = "hello world!!!";`.
        text = (
            "Contents of section .data:\n"
            " 0000 68656c6c 6f20776f 726c6421 21210000  hello world!!!..\n"
        )
        sections = parse_data_sections(text)
        self.assertEqual(sections, [b"hello world!!!\x00\x00"])

    def test_embedded_multiple_consecutive_spaces(self):
        # Captured from a real compile of `char x[16] = "foo   bar baz!!";`
        # — three consecutive spaces in the ASCII column.
        text = (
            "Contents of section .data:\n"
            " 0000 666f6f20 20206261 72206261 7a212100  foo   bar baz!!.\n"
        )
        sections = parse_data_sections(text)
        self.assertEqual(sections, [b"foo   bar baz!!\x00"])

    def test_no_sections_found_returns_empty_list(self):
        self.assertEqual(parse_data_sections("nothing relevant here\n"), [])

    def test_three_sections_in_file_order(self):
        text = (
            "Contents of section .data:\n"
            " 0000 61616161 61000000                    aaaaa...\n"
            "Contents of section .data:\n"
            " 0000 62626262 62000000                    bbbbb...\n"
            "Contents of section .data:\n"
            " 0000 63636363 63000000                    ccccc...\n"
        )
        sections = parse_data_sections(text)
        self.assertEqual(sections, [b"aaaaa\x00\x00\x00", b"bbbbb\x00\x00\x00", b"ccccc\x00\x00\x00"])


# --------------------------------------------------------------------------- #
# classify_group — the actual pass/reject decision
# --------------------------------------------------------------------------- #

class TestClassifyGroup(unittest.TestCase):
    def test_mixed_sizes_rejected_before_any_compile_result_needed(self):
        members = [
            _member("a", 0x100, 8, b"foo\x00\x00\x00\x00\x00"),
            _member("b", 0x108, 12, b"barbaz\x00\x00\x00\x00\x00\x00"),
        ]
        result = classify_group(members, compiled_sections=None, compile_ok=False)
        self.assertEqual(result.verdict, "reject")
        self.assertIn("mixed sizes", result.reason)

    def test_compile_failure_rejected(self):
        members = [_member("a", 0x100, 8, b"foo\x00\x00\x00\x00\x00")]
        result = classify_group(members, compiled_sections=None, compile_ok=False)
        self.assertEqual(result.verdict, "reject")
        self.assertIn("compile failed", result.reason)

    def test_wrong_section_count_rejected(self):
        members = [
            _member("a", 0x100, 8, b"foo\x00\x00\x00\x00\x00"),
            _member("b", 0x108, 8, b"bar\x00\x00\x00\x00\x00"),
        ]
        # Only one section reported for two members -- shape mismatch.
        result = classify_group(members, compiled_sections=[b"foo\x00\x00\x00\x00\x00"],
                                compile_ok=True)
        self.assertEqual(result.verdict, "reject")
        self.assertIn("expected 2", result.reason)

    def test_content_mismatch_rejected(self):
        members = [
            _member("a", 0x100, 8, b"foo\x00\x00\x00\x00\x00"),
            _member("b", 0x108, 8, b"bar\x00\x00\x00\x00\x00"),
        ]
        # Sections present but in the WRONG order relative to declaration
        # -- exactly the reordering failure mode this tool exists to catch.
        result = classify_group(
            members,
            compiled_sections=[b"bar\x00\x00\x00\x00\x00", b"foo\x00\x00\x00\x00\x00"],
            compile_ok=True,
        )
        self.assertEqual(result.verdict, "reject")
        self.assertIn("content mismatch", result.reason)

    def test_matching_same_size_group_passes(self):
        members = [
            _member("a", 0x100, 8, b"foo\x00\x00\x00\x00\x00"),
            _member("b", 0x108, 8, b"bar\x00\x00\x00\x00\x00"),
            _member("c", 0x110, 8, b"baz\x00\x00\x00\x00\x00"),
        ]
        result = classify_group(
            members,
            compiled_sections=[m.content for m in members],  # exact match, in order
            compile_ok=True,
        )
        self.assertEqual(result.verdict, "pass")

    def test_size_matches_but_length_differs_is_still_a_mismatch(self):
        # Same declared size (8B) but the compiled section is a DIFFERENT
        # length than expected -- must not be silently treated as a size
        # coincidence.
        members = [_member("a", 0x100, 8, b"foo\x00\x00\x00\x00\x00")]
        result = classify_group(members, compiled_sections=[b"foo\x00\x00\x00\x00"],  # 7B not 8B
                                compile_ok=True)
        self.assertEqual(result.verdict, "reject")
        self.assertIn("size differs", result.reason)


# --------------------------------------------------------------------------- #
# members_from_json — the CLI's input shape
# --------------------------------------------------------------------------- #

class TestMembersFromJson(unittest.TestCase):
    def test_round_trips_hex_content(self):
        raw = [{"name": "data_a", "addr": 0x100, "size": 4, "bytes_hex": "666f6f00"}]
        members = members_from_json(raw)
        self.assertEqual(len(members), 1)
        self.assertEqual(members[0].name, "data_a")
        self.assertEqual(members[0].addr, 0x100)
        self.assertEqual(members[0].content, b"foo\x00")


# --------------------------------------------------------------------------- #
# End-to-end smoke test — real compiler, skipped if unavailable
# --------------------------------------------------------------------------- #

class TestVerifyGroupEndToEnd(unittest.TestCase):
    """Exercises the real IMPURE path (compile_and_inspect / verify_group)
    against the actual downloaded mwcc + objdump. Skips cleanly if the
    toolchain isn't present (matches this project's convention for
    toolchain-dependent tests — see asm_escape's own test skip pattern)."""

    @classmethod
    def setUpClass(cls):
        mwcc = ROOT / "tools" / "mwccarm" / "2.0" / "sp1p5" / "mwccarm.exe"
        objdump = ROOT / "tools" / "arm-none-eabi" / "bin" / "arm-none-eabi-objdump.exe"
        if not (mwcc.exists() and objdump.exists()):
            raise unittest.SkipTest("mwcc/objdump not downloaded in this environment")

    def test_real_n2_pair_from_carve11_verifies_as_pass(self):
        # A REAL pair this project already shipped and gated clean
        # (cm-restock-carve-11, data_020d9708 + data_020d971e) --
        # verify_group must classify it as pass.
        from verify_composed_group import verify_group
        members = [
            _member("carve12_test_pair_a", 0x020d9708, 22, b"e1125_d_lt_mdlanm.bin\x00"),
            _member("carve12_test_pair_b", 0x020d971e, 22, b"e1125_d_lt_matanm.bin\x00"),
        ]
        result = verify_group(members, version="eur")
        self.assertEqual(result.verdict, "pass", result.reason)

    def test_real_n3_same_size_group_can_reorder_and_gets_rejected(self):
        # Reproduces this wave's own discovery: an n>=3 same-size group
        # CAN have its declarations reordered by mwcc even with matching
        # sizes (distinct from -- and in addition to -- the n=2
        # differing-size wall cm-restock-carve-11 found). Confirmed by
        # hand before writing this test: this exact 3-member group
        # compiles with "apple" and "mango" swapped relative to
        # declaration order. Pinning the REJECT verdict (not just "some
        # verdict") so a future mwcc/flag change that silently starts
        # preserving order here doesn't go unnoticed either way -- if
        # this ever starts passing, that's real news about the
        # toolchain, not a reason to loosen the test.
        from verify_composed_group import verify_group
        members = [
            _member("carve12_test_triple_a", 0x100, 8, b"zebra\x00\x00\x00"),
            _member("carve12_test_triple_b", 0x108, 8, b"apple\x00\x00\x00"),
            _member("carve12_test_triple_c", 0x110, 8, b"mango\x00\x00\x00"),
        ]
        result = verify_group(members, version="eur")
        self.assertEqual(result.verdict, "reject", result.reason)
        self.assertIn("content mismatch", result.reason)


if __name__ == "__main__":
    unittest.main()
