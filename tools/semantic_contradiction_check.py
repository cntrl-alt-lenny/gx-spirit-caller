#!/usr/bin/env python3
"""Report closed enum ranges contradicted by matched-C/dossier evidence.

This is deliberately a narrow checker for the risk class identified by
``cm-f-cf8-contradiction``. It reports evidence and never rewrites canonical
documentation. The six candidates exclude ``Ov013Slot`` because its values
are array-literal-backed rather than inferred from comparison sites.
"""
from __future__ import annotations

import argparse
import re
from dataclasses import dataclass
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent


@dataclass(frozen=True)
class EnumCandidate:
    name: str
    doc_name: str
    anchor: re.Pattern[str]
    evidence: re.Pattern[str]
    line_anchor: bool = True


@dataclass(frozen=True)
class Evidence:
    path: str
    value: int
    snippet: str


@dataclass(frozen=True)
class Result:
    candidate: EnumCandidate
    documented: frozenset[int]
    evidence: tuple[Evidence, ...]

    @property
    def outside(self) -> tuple[int, ...]:
        return tuple(sorted({item.value for item in self.evidence} - self.documented))


def _number(raw: str) -> int:
    return int(raw, 0)


def parse_enum_values(text: str, enum_name: str) -> frozenset[int]:
    """Extract explicit integer members from one documented C enum."""
    match = re.search(
        rf"typedef\s+enum\s+{re.escape(enum_name)}\s*\{{(?P<body>.*?)\}}",
        text,
        re.S,
    )
    if not match:
        raise ValueError(f"enum {enum_name!r} not found")
    values = {
        _number(raw)
        for raw in re.findall(r"=\s*(-?(?:0[xX][0-9a-fA-F]+|\d+))", match.group("body"))
    }
    if not values:
        raise ValueError(f"enum {enum_name!r} has no explicit integer members")
    return frozenset(values)


def _evidence_for(candidate: EnumCandidate, path: str, text: str) -> list[Evidence]:
    if not candidate.anchor.search(text):
        return []
    found: list[Evidence] = []
    for line in text.splitlines():
        if candidate.line_anchor and not candidate.anchor.search(line):
            continue
        for match in candidate.evidence.finditer(line):
            found.append(Evidence(path, _number(match.group("value")), line.strip()))
    return found


def scan_texts(
    candidates: tuple[EnumCandidate, ...],
    docs: dict[str, str],
    evidence_files: dict[str, str],
) -> list[Result]:
    """Scan supplied text maps; this seam keeps regression fixtures immutable."""
    results: list[Result] = []
    for candidate in candidates:
        documented = parse_enum_values(docs[candidate.doc_name], candidate.name)
        evidence: list[Evidence] = []
        for path, text in evidence_files.items():
            evidence.extend(_evidence_for(candidate, path, text))
        results.append(Result(candidate, documented, tuple(evidence)))
    return results


def _candidate_specs() -> tuple[EnumCandidate, ...]:
    number = r"(?P<value>-?(?:0[xX][0-9a-fA-F]+|\d+))"
    return (
        EnumCandidate(
            "DuelPhase", "DuelStateEnums.md",
            re.compile(r"\bf_cf8\b"),
            re.compile(r"\bf_cf8\s*(?:==|!=|<=|>=|<|>)\s*" + number),
        ),
        EnumCandidate(
            "Ov006SubState", "OverlayConstants.md",
            re.compile(r"\bdata_ov006_(?:021cf140|0224f1b0|0224f1fc|0224f248|0224f290|0224f2e8)\b"),
            re.compile(
                r"(?:\*\s*\([^)]*\)\s*)?"
                r"data_ov006_(?:021cf140|0224f1b0|0224f1fc|0224f248|0224f290|0224f2e8)"
                r"(?:\s*(?:\[\s*0\s*\]|(?:\.|->)f0\b))?\s*=\s*" + number
            ),
        ),
        EnumCandidate(
            "Ov004Phase", "OverlayConstants.md",
            re.compile(r"\bdata_ov004_0220b500\b"),
            re.compile(r"(?:0x54|\b84\b).*?(?:=|==|!=|<=|>=|<|>)\s*" + number),
            False,
        ),
        EnumCandidate(
            "Ov000Facing", "OverlayConstants.md",
            re.compile(r"\b(?:OV000_FACING|data_ov000_)\b"),
            re.compile(r"(?:==|!=|<=|>=|<|>)\s*" + number),
        ),
        EnumCandidate(
            "Ov011SlotState", "OverlayConstants.md",
            re.compile(r"\b(?:OV011_SLOT|data_ov011_)\b"),
            re.compile(r"(?:==|!=|<=|>=|<|>)\s*" + number),
        ),
        EnumCandidate(
            "Ov011ViewMode", "OverlayConstants.md",
            re.compile(r"\b(?:OV011_VIEW|data_ov011_)\b"),
            re.compile(r"(?:==|!=|<=|>=|<|>)\s*" + number),
        ),
    )


def scan_tree(
    constants_dir: Path = ROOT / "docs/research/constants",
    source_dir: Path = ROOT / "src",
    dossiers_dir: Path = ROOT / "docs/research/dossiers",
) -> list[Result]:
    candidates = _candidate_specs()
    docs = {
        candidate.doc_name: (constants_dir / candidate.doc_name).read_text(encoding="utf-8")
        for candidate in candidates
    }
    evidence_files: dict[str, str] = {}
    for path in sorted(source_dir.rglob("*.c")):
        evidence_files[str(path.relative_to(ROOT))] = path.read_text(encoding="utf-8")
    for path in sorted(dossiers_dir.glob("*.md")):
        evidence_files[str(path.relative_to(ROOT))] = path.read_text(encoding="utf-8")
    return scan_texts(candidates, docs, evidence_files)


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--constants-dir", type=Path, default=ROOT / "docs/research/constants")
    parser.add_argument("--source-dir", type=Path, default=ROOT / "src")
    parser.add_argument("--dossiers-dir", type=Path, default=ROOT / "docs/research/dossiers")
    return parser


def main(argv: list[str] | None = None) -> int:
    args = build_parser().parse_args(argv)
    results = scan_tree(args.constants_dir, args.source_dir, args.dossiers_dir)
    contradictions = [result for result in results if result.outside]
    print(f"candidate enums: {len(results)}")
    print(f"confirmed contradictions: {len(contradictions)}/{len(results)}")
    for result in contradictions:
        print(
            f"CONTRADICTION {result.candidate.name}: "
            f"documented={sorted(result.documented)} outside={list(result.outside)}"
        )
        for item in result.evidence:
            if item.value not in result.documented:
                print(f"  {item.path}: {item.snippet}")
    return 1 if contradictions else 0


if __name__ == "__main__":
    raise SystemExit(main())
