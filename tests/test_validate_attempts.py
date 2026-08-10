from __future__ import annotations

import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "tools"))

import validate_attempts  # noqa: E402


def _row(**overrides: str) -> dict:
    row = {
        "addr": "0x02000010",
        "module": "main",
        "text_size": "24",
        "tier": "default",
        "shape": "guard-chain",
        "result": "parked",
        "match_pct": "75",
        "park_class": "reg-alloc",
        "brief": "brief-test",
    }
    row.update(overrides)
    return row


def _audit(row: dict) -> validate_attempts.Audit:
    return validate_attempts.audit_rows(
        [row], modules={"main"}, sizes={("main", "0x02000010"): 24}
    )


def test_contradiction_families_are_detected() -> None:
    assert _audit(_row(result="not-attempted", match_pct="0")).not_attempted_with_measured_pct
    assert _audit(_row(result="shipped", match_pct="99")).shipped_below_100
    assert _audit(_row(result="parked", match_pct="100")).parked_at_100


def test_shipped_c_lever_is_reported_as_provenance_not_error() -> None:
    report = _audit(_row(result="shipped", match_pct="100", park_class="C-55"))
    assert len(report.shipped_with_c_lever) == 1
    assert report.error_count == 0


def test_module_and_text_size_ground_truth_are_checked() -> None:
    invalid = _audit(_row(module="overlay999"))
    assert invalid.invalid_modules
    wrong_size = _audit(_row(text_size="28"))
    assert wrong_size.text_size_mismatches


def test_shape_migration_and_conflict_are_distinguished() -> None:
    move = _audit(_row(shape="P-20-example", park_class=""))
    assert len(move.shape_migrations) == 1
    conflict = _audit(_row(shape="P-20-example", park_class="reg-alloc"))
    assert len(conflict.shape_conflicts) == 1


def test_committed_ledger_has_no_hard_validation_errors() -> None:
    report = validate_attempts.audit_file(
        Path(__file__).resolve().parents[1]
        / "docs/research/campaign-analytics/attempts.tsv"
    )
    assert report.error_count == 0


def test_committed_ledger_keeps_all_31_legitimate_c_lever_ships_green() -> None:
    report = validate_attempts.audit_file(
        Path(__file__).resolve().parents[1]
        / "docs/research/campaign-analytics/attempts.tsv"
    )
    assert len(report.shipped_with_c_lever) == 31
    assert report.error_count == 0
