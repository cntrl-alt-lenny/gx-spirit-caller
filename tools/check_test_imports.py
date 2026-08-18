#!/usr/bin/env python3
"""Check that the unittest suite has no undeclared third-party imports."""

from __future__ import annotations

import ast
import sys
from dataclasses import dataclass
from pathlib import Path


ROOT = Path(__file__).resolve().parent.parent


@dataclass(frozen=True)
class ImportViolation:
    path: Path
    line: int
    module: str

    def message(self) -> str:
        return (
            f"{self.path}:{self.line}: imports third-party module "
            f"'{self.module}'; the stdlib-only unittest job would fail "
            "with ModuleNotFoundError"
        )


def _first_party_module_names(root: Path) -> set[str]:
    names = {"tools"}
    # Tests add both directories to sys.path when importing local helpers.
    # Discover their names instead of maintaining another allowlist.
    for directory in (root / "tools", root / ".claude" / "hooks"):
        for path in directory.rglob("*.py"):
            relative = path.relative_to(directory).with_suffix("")
            if relative.name == "__init__":
                relative = relative.parent
            if relative.parts:
                names.add(relative.parts[0])
    return names


def _import_root(module: str) -> str:
    return module.partition(".")[0]


def _catches_import_error(handler: ast.ExceptHandler) -> bool:
    if handler.type is None:
        return False
    caught = handler.type
    if isinstance(caught, ast.Name):
        return caught.id in {"ImportError", "ModuleNotFoundError"}
    if isinstance(caught, ast.Tuple):
        return any(
            isinstance(item, ast.Name)
            and item.id in {"ImportError", "ModuleNotFoundError"}
            for item in caught.elts
        )
    return False


class _ImportVisitor(ast.NodeVisitor):
    def __init__(self, path: Path, allowed: set[str]) -> None:
        self.path = path
        self.allowed = allowed
        self.graceful_import_depth = 0
        self.violations: list[ImportViolation] = []

    def _check(self, module: str, line: int) -> None:
        if self.graceful_import_depth or _import_root(module) in self.allowed:
            return
        self.violations.append(ImportViolation(self.path, line, module))

    def visit_Import(self, node: ast.Import) -> None:
        for alias in node.names:
            self._check(alias.name, node.lineno)

    def visit_ImportFrom(self, node: ast.ImportFrom) -> None:
        if node.level:
            return
        self._check(node.module or "", node.lineno)

    def visit_Try(self, node: ast.Try) -> None:
        graceful = any(_catches_import_error(handler) for handler in node.handlers)
        if graceful:
            self.graceful_import_depth += 1
        for statement in node.body:
            self.visit(statement)
        if graceful:
            self.graceful_import_depth -= 1
        for handler in node.handlers:
            self.visit(handler)
        for statement in node.orelse:
            self.visit(statement)
        for statement in node.finalbody:
            self.visit(statement)


def check_source(source: str, path: Path, *, root: Path = ROOT) -> list[ImportViolation]:
    tree = ast.parse(source, filename=str(path))
    visitor = _ImportVisitor(
        path, set(sys.stdlib_module_names) | _first_party_module_names(root)
    )
    visitor.visit(tree)
    return visitor.violations


def scan_tests(root: Path = ROOT) -> tuple[int, list[ImportViolation]]:
    paths = sorted((root / "tests").glob("test_*.py"))
    violations: list[ImportViolation] = []
    for path in paths:
        violations.extend(check_source(path.read_text(encoding="utf-8"), path, root=root))
    return len(paths), violations


def main() -> int:
    module_count, violations = scan_tests()
    if violations:
        for violation in violations:
            print(violation.message(), file=sys.stderr)
        return 1
    print(f"unittest import parity: scanned {module_count} test modules; violations=0")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
