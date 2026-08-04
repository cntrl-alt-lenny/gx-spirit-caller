#!/usr/bin/env python3
"""Report documented enum ranges contradicted by matched-C evidence.

Candidates come from the structure of the constants documents rather than a
hard-coded enum-name list. Open observed-value sets are reported as observed
documentation, not treated as closed ranges. A malformed candidate is an
explicit UNPARSEABLE result so one bad section cannot hide the rest.
"""
from __future__ import annotations

import argparse
import re
from dataclasses import dataclass
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent

_NUMBER = r"-?(?:0[xX][0-9a-fA-F]+|\d+)"
_NUMBER_RE = re.compile(_NUMBER)
_HEADING_RE = re.compile(r"^(#{2,6})\s+(.+?)\s*$", re.M)
_ENUM_RE = re.compile(
    r"typedef\s+enum\s+(?P<name>[A-Za-z_]\w*)\s*\{(?P<body>.*?)\}",
    re.S,
)
_OBSERVED_MARKER_RE = re.compile(
    r"confirmed\s+(?:values\s+include|(?:STORED|COMPARED-ONLY)\s+values\s*:?)",
    re.I,
)
_IDENTIFIER_RE = re.compile(
    r"\b(?:data_[A-Za-z0-9_]+|f_[0-9a-fA-F]+|OV\d+_[A-Z][A-Z0-9_]*)\b"
)
_OFFSET_RE = re.compile(r"\+\s*(0x[0-9a-fA-F]+|\d+)", re.I)
_VALUE_AFTER_OPERATOR_RE = re.compile(
    rf"(?:==|!=|<=|>=|"
    rf"[A-Za-z_][A-Za-z0-9_.\[\]*()>\- ]*?\s*=\s*|"
    rf"\b(?:case|return)\s+)(?P<value>{_NUMBER})"
)


@dataclass(frozen=True)
class EnumCandidate:
    name: str
    doc_name: str
    anchor: re.Pattern[str]
    evidence: re.Pattern[str]
    line_anchor: bool = True
    open_set: bool = False
    section: str = ""


@dataclass(frozen=True)
class Evidence:
    path: str
    value: int
    snippet: str


@dataclass(frozen=True)
class Result:
    candidate: EnumCandidate
    documented: frozenset[int] | None
    evidence: tuple[Evidence, ...]
    error: str | None = None

    @property
    def status(self) -> str:
        if self.error:
            return "UNPARSEABLE"
        if self.candidate.open_set:
            return "OBSERVED"
        return "CHECKED"

    @property
    def outside(self) -> tuple[int, ...]:
        if self.error or self.candidate.open_set or self.documented is None:
            return ()
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
        for raw in re.findall(
            rf"=\s*({_NUMBER})", match.group("body"), re.I,
        )
    }
    if not values:
        raise ValueError(f"enum {enum_name!r} has no explicit integer members")
    return frozenset(values)


def parse_observed_values(text: str) -> frozenset[int]:
    """Extract values from a documented open observed-value-set section."""
    marker = _OBSERVED_MARKER_RE.search(text)
    if not marker:
        raise ValueError("observed-value-set marker not found")
    tail = text[marker.end():]
    # The value declaration is intentionally local: do not absorb later
    # examples or unrelated constants from the rest of a long section.
    line = tail.splitlines()[0] if tail.splitlines() else ""
    if not line.strip():
        line = tail[:240]
    values = frozenset(_number(match.group()) for match in _NUMBER_RE.finditer(line))
    if not values:
        raise ValueError("observed-value-set has no explicit values")
    return values


def _sections(text: str) -> list[tuple[str, str]]:
    headings = list(_HEADING_RE.finditer(text))
    return [
        (match.group(2), text[match.end():next_match.start() if next_match else None])
        for match, next_match in zip(headings, headings[1:] + [None], strict=True)
    ]


def _candidate_anchor(heading: str, section: str, name: str) -> re.Pattern[str]:
    context = "\n".join(section.splitlines()[:25])
    identifiers = sorted(set(_IDENTIFIER_RE.findall(f"{heading}\n{context}")))
    data_symbols = [item for item in identifiers if item.lower().startswith("data_")]
    field_symbols = [item for item in identifiers if item.lower().startswith("f_")]
    offsets = _OFFSET_RE.findall(heading)
    if data_symbols and offsets:
        offset_terms: list[str] = []
        for raw in offsets:
            value = int(raw, 0)
            offset_terms.extend((raw, str(value), f"field_{value:x}"))
        return re.compile(
            rf"(?=.*(?:{'|'.join(map(re.escape, data_symbols))}))"
            rf"(?=.*(?:{'|'.join(map(re.escape, sorted(set(offset_terms))))}))",
            re.I,
        )
    if field_symbols:
        return re.compile("|".join(re.escape(item) for item in field_symbols), re.I)
    identifiers.append(name)
    return re.compile("|".join(re.escape(item) for item in identifiers), re.I)


def discover_candidates(docs: dict[str, str]) -> tuple[EnumCandidate, ...]:
    """Discover closed and open enum-like candidates from Markdown sections."""
    candidates: list[EnumCandidate] = []
    for doc_name, text in sorted(docs.items()):
        for heading, section in _sections(text):
            enum_matches = list(_ENUM_RE.finditer(section))
            for match in enum_matches:
                name = match.group("name")
                candidates.append(EnumCandidate(
                    name,
                    doc_name,
                    _candidate_anchor(heading, section, name),
                    _VALUE_AFTER_OPERATOR_RE,
                    section=section,
                ))
            if _OBSERVED_MARKER_RE.search(section):
                name = re.sub(r"[^A-Za-z0-9]+", " ", heading).strip()
                candidates.append(EnumCandidate(
                    name,
                    doc_name,
                    _candidate_anchor(heading, section, name),
                    _VALUE_AFTER_OPERATOR_RE,
                    line_anchor=False,
                    open_set=True,
                    section=section,
                ))
    return tuple(candidates)


def _evidence_for(candidate: EnumCandidate, path: str, text: str) -> list[Evidence]:
    found: list[Evidence] = []
    for line in text.splitlines():
        stripped = line.lstrip()
        if stripped.startswith(("*", "//", "/*", "*/", "#", "|", "- ", "**")):
            continue
        if candidate.line_anchor and not candidate.anchor.search(line):
            continue
        if not candidate.line_anchor and not candidate.anchor.search(line):
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
        try:
            source = candidate.section or docs[candidate.doc_name]
            documented = (
                parse_observed_values(source)
                if candidate.open_set
                else parse_enum_values(source, candidate.name)
            )
        except (KeyError, ValueError) as exc:
            results.append(Result(candidate, None, (), str(exc)))
            continue
        evidence: list[Evidence] = []
        for path, text in evidence_files.items():
            evidence.extend(_evidence_for(candidate, path, text))
        results.append(Result(candidate, documented, tuple(evidence)))
    return results


def scan_tree(
    constants_dir: Path = ROOT / "docs/research/constants",
    source_dir: Path = ROOT / "src",
    dossiers_dir: Path = ROOT / "docs/research/dossiers",
) -> list[Result]:
    docs = {
        str(path.relative_to(constants_dir)): path.read_text(encoding="utf-8")
        for path in sorted(constants_dir.glob("*.md"))
    }
    candidates = discover_candidates(docs)
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
    unparseable = [result for result in results if result.status == "UNPARSEABLE"]
    observed = [result for result in results if result.status == "OBSERVED"]
    closed = [result for result in results if result.status == "CHECKED"]
    contradictions = [result for result in closed if result.outside]
    print(f"candidate enums: {len(results)}")
    print(f"closed candidates: {len(closed)}")
    print(f"observed-value-set candidates: {len(observed)}")
    print(f"UNPARSEABLE: {len(unparseable)}")
    print(f"confirmed contradictions: {len(contradictions)}/{len(closed)}")
    for result in unparseable:
        print(f"UNPARSEABLE {result.candidate.name}: {result.error}")
    for result in contradictions:
        print(
            f"CONTRADICTION {result.candidate.name}: "
            f"documented={sorted(result.documented or ())} outside={list(result.outside)}"
        )
        for item in result.evidence:
            if item.value not in (result.documented or ()):
                print(f"  {item.path}: {item.snippet}")
    return 1 if contradictions or unparseable else 0


if __name__ == "__main__":
    raise SystemExit(main())
