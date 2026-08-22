"""Tests for tools/batch_sha1.py (q-toolbugs-evaporated, q-toolbugs-round2).

Three bugs fixed here now, all found and lost real batches before
(briefs 675/676/682): (1) the .c->.s suffix strip didn't handle the
routing-tier filenames (.thumb.c / .legacy.c / .legacy_sp3.c), which
ABORTS a whole batch the moment a bisect needs to revert one; (2) the
bisector assumed its revert target (.s) still physically exists, so a
batch whose .s files were already deleted misreported a FALSE "0
confirmed" across an entirely correct batch instead of failing loud
and specific; (3) a delinks-flip-before-.s-removal race: a candidate's
.s sibling is REQUIRED to exist on disk (bug 2's own fix), but
configure.py adds an unconditional ninja build rule for every .c AND
every .s file it finds under src/ -- so the moment build.ninja is next
regenerated while both exist, ninja refuses to parse it at all
("multiple rules generate build/.../X.o", a CONFIGURATION fatal) and
the old code misreported that as a byte divergence and bisected
meaninglessly. Reproduced directly against the real tree before this
fix (not just in these tests): writing a throwaway src/main/
VBlankIntrWait.c beside its untouched, delinks-routed .s sibling and
running `python tools/configure.py eur` followed by `ninja -n` hit
exactly this error; deleting the .s WITHOUT reconfiguring left the
error in place (build.ninja is a static snapshot, ninja never rescans
the filesystem); reconfiguring afterward cleared it. That manual
recovery is what bug 3's fix automates for whichever candidate in a
batch triggers it.

Split like tests/test_emit_data_blob.py's own convention: pure suffix
logic needs no filesystem at all; the missing-revert-target check and
the candidate-resolution path it feeds are tested against a synthetic
temp tree with ROOT monkeypatched, never this repo's real config/src
trees. Neither of these needs a real ninja/wine/mwasm toolchain --
both fail (or the dry-run succeeds) entirely within the candidate-
resolution phase, before batch_sha1 ever shells out. Bug 3's tests
mock subprocess.run (both the `ninja sha1` and `configure.py` calls)
so they too need no real toolchain -- only the module's OWN
config-error-detection and self-heal control flow is under test.
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


# --------------------------------------------------------------------------- #
# ninja config-error detection (pure logic — must never fire on a real
# sha1 mismatch; sha1.py's own FAILED report carries no "ninja: error:"
# prefix, see tools/sha1.py)
# --------------------------------------------------------------------------- #

class TestNinjaConfigError(unittest.TestCase):
    def test_none_on_sha1_pass_output(self):
        output = "gx-spirit-caller_eur.nds: OK\n"
        self.assertIsNone(bs._ninja_config_error(output))

    def test_none_on_real_sha1_mismatch(self):
        # Exact shape of tools/sha1.py's own failure report -- must NOT be
        # mistaken for a ninja-level fatal.
        output = (
            "gx-spirit-caller_eur.nds: FAILED\n"
            "  expected: 1da50df7c210fae96dc69b3825554b9ce13b4f75\n"
            "  actual:   0000000000000000000000000000000000000000\n"
        )
        self.assertIsNone(bs._ninja_config_error(output))

    def test_detects_multiple_rules_generate(self):
        output = (
            "ninja: error: build.ninja:56206: multiple rules generate "
            "build/eur/src/main/VBlankIntrWait.o\n"
        )
        err = bs._ninja_config_error(output)
        self.assertIsNotNone(err)
        self.assertIn("multiple rules generate", err)

    def test_detects_other_ninja_fatals_too(self):
        # Not every ninja-level fatal is the specific stale-sibling shape
        # (e.g. a missing input) -- _ninja_config_error's job is only to
        # tell "ninja itself refused" apart from "sha1.py ran and found a
        # mismatch"; _correlate_stale_sibling is what narrows to the
        # specific self-healable case.
        output = "ninja: error: build.ninja:12: missing input 'src/main/foo.c'\n"
        self.assertIsNotNone(bs._ninja_config_error(output))


# --------------------------------------------------------------------------- #
# Expected object-path derivation + candidate correlation (pure logic)
# --------------------------------------------------------------------------- #

class TestExpectedSObjectRel(unittest.TestCase):
    def test_plain(self):
        self.assertEqual(
            bs._expected_s_object_rel("src/main/func_X.s", "eur"),
            "build/eur/src/main/func_X.o",
        )

    def test_overlay(self):
        self.assertEqual(
            bs._expected_s_object_rel("src/overlay004/func_ov004_021dbbc8.s", "usa"),
            "build/usa/src/overlay004/func_ov004_021dbbc8.o",
        )


def _make_candidate(c_rel: str, s_rel: str) -> bs.Candidate:
    return bs.Candidate(
        c_path=Path(c_rel), s_rel=s_rel, c_rel=c_rel, delinks_path=Path("delinks.txt"),
    )


class TestCorrelateStaleSibling(unittest.TestCase):
    def test_matches_the_right_candidate_in_a_batch(self):
        candidates = [
            _make_candidate("src/main/func_A.c", "src/main/func_A.s"),
            _make_candidate("src/main/func_B.c", "src/main/func_B.s"),
        ]
        config_error = (
            "ninja: error: build.ninja:1: multiple rules generate "
            "build/eur/src/main/func_B.o"
        )
        hit = bs._correlate_stale_sibling(config_error, candidates, "eur")
        self.assertIsNotNone(hit)
        self.assertEqual(hit.c_rel, "src/main/func_B.c")

    def test_none_for_a_stray_conflict_outside_the_batch(self):
        candidates = [_make_candidate("src/main/func_A.c", "src/main/func_A.s")]
        config_error = (
            "ninja: error: build.ninja:1: multiple rules generate "
            "build/eur/src/main/some_unrelated_func.o"
        )
        self.assertIsNone(bs._correlate_stale_sibling(config_error, candidates, "eur"))

    def test_none_when_error_is_not_multiple_rules_shape(self):
        candidates = [_make_candidate("src/main/func_A.c", "src/main/func_A.s")]
        config_error = "ninja: error: build.ninja:12: missing input 'src/main/foo.c'"
        self.assertIsNone(bs._correlate_stale_sibling(config_error, candidates, "eur"))

    def test_normalizes_backslash_paths(self):
        # ninja on Windows can report paths with backslashes.
        candidates = [_make_candidate("src/main/func_A.c", "src/main/func_A.s")]
        config_error = (
            r"ninja: error: build.ninja:1: multiple rules generate "
            r"build\eur\src\main\func_A.o"
        )
        hit = bs._correlate_stale_sibling(config_error, candidates, "eur")
        self.assertIsNotNone(hit)
        self.assertEqual(hit.c_rel, "src/main/func_A.c")


# --------------------------------------------------------------------------- #
# Displace / restore (I/O — ROOT monkeypatched, synthetic temp tree)
# --------------------------------------------------------------------------- #

class TestDisplaceRestoreStaleSibling(unittest.TestCase):
    def test_displace_then_restore_round_trips_exact_bytes(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            s_path = root / "src" / "main" / "func_X.s"
            s_path.parent.mkdir(parents=True)
            original = b"; original .s\r\n    bx lr\r\n"
            s_path.write_bytes(original)
            cand = _make_candidate("src/main/func_X.c", "src/main/func_X.s")

            with mock.patch.object(bs, "ROOT", root):
                displaced = bs._displace_stale_sibling(cand)
                self.assertTrue(displaced)
                self.assertFalse(s_path.is_file())
                self.assertEqual(cand.s_backup, original)

                bs._restore_stale_sibling(cand)
                self.assertTrue(s_path.is_file())
                self.assertEqual(s_path.read_bytes(), original)
                self.assertIsNone(cand.s_backup)

    def test_displace_is_a_noop_when_no_sibling_exists(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            cand = _make_candidate("src/main/func_X.c", "src/main/func_X.s")
            with mock.patch.object(bs, "ROOT", root):
                self.assertFalse(bs._displace_stale_sibling(cand))
                self.assertIsNone(cand.s_backup)

    def test_restore_is_a_noop_when_never_displaced(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            cand = _make_candidate("src/main/func_X.c", "src/main/func_X.s")
            with mock.patch.object(bs, "ROOT", root):
                bs._restore_stale_sibling(cand)  # must not raise
            self.assertIsNone(cand.s_backup)


class TestApplyRemovesStaleSiblings(unittest.TestCase):
    """q-batch-sha1-stale-s: applying a C candidate owns the sibling cleanup."""

    def _make_apply_tree(self, root: Path, c_rels: list[str]) -> list[bs.Candidate]:
        delinks = root / "config" / "eur" / "arm9" / "delinks.txt"
        delinks.parent.mkdir(parents=True)
        candidates: list[bs.Candidate] = []
        blocks: list[str] = []
        for index, c_rel in enumerate(c_rels):
            s_rel = bs._c_to_s_rel(c_rel)
            s_path = root / s_rel
            s_path.parent.mkdir(parents=True, exist_ok=True)
            s_path.write_bytes(f"; original {index}\r\n".encode())
            (root / c_rel).parent.mkdir(parents=True, exist_ok=True)
            (root / c_rel).write_text("int candidate(void) { return 0; }\n")
            blocks.append(f"{s_rel}:\n    complete\n")
            candidates.append(
                bs.Candidate(
                    c_path=Path(c_rel),
                    s_rel=s_rel,
                    c_rel=c_rel,
                    delinks_path=delinks,
                )
            )
        delinks.write_text("".join(blocks))
        return candidates

    def test_apply_removes_pre_restored_sibling_for_every_shipped_tier(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            c_rels = [
                "src/main/func_plain.c",
                "src/main/func_legacy.legacy.c",
                "src/main/func_sp3.legacy_sp3.c",
            ]
            with mock.patch.object(bs, "ROOT", root):
                candidates = self._make_apply_tree(root, c_rels)
                for candidate in candidates:
                    self.assertTrue(bs._apply_one(candidate))
                    self.assertFalse((root / candidate.s_rel).exists())
                    self.assertIsNotNone(candidate.s_backup)

    def test_apply_many_does_not_leave_a_partial_self_heal_tail(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            c_rels = [
                *(f"src/main/func_{index:02d}.c" for index in range(12)),
                "src/main/func_12.legacy.c",
                "src/main/func_13.legacy_sp3.c",
            ]
            with mock.patch.object(bs, "ROOT", root):
                candidates = self._make_apply_tree(root, c_rels)
                bs._apply_many(candidates)
                self.assertTrue(all(not (root / candidate.s_rel).exists() for candidate in candidates))


# --------------------------------------------------------------------------- #
# End-to-end self-heal through main() — subprocess.run mocked, so no real
# ninja/configure.py toolchain is needed; only batch_sha1's own control
# flow (apply -> detect config error -> displace -> reconfigure -> retry
# -> report) is under test.
# --------------------------------------------------------------------------- #

class TestMainSelfHeal(unittest.TestCase):
    def _make_tree(self, tmp: str) -> Path:
        root = Path(tmp)
        (root / "build.ninja").write_text("")
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
        (src_main / "func_X.s").write_text("; original .s\n")
        return root

    _CONFIG_ERROR = mock.Mock(
        returncode=1, stdout="",
        stderr=(
            "ninja: error: build.ninja:1: multiple rules generate "
            "build/eur/src/main/func_X.o\n"
        ),
    )
    _OK = mock.Mock(returncode=0, stdout="", stderr="")

    def test_self_heals_and_confirms(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = self._make_tree(tmp)
            s_path = root / "src" / "main" / "func_X.s"
            responses = [self._CONFIG_ERROR, self._OK, self._OK]
            with mock.patch.object(bs, "ROOT", root), \
                 mock.patch.object(bs.subprocess, "run", side_effect=responses):
                rc = bs.main(["eur", str(root / "src" / "main" / "func_X.c"), "--json"])
            self.assertEqual(rc, 0)
            # The stale .s sibling was actually removed as part of healing.
            self.assertFalse(s_path.is_file())
            # delinks.txt ends up routed to the .c (confirmed, stayed applied).
            self.assertIn(
                "src/main/func_X.c:",
                (root / "config" / "eur" / "arm9" / "delinks.txt").read_text(),
            )

    def test_unrelated_conflict_reverts_and_reports_infra_error(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = self._make_tree(tmp)
            s_path = root / "src" / "main" / "func_X.s"
            unrelated_error = mock.Mock(
                returncode=1, stdout="",
                stderr=(
                    "ninja: error: build.ninja:1: multiple rules generate "
                    "build/eur/src/main/some_other_func.o\n"
                ),
            )
            with mock.patch.object(bs, "ROOT", root), \
                 mock.patch.object(bs.subprocess, "run", side_effect=[unrelated_error]):
                rc = bs.main(["eur", str(root / "src" / "main" / "func_X.c")])
            self.assertEqual(rc, 2)
            # Nothing was touched: candidate reverted, .s sibling untouched.
            self.assertTrue(s_path.is_file())
            self.assertIn(
                "src/main/func_X.s:",
                (root / "config" / "eur" / "arm9" / "delinks.txt").read_text(),
            )

    def test_persistent_config_error_does_not_loop_forever(self):
        # Same candidate keeps colliding even after one healing attempt
        # (e.g. something external keeps re-creating the sibling) -- must
        # give up and report, not loop or silently bisect.
        with tempfile.TemporaryDirectory() as tmp:
            root = self._make_tree(tmp)
            responses = [self._CONFIG_ERROR, self._OK, self._CONFIG_ERROR]
            with mock.patch.object(bs, "ROOT", root), \
                 mock.patch.object(bs.subprocess, "run", side_effect=responses):
                rc = bs.main(["eur", str(root / "src" / "main" / "func_X.c")])
            self.assertEqual(rc, 2)
            # Exactly 3 subprocess calls: sha1 (fail), reconfigure, sha1
            # (fail again) -- then it must stop, not retry a 4th time.

    def test_real_mismatch_still_bisects_normally(self):
        # A genuine byte divergence (no "ninja: error:" prefix at all) must
        # still go through the ordinary bisect path, not be swallowed as
        # an infra error.
        with tempfile.TemporaryDirectory() as tmp:
            root = self._make_tree(tmp)
            real_fail = mock.Mock(
                returncode=1, stdout="",
                stderr="gx-spirit-caller_eur.nds: FAILED\n",
            )
            with mock.patch.object(bs, "ROOT", root), \
                 mock.patch.object(bs.subprocess, "run", side_effect=[real_fail]):
                rc = bs.main(["eur", str(root / "src" / "main" / "func_X.c")])
            # Single candidate, sha1 fails, bisect isolates it as the sole
            # culprit (no further subprocess calls needed for N=1) -> 1.
            self.assertEqual(rc, 1)


if __name__ == "__main__":
    unittest.main()
