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


if __name__ == "__main__":
    unittest.main()
