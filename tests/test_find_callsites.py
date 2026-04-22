"""Unit tests for tools/find_callsites.py.

Targets: the address-parser, the two resolvers (by-module-addr and
by-name with disambiguation), the bidirectional ref collector
(callers / callees / loads — including unresolved loads), and the
two output formatters (text + JSON schema).
"""

from __future__ import annotations

import contextlib
import io
import json
import sys
import unittest
from collections import defaultdict
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from analyze_symbols import ModuleData, Symbol  # noqa: E402
from find_callsites import (  # noqa: E402
    Refs,
    ResolvedSymbol,
    _parse_addr,
    collect_refs,
    print_text,
    resolve_by_module_addr,
    resolve_by_name,
    to_json,
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


# ------------------------------------------------------------------------- #


class TestParseAddr(unittest.TestCase):
    def test_hex_with_0x(self):
        self.assertEqual(_parse_addr("0x100"), 0x100)
        self.assertEqual(_parse_addr("0X02000800"), 0x02000800)

    def test_bare_hex_with_letters(self):
        # Bare hex digits with a-f get treated as hex (matches addrs
        # the user copies from objdiff output without the 0x prefix).
        self.assertEqual(_parse_addr("021aa4a0"), 0x021aa4a0)

    def test_decimal_when_no_letters(self):
        # Pure-digit input is interpreted as decimal — only matters for
        # tiny addrs like 100 (could be 0x64 or 100). Decimal is the
        # safer default since addresses below 0x100 don't exist in this
        # ROM space; users with hex addrs should prefix 0x.
        self.assertEqual(_parse_addr("100"), 100)

    def test_bad_input_returns_none(self):
        self.assertIsNone(_parse_addr("not_a_number"))
        self.assertIsNone(_parse_addr("0xZZZ"))


class TestResolveByModuleAddr(unittest.TestCase):
    def setUp(self):
        self.modules = {
            "ov005": _module("ov005", [
                _sym("Entry", "ov005", 0x021aa4a0, size=0x100),
                _sym("data_blob", "ov005", 0x021ab000, type="data",
                     mode="any", size=0x40),
            ]),
        }

    def test_exact_addr_hit(self):
        r = resolve_by_module_addr(self.modules, "ov005", 0x021aa4a0)
        self.assertIsNotNone(r)
        self.assertEqual(r.symbol.name, "Entry")

    def test_addr_inside_function_resolves_via_enclosing(self):
        # 0x021aa500 is inside Entry's range — should resolve.
        r = resolve_by_module_addr(self.modules, "ov005", 0x021aa500)
        self.assertIsNotNone(r)
        self.assertEqual(r.symbol.name, "Entry")
        # The resolved key is the function's entry addr, not the query.
        self.assertEqual(r.addr, 0x021aa4a0)

    def test_unknown_module_returns_none(self):
        self.assertIsNone(
            resolve_by_module_addr(self.modules, "ov099", 0x100),
        )

    def test_unknown_addr_returns_none(self):
        # Outside any function and not a known data symbol.
        self.assertIsNone(
            resolve_by_module_addr(self.modules, "ov005", 0x021ad000),
        )


class TestResolveByName(unittest.TestCase):
    def test_unique_name(self):
        modules = {
            "ov005": _module("ov005", [_sym("Entry", "ov005", 0x100)]),
        }
        out = resolve_by_name(modules, "Entry")
        self.assertEqual(len(out), 1)
        self.assertEqual(out[0].module, "ov005")

    def test_no_match_returns_empty(self):
        modules = {"ov005": _module("ov005", [_sym("Entry", "ov005", 0x100)])}
        self.assertEqual(resolve_by_name(modules, "NotARealName"), [])

    def test_multiple_matches_returned(self):
        # Placeholder names like func_<addr> can collide across modules
        # in degenerate cases (or rename collisions). Both must be
        # surfaced so the CLI can ask for disambiguation.
        modules = {
            "ov005": _module("ov005", [_sym("dup", "ov005", 0x100)]),
            "ov006": _module("ov006", [_sym("dup", "ov006", 0x200)]),
        }
        out = resolve_by_name(modules, "dup")
        self.assertEqual(len(out), 2)
        modules_seen = {r.module for r in out}
        self.assertEqual(modules_seen, {"ov005", "ov006"})


class TestCollectRefs(unittest.TestCase):
    def setUp(self):
        # Three modules, three functions and one data symbol.
        # main.Entry calls ov005.Init and ov006.Helper, loads main.cfg.
        self.modules = {
            "main":  _module("main", [
                _sym("Entry", "main", 0x100),
                _sym("cfg",   "main", 0x800, type="data", mode="any", size=0x10),
            ]),
            "ov005": _module("ov005", [_sym("Init",   "ov005", 0x200)]),
            "ov006": _module("ov006", [_sym("Helper", "ov006", 0x300)]),
        }
        self.edges_call: dict = defaultdict(set)
        self.edges_load: dict = defaultdict(set)
        # Entry → Init, Entry → Helper.
        self.edges_call[("main", 0x100)].add(("ov005", 0x200))
        self.edges_call[("main", 0x100)].add(("ov006", 0x300))
        # Entry → cfg (load).
        self.edges_load[("main", 0x100)].add(("main", 0x800))
        # Helper → Init (so Init has 2 callers).
        self.edges_call[("ov006", 0x300)].add(("ov005", 0x200))

    def test_callers_of_init(self):
        target = ResolvedSymbol(
            "ov005", 0x200, self.modules["ov005"].by_addr[0x200],
        )
        refs = collect_refs(
            target, self.modules, self.edges_call, self.edges_load,
        )
        callers = [(r.module, r.addr) for r in refs.callers]
        self.assertCountEqual(callers, [("main", 0x100), ("ov006", 0x300)])
        # callers are sorted: main < ov006.
        self.assertEqual(callers[0], ("main", 0x100))

    def test_callees_of_entry(self):
        target = ResolvedSymbol(
            "main", 0x100, self.modules["main"].by_addr[0x100],
        )
        refs = collect_refs(
            target, self.modules, self.edges_call, self.edges_load,
        )
        callees = [(r.module, r.addr) for r in refs.callees]
        self.assertCountEqual(callees, [("ov005", 0x200), ("ov006", 0x300)])

    def test_loads_of_entry(self):
        target = ResolvedSymbol(
            "main", 0x100, self.modules["main"].by_addr[0x100],
        )
        refs = collect_refs(
            target, self.modules, self.edges_call, self.edges_load,
        )
        loads = [(r.module, r.addr) for r in refs.loads]
        self.assertEqual(loads, [("main", 0x800)])
        self.assertEqual(refs.unresolved_loads, [])

    def test_unresolved_load_when_target_missing(self):
        # Add a load to a non-existent symbol (e.g. mid-data).
        self.edges_load[("main", 0x100)].add(("ov005", 0xdead))
        target = ResolvedSymbol(
            "main", 0x100, self.modules["main"].by_addr[0x100],
        )
        refs = collect_refs(
            target, self.modules, self.edges_call, self.edges_load,
        )
        self.assertIn(("ov005", 0xdead), refs.unresolved_loads)
        self.assertEqual(len(refs.loads), 1)  # only main.cfg resolves


class TestPrintText(unittest.TestCase):
    def test_smoke(self):
        target_sym = _sym("Entry", "main", 0x100)
        target = ResolvedSymbol("main", 0x100, target_sym)
        refs = Refs(
            callers=[],
            callees=[ResolvedSymbol("ov005", 0x200, _sym("Init", "ov005", 0x200))],
            loads=[],
            unresolved_loads=[("ov099", 0xbeef)],
        )
        buf = io.StringIO()
        with contextlib.redirect_stdout(buf):
            print_text(target, refs)
        out = buf.getvalue()
        self.assertIn("Target: main|0x00000100", out)
        self.assertIn("Callers (0)", out)
        self.assertIn("Callees (1)", out)
        self.assertIn("ov005|0x00000200", out)
        # Unresolved loads still surface — they're often the most
        # interesting thing to investigate (mid-data or pruned symbol).
        self.assertIn("Loads (0 resolved, 1 unresolved)", out)
        self.assertIn("<unresolved>", out)


class TestToJson(unittest.TestCase):
    def test_schema(self):
        target_sym = _sym("Entry", "main", 0x100, size=0x13c)
        target = ResolvedSymbol("main", 0x100, target_sym)
        refs = Refs(
            callers=[ResolvedSymbol("ov005", 0x200, _sym("A", "ov005", 0x200))],
            callees=[ResolvedSymbol("ov006", 0x300, _sym("B", "ov006", 0x300))],
            loads=[ResolvedSymbol("main", 0x800, _sym("cfg", "main", 0x800,
                                                       type="data", mode="any",
                                                       size=0x10))],
            unresolved_loads=[("ov099", 0xbeef)],
        )
        payload = to_json(target, refs)
        # Round-trip via json.dumps to ensure no non-serialisable types.
        json.dumps(payload)
        self.assertEqual(payload["target"]["name"], "Entry")
        self.assertEqual(payload["target"]["addr"], "0x00000100")
        self.assertEqual(payload["target"]["size"], 0x13c)
        self.assertEqual(len(payload["callers"]), 1)
        self.assertEqual(payload["callers"][0]["module"], "ov005")
        self.assertEqual(payload["loads"][0]["type"], "data")
        self.assertEqual(payload["unresolved_loads"],
                         [{"module": "ov099", "addr": "0x0000beef"}])


class TestCallerDepthExpansion(unittest.TestCase):
    """Covers the --caller-depth > 1 path added for deep-context
    lookups. The graph here is:

        X ----> A
                A ----> target
                B ----> target
        Y ----> A
        Y ----> B
                target ----> leaf

    With caller_depth=1: target's callers are [A, B].
    With caller_depth=2: depth-2 adds {X, Y} (callers of A + B,
    minus target itself, dedup'd).
    """

    def setUp(self):
        self.target_sym = _sym("target", "ov005", 0x400, size=0x20)
        self.a = _sym("A", "ov005", 0x200, size=0x10)
        self.b = _sym("B", "ov005", 0x300, size=0x10)
        self.x = _sym("X", "ov005", 0x100, size=0x10)
        self.y = _sym("Y", "ov005", 0x150, size=0x10)
        self.leaf = _sym("leaf", "ov005", 0x500, size=0x8)

        self.modules = {
            "ov005": _module("ov005", [
                self.x, self.y, self.a, self.b, self.target_sym, self.leaf,
            ]),
        }
        self.edges_call: dict = defaultdict(set)
        self.edges_load: dict = defaultdict(set)
        # X -> A, Y -> A, Y -> B
        self.edges_call[("ov005", 0x100)].add(("ov005", 0x200))
        self.edges_call[("ov005", 0x150)].add(("ov005", 0x200))
        self.edges_call[("ov005", 0x150)].add(("ov005", 0x300))
        # A -> target, B -> target
        self.edges_call[("ov005", 0x200)].add(("ov005", 0x400))
        self.edges_call[("ov005", 0x300)].add(("ov005", 0x400))
        # target -> leaf
        self.edges_call[("ov005", 0x400)].add(("ov005", 0x500))

        self.target = ResolvedSymbol("ov005", 0x400, self.target_sym)

    def test_depth_1_backwards_compatible(self):
        # Default behaviour must not change: caller_hops is empty.
        refs = collect_refs(
            self.target, self.modules,
            self.edges_call, self.edges_load,
        )
        direct = [(r.module, r.addr) for r in refs.callers]
        self.assertCountEqual(direct, [("ov005", 0x200), ("ov005", 0x300)])
        self.assertEqual(refs.caller_hops, [])

    def test_depth_2_adds_upstream_callers(self):
        refs = collect_refs(
            self.target, self.modules,
            self.edges_call, self.edges_load,
            caller_depth=2,
        )
        direct = [(r.module, r.addr) for r in refs.callers]
        self.assertCountEqual(direct, [("ov005", 0x200), ("ov005", 0x300)])
        self.assertEqual(len(refs.caller_hops), 1)
        hop2 = [(r.module, r.addr) for r in refs.caller_hops[0]]
        self.assertCountEqual(hop2, [("ov005", 0x100), ("ov005", 0x150)])

    def test_depth_exceeding_graph_caps_naturally(self):
        # X and Y have no upstream — depth=3 should come up empty
        # for the 3-hop level AND stop early (no depth-4 attempt).
        refs = collect_refs(
            self.target, self.modules,
            self.edges_call, self.edges_load,
            caller_depth=4,
        )
        # Depth 2 populated, depth 3 empty.
        self.assertEqual(len(refs.caller_hops), 2)
        self.assertEqual(len(refs.caller_hops[0]), 2)
        self.assertEqual(refs.caller_hops[1], [])

    def test_dedup_across_depths(self):
        # If a symbol is both a direct caller AND reachable via another
        # caller, it should only appear at the shallowest depth.
        # Construct: X -> target, X -> A, A -> target.
        # Depth-1 = {X, A}. Depth-2 would naively try {X} again; we
        # want it filtered out.
        edges: dict = defaultdict(set)
        edges[("ov005", 0x100)].add(("ov005", 0x400))  # X -> target
        edges[("ov005", 0x100)].add(("ov005", 0x200))  # X -> A
        edges[("ov005", 0x200)].add(("ov005", 0x400))  # A -> target
        refs = collect_refs(
            self.target, self.modules,
            edges, self.edges_load,
            caller_depth=2,
        )
        direct = [(r.module, r.addr) for r in refs.callers]
        self.assertCountEqual(
            direct, [("ov005", 0x100), ("ov005", 0x200)],
        )
        # X (0x100) is already a direct caller → must NOT appear in
        # depth-2. Depth-2 comes from A's callers; its only caller is
        # X, which is excluded. Expected: empty depth-2.
        self.assertEqual(len(refs.caller_hops), 1)
        self.assertEqual(refs.caller_hops[0], [])

    def test_target_itself_excluded_from_deeper_hops(self):
        # Adversarial: target calls into its own caller chain via leaf.
        # target must never appear as its own caller in any hop.
        edges: dict = defaultdict(set)
        edges[("ov005", 0x200)].add(("ov005", 0x400))  # A -> target
        edges[("ov005", 0x400)].add(("ov005", 0x500))  # target -> leaf
        edges[("ov005", 0x500)].add(("ov005", 0x400))  # leaf -> target (cycle)
        refs = collect_refs(
            self.target, self.modules,
            edges, self.edges_load,
            caller_depth=3,
        )
        # Depth-1: A + leaf (both direct callers).
        direct_keys = {(r.module, r.addr) for r in refs.callers}
        self.assertIn(("ov005", 0x500), direct_keys)  # leaf
        self.assertIn(("ov005", 0x200), direct_keys)  # A
        # target itself must not appear at any deeper depth.
        for level in refs.caller_hops:
            for r in level:
                self.assertNotEqual(
                    (r.module, r.addr), self.target.key,
                )

    def test_json_schema_exposes_caller_hops(self):
        refs = collect_refs(
            self.target, self.modules,
            self.edges_call, self.edges_load,
            caller_depth=2,
        )
        payload = to_json(self.target, refs)
        self.assertIn("caller_hops", payload)
        self.assertEqual(len(payload["caller_hops"]), 1)
        # Each deep-hop entry has the same shape as a direct caller.
        self.assertEqual(
            set(payload["caller_hops"][0][0].keys()),
            set(payload["callers"][0].keys()),
        )

    def test_print_text_includes_deep_hop_section(self):
        refs = collect_refs(
            self.target, self.modules,
            self.edges_call, self.edges_load,
            caller_depth=2,
        )
        buf = io.StringIO()
        with contextlib.redirect_stdout(buf):
            print_text(self.target, refs)
        out = buf.getvalue()
        self.assertIn("Callers (2 hops, 2)", out)
        # Depth-2 members rendered.
        self.assertIn("ov005|0x00000100", out)
        self.assertIn("ov005|0x00000150", out)


if __name__ == "__main__":
    unittest.main()
