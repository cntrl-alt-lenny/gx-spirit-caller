"""Unit tests for tools/cluster_wave_propagate.py.

The tool drives propagate_template across a cluster of unmatched
siblings. Regressions would either:
  - Fail to find the template path for a matched anchor (decomper
    runs the tool, gets a confusing "no source file" error)
  - Ship plans where derive_plan would skip — silently wasting
    the wave
  - Emit script lines that the decomper can't paste-and-run

Pinning:

  - find_template_path: reads delinks.txt, picks the `complete` TU
    whose .text section covers the anchor; returns absolute path
  - build_wave: respects --max cap; emits `capped=True` flag
  - build_wave: separates ready plans from skipped (TemplateMismatch)
  - render_text: shows totals + per-target lines + skip reasons
  - render_script: emits valid bash + correct apply-command shape
  - render_json: round-trips schema (anchor, template, ready, skipped)
"""

from __future__ import annotations

import json
import sys
import tempfile
import unittest
from pathlib import Path
from unittest import mock

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from analyze_symbols import (  # noqa: E402
    ModuleData,
    Symbol,
)
from cluster_wave_propagate import (  # noqa: E402
    Skipped,
    WavePlan,
    build_wave,
    find_template_path,
    render_json,
    render_script,
    render_text,
)
from propagate_template import (  # noqa: E402
    PropagationPlan,
    TemplateMismatch,
)


def _fn(
    module: str, addr: int, *,
    name: str | None = None, size: int = 0x20,
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


# --------------------------------------------------------------------------- #
# find_template_path
# --------------------------------------------------------------------------- #

class TestFindTemplatePath(unittest.TestCase):
    def _write_delinks(
        self, td: Path, module: str, content: str,
    ) -> Path:
        if module == "main":
            d = td / "arm9"
        elif module in ("itcm", "dtcm"):
            d = td / "arm9" / module
        else:
            d = td / "arm9" / "overlays" / module
        d.mkdir(parents=True, exist_ok=True)
        (d / "delinks.txt").write_text(content, encoding="utf-8")
        return d / "delinks.txt"

    def test_main_module_locates_complete_tu(self):
        with tempfile.TemporaryDirectory() as td_str:
            td = Path(td_str)
            self._write_delinks(
                td, "main",
                "    .text       start:0x02000000 end:0x020b4320\n"
                "\n"
                "src/main/MyFunc.c:\n"
                "    complete\n"
                "    .text start:0x02001000 end:0x02001020\n"
                "\n",
            )
            anchor = _fn("main", 0x02001000, size=0x20, name="MyFunc")
            path = find_template_path(anchor, td)
            self.assertIsNotNone(path)
            # Returned absolute against ROOT, not td. Just check the
            # tail matches the source.
            self.assertTrue(str(path).endswith("src/main/MyFunc.c"))

    def test_overlay_module_uses_overlays_subdir(self):
        with tempfile.TemporaryDirectory() as td_str:
            td = Path(td_str)
            self._write_delinks(
                td, "ov005",
                "    .text       start:0x021ad000 end:0x021ad800\n"
                "\n"
                "src/overlay005/sinit_ov005_021ad048.c:\n"
                "    complete\n"
                "    .text start:0x021ad048 end:0x021ad068\n"
                "\n",
            )
            anchor = _fn("ov005", 0x021ad048, size=0x20)
            path = find_template_path(anchor, td)
            self.assertIsNotNone(path)
            self.assertTrue(
                str(path).endswith(
                    "src/overlay005/sinit_ov005_021ad048.c",
                ),
            )

    def test_no_covering_tu_returns_none(self):
        with tempfile.TemporaryDirectory() as td_str:
            td = Path(td_str)
            self._write_delinks(
                td, "main",
                "    .text       start:0x02000000 end:0x020b4320\n"
                "\n"
                "src/main/Other.c:\n"
                "    complete\n"
                "    .text start:0x02000000 end:0x02000010\n"
                "\n",
            )
            anchor = _fn("main", 0x02001000, size=0x20)
            self.assertIsNone(find_template_path(anchor, td))

    def test_partial_tu_skipped(self):
        with tempfile.TemporaryDirectory() as td_str:
            td = Path(td_str)
            self._write_delinks(
                td, "main",
                "    .text       start:0x02000000 end:0x020b4320\n"
                "\n"
                "src/main/Partial.c:\n"
                "    .text start:0x02001000 end:0x02001020\n"
                "\n",
            )
            anchor = _fn("main", 0x02001000, size=0x20)
            # No `complete` marker → not a template source.
            self.assertIsNone(find_template_path(anchor, td))

    def test_missing_delinks_returns_none(self):
        with tempfile.TemporaryDirectory() as td_str:
            td = Path(td_str)
            anchor = _fn("main", 0x02001000)
            self.assertIsNone(find_template_path(anchor, td))


# --------------------------------------------------------------------------- #
# build_wave
# --------------------------------------------------------------------------- #

def _plan(module: str, addr: int) -> PropagationPlan:
    """Build a minimal PropagationPlan for fixture use."""
    return PropagationPlan(
        template_path=Path("/tmp/template.c"),
        target_module=module,
        target_addr=addr,
        target_name=f"func_{addr:08x}",
        output_path=Path(f"/tmp/out_{addr:08x}.c"),
        substitutions=[],
        generated_text="",
        delinks_line="",
        warnings=[],
    )


class TestBuildWave(unittest.TestCase):
    """Use mocking on derive_plan / find_clusters_for_anchor since
    those are well-tested in their own suites — here we exercise
    build_wave's orchestration."""

    def _setup_one_anchor_three_siblings(self):
        from find_pattern_clusters import Cluster
        anchor = _fn("main", 0x1000, size=0x20, name="A")
        sib1 = _fn("main", 0x2000, size=0x20)
        sib2 = _fn("main", 0x2100, size=0x20)
        sib3 = _fn("main", 0x2200, size=0x20)
        cluster = Cluster(
            fingerprint=(0x20, ()),
            matched=(anchor,),
            unmatched=(sib1, sib2, sib3),
        )
        return anchor, cluster

    def test_all_succeed(self):
        anchor, cluster = self._setup_one_anchor_three_siblings()
        with mock.patch(
            "cluster_wave_propagate.find_clusters_for_anchor",
            return_value=cluster,
        ), mock.patch(
            "cluster_wave_propagate.derive_plan",
            side_effect=lambda tpath, mod, addr, mods: _plan(mod, addr),
        ):
            wave = build_wave(
                anchor, Path("/tmp/A.c"),
                modules={}, matched={},
            )
        self.assertEqual(len(wave.plans), 3)
        self.assertEqual(wave.skipped, ())
        self.assertEqual(wave.cluster_total_unmatched, 3)
        self.assertFalse(wave.capped)

    def test_max_caps_wave(self):
        anchor, cluster = self._setup_one_anchor_three_siblings()
        with mock.patch(
            "cluster_wave_propagate.find_clusters_for_anchor",
            return_value=cluster,
        ), mock.patch(
            "cluster_wave_propagate.derive_plan",
            side_effect=lambda tpath, mod, addr, mods: _plan(mod, addr),
        ):
            wave = build_wave(
                anchor, Path("/tmp/A.c"),
                modules={}, matched={},
                max_targets=2,
            )
        self.assertEqual(len(wave.plans), 2)
        # Total is the pre-cap unmatched count; capped=True flags
        # that the wave was truncated below it.
        self.assertEqual(wave.cluster_total_unmatched, 3)
        self.assertTrue(wave.capped)

    def test_template_mismatch_skipped(self):
        anchor, cluster = self._setup_one_anchor_three_siblings()

        def _maybe_fail(tpath, mod, addr, mods):
            if addr == 0x2100:
                raise TemplateMismatch(f"sig mismatch at 0x{addr:x}")
            return _plan(mod, addr)

        with mock.patch(
            "cluster_wave_propagate.find_clusters_for_anchor",
            return_value=cluster,
        ), mock.patch(
            "cluster_wave_propagate.derive_plan",
            side_effect=_maybe_fail,
        ):
            wave = build_wave(
                anchor, Path("/tmp/A.c"),
                modules={}, matched={},
            )
        self.assertEqual(len(wave.plans), 2)
        self.assertEqual(len(wave.skipped), 1)
        self.assertEqual(wave.skipped[0].addr, 0x2100)

    def test_no_cluster_yields_empty_wave(self):
        anchor = _fn("main", 0x1000, size=0x20, name="A")
        with mock.patch(
            "cluster_wave_propagate.find_clusters_for_anchor",
            return_value=None,
        ):
            wave = build_wave(
                anchor, Path("/tmp/A.c"),
                modules={}, matched={},
            )
        self.assertEqual(wave.plans, ())
        self.assertEqual(wave.cluster_total_unmatched, 0)


# --------------------------------------------------------------------------- #
# Renderers
# --------------------------------------------------------------------------- #

def _wave(
    *, plans=(), skipped=(), capped=False, total=None,
) -> WavePlan:
    if total is None:
        total = len(plans) + len(skipped)
    return WavePlan(
        template_path=Path("/tmp/A.c"),
        anchor=_fn("main", 0x1000, name="A"),
        plans=tuple(plans),
        skipped=tuple(skipped),
        cluster_total_unmatched=total,
        capped=capped,
    )


class TestRenderText(unittest.TestCase):
    def test_no_siblings_message(self):
        wave = _wave(total=0)
        out = render_text(wave)
        self.assertIn("No unmatched siblings", out)

    def test_ready_section_renders(self):
        plans = (_plan("main", 0x2000), _plan("main", 0x2100))
        wave = _wave(plans=plans)
        out = render_text(wave)
        self.assertIn("Ready: 2", out)
        self.assertIn("0x00002000", out)
        self.assertIn("0x00002100", out)

    def test_skipped_section_with_reasons(self):
        plans = (_plan("main", 0x2000),)
        skipped = (Skipped(module="main", addr=0x2100, reason="bad sig"),)
        wave = _wave(plans=plans, skipped=skipped)
        out = render_text(wave)
        self.assertIn("Skipped: 1", out)
        self.assertIn("bad sig", out)

    def test_capped_message_shown(self):
        wave = _wave(plans=(_plan("main", 0x2000),), capped=True, total=1)
        out = render_text(wave)
        self.assertIn("capped by --max", out)


class TestRenderScript(unittest.TestCase):
    def test_emits_apply_lines(self):
        plans = (
            _plan("main", 0x2000),
            _plan("ov005", 0x021b0000),
        )
        wave = _wave(plans=plans)
        script = render_script(wave, version="eur")
        self.assertIn("#!/usr/bin/env bash", script)
        self.assertIn("set -euo pipefail", script)
        # One apply per plan.
        self.assertEqual(
            script.count("propagate_template.py apply"), 2,
        )
        # Module + addr passed positionally to --target.
        self.assertIn("--target main 0x00002000", script)
        self.assertIn("--target ov005 0x021b0000", script)
        self.assertIn("--version eur", script)

    def test_empty_plan_emits_visible_message(self):
        wave = _wave(plans=(), total=0)
        script = render_script(wave, version="eur")
        self.assertIn("No ready targets", script)


class TestRenderJson(unittest.TestCase):
    def test_schema_round_trip(self):
        plans = (_plan("main", 0x2000),)
        skipped = (Skipped(module="ov005", addr=0x3000, reason="x"),)
        wave = _wave(plans=plans, skipped=skipped)
        payload = json.loads(render_json(wave))
        self.assertEqual(payload["anchor"]["name"], "A")
        self.assertEqual(payload["cluster_total_unmatched"], 2)
        self.assertEqual(len(payload["ready"]), 1)
        self.assertEqual(payload["ready"][0]["addr"], 0x2000)
        self.assertEqual(len(payload["skipped"]), 1)
        self.assertEqual(payload["skipped"][0]["reason"], "x")


if __name__ == "__main__":
    unittest.main()
