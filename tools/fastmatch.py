#!/usr/bin/env python3
"""
fastmatch.py — per-TU match check without a full ROM rebuild.

Compiles a single .c source file by running `ninja <that_unit.o>` — exactly
one compilation target, no ROM build, no link, no sha1 — then word-compares
the resulting .o against its delinked gap object, reporting function match %.

This delegates compilation to ninja's existing build.ninja, so it uses the
EXACT same flags/includes/defines as the real build. There is no flag
reconstruction; drift is structurally impossible.

Designed as the **inner-loop gate** during match attempts: run fastmatch on
every iteration; only run `ninja sha1` to confirm an accepted 100% match.
The sha1 gate is unchanged — fastmatch speeds up the FAIL case, not the
PASS case.

The word-comparison logic mirrors `tools/verify.py` (including .L_-sublabel
spanning and reloc wildcarding) and adds:

  - percentage output (matched_words / total_words × 100)
  - multi-region support (eur / usa / jpn)
  - JSON output for scripted waves
  - multi-file batch mode
  - gap auto-discovery via objdiff.json (preferred) or glob fallback

Prerequisites:
  - build.ninja configured for the target region:
        python tools/configure.py eur   # (or usa / jpn)
  - build/<region>/delinks/ populated (from `ninja delink` or full `ninja`)
  - arm-none-eabi-objdump on PATH

Usage:
    python tools/fastmatch.py eur src/main/func_02000e34.c
    python tools/fastmatch.py eur src/overlay002/func_ov002_022627ac.c
    python tools/fastmatch.py usa src/usa/main/func_0204bf44.c
    python tools/fastmatch.py eur src/main/f1.c src/main/f2.c
    python tools/fastmatch.py eur src/main/func_02000e34.c --func func_02000e34
    python tools/fastmatch.py eur src/main/func_02000e34.c --json

    # --gap supplies the delinked target .o path directly (skips discovery)
    python tools/fastmatch.py eur src/main/func_abc.c --gap build/eur/delinks/…

Exit codes:
    0  All queried functions matched 100%
    1  At least one function has a non-100% match
    2  Compile / build-graph error, or gap object not found

Validation procedure (run in a baserom worktree with build/ populated):
    # 5 known-matched funcs (listed in delinks.txt as `complete`):
    python tools/fastmatch.py eur src/main/<matched_1>.c  # expect 100%
    # 5 in-progress funcs with a stub .c:
    python tools/fastmatch.py eur src/main/func_0204bf44.c  # expect <100%
    # Timing comparison:
    time python tools/fastmatch.py eur src/main/func_02000e34.c
    time ninja sha1
"""
from __future__ import annotations

import argparse
import glob
import json
import re
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent

_KNOWN_REGIONS = ("eur", "usa", "jpn")


# ---------------------------------------------------------------------------
# Tier detection (display only — actual compilation is handled by ninja)
# ---------------------------------------------------------------------------

def _tier_for(c_path: Path) -> str:
    """Infer which compiler tier ninja will use, based on the filename suffix."""
    name = str(c_path)
    if name.endswith(".legacy_sp3.c"):
        return "sp3"
    if name.endswith(".legacy.c") or name.endswith(".thumb.c"):
        return "legacy"
    return "2.0"


# ---------------------------------------------------------------------------
# Module detection (for gap-object discovery)
# ---------------------------------------------------------------------------

def _module_for(c_path: Path) -> str:
    """Derive the dsd module name from the source path.

    src/main/...            → 'main'
    src/overlay002/...      → 'overlay002'
    src/usa/main/...        → 'main'   (region prefix stripped)
    src/jpn/overlay002/...  → 'overlay002'
    """
    parts = c_path.parts
    for i, p in enumerate(parts):
        if p == "src" and i + 1 < len(parts):
            sub = parts[i + 1]
            if sub in _KNOWN_REGIONS and i + 2 < len(parts):
                return parts[i + 2]
            return sub
    return c_path.parent.name


# ---------------------------------------------------------------------------
# Ninja-based compilation
# ---------------------------------------------------------------------------

def ninja_target_path(c_path: Path, region: str) -> Path:
    """Return the ninja output .o path for this source file + region.

    Mirrors configure.py's add_mwcc_builds():
        src_obj_path = project.game_build / source_file
        outputs = str(src_obj_path.with_suffix(".o"))

    Examples:
        src/main/func_02000e34.c      → build/eur/src/main/func_02000e34.o
        src/main/func_X.legacy.c      → build/eur/src/main/func_X.legacy.o
        src/usa/main/func_X.c         → build/usa/src/usa/main/func_X.o
    """
    src_rel = c_path.relative_to(ROOT) if c_path.is_absolute() else c_path
    return ROOT / "build" / region / src_rel.with_suffix(".o")


def ninja_compile_one(out_o: Path) -> tuple[bool, str]:
    """Run `ninja <out_o>` to compile exactly one translation unit.

    Returns (ok, error_message). On success ok=True and error_message is empty.
    Ninja reads the existing build.ninja; the caller must ensure
    `python tools/configure.py <region>` has been run at least once.
    """
    target = str(out_o.relative_to(ROOT))
    result = subprocess.run(
        ["ninja", target],
        capture_output=True, text=True, cwd=ROOT,
    )
    if result.returncode == 0:
        return True, ""

    stderr = result.stderr.strip()
    stdout = result.stdout.strip()
    combined = "\n".join(filter(None, [stderr, stdout]))

    # Detect "no rule to make target" — means file isn't in build.ninja yet
    lowered = combined.lower()
    if (
        "no rule to make target" in lowered
        or "unknown build file" in lowered
        or "build.ninja" not in (ROOT / "build.ninja").name  # no build.ninja at all
        or not (ROOT / "build.ninja").is_file()
    ):
        return False, (
            f"Target '{target}' not in build.ninja.\n"
            f"  Run `python tools/configure.py {out_o.parts[1] if len(out_o.parts) > 1 else '?'}` first.\n"
            f"  (configure.py must be re-run whenever a new .c file is added to src/)"
        )

    # Generic compile failure — show ninja's error
    lines = combined.splitlines()
    return False, "\n".join(lines[:15]) if lines else "ninja returned non-zero"


# ---------------------------------------------------------------------------
# Gap object discovery
# ---------------------------------------------------------------------------

def find_gap_from_objdiff(out_o: Path) -> Path | None:
    """Look up the delinked target .o for this compiled .o via objdiff.json.

    objdiff.json is generated by `dsd objdiff` (via `ninja objdiff`) and maps
    each source unit's base_path (compiled .o) to its target_path (gap .o).
    This is the most reliable lookup when the file exists; fall back to glob
    when it doesn't.

    Handles the .resolved.o sidecars written by objdiff_resolve_relocs.py by
    stripping them back to the underlying .o path.
    """
    objdiff_json = ROOT / "objdiff.json"
    if not objdiff_json.is_file():
        return None
    try:
        data = json.loads(objdiff_json.read_text(encoding="utf-8"))
    except Exception:
        return None

    # Normalise separators so the comparison is platform-independent.
    out_rel = str(out_o.relative_to(ROOT)).replace("\\", "/")

    for unit in data.get("units", []):
        base_rel = unit.get("base_path", "").replace("\\", "/")
        # Strip .resolved sidecar suffix if present
        if base_rel.endswith(".resolved.o"):
            base_rel = base_rel[: -len(".resolved.o")] + ".o"
        if base_rel != out_rel:
            continue
        target_rel = unit.get("target_path", "")
        if not target_rel:
            continue
        if target_rel.endswith(".resolved.o"):
            target_rel = target_rel[: -len(".resolved.o")] + ".o"
        target_path = ROOT / target_rel.replace("/", "\\") if "\\" in target_rel else ROOT / target_rel
        if target_path.is_file():
            return target_path
    return None


def find_gap_by_glob(func: str, module: str, region: str) -> Path | None:
    """Fallback: glob build/<region>/delinks/**/_dsd_gap@<module>_*.o and
    confirm the candidate contains `func` in its symbol table.
    """
    pattern = str(ROOT / f"build/{region}/delinks" / "**" / f"_dsd_gap@{module}_*.o")
    candidates = sorted(glob.glob(pattern, recursive=True))
    if not candidates:
        # Widen search — try all gap objects for this region
        pattern_any = str(ROOT / f"build/{region}/delinks" / "**" / "_dsd_gap@*.o")
        candidates = sorted(glob.glob(pattern_any, recursive=True))

    for obj in candidates:
        out = subprocess.run(
            ["arm-none-eabi-objdump", "-t", obj],
            capture_output=True, text=True, cwd=ROOT,
        ).stdout
        if re.search(
            rf"\bF\b.+\.text\s+[0-9a-f]+\s+{re.escape(func)}$", out, re.M
        ):
            return Path(obj)
    return None


# ---------------------------------------------------------------------------
# Word comparison (same algorithm as tools/verify.py)
# ---------------------------------------------------------------------------

_HDR   = re.compile(r"^[0-9a-f]+ <(\S+)>:")
_INSN  = re.compile(r"^\s+([0-9a-f]+):\s+([0-9a-f]{8})\s")
_RELOC = re.compile(r"^\s+([0-9a-f]+):\s+R_ARM")


def _objdump_text(obj: Path) -> str:
    return subprocess.run(
        ["arm-none-eabi-objdump", "-d", "-r", "--architecture=armv5te", str(obj)],
        capture_output=True, text=True, cwd=ROOT,
    ).stdout


def _parse_words(text: str, func: str) -> list[tuple[str, bool]]:
    """Extract (word_hex, is_reloc) pairs for `func`, spanning .L_ sublabels.

    dsd delink splits each function at internal labels (.L_xxxxxxxx for
    default-blocks, switch tails, const pools). Spanning these continuations
    ensures whole-function matches read as 100% instead of a false near-miss.
    """
    words: list[list] = []
    relocs: set[int] = set()
    capturing = False
    for line in text.splitlines():
        m = _HDR.match(line)
        if m:
            name = m.group(1)
            if name == func:
                capturing = True
                words, relocs = [], set()
                continue
            if capturing and name.startswith(".L"):
                continue    # internal sublabel — keep spanning
            if capturing:
                break       # next real function
            continue
        if not capturing:
            continue
        mi = _INSN.match(line)
        if mi:
            words.append([int(mi.group(1), 16), mi.group(2)])
            continue
        mr = _RELOC.match(line)
        if mr:
            relocs.add(int(mr.group(1), 16))
    return [(w, off in relocs) for off, w in words]


def _strip_pool(words: list[tuple[str, bool]]) -> list[tuple[str, bool]]:
    """Drop trailing const-pool words (reloc'd or zero) before comparing."""
    out = list(words)
    while out and (out[-1][1] or out[-1][0] == "00000000"):
        out.pop()
    return out


def match_percent(
    mine: list[tuple[str, bool]],
    orig: list[tuple[str, bool]],
) -> tuple[float, list[tuple[int, str, str]]]:
    """Return (match_pct, diffs). Reloc'd words on either side are wildcards."""
    m2, o2 = _strip_pool(mine), _strip_pool(orig)
    total = max(len(m2), len(o2))
    if total == 0:
        return 100.0, []
    diffs: list[tuple[int, str, str]] = []
    for i in range(total):
        mw = m2[i] if i < len(m2) else None
        ow = o2[i] if i < len(o2) else None
        if mw and ow and (mw[1] or ow[1]):
            continue    # reloc'd — wildcard
        a = mw[0] if mw else "MISSING"
        b = ow[0] if ow else "MISSING"
        if a != b:
            diffs.append((i, a, b))
    matched = total - len(diffs)
    return matched / total * 100.0, diffs


# ---------------------------------------------------------------------------
# Symbol inspection
# ---------------------------------------------------------------------------

def list_funcs_in_obj(obj: Path) -> list[str]:
    """Return the list of function names in obj's .text section."""
    out = subprocess.run(
        ["arm-none-eabi-objdump", "-t", str(obj)],
        capture_output=True, text=True, cwd=ROOT,
    ).stdout
    result: list[str] = []
    for line in out.splitlines():
        m = re.search(r"\bF\b.+\.text\s+[0-9a-f]+\s+(\S+)$", line)
        if m:
            result.append(m.group(1))
    return result


# ---------------------------------------------------------------------------
# High-level per-file entry point
# ---------------------------------------------------------------------------

def match_one(
    c_path: Path,
    region: str,
    *,
    func: str | None = None,
    gap_override: Path | None = None,
) -> dict:
    """Compile c_path via ninja and compare against its gap object."""
    result: dict = {
        "file": str(c_path),
        "region": region,
        "tier": _tier_for(c_path),
        "functions": [],
        "status": "ok",
    }

    # --- Step 1: compile via ninja (exact same flags as the real build) ---
    out_o = ninja_target_path(c_path, region)
    ok, err = ninja_compile_one(out_o)
    if not ok:
        result["status"] = "compile_error"
        result["error"] = err
        return result

    # --- Step 2: list functions in the compiled .o ---
    funcs_in_obj = list_funcs_in_obj(out_o)
    if not funcs_in_obj:
        result["status"] = "no_functions"
        return result

    targets = [func] if func else funcs_in_obj
    module = _module_for(c_path)
    my_dump = _objdump_text(out_o)

    # --- Step 3: for each function, find its gap .o and compare ---
    for fn in targets:
        mine = _parse_words(my_dump, fn)

        if gap_override:
            gap = gap_override
        else:
            # Prefer objdiff.json lookup (accurate when dsd objdiff has run)
            gap = find_gap_from_objdiff(out_o)
            if gap is None:
                gap = find_gap_by_glob(fn, module, region)

        if gap is None:
            result["functions"].append({
                "name": fn,
                "status": "not_in_gap",
                "match_percent": None,
                "note": "already matched or gap object not found",
            })
            continue

        orig_dump = _objdump_text(gap)
        orig = _parse_words(orig_dump, fn)
        pct, diffs = match_percent(mine, orig)
        m2, o2 = _strip_pool(mine), _strip_pool(orig)

        result["functions"].append({
            "name": fn,
            "status": "ok",
            "match_percent": round(pct, 2),
            "mine_words": len(m2),
            "orig_words": len(o2),
            "diff_count": len(diffs),
            "gap_obj": str(gap.relative_to(ROOT)),
            "compiled_obj": str(out_o.relative_to(ROOT)),
            "diffs_sample": [(i, a, b) for i, a, b in diffs[:8]],
        })

    return result


# ---------------------------------------------------------------------------
# CLI
# ---------------------------------------------------------------------------

def main(argv: list[str] | None = None) -> int:
    ap = argparse.ArgumentParser(
        description=(
            "Per-TU fast match check — `ninja <unit.o>` + word-diff vs "
            "delinked gap object, no ROM rebuild."
        ),
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="Exit codes: 0=all 100%, 1=non-100% match, 2=compile/gap error",
    )
    ap.add_argument(
        "region",
        choices=["eur", "usa", "jpn"],
        help="Region (must match the region configure.py was last run with)",
    )
    ap.add_argument(
        "cfiles",
        nargs="+",
        metavar="cfile",
        help="Source .c path(s) to compile and check",
    )
    ap.add_argument(
        "--func",
        help="Check only this function name (default: all functions in the .o)",
    )
    ap.add_argument(
        "--gap",
        type=Path,
        default=None,
        help="Explicit gap object path (skips auto-discovery)",
    )
    ap.add_argument(
        "--json",
        action="store_true",
        help="Print machine-readable JSON instead of plain text",
    )
    ap.add_argument(
        "--verbose",
        action="store_true",
        help="Show first 8 differing words for non-100% matches",
    )
    args = ap.parse_args(argv)

    # Sanity check: build.ninja must exist
    if not (ROOT / "build.ninja").is_file():
        print(
            f"ERROR: build.ninja not found in {ROOT}\n"
            f"  Run `python tools/configure.py {args.region}` first.",
            file=sys.stderr,
        )
        return 2

    all_results: list[dict] = []
    exit_code = 0

    for cfile_str in args.cfiles:
        c_path = Path(cfile_str)
        if not c_path.is_absolute():
            c_path = ROOT / c_path
        if not c_path.is_file():
            print(f"ERROR: not found: {cfile_str}", file=sys.stderr)
            exit_code = max(exit_code, 2)
            all_results.append({
                "file": cfile_str,
                "status": "file_not_found",
                "functions": [],
            })
            continue

        r = match_one(
            c_path,
            args.region,
            func=args.func,
            gap_override=args.gap,
        )
        all_results.append(r)

        if r["status"] in ("compile_error", "no_functions", "file_not_found"):
            exit_code = max(exit_code, 2)
        else:
            for fn_r in r["functions"]:
                if fn_r["status"] == "ok":
                    pct = fn_r["match_percent"]
                    if pct is not None and pct < 100.0:
                        exit_code = max(exit_code, 1)

    if args.json:
        print(json.dumps(all_results, indent=2))
        return exit_code

    # Human-readable output
    for r in all_results:
        label = Path(r["file"]).name
        tag = f"[{r['region']}]"

        if r["status"] == "file_not_found":
            print(f"{tag} {label}: FILE NOT FOUND")
            continue
        if r["status"] == "compile_error":
            err = r.get("error", "")
            print(f"{tag} {label}: COMPILE ERROR")
            if err:
                for line in err.splitlines():
                    print(f"  {line}")
            continue
        if r["status"] == "no_functions":
            print(f"{tag} {label}: WARNING — no functions in compiled .o")
            continue

        tier_used = r.get("tier", "?")
        compiled = r.get("functions", [{}])[0].get("compiled_obj", "")
        for fn_r in r["functions"]:
            fn = fn_r["name"]
            if fn_r["status"] == "not_in_gap":
                note = fn_r.get("note", "already matched?")
                print(f"{tag} {fn} ({label}, cc={tier_used}): NOT-IN-GAP — {note}")
                continue
            pct = fn_r["match_percent"]
            mine_w = fn_r["mine_words"]
            orig_w = fn_r["orig_words"]
            ndiff = fn_r["diff_count"]
            gap_rel = fn_r.get("gap_obj", "?")
            if pct == 100.0:
                print(
                    f"{tag} {fn} ({label}, cc={tier_used}): "
                    f"100.0%  OK  ({mine_w} words, gap={gap_rel})"
                )
            else:
                size_note = (
                    f"{mine_w}w mine vs {orig_w}w orig"
                    if mine_w != orig_w
                    else f"{mine_w} words"
                )
                print(
                    f"{tag} {fn} ({label}, cc={tier_used}): "
                    f"{pct:.1f}%  DIFF  "
                    f"({ndiff} diff{'s' if ndiff != 1 else ''}, {size_note}, "
                    f"gap={gap_rel})"
                )
                if args.verbose:
                    for i, a, b in fn_r.get("diffs_sample", []):
                        print(f"    word[{i:3d}]  mine={a}  orig={b}")

    return exit_code


if __name__ == "__main__":
    sys.exit(main())
