"""Guard live-data tests against hard-coded cardinality assertions."""

from __future__ import annotations

import ast
import re
import unittest
from dataclasses import dataclass
from pathlib import Path


LIVE_MARKERS = (
    "read_rows(",
    "derive_aliases(",
    "_history_ship_flips(",
    "audit_file(",
    "load_ledger(",
    "collect(",
)

_COMMIT_SHA_RE = re.compile(r"(?<![0-9a-f])[0-9a-f]{40}(?![0-9a-f])", re.IGNORECASE)
_STATE_FIELD_NAMES = {"bytes", "candidates", "count", "rows", "size", "total"}


@dataclass(frozen=True)
class Finding:
    path: Path
    line: int
    expression: str


def _is_len_call(node: ast.AST) -> bool:
    return (
        isinstance(node, ast.Call)
        and isinstance(node.func, ast.Name)
        and node.func.id == "len"
    )


def _is_literal_count(node: ast.AST) -> bool:
    return (
        isinstance(node, ast.Constant)
        and isinstance(node.value, int)
        and not isinstance(node.value, bool)
    )


def _is_literal_repo_value(node: ast.AST) -> bool:
    return isinstance(node, ast.Constant) and isinstance(
        node.value, (int, float, str)
    ) and not isinstance(node.value, bool)


def _is_repo_state_expression(node: ast.AST) -> bool:
    if _is_len_call(node):
        return True
    if isinstance(node, ast.Call) and isinstance(node.func, ast.Attribute):
        return node.func.attr.lower() in {"count", "total"}
    if isinstance(node, ast.Attribute):
        field = node.attr.lower()
        return field in _STATE_FIELD_NAMES or field.endswith("_count")
    if isinstance(node, ast.Subscript) and isinstance(node.slice, ast.Constant):
        return isinstance(node.slice.value, str) and node.slice.value.lower() in _STATE_FIELD_NAMES
    return False


def _cardinality_assertion(node: ast.AST) -> bool:
    if isinstance(node, ast.Assert) and isinstance(node.test, ast.Compare):
        comparison = node.test
        return (
            len(comparison.ops) == 1
            and isinstance(comparison.ops[0], ast.Eq)
            and (
                (_is_len_call(comparison.left) and _is_literal_count(comparison.comparators[0]))
                or (
                    _is_literal_count(comparison.left)
                    and _is_len_call(comparison.comparators[0])
                )
            )
        )
    if isinstance(node, ast.Call) and isinstance(node.func, ast.Attribute):
        return (
            node.func.attr == "assertEqual"
            and len(node.args) >= 2
            and (
                (_is_len_call(node.args[0]) and _is_literal_count(node.args[1]))
                or (_is_literal_count(node.args[0]) and _is_len_call(node.args[1]))
            )
        )
    return False


def _repo_state_assertion(node: ast.AST) -> bool:
    """Match exact scalar assertions against a live repo-state measurement.

    The guard intentionally does not treat a literal used to build a fixture as
    brittle. It only reaches a constant on the asserted side of an equality.
    Collection-shape properties such as ``names == set()`` remain legal.
    """
    pairs: list[tuple[ast.AST, ast.AST]] = []
    if isinstance(node, ast.Assert) and isinstance(node.test, ast.Compare):
        comparison = node.test
        if len(comparison.ops) == 1 and isinstance(comparison.ops[0], ast.Eq):
            pairs.append((comparison.left, comparison.comparators[0]))
    elif isinstance(node, ast.Call) and isinstance(node.func, ast.Attribute):
        if node.func.attr == "assertEqual" and len(node.args) >= 2:
            pairs.append((node.args[0], node.args[1]))
    return any(
        (_is_repo_state_expression(left) and _is_literal_repo_value(right))
        or (_is_literal_repo_value(left) and _is_repo_state_expression(right))
        for left, right in pairs
    )


def _is_assertion_node(node: ast.AST) -> bool:
    if isinstance(node, ast.Assert):
        return True
    return (
        isinstance(node, ast.Call)
        and isinstance(node.func, ast.Attribute)
        and node.func.attr.startswith("assert")
        and node.func.attr not in {"assertRaises", "assertRaisesRegex"}
    )


def _contains_hardcoded_commit_assertion(node: ast.AST) -> bool:
    return any(
        isinstance(child, ast.Constant)
        and isinstance(child.value, str)
        and _COMMIT_SHA_RE.fullmatch(child.value) is not None
        for child in ast.walk(node)
    )


def _contains_live_marker(source: str, node: ast.AST) -> bool:
    segment = ast.get_source_segment(source, node) or ""
    return any(marker in segment for marker in LIVE_MARKERS)


def _body_nodes(node: ast.AST):
    for child in ast.iter_child_nodes(node):
        if isinstance(child, (ast.FunctionDef, ast.AsyncFunctionDef, ast.ClassDef)):
            continue
        yield child
        yield from _body_nodes(child)


def _find_in_function(
    source: str, path: Path, node: ast.FunctionDef | ast.AsyncFunctionDef, live: bool,
) -> list[Finding]:
    if not live:
        return []
    findings = []
    for child in _body_nodes(node):
        if _cardinality_assertion(child):
            findings.append(
                Finding(path, child.lineno, ast.unparse(child).strip())
            )
    return findings


def find_live_cardinality_assertions(source: str, path: Path = Path("<source>")) -> list[Finding]:
    tree = ast.parse(source, filename=str(path))
    findings = []

    def visit_body(body, inherited_live=False):
        for node in body:
            if isinstance(node, ast.ClassDef):
                class_live = inherited_live or _contains_live_marker(source, node)
                visit_body(node.body, class_live)
            elif isinstance(node, (ast.FunctionDef, ast.AsyncFunctionDef)):
                function_live = inherited_live or _contains_live_marker(source, node)
                findings.extend(_find_in_function(source, path, node, function_live))

    visit_body(tree.body)
    return findings


def find_test_brittleness_assertions(
    source: str, path: Path = Path("<source>"),
) -> list[Finding]:
    """Find asserted literals tied to live repo state, including commit SHAs."""
    tree = ast.parse(source, filename=str(path))
    findings: list[Finding] = []

    def visit_body(body, inherited_live=False):
        for node in body:
            if isinstance(node, ast.ClassDef):
                class_live = inherited_live or _contains_live_marker(source, node)
                visit_body(node.body, class_live)
            elif isinstance(node, (ast.FunctionDef, ast.AsyncFunctionDef)):
                function_live = inherited_live or _contains_live_marker(source, node)
                if function_live:
                    for child in _body_nodes(node):
                        if _is_assertion_node(child) and (
                            _repo_state_assertion(child)
                            or _contains_hardcoded_commit_assertion(child)
                        ):
                            findings.append(
                                Finding(path, child.lineno, ast.unparse(child).strip())
                            )
                elif isinstance(node, (ast.FunctionDef, ast.AsyncFunctionDef)):
                    for child in _body_nodes(node):
                        if _is_assertion_node(child) and _contains_hardcoded_commit_assertion(child):
                            findings.append(
                                Finding(path, child.lineno, ast.unparse(child).strip())
                            )

    visit_body(tree.body)
    return findings


def find_repo_live_cardinality_assertions(root: Path) -> list[Finding]:
    findings = []
    for path in sorted((root / "tests").glob("test_*.py")):
        if path.name == Path(__file__).name:
            continue
        findings.extend(find_live_cardinality_assertions(path.read_text(), path))
    return findings


def find_repo_test_brittleness_assertions(root: Path) -> list[Finding]:
    findings = []
    for path in sorted((root / "tests").glob("test_*.py")):
        if path.name == Path(__file__).name:
            continue
        findings.extend(find_test_brittleness_assertions(path.read_text(), path))
    return findings


class TestLiveCardinalityGuard(unittest.TestCase):
    def test_live_cardinality_guard_is_clean_on_current_tests(self):
        root = Path(__file__).resolve().parents[1]
        assert find_repo_live_cardinality_assertions(root) == []

    def test_general_brittleness_guard_is_clean_on_current_tests(self):
        root = Path(__file__).resolve().parents[1]
        assert find_repo_test_brittleness_assertions(root) == []

    def test_live_cardinality_guard_flags_live_hardcoded_counts_only(self):
        source = """
def test_fixture_local():
    rows = [1, 2, 3]
    assert len(rows) == 3

class Live:
    def test_live_source(self):
        rows = load_ledger()
        self.assertEqual(len(rows), 12)
"""
        findings = find_live_cardinality_assertions(source)
        assert len(findings) == 1
        assert findings[0].line == 9

    def test_live_cardinality_guard_accepts_three_fixture_counts(self):
        source = """
def test_one():
    assert len([1]) == 1

def test_two():
    self.assertEqual(len({1, 2}), 2)

def test_three():
    values = [1, 2, 3]
    assert 3 == len(values)
"""
        assert find_live_cardinality_assertions(source) == []

    def test_general_brittleness_guard_flags_hardcoded_sha_assertion(self):
        hardcoded_sha = "deadbeef" * 5
        source = f'''\ndef test_bad():\n    result = "ok"\n    assert result == "{hardcoded_sha}"\n'''
        findings = find_test_brittleness_assertions(source)
        assert len(findings) == 1
        assert findings[0].line == 4

    def test_general_brittleness_guard_allows_historical_sha_as_input(self):
        historical_sha = "deadbeef" * 5
        source = f'''\ndef test_history_input():\n    kickoff = "git show {historical_sha}^:src/main/func.s"\n    assert "git show" in kickoff\n'''
        assert find_test_brittleness_assertions(source) == []

    def test_general_brittleness_guard_flags_live_scalar_and_allows_fixture_shape(self):
        source = """
def test_live():
    rows = load_ledger()
    assert rows.count("x") == 3

def test_shape():
    names = {"x"}
    assert names == set()
"""
        findings = find_test_brittleness_assertions(source)
        assert len(findings) == 1
        assert findings[0].line == 4


if __name__ == "__main__":
    unittest.main()
