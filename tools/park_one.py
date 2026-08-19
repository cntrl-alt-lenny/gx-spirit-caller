#!/usr/bin/env python3
"""Cleanly park (abandon) a single decompilation attempt.

Flips the function's delinks.txt entry back to `.s:` via a surgical
single-line edit (reusing batch_sha1's `_flip_delinks`), then restores
the original `.s` file from git HEAD and removes the abandoned `.c`.

This replaces the `git checkout -- <module>/delinks.txt <file>.s` idiom,
which restores the ENTIRE delinks.txt to HEAD and silently discards any
other already-shipped candidate's uncommitted edit to the same shared
file in the same worktree session — hit independently twice in
cm-ov002-unknown-sweep-8 (see
docs/research/cm-ov002-unknown-sweep-8-2026-07-31.md). Reverting the
single `.s` file via `git checkout` remains safe on its own (each
function owns exactly one `.s` file, no cross-function collision) —
only delinks.txt, a file shared by every function in its module, needed
the surgical fix.

Usage: python tools/park_one.py src/main/func_02012345.c [--region eur]
       [--brief brief-XXX --match-pct 84.2 --park-class reg-alloc]
"""
from __future__ import annotations

import argparse
import csv
import re
import subprocess
import sys
from pathlib import Path

from batch_sha1 import ROOT, _c_to_s_rel, _flip_delinks, _is_already_applied
from normalise_park_class import derive_family
from validate_attempts import audit_event
from wall_aware_headroom import _source_module

_ATTEMPTS_REL = Path("docs/research/campaign-analytics/attempts.tsv")
_ATTEMPTS_HEADER = (
    "addr", "module", "text_size", "tier", "shape", "result",
    "match_pct", "park_class", "park_family", "brief",
)


def _ledger_identity(c_rel: str) -> tuple[str, str]:
    """Return the canonical address and module encoded by a source path."""
    parts = c_rel.split("/")
    if len(parts) < 3 or parts[0] != "src":
        raise ValueError(f"Expected a src/<module>/ .c path, got: {c_rel}")
    match = re.search(r"func_(?:ov\d{3}_)?([0-9a-fA-F]{8})", Path(parts[-1]).name)
    if match is None:
        raise ValueError(f"Could not derive an address from {c_rel}")
    module = _source_module(_c_to_s_rel(c_rel))
    if not module:
        raise ValueError(f"Could not derive a consumer module from {c_rel}")
    return f"0x{match.group(1).lower()}", module


def _validate_ledger(ledger: Path) -> None:
    """Validate the ledger and prove it can be appended before parking.

    This is deliberately a preflight.  `park_one` does not claim transactional
    rollback after delinks/file mutation; malformed or unwritable ledgers are
    rejected before those mutations begin.  The event log is append-only and
    intentionally preserves repeated events, including exact duplicates.
    """
    ledger.parent.mkdir(parents=True, exist_ok=True)
    if ledger.exists():
        if not ledger.is_file():
            raise OSError(f"attempts ledger is not a regular file: {ledger}")
        with ledger.open(newline="", encoding="utf-8") as stream:
            reader = csv.reader(stream, delimiter="\t")
            header = tuple(next(reader, ()))
        if header != _ATTEMPTS_HEADER:
            raise ValueError(f"Unexpected attempts ledger header in {ledger}")
        with ledger.open("a", encoding="utf-8"):
            pass
        return
    probe = ledger.with_name(f".{ledger.name}.write-probe")
    try:
        with probe.open("x", encoding="utf-8"):
            pass
    finally:
        probe.unlink(missing_ok=True)


def _text_size(delinks_path: Path, s_rel: str) -> str:
    """Read the active TU's byte span before its header is flipped."""
    try:
        lines = delinks_path.read_text(encoding="utf-8").splitlines()
    except OSError:
        return "unknown"
    for i, line in enumerate(lines):
        if line != f"{s_rel}:":
            continue
        for child in lines[i + 1 :]:
            if child and not child[0].isspace():
                break
            match = re.search(
                r"\.text start:0x([0-9a-fA-F]+) end:0x([0-9a-fA-F]+)", child,
            )
            if match:
                return str(int(match.group(2), 16) - int(match.group(1), 16))
        break
    return "unknown"


def _record_attempt(
    c_rel: str,
    *,
    text_size: str,
    tier: str,
    shape: str,
    match_pct: str,
    park_class: str,
    brief: str,
    result: str = "parked",
) -> None:
    """Append one event, preserving repeated attempts and stable schema."""
    addr, module = _ledger_identity(c_rel)
    ledger = ROOT / _ATTEMPTS_REL
    _validate_ledger(ledger)
    if not ledger.exists():
        with ledger.open("w", newline="", encoding="utf-8") as stream:
            csv.writer(stream, delimiter="\t", lineterminator="\n").writerow(_ATTEMPTS_HEADER)
    row = (
        addr, module, text_size, tier, shape, result,
        match_pct, park_class, derive_family({
            "result": result, "park_class": park_class,
        }), brief,
    )
    report = audit_event(dict(zip(_ATTEMPTS_HEADER, row, strict=True)), root=ROOT)
    if report.error_count:
        raise ValueError(
            "attempt row failed validation: "
            f"{report.error_count} hard error(s)"
        )
    with ledger.open("a", newline="", encoding="utf-8") as stream:
        csv.writer(stream, delimiter="\t", lineterminator="\n").writerow(row)
    print(f"recorded {addr} in {_ATTEMPTS_REL}")


def park_one(
    c_rel: str,
    region: str,
    *,
    tier: str = "default",
    shape: str = "unknown",
    match_pct: str = "unknown",
    park_class: str = "unknown",
    brief: str = "unknown",
) -> int:
    """Preflight every external dependency before changing the source tree.

    In particular, the attempts ledger header and appendability are checked
    before the delinks flip, `.s` restore, or `.c` removal.  This prevents a
    malformed/unwritable ledger from producing a parked function with no event
    record; the event log itself remains append-only and preserves repeats.
    """
    if not (ROOT / c_rel).is_file():
        print(f"ERROR: {c_rel} does not exist", file=sys.stderr)
        return 1

    s_rel = _c_to_s_rel(c_rel)

    delinks_path = _is_already_applied(c_rel, region)
    if delinks_path is None:
        print(
            f"ERROR: {c_rel} is not the active delinks.txt entry for "
            f"region {region} (nothing to flip — maybe already parked, "
            f"or never applied)",
            file=sys.stderr,
        )
        return 1

    # Validate the ledger identity before restoring/flipping/removing anything;
    # a malformed path must not leave a half-parked candidate behind.
    try:
        _ledger_identity(c_rel)
    except ValueError as exc:
        print(f"ERROR: {exc}", file=sys.stderr)
        return 1

    try:
        _validate_ledger(ROOT / _ATTEMPTS_REL)
    except (OSError, ValueError) as exc:
        print(f"ERROR: attempts ledger preflight failed: {exc}", file=sys.stderr)
        return 1

    addr, module = _ledger_identity(c_rel)
    text_size = _text_size(delinks_path, c_rel)
    event = {
        "addr": addr,
        "module": module,
        "text_size": text_size,
        "tier": tier,
        "shape": shape,
        "result": "parked",
        "match_pct": match_pct,
        "park_class": park_class,
        "brief": brief,
    }
    report = audit_event(event, root=ROOT)
    if report.error_count:
        print(
            "ERROR: attempts row failed validation before source mutation: "
            f"{report.error_count} hard error(s)",
            file=sys.stderr,
        )
        return 1

    s_path = ROOT / s_rel
    if not s_path.is_file():
        result = subprocess.run(
            ["git", "checkout", "--", s_rel], cwd=ROOT, capture_output=True, text=True,
        )
        if result.returncode != 0:
            print(
                f"ERROR restoring {s_rel} from git HEAD: {result.stderr.strip()}\n"
                f"Nothing was changed — delinks.txt was not touched. If {s_rel} was "
                f"committed away in an earlier commit this session (not just an "
                f"uncommitted draft), restore it explicitly first, e.g.\n"
                f"  git checkout <commit-before-it-was-removed> -- {s_rel}",
                file=sys.stderr,
            )
            return 1
        print(f"restored {s_rel} from git HEAD")
    else:
        print(f"{s_rel} already present on disk, left untouched")

    if not _flip_delinks(delinks_path, c_rel, s_rel):
        print(f"ERROR: could not find header line '{c_rel}:' in {delinks_path}", file=sys.stderr)
        return 1
    print(f"flipped {delinks_path}: {c_rel}: -> {s_rel}:")

    (ROOT / c_rel).unlink()
    print(f"removed {c_rel}")
    _record_attempt(
        c_rel,
        text_size=text_size,
        tier=tier,
        shape=shape,
        match_pct=match_pct,
        park_class=park_class,
        brief=brief,
    )
    return 0


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("c_path", help="Path to the .c file to abandon (relative to repo root, or absolute)")
    parser.add_argument("--region", default="eur", choices=("eur", "usa", "jpn"))
    parser.add_argument("--tier", default="default")
    parser.add_argument("--shape", default="unknown")
    parser.add_argument("--match-pct", default="unknown")
    parser.add_argument("--park-class", default="unknown")
    parser.add_argument("--brief", default="unknown")
    args = parser.parse_args(argv)

    c_path = Path(args.c_path)
    c_rel = str(c_path.relative_to(ROOT) if c_path.is_absolute() else c_path).replace("\\", "/")

    return park_one(
        c_rel,
        args.region,
        tier=args.tier,
        shape=args.shape,
        match_pct=args.match_pct,
        park_class=args.park_class,
        brief=args.brief,
    )


if __name__ == "__main__":
    raise SystemExit(main())
