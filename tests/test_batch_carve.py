"""Tests for tools/batch_carve.py (brief 456).

The PURE logic (enumeration filter, delink-block formatting, newline guard,
dedup, overlap/size audit, bisect plan) is tested directly. The DRIVER
(classify→park, whole-function→park, gate→bisect, commit-on-pass) is tested
against a temp repo skeleton with a FAKE Ops that records git/gate actions
instead of shelling out — so the whole commit/reset/bisect path runs in CI with
no wine/ninja/git.

NEGATIVE tests (Verify-gate item 7 — shown red before trusting green):
a REFUSE candidate, a non-byte-identical candidate, and a candidate that
byte-verifies but FAILS the link gate are each PARKED, never committed; the
good carves around them still commit.
"""
from __future__ import annotations

import os
import sys
import tempfile
import unittest
from pathlib import Path
from unittest import mock

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

import batch_carve as bc  # noqa: E402
from batch_carve import (  # noqa: E402
    BatchCarver, Scope, audit, bisect_plan, carved_addrs, classify_refuse_kind,
    delink_block, filter_candidates, func_addr, newline_guard, parse_skiplist,
    parse_symbols, parse_symbol_addrs,
)


# --------------------------------------------------------------------------- #
# Pure helpers                                                                 #
# --------------------------------------------------------------------------- #

class TestPureHelpers(unittest.TestCase):
    SYMS = (
        "func_ov002_022a0000 kind:function(arm,size=0x80) addr:0x022a0000\n"
        "func_ov002_022a0100 kind:function(arm,size=0xc4) addr:0x022a0100\n"
        "func_ov002_021a0000 kind:function(arm,size=0x40) addr:0x021a0000\n"   # below min_addr
        "func_ov002_022a0200 kind:function(thumb,size=0x20) addr:0x022a0200\n"  # not arm -> skipped
    )

    def test_parse_symbols_arm_only(self):
        s = parse_symbols(self.SYMS)
        self.assertEqual(s["func_ov002_022a0000"], 0x80)
        self.assertEqual(s["func_ov002_022a0100"], 0xc4)
        self.assertNotIn("func_ov002_022a0200", s)   # thumb excluded

    def test_func_addr(self):
        self.assertEqual(func_addr("func_ov002_022a0100"), 0x022a0100)
        self.assertEqual(func_addr("func_021abcde"), 0x021abcde)

    def test_carved_addrs(self):
        d = "x.s:\n    complete\n    .text start:0x022a0000 end:0x022a0080\n"
        self.assertEqual(carved_addrs(d), {0x022a0000})

    def test_parse_skiplist(self):
        self.assertEqual(parse_skiplist("func_a reason here\n# c\n\nfunc_b\n"),
                         {"func_a", "func_b"})

    def test_filter_excludes_carved_skip_addr_size(self):
        syms = parse_symbols(self.SYMS)
        cands = filter_candidates(syms, carved={0x022a0000}, skips=set(),
                                  min_addr=0x02234000, min_size=0x81, max_size=0x100)
        # 022a0000 carved; 021a0000 below addr; 022a0200 thumb; only 022a0100 (0xc4) left
        self.assertEqual(cands, [(0xc4, "func_ov002_022a0100")])

    def test_filter_skips_skiplisted(self):
        syms = parse_symbols(self.SYMS)
        cands = filter_candidates(syms, carved=set(), skips={"func_ov002_022a0100"},
                                  min_addr=0x02234000, min_size=0x0, max_size=0x100)
        self.assertEqual([f for _, f in cands], ["func_ov002_022a0000"])

    def test_delink_block(self):
        b = delink_block("func_ov002_022a0100", 0x022a0100, 0xc4, "src/overlay002")
        self.assertEqual(
            b, "src/overlay002/func_ov002_022a0100.s:\n    complete\n"
               "    .text start:0x022a0100 end:0x022a01c4\n")

    def test_parse_symbol_addrs_drift_band(self):
        # A func NAMED for its nominal (EUR) address but living 0xF4 lower — the
        # USA/JPN main drift band (brief 483). The delink MUST use the real addr
        # (0x020a5fb4), not the name-derived one (0x020a60a8), or dsd places the
        # .s at the wrong location and the ROM sha1 gate fails.
        syms = ("func_020a60a8 kind:function(arm,size=0x18) addr:0x020a5fb4\n"  # name != addr
                "func_020943b0 kind:function(arm,size=0x1c) addr:0x020943b0\n")  # name == addr
        addrs = parse_symbol_addrs(syms)
        self.assertEqual(addrs["func_020a60a8"], 0x020a5fb4)   # real, not 0x020a60a8
        self.assertNotEqual(addrs["func_020a60a8"], func_addr("func_020a60a8"))
        self.assertEqual(addrs["func_020943b0"], func_addr("func_020943b0"))  # unchanged
        b = delink_block("func_020a60a8", addrs["func_020a60a8"], 0x18, "src/jpn/main")
        self.assertIn(".text start:0x020a5fb4 end:0x020a5fcc", b)
        self.assertNotIn("0x020a60a8", b)   # the buggy name-derived placement is gone

    def test_newline_guard(self):
        self.assertEqual(newline_guard("a\n    .text end:0x1"), "a\n    .text end:0x1\n")
        self.assertEqual(newline_guard("a\n"), "a\n")
        self.assertEqual(newline_guard(""), "")

    def test_audit_clean(self):
        d = (delink_block("func_ov002_022a0000", 0x022a0000, 0x80, "src/overlay002")
             + delink_block("func_ov002_022a0100", 0x022a0100, 0xc4, "src/overlay002"))
        syms = {"func_ov002_022a0000": 0x80, "func_ov002_022a0100": 0xc4}
        self.assertEqual(audit(d, syms), [])

    def test_audit_detects_overlap(self):
        d = (delink_block("func_ov002_022a0000", 0x022a0000, 0x200, "src/overlay002")
             + delink_block("func_ov002_022a0100", 0x022a0100, 0xc4, "src/overlay002"))
        probs = audit(d, {})
        self.assertTrue(any("overlap" in p for p in probs))

    def test_audit_detects_size_mismatch(self):
        d = delink_block("func_ov002_022a0000", 0x022a0000, 0x80, "src/overlay002")
        probs = audit(d, {"func_ov002_022a0000": 0x90})   # symbols say 0x90, delink 0x80
        self.assertTrue(any("size mismatch" in p for p in probs))

    def test_audit_detects_concatenation(self):
        # the b450 bug: a block fused onto the previous end line
        d = "    .text start:0x022a0000 end:0x022a0080src/overlay002/func_ov002_022a0100.s:\n"
        self.assertTrue(any("concatenated" in p for p in audit(d, {})))

    def test_bisect_plan(self):
        self.assertEqual(bisect_plan([1, 2, 3, 4]), [[1, 2], [3, 4]])
        self.assertEqual(bisect_plan([1]), [])
        self.assertEqual(bisect_plan([]), [])


# --------------------------------------------------------------------------- #
# branch_guard_message (brief 561 safety flag: batch_carve auto-commits, so   #
# an unattended launch on main/detached-at-main must refuse, not carve)       #
# --------------------------------------------------------------------------- #

class TestBranchGuard(unittest.TestCase):
    def test_refuses_on_main(self):
        msg = bc.branch_guard_message("main", False, force=False)
        self.assertIsNotNone(msg)
        self.assertIn("main", msg)

    def test_refuses_on_detached_at_origin_main(self):
        msg = bc.branch_guard_message("HEAD", True, force=False)
        self.assertIsNotNone(msg)
        self.assertIn("detached", msg)

    def test_allows_work_branch(self):
        self.assertIsNone(bc.branch_guard_message("claude/foundation-561", False, force=False))

    def test_allows_detached_elsewhere(self):
        # detached, but NOT at origin/main's tip (e.g. mid-rebase, pinned commit)
        self.assertIsNone(bc.branch_guard_message("HEAD", False, force=False))

    def test_force_bypasses_main(self):
        self.assertIsNone(bc.branch_guard_message("main", False, force=True))

    def test_force_bypasses_detached_at_origin_main(self):
        self.assertIsNone(bc.branch_guard_message("HEAD", True, force=True))


# --------------------------------------------------------------------------- #
# classify_refuse_kind (brief 545: routes purely-C-absorbed REFUSEs through   #
# --allow-absorbed-offset instead of the classify()-time park; genuine walls  #
# — OFFSET/MISADDRESSED/under-defined B-gap — must stay parked immediately)   #
# --------------------------------------------------------------------------- #

class TestClassifyRefuseKind(unittest.TestCase):
    # Real asm_escape --classify-data shapes (brief 406's 5-verdict printer),
    # not synthetic strings -- these are the exact per-ref two-line blocks
    # `preflight_data_refs` emits.
    _OK_ALIGNED = (
        "  data-ref data_ov006_021ce530 @0x021ce530: A-aligned (ok) "
        "[src/usa/overlay006/data/data_ov006_021ce530.s]\n"
        "      symbol-aligned carved TU defines the global; .extern links\n")
    _ABSORBED = (
        "  data-ref data_ov006_021ce788 @0x021ce788: C-absorbed (REFUSE) "
        "[src/usa/overlay006/data/data_ov006_021ce530.s]\n"
        "      absorbed into bundle TU (base data_ov006_021ce530); data_… has "
        "NO linkable definition -> mwldarm Undefined (brief 361 class)\n")
    _ABSORBED_2 = (
        "  data-ref data_ov006_021ce9f0 @0x021ce9f0: C-absorbed (REFUSE) "
        "[src/usa/overlay006/data/data_ov006_021ce9e4.s]\n"
        "      absorbed into bundle TU (base data_ov006_021ce9e4); data_… has "
        "NO linkable definition -> mwldarm Undefined (brief 361 class)\n")
    _OFFSET = (
        "  data-ref data_ov002_02211fb0 @0x02211fb4: OFFSET (REFUSE) "
        "[src/overlay002/data/data_ov002_02211fac.s]\n"
        "      pool word targets data_ov002_02211fb0+0x4; emit_asm drops the "
        "addend -> silent corruption caught only at sha1. Unsupported\n")
    _MISADDRESSED = (
        "  data-ref data_ov002_02220000 @0x02220000: MISADDRESSED (REFUSE) "
        "[src/overlay002/data/data_ov002_02220000.s]\n"
        "      carve range 0x02220000..0x02220010 starts at no data symbol "
        "— mis-sized/mis-addressed data carve\n")
    _BGAP_UNDEFINED = (
        "  data-ref data_ov002_02230000 @0x02230000: B-gap (REFUSE) "
        "[]\n"
        "      classified B-gap but NO gap object defines the symbol — "
        "unlinkable (absorbed without a symbols.txt carve?)\n")
    _TRAILER_REFUSED = ("func_x: ❌ kind:data preflight REFUSED — the carve "
                        "would not link (or would mislink). Do not ship; "
                        "see verdicts above.\n")

    def test_pure_c_absorbed_single_ref(self):
        out = self._OK_ALIGNED + self._ABSORBED + self._TRAILER_REFUSED
        self.assertEqual(classify_refuse_kind(out), "absorbed")

    def test_pure_c_absorbed_multi_ref(self):
        # func_ov006_021c81a0 shape (brief 541): two C-absorbed refs, no
        # other REFUSE-tagged line -- still fully recoverable.
        out = self._OK_ALIGNED + self._ABSORBED + self._ABSORBED_2 + self._TRAILER_REFUSED
        self.assertEqual(classify_refuse_kind(out), "absorbed")

    def test_mixed_c_absorbed_and_offset_is_a_wall(self):
        out = self._ABSORBED + self._OFFSET + self._TRAILER_REFUSED
        self.assertEqual(classify_refuse_kind(out), "wall")

    def test_pure_offset_is_a_wall(self):
        out = self._OFFSET + self._TRAILER_REFUSED
        self.assertEqual(classify_refuse_kind(out), "wall")

    def test_pure_misaddressed_is_a_wall(self):
        out = self._MISADDRESSED + self._TRAILER_REFUSED
        self.assertEqual(classify_refuse_kind(out), "wall")

    def test_undefined_b_gap_is_a_wall_not_absorbed(self):
        # B-gap CAN be REFUSE-tagged (the gap object doesn't actually define
        # the symbol) -- a different unlinkable shape than C-absorbed, and
        # --allow-absorbed-offset has no mechanism for it.
        out = self._BGAP_UNDEFINED + self._TRAILER_REFUSED
        self.assertEqual(classify_refuse_kind(out), "wall")

    def test_ok_lines_do_not_affect_the_verdict(self):
        # Multiple ok A-aligned/B-gap refs alongside the one C-absorbed
        # REFUSE -- only the REFUSE-tagged lines should matter.
        out = self._OK_ALIGNED * 3 + self._ABSORBED + self._TRAILER_REFUSED
        self.assertEqual(classify_refuse_kind(out), "absorbed")

    def test_no_refuse_lines_conservatively_a_wall(self):
        # Garbled/unexpected output (e.g. a traceback) -- same safe default
        # as today's "unknown output -> conservative park".
        self.assertEqual(classify_refuse_kind(""), "wall")
        self.assertEqual(classify_refuse_kind("Traceback (most recent call last):\n...\n"),
                         "wall")


# --------------------------------------------------------------------------- #
# Platform-specific Ops paths                                                  #
# --------------------------------------------------------------------------- #

class TestOpsPlatformPaths(unittest.TestCase):
    def test_windows_skips_posix_process_tools(self):
        ops = bc.Ops("eur", platform="win32")
        with mock.patch.object(bc.subprocess, "run") as run:
            ops._kill_orphans()
            ops._wait_wine_quiet(max_wait=0)
        run.assert_not_called()

    def test_windows_python_subprocesses_use_current_interpreter(self):
        ops = bc.Ops("eur", platform="win32")
        calls: list[list[str]] = []

        def fake_run(cmd, timeout=None):
            calls.append(cmd)
            stdout = ""
            if "--classify-data" in cmd:
                stdout = "clean"
            elif "--whole-function" in cmd:
                stdout = "byte-identical"
            elif cmd == ["ninja", "sha1"]:
                stdout = "gx-spirit-caller_eur.nds: OK"
            return mock.Mock(returncode=0, stdout=stdout, stderr="")

        with mock.patch.object(ops, "_run", side_effect=fake_run):
            self.assertEqual(ops.classify("func_02000000"), "clean")
            self.assertEqual(
                ops.whole_function("func_02000000", "unused-output.s"),
                "pass",
            )
            ops.sort_delinks("config/eur/arm9/delinks.txt")
            self.assertTrue(ops.gate())

        python_scripts = [
            (cmd[0], cmd[1])
            for cmd in calls
            if len(cmd) > 1 and cmd[1].startswith("tools/")
        ]
        self.assertEqual(
            python_scripts,
            [
                (sys.executable, "tools/asm_escape.py"),
                (sys.executable, "tools/asm_escape.py"),
                (sys.executable, "tools/sort_delinks.py"),
                (sys.executable, "tools/configure.py"),
            ],
        )
        # brief 545: the --whole-function call always carries the flag now
        # (a proven no-op unless the ONLY REFUSE reason is C-absorbed).
        whole_function_call = next(c for c in calls if "--whole-function" in c)
        self.assertIn("--allow-absorbed-offset", whole_function_call)

    def test_classify_distinguishes_absorbed_from_genuine_wall(self):
        """brief 545: real Ops.classify() (not the pure helper directly) must
        route a purely-C-absorbed REFUSE to 'refuse-absorbed' and a mixed/
        OFFSET/MISADDRESSED REFUSE to plain 'refuse' -- the actual seam
        BatchCarver.run() reads."""
        ops = bc.Ops("usa")
        absorbed_output = (
            "  data-ref data_ov006_021ce788 @0x021ce788: C-absorbed (REFUSE) "
            "[src/usa/overlay006/data/data_ov006_021ce530.s]\n"
            "      absorbed into bundle TU (base data_ov006_021ce530); ...\n"
            "func_x: ❌ kind:data preflight REFUSED — ...\n")
        wall_output = (
            "  data-ref data_ov002_02211fb0 @0x02211fb4: OFFSET (REFUSE) "
            "[src/overlay002/data/data_ov002_02211fac.s]\n"
            "      pool word targets ...\n"
            "func_x: ❌ kind:data preflight REFUSED — ...\n")
        with mock.patch.object(ops, "_run",
                              return_value=mock.Mock(returncode=1, stdout=absorbed_output, stderr="")):
            self.assertEqual(ops.classify("func_x"), "refuse-absorbed")
        with mock.patch.object(ops, "_run",
                              return_value=mock.Mock(returncode=1, stdout=wall_output, stderr="")):
            self.assertEqual(ops.classify("func_x"), "refuse")

    def test_classify_infra_error_is_tool_error_not_refuse(self):
        """brief 583 (r5 finding): asm_escape's --classify-data returns exit 1
        for BOTH a genuine data-ref REFUSE and an infra failure reading
        module config (FileNotFoundError) -- the infra case prints no
        "REFUSE" text at all, so the OLD code's unconditional fallback
        (`return "refuse"`) silently parked it into the same skip-list
        bucket as a real wall. Must now come back 'tool-error' and (per
        BatchCarver.run()) never be parked."""
        ops = bc.Ops("usa")
        infra_output = (
            "error: preflight could not read module config: "
            "[Errno 2] No such file or directory: 'config/usa/arm9/overlays/"
            "ov002/symbols.txt'\n")
        with mock.patch.object(ops, "_run",
                              return_value=mock.Mock(returncode=1, stdout="", stderr=infra_output)):
            self.assertEqual(ops.classify("func_x"), "tool-error")

    def test_classify_unexpected_returncode_is_tool_error(self):
        """A crash / kill / interpreter-startup failure (returncode outside
        {0, 1}) is never a valid --classify-data verdict -- must not fall
        through to 'refuse' just because the output happens to lack
        "REFUSE"/"clean" text."""
        ops = bc.Ops("usa")
        with mock.patch.object(ops, "_run",
                              return_value=mock.Mock(returncode=127, stdout="", stderr="command not found")):
            self.assertEqual(ops.classify("func_x"), "tool-error")

    def test_whole_function_genuine_mismatch_is_verify_fail(self):
        """The real byte-mismatch case: asm_escape's generate_whole() exits 1
        with its explicit "did NOT verify" marker -- the ONE case that
        belongs in verify-fail (the floor/ledger's source bucket)."""
        ops = bc.Ops("usa")
        mismatch_output = (
            "func_x: ❌ emitted whole-function .s did NOT verify:\n"
            "    word 12: mine=0xe1a00000 orig=0xe1a00001\n")
        with tempfile.TemporaryDirectory() as tmp:
            out_path = str(Path(tmp) / "func_x.s")
            Path(out_path).write_text("; partial\n")   # asm_escape writes before verifying
            with mock.patch.object(
                ops, "_run",
                return_value=mock.Mock(returncode=1, stdout=mismatch_output, stderr=""),
            ):
                self.assertEqual(ops.whole_function("func_x", out_path), "verify-fail")
            self.assertFalse(Path(out_path).exists())  # unverified .s must be removed

    def test_whole_function_exit_2_infra_error_is_tool_error(self):
        """brief 583 (r5 finding, the headline one): asm_escape reserves exit
        2 for infrastructure failure at 7 sites ("not found in build/.../
        delinks ... run `ninja` first?", "no configured function size",
        "did not assemble", ...). The OLD code read neither returncode nor
        message text -- ANY non-pass output landed in verify-fail, the exact
        bucket every endgame-ledger residual row is built from. Must now come
        back 'tool-error' and (per BatchCarver.run()) never be parked into
        verifyfail_path."""
        ops = bc.Ops("usa")
        infra_output = (
            "error: func_x not found in build/usa/delinks (already matched, "
            "or run `ninja` first?)\n")
        with tempfile.TemporaryDirectory() as tmp:
            out_path = str(Path(tmp) / "func_x.s")
            with mock.patch.object(
                ops, "_run",
                return_value=mock.Mock(returncode=2, stdout="", stderr=infra_output),
            ):
                self.assertEqual(ops.whole_function("func_x", out_path), "tool-error")
            self.assertFalse(Path(out_path).exists())

    def test_whole_function_pass(self):
        """The clean case: real Ops.whole_function() must still return
        'pass' on asm_escape's byte-identical marker (returncode 0) --
        regression guard alongside the two failure-path tests above."""
        ops = bc.Ops("usa")
        pass_output = (
            "func_x: ✅ whole-function .s byte-identical vs delinked .o "
            "(42 words) -> build/_asm_escape/func_x.s\n")
        with tempfile.TemporaryDirectory() as tmp:
            out_path = str(Path(tmp) / "func_x.s")
            Path(out_path).write_text("; func_x\n.global func_x\nfunc_x:\n bx lr\n")
            with mock.patch.object(
                ops, "_run",
                return_value=mock.Mock(returncode=0, stdout=pass_output, stderr=""),
            ):
                self.assertEqual(ops.whole_function("func_x", out_path), "pass")
            self.assertTrue(Path(out_path).exists())  # a real pass keeps the .s

    def test_whole_function_returncode_1_without_marker_is_tool_error(self):
        """generate_whole() also returns 1 for a couple of REFUSE-shaped
        early-outs that classify() should already have filtered out before
        whole_function() is ever called (e.g. "REFUSE reason isn't purely
        C-absorbed"). If classify() and generate_whole()'s own independent
        preflight analysis ever disagree, that is a tool-consistency bug,
        not proof of a genuine wall -- require the exact "did NOT verify"
        marker, not just returncode==1, before trusting verify-fail."""
        ops = bc.Ops("usa")
        disagreement_output = (
            "func_x: ❌ REFUSE reason isn't purely C-absorbed — "
            "--allow-absorbed-offset can't recover this one.\n")
        with tempfile.TemporaryDirectory() as tmp:
            out_path = str(Path(tmp) / "func_x.s")
            with mock.patch.object(
                ops, "_run",
                return_value=mock.Mock(returncode=1, stdout="", stderr=disagreement_output),
            ):
                self.assertEqual(ops.whole_function("func_x", out_path), "tool-error")

    @unittest.skipIf(sys.platform == "win32", "POSIX-only flock behaviour")
    def test_posix_gate_lock_is_exclusive(self):
        import fcntl

        ops = bc.Ops("eur", platform=sys.platform)
        with tempfile.TemporaryDirectory() as tmp:
            old_lock = bc._GATE_LOCK
            bc._GATE_LOCK = Path(tmp) / "gate.lock"
            try:
                with ops._gate_lock(1):
                    with bc._GATE_LOCK.open("w", encoding="utf-8") as competitor:
                        with self.assertRaises(BlockingIOError):
                            fcntl.flock(
                                competitor,
                                fcntl.LOCK_EX | fcntl.LOCK_NB,
                            )
            finally:
                bc._GATE_LOCK = old_lock


# --------------------------------------------------------------------------- #
# Fake Ops + temp repo skeleton for driver tests                              #
# --------------------------------------------------------------------------- #

class FakeOps:
    """Models classify/whole-function/gate/git against the temp tree.

    refuse:     funcs whose classify returns REFUSE (genuine wall — parked
                immediately, whole_function() never called; brief 545)
    absorbed:   funcs whose classify returns 'refuse-absorbed' (purely
                C-absorbed — run() retries via whole_function() instead of
                parking; brief 545). Combine with `corrupt` to model an
                absorbed candidate whose retry still fails.
    corrupt:    funcs whose whole-function does NOT byte-verify
    bad_link:   funcs that byte-verify but make `gate()` (ninja sha1) fail
                when their delink block is present in the tree
    classify_tool_error: funcs whose classify() returns 'tool-error' (brief
                583: an infra failure, not a genuine wall — must never be
                parked)
    verify_tool_error: funcs whose whole_function() returns 'tool-error'
                (brief 583: e.g. an asm_escape exit-2 infra failure — must
                never be parked into verifyfail_path)
    """
    def __init__(self, refuse=(), absorbed=(), corrupt=(), bad_link=(),
                 classify_tool_error=(), verify_tool_error=(),
                 commit_fails=False, dirty=False, gate_times_out=False):
        self.refuse = set(refuse)
        self.absorbed = set(absorbed)
        self.corrupt = set(corrupt)
        self.bad_link = set(bad_link)
        self.classify_tool_error = set(classify_tool_error)
        self.verify_tool_error = set(verify_tool_error)
        self.commit_fails = commit_fails
        self.dirty = dirty
        self.gate_times_out = gate_times_out
        self.committed: list[tuple[list[str], str]] = []
        self.gate_calls = 0
        self._delinks_path: Path | None = None
        self._head = 0          # bumped on each successful commit (models HEAD)

    def bind(self, delinks_path: Path):
        self._delinks_path = delinks_path

    # subprocess shim — sort_delinks is a no-op here (audit sorts internally)
    def _run(self, cmd, timeout=None):
        class R:  # noqa
            stdout = ""; stderr = ""; returncode = 0
        return R()

    def _kill_orphans(self):
        pass

    def classify(self, func):
        if func in self.classify_tool_error:
            return "tool-error"
        if func in self.refuse:
            return "refuse"
        if func in self.absorbed:
            return "refuse-absorbed"
        return "clean"

    def whole_function(self, func, out_path):
        if func in self.verify_tool_error:
            Path(out_path).unlink(missing_ok=True)
            return "tool-error"
        if func in self.corrupt:
            Path(out_path).unlink(missing_ok=True)
            return "verify-fail"
        Path(out_path).write_text(f"; {func}\n.global {func}\n{func}:\n bx lr\n")
        return "pass"

    def gate(self):
        self.gate_calls += 1
        if self.gate_times_out:
            raise bc.GateTimeout("simulated wineserver contention")
        text = self._delinks_path.read_text()
        return not any(f"{b}.s:" in text for b in self.bad_link)

    def head_rev(self):
        return str(self._head)

    def is_dirty(self, path):
        return self.dirty

    def sort_delinks(self, path):
        pass   # the driver writes in deterministic order; audit sorts internally

    def git_commit(self, paths, message) -> bool:
        if self.commit_fails:
            return False                       # HEAD does not advance
        self.committed.append((list(paths), message))
        self._head += 1
        return True

    def rm_files(self, paths):
        for p in paths:
            (Path(bc.ROOT) / p).unlink(missing_ok=True)


def _mk_repo(tmp: Path, funcs: list[tuple[str, int]]) -> Scope:
    """Build a minimal config/src skeleton under tmp; return the ov002 Scope.
    `funcs` = [(func, size)]; delinks starts EMPTY (no trailing newline, to
    exercise the newline guard)."""
    cfg = tmp / "config/eur/arm9/overlays/ov002"
    cfg.mkdir(parents=True)
    syms = "".join(f"{f} kind:function(arm,size=0x{s:x}) addr:0x{func_addr(f):08x}\n"
                   for f, s in funcs)
    (cfg / "symbols.txt").write_text(syms)
    # baseline delinks: one pre-existing block, NO trailing newline (b450 case)
    (cfg / "delinks.txt").write_text(
        "src/overlay002/data/data_ov002_aaaa.s:\n    complete\n"
        "    .data start:0x02300000 end:0x02300010")
    (tmp / "src/overlay002").mkdir(parents=True)
    return Scope(version="eur", overlay="ov002",
                 min_addr=0x02234000, min_size=0x0, max_size=0x10000)


class TestDriverNegativeParks(unittest.TestCase):
    def setUp(self):
        self._tmp = tempfile.TemporaryDirectory()
        self.tmp = Path(self._tmp.name)
        self._orig_root = bc.ROOT
        bc.ROOT = self.tmp   # redirect all path resolution into the sandbox
        # Defense in depth: chdir into the sandbox so even a stray CWD-relative
        # write lands here, never in the real repo (a relative-path bug in a
        # fake once clobbered the real delinks.txt — never again).
        self._orig_cwd = os.getcwd()
        os.chdir(self.tmp)

    def tearDown(self):
        os.chdir(self._orig_cwd)
        bc.ROOT = self._orig_root
        self._tmp.cleanup()

    def _carver(self, funcs, ops, batch=10):
        scope = _mk_repo(self.tmp, funcs)
        ops.bind(self.tmp / scope.delinks_path)
        skip = self.tmp / "build/drops.txt"
        vf = self.tmp / "build/vf.txt"
        skip.parent.mkdir(parents=True, exist_ok=True)
        skip.touch(); vf.touch()
        c = BatchCarver(scope, ops, batch=batch,
                        skip_path=str(skip.relative_to(self.tmp)),
                        verifyfail_path=str(vf.relative_to(self.tmp)),
                        log=lambda *a: None)
        return c, scope

    def test_refuse_is_parked_not_committed(self):
        funcs = [("func_ov002_022a0000", 0x80), ("func_ov002_022a0100", 0xc4)]
        ops = FakeOps(refuse=["func_ov002_022a0000"])
        c, scope = self._carver(funcs, ops)
        rep = c.run()
        self.assertEqual(rep.refused, ["func_ov002_022a0000"])
        self.assertEqual(rep.passed, ["func_ov002_022a0100"])
        # refused func: no .s, not in delinks, recorded in skip-list
        self.assertFalse((self.tmp / "src/overlay002/func_ov002_022a0000.s").exists())
        self.assertNotIn("func_ov002_022a0000.s", (self.tmp / scope.delinks_path).read_text())
        self.assertIn("func_ov002_022a0000", (self.tmp / c.skip_path).read_text())

    def test_refuse_absorbed_recovers_via_whole_function(self):
        """brief 545: a C-absorbed-only REFUSE must NOT be parked at
        classify() time -- run() falls through to whole_function() (which
        FakeOps models as succeeding, standing in for the real
        --allow-absorbed-offset retry), and the func ships exactly like a
        clean candidate: carved, committed, absent from the skip-list."""
        funcs = [("func_ov002_022a0000", 0x80), ("func_ov002_022a0100", 0xc4)]
        ops = FakeOps(absorbed=["func_ov002_022a0000"])
        c, scope = self._carver(funcs, ops)
        rep = c.run()
        self.assertEqual(rep.refused, [])                          # not a park
        self.assertEqual(rep.absorbed, ["func_ov002_022a0000"])    # tagged
        self.assertEqual(set(rep.passed),
                         {"func_ov002_022a0000", "func_ov002_022a0100"})
        self.assertTrue((self.tmp / "src/overlay002/func_ov002_022a0000.s").exists())
        self.assertIn("func_ov002_022a0000.s", (self.tmp / scope.delinks_path).read_text())
        self.assertNotIn("func_ov002_022a0000", (self.tmp / c.skip_path).read_text())

    def test_refuse_absorbed_that_still_fails_parks_as_verify_fail_not_refuse(self):
        """A candidate classify() flags as the recoverable C-absorbed
        sub-case, but whose whole_function() retry still doesn't byte-verify
        (a real assemble/verify failure, not a link-preflight wall), must
        land in verify_fail/verifyfail_path -- NOT refused/skip_path. The
        REFUSE bucket is reserved for genuine, immediately-known walls;
        this one was ATTEMPTED and failed at a different stage."""
        funcs = [("func_ov002_022a0000", 0x80), ("func_ov002_022a0100", 0xc4)]
        ops = FakeOps(absorbed=["func_ov002_022a0000"], corrupt=["func_ov002_022a0000"])
        c, scope = self._carver(funcs, ops)
        rep = c.run()
        self.assertEqual(rep.refused, [])
        self.assertEqual(rep.absorbed, ["func_ov002_022a0000"])
        self.assertEqual(rep.verify_fail, ["func_ov002_022a0000"])
        self.assertEqual(rep.passed, ["func_ov002_022a0100"])
        self.assertFalse((self.tmp / "src/overlay002/func_ov002_022a0000.s").exists())
        self.assertIn("func_ov002_022a0000", (self.tmp / c.verifyfail_path).read_text())
        self.assertNotIn("func_ov002_022a0000", (self.tmp / c.skip_path).read_text())

    def test_refuse_absorbed_dry_run_estimates_without_attempting(self):
        """--dry-run must count a recoverable REFUSE (for census/quantification,
        brief 545) without ever calling whole_function() -- classify() alone
        is wine-free; the actual assemble+verify is not attempted."""
        funcs = [("func_ov002_022a0000", 0x80), ("func_ov002_022a0100", 0xc4)]
        ops = FakeOps(absorbed=["func_ov002_022a0000"])
        scope = _mk_repo(self.tmp, funcs)
        ops.bind(self.tmp / scope.delinks_path)
        c = BatchCarver(scope, ops, batch=10, dry_run=True, log=lambda *a: None)
        rep = c.run()
        self.assertEqual(rep.absorbed, ["func_ov002_022a0000"])
        self.assertEqual(set(rep.passed),
                         {"func_ov002_022a0000", "func_ov002_022a0100"})
        # never attempted -- no .s materialised, nothing committed
        self.assertFalse((self.tmp / "src/overlay002/func_ov002_022a0000.s").exists())
        self.assertEqual(ops.committed, [])

    def test_classify_tool_error_is_not_parked(self):
        """brief 583: a classify()-time 'tool-error' (infra failure, not a
        genuine wall) must NOT land in refused/skip_path -- it goes to the
        new tool_error bucket and the candidate is simply left uncarved for
        a future run to retry, exactly like a real wall would NOT be."""
        funcs = [("func_ov002_022a0000", 0x80), ("func_ov002_022a0100", 0xc4)]
        ops = FakeOps(classify_tool_error=["func_ov002_022a0000"])
        c, scope = self._carver(funcs, ops)
        rep = c.run()
        self.assertEqual(rep.refused, [])
        self.assertEqual(rep.tool_error, ["func_ov002_022a0000"])
        self.assertEqual(rep.passed, ["func_ov002_022a0100"])
        self.assertFalse((self.tmp / "src/overlay002/func_ov002_022a0000.s").exists())
        self.assertNotIn("func_ov002_022a0000.s", (self.tmp / scope.delinks_path).read_text())
        # NOT parked to skip_path -- that bucket is genuine-wall-only
        self.assertNotIn("func_ov002_022a0000", (self.tmp / c.skip_path).read_text())

    def test_whole_function_tool_error_is_not_parked_as_verify_fail(self):
        """brief 583 (the headline r5 finding): a whole_function()-time
        'tool-error' (e.g. asm_escape's exit-2 infra failure) must NOT land
        in verify_fail/verifyfail_path -- that bucket is the floor/ledger's
        source, and an infra hiccup is not proof of a genuine byte
        mismatch."""
        funcs = [("func_ov002_022a0000", 0x80), ("func_ov002_022a0100", 0xc4)]
        ops = FakeOps(verify_tool_error=["func_ov002_022a0000"])
        c, scope = self._carver(funcs, ops)
        rep = c.run()
        self.assertEqual(rep.verify_fail, [])
        self.assertEqual(rep.tool_error, ["func_ov002_022a0000"])
        self.assertEqual(rep.passed, ["func_ov002_022a0100"])
        self.assertFalse((self.tmp / "src/overlay002/func_ov002_022a0000.s").exists())
        # NOT parked to verifyfail_path -- that bucket is genuine-mismatch-only
        self.assertNotIn("func_ov002_022a0000", (self.tmp / c.verifyfail_path).read_text())

    def test_corrupt_carve_is_parked_RED(self):
        """THE negative test: a deliberately non-byte-identical carve is parked,
        never carved/committed; the clean sibling still ships."""
        funcs = [("func_ov002_022a0000", 0x80), ("func_ov002_022a0100", 0xc4)]
        ops = FakeOps(corrupt=["func_ov002_022a0100"])
        c, scope = self._carver(funcs, ops)
        rep = c.run()
        self.assertEqual(rep.verify_fail, ["func_ov002_022a0100"])  # parked RED
        self.assertEqual(rep.passed, ["func_ov002_022a0000"])       # sibling green
        self.assertFalse((self.tmp / "src/overlay002/func_ov002_022a0100.s").exists())
        self.assertNotIn("func_ov002_022a0100.s", (self.tmp / scope.delinks_path).read_text())
        self.assertIn("func_ov002_022a0100", (self.tmp / c.verifyfail_path).read_text())

    def test_gate_fail_bisects_and_parks_culprit(self):
        """A carve that byte-verifies but FAILS the link gate is isolated by
        bisect and parked gate-fail; the good carves in the batch commit."""
        funcs = [("func_ov002_022a0000", 0x80), ("func_ov002_022a0100", 0xc4),
                 ("func_ov002_022a0200", 0x90), ("func_ov002_022a0300", 0xa0)]
        ops = FakeOps(bad_link=["func_ov002_022a0200"])
        c, scope = self._carver(funcs, ops, batch=4)
        rep = c.run()
        self.assertEqual(rep.gate_fail, ["func_ov002_022a0200"])
        self.assertEqual(set(rep.passed), {"func_ov002_022a0000", "func_ov002_022a0100",
                                           "func_ov002_022a0300"})
        # culprit parked, absent from tree + delinks
        self.assertIn("func_ov002_022a0200", (self.tmp / c.skip_path).read_text())
        self.assertFalse((self.tmp / "src/overlay002/func_ov002_022a0200.s").exists())
        dl = (self.tmp / scope.delinks_path).read_text()
        self.assertNotIn("func_ov002_022a0200.s", dl)
        for good in ("022a0000", "022a0100", "022a0300"):
            self.assertIn(f"func_ov002_{good}.s", dl)

    def test_newline_guard_no_concatenation(self):
        """End-to-end: appending to the no-trailing-newline baseline must not
        fuse blocks (the b450 corruption)."""
        funcs = [("func_ov002_022a0000", 0x80)]
        ops = FakeOps()
        c, scope = self._carver(funcs, ops)
        c.run()
        text = (self.tmp / scope.delinks_path).read_text()
        self.assertNotIn("end:0x02300010src/", text)   # not fused
        self.assertEqual(audit(text, {}), [])           # and audits clean

    def test_aborts_on_dirty_shared_delinks(self):
        """REFUSE to start if the shared delinks file already has uncommitted
        edits (a co-lane's in-flight carves) — never clobber them."""
        funcs = [("func_ov002_022a0000", 0x80)]
        ops = FakeOps(dirty=True)
        c, scope = self._carver(funcs, ops)
        with self.assertRaises(bc.DirtyTreeError):
            c.run()
        self.assertEqual(ops.committed, [])

    def test_commit_failure_aborts_no_false_ship(self):
        """A green gate whose commit fails (HEAD doesn't advance) must ABORT,
        not report the carve as shipped."""
        funcs = [("func_ov002_022a0000", 0x80)]
        ops = FakeOps(commit_fails=True)
        c, scope = self._carver(funcs, ops)
        with self.assertRaises(bc.CommitError):
            c.run()
        self.assertEqual(c.report.passed, [])     # nothing falsely reported shipped

    def test_revert_preserves_colane_baseline_block(self):
        """THE critical fix: a co-lane (decomper) block present in the baseline
        delinks survives a red batch's revert — we never `git checkout` the
        whole shared file."""
        funcs = [("func_ov002_022a0000", 0x80), ("func_ov002_022a0100", 0xc4)]
        ops = FakeOps(bad_link=["func_ov002_022a0100"])
        scope = _mk_repo(self.tmp, funcs)
        # inject a decomper low-half carve into the baseline (committed) delinks
        dp = self.tmp / scope.delinks_path
        dp.write_text(dp.read_text() + "\n" + delink_block(
            "func_ov002_02200000", 0x02200000, 0x40, "src/overlay002"))
        ops.bind(dp)
        skip = self.tmp / "build/drops.txt"; skip.parent.mkdir(parents=True, exist_ok=True); skip.touch()
        c = BatchCarver(scope, ops, batch=2, skip_path=str(skip.relative_to(self.tmp)),
                        log=lambda *a: None)
        c.run()
        # the bad carve is parked; the decomper's baseline block is intact
        self.assertEqual(c.report.gate_fail, ["func_ov002_022a0100"])
        self.assertIn("func_ov002_02200000.s", dp.read_text())

    def test_gate_timeout_defers_not_parks(self):
        """A wineserver-contention gate timeout DEFERS the batch (re-attemptable),
        it must NOT park clean carves as gate-fail."""
        funcs = [("func_ov002_022a0000", 0x80), ("func_ov002_022a0100", 0xc4)]
        ops = FakeOps(gate_times_out=True)
        c, scope = self._carver(funcs, ops)
        rep = c.run()
        self.assertEqual(rep.gate_fail, [])                      # nothing parked
        self.assertEqual(set(rep.deferred), {"func_ov002_022a0000", "func_ov002_022a0100"})
        self.assertEqual(ops.committed, [])                      # nothing committed
        # the deferred .s were removed and delinks reverted (no orphan blocks)
        self.assertFalse((self.tmp / "src/overlay002/func_ov002_022a0000.s").exists())

    def test_all_clean_commits_in_batches(self):
        # space addresses 0x100 apart so the 0x80-size intervals never overlap
        funcs = [(f"func_ov002_{0x022a0000 + i*0x100:08x}", 0x80) for i in range(0, 5)]
        ops = FakeOps()
        c, scope = self._carver(funcs, ops, batch=2)
        rep = c.run()
        self.assertEqual(len(rep.passed), 5)
        # 5 carves, batch=2 -> commits at 2,4, flush at 5 = 3 commits
        self.assertEqual(rep.committed_batches, 3)
        self.assertEqual(len(ops.committed), 3)


if __name__ == "__main__":
    unittest.main()
