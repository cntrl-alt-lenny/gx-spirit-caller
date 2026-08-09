#!/usr/bin/env python3
"""Mechanically reclassify the main small-tier worklist from .s bodies."""

from __future__ import annotations

import argparse
import re
from collections import Counter
from dataclasses import dataclass
from pathlib import Path


ROOT = Path(__file__).resolve().parent.parent
WORKLIST = ROOT / "docs" / "research" / "campaign-analytics" / "main-small-tier-worklist.md"
SOURCE_DIR = ROOT / "src" / "main"
ROW_RE = re.compile(
    r"^\| (?P<rank>[SD]-\d+) \| (?P<address>0x[0-9A-Fa-f]+) \| "
    r"(?P<size>\d+) \| (?P<current>[^|]+?) \|(?P<tail>.*)$"
)
INSTR_RE = re.compile(r"^\s*(?P<op>[A-Za-z][A-Za-z0-9.]*)\s*(?P<args>.*)$")
LABEL_RE = re.compile(r"^\s*(?P<label>[.A-Za-z_][\w.]*)\s*:")
SOFTFLOAT_TARGET_RE = re.compile(
    r"(?:__aeabi_[fiud]|__gnu_|__flo|__fix|__addsf|__subsf|__mulsf|__divsf|"
    r"sqrtf|float|softfloat|fixsf)",
    re.IGNORECASE,
)
CONDITIONAL_BRANCHES = {
    "bcs", "bcc", "bhs", "blo", "beq", "bne", "bmi", "bpl", "bvs", "bvc",
    "bhi", "bls", "bge", "blt", "bgt", "ble",
}


@dataclass(frozen=True)
class Row:
    rank: str
    address: str
    size: int
    current: str


@dataclass(frozen=True)
class Body:
    path: Path | None
    text: str
    instructions: tuple[tuple[str, str], ...]
    labels: dict[str, int]


def read_rows(path: Path = WORKLIST) -> list[Row]:
    rows = []
    for line in path.read_text(encoding="utf-8").splitlines():
        match = ROW_RE.match(line)
        if match:
            rows.append(
                Row(
                    match.group("rank"),
                    match.group("address"),
                    int(match.group("size")),
                    match.group("current").strip(),
                )
            )
    return rows


def parse_body(row: Row) -> Body:
    address = row.address[2:].lower()
    path = SOURCE_DIR / f"func_{address}.s"
    if not path.is_file():
        return Body(None, "", (), {})
    text = path.read_text(encoding="utf-8", errors="replace")
    instructions: list[tuple[str, str]] = []
    labels: dict[str, int] = {}
    for raw in text.splitlines():
        line = raw.split(";", 1)[0].strip()
        if not line:
            continue
        label = LABEL_RE.match(line)
        if label:
            labels[label.group("label")] = len(instructions)
            remainder = line[label.end():].strip()
            if not remainder or remainder.startswith("."):
                continue
            line = remainder
        if line.startswith("."):
            continue
        match = INSTR_RE.match(line)
        if match:
            instructions.append((match.group("op").lower(), match.group("args").strip()))
    return Body(path, text, tuple(instructions), labels)


def branch_kind(op: str) -> str:
    base = op.rstrip(".")
    if base in {"b", "bl", "blx", "bx"}:
        return base
    if base in CONDITIONAL_BRANCHES:
        return "conditional"
    if base.startswith("b") and base not in {"bic", "bics"}:
        return "conditional"
    return ""


def has_backward_branch(body: Body) -> bool:
    for index, (op, args) in enumerate(body.instructions):
        if branch_kind(op) not in {"b", "conditional"}:
            continue
        target = args.split(",", 1)[0].strip()
        if target in body.labels and body.labels[target] < index:
            return True
    return False


def is_return(op: str, args: str) -> bool:
    op = op.rstrip(".")
    return (
        (op == "bx" and args.strip() == "lr")
        or (op.startswith("ldm") and "pc" in args)
        or (op == "pop" and "pc" in args)
        or (op == "mov" and args.replace(" ", "") == "pc,lr")
    )


def branch_count(body: Body) -> int:
    exits = {
        label
        for label, index in body.labels.items()
        if index < len(body.instructions)
        and is_return(*body.instructions[index])
    }
    count = 0
    for op, args in body.instructions:
        kind = branch_kind(op)
        if kind == "conditional":
            count += 1
        elif kind == "b" and args.split(",", 1)[0].strip() not in exits:
            count += 1
    return count


def classify(row: Row) -> tuple[str, str]:
    body = parse_body(row)
    if body.path is None:
        return "unclassified", "missing .s body"
    instructions = body.instructions
    ops = [op.rstrip(".") for op, _ in instructions]
    calls = [op for op in ops if op in {"bl", "blx"}]
    conditional = [op for op in ops if branch_kind(op) == "conditional"]
    transfer = [op for op in ops if branch_kind(op) in {"b", "bl", "blx"}]
    has_frame = any(
        op.startswith(("stm", "push")) or (op.startswith("sub") and "sp" in args)
        for op, args in instructions
    )
    softfloat = any(op.startswith("clz") for op in ops) or any(
        op in {"bl", "blx"} and SOFTFLOAT_TARGET_RE.search(args)
        for op, args in instructions
    )
    if len(instructions) == 1 and ops == ["bx"] and instructions[0][1].strip() == "lr":
        return "trivial stub", "single bx lr, no frame"
    if (
        not has_frame
        and len(instructions) <= 2
        and not calls
        and not transfer
        and row.size <= 8
    ):
        return "trivial stub", "small no-call/no-branch body"
    if softfloat:
        return "softfloat/CLZ", "CLZ instruction or recognized float-helper call"
    if has_backward_branch(body):
        return "loop", "branch target precedes the branch in the body"
    dispatcher = any(op in {"tbb", "tbh"} for op in ops) or any(
        op in {"ldr", "add"} and "pc" in args for op, args in instructions
    ) or branch_count(body) >= 4
    if dispatcher:
        return "small dispatcher", "jump-table/PC shape or four-plus branches"
    if len(transfer) == 1 and len(instructions) <= 6 and not conditional:
        return "tail-call forwarder", "one forward transfer in a short body"
    if 1 <= len(conditional) <= 3:
        return "guard chain", "one-to-three conditional branches, no backward edge"
    return "other", "remaining structured body"


def classify_rows(rows: list[Row]) -> list[tuple[Row, str, str]]:
    return [(row, *classify(row)) for row in rows]


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--canary", nargs="+", help="addresses to print before bulk output")
    args = parser.parse_args()
    rows = read_rows()
    classified = classify_rows(rows)
    if args.canary:
        wanted = {value.lower().removeprefix("0x") for value in args.canary}
        for row, derived, reason in classified:
            if row.address[2:].lower() in wanted:
                print(row, "->", derived, reason)
        return 0
    counts = Counter((row.current, derived) for row, derived, _ in classified)
    print(f"rows={len(rows)}")
    for (current, derived), count in sorted(counts.items()):
        print(f"{current} -> {derived}: {count}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
