"""Unit tests for tools/check_match_invariants.py.

Targets the three checks individually plus the runner glue:

  - check_complete_tu_renames: a placeholder-named symbol inside a
    `complete` TU gets flagged, and the severity downgrades to warn
    unless --strict is set (so brief-003's "don't-mis-rename"
    intentional cases don't fail CI by default).

  - check_orphan_externs: a placeholder-shaped extern in src/ gets
    flagged IFF the underlying placeholder name is absent from
    symbols.txt. Includes the raw-scan fallback for `kind:bss`
    entries (which analyze_symbols's regex skips).

  - check_missing_tu_sources: a TU listed in delinks.txt with no
    corresponding .c file on disk is flagged as error.

  - exit_code_for + print_report + JSON output smoke tests.
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

from analyze_symbols import ModuleData, Symbol  # noqa: E402
from check_match_invariants import (  # noqa: E402
    Issue,
    check_complete_tu_renames,
    check_cross_file_name_drift,
    check_missing_tu_sources,
    check_orphan_externs,
    exit_code_for,
    print_report,
    to_json,
)


# ------------------------------------------------------------------------- #
# Fixtures
# ------------------------------------------------------------------------- #


def _module(name: str, syms: list[Symbol]) -> ModuleData:
    return ModuleData(
        name=name, symbols=syms, relocs=[],
        by_addr={s.addr: s for s in syms},
        by_addr_sorted=sorted(syms, key=lambda s: s.addr),
    )


def _sym(
    name: str, module: str, addr: int, *,
    size: int = 0x10, type: str = "function", mode: str = "arm",
) -> Symbol:
    return Symbol(name=name, module=module, addr=addr, size=size,
                  type=type, mode=mode)


def _write(root: Path, rel: str, body: str) -> Path:
    p = root / rel
    p.parent.mkdir(parents=True, exist_ok=True)
    p.write_text(body)
    return p


# delinks.txt with one `complete` TU covering [0x100, 0x200).
_DELINKS_ONE_COMPLETE = """\
.text       start:0x00000100 end:0x00001000 kind:code align:4

src/overlay005/ov005_init.c:
    complete
    .text start:0x00000100 end:0x00000200
"""


# ------------------------------------------------------------------------- #
# check_complete_tu_renames
# ------------------------------------------------------------------------- #


class TestCheckCompleteTuRenames(unittest.TestCase):
    def _set_up_eur(self, td: Path) -> tuple[Path, dict[str, ModuleData]]:
        config = td / "config" / "eur"
        _write(config, "arm9/overlays/ov005/delinks.txt",
               _DELINKS_ONE_COMPLETE)
        modules = {
            "ov005": _module("ov005", [
                # Inside complete range and still placeholder-named:
                # should be flagged.
                _sym("func_ov005_00000100", "ov005", 0x100, size=0x10),
                # Inside complete range but already renamed: no flag.
                _sym("Init", "ov005", 0x110, size=0x10),
                # Outside complete range, placeholder-named: no flag.
                _sym("func_ov005_00000300", "ov005", 0x300, size=0x10),
            ]),
        }
        return config, modules

    def test_flags_unrenamed_inside_complete(self):
        with tempfile.TemporaryDirectory() as td:
            config, modules = self._set_up_eur(Path(td))
            out = check_complete_tu_renames(modules, config)
            self.assertEqual(len(out), 1)
            self.assertEqual(out[0].addr, 0x100)
            self.assertEqual(out[0].module, "ov005")
            self.assertEqual(out[0].check, "complete_tu_rename")

    def test_default_severity_is_warn(self):
        # Brief-003 policy: intentional placeholders exist, so default
        # must not break CI. Severity is warn; exit_code_for returns 1
        # not 2.
        with tempfile.TemporaryDirectory() as td:
            config, modules = self._set_up_eur(Path(td))
            out = check_complete_tu_renames(modules, config)
            self.assertEqual(out[0].severity, "warn")

    def test_strict_promotes_to_error(self):
        with tempfile.TemporaryDirectory() as td:
            config, modules = self._set_up_eur(Path(td))
            out = check_complete_tu_renames(modules, config, strict=True)
            self.assertEqual(out[0].severity, "error")

    def test_symbol_outside_complete_range_not_flagged(self):
        with tempfile.TemporaryDirectory() as td:
            config, modules = self._set_up_eur(Path(td))
            out = check_complete_tu_renames(modules, config)
            # The 0x300 symbol is outside any complete range; only
            # 0x100 should appear.
            addrs = [i.addr for i in out]
            self.assertIn(0x100, addrs)
            self.assertNotIn(0x300, addrs)

    def test_module_filter_narrows_results(self):
        with tempfile.TemporaryDirectory() as td:
            td_path = Path(td)
            config = td_path / "config" / "eur"
            _write(config, "arm9/overlays/ov005/delinks.txt",
                   _DELINKS_ONE_COMPLETE)
            _write(config, "arm9/overlays/ov006/delinks.txt",
                   _DELINKS_ONE_COMPLETE)
            modules = {
                "ov005": _module("ov005", [
                    _sym("func_ov005_100", "ov005", 0x100),
                ]),
                "ov006": _module("ov006", [
                    _sym("func_ov006_100", "ov006", 0x100),
                ]),
            }
            out = check_complete_tu_renames(
                modules, config, module_filter="ov005",
            )
            self.assertEqual(len(out), 1)
            self.assertEqual(out[0].module, "ov005")

    def test_gap_tu_does_not_count_as_complete(self):
        # _dsd_gap entries with `complete` shouldn't trigger — gaps
        # are never considered matched.
        delinks_with_gap_complete = (
            ".text       start:0x00000100 end:0x00001000 kind:code align:4\n"
            "\n"
            "_dsd_gap@ov005_0:\n"
            "    complete\n"
            "    .text start:0x00000100 end:0x00000200\n"
        )
        with tempfile.TemporaryDirectory() as td:
            config = Path(td) / "config" / "eur"
            _write(config, "arm9/overlays/ov005/delinks.txt",
                   delinks_with_gap_complete)
            modules = {
                "ov005": _module("ov005", [
                    _sym("func_ov005_00000100", "ov005", 0x100),
                ]),
            }
            self.assertEqual(
                check_complete_tu_renames(modules, config), [],
            )


# ------------------------------------------------------------------------- #
# check_orphan_externs
# ------------------------------------------------------------------------- #


class TestCheckOrphanExterns(unittest.TestCase):
    def test_extern_of_known_placeholder_passes(self):
        with tempfile.TemporaryDirectory() as td:
            root = Path(td)
            src = root / "src"
            config = root / "config" / "eur"
            _write(src, "overlay005/foo.c",
                   'extern void func_ov005_012345(void *obj);\n')
            # symbols.txt contains the placeholder → no orphan.
            _write(
                config, "arm9/overlays/ov005/symbols.txt",
                "func_ov005_012345 kind:function(arm,size=0x10) "
                "addr:0x00012345\n",
            )
            modules = {
                "ov005": _module("ov005", [
                    _sym("func_ov005_012345", "ov005", 0x012345),
                ]),
            }
            out = check_orphan_externs(src, modules, config)
            self.assertEqual(out, [])

    def test_extern_of_renamed_symbol_flagged(self):
        with tempfile.TemporaryDirectory() as td:
            root = Path(td)
            src = root / "src"
            config = root / "config" / "eur"
            _write(src, "overlay005/foo.c",
                   'extern void func_ov005_012345(void *obj);\n')
            # symbols.txt has a renamed form — no placeholder match.
            _write(
                config, "arm9/overlays/ov005/symbols.txt",
                "Init kind:function(arm,size=0x10) addr:0x00012345\n",
            )
            modules = {
                "ov005": _module("ov005", [
                    _sym("Init", "ov005", 0x012345),
                ]),
            }
            out = check_orphan_externs(src, modules, config)
            self.assertEqual(len(out), 1)
            self.assertEqual(out[0].check, "orphan_extern")
            self.assertIn("func_ov005_012345", out[0].message)

    def test_bss_placeholder_not_false_positive(self):
        # The raw-scan fallback must pick up `kind:bss` entries that
        # analyze_symbols's regex skips (it requires `kind:type(attrs)`
        # parens, bss has none).
        with tempfile.TemporaryDirectory() as td:
            root = Path(td)
            src = root / "src"
            config = root / "config" / "eur"
            _write(src, "overlay002/sinit_ov002_022ca808.c",
                   'extern char data_ov002_022d1b70[];\n')
            # bss symbol — no parens, so load_all would miss it.
            _write(
                config, "arm9/overlays/ov002/symbols.txt",
                "data_ov002_022d1b70 kind:bss addr:0x022d1b70\n",
            )
            # modules{} intentionally empty to simulate load_all's
            # miss; orphan check should still see the name via the
            # raw scan.
            self.assertEqual(
                check_orphan_externs(src, {}, config), [],
            )

    def test_data_array_extern_also_matched(self):
        with tempfile.TemporaryDirectory() as td:
            root = Path(td)
            src = root / "src"
            config = root / "config" / "eur"
            _write(src, "overlay002/foo.c",
                   'extern char data_ov002_022d1b70[];\n')
            _write(config, "arm9/overlays/ov002/symbols.txt", "")
            # No known placeholder → array-form extern should flag.
            out = check_orphan_externs(src, {}, config)
            self.assertEqual(len(out), 1)

    def test_non_placeholder_extern_ignored(self):
        with tempfile.TemporaryDirectory() as td:
            root = Path(td)
            src = root / "src"
            config = root / "config" / "eur"
            _write(src, "overlay002/foo.c",
                   'extern void OS_WaitVBlankIntr(void);\n'
                   'extern int g_config;\n')
            _write(config, "arm9/overlays/ov002/symbols.txt", "")
            self.assertEqual(check_orphan_externs(src, {}, config), [])


# ------------------------------------------------------------------------- #
# check_missing_tu_sources
# ------------------------------------------------------------------------- #


class TestCheckMissingTuSources(unittest.TestCase):
    def test_missing_source_flagged(self):
        # delinks.txt claims a TU but the .c file doesn't exist.
        # Uses absolute ROOT-relative paths to match the tool's
        # resolution; test fixture picks a path under a temp dir
        # that definitely doesn't exist.
        with tempfile.TemporaryDirectory() as td:
            config = Path(td) / "config" / "eur"
            _write(config, "arm9/overlays/ov005/delinks.txt",
                   ".text start:0x100 end:0x200 kind:code align:4\n"
                   "\n"
                   "src/overlay005/nonexistent_file.c:\n"
                   "    .text start:0x100 end:0x200\n")
            out = check_missing_tu_sources(config)
            # The tool resolves src/ against ROOT (the repo root), so
            # a fresh path like src/overlay005/nonexistent_file.c will
            # be missing even running against the real repo.
            self.assertTrue(any(
                i.check == "missing_tu_source"
                and i.path == "src/overlay005/nonexistent_file.c"
                for i in out
            ))
            err = next(i for i in out if i.check == "missing_tu_source")
            self.assertEqual(err.severity, "error")

    def test_dsd_gap_not_flagged(self):
        # _dsd_gap TUs are synthetic and have no source file on disk;
        # shouldn't trigger the check.
        with tempfile.TemporaryDirectory() as td:
            config = Path(td) / "config" / "eur"
            _write(config, "arm9/overlays/ov005/delinks.txt",
                   ".text start:0x100 end:0x200 kind:code align:4\n"
                   "\n"
                   "_dsd_gap@ov005_0:\n"
                   "    .text start:0x100 end:0x200\n")
            self.assertEqual(check_missing_tu_sources(config), [])


# ------------------------------------------------------------------------- #
# Exit code + output
# ------------------------------------------------------------------------- #


class TestExitCodeFor(unittest.TestCase):
    def test_clean_is_zero(self):
        self.assertEqual(exit_code_for([]), 0)

    def test_warn_only_is_one(self):
        issues = [Issue("x", "warn", None, None, None, "m", "s")]
        self.assertEqual(exit_code_for(issues), 1)

    def test_error_present_is_two(self):
        issues = [
            Issue("x", "warn", None, None, None, "m", "s"),
            Issue("x", "error", None, None, None, "m", "s"),
        ]
        self.assertEqual(exit_code_for(issues), 2)


class TestPrintReport(unittest.TestCase):
    def test_clean_message(self):
        buf = io.StringIO()
        with contextlib.redirect_stdout(buf):
            print_report([])
        self.assertIn("Clean", buf.getvalue())

    def test_issues_grouped_by_check(self):
        issues = [
            Issue("complete_tu_rename", "warn", "ov005", 0x100, None,
                  "m1", "s1"),
            Issue("orphan_extern", "warn", None, None, "src/foo.c:12",
                  "m2", "s2"),
        ]
        buf = io.StringIO()
        with contextlib.redirect_stdout(buf):
            print_report(issues)
        out = buf.getvalue()
        self.assertIn("== complete_tu_rename (1) ==", out)
        self.assertIn("== orphan_extern (1) ==", out)
        self.assertIn("0x00000100", out)
        self.assertIn("src/foo.c:12", out)


class TestToJson(unittest.TestCase):
    def test_schema(self):
        issues = [
            Issue("complete_tu_rename", "warn", "ov005", 0x100, None,
                  "msg", "sug"),
        ]
        payload = to_json(issues)
        # Round-trip via json.dumps to confirm no non-serialisable types.
        json.dumps(payload)
        self.assertEqual(payload["count"], 1)
        self.assertEqual(payload["warnings"], 1)
        self.assertEqual(payload["errors"], 0)
        self.assertEqual(payload["issues"][0]["check"], "complete_tu_rename")


class TestCrossFileNameDrift(unittest.TestCase):
    """#171-class drift detection: src/ references a name that
    isn't in any symbols.txt AND isn't declared in libs/**/*.h.

    Pinning:
      - C extern to a missing name → error
      - C extern to a known symbol → no issue
      - C extern to a libs/-declared name (header decl, no .c yet)
        → no issue (legit SDK scaffold)
      - `.s` BL to a missing name → error
      - `.s` BL to a file-local label definition → no issue
      - `.s` BL to a `.L_xxxxxxxx` local label → no issue
      - Duplicate refs in same file → one issue, not N
      - Deliberately-ignored operand names (eq, lr, sp, …) → skipped
      - Function definitions (extern int foo(x) { ... }) without the
        terminating ; → NOT matched by the extern regex
    """

    def _setup(
        self,
        tmp: Path,
        *,
        symbols: dict[str, list[str]] | None = None,
        libs_headers: dict[str, str] | None = None,
        src_files: dict[str, str] | None = None,
    ) -> tuple[Path, Path, Path]:
        """Build synthetic config/eur/, libs/, src/ trees.

        symbols: {module: [names...]} — each becomes a symbols.txt line
        libs_headers: {filename: body} — written under libs/nitro/
        src_files: {filename: body} — written under src/
        """
        config_dir = tmp / "config" / "eur"
        src_dir = tmp / "src"
        libs_dir = tmp / "libs"
        for d in (config_dir, src_dir, libs_dir):
            d.mkdir(parents=True, exist_ok=True)
        for mod, names in (symbols or {}).items():
            mod_dir = (
                config_dir / "arm9" if mod == "main"
                else config_dir / "arm9" / "overlays" / mod
            )
            mod_dir.mkdir(parents=True, exist_ok=True)
            lines = [
                # Use function(arm, size=0x10) so the tool's
                # kind:type(attrs) regex accepts the line if we
                # ever wire analyze_symbols parsing.
                f"{n} kind:function(arm,size=0x10) addr:0x0200{i:04x}"
                for i, n in enumerate(names)
            ]
            (mod_dir / "symbols.txt").write_text(
                "\n".join(lines) + "\n", encoding="utf-8",
            )
        for fname, body in (libs_headers or {}).items():
            p = libs_dir / "nitro" / "include" / "nitro" / fname
            p.parent.mkdir(parents=True, exist_ok=True)
            p.write_text(body, encoding="utf-8")
        for fname, body in (src_files or {}).items():
            p = src_dir / fname
            p.parent.mkdir(parents=True, exist_ok=True)
            p.write_text(body, encoding="utf-8")
        return config_dir, src_dir, libs_dir

    def test_c_extern_missing_name_flagged(self):
        with tempfile.TemporaryDirectory() as td:
            config_dir, src_dir, libs_dir = self._setup(
                Path(td),
                symbols={"main": ["ExistingName"]},
                src_files={
                    "main/foo.c": (
                        "extern void MissingName(int x);\n"
                        "void bar(void) { MissingName(0); }\n"
                    ),
                },
            )
            issues = check_cross_file_name_drift(
                src_dir, libs_dir, config_dir,
            )
            self.assertEqual(len(issues), 1)
            self.assertEqual(issues[0].check, "cross_file_name_drift")
            self.assertEqual(issues[0].severity, "error")
            self.assertIn("MissingName", issues[0].message)

    def test_c_extern_known_name_ignored(self):
        with tempfile.TemporaryDirectory() as td:
            config_dir, src_dir, libs_dir = self._setup(
                Path(td),
                symbols={"main": ["KnownName"]},
                src_files={
                    "main/foo.c": (
                        "extern int KnownName(void);\n"
                    ),
                },
            )
            issues = check_cross_file_name_drift(
                src_dir, libs_dir, config_dir,
            )
            self.assertEqual(issues, [])

    def test_c_extern_lib_declared_name_ignored(self):
        # Header declares it, even if no .c implements yet.
        with tempfile.TemporaryDirectory() as td:
            config_dir, src_dir, libs_dir = self._setup(
                Path(td),
                symbols={"main": []},
                libs_headers={
                    "os.h": "void OS_GetTick(void);\n",
                },
                src_files={
                    "main/foo.c": (
                        "extern void OS_GetTick(void);\n"
                    ),
                },
            )
            issues = check_cross_file_name_drift(
                src_dir, libs_dir, config_dir,
            )
            self.assertEqual(issues, [])

    def test_c_function_definition_not_matched(self):
        # `extern int foo(int x) { return x; }` is a definition,
        # not a declaration. Must not trigger the drift check.
        with tempfile.TemporaryDirectory() as td:
            config_dir, src_dir, libs_dir = self._setup(
                Path(td),
                symbols={"main": []},
                src_files={
                    "main/foo.c": (
                        "extern int MyDefinition(int x) {\n"
                        "    return x + 1;\n"
                        "}\n"
                    ),
                },
            )
            issues = check_cross_file_name_drift(
                src_dir, libs_dir, config_dir,
            )
            self.assertEqual(issues, [])

    def test_asm_bl_missing_name_flagged(self):
        with tempfile.TemporaryDirectory() as td:
            config_dir, src_dir, libs_dir = self._setup(
                Path(td),
                symbols={"main": []},
                src_files={
                    "main/x.s": (
                        ".text\n"
                        "entry:\n"
                        "        bl      DriftedName\n"
                        "        bx      lr\n"
                    ),
                },
            )
            issues = check_cross_file_name_drift(
                src_dir, libs_dir, config_dir,
            )
            self.assertEqual(len(issues), 1)
            self.assertIn("DriftedName", issues[0].message)

    def test_asm_bl_local_label_ignored(self):
        # `loop_top:` defined in-file, `b loop_top` must NOT drift.
        with tempfile.TemporaryDirectory() as td:
            config_dir, src_dir, libs_dir = self._setup(
                Path(td),
                symbols={"main": []},
                src_files={
                    "main/x.s": (
                        ".text\n"
                        "entry:\n"
                        "loop_top:\n"
                        "        subs    r0, #1\n"
                        "        bne     loop_top\n"
                        "        bx      lr\n"
                    ),
                },
            )
            issues = check_cross_file_name_drift(
                src_dir, libs_dir, config_dir,
            )
            self.assertEqual(issues, [])

    def test_asm_bl_dot_L_local_label_ignored(self):
        # dsd's `.L_XXXXXXXX:` labels are local by convention.
        # The branch regex doesn't match `.L_`-prefixed targets
        # at all (`.` isn't a valid leading char), but pin that.
        with tempfile.TemporaryDirectory() as td:
            config_dir, src_dir, libs_dir = self._setup(
                Path(td),
                symbols={"main": []},
                src_files={
                    "main/x.s": (
                        ".text\n"
                        ".L_02000086:\n"
                        "        b       .L_02000086\n"
                    ),
                },
            )
            issues = check_cross_file_name_drift(
                src_dir, libs_dir, config_dir,
            )
            self.assertEqual(issues, [])

    def test_asm_bl_known_symbol_ignored(self):
        with tempfile.TemporaryDirectory() as td:
            config_dir, src_dir, libs_dir = self._setup(
                Path(td),
                symbols={"main": ["OS_SpinWait"]},
                src_files={
                    "main/x.s": (
                        ".text\n"
                        "foo:\n"
                        "        bl      OS_SpinWait\n"
                        "        bx      lr\n"
                    ),
                },
            )
            issues = check_cross_file_name_drift(
                src_dir, libs_dir, config_dir,
            )
            self.assertEqual(issues, [])

    def test_duplicate_refs_single_issue_per_file(self):
        # A file that BLs to `BadName` 10 times should produce
        # one drift issue, not ten.
        with tempfile.TemporaryDirectory() as td:
            body = ".text\nentry:\n" + (
                "        bl      BadName\n" * 10
            ) + "        bx      lr\n"
            config_dir, src_dir, libs_dir = self._setup(
                Path(td),
                symbols={"main": []},
                src_files={"main/x.s": body},
            )
            issues = check_cross_file_name_drift(
                src_dir, libs_dir, config_dir,
            )
            self.assertEqual(len(issues), 1)

    def test_ignored_asm_operand_names_skipped(self):
        # `bl lr` would never be valid instruction syntax in
        # practice (bl takes a label, not a register), but the
        # regex conceivably matches it. `lr` is in the ignored set
        # so no false positive.
        with tempfile.TemporaryDirectory() as td:
            config_dir, src_dir, libs_dir = self._setup(
                Path(td),
                symbols={"main": []},
                src_files={
                    "main/x.s": "        bl lr\n",
                },
            )
            issues = check_cross_file_name_drift(
                src_dir, libs_dir, config_dir,
            )
            self.assertEqual(issues, [])

    def test_missing_libs_dir_tolerated(self):
        # Some clones don't have libs/ set up yet. The check should
        # silently fall back to the symbols.txt-only resolvable set.
        with tempfile.TemporaryDirectory() as td:
            config_dir = Path(td) / "config" / "eur" / "arm9"
            config_dir.mkdir(parents=True)
            (config_dir / "symbols.txt").write_text(
                "Known kind:function(arm,size=0x10) addr:0x02001000\n",
                encoding="utf-8",
            )
            src_dir = Path(td) / "src"
            src_dir.mkdir()
            (src_dir / "main").mkdir()
            (src_dir / "main" / "foo.c").write_text(
                "extern void Known(void);\n", encoding="utf-8",
            )
            # libs_dir doesn't exist at all.
            issues = check_cross_file_name_drift(
                src_dir, Path(td) / "libs",
                Path(td) / "config" / "eur",
            )
            self.assertEqual(issues, [])

    def test_different_files_produce_separate_issues(self):
        # `foo.c` and `bar.c` both reference `Drift1` and `Drift2`
        # respectively → 2 issues (one per file).
        with tempfile.TemporaryDirectory() as td:
            config_dir, src_dir, libs_dir = self._setup(
                Path(td),
                symbols={"main": []},
                src_files={
                    "main/foo.c": "extern void Drift1(void);\n",
                    "main/bar.c": "extern int Drift2(int);\n",
                },
            )
            issues = check_cross_file_name_drift(
                src_dir, libs_dir, config_dir,
            )
            self.assertEqual(len(issues), 2)
            names = {
                issues[0].message.split("`")[1],
                issues[1].message.split("`")[1],
            }
            self.assertEqual(
                names, {"extern ... Drift1",
                        "extern ... Drift2"},
            )

    def test_multi_region_symbol_resolves_against_other_region(self):
        # PR #423 fix: a USA-only symbol (in config/usa/symbols.txt but
        # not in config/eur/symbols.txt) must NOT trip cross_file_name_
        # drift when referenced from src/usa/. The check unions across
        # all bootstrapped config/<region>/ siblings.
        with tempfile.TemporaryDirectory() as td:
            tmp = Path(td)
            # config/eur/ — has only the EUR-side address
            eur_config, src_dir, libs_dir = self._setup(
                tmp,
                symbols={"main": ["func_02006164"]},  # EUR address
            )
            # config/usa/ — sibling of config/eur/, has the USA-side
            # address that doesn't exist in EUR's symbols.txt
            usa_config = tmp / "config" / "usa" / "arm9"
            usa_config.mkdir(parents=True, exist_ok=True)
            (usa_config / "symbols.txt").write_text(
                "func_02006148 kind:function(arm,size=0x10) "
                "addr:0x02006148\n",
                encoding="utf-8",
            )
            # src/usa/main/foo.c references the USA-side address
            (src_dir / "usa" / "main").mkdir(parents=True, exist_ok=True)
            (src_dir / "usa" / "main" / "foo.c").write_text(
                "extern void func_02006148(void);\n",
                encoding="utf-8",
            )
            # Run with config/eur/ as the primary (matches CI's
            # `--version eur` default)
            issues = check_cross_file_name_drift(
                src_dir, libs_dir, eur_config,
            )
            # No drift errors: USA symbol resolves via sibling
            # config/usa/symbols.txt
            self.assertEqual(
                [i for i in issues if i.severity == "error"], [],
                "multi-region union should resolve USA symbol against "
                "config/usa/ even when --version eur is passed",
            )

    def test_multi_region_genuinely_missing_still_flags(self):
        # Sanity check the fix isn't too loose: a name missing from
        # ALL regions' symbols.txt must still trip the check.
        with tempfile.TemporaryDirectory() as td:
            tmp = Path(td)
            eur_config, src_dir, libs_dir = self._setup(
                tmp,
                symbols={"main": []},  # empty EUR symbols
            )
            # Bootstrap USA + JPN with their own (different) symbol sets
            for region, addr in (("usa", "0x02000010"), ("jpn", "0x02000020")):
                rc = tmp / "config" / region / "arm9"
                rc.mkdir(parents=True, exist_ok=True)
                (rc / "symbols.txt").write_text(
                    f"func_{addr[2:]} kind:function(arm,size=0x10) "
                    f"addr:{addr}\n",
                    encoding="utf-8",
                )
            # Reference a symbol that exists in NONE of the regions
            (src_dir / "main").mkdir(parents=True, exist_ok=True)
            (src_dir / "main" / "drift.c").write_text(
                "extern void func_deadbeef(void);\n",
                encoding="utf-8",
            )
            issues = check_cross_file_name_drift(
                src_dir, libs_dir, eur_config,
            )
            errors = [i for i in issues if i.severity == "error"]
            self.assertEqual(
                len(errors), 1,
                "symbol missing from ALL regions must still error",
            )
            self.assertIn("func_deadbeef", errors[0].message)


if __name__ == "__main__":
    unittest.main()
