"""Unit tests for tools/pattern_library.py.

This tool picks the drafting template for every new decomp. A
regression that silently returns the wrong templates would derail
matches for hundreds of functions. Pinning:

  - size bucket boundaries
  - filename → addr parsing
  - src-dir → module mapping
  - build_index only harvests .c files with resolvable stems + symbols
  - score_entry: exact sig + same shape ≈ 0.95
  - score_entry: no sig overlap + same shape ≈ 0.35
  - score_entry: mode mismatch caps score
  - score_entry: self-match returns 0
  - query: top-N cap, sort order, empty library
  - LibraryEntry JSON round-trip
  - Library JSON round-trip preserves reloc sig tuples
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
    CallGraph,
    ModuleData,
    Reloc,
    Symbol,
)
from pattern_library import (  # noqa: E402
    Library,
    LibraryEntry,
    _addr_from_stem,
    _module_from_src_dir,
    _reloc_jaccard,
    _size_bucket,
    build_index,
    query,
    score_entry,
)


def _func(
    module: str, addr: int, *,
    size: int = 0x20, mode: str = "arm",
    name: str | None = None,
) -> Symbol:
    if name is None:
        name = f"func_{addr:08x}"
    return Symbol(
        name=name, module=module, addr=addr, size=size,
        type="function", mode=mode,
    )


def _module(
    name: str, syms: list[Symbol], relocs: list[Reloc] | None = None,
) -> ModuleData:
    md = ModuleData(name=name)
    md.symbols = list(syms)
    md.by_addr = {s.addr: s for s in syms}
    md.by_addr_sorted = sorted(syms, key=lambda s: s.addr)
    md.relocs = list(relocs or [])
    return md


class TestSizeBucket(unittest.TestCase):
    def test_boundaries(self):
        self.assertEqual(_size_bucket(0x4), "leaf_tiny")
        self.assertEqual(_size_bucket(0x10), "leaf_tiny")
        self.assertEqual(_size_bucket(0x11), "leaf")
        self.assertEqual(_size_bucket(0x20), "leaf")
        self.assertEqual(_size_bucket(0x40), "small")
        self.assertEqual(_size_bucket(0x80), "medium")
        self.assertEqual(_size_bucket(0x200), "large")
        self.assertEqual(_size_bucket(0x10000), "very_large")
        self.assertEqual(_size_bucket(0xffffff), "very_large")


class TestAddrFromStem(unittest.TestCase):
    def test_overlay_stem(self):
        self.assertEqual(_addr_from_stem("ov005_021b16e4"), 0x021b16e4)

    def test_main_stem(self):
        self.assertEqual(_addr_from_stem("func_02000800"), 0x02000800)

    def test_no_hex_tail(self):
        self.assertIsNone(_addr_from_stem("entry"))

    def test_short_tail_rejected(self):
        self.assertIsNone(_addr_from_stem("foo_abc"))


class TestModuleFromSrcDir(unittest.TestCase):
    def test_main(self):
        self.assertEqual(_module_from_src_dir("main"), "main")

    def test_overlay(self):
        self.assertEqual(_module_from_src_dir("overlay005"), "ov005")
        self.assertEqual(_module_from_src_dir("overlay023"), "ov023")

    def test_unknown_is_none(self):
        self.assertIsNone(_module_from_src_dir("weird"))
        self.assertIsNone(_module_from_src_dir("overlay_bad"))


class TestRelocJaccard(unittest.TestCase):
    def test_identical(self):
        sig = ((0x8, "arm_call"), (0x10, "load"))
        self.assertEqual(_reloc_jaccard(sig, sig), 1.0)

    def test_disjoint(self):
        a = ((0x8, "arm_call"),)
        b = ((0x10, "load"),)
        self.assertEqual(_reloc_jaccard(a, b), 0.0)

    def test_partial(self):
        a = ((0x8, "arm_call"), (0x10, "load"))
        b = ((0x8, "arm_call"), (0x14, "load"))
        # 1 shared out of 3 unique
        self.assertAlmostEqual(_reloc_jaccard(a, b), 1 / 3)

    def test_both_empty_is_zero(self):
        self.assertEqual(_reloc_jaccard((), ()), 0.0)


class TestScoreEntry(unittest.TestCase):
    def _entry(
        self, sig=(), *, size=0x20, mode="arm", out_deg=1,
    ) -> LibraryEntry:
        return LibraryEntry(
            module="ov005", addr=0x021b1000,
            name="__sinit_foo", size=size, mode=mode,
            out_degree=out_deg,
            size_bucket=_size_bucket(size),
            reloc_sig=sig,
            src_path="src/overlay005/foo.c",
        )

    def test_self_match_returns_zero(self):
        target = _func("ov005", 0x021b1000)
        entry = self._entry()
        # Self: same module + same addr.
        self.assertEqual(
            score_entry(target, (), 0, entry), 0.0,
        )

    def test_exact_sig_same_shape_high_score(self):
        target = _func("main", 0x02001000)
        sig = ((0x8, "arm_call"), (0x10, "load"))
        entry = self._entry(sig=sig, size=0x20, mode="arm", out_deg=1)
        score = score_entry(target, sig, 1, entry)
        # 0.55*1 + 0.20*1 + 0.15*1 + 0.10*1 = 1.0
        self.assertAlmostEqual(score, 1.0, places=3)

    def test_no_sig_overlap_same_shape(self):
        target = _func("main", 0x02001000)
        a_sig = ((0x8, "arm_call"),)
        b_sig = ((0x18, "load"),)
        entry = self._entry(sig=b_sig, size=0x20, mode="arm", out_deg=1)
        score = score_entry(target, a_sig, 1, entry)
        # 0.55*0 + 0.20*1 + 0.15*1 + 0.10*1 = 0.45
        self.assertAlmostEqual(score, 0.45, places=3)

    def test_mode_mismatch_caps_low(self):
        target = _func("main", 0x02001000, mode="thumb")
        sig = ((0x4, "thumb_call"),)
        entry = self._entry(sig=sig, size=0x20, mode="arm", out_deg=1)
        score = score_entry(target, sig, 1, entry)
        # sig matches but mode is 0.5 instead of 1.0:
        # 0.55*1 + 0.20*1 + 0.15*1 + 0.10*0.5 = 0.95
        # That's lower than the exact-everything-match of 1.0.
        self.assertLess(score, 1.0)
        self.assertAlmostEqual(score, 0.95, places=3)

    def test_size_bucket_mismatch_penalised(self):
        target = _func("main", 0x02001000, size=0x20)  # leaf
        sig = ((0x4, "arm_call"),)
        big_entry = self._entry(sig=sig, size=0x100, mode="arm", out_deg=1)  # large
        small_entry = self._entry(sig=sig, size=0x20, mode="arm", out_deg=1)
        self.assertGreater(
            score_entry(target, sig, 1, small_entry),
            score_entry(target, sig, 1, big_entry),
        )

    def test_out_degree_diff_reduces_score(self):
        target = _func("main", 0x02001000)
        sig = ((0x4, "arm_call"),)
        close = self._entry(sig=sig, out_deg=1)
        far = self._entry(sig=sig, out_deg=5)
        self.assertGreater(
            score_entry(target, sig, 1, close),
            score_entry(target, sig, 1, far),
        )


class TestQuery(unittest.TestCase):
    def test_empty_library(self):
        target = _func("main", 0x02001000)
        md = _module("main", [target])
        modules = {"main": md}
        results = query(target, modules, CallGraph(), Library())
        self.assertEqual(results, [])

    def test_top_n_cap(self):
        target = _func("main", 0x02001000)
        md = _module("main", [target])
        modules = {"main": md}
        # Build 20 matching entries.
        entries = []
        for i in range(20):
            entries.append(LibraryEntry(
                module="ov005", addr=0x021b1000 + i * 0x100,
                name=f"sib_{i}", size=0x20, mode="arm",
                out_degree=0, size_bucket="leaf",
                reloc_sig=(),
                src_path=f"src/overlay005/sib_{i}.c",
            ))
        lib = Library(entries=entries)
        results = query(target, modules, CallGraph(), lib, top_n=5)
        self.assertEqual(len(results), 5)

    def test_sort_is_by_score_desc(self):
        target = _func("main", 0x02001000, size=0x20)
        md = _module("main", [target])
        modules = {"main": md}
        # Best-match: same bucket + same mode + same out_deg + empty sigs.
        good = LibraryEntry(
            module="ov005", addr=0x021b1000, name="good",
            size=0x20, mode="arm", out_degree=0,
            size_bucket="leaf", reloc_sig=(),
            src_path="src/overlay005/good.c",
        )
        # Worse: bigger bucket + higher out_deg.
        bad = LibraryEntry(
            module="ov005", addr=0x021b2000, name="bad",
            size=0x200, mode="arm", out_degree=10,
            size_bucket="large", reloc_sig=(),
            src_path="src/overlay005/bad.c",
        )
        lib = Library(entries=[bad, good])  # deliberately reversed order
        results = query(target, modules, CallGraph(), lib)
        self.assertEqual(results[0][1].name, "good")
        self.assertEqual(results[1][1].name, "bad")


class TestBuildIndex(unittest.TestCase):
    def test_harvests_matched_c_files(self):
        with tempfile.TemporaryDirectory() as td:
            tmp = Path(td)
            (tmp / "src" / "overlay005").mkdir(parents=True)
            # Write a matched .c that corresponds to a symbol in the
            # synthetic modules.
            (tmp / "src" / "overlay005" / "ov005_021b1000.c").write_text(
                "// matched body",
            )
            # Unparseable filename — skipped.
            (tmp / "src" / "overlay005" / "entry.c").write_text("void entry() {}")
            # Unknown module dir — skipped.
            (tmp / "src" / "weird").mkdir()
            (tmp / "src" / "weird" / "x_00000100.c").write_text("")

            sym = _func("ov005", 0x021b1000, size=0x20)
            modules = {"ov005": _module("ov005", [sym])}
            lib = build_index(
                tmp / "src", modules, CallGraph(),
            )
            self.assertEqual(len(lib.entries), 1)
            self.assertEqual(lib.entries[0].addr, 0x021b1000)
            # Path is relative to ROOT (= wherever pattern_library
            # computed it); just check the basename survived.
            self.assertTrue(
                lib.entries[0].src_path.endswith(
                    "ov005_021b1000.c",
                ),
            )

    def test_skips_file_when_symbol_missing(self):
        # A .c file exists but no Symbol at that addr (config out
        # of sync with src/) — skip silently rather than hallucinate.
        with tempfile.TemporaryDirectory() as td:
            tmp = Path(td)
            (tmp / "src" / "overlay005").mkdir(parents=True)
            (tmp / "src" / "overlay005" / "ov005_deadbeef.c").write_text("")
            modules = {"ov005": _module("ov005", [])}  # no symbols
            lib = build_index(tmp / "src", modules, CallGraph())
            self.assertEqual(lib.entries, [])


class TestLibraryJsonRoundTrip(unittest.TestCase):
    def test_entry_round_trip(self):
        e = LibraryEntry(
            module="ov005", addr=0x021b1000, name="sinit_foo",
            size=0x2c, mode="arm", out_degree=2,
            size_bucket="small",
            reloc_sig=((0x8, "arm_call"), (0x10, "load")),
            src_path="src/overlay005/sinit_foo.c",
        )
        restored = LibraryEntry.from_json(e.to_json())
        self.assertEqual(restored, e)

    def test_library_round_trip(self):
        lib = Library(entries=[
            LibraryEntry(
                module="main", addr=0x02001000, name="X",
                size=0x10, mode="arm", out_degree=0,
                size_bucket="leaf_tiny", reloc_sig=(),
                src_path="src/main/X.c",
            ),
        ])
        round_tripped = Library.from_json(lib.to_json())
        self.assertEqual(round_tripped.entries, lib.entries)

    def test_reloc_sig_preserves_tuple_types(self):
        # Integers must round-trip as ints, not strings (JSON only
        # has numbers so this is really a "correctly re-hydrated"
        # check).
        e = LibraryEntry(
            module="main", addr=0x0, name="x",
            size=0, mode="arm", out_degree=0,
            size_bucket="leaf_tiny",
            reloc_sig=((0x8, "arm_call"),),
            src_path="x.c",
        )
        raw = json.loads(json.dumps(e.to_json()))
        restored = LibraryEntry.from_json(raw)
        self.assertEqual(restored.reloc_sig, ((0x8, "arm_call"),))
        self.assertIsInstance(restored.reloc_sig[0][0], int)


if __name__ == "__main__":
    unittest.main()
