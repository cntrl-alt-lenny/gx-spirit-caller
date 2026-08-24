from __future__ import annotations

import re
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


def test_new_legitimate_c_lever_ship_stays_green() -> None:
    report = _audit(_row(result="shipped", match_pct="100", park_class="C-99"))
    assert len(report.shipped_with_c_lever) == 1
    assert not report.error_count


def _assert_c_lever_exemption_shape(report: validate_attempts.Audit) -> None:
    assert report.shipped_with_c_lever
    print(f"shipped C-lever rows: {len(report.shipped_with_c_lever)}")
    c_lever = re.compile(r"C-\d+[a-z]?\Z", re.IGNORECASE)
    for row in report.shipped_with_c_lever:
        assert row["result"].strip().lower() == "shipped"
        assert float(row["match_pct"]) == 100
        assert c_lever.fullmatch(row["park_class"].strip())


def test_empty_c_lever_exemption_list_fails_loudly() -> None:
    # Stdlib-only: the `unittest` CI job installs no third-party packages, so a
    # `pytest.raises` here fails the whole module at import time (ModuleNotFoundError).
    try:
        _assert_c_lever_exemption_shape(validate_attempts.Audit())
    except AssertionError:
        return
    raise AssertionError(
        "an empty shipped_with_c_lever set must fail loudly, not pass vacuously"
    )


def test_module_and_text_size_ground_truth_are_checked() -> None:
    invalid = _audit(_row(module="overlay999"))
    assert invalid.invalid_modules
    wrong_size = _audit(_row(text_size="28"))
    assert wrong_size.text_size_mismatches


def test_attempts_accepts_blank_or_integer_and_rejects_other_values() -> None:
    assert not _audit(_row(attempts="")).schema_errors
    assert not _audit(_row(attempts="3")).schema_errors
    assert _audit(_row(attempts="not-a-number")).schema_errors
    assert _audit(_row(attempts="-1")).schema_errors


def test_legacy_row_without_attempts_is_treated_as_blank() -> None:
    row = _row()
    row.pop("attempts", None)
    assert not _audit(row).schema_errors


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
    assert not report.error_count


def test_committed_ledger_c_lever_exemption_is_property_shaped() -> None:
    report = validate_attempts.audit_file(
        Path(__file__).resolve().parents[1]
        / "docs/research/campaign-analytics/attempts.tsv"
    )
    _assert_c_lever_exemption_shape(report)
    assert not report.error_count


def test_ship_coverage_requires_a_shipped_event_for_each_flip() -> None:
    flips = {"cm-main-tier-sweep-99": [{"module": "main", "addr": "0x02000010"}]}
    rows = [_row(result="parked", brief="cm-main-tier-sweep-99")]
    errors = validate_attempts.audit_ship_coverage(flips, rows)
    assert errors and errors[0]["missing"] == flips["cm-main-tier-sweep-99"]


def test_ship_coverage_history_is_not_vacuous() -> None:
    rounds = validate_attempts._history_ship_flips(validate_attempts.ROOT)
    _assert_ship_flip_shape(rounds["cm-main-tier-sweep-7"])


def _assert_ship_flip_shape(flips: list[dict]) -> None:
    assert flips
    assert all(
        set(flip) == {"module", "addr"}
        and isinstance(flip["module"], str)
        and flip["module"]
        and re.fullmatch(r"0x[0-9a-f]{8}", flip["addr"], re.IGNORECASE)
        for flip in flips
    )
    print(f"cm-main-tier-sweep-7 ship flips: {len(flips)}")


def test_ship_coverage_history_shape_rejects_empty_snapshot() -> None:
    try:
        _assert_ship_flip_shape([])
    except AssertionError:
        return
    raise AssertionError("an empty history snapshot must fail loudly")
