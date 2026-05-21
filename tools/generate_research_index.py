#!/usr/bin/env python3

"""
Regenerate docs/research/README.md from the research notes in the
same directory.

A "research note" is any markdown file in `docs/research/` whose
first non-blank line is an H1 heading. The body's first non-blank
prose paragraph (skipping italic-only lines like
`_Generated 2026-MM-DD by scaffolder..._`) is the summary, capped at
~200 chars in the index table.

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
                heading = hm.group(1).strip()
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

    summary = " ".join(summary_lines).strip()
    return {
        "filename": path.name,
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
        link = f"[`{n['filename']}`]({n['filename']})"
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

    notes: list[dict] = []
    for path in sorted(RESEARCH_DIR.glob("*.md")):
        if path.name == "README.md":
            continue
        parsed = parse_research_note(path)
        if parsed is None:
            print(f"warning: skipping {path.name} (no H1 heading)",
                  file=sys.stderr)
            continue
        notes.append(parsed)

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
