"""Guard the narrow parser-ownership contracts documented by tools.parsers.

This is intentionally a source-shape test, not a broad duplicate-code linter.
It covers the two parser shapes that already produced wrong answers: a local
comment/literal scrubber and an instruction parser that accepts only ARM's
four-byte words.  A temporary synthetic duplicate is checked explicitly so
the regression test proves that it would reject a reintroduced copy.
"""

from __future__ import annotations

import ast
import subprocess
import tempfile
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]


def _tracked_tool_python_files() -> list[Path]:
    """Every `tools/*.py` file git actually tracks.

    A raw `(ROOT / "tools").rglob("*.py")` also walks gitignored download directories
    (`tools/arm-none-eabi/`, `tools/mwccarm/`, ...) that some workflows
    populate locally -- arm-binutils bundles its own CPython stdlib, whose
    test suite includes deliberately-malformed fixtures (e.g.
    `bad_coding2.py`, a bad-encoding regression test) that aren't valid
    Python and were never meant to be scanned as project source.
    """

    output = subprocess.run(
        ["git", "-C", str(ROOT), "ls-files", "tools/*.py"],
        capture_output=True, text=True, check=True,
    ).stdout
    return sorted(ROOT / line for line in output.splitlines() if line)


def _target_names(node: ast.AST) -> set[str]:
    """Return simple names assigned by an assignment node."""

    targets: list[ast.AST] = []
    if isinstance(node, ast.Assign):
        targets = node.targets
    elif isinstance(node, ast.AnnAssign):
        targets = [node.target]
    return {target.id for target in targets if isinstance(target, ast.Name)}


def _contains_call(node: ast.AST, name: str) -> bool:
    """Whether an AST subtree calls a simple function named ``name``."""

    return any(
        isinstance(child, ast.Call)
        and isinstance(child.func, ast.Name)
        and child.func.id == name
        for child in ast.walk(node)
    )


def _instruction_pattern(node: ast.AST) -> str | None:
    """Extract the literal passed to an ``_INSN = re.compile(...)`` node."""

    value = node.value if isinstance(node, (ast.Assign, ast.AnnAssign)) else None
    if not isinstance(value, ast.Call) or not value.args:
        return None
    try:
        pattern = ast.literal_eval(value.args[0])
    except (ValueError, TypeError):
        return None
    return pattern if isinstance(pattern, str) else None


def _ownership_violations(paths: list[Path]) -> list[str]:
    """Find only the documented scrubber and instruction-parser violations."""

    violations: list[str] = []
    instruction_patterns: list[tuple[Path, str | None]] = []

    for path in paths:
        tree = ast.parse(path.read_text(encoding="utf-8"), filename=str(path))
        for node in ast.walk(tree):
            if isinstance(node, (ast.FunctionDef, ast.AsyncFunctionDef)):
                if node.name == "_strip_c_comments_and_literals" and path.name != "progress.py":
                    violations.append(f"{path.name}: redefines the canonical C scrubber")
                elif node.name == "_strip_comments" and not _contains_call(
                    node, "_strip_c_comments_and_literals"
                ):
                    violations.append(f"{path.name}: local _strip_comments implementation")

            if "_INSN" in _target_names(node):
                instruction_patterns.append((path, _instruction_pattern(node)))

    if instruction_patterns:
        canonical = instruction_patterns[0][1]
        for path, pattern in instruction_patterns:
            if pattern != canonical:
                violations.append(f"{path.name}: _INSN differs from the synchronized parser")
            if pattern is None or "{8}" not in pattern or "{4}" not in pattern:
                violations.append(f"{path.name}: _INSN is not Thumb-safe")

    return violations


class ParserOwnershipTests(unittest.TestCase):
    def test_current_tools_obey_the_ownership_contract(self) -> None:
        paths = _tracked_tool_python_files()
        self.assertEqual(_ownership_violations(paths), [])

    def test_synthetic_reintroduced_duplicates_are_rejected(self) -> None:
        paths = _tracked_tool_python_files()
        with tempfile.TemporaryDirectory() as directory:
            duplicate = Path(directory) / "reintroduced_copy.py"
            duplicate.write_text(
                """
import re

def _strip_comments(text):
    return re.sub(r'/\\*.*?\\*/', '', text, flags=re.S)

_INSN = re.compile(r"^\\s+([0-9a-f]+):\\s+([0-9a-f]{8})\\s")
""".strip()
                + "\n",
                encoding="utf-8",
            )
            violations = _ownership_violations(paths + [duplicate])

        self.assertTrue(
            any("local _strip_comments implementation" in violation for violation in violations)
        )
        self.assertTrue(any("_INSN differs" in violation for violation in violations))
        self.assertTrue(any("not Thumb-safe" in violation for violation in violations))


if __name__ == "__main__":
    unittest.main()
