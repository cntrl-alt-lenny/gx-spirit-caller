"""Tests for the generated cross-region data-alias fallback guard."""

from __future__ import annotations

import sys
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))

from cross_region_aliases import (  # noqa: E402
    derive_aliases,
    load_entries,
)
from port_to_region import (  # noqa: E402
    Resolution,
    SymbolRef,
    resolve_symbol,
)


class CrossRegionAliasGuardTests(unittest.TestCase):
    def test_committed_blocklist_matches_reproducible_derivation(self):
        derived = derive_aliases(ROOT)
        self.assertEqual(len(derived), 105)
        self.assertEqual(load_entries(), derived)

    def test_blocked_exact_address_fallback_refuses_loudly(self):
        row = next(row for row in load_entries() if row["module"] == "main")
        module = str(row["module"])
        address = int(str(row["addr"]), 16)
        ref = SymbolRef(
            text=str(row["name"]), kind="data", module=module, addr=address,
        )
        result = resolve_symbol(
            ref, "usa", {}, {},
            {module: {address: "wrong_target_object"}},
            find_siblings_fn=None,
        )
        self.assertEqual(result, Resolution(
            eur_ref=ref,
            target_name=None,
            confidence="NONE",
            notes=f"refused: cross-region alias at 0x{address:08x}",
        ))

    def test_primary_reloc_pairing_bypasses_blocklist(self):
        row = next(row for row in load_entries() if row["module"] == "main")
        module = str(row["module"])
        address = int(str(row["addr"]), 16)
        mapped_address = address + 0x10
        ref = SymbolRef(
            text=str(row["name"]), kind="data", module=module, addr=address,
        )
        result = resolve_symbol(
            ref, "usa", {}, {},
            {module: {mapped_address: "reloc_paired_object"}},
            find_siblings_fn=None,
            data_addr_map={(module, address): (module, mapped_address)},
        )
        self.assertEqual(result.confidence, "EXACT_ADDR")
        self.assertEqual(result.target_name, "reloc_paired_object")
        self.assertIn("parallel-reloc map", result.notes)

    def test_blocked_d3_fallback_refuses_before_shift_resolution(self):
        row = next(row for row in load_entries() if row["module"] == "main")
        module = str(row["module"])
        address = int(str(row["addr"]), 16)
        ref = SymbolRef(
            text=str(row["name"]), kind="data", module=module, addr=address,
        )
        result = resolve_symbol(
            ref, "usa", {}, {},
            {module: {address + 0x10: "would_be_wrong_d3_object"}},
            find_siblings_fn=None,
            data_addr_map={
                (module, 0x1000): (module, 0x1010),
                (module, 0x2000): (module, 0x2010),
            },
        )
        self.assertEqual(result.confidence, "NONE")
        self.assertEqual(
            result.notes,
            f"refused: cross-region alias at 0x{address:08x}",
        )


if __name__ == "__main__":
    unittest.main()
