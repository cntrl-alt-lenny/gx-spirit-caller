#!/usr/bin/env python3
"""Rank documented struct fields by distinct matched-source exposure.

This is a deliberately narrow lexical census.  It counts a source file once
per field and access direction, even when that file contains many matching
instructions.  C uses named member access (and, for documented base symbols,
the documented offset); assembly uses load/store instructions at that offset.
It does not attempt to infer masked read-modify-writes, bulk Fill32 calls, or
SDK accesses whose field touch is hidden behind an API.
"""

from __future__ import annotations

import argparse
import re
from dataclasses import dataclass
from pathlib import Path

from progress import _strip_c_comments_and_literals, parse_delinks_file


ROOT = Path(__file__).resolve().parent.parent
TYPES_DIR = ROOT / "docs" / "research" / "types"

FIELD_RE = re.compile(
    r"^\s*.*?\b(?P<name>[A-Za-z_]\w*)\s*"
    r"(?::\s*\d+)?\s*;\s*/\*\s*\+"
    r"(?P<offset>0x[0-9A-Fa-f]+|\d+)\b",
    re.MULTILINE,
)
BASE_RE = re.compile(r"\bdata_(?:ov\d+_)?[0-9a-fA-F]+\b")
DIRECT_MEMBER_RE = r"(?:\.|->)\s*{field}\b"


@dataclass(frozen=True)
class DocumentedField:
    doc: str
    name: str
    offset: int
    base_symbols: tuple[str, ...] = ()


@dataclass(frozen=True)
class ExposureRow:
    doc: str
    field: str
    offset: int
    read_sites: int
    write_sites: int
    total: int


def parse_documented_fields(doc_name: str, text: str) -> list[DocumentedField]:
    """Parse C-style field declarations with an inline hexadecimal offset."""
    fields: list[DocumentedField] = []
    bases = tuple(sorted(set(BASE_RE.findall(text))))
    seen: set[tuple[str, int]] = set()
    for match in FIELD_RE.finditer(text):
        name = match.group("name")
        offset = int(match.group("offset"), 0)
        key = (name, offset)
        if key in seen:
            continue
        seen.add(key)
        fields.append(DocumentedField(doc_name, name, offset, bases))
    return fields


def _source_matches_field(field: DocumentedField, path: str, text: str) -> bool:
    """Return whether a source has lexical evidence for this field."""
    member = re.compile(DIRECT_MEMBER_RE.format(field=re.escape(field.name)))
    if path.endswith(".c") and member.search(text):
        return True
    if path.endswith(".s"):
        offset = f"0x{field.offset:x}"
        return bool(
            re.search(
                rf"\[[^,\]]+,\s*#?{re.escape(offset)}\s*\]",
                text,
                re.IGNORECASE,
            )
        )
    if not field.base_symbols or not any(base in text for base in field.base_symbols):
        return False
    offset = f"0x{field.offset:x}"
    return bool(
        re.search(
            rf"\[[^,\]]+,\s*#?{re.escape(offset)}\s*\]",
            text,
            re.IGNORECASE,
        )
    )


def _c_accesses(field: DocumentedField, text: str) -> tuple[bool, bool]:
    reads = writes = False
    member = re.compile(DIRECT_MEMBER_RE.format(field=re.escape(field.name)))
    offset = f"0x{field.offset:x}"
    raw = re.compile(
        rf"\[[^,\]]+,\s*#?{re.escape(offset)}\s*\]"
        rf"|\b(?:\+\s*)?{re.escape(offset)}\b",
        re.IGNORECASE,
    )
    for line in _strip_c_comments_and_literals(text).splitlines():
        stripped = line.lstrip()
        if stripped.startswith(("//", "/*", "*", "#")):
            continue
        is_member = bool(member.search(line))
        is_raw = bool(field.base_symbols) and any(
            base in line for base in field.base_symbols
        ) and bool(raw.search(line))
        if not (is_member or is_raw):
            continue
        if is_member:
            token = re.search(
                rf"{DIRECT_MEMBER_RE.format(field=re.escape(field.name))}"
                rf"\s*(?P<op>[+\-*/%&|^]?=|\+\+|--)",
                line,
            )
            if token:
                writes = True
                if token.group("op") != "=":
                    reads = True
            else:
                reads = True
            continue
        raw_match = raw.search(line)
        equals = re.search(r"(?<![=!<>])=(?!=)", line)
        if equals and raw_match and raw_match.start() < equals.start():
            writes = True
        else:
            reads = True
    return reads, writes


def _asm_accesses(field: DocumentedField, text: str) -> tuple[bool, bool]:
    offset = f"0x{field.offset:x}"
    address = re.compile(
        rf"\[[^,\]]+,\s*#?{re.escape(offset)}\s*\]", re.IGNORECASE
    )
    reads = writes = False
    for line in text.splitlines():
        stripped = line.strip()
        if not stripped or stripped.startswith((";", "@", "#")):
            continue
        if not address.search(line):
            continue
        opcode = stripped.split(None, 1)[0].lower().rstrip(".")
        if opcode.startswith("ldr"):
            reads = True
        elif opcode.startswith("str"):
            writes = True
    return reads, writes


def count_exposure(
    field: DocumentedField, sources: dict[str, str]
) -> tuple[int, int, int]:
    """Return distinct read sites, write sites, and their union."""
    read_sites: set[str] = set()
    write_sites: set[str] = set()
    for path, text in sources.items():
        if not _source_matches_field(field, path, text):
            continue
        reads, writes = (
            _c_accesses(field, text)
            if path.endswith(".c")
            else _asm_accesses(field, text)
        )
        if reads:
            read_sites.add(path)
        if writes:
            write_sites.add(path)
    return len(read_sites), len(write_sites), len(read_sites | write_sites)


def _source_paths(version: str) -> list[Path]:
    paths: list[Path] = []
    config_root = ROOT / "config" / version / "arm9"
    for delinks in sorted(config_root.rglob("delinks.txt")):
        _sections, tus = parse_delinks_file(delinks)
        for tu in tus:
            source = tu.get("source", "")
            if tu.get("status") != "complete" or not source.endswith((".c", ".s")):
                continue
            path = ROOT / source
            if path.exists() and path not in paths:
                paths.append(path)
    return paths


def _relevant_source(field: DocumentedField, path: Path) -> bool:
    overlays = re.findall(r"data_(ov\d+)_", " ".join(field.base_symbols))
    if overlays:
        return any(path.parts[-2] == f"overlay{int(overlay[2:]):03d}" for overlay in overlays)
    if field.base_symbols:
        return "main" in path.parts
    return True


def load_sources(version: str, fields: list[DocumentedField]) -> dict[str, str]:
    paths = _source_paths(version)
    relevant = {
        path: path.read_text(encoding="utf-8", errors="replace")
        for field in fields
        for path in paths
        if _relevant_source(field, path)
    }
    return {str(path.relative_to(ROOT)): text for path, text in relevant.items()}


def run(version: str = "eur", doc_names: list[str] | None = None) -> list[ExposureRow]:
    names = doc_names or [path.name for path in sorted(TYPES_DIR.glob("*.md")) if path.name != "INDEX.md"]
    fields: list[DocumentedField] = []
    for name in names:
        path = Path(name)
        if not path.is_absolute():
            path = TYPES_DIR / path.name
        fields.extend(parse_documented_fields(path.name, path.read_text(encoding="utf-8")))
    sources = load_sources(version, fields)
    rows: list[ExposureRow] = []
    for field in fields:
        reads, writes, total = count_exposure(field, sources)
        rows.append(ExposureRow(field.doc, field.name, field.offset, reads, writes, total))
    return sorted(rows, key=lambda row: (-row.total, row.doc, row.field))


def render(rows: list[ExposureRow], version: str) -> str:
    lines = [
        f"Field exposure census (version={version})",
        "doc | field | offset | read-sites | write-sites | total",
        "--- | --- | --- | ---: | ---: | ---:",
    ]
    for row in rows:
        lines.append(
            f"{row.doc} | {row.field} | 0x{row.offset:X} | "
            f"{row.read_sites} | {row.write_sites} | {row.total}"
        )
    lines.extend([
        "",
        "Coverage note: this lexical census counts explicit named C members and "
        "offset-based load/store instructions in matched .c/.s sites. It cannot "
        "see masked read-modify-writes, bulk Fill32 operations, or SDK calls that "
        "touch a field behind an API.",
    ])
    return "\n".join(lines)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--version", default="eur", choices=("eur", "usa", "jpn"))
    parser.add_argument("--doc", action="append", help="type-doc basename; repeatable")
    args = parser.parse_args()
    rows = run(args.version, args.doc)
    print(render(rows, args.version))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
