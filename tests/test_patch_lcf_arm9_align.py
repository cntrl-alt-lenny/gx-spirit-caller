"""Unit tests for tools/patch_lcf_arm9_align.py.

PR #116's Fix A: rewrite `ALIGNALL(4)` to `ALIGNALL(2)` in the
`.arm9` segment of a dsd-generated arm9.lcf. This is load-bearing
for the brief 013 fix — without it, mwldarm honors ALIGNALL(4) from
the generated LCF and undoes the .o-level sh_addralign=2 patch at
link time, breaking every module's checksum.

Regressions here would re-trigger PR #115's fire. Pinning:

  - `.arm9` ALIGNALL gets rewritten 4 → 2
  - Other segments (`.itcm`, `.overlay_000`, ...) stay at 4
  - Idempotent — running twice is a no-op
  - Missing `.arm9` block → silent no-op, not a crash
  - Unbalanced braces → silent no-op (don't guess on malformed input)
  - Custom --target-alignall works
  - Multiple `ALIGNALL()` lines inside `.arm9` — only the first is
    rewritten (dsd only emits one, but docs the behaviour)
  - patch_file end-to-end (reads + writes) + graceful errors
"""

from __future__ import annotations

import sys
import tempfile
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from patch_lcf_arm9_align import (  # noqa: E402
    patch_file,
    patch_lcf_text,
)


# dsd's actual LCF shape, trimmed to the bits we care about.
#
# dsd emits segment headers in the `<name> : {` form (with a colon
# before the opening brace) — empirically verified against
# `build/eur/arm9.lcf` produced by `dsd lcf` at v0.11.0. The older
# bare-brace `<name> {` form surfaced in some dsd pre-releases; the
# patcher accepts both (PR #118), and we cover both forms below.
_CANONICAL_LCF = """\
SECTIONS {
    .arm9 : {
        ALIGNALL(4);
        .text : { *(.text) }
    }
    .itcm : {
        ALIGNALL(4);
        .text : { *(.text) }
    }
    .overlay_000 : {
        ALIGNALL(4);
        .text : { *(.text) }
    }
}
"""

# Older bare-brace variant. Kept as a regression-pin that the patcher's
# regex stays lenient — if someone tightens it back to colon-only, this
# fixture surfaces the break.
_CANONICAL_LCF_BARE_BRACE = """\
SECTIONS {
    .arm9 {
        ALIGNALL(4);
        .text : { *(.text) }
    }
    .itcm {
        ALIGNALL(4);
        .text : { *(.text) }
    }
    .overlay_000 {
        ALIGNALL(4);
        .text : { *(.text) }
    }
}
"""


class TestPatchLcfText(unittest.TestCase):
    def test_arm9_alignall_rewritten(self):
        patched, changed = patch_lcf_text(_CANONICAL_LCF)
        self.assertTrue(changed)
        # `.arm9` block now says ALIGNALL(2).
        self.assertIn(".arm9 : {\n        ALIGNALL(2);", patched)

    def test_other_segments_left_alone(self):
        patched, _ = patch_lcf_text(_CANONICAL_LCF)
        # Both .itcm and .overlay_000 still at ALIGNALL(4).
        self.assertIn(".itcm : {\n        ALIGNALL(4);", patched)
        self.assertIn(".overlay_000 : {\n        ALIGNALL(4);", patched)

    def test_idempotent(self):
        once, changed1 = patch_lcf_text(_CANONICAL_LCF)
        twice, changed2 = patch_lcf_text(once)
        self.assertTrue(changed1)
        self.assertFalse(changed2)
        self.assertEqual(once, twice)

    def test_missing_arm9_block_no_op(self):
        # A minimal LCF with no `.arm9` segment at all — e.g. a dev
        # delink or an overlay-only variant. No change, no crash.
        lcf = (
            "SECTIONS {\n"
            "    .itcm {\n"
            "        ALIGNALL(4);\n"
            "    }\n"
            "}\n"
        )
        patched, changed = patch_lcf_text(lcf)
        self.assertFalse(changed)
        self.assertEqual(patched, lcf)

    def test_unbalanced_braces_no_op(self):
        # Malformed LCF — never-closed `.arm9` block. Refuse to
        # guess; leave untouched and rely on the wider build to
        # surface the actual error.
        lcf = "SECTIONS {\n    .arm9 {\n        ALIGNALL(4);\n"
        patched, changed = patch_lcf_text(lcf)
        self.assertFalse(changed)
        self.assertEqual(patched, lcf)

    def test_custom_target_alignall(self):
        # --target-alignall 8 → .arm9 rewritten to ALIGNALL(8).
        patched, _ = patch_lcf_text(_CANONICAL_LCF, target_alignall=8)
        self.assertIn(".arm9 : {\n        ALIGNALL(8);", patched)

    def test_arm9_already_at_target_no_op(self):
        already_patched = _CANONICAL_LCF.replace(
            ".arm9 : {\n        ALIGNALL(4);",
            ".arm9 : {\n        ALIGNALL(2);",
            1,
        )
        patched, changed = patch_lcf_text(already_patched)
        self.assertFalse(changed)
        self.assertEqual(patched, already_patched)

    def test_only_first_alignall_in_arm9_rewritten(self):
        # A hypothetical LCF with two ALIGNALL entries in the .arm9
        # block (dsd doesn't emit this today). We only rewrite the
        # first to stay conservative — documented behaviour.
        lcf = (
            "SECTIONS {\n"
            "    .arm9 : {\n"
            "        ALIGNALL(4);\n"
            "        ALIGNALL(4);\n"
            "    }\n"
            "}\n"
        )
        patched, changed = patch_lcf_text(lcf)
        self.assertTrue(changed)
        # First occurrence rewritten, second preserved.
        count_2 = patched.count("ALIGNALL(2);")
        count_4 = patched.count("ALIGNALL(4);")
        self.assertEqual(count_2, 1)
        self.assertEqual(count_4, 1)

    def test_other_segments_with_4_would_not_get_rewritten(self):
        # Even if the raw regex over the whole file would match
        # other blocks, the scope-to-.arm9 walker must preserve
        # them. Sanity test.
        patched, _ = patch_lcf_text(_CANONICAL_LCF)
        # Count ALIGNALL(4) occurrences post-patch: should be 2
        # (itcm + overlay_000).
        self.assertEqual(patched.count("ALIGNALL(4);"), 2)
        # And exactly 1 ALIGNALL(2) (in .arm9).
        self.assertEqual(patched.count("ALIGNALL(2);"), 1)


class TestPatchFile(unittest.TestCase):
    def test_end_to_end_rewrite(self):
        with tempfile.TemporaryDirectory() as td:
            p = Path(td) / "arm9.lcf"
            p.write_text(_CANONICAL_LCF)
            rc = patch_file(p)
            self.assertEqual(rc, 0)
            after = p.read_text()
            self.assertIn(".arm9 : {\n        ALIGNALL(2);", after)
            self.assertIn(".itcm : {\n        ALIGNALL(4);", after)

    def test_already_patched_is_noop(self):
        with tempfile.TemporaryDirectory() as td:
            p = Path(td) / "arm9.lcf"
            already = _CANONICAL_LCF.replace(
                ".arm9 : {\n        ALIGNALL(4);",
                ".arm9 : {\n        ALIGNALL(2);",
                1,
            )
            p.write_text(already)
            rc = patch_file(p)
            self.assertEqual(rc, 0)
            self.assertEqual(p.read_text(), already)

    def test_missing_file_returns_error(self):
        with tempfile.TemporaryDirectory() as td:
            rc = patch_file(Path(td) / "nonexistent.lcf")
            self.assertEqual(rc, 1)


class TestBothHeaderForms(unittest.TestCase):
    """dsd has shipped both `.arm9 : {` (current) and `.arm9 {` (older)
    block headers across versions. PR #118's regex accepts either.
    These tests pin that leniency — if someone tightens the regex back
    to colon-only, or rewrites only the bare form, they break here."""

    def test_colon_form_matches_and_rewrites(self):
        # Real dsd v0.11+ shape.
        patched, changed = patch_lcf_text(_CANONICAL_LCF)
        self.assertTrue(changed)
        self.assertIn(".arm9 : {\n        ALIGNALL(2);", patched)

    def test_bare_brace_form_matches_and_rewrites(self):
        # Older dsd / alternate-template shape.
        patched, changed = patch_lcf_text(_CANONICAL_LCF_BARE_BRACE)
        self.assertTrue(changed)
        self.assertIn(".arm9 {\n        ALIGNALL(2);", patched)

    def test_both_forms_patch_only_arm9(self):
        # Whichever header form dsd emits, overlays must remain
        # ALIGNALL(4). Regression pin against an accidental global
        # rewrite.
        for fixture in (_CANONICAL_LCF, _CANONICAL_LCF_BARE_BRACE):
            patched, _ = patch_lcf_text(fixture)
            self.assertEqual(patched.count("ALIGNALL(2);"), 1)
            self.assertEqual(patched.count("ALIGNALL(4);"), 2)


if __name__ == "__main__":
    unittest.main()
