#!/usr/bin/env python3
"""Cross-check permanent wall catalog membership against live assembly headers.

The wall catalog is prose, so this deliberately parses only the immediate
paragraph or table following each ``**Affected picks`` marker.  Addresses in
later explanatory prose (including retractions) are not membership.  The
tool's scope is P-series entries because those are the citations that make a
file permanent in :mod:`wall_aware_headroom`.

Usage::

    python tools/wall_catalog_check.py
    python tools/wall_catalog_check.py --apply

Without ``--apply`` the command is a report-only audit.  ``--apply`` adds one
comment line to each live baseline ``.s`` whose catalog membership is
unambiguous and whose header does not already cite the wall.  Region ports
and catalog entries without a live source are reported but never modified.
"""
from __future__ import annotations

import argparse
import re
from collections import defaultdict
from dataclasses import dataclass
from pathlib import Path

import wall_aware_headroom

ROOT = Path(__file__).resolve().parent.parent
CATALOG = ROOT / "docs/research/codegen-walls.md"
_SECTION_RE = re.compile(r"^### (?P<wall>P-\d+[a-z]?)\. .*$", re.MULTILINE)
_ANY_SECTION_RE = re.compile(r"^### .*$", re.MULTILINE)
_ADDRESS_RE = re.compile(
    r"(?<![0-9A-Fa-f])(?:0x)?(?P<address>[0-9A-Fa-f]{8})(?![0-9A-Fa-f])",
    re.IGNORECASE,
)
_FILE_ADDRESS_RE = re.compile(r"_(?P<address>[0-9A-Fa-f]{8})\.s$")
_P_CITATION_RE = re.compile(r"\bP-\d+[a-z]?\b")


@dataclass(frozen=True)
class CatalogMember:
    address: str
    wall: str


@dataclass(frozen=True)
class LiveSource:
    address: str
    path: str
    text: str


def _affected_blocks(section: str) -> list[str]:
    """Return only immediate affected-picks paragraphs/tables in a section."""
    markers = list(re.finditer(r"\*\*Affected picks", section))
    blocks: list[str] = []
    for marker in markers:
        tail = section[marker.start():]
        # Every affected-picks list in the catalog is a paragraph or markdown
        # table followed by a blank line.  This boundary excludes explanatory
        # prose such as the P-23 retraction after its live list.
        block = re.split(r"\n\s*\n", tail, maxsplit=1)[0]
        blocks.append(block)
    return blocks


def read_catalog(path: Path = CATALOG) -> set[CatalogMember]:
    """Read P-series addresses from affected-picks blocks only."""
    text = path.read_text(encoding="utf-8")
    sections = list(_SECTION_RE.finditer(text))
    all_sections = list(_ANY_SECTION_RE.finditer(text))
    members: set[CatalogMember] = set()
    for section in sections:
        next_sections = [item.start() for item in all_sections if item.start() > section.start()]
        end = min(next_sections, default=len(text))
        body = text[section.start():end]
        for block in _affected_blocks(body):
            for match in _ADDRESS_RE.finditer(block):
                line_start = block.rfind("\n", 0, match.start()) + 1
                line_end = block.find("\n", match.end())
                line = block[line_start:] if line_end < 0 else block[line_start:line_end]
                if re.search(r"\bretracted\b", line, re.IGNORECASE):
                    continue
                members.add(
                    CatalogMember(
                        address=f"0x{match.group('address').lower()}",
                        wall=section.group("wall"),
                    )
                )
    return members


def _is_baseline_source(path: Path) -> bool:
    rel = path.relative_to(ROOT).as_posix()
    return rel.startswith("src/main/") or bool(re.match(r"src/overlay\d{3}/", rel))


def read_live_sources(root: Path = ROOT) -> dict[str, list[LiveSource]]:
    """Index live baseline .s files by address, excluding region-port copies."""
    live_paths = wall_aware_headroom._live_sources()
    sources: dict[str, list[LiveSource]] = defaultdict(list)
    for path in (root / "src").rglob("*.s"):
        if not _is_baseline_source(path):
            continue
        rel = path.relative_to(root).as_posix()
        if rel not in live_paths:
            continue
        match = _FILE_ADDRESS_RE.search(path.name)
        if match:
            address = f"0x{match.group('address').lower()}"
            sources[address].append(
                LiveSource(address=address, path=rel, text=path.read_text(encoding="utf-8"))
            )
    return dict(sources)


def _group_members(members: set[CatalogMember]) -> dict[str, set[str]]:
    grouped: dict[str, set[str]] = defaultdict(set)
    for member in members:
        grouped[member.address].add(member.wall)
    return dict(grouped)


def _format_addresses(values: set[str]) -> str:
    return ", ".join(sorted(values))


def audit(
    members: set[CatalogMember],
    sources: dict[str, list[LiveSource]],
) -> dict[str, object]:
    """Return deterministic audit buckets used by the CLI and tests."""
    catalog = _group_members(members)
    missing: list[tuple[str, str, str]] = []
    mismatched: list[tuple[str, str, str, str]] = []
    ambiguous: list[tuple[str, str, str]] = []
    no_live: list[tuple[str, str]] = []
    for address, walls in sorted(catalog.items()):
        candidates = sources.get(address, [])
        if not candidates:
            no_live.append((address, _format_addresses(walls)))
            continue
        if len(candidates) != 1:
            ambiguous.append((address, _format_addresses(walls), "; ".join(x.path for x in candidates)))
            continue
        source = candidates[0]
        citations = set(_P_CITATION_RE.findall(source.text))
        if not citations:
            missing.append((address, _format_addresses(walls), source.path))
        elif not (citations & walls):
            mismatched.append(
                (address, _format_addresses(walls), _format_addresses(citations), source.path)
            )
    return {
        "catalog_members": len(members),
        "catalog_addresses": len(catalog),
        "live_addresses": sum(address in sources for address in catalog),
        "missing": missing,
        "mismatched": mismatched,
        "ambiguous": ambiguous,
        "no_live": no_live,
    }


def apply_missing(
    report: dict[str, object],
    sources: dict[str, list[LiveSource]],
    excluded: set[str] | None = None,
) -> int:
    """Add P citations to unambiguous missing headers and return file count."""
    excluded = excluded or set()
    changed = 0
    for address, walls, path_text in report["missing"]:  # type: ignore[union-attr]
        if address in excluded:
            print(f"SKIP-EXCLUDED {address} {path_text}")
            continue
        path = ROOT / path_text
        source = sources[address][0]
        citations = ", ".join(sorted(walls.split(", ")))
        lines = source.text.splitlines(keepends=True)
        insert_at = 1 if lines and lines[0].startswith(";") else 0
        lines.insert(insert_at, f"; Wall catalog: {citations}.\n")
        path.write_text("".join(lines), encoding="utf-8", newline="")
        changed += 1
    return changed


def _print_report(report: dict[str, object]) -> None:
    print(f"catalog P-series members: {report['catalog_members']}")
    print(f"catalog addresses: {report['catalog_addresses']}")
    print(f"live baseline addresses: {report['live_addresses']}")
    for address, walls, path in report["missing"]:  # type: ignore[union-attr]
        print(f"MISSING {address} {walls} {path}")
    for address, walls, citations, path in report["mismatched"]:  # type: ignore[union-attr]
        print(f"MISMATCH {address} catalog={walls} header={citations} {path}")
    for address, walls, paths in report["ambiguous"]:  # type: ignore[union-attr]
        print(f"AMBIGUOUS {address} catalog={walls} sources={paths}")
    for address, walls in report["no_live"]:  # type: ignore[union-attr]
        print(f"NO-LIVE-SOURCE {address} catalog={walls}")
    print(f"missing headers: {len(report['missing'])}")
    print(f"catalog entries without live source: {len(report['no_live'])}")


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--apply", action="store_true", help="backfill unambiguous missing headers")
    parser.add_argument(
        "--exclude-address",
        action="append",
        default=[],
        help="do not edit this address (repeat for concurrent work partitions)",
    )
    args = parser.parse_args(argv)
    members = read_catalog()
    sources = read_live_sources()
    report = audit(members, sources)
    _print_report(report)
    if args.apply:
        excluded = {f"0x{value.lower().removeprefix('0x')}" for value in args.exclude_address}
        changed = apply_missing(report, sources, excluded)
        print(f"backfilled headers: {changed}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
