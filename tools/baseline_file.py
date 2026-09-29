"""
baseline_file.py — the shared reader/writer for the tolerated-findings baselines.

`tools/fake_match_baseline.txt` and `tools/reference_baseline.txt` list the
findings CI tolerates because they were on `main` when the checks arrived.
Format 2 (round 005) makes each line identify ONE finding, not a per-unit
count, so fixing one finding and adding another in the same unit no longer
nets to zero:

    # format: 2
    <field><TAB><field>...        one finding per line, sorted

A baseline may only shrink. Three things enforce that:

  * the checks fail on a finding that is not listed (NEW);
  * the checks fail on a listed entry that is gone (STALE), and `--prune-baseline`
    deletes exactly those, adding nothing;
  * `tools/check_baseline_growth.py` fails CI when the file gains an entry
    against the pull request's merge base, so `--write-baseline` (kept for the
    first fill of a baseline) cannot launder a new finding.

Plain Python 3.9+, stdlib only.
"""
from __future__ import annotations

from pathlib import Path

FORMAT_LINE = "# format: 2"


class BaselineError(ValueError):
    pass


def parse(text: str, *, source: str = "baseline") -> tuple[int, list[tuple[str, ...]]]:
    """Return (format, entries). A file without the format line is format 1."""
    fmt = 1
    entries: list[tuple[str, ...]] = []
    for raw in text.splitlines():
        line = raw.rstrip("\r\n")
        if line.strip() == FORMAT_LINE:
            fmt = 2
        elif line.strip() and not line.startswith("#"):
            entries.append(tuple(line.split("\t")))
    if fmt == 1 and entries and not all(e[-1].isdigit() for e in entries):
        raise BaselineError(f"{source}: unrecognised baseline format")
    return fmt, entries


def load(path: Path) -> set[tuple[str, ...]]:
    """Read a format-2 baseline; a missing file is an empty baseline."""
    if not path.is_file():
        return set()
    fmt, entries = parse(path.read_text(encoding="utf-8"), source=str(path))
    if fmt != 2 and entries:
        raise BaselineError(f"{path} is a format-1 baseline; regenerate it with --write-baseline")
    return set(entries)


def write(path: Path, header: list[str], entries: set[tuple[str, ...]]) -> None:
    lines = [*header, FORMAT_LINE, *("\t".join(e) for e in sorted(entries))]
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text("\n".join(lines) + "\n", encoding="utf-8", newline="\n")
