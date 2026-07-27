#!/usr/bin/env python3

"""
Regenerate docs/research/README.md from the research notes anywhere
under docs/research/, at any depth (e.g. docs/research/data/*.md).

A "research note" is any markdown file under `docs/research/` (any
subdirectory) whose first non-blank line is an H1 heading, EXCEPT a
file literally named `README.md` or `INDEX.md` -- both are meta/
navigational (this index itself, an `archive/README.md`, and 9
separately-maintained per-subdirectory catalogs like
`docs/research/data/INDEX.md`), never notes. The body's first
non-blank prose paragraph (skipping italic-only lines like
`_Generated 2026-MM-DD by scaffolder..._`) is the summary, capped at
~200 chars in the index table. Each note's index link is its path
relative to `docs/research/` (not the bare filename) -- several
same-basename pairs already exist across subdirectories (a superseded
note's stub at its original path vs. its `archive/`-moved copy), and a
bare filename would link both to the same, wrong target.

This is the third member of the auto-generated docs trio:

  - `docs/tools-index.md`      ← `tools/generate_tool_index.py`
  - `docs/briefs/README.md`    ← `tools/generate_briefs_index.py`
  - `docs/research/README.md`  ← this script (NEW)

Same shape as `tools/generate_briefs_index.py`. CI gate at
`.github/workflows/generated-files-drift.yml` runs `--check`
on every PR that touches `docs/research/**.md` or this script.

Run after adding or editing a research note; commit the
regenerated README alongside.

    python tools/generate_research_index.py
    # → writes docs/research/README.md

    python tools/generate_research_index.py --check
    # → exits non-zero if the committed index is out of date
    #   (suitable for CI gate)
"""

import argparse
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
RESEARCH_DIR = ROOT / "docs" / "research"
INDEX_PATH = RESEARCH_DIR / "README.md"

H1_RE = re.compile(r"^#\s+(.+?)\s*$")
SUMMARY_MAX_CHARS = 200

# Matches a Markdown inline link `[text](target)` so it can be flattened
# to just `text` in a summary. A note's own body text often links
# relative to ITS OWN file (e.g. `[endgame-ledger.md](../campaign-
# analytics/endgame-ledger.md)` inside docs/research/archive/path-to-
# 100-coverage.md) -- correct there, but WRONG once that summary is
# copied verbatim into docs/research/README.md, which lives at a
# different depth. Confirmed real via tests/test_docs_links.py once
# notes anywhere below the top level started being indexed at all.
MD_LINK_RE = re.compile(r"\[([^\]]*)\]\([^)]*\)")


def _delinkify(text: str) -> str:
    """Flatten every Markdown link in `text` to its display text alone,
    dropping the href. The index's own File column already links to
    the note correctly; a summary copied from the note's body has no
    business carrying a second, potentially mis-based link."""
    return MD_LINK_RE.sub(r"\1", text)


def _truncate_balanced(s: str, max_chars: int) -> str:
    """Truncate `s` to at most `max_chars` characters with `...`,
    walking back if needed so the result has balanced backtick code
    spans. Markdownlint's MD038 flags an unclosed backtick because
    it treats the rest of the line as an open code span; balanced
    truncation avoids the false alarm. Also drops any trailing `[`,
    `(`, or `_` so we don't leave a half-open markdown construct.
    """
    if len(s) <= max_chars:
        return s
    cut = max_chars - 3
    candidate = s[:cut].rstrip()
    while candidate and candidate.count("`") % 2 == 1:
        # Find the previous backtick and cut there. Drop the trailing
        # backtick too — that leaves a clean closing-backtick boundary.
        last = candidate.rfind("`")
        if last < 0:
            break
        candidate = candidate[:last].rstrip()
    while candidate and candidate[-1] in "[(_":
        candidate = candidate[:-1].rstrip()
    return candidate + "..."


def _is_italic_block_start(stripped: str) -> bool:
    """A paragraph that starts with `_` and isn't a Markdown emphasis
    word (`_word_`). The opening `_` is followed by a non-`_` char
    so we don't confuse it with mid-text italics."""
    return (
        stripped.startswith("_")
        and not stripped.startswith("__")
        and len(stripped) > 1
        and stripped[1] != "_"
    )


def _is_italic_block_end(stripped: str) -> bool:
    """A line that ends an italic block. Tolerates trailing
    punctuation (`._`, `?_`, `!_`, etc.) but requires the underscore
    to be at the very end of the visible text."""
    if stripped.endswith("_"):
        return True
    return False


def parse_research_note(path: Path) -> dict | None:
    """Extract heading + first prose paragraph from a research note.

    Skips an italic byline block (`_Generated 2026-MM-DD by scaffolder
    after ..._` — possibly multi-line) immediately after the heading
    if present. The first non-italic, non-blank prose paragraph
    becomes the summary. Returns None for files without an H1
    heading (so README.md and similar non-research files get
    skipped automatically).

    ``relpath`` is `path` relative to `RESEARCH_DIR` (POSIX-style,
    e.g. `data/cm-data-inference-3-2026-07-25.md`) — this is what the
    index must link to. Using the bare filename here would silently
    produce a broken link for any note outside the top level, and
    would collide for the several same-basename pairs that already
    exist across subdirectories (e.g. a superseded-note stub at its
    original path vs. its `archive/`-moved copy).
    """
    try:
        text = path.read_text(encoding="utf-8")
    except OSError:
        return None

    heading = ""
    summary_lines: list[str] = []
    in_italic_block = False
                       # keep accumulating until we have substance

    def _enough_summary() -> bool:
        # 50 chars of meaningful content; "**Run provenance**:" or
        # "**Status**:" alone trip below this and chain into the
        # next paragraph.
        return len(" ".join(summary_lines).strip()) >= 50

    for raw in text.splitlines():
        line = raw.rstrip()
        if not heading:
            hm = H1_RE.match(line)
            if hm:
                heading = _delinkify(hm.group(1).strip())
            continue
        # After heading, walk forward looking for prose paragraphs.
        stripped = line.strip()
        if not stripped:
            if summary_lines and _enough_summary():
                # We have a substantive lead — stop.
                break
            # Otherwise tolerate the blank and keep scanning. Reset
            # italic-block state too.
            in_italic_block = False
            continue
        # `## Foo` H2 means we're past the lead — definitely stop.
        if stripped.startswith("##"):
            break
        if in_italic_block:
            if _is_italic_block_end(stripped):
                in_italic_block = False
            continue
        if _is_italic_block_start(stripped):
            if _is_italic_block_end(stripped):
                continue  # single-line italic
            in_italic_block = True
            continue
        # Real prose. Strip leading bullet markers so bullet-list
        # entries flatten into the summary cleanly.
        if stripped.startswith("- "):
            stripped = stripped[2:].strip()
        elif stripped.startswith("* "):
            stripped = stripped[2:].strip()
        summary_lines.append(stripped)

    if not heading:
        return None

    summary = _delinkify(" ".join(summary_lines).strip())
    try:
        relpath = path.relative_to(RESEARCH_DIR).as_posix()
    except ValueError:
        # Not under RESEARCH_DIR (e.g. a test fixture in an isolated
        # temp dir) -- fall back to the bare filename rather than
        # raising, so this function stays usable standalone.
        relpath = path.name
    return {
        "relpath": relpath,
        "heading": heading,
        "summary": summary,
    }


def render_index(notes: list[dict]) -> str:
    lines = [
        "# Research notes",
        "",
        "Long-form analysis writeups — codegen-wall surveys, tier",
        "scouting passes, infrastructure-decision research. Each",
        "note lives in its own file; this index is auto-generated by",
        "[`tools/generate_research_index.py`](../../tools/generate_research_index.py).",
        "",
        "> Run `python tools/generate_research_index.py` after adding",
        "> or editing a research note, and commit the regenerated",
        "> `README.md` alongside.",
        "",
        "## Notes",
        "",
        "| File | Title | Summary |",
        "|------|-------|---------|",
    ]
    for n in notes:
        # Markdown table cells: collapse pipes and newlines, trim length.
        summary = n["summary"].replace("|", "\\|").replace("\n", " ")
        summary = _truncate_balanced(summary, SUMMARY_MAX_CHARS)
        link = f"[`{n['relpath']}`]({n['relpath']})"
        # Heading already-escaped pipes carry through; collapse here too.
        heading = n["heading"].replace("|", "\\|")
        lines.append(f"| {link} | {heading} | {summary} |")

    lines += [
        "",
        "## Adding a new research note",
        "",
        "1. Drop a new `<slug>.md` into `docs/research/`.",
        "2. First non-blank line: `# <slug>` (H1). Optional",
        "   italic byline can follow; first prose paragraph after",
        "   that becomes the summary in this index.",
        "3. Use the `**Asked:**` / `**Short answer:**` / `## Method` /",
        "   `## Recommendation` shape from",
        "   [`codegen-walls.md`](codegen-walls.md) or",
        "   [`sp3-routing-decision.md`](sp3-routing-decision.md) when",
        "   it fits. (Not required — older notes use other shapes.)",
        "4. `python tools/generate_research_index.py` to refresh this",
        "   file.",
        "5. Commit both the new note and the updated `README.md`.",
        "",
    ]
    return "\n".join(lines)


def collect_notes() -> list[dict]:
    """Scan RESEARCH_DIR (recursively) for research notes, sorted by
    `relpath` (a plain string sort). The single source of truth for
    "what counts as a note" -- both `main()` and the committed-index
    regression test call this, so the two can never drift the way
    they once did (the test used to reimplement this scan with its
    own copy of the old non-recursive glob, so it never had a chance
    to catch the recursion bug this function fixed).

    Sorting is done on the PARSED notes' `relpath` strings, not on the
    raw `Path` objects straight out of `rglob()` -- `Path.__lt__`'s
    comparison semantics differ by platform (`WindowsPath` sorts
    case-INsensitively, confirmed directly: `sorted([Path("Zebra.md"),
    Path("apple.md")])` orders "apple" first; `PosixPath` -- what every
    CI runner uses -- sorts case-SENSITIVELY, uppercase before
    lowercase). With 3000+ notes across many mixed-case directory
    names, that divergence is no longer a hypothetical: a Windows-
    generated index and a Linux-generated one land in genuinely
    different orders, which `--check` (byte-for-byte) correctly
    flags as drift. A plain `str` sort has no such platform variance.
    """
    notes: list[dict] = []
    for path in RESEARCH_DIR.rglob("*.md"):
        # README.md (this index itself, plus a per-directory copy under
        # archive/) and INDEX.md (9 separately-maintained per-subdirectory
        # navigational catalogs, e.g. docs/research/data/INDEX.md, each
        # explicitly headed "Do NOT regenerate -- the brain handles the
        # index at merge") are meta/navigational, never research notes,
        # regardless of which directory they live in.
        if path.name in ("README.md", "INDEX.md"):
            continue
        parsed = parse_research_note(path)
        if parsed is None:
            print(f"warning: skipping {path.name} (no H1 heading)",
                  file=sys.stderr)
            continue
        notes.append(parsed)
    notes.sort(key=lambda n: n["relpath"])
    return notes


def main() -> int:
    ap = argparse.ArgumentParser(
        description="Regenerate docs/research/README.md.",
    )
    ap.add_argument(
        "--check", action="store_true",
        help="Exit non-zero if the committed index is out of date. "
             "For CI use.",
    )
    args = ap.parse_args()

    notes = collect_notes()

    if not notes:
        print("no research notes found in docs/research/", file=sys.stderr)
        return 1

    rendered = render_index(notes)

    if args.check:
        existing = (
            INDEX_PATH.read_text(encoding="utf-8")
            if INDEX_PATH.is_file() else ""
        )
        if existing != rendered:
            print(
                f"error: {INDEX_PATH.relative_to(ROOT)} is out of "
                "date. Re-run `python tools/generate_research_index.py` "
                "and commit.",
                file=sys.stderr,
            )
            return 1
        print(f"{INDEX_PATH.relative_to(ROOT)} is current.")
        return 0

    if INDEX_PATH.exists() and INDEX_PATH.read_text(encoding="utf-8") == rendered:
        print(f"{INDEX_PATH.relative_to(ROOT)} already up to date.")
        return 0

    INDEX_PATH.write_text(rendered, encoding="utf-8")
    print(f"wrote {INDEX_PATH.relative_to(ROOT)} ({len(notes)} notes)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
