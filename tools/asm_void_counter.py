#!/usr/bin/env python3
"""Report inline-assembly C bytes changed by a PR.

This is visibility only: it never rejects a change.  It finds added or
modified ``.c`` files under ``src/`` and ``libs/``, classifies their current
source for the project's inline-assembly spellings, and sums their ``.text``
bytes from the selected region's delinks files.

Usage::

    python tools/asm_void_counter.py --base origin/main --head HEAD --region eur
"""
from __future__ import annotations

import argparse
import re
import subprocess
from pathlib import Path

try:
    from tools.progress import _strip_c_comments_and_literals, parse_delinks_file
except ModuleNotFoundError:  # direct ``python tools/asm_void_counter.py`` entry
    from progress import _strip_c_comments_and_literals, parse_delinks_file


ROOT = Path(__file__).resolve().parent.parent
SOURCE_ROOTS = ("src/", "libs/")
_ASM_VOID_RE = re.compile(r"\basm\s+void\b|\basm\s*\{", re.IGNORECASE)


def has_asm_void(source: str) -> bool:
    """Return whether source contains a real ``asm void``/``asm {`` form."""
    return bool(_ASM_VOID_RE.search(_strip_c_comments_and_literals(source)))


def changed_c_files(
    base: str, head: str | None = "HEAD", *, root: Path = ROOT,
) -> list[str]:
    """Return added/modified project C paths in ``base...head``.

    ``head=None`` compares against the working tree, which is convenient for
    a local pre-commit report.  Renames and deletes are intentionally omitted:
    this counter describes C TUs present in the proposed tree.
    """
    diff_range = base if head is None else f"{base}...{head}"
    result = subprocess.run(
        [
            "git", "diff", "--name-status", "--diff-filter=AM", diff_range,
            "--", "src", "libs",
        ],
        cwd=root, capture_output=True, text=True, check=True,
    )
    paths: list[str] = []
    for line in result.stdout.splitlines():
        status, _, path = line.partition("\t")
        if status in {"A", "M"} and path.endswith(".c"):
            if path.startswith(SOURCE_ROOTS):
                paths.append(path)
    return sorted(set(paths))


def _source_text(path: str, head: str | None, *, root: Path) -> str:
    if head is None:
        file_path = root / path
        return file_path.read_text(encoding="utf-8") if file_path.exists() else ""
    result = subprocess.run(
        ["git", "show", f"{head}:{path}"],
        cwd=root, capture_output=True, text=True, check=True,
    )
    return result.stdout


def asm_void_files(
    paths: list[str], head: str | None = "HEAD", *, root: Path = ROOT,
) -> list[str]:
    """Filter changed C paths whose current source contains inline asm."""
    return [p for p in paths if has_asm_void(_source_text(p, head, root=root))]


def text_bytes_for_sources(
    source_paths: set[str], region: str, *, root: Path = ROOT,
) -> int:
    """Sum `.text` bytes for the selected source paths in one region."""
    config_root = root / "config" / region / "arm9"
    total = 0
    for delinks in sorted(config_root.rglob("delinks.txt")):
        _module_sections, tus = parse_delinks_file(delinks)
        for tu in tus:
            if tu.get("source", "").replace("\\", "/") not in source_paths:
                continue
            for name, start, end in tu.get("sections", []):
                if name == ".text":
                    total += max(0, end - start)
    return total


def report(
    base: str, head: str | None, region: str, *, root: Path = ROOT,
) -> dict[str, object]:
    """Build the machine-readable report used by the CLI and tests."""
    changed = changed_c_files(base, head, root=root)
    asm_files = asm_void_files(changed, head, root=root)
    return {
        "base": base,
        "head": head or "WORKTREE",
        "region": region,
        "changed_c_files": len(changed),
        "asm_void_files": len(asm_files),
        "asm_void_text_bytes": text_bytes_for_sources(
            set(asm_files), region, root=root,
        ),
        "files": asm_files,
    }


def format_report(data: dict[str, object]) -> str:
    """Render a compact line suitable for a PR summary."""
    files = data["files"]
    lines = [
        f"asm-void counter ({data['region']}): "
        f"{data['asm_void_text_bytes']} .text bytes in "
        f"{data['asm_void_files']} changed asm-C TU(s) "
        f"({data['changed_c_files']} changed C file(s) scanned)",
    ]
    if files:
        lines.append("  " + ", ".join(files))
    return "\n".join(lines)


def main(argv: list[str]) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--base", default="origin/main")
    parser.add_argument("--head", default="HEAD")
    parser.add_argument("--region", default="eur", choices=("eur", "usa", "jpn"))
    args = parser.parse_args(argv[1:])
    data = report(args.base, args.head, args.region)
    print(format_report(data))
    return 0


if __name__ == "__main__":
    raise SystemExit(main(__import__("sys").argv))
