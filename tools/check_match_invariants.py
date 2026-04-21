#!/usr/bin/env python3

"""
check_match_invariants.py — pre-flight sanity checks before claiming a match.

The metadata scattered across `symbols.txt`, `delinks.txt`, and the
C sources in `src/` can drift out of sync in ways that silently break
the decomp loop. This tool catches the common footguns:

  (1) Placeholder names left inside a "complete" TU.
      The decomper matched it and blessed the TU with `complete` in
      delinks.txt, but forgot to rename `func_<addr>` to a real name.
      Downstream tooling (find_duplicates, next_targets) still treats
      it as unclassified, and future decompers see a supposedly-done
      function with a dsd-generated name.

  (2) Orphan placeholder externs in src/.
      `extern void func_020b42f4(void);` was valid when written, but
      the underlying symbol got renamed (e.g. to
      __register_global_object) via tools/rename_symbol.py. The extern
      wasn't updated, so it's pointing at a name that no longer
      exists in symbols.txt. Compilation happens to still work
      because the linker resolves by address once the section
      directives route the symbol, but it's a correctness trap — a
      second rename of the extern name won't update this file.

  (3) TU sources listed in delinks.txt but missing from src/ on disk.
      Carving the TU in delinks.txt without creating the .c file
      produces a build that tries to link an empty TU.

Each check emits a list of Issue records. Exit code:
  0 — clean
  1 — warnings only
  2 — errors

Intended use: run before opening a match PR. Also safe to run on a
schedule to catch drift between hand-edited files.

Usage:

    python tools/check_match_invariants.py --version eur
    python tools/check_match_invariants.py --version eur --module ov005
    python tools/check_match_invariants.py --version eur --json
"""

from __future__ import annotations

import argparse
import json
import re
import sys
from dataclasses import asdict, dataclass
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from analyze_symbols import ROOT, ModuleData, load_all  # noqa: E402
from progress import parse_delinks_file  # noqa: E402


PLACEHOLDER_PREFIXES = ("func_", "data_", "_dsd_gap")

# `extern <type-and-modifiers> (func_<hex>|data_<hex>)(...)` — loose
# enough to catch both function and array externs, strict enough to
# skip legit SDK names like `func_ptr`.
_EXTERN_RE = re.compile(
    r"\bextern\b[^;]*?\b"
    r"(?P<name>(?:func|data)_(?:[a-z0-9]+_)?[0-9a-f]{4,})"
    r"\s*[\(\[]"
)


@dataclass
class Issue:
    check: str                  # short check id for grouping
    severity: str               # "error" / "warn"
    module: str | None          # module owning the symbol, if known
    addr: int | None            # addr of the offending symbol, if known
    path: str | None            # file path (repo-relative), if known
    message: str
    suggestion: str


# --------------------------------------------------------------------------- #
# Check 1: placeholder names inside `complete` TUs
# --------------------------------------------------------------------------- #

def _module_name_from_delinks_path(p: Path, config_dir: Path) -> str:
    try:
        rel = p.relative_to(config_dir)
    except ValueError:
        rel = p
    parts = rel.parts[:-1]
    if not parts:
        return "module"
    last = parts[-1]
    if last == "arm9":
        return "main"
    return last


def _collect_complete_ranges(
    config_dir: Path,
) -> dict[str, list[tuple[int, int]]]:
    out: dict[str, list[tuple[int, int]]] = {}
    for delinks in config_dir.rglob("delinks.txt"):
        module = _module_name_from_delinks_path(delinks, config_dir)
        _module_sections, tus = parse_delinks_file(delinks)
        ranges: list[tuple[int, int]] = []
        for tu in tus:
            name = tu.get("source", "")
            if name.startswith("_dsd_gap"):
                continue
            if tu.get("status") != "complete":
                continue
            for _section, start, end in tu.get("sections", []):
                if end > start:
                    ranges.append((start, end))
        if ranges:
            out[module] = ranges
    return out


def check_complete_tu_renames(
    modules: dict[str, ModuleData],
    config_dir: Path,
    *,
    module_filter: str | None = None,
    strict: bool = False,
) -> list[Issue]:
    """Flag any symbol inside a `complete` TU's address range whose
    name still starts with a dsd-placeholder prefix.

    Default severity is `warn` because the decomper sometimes leaves
    placeholders intentionally — brief 003 explicitly instructs "do
    not mis-rename ctor/dtor stubs when the class identity isn't
    derivable". `--strict` promotes these to errors for CI gating.
    """
    severity = "error" if strict else "warn"
    out: list[Issue] = []
    complete = _collect_complete_ranges(config_dir)
    for module_name, ranges in complete.items():
        if module_filter is not None and module_name != module_filter:
            continue
        md = modules.get(module_name)
        if md is None:
            continue
        for s in md.symbols:
            if not s.name.startswith(PLACEHOLDER_PREFIXES):
                continue
            for start, end in ranges:
                if start <= s.addr < end:
                    out.append(Issue(
                        check="complete_tu_rename",
                        severity=severity,
                        module=s.module,
                        addr=s.addr,
                        path=None,
                        message=(
                            f"Symbol `{s.name}` sits inside a "
                            f"`complete` TU in {module_name} but still "
                            f"uses a dsd-placeholder name."
                        ),
                        suggestion=(
                            f"Rename via `python tools/rename_symbol.py "
                            f"{module_name} 0x{s.addr:08x} <ActualName>` "
                            f"if the identity is known; leave as-is if "
                            f"renaming would be a guess (see brief 003)."
                        ),
                    ))
                    break
    return out


# --------------------------------------------------------------------------- #
# Check 2: orphan placeholder externs
# --------------------------------------------------------------------------- #

def _scan_externs_in_file(path: Path) -> list[tuple[int, str]]:
    """Return [(line_number, placeholder_name), ...] for each extern
    of a placeholder-named symbol in `path`."""
    out: list[tuple[int, str]] = []
    try:
        with path.open(encoding="utf-8", errors="replace") as f:
            for lineno, line in enumerate(f, 1):
                m = _EXTERN_RE.search(line)
                if m:
                    out.append((lineno, m["name"]))
    except OSError:
        pass
    return out


def _known_placeholder_names(
    modules: dict[str, ModuleData],
    config_dir: Path,
) -> set[str]:
    """All symbol names currently in any symbols.txt that start with
    a placeholder prefix. An extern to a name NOT in this set is stale.

    Reads `load_all`'s modules AND raw-scans symbols.txt files directly
    so we don't miss `kind:bss` entries (analyze_symbols's regex
    requires `kind:type(attrs)`, bss has no parens, so bss data
    placeholders slip through silently — scanning the raw text
    catches them)."""
    out: set[str] = set()
    for md in modules.values():
        for s in md.symbols:
            if s.name.startswith(PLACEHOLDER_PREFIXES):
                out.add(s.name)
    # Raw scan for names the regex in analyze_symbols skipped.
    name_re = re.compile(r"^((?:func|data)_[A-Za-z0-9_]+)\s")
    for sym_file in config_dir.rglob("symbols.txt"):
        try:
            with sym_file.open(encoding="utf-8", errors="replace") as f:
                for line in f:
                    m = name_re.match(line)
                    if m:
                        out.add(m.group(1))
        except OSError:
            continue
    return out


def check_orphan_externs(
    src_dir: Path,
    modules: dict[str, ModuleData],
    config_dir: Path,
) -> list[Issue]:
    """Walk src/**/*.c and src/**/*.h for placeholder-named externs.
    Anything the current symbols.txt doesn't claim is stale."""
    out: list[Issue] = []
    known = _known_placeholder_names(modules, config_dir)

    for pat in ("**/*.c", "**/*.cpp", "**/*.h", "**/*.hpp"):
        for path in src_dir.rglob(pat):
            for lineno, name in _scan_externs_in_file(path):
                if name in known:
                    continue
                # Found an extern that doesn't resolve to any current
                # placeholder symbol — the target was renamed but
                # this file wasn't updated.
                try:
                    rel = path.relative_to(ROOT)
                except ValueError:
                    rel = path  # src outside ROOT (tests, unusual layouts)
                out.append(Issue(
                    check="orphan_extern",
                    severity="warn",
                    module=None,
                    addr=None,
                    path=f"{rel}:{lineno}",
                    message=(
                        f"`extern ... {name}` but `{name}` is no "
                        f"longer in any symbols.txt (likely renamed)."
                    ),
                    suggestion=(
                        "Update the extern to the new symbol name, or "
                        "switch to a shared header include. If the "
                        "rename is recent, search git log for the new "
                        "name."
                    ),
                ))
    return out


# --------------------------------------------------------------------------- #
# Check 3: TU sources listed in delinks but missing from disk
# --------------------------------------------------------------------------- #

def check_missing_tu_sources(
    config_dir: Path,
    *,
    module_filter: str | None = None,
) -> list[Issue]:
    out: list[Issue] = []
    for delinks in config_dir.rglob("delinks.txt"):
        module_name = _module_name_from_delinks_path(delinks, config_dir)
        if module_filter is not None and module_name != module_filter:
            continue
        _module_sections, tus = parse_delinks_file(delinks)
        for tu in tus:
            src = tu.get("source", "")
            if not src.startswith("src/"):
                continue
            if (ROOT / src).is_file():
                continue
            try:
                delinks_rel = delinks.relative_to(ROOT)
            except ValueError:
                delinks_rel = delinks
            out.append(Issue(
                check="missing_tu_source",
                severity="error",
                module=module_name,
                addr=None,
                path=src,
                message=(
                    f"delinks.txt lists TU `{src}` for {module_name} "
                    f"but the source file is missing on disk."
                ),
                suggestion=(
                    f"Create {src} (minimum: an empty stub), or "
                    f"remove the TU header from {delinks_rel}."
                ),
            ))
    return out


# --------------------------------------------------------------------------- #
# Runner + output
# --------------------------------------------------------------------------- #

CHECK_ORDER = ["complete_tu_rename", "missing_tu_source", "orphan_extern"]


def run_all_checks(
    version: str,
    *,
    module_filter: str | None = None,
    strict: bool = False,
) -> list[Issue]:
    config_dir = ROOT / "config" / version
    src_dir = ROOT / "src"
    modules = load_all(config_dir)
    issues: list[Issue] = []
    issues.extend(check_complete_tu_renames(
        modules, config_dir, module_filter=module_filter, strict=strict,
    ))
    issues.extend(check_missing_tu_sources(
        config_dir, module_filter=module_filter,
    ))
    # Orphan-extern check reads src/ globally; can't sensibly filter
    # by module since externs cross module boundaries by design.
    issues.extend(check_orphan_externs(src_dir, modules, config_dir))
    return issues


def exit_code_for(issues: list[Issue]) -> int:
    if any(i.severity == "error" for i in issues):
        return 2
    if issues:
        return 1
    return 0


def print_report(issues: list[Issue]) -> None:
    if not issues:
        print("Clean — no invariant violations detected.")
        return

    by_check: dict[str, list[Issue]] = {c: [] for c in CHECK_ORDER}
    for i in issues:
        by_check.setdefault(i.check, []).append(i)

    total_err = sum(1 for i in issues if i.severity == "error")
    total_warn = sum(1 for i in issues if i.severity == "warn")
    print(
        f"Found {len(issues)} issue(s): "
        f"{total_err} error(s), {total_warn} warning(s).\n"
    )

    for check in CHECK_ORDER:
        bucket = by_check.get(check, [])
        if not bucket:
            continue
        print(f"== {check} ({len(bucket)}) ==")
        for i in bucket:
            where = []
            if i.module:
                where.append(i.module)
            if i.addr is not None:
                where.append(f"0x{i.addr:08x}")
            if i.path:
                where.append(i.path)
            where_s = "  ".join(where) if where else "-"
            print(f"  [{i.severity}] {where_s}")
            print(f"    {i.message}")
            print(f"    fix: {i.suggestion}")
        print()


def to_json(issues: list[Issue]) -> dict:
    return {
        "count": len(issues),
        "errors": sum(1 for i in issues if i.severity == "error"),
        "warnings": sum(1 for i in issues if i.severity == "warn"),
        "issues": [asdict(i) for i in issues],
    }


# --------------------------------------------------------------------------- #
# CLI
# --------------------------------------------------------------------------- #

def main() -> int:
    ap = argparse.ArgumentParser(
        description="Pre-flight sanity checks for decomp metadata.",
    )
    ap.add_argument("--version", default="eur")
    ap.add_argument("--module",
                    help="Restrict module-scoped checks to one module")
    ap.add_argument("--strict", action="store_true",
                    help="Promote complete_tu_rename warnings to errors "
                         "(use for CI gating; default is warn so "
                         "intentional-placeholder cases don't fail)")
    ap.add_argument("--json", action="store_true",
                    help="Emit machine-readable JSON instead of a text report")
    args = ap.parse_args()

    config_dir = ROOT / "config" / args.version
    if not config_dir.is_dir():
        print(
            f"error: {config_dir} not found. Run "
            f"`python tools/configure.py {args.version}` first.",
            file=sys.stderr,
        )
        return 2

    issues = run_all_checks(
        args.version, module_filter=args.module, strict=args.strict,
    )

    if args.json:
        json.dump(to_json(issues), sys.stdout, indent=2)
        sys.stdout.write("\n")
    else:
        print_report(issues)

    return exit_code_for(issues)


if __name__ == "__main__":
    sys.exit(main())
