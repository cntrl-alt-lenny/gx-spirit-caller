"""Guard live-data tests against hard-coded cardinality assertions."""

from __future__ import annotations

import ast
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


def find_repo_live_cardinality_assertions(root: Path) -> list[Finding]:
    findings = []
    for path in sorted((root / "tests").glob("test_*.py")):
        if path.name == Path(__file__).name:
            continue
        findings.extend(find_live_cardinality_assertions(path.read_text(), path))
    return findings


def test_live_cardinality_guard_is_clean_on_current_tests():
    root = Path(__file__).resolve().parents[1]
    assert find_repo_live_cardinality_assertions(root) == []


def test_live_cardinality_guard_flags_live_hardcoded_counts_only():
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


def test_live_cardinality_guard_accepts_three_fixture_counts():
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
