#!/usr/bin/env python3

"""
generate_tool_index.py — regenerate docs/tools-index.md.

Walks `tools/*.py`, parses each file's module docstring, extracts
the first-line title + first paragraph, and emits a Markdown index
grouped by category. Tool maintainers keep the docstring current
(they already do — every tool has one); this script makes sure the
index follows.

New-session onboarding currently requires the agent to grep
`tools/` and guess at tool purposes from filenames. An auto-
generated index pays back one such grep per session — trivially
above breakeven across the ~30+ tools the project has accumulated.

Usage:

    python tools/generate_tool_index.py
    # → writes docs/tools-index.md (~5KB)

    python tools/generate_tool_index.py --check
    # → exits non-zero if the committed index is out of date
    #   (suitable for CI gate)

Runs against the docstrings committed on disk — no imports, no
subprocess, no --help invocation. If a tool's behaviour changes,
the maintainer updates its docstring and re-runs this script.
"""

from __future__ import annotations

import argparse
import ast
import sys
from dataclasses import dataclass
from pathlib import Path


ROOT = Path(__file__).resolve().parent.parent
TOOLS_DIR = ROOT / "tools"
OUTPUT_PATH = ROOT / "docs" / "tools-index.md"

# Filename-prefix → (category slug, human-readable name).
# Order matters for classification — more-specific prefixes first
# (e.g. `ci_format_diff_reasons` must match CI formatters before
# the generic `diff_reasons` would match analyzers).
CATEGORIES: list[tuple[str, str, str]] = [
    # (prefix, slug, title)
    ("ci_format_", "ci-formatters", "CI formatters"),
    ("patch_", "infrastructure", "Infrastructure / build-patching"),
    ("nitro_", "rename-support", "Rename support"),
    ("find_", "analysis", "Analysis / worklist"),
    ("analyze_", "analysis", "Analysis / worklist"),
    ("data_worklist", "analysis", "Analysis / worklist"),
    ("next_targets", "analysis", "Analysis / worklist"),
    ("progress", "analysis", "Analysis / worklist"),
    ("overlay_coupling", "analysis", "Analysis / worklist"),
    ("data_symbol_sizes", "analysis", "Analysis / worklist"),
    ("diff_reasons", "analysis", "Analysis / worklist"),
    ("bulk_rename_candidates", "rename-support", "Rename support"),
    ("rename_symbol", "rename-support", "Rename support"),
    ("cascade_apply", "rename-support", "Rename support"),
    ("pattern_library", "match-acceleration", "Match acceleration"),
    ("scratch_bundle", "match-acceleration", "Match acceleration"),
    ("permute", "match-acceleration", "Match acceleration"),
    ("propagate_template", "match-acceleration", "Match acceleration"),
    ("check_match_invariants", "invariants", "Hygiene / invariants"),
    ("check_", "invariants", "Hygiene / invariants"),
    ("configure", "infrastructure", "Infrastructure / build-patching"),
    ("download_tool", "infrastructure", "Infrastructure / build-patching"),
    ("install_git_hooks", "infrastructure", "Infrastructure / build-patching"),
    ("generate_heatmap", "infrastructure", "Infrastructure / build-patching"),
    ("generate_briefs_index", "infrastructure", "Infrastructure / build-patching"),
    ("generate_tool_index", "infrastructure", "Infrastructure / build-patching"),
    ("update_progress_badge", "infrastructure", "Infrastructure / build-patching"),
    ("ninja_syntax", "infrastructure", "Infrastructure / build-patching"),
    ("get_platform", "infrastructure", "Infrastructure / build-patching"),
    ("sha1", "infrastructure", "Infrastructure / build-patching"),
    ("transform_dep", "infrastructure", "Infrastructure / build-patching"),
    ("scaffold_batch", "rename-support", "Rename support"),
    ("m2ctx", "match-acceleration", "Match acceleration"),
]

# Category rendering order. Readers scan top-down — put the
# most-frequently-needed first.
CATEGORY_ORDER = [
    "analysis",
    "rename-support",
    "match-acceleration",
    "invariants",
    "ci-formatters",
    "infrastructure",
    "uncategorised",  # fallback bucket
]

CATEGORY_TITLES = {
    "analysis": "Analysis / worklist",
    "rename-support": "Rename support",
    "match-acceleration": "Match acceleration",
    "invariants": "Hygiene / invariants",
    "ci-formatters": "CI formatters",
    "infrastructure": "Infrastructure / build-patching",
    "uncategorised": "Uncategorised",
}

# Short one-line category descriptions for section headers.
CATEGORY_DESC = {
    "analysis": (
        "Read-only tools that analyse the symbol graph + delinks "
        "state. Zero-risk to run; inform the decomper's picking + "
        "scoping decisions."
    ),
    "rename-support": (
        "Tools that rename symbols or help pick names. Write to "
        "`config/<ver>/**/symbols.txt`. Atomic-batch variants exist "
        "(see cascade_apply) for multi-rename waves."
    ),
    "match-acceleration": (
        "Tools that compress the decomp iteration loop: context "
        "assembly, template matching, permuter workspace staging."
    ),
    "invariants": (
        "Pre-flight sanity checks. Run locally before pushing and "
        "in CI on every PR."
    ),
    "ci-formatters": (
        "PR comment renderers. Each consumes a machine-readable "
        "analysis result and emits Markdown for the GitHub comment "
        "bot."
    ),
    "infrastructure": (
        "Build-graph generation, toolchain setup, hook installers, "
        "asset regenerators. Usually one-shot or CI-driven."
    ),
    "uncategorised": (
        "Tools without a category mapping. Add a prefix rule to "
        "`generate_tool_index.CATEGORIES` to classify."
    ),
}


@dataclass(frozen=True)
class Tool:
    name: str              # stem, e.g. "find_cascades"
    path: Path             # tools/find_cascades.py
    title: str             # first line of the docstring
    summary: str           # first paragraph after the title
    category: str          # slug from CATEGORY_ORDER


def _category_for(name: str) -> str:
    # Longest-prefix wins; stable order in CATEGORIES determines tie-
    # break for equal-length matches (not expected in practice).
    best: tuple[str, int] = ("uncategorised", 0)
    for prefix, slug, _title in CATEGORIES:
        # Exact-stem match wins over prefix match.
        if name == prefix:
            return slug
        if name.startswith(prefix) and len(prefix) > best[1]:
            best = (slug, len(prefix))
    return best[0]


def _extract_docstring(path: Path) -> str | None:
    """Parse the file and return its module docstring, or None."""
    try:
        text = path.read_text(encoding="utf-8")
    except OSError:
        return None
    try:
        tree = ast.parse(text)
    except SyntaxError:
        return None
    return ast.get_docstring(tree, clean=True)


def _split_title_summary(docstring: str | None) -> tuple[str, str]:
    """Extract (title, summary) from a module docstring.

    Title = the first non-empty line, stripped of trailing "—" / "–"
    and the module filename prefix (e.g. "find_cascades.py — ...").
    Summary = the first paragraph after the title, joined to a
    single line, trimmed to ~200 chars so the index stays readable.
    """
    if not docstring:
        return ("(no docstring)", "")
    lines = docstring.strip().splitlines()
    # Skip leading blanks (shouldn't happen after `clean=True` but
    # be defensive).
    i = 0
    while i < len(lines) and not lines[i].strip():
        i += 1
    if i == len(lines):
        return ("(no title)", "")
    title = lines[i].strip()
    # Strip "<filename> — " prefix if present.
    for sep in (" — ", " - ", " – "):
        if sep in title:
            title = title.split(sep, 1)[1].strip()
            break

    # Skip the blank separator line(s) between title and body.
    j = i + 1
    while j < len(lines) and not lines[j].strip():
        j += 1
    # Collect the first real paragraph.
    body: list[str] = []
    while j < len(lines) and lines[j].strip():
        body.append(lines[j].strip())
        j += 1
    summary = " ".join(body)
    # Trim overly-long summaries.
    if len(summary) > 240:
        summary = summary[:237].rstrip() + "…"
    return (title, summary)


def scan_tools(tools_dir: Path) -> list[Tool]:
    out: list[Tool] = []
    for path in sorted(tools_dir.glob("*.py")):
        # Skip `__init__.py` / test-only shims if they ever appear.
        if path.name.startswith("_"):
            continue
        name = path.stem
        docstring = _extract_docstring(path)
        title, summary = _split_title_summary(docstring)
        out.append(Tool(
            name=name,
            path=path,
            title=title,
            summary=summary,
            category=_category_for(name),
        ))
    return out


def render(tools: list[Tool]) -> str:
    lines: list[str] = []
    lines.append("# Tools catalogue")
    lines.append("")
    lines.append(
        "_Auto-generated by `tools/generate_tool_index.py` from each "
        "tool's module docstring. Regenerate after adding or "
        "changing a tool — the pre-commit flow is:_"
    )
    lines.append("")
    lines.append("```bash")
    lines.append("python tools/generate_tool_index.py")
    lines.append("git add docs/tools-index.md")
    lines.append("```")
    lines.append("")
    lines.append(
        f"**{len(tools)} tools** across "
        f"{len({t.category for t in tools})} categories. Every tool's "
        "full help is available via `python tools/<name>.py --help`."
    )
    lines.append("")

    by_cat: dict[str, list[Tool]] = {c: [] for c in CATEGORY_ORDER}
    for t in tools:
        by_cat.setdefault(t.category, []).append(t)

    # Table of contents.
    lines.append("## Contents")
    lines.append("")
    for cat in CATEGORY_ORDER:
        bucket = by_cat.get(cat, [])
        if not bucket:
            continue
        title = CATEGORY_TITLES.get(cat, cat)
        lines.append(f"- [{title}](#{cat.replace('-', '-')}) ({len(bucket)})")
    lines.append("")

    # Per-category sections.
    for cat in CATEGORY_ORDER:
        bucket = by_cat.get(cat, [])
        if not bucket:
            continue
        title = CATEGORY_TITLES.get(cat, cat)
        desc = CATEGORY_DESC.get(cat, "")
        lines.append(f"## {title}")
        lines.append("")
        if desc:
            lines.append(f"_{desc}_")
            lines.append("")
        for t in sorted(bucket, key=lambda t: t.name):
            lines.append(f"### `tools/{t.name}.py`")
            lines.append("")
            lines.append(f"**{t.title}**")
            lines.append("")
            if t.summary:
                lines.append(t.summary)
                lines.append("")
    return "\n".join(lines) + "\n"


def main() -> int:
    ap = argparse.ArgumentParser(
        description="Regenerate docs/tools-index.md.",
    )
    ap.add_argument(
        "--check", action="store_true",
        help="Exit non-zero if the committed index is out of date. "
             "For CI use.",
    )
    ap.add_argument(
        "--out", type=Path, default=OUTPUT_PATH,
        help=f"Output path (default {OUTPUT_PATH}).",
    )
    args = ap.parse_args()

    tools = scan_tools(TOOLS_DIR)
    rendered = render(tools)

    if args.check:
        existing = (
            args.out.read_text(encoding="utf-8")
            if args.out.is_file() else ""
        )
        if existing != rendered:
            print(
                f"error: {args.out} is out of date. Re-run "
                f"`python tools/generate_tool_index.py` and commit.",
                file=sys.stderr,
            )
            return 1
        print(f"{args.out} is current.")
        return 0

    args.out.write_text(rendered, encoding="utf-8")
    print(
        f"Wrote {args.out.relative_to(ROOT)} "
        f"({len(rendered)} bytes, {len(tools)} tools).",
        file=sys.stderr,
    )
    return 0


if __name__ == "__main__":
    sys.exit(main())
