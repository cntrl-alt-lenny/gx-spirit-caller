"""Unit tests for tools/propagate_template.py.

The tool will generate 10-50 sibling .c files per cluster. A bug
in the substitution logic silently ships broken C to the decomper,
who only finds out when objdiff disagrees. Pinning:

  - relocs_for_function windowing (addr range + sort order)
  - reloc_signature (offset + kind fingerprint)
  - apply_substitutions (collision safety via two-pass sentinel)
  - _parse_addr_from_template + _parse_module_from_template
  - derive_plan end-to-end on a synthetic template/target pair
  - TemplateMismatch raised when sizes or reloc shapes differ
  - read_cluster_members skips the template and parses hex addrs
  - _derive_output_path substitutes the symbol name in the filename
"""

from __future__ import annotations

import json
import sys
import tempfile
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from analyze_symbols import ModuleData, Reloc, Symbol  # noqa: E402
from propagate_template import (  # noqa: E402
    PropagationPlan,
    Substitution,
    TemplateMismatch,
    _augment_bss_symbols,
    _derive_output_path,
    _parse_addr_from_template,
    _parse_module_from_template,
    _substitute_addr_comments,
    apply_substitutions,
    derive_plan,
    read_cluster_members,
    reloc_signature,
    relocs_for_function,
)


def _sym(
    name: str, module: str, addr: int, *,
    size: int = 0x2c, type: str = "function", mode: str = "arm",
) -> Symbol:
    return Symbol(name=name, module=module, addr=addr, size=size,
                  type=type, mode=mode)


def _reloc(
    src_addr: int, src_module: str, dest_addr: int, dest_module: str,
    kind: str = "arm_call",
) -> Reloc:
    return Reloc(
        src_addr=src_addr, src_module=src_module,
        dest_addr=dest_addr, dest_module=dest_module,
        kind=kind,
    )


def _module(
    name: str, syms: list[Symbol], relocs: list[Reloc] | None = None,
) -> ModuleData:
    return ModuleData(
        name=name, symbols=syms, relocs=relocs or [],
        by_addr={s.addr: s for s in syms},
        by_addr_sorted=sorted(syms, key=lambda s: s.addr),
    )


# ------------------------------------------------------------------------- #


class TestRelocsForFunction(unittest.TestCase):
    def test_windows_by_addr_range(self):
        sym = _sym("f", "ov005", 0x100, size=0x20)
        # Three relocs: two inside [0x100, 0x120), one outside.
        relocs = [
            _reloc(0x110, "ov005", 0x200, "main"),
            _reloc(0x108, "ov005", 0x300, "main"),
            _reloc(0x120, "ov005", 0x400, "main"),  # exclusive upper bound
        ]
        md = _module("ov005", [sym], relocs)
        out = relocs_for_function(sym, md)
        self.assertEqual(len(out), 2)
        # Returned in src_addr order.
        self.assertEqual(out[0].src_addr, 0x108)
        self.assertEqual(out[1].src_addr, 0x110)

    def test_size_zero_returns_empty(self):
        sym = _sym("f", "ov005", 0x100, size=0)
        md = _module("ov005", [sym], [_reloc(0x100, "ov005", 0x200, "main")])
        self.assertEqual(relocs_for_function(sym, md), [])


class TestRelocSignature(unittest.TestCase):
    def test_offsets_relative_to_base(self):
        relocs = [
            _reloc(0x108, "ov005", 0x200, "main", "arm_call"),
            _reloc(0x110, "ov005", 0x300, "main", "load"),
        ]
        self.assertEqual(
            reloc_signature(relocs, 0x100),
            ((0x8, "arm_call"), (0x10, "load")),
        )


class TestApplySubstitutions(unittest.TestCase):
    def test_single_substitution(self):
        subs = [Substitution("foo", "bar")]
        self.assertEqual(apply_substitutions("foo x foo", subs), "bar x bar")

    def test_longer_names_first(self):
        # Without longest-first, "foo_long" → "x" would be pre-empted
        # by "foo" → "y" and produce "y_long" instead of "x".
        subs = [Substitution("foo", "y"), Substitution("foo_long", "x")]
        self.assertEqual(apply_substitutions("foo_long foo", subs), "x y")

    def test_swap_safety(self):
        # A <-> B cycle must survive — the two-pass sentinel prevents
        # A → B → A clobbering.
        subs = [Substitution("A", "B"), Substitution("B", "A")]
        self.assertEqual(apply_substitutions("A B", subs), "B A")

    def test_overlapping_substring_safety(self):
        # `func_foo` renamed to `func_bar` must NOT then be caught by
        # a later `func_b` → `xxx` rule (if both existed).
        subs = [
            Substitution("func_foo", "func_bar"),
            Substitution("func_f", "xxx"),
        ]
        # func_foo → func_bar; the second rule doesn't fire because
        # `func_f` was only a prefix of `func_foo` which is already
        # substituted, and doesn't appear elsewhere.
        out = apply_substitutions("func_foo", subs)
        self.assertEqual(out, "func_bar")


class TestSubstituteAddrComments(unittest.TestCase):
    def test_replaces_hex_literal(self):
        src = "/* sinit at 0x021b16e4 — see ... */"
        self.assertEqual(
            _substitute_addr_comments(src, 0x021b16e4, 0x021b1710),
            "/* sinit at 0x021b1710 — see ... */",
        )


class TestParseAddrFromTemplate(unittest.TestCase):
    def test_with_module_prefix(self):
        self.assertEqual(
            _parse_addr_from_template(Path("sinit_ov005_021b16e4.c")),
            0x021b16e4,
        )

    def test_without_module_prefix(self):
        self.assertEqual(
            _parse_addr_from_template(Path("func_02000800.c")),
            0x02000800,
        )

    def test_missing_addr_raises(self):
        with self.assertRaises(ValueError):
            _parse_addr_from_template(Path("something_odd.c"))


class TestParseModuleFromTemplate(unittest.TestCase):
    def test_overlay(self):
        self.assertEqual(
            _parse_module_from_template(
                Path("src/overlay005/sinit_ov005_021b16e4.c"),
            ),
            "ov005",
        )

    def test_main(self):
        self.assertEqual(
            _parse_module_from_template(
                Path("src/main/entry.c"),
            ),
            "main",
        )

    def test_itcm(self):
        self.assertEqual(
            _parse_module_from_template(
                Path("src/itcm/foo.c"),
            ),
            "itcm",
        )

    def test_unknown_raises(self):
        with self.assertRaises(ValueError):
            _parse_module_from_template(Path("/tmp/random.c"))


class TestDeriveOutputPath(unittest.TestCase):
    def test_substitutes_symbol_name_in_stem(self):
        t_sym = _sym("__sinit_ov005_021b16e4", "ov005", 0x021b16e4)
        s_sym = _sym("__sinit_ov005_021b1710", "ov005", 0x021b1710)
        out = _derive_output_path(
            Path("src/overlay005/sinit_ov005_021b16e4.c"),
            t_sym, s_sym,
        )
        self.assertEqual(
            out, Path("src/overlay005/sinit_ov005_021b1710.c"),
        )

    def test_fallback_to_hex_suffix(self):
        # Template symbol name doesn't appear in stem — fall back to
        # swapping the 8-hex-digit tail.
        t_sym = _sym("OriginalName", "ov005", 0x12345678)
        s_sym = _sym("NewName", "ov005", 0x9abcdef0)
        out = _derive_output_path(
            Path("src/overlay005/foo_12345678.c"),
            t_sym, s_sym,
        )
        self.assertEqual(out.stem, "foo_9abcdef0")


class TestDerivePlan(unittest.TestCase):
    """Synthetic end-to-end: two sinit-shaped functions, one template
    (matched) + one target (to generate)."""

    def _setup(self, tmp: Path) -> dict:
        # Template at ov005|0x100, size 0x2c. 3 relocs:
        #   +0x08 arm_call -> ov005|0x10 (ctor)
        #   +0x10 arm_call -> main|0xa00 (registrar, SHARED symbol)
        #   +0x18 load     -> ov005|0x300 (object data, bss)
        # Target at ov005|0x200, size 0x2c. Same shape, different
        # target addrs for the two non-shared relocs.
        t_sym = _sym("__sinit_ov005_00000100", "ov005", 0x100)
        s_sym = _sym("__sinit_ov005_00000200", "ov005", 0x200)
        ctor_t = _sym("func_ov005_00000010", "ov005", 0x10, size=0x8)
        ctor_s = _sym("func_ov005_00000020", "ov005", 0x20, size=0x8)
        obj_t = _sym("data_ov005_00000300", "ov005", 0x300,
                     size=0x4, type="data", mode="any")
        obj_s = _sym("data_ov005_00000400", "ov005", 0x400,
                     size=0x4, type="data", mode="any")
        registrar = _sym("__register_global_object", "main", 0xa00, size=0x20)

        ov005 = _module("ov005", [
            t_sym, s_sym, ctor_t, ctor_s, obj_t, obj_s,
        ], [
            _reloc(0x108, "ov005", 0x10, "ov005", "arm_call"),
            _reloc(0x110, "ov005", 0xa00, "main", "arm_call"),
            _reloc(0x118, "ov005", 0x300, "ov005", "load"),
            _reloc(0x208, "ov005", 0x20, "ov005", "arm_call"),
            _reloc(0x210, "ov005", 0xa00, "main", "arm_call"),
            _reloc(0x218, "ov005", 0x400, "ov005", "load"),
        ])
        main = _module("main", [registrar])

        template_path = tmp / "src" / "overlay005" / \
            "sinit_ov005_00000100.c"
        template_path.parent.mkdir(parents=True, exist_ok=True)
        template_path.write_text(
            "/* template at 0x00000100 */\n"
            "extern void func_ov005_00000010(void *obj);\n"
            "extern char data_ov005_00000300[];\n"
            "\n"
            "void __sinit_ov005_00000100(void) {\n"
            "    func_ov005_00000010(data_ov005_00000300);\n"
            "    __register_global_object("
            "data_ov005_00000300, func_ov005_00000010, "
            "data_ov005_00000300);\n"
            "}\n"
        )
        return {
            "modules": {"ov005": ov005, "main": main},
            "template_path": template_path,
        }

    def test_end_to_end_generates_correct_text(self):
        with tempfile.TemporaryDirectory() as td:
            f = self._setup(Path(td))
            plan = derive_plan(
                f["template_path"], "ov005", 0x200, f["modules"],
            )
            # 3 substitutions expected: sinit name, ctor, data.
            # registrar stays the same (shared symbol, no sub).
            sub_map = {s.template_name: s.target_name
                       for s in plan.substitutions}
            self.assertEqual(sub_map, {
                "__sinit_ov005_00000100": "__sinit_ov005_00000200",
                "func_ov005_00000010": "func_ov005_00000020",
                "data_ov005_00000300": "data_ov005_00000400",
            })
            # Generated text uses new names.
            self.assertIn("__sinit_ov005_00000200", plan.generated_text)
            self.assertIn("func_ov005_00000020", plan.generated_text)
            self.assertIn("data_ov005_00000400", plan.generated_text)
            self.assertNotIn(
                "__sinit_ov005_00000100", plan.generated_text,
            )
            # Comment hex literal rewritten.
            self.assertIn("0x00000200", plan.generated_text)
            self.assertNotIn("0x00000100", plan.generated_text)
            # Output path derived.
            self.assertEqual(
                plan.output_path.name, "sinit_ov005_00000200.c",
            )
            # delinks.txt TU header includes the right byte range.
            self.assertIn(
                "start:0x00000200 end:0x0000022c", plan.delinks_line,
            )

    def test_size_mismatch_raises(self):
        with tempfile.TemporaryDirectory() as td:
            f = self._setup(Path(td))
            # Shrink the target's size so shapes can't align.
            f["modules"]["ov005"].by_addr[0x200].size = 0x10
            with self.assertRaises(TemplateMismatch):
                derive_plan(
                    f["template_path"], "ov005", 0x200, f["modules"],
                )

    def test_reloc_shape_mismatch_raises(self):
        with tempfile.TemporaryDirectory() as td:
            f = self._setup(Path(td))
            # Change one of the target's relocs to a different kind.
            for r in f["modules"]["ov005"].relocs:
                if r.src_addr == 0x218:
                    r.kind = "arm_call"  # was "load"
            with self.assertRaises(TemplateMismatch):
                derive_plan(
                    f["template_path"], "ov005", 0x200, f["modules"],
                )

    def test_missing_target_addr_raises(self):
        with tempfile.TemporaryDirectory() as td:
            f = self._setup(Path(td))
            with self.assertRaises(ValueError):
                derive_plan(
                    f["template_path"], "ov005", 0xdeadbeef, f["modules"],
                )


class TestReadClusterMembers(unittest.TestCase):
    def test_reads_and_skips_template(self):
        payload = {
            "clusters": [
                {
                    "fingerprint": {"size": "0x2c", "out_degree": 2,
                                    "callee_modules": ["main"]},
                    "count": 3,
                    "members": [
                        {"module": "ov005", "addr": "0x021b16e4"},
                        {"module": "ov005", "addr": "0x021b1710"},
                        {"module": "ov005", "addr": "0x021b173c"},
                    ],
                },
            ],
        }
        with tempfile.TemporaryDirectory() as td:
            p = Path(td) / "duplicates.json"
            p.write_text(json.dumps(payload))
            out = read_cluster_members(p, 0, "ov005|0x021b16e4")
            self.assertEqual(out, [
                ("ov005", 0x021b1710),
                ("ov005", 0x021b173c),
            ])

    def test_out_of_range_raises(self):
        with tempfile.TemporaryDirectory() as td:
            p = Path(td) / "duplicates.json"
            p.write_text('{"clusters": []}')
            with self.assertRaises(ValueError):
                read_cluster_members(p, 0, None)


class TestAugmentBssSymbols(unittest.TestCase):
    """Regression for the `kind:bss` blind spot in analyze_symbols's
    regex: bss symbols must show up in by_addr after augmentation."""

    def test_bss_symbol_added(self):
        with tempfile.TemporaryDirectory() as td:
            config = Path(td)
            sym_file = config / "arm9" / "overlays" / "ov005" / "symbols.txt"
            sym_file.parent.mkdir(parents=True, exist_ok=True)
            sym_file.write_text(
                "func_ov005_00000100 kind:function(arm,size=0x2c) "
                "addr:0x00000100\n"
                "data_ov005_00000300 kind:bss addr:0x00000300\n",
            )
            modules = {
                "ov005": _module("ov005", [
                    _sym("func_ov005_00000100", "ov005", 0x100),
                ]),
            }
            _augment_bss_symbols(modules, config)
            self.assertIn(0x300, modules["ov005"].by_addr)
            sym = modules["ov005"].by_addr[0x300]
            self.assertEqual(sym.name, "data_ov005_00000300")
            self.assertEqual(sym.type, "data")

    def test_existing_symbol_not_clobbered(self):
        # If load_all already populated this addr, the augmentation
        # must NOT overwrite it (e.g. a real `.data` symbol takes
        # precedence over an identically-addressed bss claim).
        with tempfile.TemporaryDirectory() as td:
            config = Path(td)
            sym_file = config / "arm9" / "overlays" / "ov005" / "symbols.txt"
            sym_file.parent.mkdir(parents=True, exist_ok=True)
            sym_file.write_text(
                "data_ov005_00000300 kind:bss addr:0x00000300\n",
            )
            existing = _sym("data_renamed", "ov005", 0x300,
                            size=0x10, type="data", mode="any")
            modules = {"ov005": _module("ov005", [existing])}
            _augment_bss_symbols(modules, config)
            # The renamed name survives — augmentation only adds
            # NEW addresses, never overwrites existing ones.
            self.assertEqual(
                modules["ov005"].by_addr[0x300].name, "data_renamed",
            )


class TestPropagationPlanSmoke(unittest.TestCase):
    """Ensure the PropagationPlan dataclass itself round-trips its
    fields — trivial but catches accidental field-rename regressions."""

    def test_fields_accessible(self):
        plan = PropagationPlan(
            template_path=Path("t.c"),
            target_module="ov005",
            target_addr=0x100,
            target_name="x",
            output_path=Path("x.c"),
            substitutions=[Substitution("a", "b")],
            generated_text="body",
            delinks_line="header",
            warnings=[],
        )
        self.assertEqual(plan.target_addr, 0x100)
        self.assertEqual(plan.substitutions[0].template_name, "a")


if __name__ == "__main__":
    unittest.main()
