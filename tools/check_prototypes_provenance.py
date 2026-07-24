#!/usr/bin/env python3

"""
check_prototypes_provenance.py — re-verify include/game/prototypes.h
against the matched C bodies it claims to be derived from.

PR #1327's bank was reverted because nothing checked whether a shipped
prototype still agreed with its own supposed source. This tool closes
that gap the strongest way available: it re-runs the SAME evidence
collection tools/gen_prototypes.py used to generate the bank, fresh,
from the current state of every matched source file in `src/`, and
diffs the result against what's actually committed in prototypes.h and
the provenance table. Any drift — a hand-edit, a stale entry after a
matched function's signature changed, a provenance path that no longer
resolves — is reported as an Issue.

Exit code: 0 = clean, 1 = mismatches found, 2 = load/parse error.

Usage:
    python tools/check_prototypes_provenance.py
    python tools/check_prototypes_provenance.py --json
"""

from __future__ import annotations

import argparse
import json
import sys
from dataclasses import asdict, dataclass
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from gen_prototypes import (  # noqa: E402
    PROTOTYPES_H,
    PROVENANCE_JSON,
    collect_evidence_backed_signatures,
    render_prototype,
)


@dataclass
class Issue:
    severity: str  # "error"
    name: str
    detail: str


def check() -> list[Issue]:
    issues: list[Issue] = []

    if not PROTOTYPES_H.is_file():
        return [Issue("error", "<file>", f"{PROTOTYPES_H} does not exist")]
    if not PROVENANCE_JSON.is_file():
        return [Issue("error", "<file>", f"{PROVENANCE_JSON} does not exist")]

    committed_provenance = json.loads(PROVENANCE_JSON.read_text(encoding="utf-8"))
    committed_header = PROTOTYPES_H.read_text(encoding="utf-8")

    fresh = collect_evidence_backed_signatures()
    fresh_names = set(fresh)
    committed_names = set(committed_provenance)

    for name in sorted(committed_names - fresh_names):
        issues.append(Issue(
            "error", name,
            "in committed provenance but no longer evidence-backed "
            "(source file changed, no longer matched, or now ambiguous) "
            "— rerun tools/gen_prototypes.py --write",
        ))

    for name in sorted(fresh_names - committed_names):
        issues.append(Issue(
            "error", name,
            "evidence-backed now but missing from committed prototypes.h "
            "— rerun tools/gen_prototypes.py --write",
        ))

    for name in sorted(fresh_names & committed_names):
        fresh_sig = fresh[name]
        committed_sig = committed_provenance[name]
        fresh_ret = "void" if fresh_sig["is_void_return"] else fresh_sig["return_type"]
        if fresh_sig["source"] != committed_sig["source"]:
            issues.append(Issue(
                "error", name,
                f"provenance source drifted: committed={committed_sig['source']!r} "
                f"fresh={fresh_sig['source']!r}",
            ))
        if fresh_ret != committed_sig["return_type"]:
            issues.append(Issue(
                "error", name,
                f"return type drifted: committed={committed_sig['return_type']!r} "
                f"fresh={fresh_ret!r} (source: {fresh_sig['source']})",
            ))
        if fresh_sig["params"] != committed_sig["params"]:
            issues.append(Issue(
                "error", name,
                f"params drifted: committed={committed_sig['params']!r} "
                f"fresh={fresh_sig['params']!r} (source: {fresh_sig['source']})",
            ))
        expected_line = render_prototype(name, fresh_sig)
        if expected_line not in committed_header:
            issues.append(Issue(
                "error", name,
                f"prototypes.h does not contain the exact line "
                f"{expected_line!r} — was the header hand-edited?",
            ))

    return issues


def main(argv: list[str] | None = None) -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--json", action="store_true", help="Machine-readable output")
    args = ap.parse_args(argv)

    try:
        issues = check()
    except Exception as exc:  # noqa: BLE001 - report, don't crash silently
        print(f"error: {exc}", file=sys.stderr)
        return 2

    if args.json:
        print(json.dumps([asdict(i) for i in issues], indent=2))
    else:
        if not issues:
            print("check_prototypes_provenance: OK — 0 mismatches")
        else:
            for i in issues:
                print(f"[{i.severity}] {i.name}: {i.detail}")
            print(f"\ncheck_prototypes_provenance: {len(issues)} mismatch(es)")

    return 1 if issues else 0


if __name__ == "__main__":
    sys.exit(main())
