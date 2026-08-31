#!/usr/bin/env python3
"""Guard the assumptions CI's stdlib-only `unittest discover` job relies on.

Two independent checks:

1. Import parity — no test module imports a third-party package the
   stdlib-only job never installs (`ImportViolation`).
2. Collection parity — every test defined in `tests/test_*.py` is actually
   reachable by `unittest discover`. `TestLoader.loadTestsFromModule`
   only finds test methods (name starting with ``test``) on
   `unittest.TestCase` subclasses; it never calls a module-level
   `def test_*():` function and never collects a plain (non-TestCase)
   class. Both forms are legal, collectible pytest — so `pytest
   --collect-only` silently sees more tests than CI ever runs
   (`CollectionViolation`). See docs/queue/claude-decomper.md
   q-ci-test-visibility.
"""

from __future__ import annotations

import ast
import sys
from dataclasses import dataclass
from pathlib import Path


ROOT = Path(__file__).resolve().parent.parent

# (relative POSIX path under the repo root, function/class name) -> reason.
# A test lands here only when it genuinely cannot be expressed as a
# unittest.TestCase method (e.g. it needs a pytest-only fixture/feature).
# CI stays stdlib-only either way: an allow-listed test is skipped by
# `unittest discover` and is not silently claimed to be covered.
COLLECTION_ALLOWLIST: dict[tuple[str, str], str] = {}


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


@dataclass(frozen=True)
class CollectionViolation:
    path: Path
    line: int
    name: str
    kind: str  # "function" or "class"

    def message(self) -> str:
        return (
            f"{self.path}:{self.line}: {self.kind} '{self.name}' is "
            "collected by pytest but invisible to `unittest discover` "
            "(module-level test function, or a test class that doesn't "
            "inherit unittest.TestCase); CI's stdlib-only unittest job "
            "will never run it"
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


def _base_name(node: ast.expr) -> str | None:
    if isinstance(node, ast.Name):
        return node.id
    if isinstance(node, ast.Attribute):
        return node.attr
    return None


def _resolves_to_testcase(
    name: str | None, classes: dict[str, ast.ClassDef], seen: set[str]
) -> bool:
    # `classes` only holds classes defined in the same module, so a base
    # like `unittest.TestCase` resolves on the `name == "TestCase"` check
    # below rather than a lookup; a base imported from elsewhere under a
    # different name is not resolvable and is treated as non-TestCase.
    if name is None or name in seen:
        return False
    seen.add(name)
    if name == "TestCase":
        return True
    cls = classes.get(name)
    if cls is None:
        return False
    return any(_resolves_to_testcase(_base_name(base), classes, seen) for base in cls.bases)


def check_collection(source: str, path: Path) -> list[CollectionViolation]:
    tree = ast.parse(source, filename=str(path))
    classes = {node.name: node for node in tree.body if isinstance(node, ast.ClassDef)}
    violations: list[CollectionViolation] = []
    for node in tree.body:
        if isinstance(node, (ast.FunctionDef, ast.AsyncFunctionDef)) and node.name.startswith(
            "test"
        ):
            violations.append(CollectionViolation(path, node.lineno, node.name, "function"))
        elif isinstance(node, ast.ClassDef):
            has_test_method = any(
                isinstance(child, (ast.FunctionDef, ast.AsyncFunctionDef))
                and child.name.startswith("test")
                for child in node.body
            )
            if not has_test_method:
                continue
            if not any(
                _resolves_to_testcase(_base_name(base), classes, set()) for base in node.bases
            ):
                violations.append(CollectionViolation(path, node.lineno, node.name, "class"))
    return violations


def scan_collection(
    root: Path = ROOT,
) -> tuple[int, list[CollectionViolation], list[CollectionViolation]]:
    """Returns (module_count, failing_violations, allow-listed_violations)."""
    paths = sorted((root / "tests").glob("test_*.py"))
    failing: list[CollectionViolation] = []
    allowed: list[CollectionViolation] = []
    for path in paths:
        relative = path.relative_to(root).as_posix()
        for violation in check_collection(path.read_text(encoding="utf-8"), path):
            if (relative, violation.name) in COLLECTION_ALLOWLIST:
                allowed.append(violation)
            else:
                failing.append(violation)
    return len(paths), failing, allowed


def main() -> int:
    module_count, import_violations = scan_tests()
    collection_count, collection_violations, allowed = scan_collection()

    ok = True
    if import_violations:
        ok = False
        for violation in import_violations:
            print(violation.message(), file=sys.stderr)
    if collection_violations:
        ok = False
        for violation in collection_violations:
            print(violation.message(), file=sys.stderr)
    if not ok:
        return 1

    print(f"unittest import parity: scanned {module_count} test modules; violations=0")
    print(
        f"unittest collection parity: scanned {collection_count} test modules; "
        f"violations=0; allow-listed={len(allowed)}"
    )
    for violation in allowed:
        reason = COLLECTION_ALLOWLIST[(violation.path.relative_to(ROOT).as_posix(), violation.name)]
        print(f"  allowed: {violation.path}:{violation.line}: {violation.name} ({reason})")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
