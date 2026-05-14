"""Unit tests for tools/list_named_tier_callees.py.

Brief 065 wave 3 follow-up — enumerates the named NitroSDK / MSL_C
API surface that the decomper's bulk-port pre-filter consumes.
Pins:
  - family_of() routing (longest-prefix wins, unprefixed BIOS thunks
    routed correctly, unknown names default to `other`)
  - collect_local_named() symbols.txt parsing skips `func_<addr>`
    placeholders
  - Filter by family slug AND raw prefix both work
  - Output renderers (text / JSON / CSV) produce stable shapes

Run locally:
    python -m unittest tests.test_list_named_tier_callees
"""

from __future__ import annotations

import json as _json
import sys
import tempfile
import unittest
from pathlib import Path
from unittest import mock

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from list_named_tier_callees import (  # noqa: E402
    FAMILIES,
    NamedSymbol,
    UNPREFIXED_NAMED,
    collect_local_named,
    family_of,
    filter_by_family,
    render_csv,
    render_json,
    render_text,
)


# --------------------------------------------------------------------------- #
# Family detection
# --------------------------------------------------------------------------- #


class TestFamilyOf(unittest.TestCase):
    def test_mi_internal_beats_mi(self):
        # `MIi_` is in FAMILIES *before* `MI_` so longest-prefix-wins
        # routes `MIi_CpuCopy16` to `mi-internal`, not `mi`.
        self.assertEqual(family_of("MIi_CpuCopy16"), "mi-internal")
        self.assertEqual(family_of("MI_CpuCopy16"), "mi")

    def test_osi_beats_os(self):
        self.assertEqual(family_of("OSi_GetTickCounter"), "os-internal")
        self.assertEqual(family_of("OS_GetTick"), "os")

    def test_card_family(self):
        self.assertEqual(family_of("CARD_Init"), "card")
        self.assertEqual(family_of("CARD_ReadRom"), "card")

    def test_math_family(self):
        self.assertEqual(family_of("MATH_CalcCRC16"), "math")

    def test_fx_family(self):
        self.assertEqual(family_of("FX_Inv"), "fx")
        self.assertEqual(family_of("FX_Mul"), "fx")

    def test_unprefixed_bios_thunk(self):
        # BIOS thunks like `Fill32`, `CpuSet`, `IntrWait` have no
        # family prefix — they land in `unprefixed`.
        self.assertEqual(family_of("Fill32"), "unprefixed")
        self.assertEqual(family_of("CpuSet"), "unprefixed")
        self.assertEqual(family_of("IntrWait"), "unprefixed")
        self.assertEqual(family_of("VBlankIntrWait"), "unprefixed")

    def test_msl_c_strings(self):
        self.assertEqual(family_of("strcmp"), "unprefixed")
        self.assertEqual(family_of("memset"), "unprefixed")
        self.assertEqual(family_of("memcpy"), "unprefixed")

    def test_unknown_routes_to_other(self):
        # A name that matches no family prefix and isn't in the
        # UNPREFIXED_NAMED set falls through to `other`.
        self.assertEqual(family_of("SomeGameFunction"), "other")
        self.assertEqual(family_of("HandleMenu"), "other")


# --------------------------------------------------------------------------- #
# Local symbols.txt parser
# --------------------------------------------------------------------------- #


class TestCollectLocalNamed(unittest.TestCase):
    def _make_config_dir(self, region: str, symbols_text: str) -> Path:
        tmp = Path(tempfile.mkdtemp())
        path = tmp / region / "arm9"
        path.mkdir(parents=True)
        (path / "symbols.txt").write_text(symbols_text)
        return tmp

    def test_skips_func_placeholders(self):
        # `func_<addr>` is a placeholder for not-yet-named symbols.
        # Those are exactly what brief 069 is trying to discover
        # source for; they're NOT named-tier.
        td = self._make_config_dir("eur",
            "Fill32 kind:function(arm,size=0x14) addr:0x020944c0\n"
            "func_02006164 kind:function(arm,size=0x18) "
            "addr:0x02006164\n"
            "OS_GetTick kind:function(arm,size=0xb0) addr:0x020930b0\n"
        )
        with mock.patch("list_named_tier_callees.CONFIG_DIR", td):
            out = collect_local_named("eur")
        names = sorted(s.name for s in out)
        self.assertEqual(names, ["Fill32", "OS_GetTick"])
        # `func_02006164` is excluded.

    def test_assigns_correct_family(self):
        td = self._make_config_dir("eur",
            "Fill32 kind:function(arm,size=0x14) addr:0x020944c0\n"
            "OS_GetTick kind:function(arm,size=0xb0) addr:0x020930b0\n"
            "MIi_CpuCopy16 kind:function(arm,size=0x40) "
            "addr:0x020931a0\n"
        )
        with mock.patch("list_named_tier_callees.CONFIG_DIR", td):
            out = collect_local_named("eur")
        by_name = {s.name: s.family for s in out}
        self.assertEqual(by_name["Fill32"], "unprefixed")
        self.assertEqual(by_name["OS_GetTick"], "os")
        self.assertEqual(by_name["MIi_CpuCopy16"], "mi-internal")

    def test_deduplicates_across_files(self):
        # Same name in multiple symbols.txt files (rare but possible
        # with overlay relocs) → reported once.
        tmp = Path(tempfile.mkdtemp())
        (tmp / "eur" / "arm9").mkdir(parents=True)
        (tmp / "eur" / "arm9" / "symbols.txt").write_text(
            "OS_GetTick kind:function(arm,size=0xb0) addr:0x020930b0\n"
        )
        (tmp / "eur" / "arm9" / "itcm").mkdir()
        (tmp / "eur" / "arm9" / "itcm" / "symbols.txt").write_text(
            "OS_GetTick kind:function(arm,size=0xb0) addr:0x020930b0\n"
        )
        with mock.patch("list_named_tier_callees.CONFIG_DIR", tmp):
            out = collect_local_named("eur")
        names = [s.name for s in out]
        self.assertEqual(names.count("OS_GetTick"), 1)

    def test_missing_region_dir_returns_empty(self):
        tmp = Path(tempfile.mkdtemp())
        with mock.patch("list_named_tier_callees.CONFIG_DIR", tmp):
            out = collect_local_named("nonexistent")
        self.assertEqual(out, [])

    def test_data_symbols_ignored(self):
        # Only `kind:function` lines participate; `kind:data` /
        # `kind:bss` are out of scope.
        td = self._make_config_dir("eur",
            "OS_GetTick kind:function(arm,size=0xb0) "
            "addr:0x020930b0\n"
            "data_02103d74 kind:data(any) addr:0x02103d74\n"
            "BuildInfo kind:data(any) addr:0x02000b68\n"
        )
        with mock.patch("list_named_tier_callees.CONFIG_DIR", td):
            out = collect_local_named("eur")
        names = sorted(s.name for s in out)
        self.assertEqual(names, ["OS_GetTick"])


# --------------------------------------------------------------------------- #
# Family filtering
# --------------------------------------------------------------------------- #


class TestFilterByFamily(unittest.TestCase):
    def _make_symbols(self) -> list[NamedSymbol]:
        return [
            NamedSymbol("OS_GetTick", "os", "local:eur", ""),
            NamedSymbol("OS_InitTick", "os", "local:eur", ""),
            NamedSymbol("MI_CpuCopy16", "mi", "upstream:pokediamond", ""),
            NamedSymbol("Fill32", "unprefixed", "local:eur", ""),
        ]

    def test_slug_filter(self):
        out = filter_by_family(self._make_symbols(), "os")
        names = sorted(s.name for s in out)
        self.assertEqual(names, ["OS_GetTick", "OS_InitTick"])

    def test_slug_filter_case_insensitive(self):
        # Decomper may type `--family OS` or `--family os`.
        out = filter_by_family(self._make_symbols(), "OS")
        names = sorted(s.name for s in out)
        self.assertEqual(names, ["OS_GetTick", "OS_InitTick"])

    def test_raw_prefix_filter(self):
        # `MI_` doesn't match a slug → falls back to raw-prefix
        # match on the name.
        out = filter_by_family(self._make_symbols(), "MI_")
        names = sorted(s.name for s in out)
        self.assertEqual(names, ["MI_CpuCopy16"])

    def test_empty_filter_returns_empty(self):
        out = filter_by_family(self._make_symbols(), "NOMATCH")
        self.assertEqual(out, [])


# --------------------------------------------------------------------------- #
# Output renderers
# --------------------------------------------------------------------------- #


class TestRenderers(unittest.TestCase):
    def _sample(self) -> list[NamedSymbol]:
        return [
            NamedSymbol("OS_GetTick", "os", "local:eur",
                        "config/eur/arm9/symbols.txt"),
            NamedSymbol("MI_CpuCopy16", "mi", "upstream:pokediamond",
                        "arm9/lib/NitroSDK/src/MI_memory.c:17"),
            NamedSymbol("Fill32", "unprefixed", "local:eur",
                        "config/eur/arm9/symbols.txt"),
        ]

    def test_text_groups_by_family(self):
        out = render_text(self._sample())
        # All three names show up
        self.assertIn("OS_GetTick", out)
        self.assertIn("MI_CpuCopy16", out)
        self.assertIn("Fill32", out)
        # Grouped headings
        self.assertIn("mi ", out)
        self.assertIn("os ", out)
        self.assertIn("unprefixed", out)

    def test_text_empty_input(self):
        out = render_text([])
        self.assertIn("no named-tier", out.lower())

    def test_json_is_valid(self):
        out = render_json(self._sample())
        parsed = _json.loads(out)
        self.assertEqual(len(parsed), 3)
        names = sorted(p["name"] for p in parsed)
        self.assertEqual(names, ["Fill32", "MI_CpuCopy16", "OS_GetTick"])

    def test_csv_header_present(self):
        out = render_csv(self._sample())
        self.assertIn("name,family,source,detail", out)
        self.assertIn("OS_GetTick", out)
        self.assertIn("pokediamond", out)


# --------------------------------------------------------------------------- #
# Family-registry drift protection
# --------------------------------------------------------------------------- #


class TestFamilyRegistry(unittest.TestCase):
    def test_internal_families_come_before_their_parents(self):
        # Drift-check: `MIi_` must precede `MI_` in the FAMILIES
        # list (longest-prefix-wins ordering). Same for OSi_ / OS_,
        # WMi_ / WM_.
        order = [prefix for prefix, _ in FAMILIES]
        for child, parent in (("MIi_", "MI_"), ("OSi_", "OS_"),
                               ("WMi_", "WM_")):
            if child in order and parent in order:
                self.assertLess(
                    order.index(child), order.index(parent),
                    f"{child} must precede {parent} in FAMILIES "
                    f"for longest-prefix routing to work",
                )

    def test_unprefixed_set_contains_brief_065_trigger(self):
        # Fill32 is what tripped wave 3's linker. If we ever lose
        # it from UNPREFIXED_NAMED, the family_of() routing would
        # drop it to `other` and the decomper's pre-filter would
        # miss it.
        self.assertIn("Fill32", UNPREFIXED_NAMED)


if __name__ == "__main__":
    unittest.main()
