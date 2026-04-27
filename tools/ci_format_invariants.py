#!/usr/bin/env python3

"""
ci_format_invariants.py — render a match-invariants report as Markdown for a PR comment.

Consumes the JSON emitted by `check_match_invariants.py --json` and
prints a Markdown block suitable for piping into `gh pr comment`.

Shape of the JSON (see check_match_invariants.to_json):

    {
      "count":    int,
      "errors":   int,
      "warnings": int,
      "issues": [
        {
          "check":      str,   # "cross_file_name_drift" / "missing_tu_source" /
                               # "orphan_extern" / "complete_tu_rename"
          "severity":   str,   # "error" / "warn"
          "module":     str|null,
          "addr":       int|null,
          "path":       str|null,
          "message":    str,
          "suggestion": str
        },
        ...
      ]
    }

Usage:
    python tools/ci_format_invariants.py /tmp/invariants.json > /tmp/comment.md
    gh pr comment $PR_NUMBER --body-file /tmp/comment.md
"""

from __future__ import annotations

import io
import json
import sys
from collections import defaultdict
from pathlib import Path


CHECK_ORDER = [
    "cross_file_name_drift",  # error — highest severity, always first
    "missing_tu_source",      # error
    "orphan_extern",          # warn
    "complete_tu_rename",     # warn
]

CHECK_DESC = {
    "cross_file_name_drift": (
        "`src/` references a symbol not in any `symbols.txt` and not "
        "declared in `libs/**/*.h` — typically a rebase drift where a "
        "rename landed on a parallel branch that got rebased away "
        "(see PR #171). Blocks merge: either restore the rename in "
        "`symbols.txt` or roll back the `src/` reference."
    ),
    "missing_tu_source": (
        "TU source listed in `delinks.txt` but missing on disk. "
        "The build will fail to link until the `.c` file exists."
    ),
    "orphan_extern": (
        "`extern` declaration in `src/` points at a placeholder name "
        "that's no longer in any `symbols.txt` (usually because the "
        "target was renamed via `rename_symbol.py` and this file "
        "was missed)."
    ),
    "complete_tu_rename": (
        "Placeholder-named symbol (e.g. `func_0x021aa4a0`) lives "
        "inside a TU marked `complete` in `delinks.txt`. Either "
        "rename via `tools/rename_symbol.py` once the identity is "
        "known, or leave as-is if renaming would be a guess "
        "(see brief 003)."
    ),
}


def _fmt_issue(issue: dict) -> str:
    """Render one issue as a single Markdown bullet."""
    sev = issue.get("severity", "warn")
    sev_emoji = "🛑" if sev == "error" else "⚠️"
    where_bits: list[str] = []
    if issue.get("module"):
        where_bits.append(f"`{issue['module']}`")
    if issue.get("addr") is not None:
        where_bits.append(f"`0x{issue['addr']:08x}`")
    if issue.get("path"):
        where_bits.append(f"`{issue['path']}`")
    where = " ".join(where_bits) if where_bits else "_(no location)_"
    msg = issue.get("message", "")
    fix = issue.get("suggestion", "")
    return f"- {sev_emoji} {where}\n  {msg}\n  <sub>**fix:** {fix}</sub>"


def render(report: dict, *, limit_per_check: int = 15) -> str:
    out: list[str] = []
    errors = report.get("errors", 0)
    warnings = report.get("warnings", 0)

    out.append("## 🧹 Match-invariant check")
    out.append("")
    out.append(
        "Pre-flight hygiene checks run by "
        "`tools/check_match_invariants.py` — bot-generated; "
        "regenerated on every push to the PR branch."
    )
    out.append("")

    if errors == 0 and warnings == 0:
        out.append(
            "✅ **Clean.** No placeholder-in-`complete`-TU symbols, "
            "no orphan externs in `src/`, no missing TU sources."
        )
        out.append("")
    else:
        status_emoji = "🛑" if errors > 0 else "⚠️"
        out.append(
            f"{status_emoji} **Found {errors + warnings} issue(s): "
            f"{errors} error(s), {warnings} warning(s).**"
        )
        if errors > 0:
            out.append("")
            out.append(
                "> Errors block merge (build would fail). Fix each and "
                "push again to re-run the check."
            )
        elif warnings > 0:
            out.append("")
            out.append(
                "> Warnings are informational — usually intentional "
                "placeholder decisions (see brief 003). Review and "
                "confirm each is still the right call."
            )
        out.append("")

        issues_by_check: dict[str, list[dict]] = defaultdict(list)
        for issue in report.get("issues", []):
            issues_by_check[issue.get("check", "other")].append(issue)

        for check in CHECK_ORDER:
            bucket = issues_by_check.get(check, [])
            if not bucket:
                continue
            err = sum(1 for i in bucket if i.get("severity") == "error")
            warn = sum(1 for i in bucket if i.get("severity") == "warn")
            label_bits = []
            if err:
                label_bits.append(f"{err} error(s)")
            if warn:
                label_bits.append(f"{warn} warning(s)")
            counts = ", ".join(label_bits)
            out.append(f"### `{check}` ({counts})")
            out.append("")
            desc = CHECK_DESC.get(check)
            if desc:
                out.append(f"_{desc}_")
                out.append("")
            for issue in bucket[:limit_per_check]:
                out.append(_fmt_issue(issue))
            if len(bucket) > limit_per_check:
                out.append(
                    f"- _…and {len(bucket) - limit_per_check} more "
                    f"(see `tools/check_match_invariants.py --version eur` "
                    f"for the full list)_"
                )
            out.append("")

    out.append(
        "<sub>🤖 Posted by `.github/workflows/match-invariants.yml` · "
        "rerun by pushing a new commit to this PR.</sub>"
    )

    return "\n".join(out)


def main() -> int:
    # Force UTF-8 on stdout so the emoji header (🧹 ✅) survives on
    # Windows cp1252 consoles when the tool is run locally. The
    # `-o <path>` writer already pins utf-8; this covers the plain
    # stdout invocation that crashes otherwise. No-op in
    # environments where stdout is already utf-8 (Linux/macOS,
    # GitHub Actions runners) or where reconfigure isn't available
    # (piped, non-TextIO stdout).
    try:
        sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    except (AttributeError, io.UnsupportedOperation):
        pass

    if len(sys.argv) < 2:
        print("usage: ci_format_invariants.py <invariants.json> "
              "[-o <out.md>]", file=sys.stderr)
        return 2

    in_path = Path(sys.argv[1])
    out_path: Path | None = None
    if "-o" in sys.argv:
        i = sys.argv.index("-o")
        if i + 1 < len(sys.argv):
            out_path = Path(sys.argv[i + 1])

    if not in_path.is_file():
        # Defensive: if the invariants script couldn't even write JSON
        # (config/ not present?), emit a short comment.
        md = (
            "## 🧹 Match-invariant check\n\n"
            "_No report produced (likely config/ missing — run "
            "`python tools/configure.py eur` first)._\n\n"
            "<sub>🤖 Posted by `.github/workflows/match-invariants.yml`</sub>"
        )
    else:
        with in_path.open() as f:
            report = json.load(f)
        md = render(report)

    if out_path is not None:
        out_path.write_text(md)
    else:
        print(md)
    return 0


if __name__ == "__main__":
    sys.exit(main())
