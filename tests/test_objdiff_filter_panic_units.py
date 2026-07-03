"""Unit tests for `tools/objdiff_filter_panic_units.py`.

Two failure modes covered:

  A. **ARM-crash filter** (brief 187 original). Drop units whose
     target `.o` has no addressable `.text` code.
  B. **`.legacy.c` rewrite** (brief 199 followup). dsd advertises a
     bare `<name>.o` in `target_path` / `base_path` even for units
     compiled from `<name>.legacy.c`; the actual artifact lives at
     `<name>.legacy.o`. The filter should rewrite the paths so
     `objdiff-cli report generate` finds the file.

Plus the helpers in isolation:

  - `_legacy_suffix_from_source` — `.legacy.c` → `.legacy.o`,
    `.legacy_sp3.c` → `.legacy_sp3.o`, plain `.c` → None.
  - `_rewrite_path_for_legacy` — string-only suffix swap.
"""

from __future__ import annotations

import json
import struct
import sys
import tempfile
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from objdiff_filter_panic_units import (  # noqa: E402
    _legacy_suffix_from_source,
    _rewrite_path_for_legacy,
    filter_objdiff_json,
)


# Minimal ELF32 ARM little-endian object with one `.text` section
# carrying 4 bytes of code and one STT_FUNC symbol covering it.
# Built by hand to avoid pulling in pyelftools — same shape the
# real filter would accept as "addressable .text code". 0x100 is
# more than enough room.
def _make_minimal_arm_elf(*, with_func_symbol: bool,
                          data_first: bool = False) -> bytes:
    # Layout: header (0x34) + section header table (0x80) +
    # .shstrtab + .symtab + .strtab + .text bytes.
    # Section order in shdr table (idx): 0 NULL, 1 .text, 2 .shstrtab,
    # 3 .symtab, 4 .strtab.
    shstrtab_names = b"\x00.shstrtab\x00.text\x00.symtab\x00.strtab\x00"
    shstrtab_off = 0x34 + 5 * 0x28  # after header + 5 shdrs
    shstrtab_size = len(shstrtab_names)

    strtab_names = b"\x00func_test\x00data_test\x00"
    strtab_off = shstrtab_off + shstrtab_size
    strtab_size = len(strtab_names)

    # symtab: 1 NULL entry + (optionally) 1 STT_FUNC at sh #1 (.text)
    # + (if data_first) 1 STT_OBJECT preceding the func in .text.
    # ELF32 symbol entry = 16 bytes
    sym_count = 1 + (1 if with_func_symbol else 0) + (1 if data_first else 0)
    symtab_off = strtab_off + strtab_size
    symtab_size = sym_count * 16

    text_off = symtab_off + symtab_size
    # data_first layout mirrors _dsd_gap@main_202.o: a sized OBJECT
    # blob at .text:0 followed by the FUNC — no ARM mapping symbols.
    text_size = 8 if data_first else 4
    text_bytes = (b"\xde\xad\xbe\xef" + b"\x00\xf0\x20\xe3") if data_first \
        else b"\x00\xf0\x20\xe3"  # ARM `nop` (+ leading data blob)

    total_size = text_off + text_size
    buf = bytearray(total_size)

    # ELF header
    buf[0:4] = b"\x7fELF"
    buf[4] = 1  # ELFCLASS32
    buf[5] = 1  # ELFDATA2LSB
    buf[6] = 1  # EV_CURRENT
    struct.pack_into("<H", buf, 0x10, 1)  # e_type ET_REL
    struct.pack_into("<H", buf, 0x12, 0x28)  # e_machine ARM
    struct.pack_into("<I", buf, 0x14, 1)  # e_version
    struct.pack_into("<I", buf, 0x20, 0x34)  # e_shoff (right after header)
    struct.pack_into("<H", buf, 0x28, 0x34)  # e_ehsize
    struct.pack_into("<H", buf, 0x2e, 0x28)  # e_shentsize
    struct.pack_into("<H", buf, 0x30, 5)  # e_shnum (NULL + .text + .shstrtab + .symtab + .strtab)
    struct.pack_into("<H", buf, 0x32, 2)  # e_shstrndx → idx 2 (.shstrtab)

    # Section headers — each 0x28 bytes
    def write_shdr(idx: int, name_off: int, sh_type: int, sh_flags: int,
                   sh_addr: int, sh_off: int, sh_size: int, sh_link: int,
                   sh_info: int, sh_align: int, sh_entsize: int) -> None:
        base = 0x34 + idx * 0x28
        struct.pack_into("<I", buf, base + 0x00, name_off)
        struct.pack_into("<I", buf, base + 0x04, sh_type)
        struct.pack_into("<I", buf, base + 0x08, sh_flags)
        struct.pack_into("<I", buf, base + 0x0C, sh_addr)
        struct.pack_into("<I", buf, base + 0x10, sh_off)
        struct.pack_into("<I", buf, base + 0x14, sh_size)
        struct.pack_into("<I", buf, base + 0x18, sh_link)
        struct.pack_into("<I", buf, base + 0x1C, sh_info)
        struct.pack_into("<I", buf, base + 0x20, sh_align)
        struct.pack_into("<I", buf, base + 0x24, sh_entsize)

    # shstrtab string offsets (after the initial \x00 separator at
    # idx 0, names live at): ".shstrtab" → 1, ".text" → 11,
    # ".symtab" → 17, ".strtab" → 25. The offsets index INTO the
    # string table, NOT a section table.
    NAME_SHSTRTAB = 1
    NAME_TEXT = 11
    NAME_SYMTAB = 17
    NAME_STRTAB = 25

    # idx 0 — NULL section
    write_shdr(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
    # idx 1 — .text
    write_shdr(1, NAME_TEXT, 1, 6, 0, text_off, text_size, 0, 0, 4, 0)
    # idx 2 — .shstrtab
    write_shdr(2, NAME_SHSTRTAB, 3, 0, 0, shstrtab_off, shstrtab_size, 0, 0, 1, 0)
    # idx 3 — .symtab (sh_link → idx 4 .strtab)
    write_shdr(3, NAME_SYMTAB, 2, 0, 0, symtab_off, symtab_size, 4, 0, 4, 16)
    # idx 4 — .strtab
    write_shdr(4, NAME_STRTAB, 3, 0, 0, strtab_off, strtab_size, 0, 0, 1, 0)

    # shstrtab bytes
    buf[shstrtab_off:shstrtab_off + shstrtab_size] = shstrtab_names
    # strtab bytes
    buf[strtab_off:strtab_off + strtab_size] = strtab_names

    # Symbol table
    # idx 0 — NULL symbol (16 zero bytes — already zeroed)
    next_sym = symtab_off + 16
    func_value = 4 if data_first else 0
    if data_first:
        # STT_OBJECT data blob at .text:0, size 4 — the v3 crash
        # variant's leading symbol (BuildInfo analogue).
        struct.pack_into("<I", buf, next_sym + 0x0, 11)  # st_name → "data_test"
        struct.pack_into("<I", buf, next_sym + 0x4, 0)   # st_value
        struct.pack_into("<I", buf, next_sym + 0x8, 4)   # st_size
        buf[next_sym + 0xC] = 0x11  # st_info: STB_GLOBAL | STT_OBJECT
        buf[next_sym + 0xD] = 0
        struct.pack_into("<H", buf, next_sym + 0xE, 1)   # st_shndx → .text
        next_sym += 16
    if with_func_symbol:
        # STT_FUNC in .text, size 4, bound to section 1
        struct.pack_into("<I", buf, next_sym + 0x0, 1)  # st_name → "func_test"
        struct.pack_into("<I", buf, next_sym + 0x4, func_value)  # st_value
        struct.pack_into("<I", buf, next_sym + 0x8, 4)  # st_size
        buf[next_sym + 0xC] = 0x12  # st_info: STB_GLOBAL | STT_FUNC
        buf[next_sym + 0xD] = 0  # st_other
        struct.pack_into("<H", buf, next_sym + 0xE, 1)  # st_shndx → .text

    # .text bytes
    buf[text_off:text_off + text_size] = text_bytes

    return bytes(buf)


class TestLegacySuffixFromSource(unittest.TestCase):
    """`_legacy_suffix_from_source` — maps source filename → .o suffix."""

    def test_legacy_c(self) -> None:
        self.assertEqual(
            _legacy_suffix_from_source("src/main/func_abc.legacy.c"),
            ".legacy.o",
        )

    def test_legacy_sp3_c(self) -> None:
        self.assertEqual(
            _legacy_suffix_from_source("src/main/func_abc.legacy_sp3.c"),
            ".legacy_sp3.o",
        )

    def test_plain_c(self) -> None:
        self.assertIsNone(_legacy_suffix_from_source("src/main/func_abc.c"))

    def test_empty(self) -> None:
        self.assertIsNone(_legacy_suffix_from_source(""))

    def test_misleading_substring(self) -> None:
        # `.legacy` mid-string ≠ routing tier; must be the .c
        # filename suffix.
        self.assertIsNone(
            _legacy_suffix_from_source("src/main/legacy_helper.c"),
        )


class TestRewritePathForLegacy(unittest.TestCase):
    """`_rewrite_path_for_legacy` — string-only suffix swap."""

    def test_legacy_o(self) -> None:
        self.assertEqual(
            _rewrite_path_for_legacy(
                "build/eur/delinks/src/main/func_abc.o", ".legacy.o",
            ),
            "build/eur/delinks/src/main/func_abc.legacy.o",
        )

    def test_legacy_sp3_o(self) -> None:
        self.assertEqual(
            _rewrite_path_for_legacy(
                "build/eur/delinks/src/main/func_abc.o", ".legacy_sp3.o",
            ),
            "build/eur/delinks/src/main/func_abc.legacy_sp3.o",
        )

    def test_non_o_passthrough(self) -> None:
        # Defensive: malformed entries with no trailing .o are
        # returned unchanged instead of corrupted.
        self.assertEqual(
            _rewrite_path_for_legacy("src/main/func.c", ".legacy.o"),
            "src/main/func.c",
        )


class TestFilterObjdiffJson(unittest.TestCase):
    """End-to-end filter behaviour against a synthetic objdiff.json."""

    def setUp(self) -> None:
        self.tmpdir = tempfile.TemporaryDirectory()
        self.root = Path(self.tmpdir.name)
        (self.root / "build").mkdir()

    def tearDown(self) -> None:
        self.tmpdir.cleanup()

    def _write_unit_o(self, rel_path: str, with_func_symbol: bool = True,
                      data_first: bool = False) -> None:
        p = self.root / rel_path
        p.parent.mkdir(parents=True, exist_ok=True)
        p.write_bytes(_make_minimal_arm_elf(
            with_func_symbol=with_func_symbol, data_first=data_first))

    def _write_objdiff_json(self, units: list[dict]) -> Path:
        p = self.root / "objdiff.json"
        p.write_text(json.dumps({"units": units}, indent=2))
        return p

    def test_drops_unit_with_missing_target(self) -> None:
        """Case B in the docstring — unit's `.o` file doesn't exist
        and `source_path` is a plain `.c`. Drop with the
        unmatched-routing-tier reason."""
        p = self._write_objdiff_json([
            {
                "name": "ghost_unit",
                "target_path": "build/never_built.o",
                "base_path": "build/never_built.o",
                "metadata": {"source_path": "src/never.c"},
            },
        ])
        kept, dropped, reasons = filter_objdiff_json(p, project_root=self.root)
        self.assertEqual(kept, 0)
        self.assertEqual(dropped, 1)
        self.assertIn("unmatched routing-tier", reasons[0][1])

    def test_drops_unit_without_addressable_text(self) -> None:
        """Case A — `.text` exists but has no STT_FUNC symbol covering
        it. Drops as "ARM crash trigger"."""
        self._write_unit_o("build/code_less.o", with_func_symbol=False)
        p = self._write_objdiff_json([
            {
                "name": "code_less_unit",
                "target_path": "build/code_less.o",
                "base_path": "build/code_less.o",
                "metadata": {"source_path": "src/code_less.c"},
            },
        ])
        kept, dropped, reasons = filter_objdiff_json(p, project_root=self.root)
        self.assertEqual(kept, 0)
        self.assertEqual(dropped, 1)
        self.assertIn("ARM crash trigger", reasons[0][1])

    def test_drops_unit_with_data_first_text(self) -> None:
        """Case A, v3 variant (2026-07-03) — `.text` HAS a sized
        STT_FUNC, but a sized STT_OBJECT sits at the LOWEST offset
        (data-first `.text`, no mapping symbols). Real example:
        USA `_dsd_gap@main_202.o` = BuildInfo (OBJECT, 0x0..0xcc) +
        `main` (FUNC, 0xcc..0xdc) → objdiff-core arm.rs:130 panics
        with `len is 1, index usize::MAX`. Must drop."""
        self._write_unit_o("build/data_first.o", with_func_symbol=True,
                           data_first=True)
        p = self._write_objdiff_json([
            {
                "name": "data_first_unit",
                "target_path": "build/data_first.o",
                "base_path": "build/data_first.o",
                "metadata": {"source_path": "src/data_first.c"},
            },
        ])
        kept, dropped, reasons = filter_objdiff_json(p, project_root=self.root)
        self.assertEqual(kept, 0)
        self.assertEqual(dropped, 1)
        self.assertIn("ARM crash trigger", reasons[0][1])

    def test_keeps_unit_with_addressable_text(self) -> None:
        """Happy path — `.o` exists, has STT_FUNC covering `.text`,
        plain `.c` source. Unit survives."""
        self._write_unit_o("build/good.o", with_func_symbol=True)
        p = self._write_objdiff_json([
            {
                "name": "good_unit",
                "target_path": "build/good.o",
                "base_path": "build/good.o",
                "metadata": {"source_path": "src/good.c"},
            },
        ])
        kept, dropped, reasons = filter_objdiff_json(p, project_root=self.root)
        self.assertEqual(kept, 1)
        self.assertEqual(dropped, 0)
        self.assertEqual(reasons, [])

    def test_rewrites_legacy_c_paths_when_bare_o_missing(self) -> None:
        """Brief 199 followup — dsd advertises `func_abc.o` but mwcc
        compiled `func_abc.legacy.c` to `func_abc.legacy.o`. Filter
        rewrites target_path + base_path to point at the real
        artifact."""
        self._write_unit_o("build/delinks/func_abc.legacy.o", with_func_symbol=True)
        self._write_unit_o("build/src/func_abc.legacy.o", with_func_symbol=True)
        p = self._write_objdiff_json([
            {
                "name": "legacy_unit",
                "target_path": "build/delinks/func_abc.o",
                "base_path": "build/src/func_abc.o",
                "metadata": {"source_path": "src/func_abc.legacy.c"},
            },
        ])
        kept, dropped, reasons = filter_objdiff_json(p, project_root=self.root)
        self.assertEqual(kept, 1, msg=f"expected kept; got reasons={reasons}")
        self.assertEqual(dropped, 0)

        with p.open() as f:
            written = json.load(f)
        self.assertEqual(
            written["units"][0]["target_path"],
            "build/delinks/func_abc.legacy.o",
        )
        self.assertEqual(
            written["units"][0]["base_path"],
            "build/src/func_abc.legacy.o",
        )

    def test_rewrites_legacy_sp3_paths(self) -> None:
        """Same rewrite for `.legacy_sp3.c` → `.legacy_sp3.o`."""
        self._write_unit_o("build/delinks/func_xyz.legacy_sp3.o", with_func_symbol=True)
        self._write_unit_o("build/src/func_xyz.legacy_sp3.o", with_func_symbol=True)
        p = self._write_objdiff_json([
            {
                "name": "legacy_sp3_unit",
                "target_path": "build/delinks/func_xyz.o",
                "base_path": "build/src/func_xyz.o",
                "metadata": {"source_path": "src/func_xyz.legacy_sp3.c"},
            },
        ])
        kept, dropped, _reasons = filter_objdiff_json(p, project_root=self.root)
        self.assertEqual(kept, 1)
        self.assertEqual(dropped, 0)

        with p.open() as f:
            written = json.load(f)
        self.assertEqual(
            written["units"][0]["target_path"],
            "build/delinks/func_xyz.legacy_sp3.o",
        )

    def test_drops_legacy_unit_when_neither_variant_exists(self) -> None:
        """Source says `.legacy.c` but neither bare nor `.legacy.o`
        exists on disk → drop with the explicit `.legacy.o variant
        also missing` reason."""
        p = self._write_objdiff_json([
            {
                "name": "missing_legacy_unit",
                "target_path": "build/delinks/func_gone.o",
                "base_path": "build/src/func_gone.o",
                "metadata": {"source_path": "src/func_gone.legacy.c"},
            },
        ])
        kept, dropped, reasons = filter_objdiff_json(p, project_root=self.root)
        self.assertEqual(kept, 0)
        self.assertEqual(dropped, 1)
        self.assertIn(".legacy.o variant also missing", reasons[0][1])

    def test_idempotent_on_already_filtered_json(self) -> None:
        """Re-running filter on a filtered json is a no-op (same
        kept units, no further drops)."""
        self._write_unit_o("build/good.o", with_func_symbol=True)
        p = self._write_objdiff_json([
            {
                "name": "good_unit",
                "target_path": "build/good.o",
                "base_path": "build/good.o",
                "metadata": {"source_path": "src/good.c"},
            },
        ])
        kept1, dropped1, _ = filter_objdiff_json(p, project_root=self.root)
        kept2, dropped2, _ = filter_objdiff_json(p, project_root=self.root)
        self.assertEqual((kept1, dropped1), (1, 0))
        self.assertEqual((kept2, dropped2), (1, 0))


if __name__ == "__main__":
    unittest.main()
