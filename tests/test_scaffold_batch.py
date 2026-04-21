"""Unit tests for tools/scaffold_batch.py.

Focus points:
  - Path derivation (module → overlay dir, placeholder → short stem)
  - Skeleton text includes callers/callees/loads sections populated
    from the call graph
  - Scaffold plan carries the delinks.txt TU header the decomper
    must paste post-match, plus the full complete-TU block it can
    optionally apply
  - filter_scaffoldable drops already-matched, size-0, and
    unresolved targets
  - _load_targets_from_json honours the next_targets JSON schema

Mirrors the test patterns from test_propagate_template / test_next_targets.
"""

from __future__ import annotations

import json
import sys
import tempfile
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from analyze_symbols import CallGraph, ModuleData, Symbol  # noqa: E402
from scaffold_batch import (  # noqa: E402
    ScaffoldPlan,
    _delinks_path_for_module,
    _delinks_section_for_symbol,
    _callers_of,
    _delinks_hint_for_module,
    _derive_output_path,
    _format_delinks_complete_block,
    _load_targets_from_json,
    _overlay_dir,
    _resolved_key_list,
    apply_delinks_blocks,
    build_scaffold_plan,
    filter_scaffoldable,
    render_skeleton,
)


def _sym(
    name: str, module: str, addr: int, *,
    size: int = 0x10, type: str = "function", mode: str = "arm",
) -> Symbol:
    return Symbol(name=name, module=module, addr=addr, size=size,
                  type=type, mode=mode)


def _module(name: str, syms: list[Symbol]) -> ModuleData:
    return ModuleData(
        name=name, symbols=syms, relocs=[],
        by_addr={s.addr: s for s in syms},
        by_addr_sorted=sorted(syms, key=lambda s: s.addr),
    )


def _graph(edges_call=None, edges_load=None) -> CallGraph:
    g = CallGraph()
    if edges_call:
        for src, dests in edges_call.items():
            for d in dests:
                g.edges_call[src].add(d)
    if edges_load:
        for src, dests in edges_load.items():
            for d in dests:
                g.edges_load[src].add(d)
    return g


def _write_delinks(config_dir: Path, module: str, body: str) -> Path:
    path = _delinks_path_for_module(config_dir, module)
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(body)
    return path


# ------------------------------------------------------------------------- #


class TestOverlayDir(unittest.TestCase):
    def test_overlay_zero_padded(self):
        self.assertEqual(_overlay_dir("ov005"), "overlay005")
        self.assertEqual(_overlay_dir("ov023"), "overlay023")

    def test_non_overlay_module(self):
        self.assertEqual(_overlay_dir("main"), "main")
        self.assertEqual(_overlay_dir("itcm"), "itcm")


class TestDeriveOutputPath(unittest.TestCase):
    def test_placeholder_function_drops_func_prefix(self):
        p = _derive_output_path(_sym("func_ov006_021ba1f0", "ov006", 0x021ba1f0))
        self.assertEqual(p.name, "ov006_021ba1f0.c")
        self.assertIn("overlay006", p.parts)

    def test_named_function_uses_name_verbatim(self):
        p = _derive_output_path(_sym("Init", "main", 0x02000800))
        self.assertEqual(p.name, "Init.c")
        self.assertIn("main", p.parts)


class TestResolvedKeyList(unittest.TestCase):
    def test_resolves_and_sorts(self):
        modules = {
            "ov005": _module("ov005", [_sym("A", "ov005", 0x200)]),
            "ov006": _module("ov006", [_sym("B", "ov006", 0x100)]),
        }
        keys = [("ov006", 0x100), ("ov005", 0x200)]
        out = _resolved_key_list(keys, modules)
        # Sorted by (module, addr): ov005 before ov006.
        self.assertEqual(out[0], ("ov005", 0x200, "A", 0x10))
        self.assertEqual(out[1], ("ov006", 0x100, "B", 0x10))

    def test_unresolved_keys_dropped(self):
        modules = {
            "ov005": _module("ov005", [_sym("A", "ov005", 0x200)]),
        }
        keys = [("ov005", 0x200), ("ov099", 0x100)]  # ov099 not loaded
        out = _resolved_key_list(keys, modules)
        self.assertEqual(len(out), 1)
        self.assertEqual(out[0][0], "ov005")


class TestCallersOf(unittest.TestCase):
    def test_multiple_callers(self):
        g = _graph(edges_call={
            ("main", 0x100): {("ov005", 0x500)},
            ("ov006", 0x200): {("ov005", 0x500), ("main", 0x300)},
            ("ov007", 0x400): {("main", 0x300)},
        })
        callers = _callers_of(("ov005", 0x500), g)
        self.assertCountEqual(
            callers, [("main", 0x100), ("ov006", 0x200)],
        )

    def test_no_callers(self):
        g = _graph()
        self.assertEqual(_callers_of(("ov005", 0x500), g), [])


class TestRenderSkeleton(unittest.TestCase):
    def test_sections_populated(self):
        sym = _sym("func_ov006_021ba1f0", "ov006", 0x021ba1f0, size=0x8)
        text = render_skeleton(
            sym, "easy",
            callers=[("main", 0x100, "Entry", 0x13c)],
            callees=[],
            loads=[("ov006", 0x021b1000, "data_ov006_021b1000", 0x10)],
        )
        # Header has name + size + tier.
        self.assertIn("func_ov006_021ba1f0", text)
        self.assertIn("easy tier", text)
        self.assertIn("size=0x8", text)
        # Command hint for find_callsites with the right args.
        self.assertIn("ov006 0x021ba1f0", text)
        # Caller entry rendered.
        self.assertIn("main|0x00000100", text)
        self.assertIn("Entry", text)
        # Callees section shows leaf marker.
        self.assertIn("(leaf)", text)
        # Loads section shows the resolved load.
        self.assertIn("data_ov006_021b1000", text)
        # Default signature stub.
        self.assertIn("void func_ov006_021ba1f0(void)", text)
        self.assertIn("TODO", text)

    def test_dead_function_caller_note(self):
        sym = _sym("func_dead", "ov006", 0x021b0000, size=0x10)
        text = render_skeleton(sym, "hard", [], [], [])
        # Callers section with context note for no-callers.
        self.assertIn("dead code", text)

    def test_leaf_callees(self):
        sym = _sym("func_x", "ov006", 0x021b0000, size=0x4)
        text = render_skeleton(sym, "trivial", [], [], [])
        self.assertIn("Callees (0): (leaf)", text)
        self.assertIn("Loads (0): (no data loads via reloc)", text)


class TestBuildScaffoldPlan(unittest.TestCase):
    def test_end_to_end(self):
        target = _sym("func_ov006_021ba1f0", "ov006", 0x021ba1f0, size=0x8)
        caller = _sym("Helper", "ov006", 0x021b2804, size=0x78)
        modules = {
            "ov006": _module("ov006", [target, caller]),
        }
        g = _graph(edges_call={
            ("ov006", caller.addr): {("ov006", target.addr)},
        })
        plan = build_scaffold_plan(target, "easy", modules, g)
        self.assertIsInstance(plan, ScaffoldPlan)
        self.assertEqual(plan.module, "ov006")
        self.assertEqual(plan.addr, 0x021ba1f0)
        self.assertEqual(plan.output_path.name, "ov006_021ba1f0.c")
        # Skeleton text contains the caller (Helper).
        self.assertIn("Helper", plan.text)
        # delinks line has the right range.
        self.assertIn("start:0x021ba1f0 end:0x021ba1f8",
                      plan.delinks_line)
        self.assertIn("complete", plan.delinks_block)

    def test_warning_when_output_exists(self):
        target = _sym("func_ov005_100", "ov005", 0x100, size=0x8)
        modules = {"ov005": _module("ov005", [target])}
        with tempfile.TemporaryDirectory() as td:
            # The plan's _derive_output_path uses the repo ROOT, so
            # to exercise the existing-file warning, pre-create the
            # file at the target path.
            expected_path = _derive_output_path(target)
            expected_path.parent.mkdir(parents=True, exist_ok=True)
            created = False
            try:
                if not expected_path.exists():
                    expected_path.write_text("placeholder")
                    created = True
                plan = build_scaffold_plan(target, "easy", modules,
                                           _graph())
                self.assertTrue(any("already exists" in w
                                    for w in plan.warnings))
            finally:
                if created and expected_path.exists():
                    expected_path.unlink()
                    # Only remove our test-created parent dirs; leave
                    # pre-existing ones alone.
                    try:
                        expected_path.parent.rmdir()
                    except OSError:
                        pass
            # Silence unused-var warning.
            _ = td


class TestDelinksBlocks(unittest.TestCase):
    def test_complete_block_uses_section_from_module_map(self):
        target = _sym("__sinit_ov005_021b16e4", "ov005", 0x021b16e4,
                      size=0x2c)
        modules = {"ov005": _module("ov005", [target])}
        with tempfile.TemporaryDirectory() as td:
            config = Path(td)
            _write_delinks(
                config, "ov005",
                "    .text start:0x021aa4a0 end:0x021b1568 kind:code\n"
                "    .init start:0x021b16e4 end:0x021b17c0 kind:code\n",
            )
            plan = build_scaffold_plan(target, "sinit", modules,
                                       _graph(), config)

        expected = (
            "src/overlay005/__sinit_ov005_021b16e4.c:\n"
            "    complete\n"
            "    .init start:0x021b16e4 end:0x021b1710"
        )
        self.assertEqual(plan.delinks_section, ".init")
        self.assertEqual(plan.delinks_block, expected)
        self.assertNotIn("complete", plan.delinks_line)

    def test_section_falls_back_to_text_with_warning(self):
        target = _sym("func_ov006_021ba1f0", "ov006", 0x021ba1f0,
                      size=0x8)
        with tempfile.TemporaryDirectory() as td:
            section, warnings = _delinks_section_for_symbol(
                target, Path(td),
            )
        self.assertEqual(section, ".text")
        self.assertTrue(any("defaulted" in w for w in warnings))

    def test_complete_block_uses_posix_paths(self):
        sym = _sym("func_x", "ov006", 0x1000, size=0x8)
        block = _format_delinks_complete_block(
            Path("src") / "overlay006" / "foo.c", sym, ".text",
        )
        self.assertTrue(block.startswith("src/overlay006/foo.c:\n"))
        self.assertIn("    complete\n", block)

    def test_apply_delinks_blocks_appends_once(self):
        target = _sym("func_ov006_021ba1f0", "ov006", 0x021ba1f0,
                      size=0x8)
        modules = {"ov006": _module("ov006", [target])}
        with tempfile.TemporaryDirectory() as td:
            config = Path(td)
            delinks = _write_delinks(
                config, "ov006",
                "    .text start:0x021ba000 end:0x021bb000 kind:code\n",
            )
            plan = build_scaffold_plan(target, "easy", modules,
                                       _graph(), config)

            appended, messages = apply_delinks_blocks([plan], config)
            self.assertEqual(appended, 1)
            self.assertEqual(messages, [])

            appended_again, messages_again = apply_delinks_blocks(
                [plan], config,
            )
            content = delinks.read_text()

        self.assertEqual(appended_again, 0)
        self.assertTrue(any("already present" in m for m in messages_again))
        self.assertEqual(
            content.count("src/overlay006/ov006_021ba1f0.c:"), 1,
        )
        self.assertIn("    complete\n", content)
        self.assertIn(".text start:0x021ba1f0 end:0x021ba1f8", content)


class TestFilterScaffoldable(unittest.TestCase):
    def test_drops_matched_and_zero_size(self):
        # Real config/eur has the sinit at ov005|0x021b16e4 matched
        # (complete TU landed in PR #36). This tests against the live
        # repo state — if that ever un-matches, this test would go
        # stale. Guard with a pre-condition check.
        from scaffold_batch import ROOT
        config_dir = ROOT / "config" / "eur"
        if not (config_dir / "arm9").is_dir():
            self.skipTest("config/eur not present")

        modules = {
            "ov005": _module("ov005", [
                _sym("__sinit_ov005_021b16e4", "ov005", 0x021b16e4,
                     size=0x2c),
                _sym("func_ov005_zero_size", "ov005", 0x021aa000, size=0),
            ]),
        }
        targets = [
            ("ov005", 0x021b16e4, "sinit"),
            ("ov005", 0x021aa000, "easy"),
        ]
        accepted, rejected = filter_scaffoldable(targets, modules, config_dir)
        # Both are rejected — one matched, one zero-size.
        self.assertEqual(accepted, [])
        reasons = {reason for (_t, reason) in rejected}
        self.assertTrue(any("complete TU" in r for r in reasons))
        self.assertTrue(any("size=0" in r for r in reasons))

    def test_missing_module_rejected(self):
        modules = {}
        targets = [("ov099", 0x100, "easy")]
        with tempfile.TemporaryDirectory() as td:
            accepted, rejected = filter_scaffoldable(
                targets, modules, Path(td),
            )
        self.assertEqual(accepted, [])
        self.assertEqual(len(rejected), 1)
        self.assertIn("not loaded", rejected[0][1])


class TestLoadTargetsFromJson(unittest.TestCase):
    def test_reads_next_targets_schema(self):
        payload = {
            "version": "eur",
            "filters": {"tier": "easy", "module": "ov006"},
            "worklist": [
                {"tier": "easy", "module": "ov006",
                 "addr": "0x021ba1f0", "size": 8, "name": "x"},
                {"tier": "easy", "module": "ov006",
                 "addr": "0x021c159c", "size": 8, "name": "y"},
            ],
        }
        with tempfile.TemporaryDirectory() as td:
            p = Path(td) / "next_targets.json"
            p.write_text(json.dumps(payload))
            out = _load_targets_from_json(p)
        self.assertEqual(out, [
            ("ov006", 0x021ba1f0, "easy"),
            ("ov006", 0x021c159c, "easy"),
        ])

    def test_ignores_unparseable_addrs(self):
        payload = {
            "worklist": [
                {"module": "ov006", "addr": "garbage", "tier": "easy"},
                {"module": "ov006", "addr": "0x100", "tier": "easy"},
            ],
        }
        with tempfile.TemporaryDirectory() as td:
            p = Path(td) / "next_targets.json"
            p.write_text(json.dumps(payload))
            out = _load_targets_from_json(p)
        self.assertEqual(out, [("ov006", 0x100, "easy")])


class TestDelinksHintForModule(unittest.TestCase):
    def test_each_module_kind(self):
        self.assertEqual(_delinks_hint_for_module("main"),
                         "arm9/delinks.txt")
        self.assertEqual(_delinks_hint_for_module("itcm"),
                         "arm9/itcm/delinks.txt")
        self.assertEqual(_delinks_hint_for_module("dtcm"),
                         "arm9/dtcm/delinks.txt")
        self.assertEqual(_delinks_hint_for_module("ov006"),
                         "arm9/overlays/ov006/delinks.txt")


if __name__ == "__main__":
    unittest.main()
