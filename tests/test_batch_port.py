"""Tests for tools/batch_port.py (q-batch-port).

Mirrors tests/test_batch_carve.py's shape: PURE logic (sim==1.0 filter,
ground-truth header lookup, output-path derivation) tested directly; the
DRIVER (resolve -> stage -> gate -> commit-on-pass / bisect-on-fail) tested
against a temp repo skeleton with a FAKE Ops so the whole flip/revert/commit
path runs in CI with no wine/ninja/git/port_to_region.py subprocess.

THE headline regression test is `test_revert_leaves_s_file_buildable`: brief
675 lost an entire batch because a culprit's .s was gone by the time bisect
tried to revert to it -- the whole batch reported unconfirmed, not just the
real culprit. batch_port never deletes a .s until AFTER its OWN batch
commits green, so a revert always has something to flip back to.
"""
from __future__ import annotations

import sys
import tempfile
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

import batch_carve as bc  # noqa: E402
import batch_port as bp  # noqa: E402
from batch_port import (  # noqa: E402
    BatchPorter, compute_port_output_path, filter_sim1_backlog,
    classify_port_refusal, fastmatch_verdict, find_tu_header_for_addr,
    module_dirs,
)


# --------------------------------------------------------------------------- #
# Pure helpers                                                                 #
# --------------------------------------------------------------------------- #

class TestFilterSim1Backlog(unittest.TestCase):
    def test_keeps_only_sim_ge_floor(self):
        entries = [
            {"tgt": "a", "byte_sim": 1.0},
            {"tgt": "b", "byte_sim": 0.9999},
            {"tgt": "c", "byte_sim": 0.9998},
            {"tgt": "d", "byte_sim": 0.5},
        ]
        kept = filter_sim1_backlog(entries)
        self.assertEqual([e["tgt"] for e in kept], ["a", "b"])

    def test_excludes_none_sim(self):
        entries = [{"tgt": "a", "byte_sim": None}, {"tgt": "b", "byte_sim": 1.0}]
        self.assertEqual([e["tgt"] for e in filter_sim1_backlog(entries)], ["b"])

    def test_missing_key_excluded_not_crashed(self):
        entries = [{"tgt": "a"}, {"tgt": "b", "byte_sim": 1.0}]
        self.assertEqual([e["tgt"] for e in filter_sim1_backlog(entries)], ["b"])

    def test_empty_list(self):
        self.assertEqual(filter_sim1_backlog([]), [])


class TestFastmatchVerdict(unittest.TestCase):
    def test_no_instructions_is_a_refusal_even_if_percent_is_misreported(self):
        payload = [{
            "status": "ok",
            "functions": [{
                "name": "func_thumb",
                "status": "ok",
                "match_percent": 100.0,
                "diffs_sample": [[0, "NO-INSTRUCTIONS-PARSED",
                                   "NO-INSTRUCTIONS-PARSED"]],
            }],
        }]
        verdict, reason = fastmatch_verdict(payload, 0)
        self.assertEqual(verdict, "refused")
        self.assertIn("NO-INSTRUCTIONS-PARSED", reason)

    def test_candidate_compile_error_is_a_refusal(self):
        payload = [{
            "status": "compile_error",
            "error": "src/foo.c:9: undefined identifier 'D016C'",
        }]
        verdict, reason = fastmatch_verdict(payload, 2)
        self.assertEqual(verdict, "refused")
        self.assertIn("undefined identifier", reason)

    def test_compile_infrastructure_error_is_retryable(self):
        payload = [{
            "status": "compile_error",
            "error": "mwccarm.exe: not found",
        }]
        verdict, reason = fastmatch_verdict(payload, 2)
        self.assertEqual(verdict, "tool-error")
        self.assertIn("infrastructure", reason)


class TestClassifyPortRefusal(unittest.TestCase):
    def test_prioritizes_placeholder_twin(self):
        result = {"failed": [{
            "kind": "func", "confidence": "NONE",
            "notes": "EUR-only named function has placeholder twin",
        }]}
        self.assertEqual(classify_port_refusal(result), "placeholder-twin")

    def test_distinguishes_confidence_and_symbol_classes(self):
        self.assertEqual(
            classify_port_refusal({"failed": [{"kind": "func", "confidence": "MEDIUM"}]}),
            "medium-only",
        )
        self.assertEqual(
            classify_port_refusal({"failed": [
                {"kind": "func", "confidence": "LOW"},
                {"kind": "func", "confidence": "MEDIUM"},
            ]}),
            "low-plus-medium",
        )
        self.assertEqual(
            classify_port_refusal({"failed": [{"kind": "data", "confidence": "NONE"}]}),
            "data-symbol",
        )
        self.assertEqual(
            classify_port_refusal({"failed": [{"kind": "func", "confidence": "NONE"}]}),
            "function-symbol",
        )

    def test_unknown_shape_fails_closed(self):
        self.assertEqual(classify_port_refusal({}), "unclassified")


class TestFindTuHeaderForAddr(unittest.TestCase):
    def test_finds_matching_block(self):
        d = ("src/usa/main/func_02006148.s:\n    complete\n"
             "    .text start:0x02006148 end:0x020061c0\n")
        self.assertEqual(find_tu_header_for_addr(d, 0x02006148),
                         "src/usa/main/func_02006148.s")

    def test_no_block_at_address_returns_none(self):
        d = ("src/usa/main/func_02006148.s:\n    complete\n"
             "    .text start:0x02006148 end:0x020061c0\n")
        self.assertIsNone(find_tu_header_for_addr(d, 0x02009999))

    def test_picks_the_right_block_among_several(self):
        d = ("src/usa/main/func_02006148.s:\n    complete\n"
             "    .text start:0x02006148 end:0x020061c0\n"
             "src/usa/main/func_02006200.c:\n    complete\n"
             "    .text start:0x02006200 end:0x02006240\n"
             "src/usa/main/func_02006300.s:\n    complete\n"
             "    .text start:0x02006300 end:0x02006340\n")
        self.assertEqual(find_tu_header_for_addr(d, 0x02006200),
                         "src/usa/main/func_02006200.c")
        self.assertEqual(find_tu_header_for_addr(d, 0x02006300),
                         "src/usa/main/func_02006300.s")

    def test_init_section_matches_like_text(self):
        d = "src/usa/main/func_02003300.c:\n    complete\n    .init start:0x02003300 end:0x02003340\n"
        self.assertEqual(find_tu_header_for_addr(d, 0x02003300), "src/usa/main/func_02003300.c")

    def test_module_section_header_line_is_not_mistaken_for_a_tu_header(self):
        # A module-level section-map line is INDENTED (leading spaces) --
        # must never be captured as `cur` (mirrors batch_carve's own
        # carved_addrs() module-header exclusion bug class).
        d = ("    .text       start:0x02006000 end:0x02100000 kind:code align:32\n"
             "src/usa/main/func_02006148.s:\n    complete\n"
             "    .text start:0x02006148 end:0x020061c0\n")
        self.assertEqual(find_tu_header_for_addr(d, 0x02006148),
                         "src/usa/main/func_02006148.s")
        self.assertIsNone(find_tu_header_for_addr(d, 0x02006000))

    def test_empty_text(self):
        self.assertIsNone(find_tu_header_for_addr("", 0x02006148))


class TestComputePortOutputPath(unittest.TestCase):
    def test_plain_c_no_routing_suffix(self):
        out = compute_port_output_path("src/usa/main/func_02006148.s",
                                       "src/main/func_02006164.c")
        self.assertEqual(out, "src/usa/main/func_02006148.c")

    def test_routing_suffix_comes_from_eur_not_from_the_s(self):
        # The .s carries no routing signal; the target needs the SAME
        # compiler tier as the EUR side (same underlying code shape).
        out = compute_port_output_path("src/usa/overlay002/func_ov002_021b4108.s",
                                       "src/overlay002/func_ov002_021b40ec.legacy.c")
        self.assertEqual(out, "src/usa/overlay002/func_ov002_021b4108.legacy.c")

    def test_legacy_sp3_suffix_preserved(self):
        out = compute_port_output_path("src/jpn/main/func_0204f34c.s",
                                       "src/main/func_0204f360.legacy_sp3.c")
        self.assertEqual(out, "src/jpn/main/func_0204f34c.legacy_sp3.c")

    def test_target_naming_convention_wins_over_eur_naming_convention(self):
        # The exact brief-677 bug class: EUR uses `main_<addr>.c`, but the
        # target region's OWN tree already names this TU `func_<addr>.s` --
        # ground truth (the .s) must win, not the EUR filename's prefix.
        out = compute_port_output_path("src/usa/main/func_02049800.s",
                                       "src/main/main_020498dc.c")
        self.assertEqual(out, "src/usa/main/func_02049800.c")

    def test_rejects_non_s_input(self):
        with self.assertRaises(ValueError):
            compute_port_output_path("src/usa/main/func_02006148.c",
                                     "src/main/func_02006164.c")


class TestModuleDirs(unittest.TestCase):
    def test_main(self):
        self.assertEqual(module_dirs("usa", "main"),
                         ("config/usa/arm9/delinks.txt", "src/usa/main"))

    def test_overlay(self):
        self.assertEqual(
            module_dirs("jpn", "ov002"),
            ("config/jpn/arm9/overlays/ov002/delinks.txt", "src/jpn/overlay002"))


# --------------------------------------------------------------------------- #
# Fake Ops + temp repo skeleton for driver tests                              #
# --------------------------------------------------------------------------- #

class FakePortOps:
    """Models port()/gate()/git_commit_port() against the temp tree.

    refuse / tool_error / needs_symbol: keyed by the EUR STEM (the only
      thing port() actually receives) -- status decisions a real
      port_to_region.py call makes before anything touches disk.
    bad_link: keyed by the TARGET func name -- gate() (ninja sha1) is a
      whole-tree check that only ever sees target-side artifacts, so this
      is checked against what's actually staged in the bound delinks files.
    """
    def __init__(self, refuse=(), tool_error=(), needs_symbol=(), bad_link=(),
                prefilter_refuse=(), prefilter_error=(), commit_fails=False,
                gate_times_out=False):
        self.refuse = set(refuse)
        self.tool_error = set(tool_error)
        self.needs_symbol = set(needs_symbol)
        self.bad_link = set(bad_link)
        self.prefilter_refuse = set(prefilter_refuse)
        self.prefilter_error = set(prefilter_error)
        self.commit_fails = commit_fails
        self.gate_times_out = gate_times_out
        self.committed: list[tuple[list[str], list[str], str]] = []
        self.gate_calls = 0
        self.prefilter_calls: list[tuple[str, str]] = []
        self._delinks_paths: list[Path] = []
        self._head = 0

    def bind(self, delinks_paths: list[Path]) -> None:
        self._delinks_paths = delinks_paths

    def _kill_orphans(self):
        pass

    def port(self, eur_rel, target, confidence_floor="HIGH") -> dict:
        eur_func = Path(eur_rel).stem
        if eur_func in self.tool_error:
            return {"status": "tool-error", "reason": "simulated infra failure"}
        if eur_func in self.refuse:
            return {"status": "refused", "reason": "simulated confidence floor"}
        result = {
            "status": "ok",
            "rewritten": f"/* ported from {eur_func} */\nint dummy(void) {{ return 0; }}\n",
            "new_symbols_txt_lines": {},
        }
        if eur_func in self.needs_symbol:
            result["new_symbols_txt_lines"] = {
                f"config/{target}/arm9/symbols.txt": ["data_deadbeef kind:data addr:0xdeadbeef"],
            }
        return result

    def gate(self) -> bool:
        self.gate_calls += 1
        if self.gate_times_out:
            raise bc.GateTimeout("simulated wineserver contention")
        for dp in self._delinks_paths:
            text = dp.read_text()
            if any(f"{b}.c:" in text for b in self.bad_link):
                return False
        return True

    def prefilter(self, c_rel: str, func: str) -> tuple[str, str]:
        self.prefilter_calls.append((c_rel, func))
        if func in self.prefilter_refuse:
            return "refused", "simulated resolved mismatch"
        if func in self.prefilter_error:
            return "tool-error", "simulated compile/gap failure"
        return "pass", "simulated 100.0% resolved match"

    def head_rev(self) -> str:
        return str(self._head)

    def git_commit_port(self, add_paths, remove_paths, message) -> bool:
        if self.commit_fails:
            return False
        self.committed.append((list(add_paths), list(remove_paths), message))
        self._head += 1
        return True

    def rm_files(self, paths) -> None:
        for p in paths:
            (bp.ROOT / p).unlink(missing_ok=True)


def _mk_repo(tmp: Path, region: str, module: str,
            entries: list[tuple[str, str, int, int]]) -> tuple[Path, str]:
    """entries: [(eur_func, tgt_func, tgt_addr, size)]. Builds a matching
    EUR .c under src/main/ (or src/overlayNNN/), a target-region .s stub +
    delinks.txt block naming it -- the ground truth find_tu_header_for_addr
    reads. Returns (delinks_path, tgt_srcdir)."""
    delinks_rel, tgt_srcdir = module_dirs(region, module)
    delinks_path = tmp / delinks_rel
    delinks_path.parent.mkdir(parents=True, exist_ok=True)
    eur_srcdir = tmp / ("src/main" if module == "main" else f"src/overlay{module[2:]}")
    eur_srcdir.mkdir(parents=True, exist_ok=True)
    (tmp / tgt_srcdir).mkdir(parents=True, exist_ok=True)

    blocks = []
    for eur_func, tgt_func, addr, size in entries:
        (eur_srcdir / f"{eur_func}.c").write_text(f"int {eur_func}(void) {{ return 0; }}\n")
        (tmp / tgt_srcdir / f"{tgt_func}.s").write_text(f"; {tgt_func}\n")
        blocks.append(f"{tgt_srcdir}/{tgt_func}.s:\n    complete\n"
                      f"    .text start:0x{addr:08x} end:0x{addr + size:08x}\n")
    delinks_path.write_text("".join(blocks))
    return delinks_path, tgt_srcdir


def _entry(eur_func: str, module: str, tgt_func: str, addr: int, size: int,
          byte_sim: float = 1.0) -> dict:
    eur_srcdir = "src/main" if module == "main" else f"src/overlay{module[2:]}"
    return {
        "eur": f"{eur_srcdir}/{eur_func}.c",
        "module": module,
        "eur_addr": f"0x{addr:08x}",
        "tgt": tgt_func,
        "tgt_addr": f"0x{addr:08x}",
        "byte_sim": byte_sim,
        "size": size,
    }


class TestBatchPorterDriver(unittest.TestCase):
    def setUp(self):
        self._tmp = tempfile.TemporaryDirectory()
        self.tmp = Path(self._tmp.name)
        self._orig_root = bp.ROOT
        bp.ROOT = self.tmp
        bc.ROOT = self.tmp
        import os
        self._orig_cwd = os.getcwd()
        os.chdir(self.tmp)

    def tearDown(self):
        import os
        os.chdir(self._orig_cwd)
        bp.ROOT = self._orig_root
        bc.ROOT = self._orig_root
        self._tmp.cleanup()

    def _porter(self, ops, region="usa", batch=10, park_path=None):
        return BatchPorter(region, ops, batch=batch, park_path=park_path,
                           log=lambda *a: None)

    def test_all_clean_commits_in_batches(self):
        entries = [(f"func_eur{i:02d}", f"func_tgt{i:02d}", 0x02006000 + i * 0x40, 0x40)
                  for i in range(5)]
        delinks_path, _srcdir = _mk_repo(self.tmp, "usa", "main", entries)
        ops = FakePortOps()
        ops.bind([delinks_path])
        backlog = [_entry(e, "main", t, a, s) for e, t, a, s in entries]
        porter = self._porter(ops, batch=2)
        rep = porter.run(backlog)
        self.assertEqual(len(rep.passed), 5)
        self.assertEqual(rep.committed_batches, 3)   # batch=2 over 5 -> 2,4,flush(1) = 3

    def test_refused_is_parked_not_staged(self):
        entries = [("func_eur00", "func_tgt00", 0x02006000, 0x40),
                  ("func_eur01", "func_tgt01", 0x02006040, 0x40)]
        delinks_path, srcdir = _mk_repo(self.tmp, "usa", "main", entries)
        ops = FakePortOps(refuse=["func_eur00"])
        ops.bind([delinks_path])
        backlog = [_entry(e, "main", t, a, s) for e, t, a, s in entries]
        rep = self._porter(ops).run(backlog)
        self.assertEqual(rep.parked_refuse, ["func_tgt00"])
        self.assertEqual(rep.passed, ["func_tgt01"])
        # refused: .s untouched, delinks still says .s
        self.assertTrue((self.tmp / srcdir / "func_tgt00.s").exists())
        self.assertIn("func_tgt00.s:", delinks_path.read_text())

    def test_prefilter_refusal_never_reaches_rom_gate(self):
        entries = [("func_eur00", "func_tgt00", 0x02006000, 0x40)]
        delinks_path, srcdir = _mk_repo(self.tmp, "usa", "main", entries)
        ops = FakePortOps(prefilter_refuse=["func_tgt00"])
        ops.bind([delinks_path])
        backlog = [_entry("func_eur00", "main", "func_tgt00",
                          0x02006000, 0x40)]
        rep = self._porter(ops).run(backlog)
        self.assertEqual(rep.prefilter_refuse, ["func_tgt00"])
        self.assertEqual(ops.gate_calls, 0)
        self.assertEqual(ops.committed, [])
        self.assertTrue((self.tmp / srcdir / "func_tgt00.s").exists())
        self.assertFalse((self.tmp / srcdir / "func_tgt00.c").exists())

    def test_prefilter_pass_still_faces_rom_gate(self):
        entries = [("func_eur00", "func_tgt00", 0x02006000, 0x40)]
        delinks_path, _srcdir = _mk_repo(self.tmp, "usa", "main", entries)
        ops = FakePortOps()
        ops.bind([delinks_path])
        backlog = [_entry("func_eur00", "main", "func_tgt00",
                          0x02006000, 0x40)]
        rep = self._porter(ops).run(backlog)
        self.assertEqual(rep.prefilter_refuse, [])
        self.assertEqual(len(ops.prefilter_calls), 1)
        self.assertEqual(ops.gate_calls, 1)
        self.assertEqual(rep.passed, ["func_tgt00"])
        self.assertEqual(rep.gate_calls, 1)

    def test_tool_error_not_parked_retried_next_run(self):
        entries = [("func_eur00", "func_tgt00", 0x02006000, 0x40)]
        delinks_path, srcdir = _mk_repo(self.tmp, "usa", "main", entries)
        ops = FakePortOps(tool_error=["func_eur00"])
        ops.bind([delinks_path])
        backlog = [_entry("func_eur00", "main", "func_tgt00", 0x02006000, 0x40)]
        rep = self._porter(ops).run(backlog)
        self.assertEqual(rep.tool_error, ["func_tgt00"])
        self.assertEqual(rep.parked_refuse, [])
        self.assertEqual(ops.committed, [])

    def test_needs_symbol_is_parked_not_auto_applied(self):
        entries = [("func_eur00", "func_tgt00", 0x02006000, 0x40)]
        delinks_path, srcdir = _mk_repo(self.tmp, "usa", "main", entries)
        ops = FakePortOps(needs_symbol=["func_eur00"])
        ops.bind([delinks_path])
        backlog = [_entry("func_eur00", "main", "func_tgt00", 0x02006000, 0x40)]
        rep = self._porter(ops).run(backlog)
        self.assertEqual(rep.parked_needs_symbol, ["func_tgt00"])
        self.assertEqual(ops.committed, [])
        # no symbols.txt was invented anywhere
        self.assertFalse((self.tmp / "config/usa/arm9/symbols.txt").exists())

    def test_stale_entry_no_tu_at_address_skipped(self):
        entries = [("func_eur00", "func_tgt00", 0x02006000, 0x40)]
        delinks_path, _srcdir = _mk_repo(self.tmp, "usa", "main", entries)
        ops = FakePortOps()
        ops.bind([delinks_path])
        # backlog claims a DIFFERENT address than what's actually in delinks.txt
        backlog = [_entry("func_eur00", "main", "func_tgt00", 0x02099999, 0x40)]
        rep = self._porter(ops).run(backlog)
        self.assertEqual(rep.stale, ["func_tgt00"])
        self.assertEqual(ops.committed, [])

    def test_already_ported_live_dedup_skipped(self):
        delinks_rel, srcdir = module_dirs("usa", "main")
        delinks_path = self.tmp / delinks_rel
        delinks_path.parent.mkdir(parents=True, exist_ok=True)
        (self.tmp / srcdir).mkdir(parents=True, exist_ok=True)
        (self.tmp / "src/main").mkdir(parents=True, exist_ok=True)
        (self.tmp / "src/main/func_eur00.c").write_text("int func_eur00(void){return 0;}\n")
        # header ALREADY points at .c -- someone else ported this already
        (self.tmp / srcdir / "func_tgt00.c").write_text("int func_tgt00(void){return 0;}\n")
        delinks_path.write_text("src/usa/main/func_tgt00.c:\n    complete\n"
                                "    .text start:0x02006000 end:0x02006040\n")
        ops = FakePortOps()
        ops.bind([delinks_path])
        backlog = [_entry("func_eur00", "main", "func_tgt00", 0x02006000, 0x40)]
        rep = self._porter(ops).run(backlog)
        self.assertEqual(rep.stale, ["func_tgt00"])
        self.assertEqual(ops.committed, [])

    def test_missing_s_on_disk_skipped_not_staged(self):
        """must-have (b) at resolve-time: delinks.txt claims a .s that
        isn't actually on disk (tree corruption / stale backlog) -- must
        refuse to stage rather than produce an unrevertable state."""
        delinks_rel, srcdir = module_dirs("usa", "main")
        delinks_path = self.tmp / delinks_rel
        delinks_path.parent.mkdir(parents=True, exist_ok=True)
        (self.tmp / srcdir).mkdir(parents=True, exist_ok=True)
        (self.tmp / "src/main").mkdir(parents=True, exist_ok=True)
        (self.tmp / "src/main/func_eur00.c").write_text("int func_eur00(void){return 0;}\n")
        delinks_path.write_text("src/usa/main/func_tgt00.s:\n    complete\n"
                                "    .text start:0x02006000 end:0x02006040\n")
        # deliberately do NOT create func_tgt00.s on disk
        ops = FakePortOps()
        ops.bind([delinks_path])
        backlog = [_entry("func_eur00", "main", "func_tgt00", 0x02006000, 0x40)]
        rep = self._porter(ops).run(backlog)
        self.assertEqual(rep.stale, ["func_tgt00"])
        self.assertEqual(ops.committed, [])

    def test_sub_1_0_entries_excluded_before_run(self):
        entries = [("func_eur00", "func_tgt00", 0x02006000, 0x40),
                  ("func_eur01", "func_tgt01", 0x02006040, 0x40)]
        delinks_path, _srcdir = _mk_repo(self.tmp, "usa", "main", entries)
        ops = FakePortOps()
        ops.bind([delinks_path])
        backlog = [_entry("func_eur00", "main", "func_tgt00", 0x02006000, 0x40, byte_sim=1.0),
                  _entry("func_eur01", "main", "func_tgt01", 0x02006040, 0x40, byte_sim=0.87)]
        rep = self._porter(ops).run(backlog)
        self.assertEqual(rep.passed, ["func_tgt00"])
        self.assertNotIn("func_tgt01", rep.passed)
        self.assertNotIn("func_tgt01", rep.stale)   # never even looked at -- filtered pre-loop

    def test_commit_deletes_old_s_and_keeps_new_c(self):
        entries = [("func_eur00", "func_tgt00", 0x02006000, 0x40)]
        delinks_path, srcdir = _mk_repo(self.tmp, "usa", "main", entries)
        ops = FakePortOps()
        ops.bind([delinks_path])
        backlog = [_entry("func_eur00", "main", "func_tgt00", 0x02006000, 0x40)]
        self._porter(ops).run(backlog)
        self.assertFalse((self.tmp / srcdir / "func_tgt00.s").exists())
        self.assertTrue((self.tmp / srcdir / "func_tgt00.c").exists())
        self.assertIn("func_tgt00.c:", delinks_path.read_text())
        add_paths, remove_paths, _msg = ops.committed[0]
        self.assertIn(f"{srcdir}/func_tgt00.c", add_paths)
        self.assertIn(f"{srcdir}/func_tgt00.s", remove_paths)

    def test_revert_leaves_s_file_buildable(self):
        """THE headline regression test (brief 675): a culprit isolated by
        bisect must still have its .s on disk afterward -- reverting only
        flips delinks.txt text back, it never deletes anything. Deletion
        happens ONLY at commit time, for a batch already proven green."""
        entries = [("func_eur_good", "func_tgt_good", 0x02006000, 0x40),
                  ("func_eur_bad", "func_tgt_bad", 0x02006040, 0x40)]
        delinks_path, srcdir = _mk_repo(self.tmp, "usa", "main", entries)
        ops = FakePortOps(bad_link=["func_tgt_bad"])
        ops.bind([delinks_path])
        backlog = [_entry("func_eur_good", "main", "func_tgt_good", 0x02006000, 0x40),
                  _entry("func_eur_bad", "main", "func_tgt_bad", 0x02006040, 0x40)]
        rep = self._porter(ops, batch=2).run(backlog)

        self.assertEqual(rep.gate_fail, ["func_tgt_bad"])
        self.assertEqual(rep.passed, ["func_tgt_good"])
        # the culprit's .s is STILL THERE -- never prematurely deleted
        self.assertTrue((self.tmp / srcdir / "func_tgt_bad.s").exists())
        self.assertFalse((self.tmp / srcdir / "func_tgt_bad.c").exists())
        self.assertIn("func_tgt_bad.s:", delinks_path.read_text())
        # the good one shipped normally
        self.assertFalse((self.tmp / srcdir / "func_tgt_good.s").exists())
        self.assertTrue((self.tmp / srcdir / "func_tgt_good.c").exists())
        self.assertIn("func_tgt_good.c:", delinks_path.read_text())

    def test_gate_timeout_defers_not_parks(self):
        entries = [("func_eur00", "func_tgt00", 0x02006000, 0x40)]
        delinks_path, srcdir = _mk_repo(self.tmp, "usa", "main", entries)
        ops = FakePortOps(gate_times_out=True)
        ops.bind([delinks_path])
        backlog = [_entry("func_eur00", "main", "func_tgt00", 0x02006000, 0x40)]
        rep = self._porter(ops).run(backlog)
        self.assertEqual(rep.gate_fail, [])
        self.assertEqual(rep.deferred, ["func_tgt00"])
        self.assertEqual(ops.committed, [])
        self.assertTrue((self.tmp / srcdir / "func_tgt00.s").exists())
        self.assertFalse((self.tmp / srcdir / "func_tgt00.c").exists())

    def test_commit_failure_aborts_no_false_ship(self):
        entries = [("func_eur00", "func_tgt00", 0x02006000, 0x40)]
        delinks_path, _srcdir = _mk_repo(self.tmp, "usa", "main", entries)
        ops = FakePortOps(commit_fails=True)
        ops.bind([delinks_path])
        backlog = [_entry("func_eur00", "main", "func_tgt00", 0x02006000, 0x40)]
        porter = self._porter(ops)
        with self.assertRaises(bp.CommitError):
            porter.run(backlog)
        self.assertEqual(porter.report.passed, [])

    def test_dry_run_does_not_touch_disk(self):
        entries = [("func_eur00", "func_tgt00", 0x02006000, 0x40)]
        delinks_path, srcdir = _mk_repo(self.tmp, "usa", "main", entries)
        before = delinks_path.read_text()
        ops = FakePortOps()
        ops.bind([delinks_path])
        backlog = [_entry("func_eur00", "main", "func_tgt00", 0x02006000, 0x40)]
        porter = BatchPorter("usa", ops, batch=10, dry_run=True, log=lambda *a: None)
        rep = porter.run(backlog)
        self.assertEqual(rep.passed, ["func_tgt00"])   # counted as an estimate
        self.assertEqual(delinks_path.read_text(), before)   # untouched
        self.assertTrue((self.tmp / srcdir / "func_tgt00.s").exists())
        self.assertEqual(ops.committed, [])
        self.assertEqual(ops.gate_calls, 0)

    def test_park_list_records_refused_and_gate_fail(self):
        entries = [("func_eur00", "func_tgt00", 0x02006000, 0x40),
                  ("func_eur01", "func_tgt01", 0x02006040, 0x40)]
        delinks_path, _srcdir = _mk_repo(self.tmp, "usa", "main", entries)
        park = self.tmp / "build/port_park.txt"
        park.parent.mkdir(parents=True, exist_ok=True)
        park.touch()
        ops = FakePortOps(refuse=["func_eur00"], bad_link=["func_tgt01"])
        ops.bind([delinks_path])
        backlog = [_entry("func_eur00", "main", "func_tgt00", 0x02006000, 0x40),
                  _entry("func_eur01", "main", "func_tgt01", 0x02006040, 0x40)]
        self._porter(ops, batch=2, park_path=str(park.relative_to(self.tmp))).run(backlog)
        park_text = park.read_text()
        self.assertIn("func_tgt00 port-refused", park_text)
        self.assertIn("func_tgt01 gate-fail", park_text)

    def test_contention_callback_defers_before_next_batch(self):
        entries = [(f"func_eur{i:02d}", f"func_tgt{i:02d}",
                    0x02006000 + i * 0x40, 0x40) for i in range(3)]
        delinks_path, srcdir = _mk_repo(self.tmp, "usa", "main", entries)
        ops = FakePortOps()
        ops.bind([delinks_path])
        backlog = [_entry(e, "main", t, a, s) for e, t, a, s in entries]
        checks = iter([True, False])
        porter = BatchPorter(
            "usa", ops, batch=2, before_batch=lambda: next(checks),
            log=lambda *a: None,
        )

        rep = porter.run(backlog)

        self.assertEqual(rep.passed, ["func_tgt00", "func_tgt01"])
        self.assertEqual(rep.deferred, ["func_tgt02"])
        self.assertEqual(rep.contention_deferred, ["func_tgt02"])
        self.assertEqual(rep.gate_calls, 1)
        self.assertFalse((self.tmp / srcdir / "func_tgt02.c").exists())
        self.assertTrue((self.tmp / srcdir / "func_tgt02.s").exists())


if __name__ == "__main__":
    unittest.main()
