"""Tests for tools/batch_sha1.py (q-toolbugs-evaporated).

Two bugs fixed here, both found and lost real batches before (brief
675/676): (1) the .c->.s suffix strip didn't handle the routing-tier
filenames (.thumb.c / .legacy.c / .legacy_sp3.c), which ABORTS a whole
batch the moment a bisect needs to revert one; (2) the bisector assumed
its revert target (.s) still physically exists, so a batch whose .s
files were already deleted misreported a FALSE "0 confirmed" across an
entirely correct batch instead of failing loud and specific.

Split like tests/test_emit_data_blob.py's own convention: pure suffix
logic needs no filesystem at all; the missing-revert-target check and
the candidate-resolution path it feeds are tested against a synthetic
temp tree with ROOT monkeypatched, never this repo's real config/src
trees. Neither of these needs a real ninja/wine/mwasm toolchain --
both fail (or the dry-run succeeds) entirely within the candidate-
resolution phase, before batch_sha1 ever shells out.
"""

from __future__ import annotations

import sys
import tempfile
import unittest
from pathlib import Path
from unittest import mock

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

import batch_sha1 as bs  # noqa: E402


# --------------------------------------------------------------------------- #
# Pure logic — .c -> .s suffix derivation, including the routing tiers
# --------------------------------------------------------------------------- #

class TestCToSRel(unittest.TestCase):
    def test_plain_c(self):
        self.assertEqual(bs._c_to_s_rel("src/main/func_X.c"), "src/main/func_X.s")

    def test_legacy_c(self):
        self.assertEqual(bs._c_to_s_rel("src/main/func_X.legacy.c"), "src/main/func_X.s")

    def test_legacy_sp3_c(self):
        self.assertEqual(bs._c_to_s_rel("src/main/func_X.legacy_sp3.c"), "src/main/func_X.s")

    def test_thumb_c(self):
        self.assertEqual(
            bs._c_to_s_rel("src/overlay004/func_ov004_021dbbc8.thumb.c"),
            "src/overlay004/func_ov004_021dbbc8.s",
        )

    def test_legacy_sp3_does_not_fall_through_to_legacy_c(self):
        # A naive ordered check (".legacy.c" before ".legacy_sp3.c") would
        # never match this filename against ".legacy.c" (it doesn't END
        # with that literal string) and would instead fall through to the
        # bare ".c" case, producing the wrong "func_X.legacy_sp3.s" --
        # pin the real fix's tuple ordering explicitly, not just its
        # observable output for one example.
        result = bs._c_to_s_rel("src/main/func_X.legacy_sp3.c")
        self.assertEqual(result, "src/main/func_X.s")
        self.assertNotEqual(result, "src/main/func_X.legacy_sp3.s")
        self.assertNotEqual(result, "src/main/func_X.legacy.s")

    def test_non_c_raises(self):
        with self.assertRaises(ValueError):
            bs._c_to_s_rel("src/main/func_X.s")


# --------------------------------------------------------------------------- #
# Missing revert-target detection (I/O — ROOT monkeypatched)
# --------------------------------------------------------------------------- #

class TestMissingRevertTargetError(unittest.TestCase):
    def test_none_when_s_file_exists(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            s_path = root / "src" / "main" / "func_X.s"
            s_path.parent.mkdir(parents=True)
            s_path.write_text("; original .s\n")
            with mock.patch.object(bs, "ROOT", root):
                err = bs._missing_revert_target_error("src/main/func_X.s", "src/main/func_X.c")
            self.assertIsNone(err)

    def test_precise_error_when_s_file_missing(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            with mock.patch.object(bs, "ROOT", root):
                err = bs._missing_revert_target_error("src/main/func_X.s", "src/main/func_X.c")
            self.assertIsNotNone(err)
            self.assertIn("Revert target missing", err)
            self.assertIn("src/main/func_X.s", err)
            self.assertIn("src/main/func_X.c", err)


# --------------------------------------------------------------------------- #
# main() candidate resolution — synthetic temp tree, no real toolchain
# (both scenarios below return before batch_sha1 ever shells out to ninja)
# --------------------------------------------------------------------------- #

class TestMainCandidateResolution(unittest.TestCase):
    def _make_tree(self, tmp: str, *, write_s_file: bool) -> Path:
        root = Path(tmp)
        (root / "build.ninja").write_text("")  # only existence is checked
        arm9_cfg = root / "config" / "eur" / "arm9"
        arm9_cfg.mkdir(parents=True)
        (arm9_cfg / "delinks.txt").write_text(
            "src/main/func_X.s:\n"
            "    complete\n"
            "    .text start:0x02000000 end:0x02000010\n"
        )
        src_main = root / "src" / "main"
        src_main.mkdir(parents=True)
        (src_main / "func_X.c").write_text("int func_X(void) { return 0; }\n")
        if write_s_file:
            (src_main / "func_X.s").write_text("; original .s\n")
        return root

    def test_missing_s_file_fails_loud_not_silent(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = self._make_tree(tmp, write_s_file=False)
            with mock.patch.object(bs, "ROOT", root):
                rc = bs.main(["eur", str(root / "src" / "main" / "func_X.c")])
            # Infra error (2), not "ran a bisect and reported 0 confirmed" (1).
            self.assertEqual(rc, 2)

    def test_present_s_file_resolves_and_dry_runs_clean(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = self._make_tree(tmp, write_s_file=True)
            with mock.patch.object(bs, "ROOT", root):
                rc = bs.main(["eur", str(root / "src" / "main" / "func_X.c"), "--dry-run"])
            self.assertEqual(rc, 0)
            # --dry-run must not touch delinks.txt or the .s file.
            self.assertTrue((root / "src" / "main" / "func_X.s").is_file())
            self.assertIn("src/main/func_X.s:", (root / "config" / "eur" / "arm9" / "delinks.txt").read_text())


if __name__ == "__main__":
    unittest.main()
