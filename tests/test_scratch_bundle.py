"""Unit tests for tools/scratch_bundle.py.

Decomper reads this bundle before drafting every function. Regressions
would either:
  - Leak wrong context (decomper drafts against an unrelated sibling)
  - Drop key signals (missing NitroSDK header pointer for OS_* callees)
  - Render malformed Markdown (unreadable for the decomper / LLM)

Pins:

  - module_dir_name for main/itcm/dtcm + overlays + unknown fallback
  - _parse_addr_from_filename handles all carve filename shapes
  - _find_siblings window filter (inside, at boundary, beyond)
  - _find_siblings skips self (distance=0)
  - _find_siblings cap at max_n
  - _nitro_hints surfaces OS_* PREFIX_Name callees
  - _nitro_hints surfaces bare-name BIOS thunks (WaitByLoop → OS)
  - _nitro_hints skips placeholders + non-subsystem callees
  - build_bundle composes the metadata correctly
  - render_markdown structure (headings, metadata, NitroSDK section
    only when hints present, matched-TU warning, empty-sibling note)
  - wrap_as_prompt adds pre/post sections
"""

from __future__ import annotations

import sys
import tempfile
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from analyze_symbols import (  # noqa: E402
    CallGraph,
    ModuleData,
    Symbol,
)
from scratch_bundle import (  # noqa: E402
    MAX_SIBLINGS,
    SIBLING_WINDOW,
    Bundle,
    Sibling,
    _find_siblings,
    _nitro_hints,
    _parse_addr_from_filename,
    build_bundle,
    module_dir_name,
    render_markdown,
    wrap_as_prompt,
)


def _func(module: str, addr: int, *, name: str | None = None,
          size: int = 0x20, mode: str = "arm") -> Symbol:
    if name is None:
        name = f"func_{addr:08x}"
    return Symbol(
        name=name, module=module, addr=addr, size=size,
        type="function", mode=mode,
    )


def _module(name: str, syms: list[Symbol]) -> ModuleData:
    md = ModuleData(name=name)
    md.symbols = list(syms)
    md.by_addr = {s.addr: s for s in syms}
    md.by_addr_sorted = sorted(syms, key=lambda s: s.addr)
    return md


class TestModuleDirName(unittest.TestCase):
    def test_main_family_passes_through(self):
        self.assertEqual(module_dir_name("main"), "main")
        self.assertEqual(module_dir_name("itcm"), "itcm")
        self.assertEqual(module_dir_name("dtcm"), "dtcm")

    def test_overlay(self):
        self.assertEqual(module_dir_name("ov000"), "overlay000")
        self.assertEqual(module_dir_name("ov005"), "overlay005")
        self.assertEqual(module_dir_name("ov023"), "overlay023")

    def test_unknown_fallback_is_input(self):
        # We don't raise — returning the input keeps the bundle
        # tool tolerant of config-file oddities.
        self.assertEqual(module_dir_name("weird"), "weird")


class TestParseAddrFromFilename(unittest.TestCase):
    def test_overlay_stem(self):
        self.assertEqual(
            _parse_addr_from_filename("ov005_021b16e4"), 0x021b16e4,
        )

    def test_main_func_stem(self):
        self.assertEqual(
            _parse_addr_from_filename("func_02000800"), 0x02000800,
        )

    def test_sinit_stem(self):
        self.assertEqual(
            _parse_addr_from_filename("sinit_ov002_022ca7e8"),
            0x022ca7e8,
        )

    def test_no_hex_tail_returns_none(self):
        self.assertIsNone(_parse_addr_from_filename("entry"))

    def test_short_hex_tail_rejected(self):
        # We require 6-8 hex digits — a 3-hex tail is too generic
        # (every word is technically a 3-hex string).
        self.assertIsNone(_parse_addr_from_filename("foo_abc"))


class TestFindSiblings(unittest.TestCase):
    """Siblings are read off disk; use tmp directories."""

    def _populate(
        self, tmp: Path, module_dir: str, stems: list[tuple[str, str]],
    ) -> None:
        """stems: list of (filename_stem, body) pairs."""
        d = tmp / "src" / module_dir
        d.mkdir(parents=True, exist_ok=True)
        for stem, body in stems:
            (d / f"{stem}.c").write_text(body, encoding="utf-8")

    def test_picks_within_window(self):
        target = _func("ov005", 0x021b2000, size=0x20)
        with tempfile.TemporaryDirectory() as td:
            tmp = Path(td)
            self._populate(tmp, "overlay005", [
                ("ov005_021b1000", "// near-in-range"),    # dist 0x1000
                ("ov005_021b2100", "// very-near"),        # dist 0x0100
                ("ov005_021b9000", "// far"),              # dist 0x7000
            ])
            sibs = _find_siblings(
                target, tmp / "src", window=0x1000, max_n=10,
            )
            names = {s.path.name for s in sibs}
            # 0x021b2100 is inside; 0x021b1000 is exactly at window.
            self.assertIn("ov005_021b2100.c", names)
            self.assertIn("ov005_021b1000.c", names)
            # 0x021b9000 is outside.
            self.assertNotIn("ov005_021b9000.c", names)

    def test_skips_self_distance_zero(self):
        # The target's own .c shouldn't surface as its own sibling.
        target = _func("ov005", 0x021b2000, size=0x20)
        with tempfile.TemporaryDirectory() as td:
            tmp = Path(td)
            self._populate(tmp, "overlay005", [
                ("ov005_021b2000", "// self"),
                ("ov005_021b2100", "// real sibling"),
            ])
            sibs = _find_siblings(target, tmp / "src", window=0x1000)
            names = {s.path.name for s in sibs}
            self.assertNotIn("ov005_021b2000.c", names)
            self.assertIn("ov005_021b2100.c", names)

    def test_cap_at_max_n(self):
        target = _func("ov005", 0x021b2000, size=0x20)
        with tempfile.TemporaryDirectory() as td:
            tmp = Path(td)
            stems = [
                (f"ov005_021b20{n:02x}", f"// n={n}")
                for n in range(10)
                if n != 0  # skip the 0 distance = self
            ]
            self._populate(tmp, "overlay005", stems)
            sibs = _find_siblings(target, tmp / "src",
                                  window=0x1000, max_n=3)
            self.assertEqual(len(sibs), 3)

    def test_missing_module_dir_is_empty(self):
        # src/overlay999/ doesn't exist → no siblings, no crash.
        target = _func("ov999", 0x0, size=0x20)
        with tempfile.TemporaryDirectory() as td:
            tmp = Path(td)
            sibs = _find_siblings(target, tmp / "src")
            self.assertEqual(sibs, [])

    def test_files_without_parseable_addr_skipped(self):
        # src/main/entry.c (no addr in name) shouldn't appear as
        # a sibling — we can't place it on the address line.
        target = _func("main", 0x02000800, size=0x20)
        with tempfile.TemporaryDirectory() as td:
            tmp = Path(td)
            self._populate(tmp, "main", [
                ("entry", "// no address"),
                ("func_02000a00", "// real"),
            ])
            sibs = _find_siblings(target, tmp / "src", window=0x1000)
            names = {s.path.name for s in sibs}
            self.assertNotIn("entry.c", names)
            self.assertIn("func_02000a00.c", names)


class TestNitroHints(unittest.TestCase):
    def test_prefix_name_convention(self):
        # OS_Foo → libs/nitro/include/nitro/os.h
        callees = [_func("main", 0x1000, name="OS_GetTick")]
        hits = _nitro_hints(callees)
        self.assertEqual(len(hits), 1)
        self.assertIn("nitro/os.h", hits[0][0])

    def test_bare_name_bios_thunk(self):
        # WaitByLoop is a bare-name BIOS thunk → still OS subsystem
        # via the BARE_NAME_SUBSYSTEMS map.
        callees = [_func("main", 0x1000, name="WaitByLoop")]
        hits = _nitro_hints(callees)
        self.assertEqual(len(hits), 1)
        self.assertIn("nitro/os.h", hits[0][0])

    def test_dedupe_same_subsystem(self):
        # Two OS callees — one header pointer is enough.
        callees = [
            _func("main", 0x1000, name="OS_GetTick"),
            _func("main", 0x1100, name="OS_SpinWait"),
        ]
        self.assertEqual(len(_nitro_hints(callees)), 1)

    def test_skips_placeholders(self):
        callees = [_func("main", 0x1000)]  # func_XXXXXXXX
        self.assertEqual(_nitro_hints(callees), [])

    def test_skips_unknown_subsystem(self):
        # XY_ isn't in our header map; skip rather than hallucinate.
        callees = [_func("main", 0x1000, name="XY_Foo")]
        self.assertEqual(_nitro_hints(callees), [])

    def test_skips_named_but_non_convention(self):
        # `Entry` / `main` / `__register_global_object` are named
        # but don't carry subsystem identity → no header hit.
        callees = [
            _func("main", 0x1000, name="Entry"),
            _func("main", 0x1100, name="main"),
        ]
        self.assertEqual(_nitro_hints(callees), [])


class TestBuildBundleAndRender(unittest.TestCase):
    def _setup(self):
        target = _func("main", 0x02001000, size=0x20)
        caller = _func("main", 0x02005000, size=0x40)
        callee_os = _func("main", 0x02000400, name="WaitByLoop")
        datum = Symbol(
            name="data_020b4728", module="main", addr=0x020b4728,
            size=0x4, type="data", mode="any",
        )
        md = _module("main", [target, caller, callee_os, datum])
        modules = {"main": md}
        graph = CallGraph()
        graph.edges_call[("main", 0x02005000)].add(
            ("main", 0x02001000),  # caller → target
        )
        graph.edges_call[("main", 0x02001000)].add(
            ("main", 0x02000400),  # target → WaitByLoop
        )
        graph.edges_load[("main", 0x02001000)].add(
            ("main", 0x020b4728),  # target loads data
        )
        return target, modules, graph

    def test_build_bundle_populates_all_sections(self):
        target, modules, graph = self._setup()
        with tempfile.TemporaryDirectory() as td:
            tmp = Path(td)
            (tmp / "src" / "main").mkdir(parents=True)
            bundle = build_bundle(
                target, modules, graph, matched={},
                src_root=tmp / "src",
            )
        self.assertEqual(bundle.target.addr, 0x02001000)
        self.assertEqual(len(bundle.callers), 1)
        self.assertEqual(len(bundle.callees), 1)
        self.assertEqual(len(bundle.loads), 1)
        # WaitByLoop is in BARE_NAME_SUBSYSTEMS → OS subsystem
        # → nitro/os.h hint present.
        self.assertEqual(len(bundle.nitro_hints), 1)

    def test_matched_target_flagged(self):
        target, modules, graph = self._setup()
        with tempfile.TemporaryDirectory() as td:
            tmp = Path(td)
            (tmp / "src" / "main").mkdir(parents=True)
            bundle = build_bundle(
                target, modules, graph,
                matched={"main": [(0x02001000, 0x02001020)]},
                src_root=tmp / "src",
            )
            self.assertTrue(bundle.matched)
            md = render_markdown(bundle)
            self.assertIn("already-`complete` TU", md)

    def test_render_nitro_section_only_when_hints(self):
        # No subsystem callees → no NitroSDK section rendered.
        target = _func("main", 0x1000)
        placeholder_callee = _func("main", 0x2000)
        md = _module("main", [target, placeholder_callee])
        graph = CallGraph()
        graph.edges_call[("main", 0x1000)].add(("main", 0x2000))
        with tempfile.TemporaryDirectory() as td:
            tmp = Path(td)
            (tmp / "src" / "main").mkdir(parents=True)
            bundle = build_bundle(
                target, {"main": md}, graph, matched={},
                src_root=tmp / "src",
            )
            out = render_markdown(bundle)
            self.assertNotIn("NitroSDK context", out)

    def test_render_siblings_note_when_empty(self):
        target = _func("main", 0x1000)
        md = _module("main", [target])
        with tempfile.TemporaryDirectory() as td:
            tmp = Path(td)
            (tmp / "src" / "main").mkdir(parents=True)
            bundle = build_bundle(
                target, {"main": md}, CallGraph(), matched={},
                src_root=tmp / "src",
            )
            out = render_markdown(bundle)
            self.assertIn("No matched `.c` files", out)

    def test_bundle_constants_are_expected(self):
        # Regression pin: the defaults that callers rely on.
        self.assertEqual(SIBLING_WINDOW, 0x1000)
        self.assertEqual(MAX_SIBLINGS, 4)


class TestWrapAsPrompt(unittest.TestCase):
    def test_wrapper_adds_header_and_footer(self):
        bundle_md = "# inner bundle content"
        wrapped = wrap_as_prompt(bundle_md)
        # Header mentions the goal:
        # "first-pass C candidate" wraps across newlines in the
        # template; just check the hyphenated prefix survives.
        self.assertIn("first-pass", wrapped.lower())
        # Footer asks for a fenced block:
        self.assertIn("```c", wrapped)
        # Original content preserved in the middle.
        self.assertIn(bundle_md, wrapped)


class TestBundleDataclass(unittest.TestCase):
    def test_defaults(self):
        t = _func("main", 0x1000)
        b = Bundle(target=t, tier="easy", tier_reason="leaf")
        self.assertEqual(b.callers, [])
        self.assertEqual(b.callees, [])
        self.assertEqual(b.loads, [])
        self.assertEqual(b.siblings, [])
        self.assertFalse(b.matched)
        self.assertEqual(b.nitro_hints, [])

    def test_sibling_fields(self):
        s = Sibling(
            path=Path("/tmp/foo.c"),
            addr=0x1000,
            body="// body",
            distance=0x100,
        )
        self.assertEqual(s.addr, 0x1000)
        self.assertEqual(s.distance, 0x100)


if __name__ == "__main__":
    unittest.main()
