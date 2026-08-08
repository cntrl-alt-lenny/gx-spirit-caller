#!/usr/bin/env python3
"""Find candidate producer sites for a field without claiming they are writes.

The older field-exposure census intentionally handles only explicit member
access and direct load/store pairs.  That leaves three common producer shapes
unreported: masked read-modify-write sequences, fills whose range contains a
field, and calls receiving a field or containing-block address.  This tool is
an evidence finder for those shapes.  Its output is a ranked hypothesis list;
the producer/consumer lens remains responsible for deciding whether a site
actually writes the requested field.

Usage:
    python tools/field_producer_finder.py BASE OFFSET WIDTH
    python tools/field_producer_finder.py GlobalData02104bac 0x54 2 --region eur --json

Exit codes:
    0  The search completed, whether or not hypotheses were found.
    2  Invalid field arguments or an unreadable source root.
"""

from __future__ import annotations

import argparse
import json
import re
from dataclasses import asdict, dataclass, replace
from pathlib import Path

from progress import _strip_c_comments_and_literals

ROOT = Path(__file__).resolve().parent.parent
SHAPES = ("masked-rmw", "bulk-fill", "sdk-call")
FILL_RE = re.compile(
    r"\b(?:memset|memcpy|MI[_]?Cpu(?:Fill|Clear)|Fill(?:16|32)?|DMA|Dma)\w*\b",
    re.IGNORECASE,
)
RMW_RE = re.compile(r"(?:\|=|&=|\^=|[|&^]|\b(?:orr|bic|and)\b)", re.IGNORECASE)
CALL_RE = re.compile(r"\b(?:bl(?:x)?\s+\w+|[A-Za-z_]\w*\s*\()")
ASM_ACCESS_RE = re.compile(
    r"^\s*(?P<op>ldr(?:b|h|sb|sh)?|str(?:b|h)?)[.]?\s+"
    r"(?P<value>r\d+),\s*\[(?P<base>r\d+),\s*#?(?P<offset>0x[0-9a-f]+|\d+)\]",
    re.IGNORECASE,
)
ASM_ALU_RE = re.compile(
    r"^\s*(?:orr|bic|and)\s+(?P<dst>r\d+),\s*(?P<src>r\d+)", re.IGNORECASE
)


@dataclass(frozen=True)
class FieldSpec:
    base: str
    offset: int
    width: int
    symbols: tuple[str, ...]
    field_names: tuple[str, ...]


@dataclass(frozen=True)
class Candidate:
    path: str
    line: int
    shape: str
    score: int
    evidence: str
    anchor: str = "BASE-ANCHORED"


def _symbols(base: str) -> tuple[str, ...]:
    """Return mechanically-derived global spellings; do not invent aliases."""
    values = {base}
    match = re.search(r"([0-9a-f]{8})$", base, re.IGNORECASE)
    if match:
        address = match.group(1).lower()
        values.update({f"data_{address}", f"GlobalData{address}"})
    return tuple(sorted(values, key=lambda value: (-len(value), value)))


def make_spec(base: str, offset: int, width: int) -> FieldSpec:
    if offset < 0 or width <= 0:
        raise ValueError("offset must be non-negative and width must be positive")
    field_names = {f"f{offset:x}", f"f{offset:X}"}
    return FieldSpec(base, offset, width, _symbols(base), tuple(sorted(field_names)))


def _contains_symbol(line: str, spec: FieldSpec) -> bool:
    return any(re.search(rf"(?<![A-Za-z0-9_]){re.escape(symbol)}(?![A-Za-z0-9_])", line)
               for symbol in spec.symbols)


def _c_symbols(text: str, spec: FieldSpec) -> tuple[str, ...]:
    """Add only local variable names declared with the requested exact type."""
    values = set(spec.symbols)
    for symbol in spec.symbols:
        declaration = re.compile(
            rf"\b{re.escape(symbol)}\s*(?:\*\s*)*([A-Za-z_]\w*)\s*(?:[;,=)])"
        )
        values.update(match.group(1) for match in declaration.finditer(text))
    return tuple(sorted(values, key=lambda value: (-len(value), value)))


def _field_access(line: str, spec: FieldSpec) -> bool:
    if not _contains_symbol(line, spec):
        return False
    names = "|".join(re.escape(name) for name in spec.field_names)
    if re.search(rf"(?:\.|->)\s*(?:{names})\b", line):
        return True
    offset = f"(?:0x{spec.offset:x}|0x{spec.offset:X}|{spec.offset})"
    # A bare number on a line mentioning the base is not an access: decimal
    # 20 must not accidentally qualify a field at hexadecimal 0x14.
    return bool(re.search(
        rf"\+\s*{offset}\b|\[\s*{offset}\s*\]", line, re.IGNORECASE
    ))


def _address_taking_call(line: str, spec: FieldSpec) -> bool:
    if not _contains_symbol(line, spec) or not CALL_RE.search(line):
        return False
    fields = "|".join(re.escape(name) for name in spec.field_names)
    return bool(
        re.search(
            rf"(?<!&)\&\s*(?:{'|'.join(re.escape(s) for s in spec.symbols)})"
            rf"(?:\s*(?:\.|->)\s*(?:{fields}))?\b",
            line,
        )
    )


def _fill_covers(line: str, spec: FieldSpec) -> bool:
    """Require a literal fill size that reaches the requested byte range."""
    if not FILL_RE.search(line) or not _contains_symbol(line, spec):
        return False
    numbers = [
        int(value, 0)
        for value in re.findall(
            r"(?<![A-Za-z_])(?:0x[0-9a-f]+|\d+)", line, re.IGNORECASE
        )
    ]
    return any(size >= spec.offset + spec.width for size in numbers)


def _candidate_from_window(
    path: str, start: int, lines: list[str], spec: FieldSpec
) -> list[Candidate]:
    """Inspect a small C window and emit only the three requested shapes."""
    found: list[Candidate] = []
    evidence = " ".join(line.strip() for line in lines if line.strip())
    exact = any(_field_access(line, spec) for line in lines)
    has_fill = any(_fill_covers(line, spec) for line in lines)
    has_call = any(_address_taking_call(line, spec) for line in lines)
    has_rmw = any(
        _field_access(line, spec)
        and RMW_RE.search(line)
        and re.search(r"(?<![=!<>])=(?!=)|\|=|&=|\^=", line)
        for line in lines
    )
    if has_rmw and exact:
        found.append(Candidate(path.replace("\\", "/"), start, "masked-rmw", 120 + (15 if exact else 0), evidence))
    if has_fill and (_contains_symbol(" ".join(lines), spec) or exact):
        found.append(Candidate(path.replace("\\", "/"), start, "bulk-fill", 95 + (15 if exact else 0), evidence))
    if has_call:
        found.append(Candidate(path.replace("\\", "/"), start, "sdk-call", 75 + (15 if exact else 0), evidence))
    return found


def _scan_c(path: Path, text: str, spec: FieldSpec) -> list[Candidate]:
    # Do not let a prose comment or a string literal become a fake producer.
    lines = _strip_c_comments_and_literals(text).splitlines()
    spec = replace(spec, symbols=_c_symbols("\n".join(lines), spec))
    candidates: list[Candidate] = []
    for index, line in enumerate(lines):
        if not _field_access(line, spec) and not _contains_symbol(line, spec):
            continue
        begin = max(0, index - 2)
        end = min(len(lines), index + 3)
        evidence = " ".join(item.strip() for item in lines[begin:end] if item.strip())
        exact = _field_access(line, spec)
        if exact and RMW_RE.search(line) and re.search(
            r"(?<![=!<>])=(?!=)|\|=|&=|\^=", line
        ):
            candidates.append(
                Candidate(
                    str(path).replace("\\", "/"),
                    index + 1,
                    "masked-rmw",
                    135,
                    evidence,
                )
            )
        if _fill_covers(line, spec):
            candidates.append(
                Candidate(
                    str(path).replace("\\", "/"),
                    index + 1,
                    "bulk-fill",
                    110 if exact else 95,
                    evidence,
                )
            )
        if _address_taking_call(line, spec):
            candidates.append(
                Candidate(
                    str(path).replace("\\", "/"),
                    index + 1,
                    "sdk-call",
                    90 if exact else 75,
                    evidence,
                )
            )
    return candidates


def _scan_asm(path: Path, text: str, spec: FieldSpec) -> list[Candidate]:
    lines = text.splitlines()
    wanted = spec.offset
    accesses: list[tuple[int, re.Match[str]]] = []
    for index, line in enumerate(lines):
        match = ASM_ACCESS_RE.match(line)
        if match and int(match.group("offset"), 0) == wanted:
            accesses.append((index, match))
    candidates: list[Candidate] = []

    def base_anchor(access_index: int, base_register: str) -> str:
        """Resolve ``ldr rX, _LITn`` and compare its pool symbol to the field."""
        load_re = re.compile(
            rf"^\s*ldr(?:\.\w+)?\s+{re.escape(base_register)},\s*"
            r"(?P<label>_?LIT\w+)\b", re.IGNORECASE
        )
        pool_re = re.compile(
            r"^\s*(?P<label>_?LIT\w+):\s*\.word\s+(?P<symbol>[A-Za-z_]\w*)",
            re.IGNORECASE,
        )
        for prior in range(access_index - 1, max(-1, access_index - 64), -1):
            load = load_re.match(lines[prior])
            if not load:
                continue
            label = load.group("label")
            for pool_line in lines:
                pool = pool_re.match(pool_line)
                if pool and pool.group("label").lower() == label.lower():
                    return (
                        "BASE-ANCHORED"
                        if pool.group("symbol") in spec.symbols
                        else "OFFSET-ONLY"
                    )
            return "OFFSET-ONLY"
        return "OFFSET-ONLY"

    for index, access in accesses:
        if not access.group("op").lower().startswith("ldr"):
            continue
        for later in range(index + 1, min(len(lines), index + 10)):
            alu = ASM_ALU_RE.match(lines[later])
            if not alu or alu.group("dst") != access.group("value"):
                continue
            for store_index in range(later + 1, min(len(lines), later + 8)):
                store = ASM_ACCESS_RE.match(lines[store_index])
                if not store or not store.group("op").lower().startswith("str"):
                    continue
                if (store.group("value") == access.group("value")
                        and store.group("base") == access.group("base")
                        and int(store.group("offset"), 0) == wanted):
                    window = lines[max(0, index - 3):min(len(lines), store_index + 4)]
                    anchor = base_anchor(index, access.group("base"))
                    candidates.append(Candidate(
                        str(path).replace("\\", "/"), index + 1, "masked-rmw", 120,
                        " ".join(window).strip(), anchor,
                    ))
                    break
            break
        window = lines[max(0, index - 16):min(len(lines), index + 17)]
        if any(_fill_covers(line, spec) for line in window) and _contains_symbol(" ".join(window), spec):
            candidates.append(Candidate(str(path).replace("\\", "/"), index + 1, "bulk-fill", 95, " ".join(window).strip()))
        address_taken = any(
            re.search(rf"\badd\s+r\d+,\s*r\d+,\s*#?0x{spec.offset:x}\b", line, re.IGNORECASE)
            for line in window
        )
        if address_taken and any(re.search(r"\bbl(?:x)?\b", line, re.IGNORECASE) for line in window) and _contains_symbol(" ".join(window), spec):
            candidates.append(Candidate(str(path).replace("\\", "/"), index + 1, "sdk-call", 75, " ".join(window).strip()))
    return candidates


def _in_region(relative: str, region: str | None) -> bool:
    if region is None:
        return True
    if region == "eur":
        return bool(re.match(r"src/(?:main|overlay\d{3})(?:/|$)", relative))
    return relative.startswith(f"src/{region}/")


def find_candidates(
    spec: FieldSpec, root: Path = ROOT, region: str | None = "eur"
) -> list[Candidate]:
    """Search C/ARM source files below *root*, EUR-first by default."""
    candidates: list[Candidate] = []
    for path in sorted(root.glob("src/**/*.c")) + sorted(root.glob("src/**/*.s")):
        try:
            text = path.read_text(encoding="utf-8", errors="replace")
        except OSError:
            continue
        relative = str(path.relative_to(root)).replace("\\", "/")
        if not _in_region(relative, region):
            continue
        local = _scan_c(Path(relative), text, spec) if path.suffix == ".c" else _scan_asm(Path(relative), text, spec)
        candidates.extend(local)
    unique: dict[tuple[str, int, str], Candidate] = {}
    for candidate in candidates:
        unique[(candidate.path, candidate.line, candidate.shape)] = candidate
    anchored = [
        candidate.score for candidate in unique.values()
        if candidate.anchor == "BASE-ANCHORED"
    ]
    if anchored:
        offset_ceiling = min(anchored) - 1
        unique = {
            key: (
                replace(candidate, score=min(candidate.score, offset_ceiling))
                if candidate.anchor == "OFFSET-ONLY" else candidate
            )
            for key, candidate in unique.items()
        }
    return sorted(
        unique.values(),
        key=lambda item: (
            item.anchor != "BASE-ANCHORED", -item.score, item.path, item.line, item.shape
        ),
    )


def render(spec: FieldSpec, candidates: list[Candidate], as_json: bool = False) -> str:
    if as_json:
        return json.dumps({
            "base": spec.base,
            "offset": spec.offset,
            "width": spec.width,
            "searched_shapes": list(SHAPES),
            "candidates": [asdict(candidate) for candidate in candidates],
        }, indent=2)
    lines = [
        f"Field: {spec.base} + 0x{spec.offset:X} (width={spec.width})",
        "Searched shapes: masked-rmw, bulk-fill, sdk-call",
    ]
    if not candidates:
        lines.append("NO CANDIDATES: no searched-shape hypothesis was found.")
        return "\n".join(lines)
    lines.extend([
        "rank | score | anchor | shape | site | evidence",
        "---: | ---: | --- | --- | --- | ---",
    ])
    for rank, candidate in enumerate(candidates, 1):
        evidence = re.sub(r"\s+", " ", candidate.evidence).replace("|", "\\|")
        lines.append(
            f"{rank} | {candidate.score} | {candidate.anchor} | {candidate.shape} | "
            f"{candidate.path}:{candidate.line} | {evidence}"
        )
    return "\n".join(lines)


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("base")
    parser.add_argument("offset", type=lambda value: int(value, 0))
    parser.add_argument("width", type=int)
    parser.add_argument("--root", type=Path, default=ROOT)
    parser.add_argument("--region", choices=("eur", "usa", "jpn"), default="eur")
    parser.add_argument("--json", action="store_true")
    args = parser.parse_args(argv)
    if not args.root.is_dir():
        parser.error(f"source root does not exist: {args.root}")
    try:
        spec = make_spec(args.base, args.offset, args.width)
    except ValueError as exc:
        parser.error(str(exc))
    print(render(spec, find_candidates(spec, args.root, args.region), args.json))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
