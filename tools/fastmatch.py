#!/usr/bin/env python3
"""
fastmatch.py — per-TU match check without a full ROM rebuild.

Compiles one (or more) .c source files with the correct mwcc tier, then
word-compares the resulting object against the delinked gap object for the
requested region. No ninja, no link, no sha1.

Designed as the **inner-loop gate** during match attempts: run fastmatch on
every iteration; only run `ninja sha1` to confirm an accepted 100% match.
The sha1 gate is unchanged — fastmatch speeds up the FAIL case, not the
PASS case.

The word-comparison logic is identical to `tools/verify.py` (including
.L_-sublabel spanning and reloc wildcarding) but adds:

  - percentage output (matched_words / total_words × 100)
  - multi-region support (eur / usa / jpn)
  - JSON output for scripted waves
  - multi-file batch mode
  - automatic compiler-tier detection (.legacy.c → 1.2/sp2p3, etc.)

Usage:
    python tools/fastmatch.py eur src/main/func_0204bf44.c
    python tools/fastmatch.py eur src/overlay002/func_ov002_022627ac.c
    python tools/fastmatch.py usa src/usa/main/func_0204bf44.c
    python tools/fastmatch.py eur src/main/f1.c src/main/f2.c
    python tools/fastmatch.py eur src/main/func_0204bf44.c --func func_0204bf44
    python tools/fastmatch.py eur src/main/func_0204bf44.c --json

    # --cc overrides auto-detected tier; --gap supplies the target .o directly
    python tools/fastmatch.py eur src/main/func_abc.c --cc legacy
    python tools/fastmatch.py eur src/main/func_abc.c --gap build/eur/delinks/_dsd_gap@main_XY.o

Prerequisites (same as the normal build):
  - arm-none-eabi-objdump on PATH (GNU binutils for arm)
  - tools/mwccarm/ downloaded (run ninja once, or tools/download_tool.py)
  - Windows: mwcc runs natively. Linux: wibo at ./wibo. macOS: wine on PATH.
  - build/<region>/delinks/ populated by `ninja delink` (or `ninja` → delink step)

Exit codes:
    0  All queried functions matched 100%
    1  At least one function has a non-100% match
    2  Compile error or gap object not found

Validation procedure (run once in a baserom worktree):
    # 3 known-matched funcs:
    python tools/fastmatch.py eur src/main/func_02001c98.c  # expect 100%
    # 3 known-unmatched (in-progress):
    python tools/fastmatch.py eur src/main/func_0204bf44.c  # expect <100%
    # Time fastmatch vs full sha1:
    time python tools/fastmatch.py eur src/main/func_0204bf44.c
    time ninja sha1
"""
from __future__ import annotations

import argparse
import glob
import json
import os
import platform
import re
import subprocess
import sys
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent

# ---------------------------------------------------------------------------
# Compiler config — keep in sync with configure.py constants.
# ---------------------------------------------------------------------------

_CC_FLAGS_BASE = " ".join([
    "-O4,p",
    "-enum int",
    "-char signed",
    "-str noreuse",
    "-proc arm946e",
    "-gccext,on",
    "-fp soft",
    "-inline noauto",
    "-Cpp_exceptions off",
    "-RTTI off",
    "-interworking",
    "-w off",
    "-sym on",
    "-gccinc",
    "-nolink",
    "-msgstyle gcc",
])

_COMPILERS: dict[str, Path] = {
    "2.0":    ROOT / "tools/mwccarm/2.0/sp1p5/mwccarm.exe",
    "legacy": ROOT / "tools/mwccarm/1.2/sp2p3/mwccarm.exe",
    "sp3":    ROOT / "tools/mwccarm/1.2/sp3/mwccarm.exe",
}

_KNOWN_REGIONS = ("eur", "usa", "jpn")


def _get_includes() -> list[str]:
    """Return a flat list of -i <dir> pairs for all include dirs."""
    parts: list[str] = ["-i", str(ROOT / "include")]
    libs = ROOT / "libs"
    if libs.is_dir():
        for root, dirs, _ in os.walk(libs):
            for d in sorted(dirs):
                if d == "include":
                    parts += ["-i", str(Path(root) / d)]
    return parts


def _get_wine() -> list[str]:
    """Return the Win32 runner prefix for the current platform."""
    system = platform.system()
    if system == "Windows":
        return []
    if system == "Darwin":
        from shutil import which
        for candidate in ("wine", "wine64"):
            if which(candidate):
                return [candidate]
        return ["wine"]
    # Linux — use wibo if present, fall back to wine
    wibo = ROOT / "wibo"
    if wibo.is_file():
        return [str(wibo)]
    from shutil import which
    if which("wine"):
        return ["wine"]
    return [str(wibo)]  # let the error surface clearly


def _tier_for(c_path: Path) -> str:
    """Detect the compiler tier from the filename suffix."""
    name = str(c_path)
    if name.endswith(".legacy_sp3.c"):
        return "sp3"
    if name.endswith(".legacy.c") or name.endswith(".thumb.c"):
        return "legacy"
    return "2.0"


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
    return c_path.parent.name  # last-resort fallback


# ---------------------------------------------------------------------------
# Compilation
# ---------------------------------------------------------------------------


def compile_c(
    c_path: Path,
    region: str,
    out_o: Path,
    tier: str | None = None,
) -> bool:
    """Compile c_path with mwcc. Returns True on success."""
    t = tier or _tier_for(c_path)
    cc = _COMPILERS[t]
    if not cc.is_file():
        print(
            f"ERROR: compiler not found: {cc}\n"
            "  Run `ninja` once (or `python tools/download_tool.py mwccarm latest "
            "--path tools/`) to download mwccarm.",
            file=sys.stderr,
        )
        return False

    cmd: list[str] = (
        _get_wine()
        + [str(cc)]
        + _CC_FLAGS_BASE.split()
        + _get_includes()
        + ["-lang=c", f"-d{region}", "-c", str(c_path), "-o", str(out_o)]
    )
    env = {**os.environ, "WINEDEBUG": "-all", "MVK_CONFIG_LOG_LEVEL": "0"}
    result = subprocess.run(cmd, capture_output=True, text=True, cwd=ROOT, env=env)
    if not out_o.is_file():
        print(f"  COMPILE FAILED ({c_path.name}, tier={t})", file=sys.stderr)
        if result.stderr.strip():
            for line in result.stderr.strip().splitlines()[:10]:
                print(f"    {line}", file=sys.stderr)
        return False
    return True


# ---------------------------------------------------------------------------
# Gap object discovery
# ---------------------------------------------------------------------------


def find_gap(func: str, module: str, region: str) -> Path | None:
    """Locate the delinked gap .o containing `func`.

    Searches build/{region}/delinks/**/_dsd_gap@{module}_*.o recursively,
    checking each candidate's symbol table for the function name.
    """
    pattern = str(ROOT / f"build/{region}/delinks" / "**" / f"_dsd_gap@{module}_*.o")
    candidates = sorted(glob.glob(pattern, recursive=True))

    # Fallback: search all gap objects if module filter returns nothing
    if not candidates:
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
# Word comparison (identical algorithm to verify.py)
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
    """Extract (word_hex, is_reloc) pairs for `func`, spanning .L_ sublabels."""
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
    """Drop trailing const-pool words (reloc'd or zero) from both ends."""
    out = list(words)
    while out and (out[-1][1] or out[-1][0] == "00000000"):
        out.pop()
    return out


def match_percent(
    mine: list[tuple[str, bool]],
    orig: list[tuple[str, bool]],
) -> tuple[float, list[tuple[int, str, str]]]:
    """Return (match_pct, diffs). Reloc'd words are wildcards on either side."""
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
# High-level entry point per file
# ---------------------------------------------------------------------------


def match_one(
    c_path: Path,
    region: str,
    *,
    func: str | None = None,
    tier: str | None = None,
    gap_override: Path | None = None,
    tmp_dir: str,
) -> dict:
    """Compile c_path and compare against the gap object. Returns a result dict."""
    result: dict = {
        "file": str(c_path),
        "region": region,
        "tier": tier or _tier_for(c_path),
        "functions": [],
        "status": "ok",
    }

    out_o = Path(tmp_dir) / f"{c_path.stem}.o"
    if not compile_c(c_path, region, out_o, tier=tier):
        result["status"] = "compile_error"
        return result

    funcs_in_obj = list_funcs_in_obj(out_o)
    if not funcs_in_obj:
        result["status"] = "no_functions"
        return result

    targets = [func] if func else funcs_in_obj
    module = _module_for(c_path)
    my_dump = _objdump_text(out_o)

    for fn in targets:
        mine = _parse_words(my_dump, fn)

        if gap_override:
            gap = gap_override
        else:
            gap = find_gap(fn, module, region)

        if gap is None:
            result["functions"].append({
                "name": fn,
                "status": "not_in_gap",
                "match_percent": None,
                "note": "already matched or gap object missing",
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
            "diffs_sample": [(i, a, b) for i, a, b in diffs[:8]],
        })

    return result


# ---------------------------------------------------------------------------
# CLI
# ---------------------------------------------------------------------------


def main(argv: list[str] | None = None) -> int:
    ap = argparse.ArgumentParser(
        description=(
            "Per-TU fast match check — compile + word-diff vs delinked gap "
            "object, no ROM rebuild."
        ),
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog=(
            "Exit codes: 0=all 100%, 1=non-100% match, 2=compile/gap error"
        ),
    )
    ap.add_argument(
        "region",
        choices=["eur", "usa", "jpn"],
        help="Region whose delinked gap objects to compare against",
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
        "--cc",
        choices=["2.0", "legacy", "sp3"],
        default=None,
        help="Override compiler tier (default: auto-detect from filename suffix)",
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
        help="Show first 8 differing words even for non-100% matches",
    )
    args = ap.parse_args(argv)

    all_results: list[dict] = []
    exit_code = 0

    with tempfile.TemporaryDirectory(prefix="fastmatch_") as tmp_dir:
        for cfile_str in args.cfiles:
            c_path = Path(cfile_str)
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
                tier=args.cc,
                gap_override=args.gap,
                tmp_dir=tmp_dir,
            )
            all_results.append(r)

            if r["status"] == "compile_error":
                exit_code = max(exit_code, 2)
            elif r["status"] == "no_functions":
                exit_code = max(exit_code, 2)
            elif r["status"] == "file_not_found":
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

            if r["status"] == "compile_error":
                print(f"{tag} {label}: COMPILE ERROR")
                continue
            if r["status"] == "no_functions":
                print(f"{tag} {label}: WARNING — no functions in compiled .o")
                continue
            if r["status"] == "file_not_found":
                print(f"{tag} {label}: FILE NOT FOUND")
                continue

            tier_used = r.get("tier", "?")
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
                        f"{pct:.1f}%  DIFF  ({ndiff} diff{'s' if ndiff != 1 else ''}, "
                        f"{size_note}, gap={gap_rel})"
                    )
                    if args.verbose:
                        for i, a, b in fn_r.get("diffs_sample", []):
                            print(f"    word[{i:3d}]  mine={a}  orig={b}")

    return exit_code


if __name__ == "__main__":
    sys.exit(main())
