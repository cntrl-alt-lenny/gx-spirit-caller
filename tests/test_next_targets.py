"""Unit tests for tools/next_targets.py.

The decomper opens this tool's worklist daily; if it ever shows
already-matched functions or hides truly-easy ones, they waste a
decomp loop. The tests pin:

  - matched-range collection from delinks.txt complete markers
  - the addr-in-range check (boundary handling)
  - the build_worklist filter (tier + module slicing)
  - the tier_breakdown matched/unmatched accounting
  - both writers (md headers + tier sections; json schema)
"""

from __future__ import annotations

import contextlib
import io
import json
import sys
import tempfile
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from analyze_symbols import Symbol, Target  # noqa: E402
from next_targets import (  # noqa: E402
    _module_name_from_delinks_path,
    build_worklist,
    collect_matched_ranges,
    is_addr_matched,
    print_summary,
    tier_breakdown,
    write_json,
    write_md,
)


def _sym(module: str, addr: int, name: str = "func", size: int = 0x10) -> Symbol:
    return Symbol(name=name, module=module, addr=addr, size=size,
                  type="function", mode="arm")


def _target(
    module: str, addr: int, *, tier: str = "easy",
    size: int = 0x10, name: str = "func", reason: str = "leaf",
) -> Target:
    return Target(
        symbol=_sym(module, addr, name=name, size=size),
        tier=tier,
        reason=reason,
        callees_named=0,
        callees_total=0,
    )


def _write_delinks(root: Path, rel: str, body: str) -> None:
    path = root / rel
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(body)


# ------------------------------------------------------------------------- #


class TestModuleNameFromDelinksPath(unittest.TestCase):
    """The path-to-module mapping is what stitches delinks ranges back
    to the symbols.txt module names. A wrong mapping silently means
    every match is invisible to the filter."""

    def test_main(self):
        config = Path("/x/config/eur")
        p = config / "arm9" / "delinks.txt"
        # arm9/delinks.txt is the main-module delinks (NOT a module
        # called "arm9"); analyze_symbols calls this module "main".
        self.assertEqual(_module_name_from_delinks_path(p, config), "main")

    def test_itcm(self):
        config = Path("/x/config/eur")
        p = config / "arm9" / "itcm" / "delinks.txt"
        self.assertEqual(_module_name_from_delinks_path(p, config), "itcm")

    def test_overlay(self):
        config = Path("/x/config/eur")
        p = config / "arm9" / "overlays" / "ov005" / "delinks.txt"
        self.assertEqual(_module_name_from_delinks_path(p, config), "ov005")

    def test_unrelated_path_does_not_raise(self):
        # If delinks shows up somewhere unexpected, fall back to the
        # parent dir name instead of raising.
        p = Path("/tmp/loose/delinks.txt")
        self.assertEqual(
            _module_name_from_delinks_path(p, Path("/x/config/eur")),
            "loose",
        )


_DELINKS_OV005_ONE_COMPLETE = """\
.text       start:0x021aa4a0 end:0x021ad900 kind:code align:4

src/overlay005/ov005_stubs.c:
    complete
    .text start:0x021aa4a0 end:0x021aa4a8
src/overlay005/ov005_init.c:
    .text start:0x021ab000 end:0x021ab100
"""

_DELINKS_OV005_GAP_ONLY = """\
.text       start:0x021aa4a0 end:0x021ad900 kind:code align:4

_dsd_gap@ov005_0:
    .text start:0x021aa4a0 end:0x021ad900
"""


class TestCollectMatchedRanges(unittest.TestCase):
    def test_empty_when_no_delinks(self):
        with tempfile.TemporaryDirectory() as td:
            self.assertEqual(collect_matched_ranges(Path(td)), {})

    def test_single_complete_tu(self):
        with tempfile.TemporaryDirectory() as td:
            config = Path(td)
            _write_delinks(
                config, "arm9/overlays/ov005/delinks.txt",
                _DELINKS_OV005_ONE_COMPLETE,
            )
            ranges = collect_matched_ranges(config)
            self.assertEqual(ranges, {"ov005": [(0x021aa4a0, 0x021aa4a8)]})

    def test_gap_tu_not_counted(self):
        # _dsd_gap entries are explicitly NOT matched even if they
        # somehow had a status — they're the un-carved remainder.
        with tempfile.TemporaryDirectory() as td:
            config = Path(td)
            _write_delinks(
                config, "arm9/overlays/ov005/delinks.txt",
                _DELINKS_OV005_GAP_ONLY,
            )
            self.assertEqual(collect_matched_ranges(config), {})

    def test_incomplete_tu_not_counted(self):
        # A TU with no `complete` marker (in-progress) is also not
        # matched; the decomper hasn't blessed it yet.
        body = (
            ".text       start:0x021aa4a0 end:0x021ad900 kind:code align:4\n"
            "\n"
            "src/overlay005/ov005_init.c:\n"
            "    .text start:0x021aa4a0 end:0x021aa500\n"
        )
        with tempfile.TemporaryDirectory() as td:
            config = Path(td)
            _write_delinks(config, "arm9/overlays/ov005/delinks.txt", body)
            self.assertEqual(collect_matched_ranges(config), {})

    def test_multiple_modules_aggregated(self):
        with tempfile.TemporaryDirectory() as td:
            config = Path(td)
            _write_delinks(
                config, "arm9/overlays/ov005/delinks.txt",
                _DELINKS_OV005_ONE_COMPLETE,
            )
            # Main module: arm9/delinks.txt with one complete TU.
            _write_delinks(
                config, "arm9/delinks.txt",
                ".text       start:0x02000000 end:0x02100000 kind:code align:4\n"
                "\n"
                "src/main/entry.c:\n"
                "    complete\n"
                "    .text start:0x02000800 end:0x0200093c\n",
            )
            ranges = collect_matched_ranges(config)
            self.assertIn("ov005", ranges)
            self.assertIn("main", ranges)


class TestIsAddrMatched(unittest.TestCase):
    def setUp(self):
        self.matched = {
            "ov005": [(0x021aa4a0, 0x021aa4a8), (0x021ab000, 0x021ab100)],
            "main":  [(0x02000800, 0x02000900)],
        }

    def test_inside_first_range(self):
        self.assertTrue(is_addr_matched(self.matched, "ov005", 0x021aa4a0))
        self.assertTrue(is_addr_matched(self.matched, "ov005", 0x021aa4a4))

    def test_at_end_is_exclusive(self):
        # end is exclusive (matches Python range semantics + dsd's
        # half-open intervals).
        self.assertFalse(
            is_addr_matched(self.matched, "ov005", 0x021aa4a8),
        )

    def test_inside_second_range(self):
        self.assertTrue(is_addr_matched(self.matched, "ov005", 0x021ab080))

    def test_outside_all_ranges(self):
        self.assertFalse(is_addr_matched(self.matched, "ov005", 0x021aa498))
        self.assertFalse(is_addr_matched(self.matched, "ov005", 0x021ad000))

    def test_unknown_module_is_not_matched(self):
        # Defensive: querying a module we don't have ranges for must
        # return False, not raise.
        self.assertFalse(is_addr_matched(self.matched, "ov099", 0x100))


class TestBuildWorklist(unittest.TestCase):
    def setUp(self):
        # Five targets, three in ov005 + two in ov006, mixed tiers.
        self.targets = [
            _target("ov005", 0x100, tier="trivial", size=0x4),
            _target("ov005", 0x108, tier="easy",    size=0x10),
            _target("ov005", 0x200, tier="easy",    size=0x10),
            _target("ov006", 0x100, tier="easy",    size=0x10),
            _target("ov006", 0x200, tier="hard",    size=0x80),
        ]
        # ov005|0x108 is matched.
        self.matched = {"ov005": [(0x108, 0x118)]}

    def test_excludes_matched(self):
        w = build_worklist(self.targets, self.matched)
        addrs = [(t.symbol.module, t.symbol.addr) for t in w]
        self.assertNotIn(("ov005", 0x108), addrs)
        self.assertEqual(len(w), 4)

    def test_filter_by_tier(self):
        w = build_worklist(self.targets, self.matched, tier="easy")
        addrs = [(t.symbol.module, t.symbol.addr) for t in w]
        # ov005|0x108 still excluded by matched filter, ov005|0x200
        # and ov006|0x100 keep.
        self.assertCountEqual(
            addrs, [("ov005", 0x200), ("ov006", 0x100)],
        )

    def test_filter_by_module(self):
        w = build_worklist(self.targets, self.matched, module="ov006")
        addrs = [(t.symbol.module, t.symbol.addr) for t in w]
        self.assertCountEqual(
            addrs, [("ov006", 0x100), ("ov006", 0x200)],
        )

    def test_filter_by_tier_and_module(self):
        w = build_worklist(
            self.targets, self.matched, tier="easy", module="ov006",
        )
        addrs = [(t.symbol.module, t.symbol.addr) for t in w]
        self.assertEqual(addrs, [("ov006", 0x100)])

    def test_order_preserved_from_input(self):
        # build_worklist must NOT re-sort (rank_targets already sorted).
        ordered = [
            _target("ov005", 0x300, tier="easy"),
            _target("ov005", 0x100, tier="easy"),
            _target("ov005", 0x200, tier="easy"),
        ]
        w = build_worklist(ordered, {})
        self.assertEqual(
            [t.symbol.addr for t in w],
            [0x300, 0x100, 0x200],
        )


class TestTierBreakdown(unittest.TestCase):
    def test_counts_match_and_unmatched(self):
        targets = [
            _target("ov005", 0x100, tier="trivial"),
            _target("ov005", 0x200, tier="trivial"),
            _target("ov005", 0x300, tier="trivial"),
            _target("ov005", 0x400, tier="easy"),
            _target("ov005", 0x500, tier="easy"),
        ]
        # 0x200 matched; 0x400 matched.
        matched = {"ov005": [(0x200, 0x210), (0x400, 0x410)]}
        b = tier_breakdown(targets, matched)
        self.assertEqual(b["trivial"], {"matched": 1, "unmatched": 2, "total": 3})
        self.assertEqual(b["easy"], {"matched": 1, "unmatched": 1, "total": 2})
        # Untouched tiers carry zeros.
        self.assertEqual(b["hard"], {"matched": 0, "unmatched": 0, "total": 0})

    def test_empty_targets(self):
        b = tier_breakdown([], {})
        for tier in ("trivial", "easy", "sinit", "named", "medium", "hard"):
            self.assertEqual(b[tier], {"matched": 0, "unmatched": 0, "total": 0})


class TestPrintSummary(unittest.TestCase):
    def test_smoke(self):
        targets = [_target("ov005", 0x100, tier="easy", name="x")]
        breakdown = tier_breakdown(targets, {})
        worklist = build_worklist(targets, {})
        buf = io.StringIO()
        with contextlib.redirect_stdout(buf):
            print_summary(breakdown, worklist, top_n=5)
        out = buf.getvalue()
        self.assertIn("Tier breakdown", out)
        self.assertIn("ov005|0x00000100", out)
        self.assertIn("0.0% matched", out)

    def test_empty_worklist_noted(self):
        buf = io.StringIO()
        with contextlib.redirect_stdout(buf):
            print_summary({}, [], top_n=5)
        self.assertIn("nothing", buf.getvalue())


class TestWriteMd(unittest.TestCase):
    def test_md_has_breakdown_and_tier_sections(self):
        targets = [
            _target("ov005", 0x100, tier="trivial", size=0x4, name="trv"),
            _target("ov005", 0x200, tier="easy", size=0x10, name="easy_a"),
        ]
        breakdown = tier_breakdown(targets, {})
        worklist = build_worklist(targets, {})
        with tempfile.TemporaryDirectory() as td:
            out = Path(td) / "next_targets.md"
            write_md(out, breakdown, worklist, version="eur",
                     top_per_tier=10)
            text = out.read_text()
        self.assertIn("# Next decomp targets (eur)", text)
        self.assertIn("## Tier breakdown", text)
        self.assertIn("## `trivial`", text)
        self.assertIn("## `easy`", text)
        self.assertIn("`trv`", text)
        self.assertIn("`easy_a`", text)

    def test_md_filter_label_rendered(self):
        targets = [_target("ov005", 0x100, tier="easy")]
        breakdown = tier_breakdown(targets, {})
        worklist = build_worklist(targets, {}, tier="easy", module="ov005")
        with tempfile.TemporaryDirectory() as td:
            out = Path(td) / "next_targets.md"
            write_md(out, breakdown, worklist, version="eur",
                     tier_filter="easy", module_filter="ov005")
            text = out.read_text()
        self.assertIn("_Filtered: tier=`easy`, module=`ov005`._", text)


class TestWriteJson(unittest.TestCase):
    def test_json_round_trips_with_expected_schema(self):
        targets = [
            _target("ov005", 0x100, tier="easy", size=0x10, name="x"),
        ]
        breakdown = tier_breakdown(targets, {})
        worklist = build_worklist(targets, {})
        with tempfile.TemporaryDirectory() as td:
            out = Path(td) / "next_targets.json"
            write_json(out, breakdown, worklist, version="eur")
            payload = json.loads(out.read_text())
        self.assertEqual(payload["version"], "eur")
        self.assertEqual(payload["filters"], {"tier": None, "module": None})
        self.assertIn("easy", payload["tier_breakdown"])
        self.assertEqual(len(payload["worklist"]), 1)
        entry = payload["worklist"][0]
        self.assertEqual(entry["module"], "ov005")
        self.assertEqual(entry["addr"], "0x00000100")
        self.assertEqual(entry["size"], 0x10)
        self.assertEqual(entry["name"], "x")


if __name__ == "__main__":
    unittest.main()
