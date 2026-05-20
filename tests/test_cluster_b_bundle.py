"""Unit tests for tools/cluster_b_bundle.py (brief 161 part 1).

The helper renders brief 152/155 bundles as `.s` source with
`.global` aliases at subsumed-placeholder offsets. The output
shape is consumed downstream by Pattern 3 chunks that emit
`.word <inner_placeholder>` references — a regression in the
emission shape would break the link-time symbol resolution
brief 161 part 2 ships. Pin:

  - canonical multi-alias output shape against a known fixture
    (the brief 161 worked example: `data_021017f0`).
  - input validation: bad anchor / empty words / oversized
    words / bad alias names / bad alias offsets.
  - round-trip invariant: emitted `.word` bytes equal the
    little-endian concatenation of `bundle_words`.
  - default-no-aliases path (degenerate `.s` rewrite of a
    bundle without inner symbols — useful for the optional
    Pattern 3 fall-back path).
  - alias-without-comment path keeps the output minimal.
"""

from __future__ import annotations

import re
import sys
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from cluster_b_bundle import (  # noqa: E402
    WORD_SIZE,
    BundleAlias,
    render_bundle_s,
)


# ---------------------------------------------------------------------- #
# Canonical worked-example fixture (brief 161 part 2 ships this exact
# rewrite from the brief 155 .c bundle).
# ---------------------------------------------------------------------- #

_CANONICAL_021017F0 = (
    "; Brief 161 part 2 — rewritten from brief 155 .c bundle so\n"
    "; subsumed `data_021017f4` exports for downstream Pattern 3\n"
    "; chunks (brief 158 collision fix).\n"
    "\n"
    "        .data\n"
    "\n"
    "        .global data_021017f0\n"
    "data_021017f0:\n"
    "        .word 0x00000000\n"
    "\n"
    "        .global data_021017f4\n"
    "data_021017f4:\n"
    "        .word 0x5f646970\n"
    "        .word 0x00000000\n"
)


class TestCanonicalWorkedExample(unittest.TestCase):

    def test_021017f0_matches_fixture(self):
        """The worked example renders to the fixture verbatim.

        Any drift here means brief 161 part 2's data_021017f0.s
        would also drift — flagging an emission-shape regression
        before the build pipeline notices."""
        text = render_bundle_s(
            anchor_name="data_021017f0",
            bundle_words=[0x00000000, 0x5f646970, 0x00000000],
            aliases=[BundleAlias("data_021017f4", 4)],
            comment_lines=[
                "Brief 161 part 2 — rewritten from brief 155 .c bundle so",
                "subsumed `data_021017f4` exports for downstream Pattern 3",
                "chunks (brief 158 collision fix).",
            ],
        )
        self.assertEqual(text, _CANONICAL_021017F0)


class TestEmissionShape(unittest.TestCase):

    def test_no_aliases_minimal_shape(self):
        # Degenerate case: bundle with no aliases. Used when an
        # existing `.c` bundle needs to be converted to `.s` for
        # extension reasons but has no inner placeholders to
        # export. Anchor still emitted.
        text = render_bundle_s(
            anchor_name="data_anchor",
            bundle_words=[0xDEADBEEF, 0xCAFE0042],
        )
        # No `;` comment block at top (no comment_lines).
        self.assertFalse(text.startswith(";"))
        # The anchor global + label + both words land.
        self.assertIn(".global data_anchor", text)
        self.assertIn("data_anchor:", text)
        self.assertIn(".word 0xdeadbeef", text)
        self.assertIn(".word 0xcafe0042", text)
        # NO inner alias lines.
        self.assertEqual(text.count(".global "), 1)

    def test_multiple_aliases_in_offset_order(self):
        # 4-word bundle with aliases at +4, +8, +12. Names use
        # distinctive (non-prefix-overlapping) leaves so the
        # substring index lookups below don't accidentally match
        # the anchor (`.global data_alpha` shares no prefix with
        # `.global data_zebra_4`, etc.).
        text = render_bundle_s(
            anchor_name="data_zebra_0",
            bundle_words=[0x11, 0x22, 0x33, 0x44],
            aliases=[
                BundleAlias("data_alpha", 4),
                BundleAlias("data_bravo", 8),
                BundleAlias("data_charlie", 12),
            ],
        )
        # 4 `.global`s (anchor + 3 aliases).
        self.assertEqual(text.count(".global "), 4)
        # 4 `.word`s.
        self.assertEqual(text.count(".word "), 4)
        # Order matters: globals interleave with words at the
        # correct offsets (each `.global` precedes its label,
        # which precedes that word's `.word`).
        idx_anchor = text.index(".global data_zebra_0")
        idx_a = text.index(".global data_alpha")
        idx_b = text.index(".global data_bravo")
        idx_c = text.index(".global data_charlie")
        self.assertLess(idx_anchor, idx_a)
        self.assertLess(idx_a, idx_b)
        self.assertLess(idx_b, idx_c)

    def test_tuple_aliases_normalised(self):
        # Aliases can be passed as plain (name, offset) tuples too
        # for caller convenience. Pin that both shapes produce the
        # same output.
        t1 = render_bundle_s(
            anchor_name="x",
            bundle_words=[0x1, 0x2],
            aliases=[BundleAlias("y", 4)],
        )
        t2 = render_bundle_s(
            anchor_name="x",
            bundle_words=[0x1, 0x2],
            aliases=[("y", 4)],
        )
        self.assertEqual(t1, t2)

    def test_round_trip_data_bytes(self):
        # Emitted `.word` directives must encode the same bytes
        # the original `unsigned int[N]` C bundle would have
        # emitted (little-endian). This is the round-trip
        # invariant that keeps 3-region SHA1 stable across the
        # .c → .s rewrite.
        words = [0x00000000, 0x5f646970, 0xdeadbeef, 0xcafe0042]
        text = render_bundle_s(
            anchor_name="data_bundle",
            bundle_words=words,
            aliases=[BundleAlias("data_inner", 8)],
        )
        # Re-extract every `.word 0x...` literal in emit order.
        emitted = [
            int(m.group(1), 16)
            for m in re.finditer(r"\.word 0x([0-9a-f]+)", text)
        ]
        self.assertEqual(emitted, words)

    def test_comment_block_renders(self):
        text = render_bundle_s(
            anchor_name="x",
            bundle_words=[0],
            comment_lines=["line one", "line two"],
        )
        self.assertIn("; line one", text)
        self.assertIn("; line two", text)
        # The blank-line comment renders as `;` alone — common
        # for paragraph separators inside the brief 125 generator
        # convention.
        text2 = render_bundle_s(
            anchor_name="x",
            bundle_words=[0],
            comment_lines=["only", "", "after blank"],
        )
        self.assertIn("; only", text2)
        self.assertIn(";\n", text2)
        self.assertIn("; after blank", text2)


# ---------------------------------------------------------------------- #
# Input validation
# ---------------------------------------------------------------------- #

class TestValidation(unittest.TestCase):

    def test_empty_anchor_raises(self):
        with self.assertRaisesRegex(ValueError, "anchor_name"):
            render_bundle_s(anchor_name="", bundle_words=[0])

    def test_invalid_anchor_chars_raise(self):
        # `+` is not a valid C identifier character.
        with self.assertRaisesRegex(ValueError, "anchor_name"):
            render_bundle_s(anchor_name="bad+name", bundle_words=[0])

    def test_empty_words_raises(self):
        with self.assertRaisesRegex(ValueError, "bundle_words"):
            render_bundle_s(anchor_name="x", bundle_words=[])

    def test_word_overflow_raises(self):
        # Values beyond unsigned 32-bit are rejected.
        with self.assertRaisesRegex(ValueError, "unsigned 32"):
            render_bundle_s(
                anchor_name="x", bundle_words=[0x1_0000_0000],
            )

    def test_alias_offset_zero_raises(self):
        # Offset 0 collides with the anchor (caller should use
        # the anchor name directly).
        with self.assertRaisesRegex(ValueError, "offset must be > 0"):
            render_bundle_s(
                anchor_name="x", bundle_words=[0, 0],
                aliases=[BundleAlias("y", 0)],
            )

    def test_alias_offset_exceeds_bundle_size(self):
        # 2-word bundle = 8 bytes. Offset 8 (end) is out of range.
        with self.assertRaisesRegex(ValueError, "must be < bundle_size"):
            render_bundle_s(
                anchor_name="x", bundle_words=[0, 0],
                aliases=[BundleAlias("y", 8)],
            )

    def test_alias_offset_not_word_aligned(self):
        # Offset 5 isn't a multiple of 4 — invalid label position.
        with self.assertRaisesRegex(ValueError, "multiple of"):
            render_bundle_s(
                anchor_name="x", bundle_words=[0, 0, 0],
                aliases=[BundleAlias("y", 5)],
            )

    def test_alias_name_collides_with_anchor(self):
        # Two `.global x:` definitions would be a link error;
        # catch at render time.
        with self.assertRaisesRegex(ValueError, "duplicates"):
            render_bundle_s(
                anchor_name="x", bundle_words=[0, 0],
                aliases=[BundleAlias("x", 4)],
            )

    def test_duplicate_alias_offsets_raise(self):
        # Two aliases at the same offset would emit two
        # `.global X:` directives at the same word — invalid.
        with self.assertRaisesRegex(ValueError, "same offset"):
            render_bundle_s(
                anchor_name="x", bundle_words=[0, 0, 0],
                aliases=[
                    BundleAlias("a", 4),
                    BundleAlias("b", 4),
                ],
            )

    def test_word_size_constant_is_4(self):
        # Sanity: the module's WORD_SIZE is the value the rest
        # of the codebase expects. Catches accidental constant
        # drift.
        self.assertEqual(WORD_SIZE, 4)


if __name__ == "__main__":
    unittest.main()
