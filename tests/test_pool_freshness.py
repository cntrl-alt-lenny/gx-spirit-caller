"""Tests for the live pool measurement envelope."""

from __future__ import annotations

import sys
import tempfile
import unittest
from datetime import date
from pathlib import Path

TOOLS = Path(__file__).resolve().parents[1] / "tools"
sys.path.insert(0, str(TOOLS))

import pool_freshness  # noqa: E402
from pool_freshness import (  # noqa: E402
    PoolMeasurement,
    body_call_count,
    extract_queue_figures,
    measure_pool,
    stale_queue_figures,
)


class TestPoolFreshness(unittest.TestCase):
    def test_reproducer_uses_target_host_interpreter(self):
        mac = pool_freshness._reproducer_command(
            "mac", "--pool", "wall-bl4-small",
        )
        windows = pool_freshness._reproducer_command(
            "windows", "--pool", "wall-bl4-small",
        )
        self.assertTrue(mac.startswith("python3.13 tools/pool_freshness.py"))
        self.assertTrue(windows.startswith("python tools/pool_freshness.py"))

    def test_body_call_count_only_counts_exact_bl_and_blx(self):
        with tempfile.TemporaryDirectory() as tmp_dir:
            assembly = Path(tmp_dir) / "func.s"
            assembly.write_text(
                ".text\n"
                "    ble .L_done\n"
                "    bl Fill32\n"
                "    blx r3\n"
                "    blt .L_loop\n"
                "    bl func_target\n",
                encoding="utf-8",
            )
            assert body_call_count(assembly) == 3

    def test_queue_figure_extraction_is_pool_scoped(self):
        text = (
            "2026-08-01: string,string-ascii4 pool: 689 symbols / 11,588 B\n"
            "2026-08-22: wall pool: 34 candidates / 5,224 B\n"
        )
        data = extract_queue_figures(text, pool="data-string-pool")
        wall = extract_queue_figures(text, pool="wall-bl4-small")
        assert [(f.count, f.bytes) for f in data] == [(689, 11588)]
        assert [(f.count, f.bytes) for f in wall] == [(34, 5224)]

    def test_staleness_check_fires_on_expired_mismatch_and_clears_when_fresh(self):
        measurement = PoolMeasurement(
            pool="data-string-pool",
            count=0,
            bytes=0,
            revision="head",
            command="python tools/pool_freshness.py --pool data-string-pool",
            definition="fixture",
        )
        old = "Measured 2026-08-01: string,string-ascii4 pool: 689 symbols / 11,588 B"
        assert stale_queue_figures(
            old,
            measurement,
            today=date(2026, 8, 22),
            max_age_days=7,
        )[0].count == 689

        current = "Measured 2026-08-01: string,string-ascii4 pool: 0 symbols / 0 B"
        assert stale_queue_figures(
            current,
            measurement,
            today=date(2026, 8, 22),
            max_age_days=7,
        ) == []

    def test_merge_threshold_can_expire_a_recent_figure(self):
        measurement = PoolMeasurement(
            pool="wall-bl4-small",
            count=3,
            bytes=440,
            revision="head",
            command="python tools/pool_freshness.py --pool wall-bl4-small",
            definition="fixture",
        )
        text = "2026-08-22: wall >=4 bl/blx pool: 34 candidates / 5,224 B"
        stale = stale_queue_figures(
            text,
            measurement,
            today=date(2026, 8, 22),
            max_age_days=30,
            merges_since=11,
            max_merges=10,
        )
        assert [(f.count, f.bytes) for f in stale] == [(34, 5224)]

    def test_wall_default_is_all_modules_and_exceeds_main_on_live_tree(self):
        all_modules = measure_pool("wall-bl4-small", min_size=193, max_size=256)
        main_only = measure_pool(
            "wall-bl4-small", min_size=193, max_size=256, module="main",
        )
        assert all_modules.count > main_only.count

    def test_empty_module_is_rejected(self):
        try:
            measure_pool("wall-bl4-small", module="")
        except ValueError as exc:
            assert "non-empty" in str(exc)
        else:
            raise AssertionError("empty module must not silently measure an empty pool")


if __name__ == "__main__":
    unittest.main()
