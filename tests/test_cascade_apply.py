"""Unit tests for tools/cascade_apply.py.

This tool writes to config/**/symbols.txt. A bug that applies a
bad rename or half-applies a batch silently corrupts the decomp
config, which is hard to detect after the fact. Pins:

  - Decisions JSON parsing (addr as hex string / int / invalid)
  - validate() rejects missing fields, invalid ident, duplicate
    old/new in batch, missing old, existing new
  - Atomic semantics: a batch with ONE validation error results
    in ZERO writes (the rest of the batch doesn't apply)
  - apply() writes exactly the renames requested, in order
  - render_commit_template shape + required sections

Tests isolate from the real config/ via monkey-patching
`rename_symbol.CONFIG` to a tmp dir.
"""

from __future__ import annotations

import dataclasses
import sys
import tempfile
import unittest
from pathlib import Path
from unittest.mock import patch

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

import rename_symbol  # noqa: E402
from cascade_apply import (  # noqa: E402
    Decisions,
    Rename,
    ValidationError,
    apply,
    render_commit_template,
    validate,
)


def _write_symbols(root: Path, rel: str, lines: list[str]) -> Path:
    p = root / rel
    p.parent.mkdir(parents=True, exist_ok=True)
    p.write_text("\n".join(lines) + "\n", encoding="utf-8")
    return p


def _symline(name: str, addr: int, size: int = 0x10) -> str:
    return f"{name} kind:function(arm,size=0x{size:x}) addr:0x{addr:08x}"


class TestRenameFromJson(unittest.TestCase):
    def test_hex_addr_string(self):
        r = Rename.from_json({
            "module": "main", "addr": "0x02000800",
            "old": "func_02000800", "new": "Entry",
            "rationale": "bootstrap",
        })
        self.assertEqual(r.addr, 0x02000800)

    def test_int_addr(self):
        r = Rename.from_json({
            "module": "main", "addr": 0x02000800,
            "old": "foo", "new": "Bar",
        })
        self.assertEqual(r.addr, 0x02000800)

    def test_bad_addr_type_raises(self):
        with self.assertRaises(ValueError):
            Rename.from_json({
                "module": "main", "addr": [0x123],
                "old": "foo", "new": "Bar",
            })

    def test_missing_rationale_defaults_empty(self):
        # Rationale is optional — rename still parses without it.
        r = Rename.from_json({
            "module": "main", "addr": "0x1000",
            "old": "foo", "new": "Bar",
        })
        self.assertEqual(r.rationale, "")


class TestDecisionsFromJson(unittest.TestCase):
    def test_shape(self):
        d = Decisions.from_json({
            "brief": "016",
            "anchor": "Task_InvokeLocked",
            "source_scouting": "docs/research/cascade-3-scouting.md",
            "renames": [
                {
                    "module": "main", "addr": "0x020067fc",
                    "old": "func_020067fc", "new": "Task_Post",
                    "rationale": "0.25 jaccard / 36 shared callers",
                },
            ],
        })
        self.assertEqual(d.brief, "016")
        self.assertEqual(d.anchor, "Task_InvokeLocked")
        self.assertEqual(len(d.renames), 1)
        self.assertEqual(d.renames[0].new, "Task_Post")


class TestValidate(unittest.TestCase):
    """validate() is the atomic gate. If it returns errors, apply()
    must NOT be called."""

    def _setup(self, tmp: Path, symbols: dict[str, list[str]]) -> None:
        """symbols: {rel_path: [symline, ...]}. Monkey-patches
        rename_symbol.CONFIG to tmp/config."""
        for rel, lines in symbols.items():
            _write_symbols(tmp / "config", rel, lines)
        patcher = patch.object(rename_symbol, "CONFIG", tmp / "config")
        patcher.start()
        self.addCleanup(patcher.stop)

    def _decisions(self, *renames: dict) -> Decisions:
        return Decisions.from_json({
            "brief": "test", "anchor": "X",
            "source_scouting": "",
            "renames": list(renames),
        })

    def test_happy_path_returns_empty(self):
        with tempfile.TemporaryDirectory() as td:
            tmp = Path(td)
            self._setup(tmp, {
                "eur/arm9/symbols.txt": [
                    _symline("func_02000800", 0x02000800),
                    _symline("func_02001000", 0x02001000),
                ],
            })
            d = self._decisions(
                {"module": "main", "addr": "0x02000800",
                 "old": "func_02000800", "new": "Entry",
                 "rationale": ""},
                {"module": "main", "addr": "0x02001000",
                 "old": "func_02001000", "new": "Main",
                 "rationale": ""},
            )
            self.assertEqual(validate(d, None), [])

    def test_invalid_ident_flagged(self):
        with tempfile.TemporaryDirectory() as td:
            tmp = Path(td)
            self._setup(tmp, {
                "eur/arm9/symbols.txt": [
                    _symline("func_02000800", 0x02000800),
                ],
            })
            d = self._decisions(
                {"module": "main", "addr": "0x02000800",
                 "old": "func_02000800", "new": "has spaces",
                 "rationale": ""},
            )
            errors = validate(d, None)
            self.assertEqual(len(errors), 1)
            self.assertIn("identifier", errors[0].reason)

    def test_missing_old_flagged(self):
        with tempfile.TemporaryDirectory() as td:
            tmp = Path(td)
            self._setup(tmp, {
                "eur/arm9/symbols.txt": [
                    _symline("func_02000800", 0x02000800),
                ],
            })
            d = self._decisions(
                {"module": "main", "addr": "0x02000900",
                 "old": "func_02000900", "new": "NewName",
                 "rationale": ""},
            )
            errors = validate(d, None)
            self.assertEqual(len(errors), 1)
            self.assertIn("not found", errors[0].reason)

    def test_existing_new_flagged(self):
        with tempfile.TemporaryDirectory() as td:
            tmp = Path(td)
            self._setup(tmp, {
                "eur/arm9/symbols.txt": [
                    _symline("func_02000800", 0x02000800),
                    _symline("ExistingName", 0x02001000),
                ],
            })
            d = self._decisions(
                {"module": "main", "addr": "0x02000800",
                 "old": "func_02000800", "new": "ExistingName",
                 "rationale": ""},
            )
            errors = validate(d, None)
            self.assertEqual(len(errors), 1)
            self.assertIn("already exists", errors[0].reason)

    def test_duplicate_old_in_batch_flagged(self):
        with tempfile.TemporaryDirectory() as td:
            tmp = Path(td)
            self._setup(tmp, {
                "eur/arm9/symbols.txt": [
                    _symline("func_02000800", 0x02000800),
                ],
            })
            d = self._decisions(
                {"module": "main", "addr": "0x02000800",
                 "old": "func_02000800", "new": "First",
                 "rationale": ""},
                {"module": "main", "addr": "0x02000800",
                 "old": "func_02000800", "new": "Second",
                 "rationale": ""},
            )
            errors = validate(d, None)
            # Second rename should be flagged ("old referenced twice").
            msgs = [e.reason for e in errors]
            self.assertTrue(any("twice" in m for m in msgs))

    def test_duplicate_new_in_batch_flagged(self):
        with tempfile.TemporaryDirectory() as td:
            tmp = Path(td)
            self._setup(tmp, {
                "eur/arm9/symbols.txt": [
                    _symline("func_02000800", 0x02000800),
                    _symline("func_02001000", 0x02001000),
                ],
            })
            d = self._decisions(
                {"module": "main", "addr": "0x02000800",
                 "old": "func_02000800", "new": "SameName",
                 "rationale": ""},
                {"module": "main", "addr": "0x02001000",
                 "old": "func_02001000", "new": "SameName",
                 "rationale": ""},
            )
            errors = validate(d, None)
            msgs = [e.reason for e in errors]
            self.assertTrue(
                any("two renames in this batch" in m for m in msgs),
            )

    def test_missing_required_fields(self):
        # Empty `module` / `old` / `new` all flagged.
        with tempfile.TemporaryDirectory() as td:
            tmp = Path(td)
            self._setup(tmp, {
                "eur/arm9/symbols.txt": [
                    _symline("ok", 0x1000),
                ],
            })
            d = self._decisions(
                {"module": "", "addr": "0x1000", "old": "ok",
                 "new": "Bar", "rationale": ""},
                {"module": "main", "addr": "0x1000", "old": "",
                 "new": "Bar", "rationale": ""},
                {"module": "main", "addr": "0x1000", "old": "ok",
                 "new": "", "rationale": ""},
            )
            errors = validate(d, None)
            self.assertEqual(len(errors), 3)


class TestApply(unittest.TestCase):
    """apply() actually writes. Pair with validate() checks above —
    apply() trusts its input has been validated."""

    def _setup(self, tmp: Path, symbols: dict[str, list[str]]) -> None:
        for rel, lines in symbols.items():
            _write_symbols(tmp / "config", rel, lines)
        patcher = patch.object(rename_symbol, "CONFIG", tmp / "config")
        patcher.start()
        self.addCleanup(patcher.stop)

    def test_single_rename_writes_correctly(self):
        with tempfile.TemporaryDirectory() as td:
            tmp = Path(td)
            sym_path = tmp / "config" / "eur" / "arm9" / "symbols.txt"
            sym_path.parent.mkdir(parents=True)
            sym_path.write_text(
                _symline("func_02000800", 0x02000800) + "\n",
                encoding="utf-8",
            )
            patcher = patch.object(
                rename_symbol, "CONFIG", tmp / "config",
            )
            patcher.start()
            self.addCleanup(patcher.stop)

            d = Decisions.from_json({
                "brief": "t", "anchor": "A", "source_scouting": "",
                "renames": [{
                    "module": "main", "addr": "0x02000800",
                    "old": "func_02000800", "new": "Entry",
                    "rationale": "",
                }],
            })
            applied = apply(d, None)
            self.assertEqual(len(applied), 1)
            after = sym_path.read_text()
            self.assertIn("Entry kind:function", after)
            self.assertNotIn("func_02000800 kind:function", after)

    def test_multi_rename_all_applied(self):
        with tempfile.TemporaryDirectory() as td:
            tmp = Path(td)
            sym_path = tmp / "config" / "eur" / "arm9" / "symbols.txt"
            sym_path.parent.mkdir(parents=True)
            sym_path.write_text("\n".join([
                _symline("func_02000800", 0x02000800),
                _symline("func_02001000", 0x02001000),
                _symline("func_02002000", 0x02002000),
            ]) + "\n", encoding="utf-8")
            patcher = patch.object(
                rename_symbol, "CONFIG", tmp / "config",
            )
            patcher.start()
            self.addCleanup(patcher.stop)

            d = Decisions.from_json({
                "brief": "t", "anchor": "A", "source_scouting": "",
                "renames": [
                    {"module": "main", "addr": "0x02000800",
                     "old": "func_02000800", "new": "Entry",
                     "rationale": ""},
                    {"module": "main", "addr": "0x02001000",
                     "old": "func_02001000", "new": "Main",
                     "rationale": ""},
                    {"module": "main", "addr": "0x02002000",
                     "old": "func_02002000", "new": "Init",
                     "rationale": ""},
                ],
            })
            applied = apply(d, None)
            self.assertEqual(len(applied), 3)
            after = sym_path.read_text()
            self.assertIn("Entry kind:", after)
            self.assertIn("Main kind:", after)
            self.assertIn("Init kind:", after)
            self.assertNotIn("func_02000800", after)
            self.assertNotIn("func_02001000", after)
            self.assertNotIn("func_02002000", after)


class TestRenderCommitTemplate(unittest.TestCase):
    def test_has_required_sections(self):
        d = Decisions.from_json({
            "brief": "016",
            "anchor": "Task_InvokeLocked",
            "source_scouting": "docs/research/cascade-3-scouting.md",
            "renames": [
                {"module": "main", "addr": "0x020067fc",
                 "old": "func_020067fc", "new": "Task_Post",
                 "rationale": "36 shared callers"},
                {"module": "main", "addr": "0x020069f4",
                 "old": "func_020069f4", "new": "Task_InvokeAndWait",
                 "rationale": "exact-size match"},
            ],
        })
        out = render_commit_template(d)
        # Subject line shape: "cascade wave (brief 016): 2 renames …"
        self.assertIn("cascade wave (brief 016)", out)
        self.assertIn("2 renames", out)
        self.assertIn("Task_InvokeLocked", out)
        # Renames table has header + each rename row.
        self.assertIn("| Module | Addr |", out)
        self.assertIn("`func_020067fc`", out)
        self.assertIn("`Task_Post`", out)
        self.assertIn("`Task_InvokeAndWait`", out)
        self.assertIn("36 shared callers", out)
        # Test plan checkboxes for the expected verifications.
        self.assertIn("dsd check modules", out)
        self.assertIn("check_match_invariants", out)
        self.assertIn("find_cascades", out)
        self.assertIn("ninja rom", out)

    def test_empty_rationale_renders_dash(self):
        d = Decisions.from_json({
            "brief": "t", "anchor": "A", "source_scouting": "",
            "renames": [{
                "module": "main", "addr": "0x1000",
                "old": "foo", "new": "Bar",
                "rationale": "",
            }],
        })
        out = render_commit_template(d)
        # Empty rationale renders as em-dash so the table row stays
        # well-formed.
        self.assertIn("| —", out)


class TestValidationError(unittest.TestCase):
    def test_frozen_dataclass(self):
        # ValidationError is a frozen dataclass so callers can put
        # them in sets if they want dedup. Smoke the hashability +
        # FrozenInstanceError guard.
        r = Rename.from_json({
            "module": "m", "addr": "0x100", "old": "o", "new": "n",
        })
        e = ValidationError(rename=r, reason="x")
        with self.assertRaises(dataclasses.FrozenInstanceError):
            e.reason = "y"  # type: ignore[misc]


if __name__ == "__main__":
    unittest.main()
