"""Unit tests for tools/tier_classifier.py.

The classifier turns the manual analysis from #246 / #255 into
automatic per-tier bucketing. Regressions would either:
  - Misclassify a propagatable cluster as anchorless (decomper
    misses the matched-anchor template)
  - Misclassify an anchorless cluster as singletons (decomper
    drops the per-cluster propagation opportunity)
  - Drop singletons from the count (under-reports the long tail)

Pinning:

  - classify_tier: propagatable when a matched anchor exists at the
    same v2 fingerprint
  - classify_tier: anchorless when ≥2 in-tier siblings + 0 matched
    anchors anywhere
  - classify_tier: singleton when exactly 1 unmatched, no anchor
  - classify_tier: in-tier-but-already-matched fns excluded from
    the buckets (they're not actionable)
  - classify_tier: cross-tier anchor lookup (anchor in easy tier
    counts for a hard-tier sibling)
  - render_markdown: every bucket renders its section + count
  - render_json: schema round-trip; singletons summarised, not
    enumerated
  - _load_tier_keys: parses snapshot.json correctly; honours tier
    filter
"""

from __future__ import annotations

import json
import sys
import tempfile
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from analyze_symbols import (  # noqa: E402
    ModuleData,
    Reloc,
    Symbol,
)
from tier_classifier import (  # noqa: E402
    AnchorlessEntry,
    PropagatableEntry,
    TierClassification,
    _fmt_target_kinds,
    _load_tier_keys,
    classify_tier,
    render_json,
    render_markdown,
)


def _fn(
    module: str, addr: int, *,
    name: str | None = None,
    size: int = 0x20,
) -> Symbol:
    if name is None:
        name = f"func_{addr:08x}"
    return Symbol(
        name=name, module=module, addr=addr, size=size,
        type="function", mode="arm",
    )


def _module(name: str, syms: list[Symbol]) -> ModuleData:
    md = ModuleData(name=name)
    md.symbols = list(syms)
    md.by_addr = {s.addr: s for s in syms}
    md.by_addr_sorted = sorted(syms, key=lambda s: s.addr)
    return md


def _reloc(
    src_module: str, src_addr: int, kind: str = "arm_call",
    dest_module: str = "main", dest_addr: int = 0,
) -> Reloc:
    return Reloc(
        src_addr=src_addr, src_module=src_module,
        dest_addr=dest_addr, dest_module=dest_module,
        kind=kind,
    )


# --------------------------------------------------------------------------- #
# _load_tier_keys
# --------------------------------------------------------------------------- #

class TestLoadTierKeys(unittest.TestCase):
    def test_filters_by_tier(self):
        with tempfile.NamedTemporaryFile(
            mode="w", suffix=".json", delete=False,
        ) as f:
            json.dump({
                "symbols": {
                    "main|0x02000100": {"tier": "hard"},
                    "main|0x02000200": {"tier": "medium"},
                    "main|0x02000300": {"tier": "hard"},
                    "main|0x02000400": {"tier": "easy"},
                },
            }, f)
            path = Path(f.name)
        keys = _load_tier_keys(path, "hard")
        self.assertEqual(
            keys, {("main", 0x02000100), ("main", 0x02000300)},
        )
        path.unlink()

    def test_skips_malformed_keys(self):
        with tempfile.NamedTemporaryFile(
            mode="w", suffix=".json", delete=False,
        ) as f:
            json.dump({
                "symbols": {
                    "main|0x100": {"tier": "hard"},
                    "no_pipe_separator": {"tier": "hard"},
                    "main|not-a-hex-addr": {"tier": "hard"},
                },
            }, f)
            path = Path(f.name)
        keys = _load_tier_keys(path, "hard")
        self.assertEqual(keys, {("main", 0x100)})
        path.unlink()


# --------------------------------------------------------------------------- #
# classify_tier
# --------------------------------------------------------------------------- #

class TestClassifyTier(unittest.TestCase):
    def _setup(self):
        # 1 matched anchor (out of tier), 1 in-tier propagatable,
        # 2 anchorless siblings, 1 singleton, 1 already-matched-in-tier.
        anchor = _fn("main", 0x1000, size=0x20, name="MatchedAnchor")
        # In-tier propagatable: same fingerprint as anchor.
        prop_target = _fn("main", 0x2000, size=0x20)
        # Anchorless pair: same fingerprint, 2 unmatched, no anchor.
        a1 = _fn("main", 0x3000, size=0x40)
        a2 = _fn("main", 0x3100, size=0x40)
        # Singleton: unique fingerprint.
        single = _fn("main", 0x5000, size=0x60)
        # In-tier but already-matched (delinks `complete`): excluded.
        in_tier_matched = _fn("main", 0x6000, size=0x80)

        # All in-tier fns get one arm_call reloc to a unique target
        # (fingerprint differentiates by reloc kind structure but
        # since target is "ext" for unresolved, what differs is size).
        relocs = [
            _reloc("main", 0x1004, kind="arm_call"),  # anchor
            _reloc("main", 0x2004, kind="arm_call"),  # propagatable
            _reloc("main", 0x3004, kind="arm_call"),  # a1
            _reloc("main", 0x3104, kind="arm_call"),  # a2
            _reloc("main", 0x5004, kind="arm_call"),  # single
            _reloc("main", 0x6004, kind="arm_call"),  # in_tier_matched
        ]
        md = _module(
            "main",
            [anchor, prop_target, a1, a2, single, in_tier_matched],
            )
        md.relocs = relocs
        modules = {"main": md}
        # Anchor is matched (out of tier; e.g. it's `easy`).
        # in_tier_matched is matched (and would normally not be in
        # the hard tier, but we include it to verify the filter).
        matched = {
            "main": [(0x1000, 0x1020), (0x6000, 0x6080)],
        }
        # Hard-tier keys: prop_target, a1, a2, single, in_tier_matched.
        # (Anchor is NOT in hard tier — it's matched/easy.)
        tier_keys = {
            ("main", 0x2000), ("main", 0x3000), ("main", 0x3100),
            ("main", 0x5000), ("main", 0x6000),
        }
        return modules, matched, tier_keys

    def test_propagatable_when_anchor_exists(self):
        modules, matched, tier_keys = self._setup()
        cls = classify_tier(
            modules, matched, tier_keys, tier_name="hard",
        )
        # Find the size=0x20 entry (the propagatable one).
        prop = [e for e in cls.propagatable if e.size == 0x20]
        self.assertEqual(len(prop), 1)
        self.assertEqual(len(prop[0].anchors), 1)
        self.assertEqual(prop[0].anchors[0].name, "MatchedAnchor")
        self.assertEqual(len(prop[0].unmatched), 1)
        self.assertEqual(prop[0].unmatched[0].addr, 0x2000)

    def test_anchorless_when_two_siblings_no_anchor(self):
        modules, matched, tier_keys = self._setup()
        cls = classify_tier(
            modules, matched, tier_keys, tier_name="hard",
        )
        # Two siblings at size=0x40, no matched anchor.
        anchorless = [e for e in cls.anchorless if e.size == 0x40]
        self.assertEqual(len(anchorless), 1)
        self.assertEqual(len(anchorless[0].unmatched), 2)

    def test_singleton_when_one_unmatched_no_anchor(self):
        modules, matched, tier_keys = self._setup()
        cls = classify_tier(
            modules, matched, tier_keys, tier_name="hard",
        )
        # Size=0x60 is the singleton.
        singleton_sizes = {s.size for s in cls.singletons}
        self.assertIn(0x60, singleton_sizes)
        # And it's the ONLY size-0x60 entry.
        size_60 = [s for s in cls.singletons if s.size == 0x60]
        self.assertEqual(len(size_60), 1)

    def test_in_tier_but_matched_excluded(self):
        modules, matched, tier_keys = self._setup()
        cls = classify_tier(
            modules, matched, tier_keys, tier_name="hard",
        )
        # in_tier_matched at addr 0x6000 should not appear in any
        # bucket (it's already matched).
        all_addrs = (
            {s.addr for e in cls.propagatable for s in e.unmatched}
            | {s.addr for e in cls.anchorless for s in e.unmatched}
            | {s.addr for s in cls.singletons}
        )
        self.assertNotIn(0x6000, all_addrs)

    def test_in_tier_total_includes_all(self):
        modules, matched, tier_keys = self._setup()
        cls = classify_tier(
            modules, matched, tier_keys, tier_name="hard",
        )
        # 5 functions in tier_keys, all resolve to symbols.
        self.assertEqual(cls.in_tier_total, 5)

    def test_cross_tier_anchor_counts(self):
        # An anchor that lives in a different tier (or is just matched
        # without being in any tier currently) still counts. This is
        # the cross-tier propagation case from #255 — hard-tier siblings
        # of an easy-tier anchor.
        modules, matched, tier_keys = self._setup()
        cls = classify_tier(
            modules, matched, tier_keys, tier_name="hard",
        )
        # The anchor at 0x1000 lives outside tier_keys but its
        # fingerprint matches the in-tier propagatable. The
        # propagatable bucket should pick it up.
        self.assertGreaterEqual(len(cls.propagatable), 1)


# --------------------------------------------------------------------------- #
# Renderers
# --------------------------------------------------------------------------- #

class TestFmtTargetKinds(unittest.TestCase):
    def test_empty(self):
        self.assertEqual(_fmt_target_kinds(()), "—")

    def test_single(self):
        self.assertEqual(_fmt_target_kinds(("fn",)), "`fn`")

    def test_multiple_same(self):
        self.assertEqual(
            _fmt_target_kinds(("fn", "fn", "fn")),
            "`fn` × 3",
        )

    def test_multiple_mixed(self):
        # Keys sorted alphabetically for determinism.
        out = _fmt_target_kinds(("fn", "d4", "fn"))
        self.assertEqual(out, "`d4`, `fn` × 2")


def _empty_classification(tier: str = "hard") -> TierClassification:
    return TierClassification(
        tier=tier,
        in_tier_total=0,
        propagatable=(),
        anchorless=(),
        singletons=(),
    )


class TestRenderMarkdown(unittest.TestCase):
    def test_empty_renders_summary_with_zeros(self):
        md = render_markdown(
            _empty_classification(), version="eur",
        )
        self.assertIn("# Tier classification", md)
        self.assertIn("`hard` tier", md)
        self.assertIn("**0**", md)   # in-tier total
        self.assertIn("No propagatable clusters", md)
        self.assertIn("No anchorless clusters", md)
        self.assertIn("No singletons", md)

    def test_propagatable_rendered_with_sample_anchor(self):
        anchor = _fn("main", 0x1000, name="A")
        target = _fn("main", 0x2000, size=0x20)
        cls = TierClassification(
            tier="hard",
            in_tier_total=1,
            propagatable=(PropagatableEntry(
                fingerprint=(0x20, ((0x4, "arm_call", "fn"),)),
                anchors=(anchor,),
                unmatched=(target,),
            ),),
            anchorless=(),
            singletons=(),
        )
        md = render_markdown(cls, version="eur")
        self.assertIn("Propagatable clusters", md)
        self.assertIn("`A`", md)
        self.assertIn("`main|0x00001000`", md)
        # Unmatched count surfaces in bold.
        self.assertIn("**1**", md)

    def test_anchorless_rendered_with_count(self):
        m1 = _fn("main", 0x3000, size=0x40)
        m2 = _fn("main", 0x3100, size=0x40)
        cls = TierClassification(
            tier="hard",
            in_tier_total=2,
            propagatable=(),
            anchorless=(AnchorlessEntry(
                fingerprint=(0x40, ()),
                unmatched=(m1, m2),
            ),),
            singletons=(),
        )
        md = render_markdown(cls, version="eur")
        self.assertIn("Anchorless clusters", md)
        # 2 unmatched siblings.
        self.assertIn("**2**", md)

    def test_singletons_rendered_as_count_only(self):
        # 5 singletons should render as "**5** functions ..." — NOT
        # 5 individual rows (it'd be thousands in production).
        singles = tuple(
            _fn("main", 0x5000 + i * 0x10, size=0x80) for i in range(5)
        )
        cls = TierClassification(
            tier="hard",
            in_tier_total=5,
            propagatable=(),
            anchorless=(),
            singletons=singles,
        )
        md = render_markdown(cls, version="eur")
        self.assertIn("**5** functions", md)
        # Verify the per-fn list isn't dumped.
        for s in singles:
            self.assertNotIn(s.name, md)

    def test_truncation_message_when_top_n_exceeded(self):
        anchor = _fn("main", 0x1000, name="A")
        # Build 15 propagatable entries with descending leverage.
        prop = tuple(
            PropagatableEntry(
                fingerprint=(0x20 + i, ((0x4, "arm_call", "fn"),)),
                anchors=(anchor,),
                unmatched=(_fn("main", 0x2000 + i * 0x10, size=0x20),),
            )
            for i in range(15)
        )
        cls = TierClassification(
            tier="hard",
            in_tier_total=15,
            propagatable=prop,
            anchorless=(),
            singletons=(),
        )
        md = render_markdown(
            cls, version="eur", top_propagatable=5,
        )
        self.assertIn("(+10 more clusters truncated", md)


class TestRenderJson(unittest.TestCase):
    def test_schema_round_trip(self):
        anchor = _fn("main", 0x1000, name="A")
        target = _fn("main", 0x2000, size=0x20)
        m1 = _fn("main", 0x3000, size=0x40)
        m2 = _fn("main", 0x3100, size=0x40)
        single = _fn("main", 0x5000, size=0x80)
        cls = TierClassification(
            tier="hard",
            in_tier_total=4,
            propagatable=(PropagatableEntry(
                fingerprint=(0x20, ((0x4, "arm_call", "fn"),)),
                anchors=(anchor,),
                unmatched=(target,),
            ),),
            anchorless=(AnchorlessEntry(
                fingerprint=(0x40, ()),
                unmatched=(m1, m2),
            ),),
            singletons=(single,),
        )
        payload = json.loads(render_json(cls, version="eur"))
        self.assertEqual(payload["version"], "eur")
        self.assertEqual(payload["tier"], "hard")
        self.assertEqual(payload["totals"]["propagatable_count"], 1)
        self.assertEqual(payload["totals"]["anchorless_count"], 2)
        self.assertEqual(payload["totals"]["singletons_count"], 1)
        self.assertEqual(len(payload["propagatable"]), 1)
        self.assertEqual(
            payload["propagatable"][0]["sample_anchor"]["name"], "A",
        )
        self.assertEqual(len(payload["anchorless"]), 1)
        # Singletons NOT enumerated — only summarised by count.
        self.assertNotIn("singletons", payload)


if __name__ == "__main__":
    unittest.main()
