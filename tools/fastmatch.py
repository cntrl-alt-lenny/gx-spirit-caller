#!/usr/bin/env python3
"""
fastmatch.py — per-TU match check without a full ROM rebuild.

Compiles a single .c source file by running `ninja <that_unit.o>` — exactly
one compilation target, no ROM build, no link, no sha1 — then runs the
RESOLVED comparison against its delinked gap object and reports the function
match %.

RESOLVED vs RAW comparison
--------------------------

Raw objdiff (and the old verify.py) wildcard every relocatable word: pool
entries carry R_ARM_ABS32 on the gap side and R_ARM_PC24 carries BL targets
on both sides. Those wildcards hide two critical failure modes documented in
docs/research/objdiff-sha1-gap/gap-taxonomy.md:

  Mode A — wrong pool value   : objdiff says 100%, sha1 fails
  Mode B — wrong callee       : objdiff says 100%, sha1 fails

This tool runs `tools/objdiff_resolve_relocs.py`'s `resolve_elf_relocs()`
on BOTH the candidate `.o` and the gap `.o` before comparing. Resolution
applies every R_ARM_ABS32 / R_ARM_PC24 reloc to a fictional virtual base
(same address-from-symbol-name scheme as the real resolver), strips the
reloc tables, writes `.resolved.o` sidecars in a temp dir, then runs the
word comparison on those sidecars. After this:

  - Pool words carry the actual resolved address on both sides.
    Wrong global → different bytes → DIFF (Mode A caught).
  - BL displacements are computed from the callee symbol's resolved
    address. Wrong callee → different displacement → DIFF (Mode B caught).

The comparison is otherwise identical to the old path (`.L_`-sublabel
spanning, const-pool tail stripping, percentage output).

Use `--unresolved` to fall back to the raw wildcarded comparison (faster,
but blind to Modes A and B).

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
    python tools/fastmatch.py eur src/main/func_abc.c --gap build/eur/delinks/…
    python tools/fastmatch.py eur src/main/func_abc.c --unresolved

Exit codes:
    0  All queried functions matched 100%
    1  At least one function has a non-100% match
    2  Compile / build-graph error, or gap object not found

Validation procedure (baserom worktree with build/ populated):
    # 5 known-matched funcs — expect 100% (resolved):
    python tools/fastmatch.py eur src/main/<matched>.c
    # 5 Mode-A/B false-positive candidates — expect <100% (resolved),
    #   but 100% with --unresolved (proving the gap was closed):
    python tools/fastmatch.py eur src/main/<false_pos>.c
    python tools/fastmatch.py eur src/main/<false_pos>.c --unresolved
    # Timing:
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
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent

_KNOWN_REGIONS = ("eur", "usa", "jpn")

# ---------------------------------------------------------------------------
# Import resolver from sibling tool (soft dependency — falls back gracefully)
# ---------------------------------------------------------------------------

# When run as `python tools/fastmatch.py`, Python adds tools/ to sys.path.
# Guard the import so fastmatch still works (in unresolved mode) if the
# sibling module is missing.
try:
    from objdiff_resolve_relocs import (  # type: ignore[import-not-found]
        resolve_elf_relocs as _rr_resolve_elf,
    )
    _HAS_RESOLVER = True
except ImportError:
    _HAS_RESOLVER = False


# ---------------------------------------------------------------------------
# objdump wrapper — clean error if binary is missing
# ---------------------------------------------------------------------------

_OBJDUMP = "arm-none-eabi-objdump"


def _run_objdump(extra_args: list[str], obj: Path) -> str:
    """Run arm-none-eabi-objdump and return stdout.

    Exits with code 2 and a clean message if the binary is not on PATH, so
    the user sees an actionable hint instead of a raw FileNotFoundError
    traceback.
    """
    cmd = [_OBJDUMP] + extra_args + [str(obj)]
    try:
        return subprocess.run(cmd, capture_output=True, text=True, cwd=ROOT).stdout
    except FileNotFoundError:
        print(
            f"ERROR: '{_OBJDUMP}' not found on PATH.\n"
            "  Run `ninja` once to download toolchain binaries, or:\n"
            "  python tools/download_tool.py",
            file=sys.stderr,
        )
        sys.exit(2)


def _resolve_obj_bytes(path: Path) -> bytes | None:
    """Read an ELF .o, apply R_ARM_ABS32/PC24 relocs to fictional bases,
    return modified bytes with reloc tables stripped.

    Returns None on failure (caller falls back to raw/unresolved path).
    Errors go to stderr; never raises.
    """
    if not _HAS_RESOLVER:
        print(
            "  WARNING: objdiff_resolve_relocs not importable; "
            "falling back to --unresolved comparison",
            file=sys.stderr,
        )
        return None
    try:
        return _rr_resolve_elf(path.read_bytes())
    except Exception as exc:
        print(
            f"  WARNING: reloc resolve failed for {path.name}: {exc}; "
            "falling back to --unresolved comparison for this file",
            file=sys.stderr,
        )
        return None


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


_NOISE_LINE_RE = re.compile(
    r"^\s*(?:"
    r"\[mvk-info\]|"                                    # MoltenVK banners
    r"VK_[A-Za-z0-9_]+\s+v\d|"                            # Vulkan extension names
    r"The following \d+ Vulkan extensions|"
    r"(?:model|type|vendorID|deviceID|pipelineCacheUUID|"
    r"GPU memory (?:available|used))\s*:|"
    r"Metal Shading Language\b|"                          # no trailing ':' -- "... 3.2"
    r"supports the following GPU Features:|"
    r"GPU Family |Read-Write Texture Tier|"
    r"[0-9a-f]{4}:fixme:"                                 # wine fixme warnings
    r")"
)


def summarize_compile_error(combined: str, n: int | None = None) -> str:
    """A human-meaningful tail of a failed compile's combined stdout+
    stderr -- pulled out of ninja_compile_one so this is independently
    testable without a real subprocess.

    brief 620: the original behavior (`lines[:n]`, first n lines)
    reliably returned nothing but wine/MoltenVK GPU-capability startup
    noise on macOS -- confirmed directly, every one of 70 real ov008
    compile failures in one scale-validation sweep. Switching to
    `lines[-n:]` (last n) was a first fix but still insufficient on its
    own: wine/MoltenVK prints not one but TWO banners per invocation --
    a ~150-line "supported extensions" capability dump at startup, AND
    a second, shorter "Created VkInstance ... N extensions enabled"
    banner right before the app's own output -- so a fixed-size tail
    can still land entirely inside noise for some candidates while
    working for others, observed directly across the same 70-candidate
    sweep. This filters out every KNOWN noise line by pattern
    (`_NOISE_LINE_RE`: mvk-info banners, VK_* extension names, GPU
    capability fields, wine `fixme:` warnings) first, then takes the
    tail of whatever real content remains -- robust to however many
    banners wine happens to print, rather than to a specific count of
    lines. Falls back to the raw tail if filtering removes everything
    (should not happen for a genuine compile error, but must never
    surface a blank message when unfiltered output existed).
    """
    lines = combined.splitlines()
    if not lines:
        return "ninja returned non-zero"
    signal = [ln for ln in lines if not _NOISE_LINE_RE.match(ln)]
    if not signal:
        return "\n".join(lines[-n:]) if n is not None else "\n".join(lines)
    return "\n".join(signal[-n:]) if n is not None else "\n".join(signal)


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

    lowered = combined.lower()
    if (
        "no rule to make target" in lowered
        or "unknown build file" in lowered
        or not (ROOT / "build.ninja").is_file()
    ):
        region_guess = out_o.parts[1] if len(out_o.parts) > 1 else "?"
        return False, (
            f"Target '{target}' not in build.ninja.\n"
            f"  Run `python tools/configure.py {region_guess}` first.\n"
            f"  (configure.py must be re-run whenever a new .c file is added to src/)"
        )

    return False, summarize_compile_error(combined)


# ---------------------------------------------------------------------------
# Gap object discovery
# ---------------------------------------------------------------------------

def find_gap_from_objdiff(out_o: Path) -> Path | None:
    """Look up the delinked target .o for this compiled .o via objdiff.json.

    Handles .resolved.o sidecars written by objdiff_resolve_relocs.py by
    stripping them back to the underlying .o path before comparing.
    """
    objdiff_json = ROOT / "objdiff.json"
    if not objdiff_json.is_file():
        return None
    try:
        data = json.loads(objdiff_json.read_text(encoding="utf-8"))
    except Exception:
        return None

    out_rel = str(out_o.relative_to(ROOT)).replace("\\", "/")

    for unit in data.get("units", []):
        base_rel = unit.get("base_path", "").replace("\\", "/")
        if base_rel.endswith(".resolved.o"):
            base_rel = base_rel[: -len(".resolved.o")] + ".o"
        if base_rel != out_rel:
            continue
        target_rel = unit.get("target_path", "")
        if not target_rel:
            continue
        if target_rel.endswith(".resolved.o"):
            target_rel = target_rel[: -len(".resolved.o")] + ".o"
        target_path = (
            ROOT / target_rel.replace("/", "\\")
            if "\\" in target_rel
            else ROOT / target_rel
        )
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
        pattern_any = str(ROOT / f"build/{region}/delinks" / "**" / "_dsd_gap@*.o")
        candidates = sorted(glob.glob(pattern_any, recursive=True))

    for obj in candidates:
        out = _run_objdump(["-t"], Path(obj))
        if re.search(
            rf"\bF\b.+\.text\s+[0-9a-f]+\s+{re.escape(func)}$", out, re.M
        ):
            return Path(obj)
    return None


# ---------------------------------------------------------------------------
# Word comparison
# ---------------------------------------------------------------------------

_HDR   = re.compile(r"^[0-9a-f]+ <(\S+)>:")
_INSN  = re.compile(r"^\s+([0-9a-f]+):\s+([0-9a-f]{8})\s")
_RELOC = re.compile(r"^\s+([0-9a-f]+):\s+R_ARM")


def _objdump_text(obj: Path) -> str:
    return _run_objdump(["-d", "-r", "--architecture=armv5te"], obj)


def _parse_words(text: str, func: str) -> list[tuple[str, bool]]:
    """Extract (word_hex, is_reloc) pairs for `func`, spanning .L_ sublabels.

    dsd delink splits each function at internal labels (.L_xxxxxxxx for
    default-blocks, switch tails, const pools). Spanning these continuations
    ensures whole-function matches read as 100% instead of a false near-miss.

    After resolve_elf_relocs(), is_reloc is False for every word (reloc
    sections are stripped), so match_percent() never wildcards — the
    resolved values are compared exactly.
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
    """Drop trailing const-pool words (reloc'd or zero) before comparing.

    In unresolved mode: pool words on the gap side are zero + reloc'd →
    stripped; this prevents spurious length-mismatch diffs.

    In resolved mode: pool words have been patched to actual addresses
    (non-zero, non-reloc'd) → NOT stripped, so they participate in the
    comparison and catch Mode-A mismatches.
    """
    out = list(words)
    while out and (out[-1][1] or out[-1][0] == "00000000"):
        out.pop()
    return out


def match_percent(
    mine: list[tuple[str, bool]],
    orig: list[tuple[str, bool]],
) -> tuple[float, list[tuple[int, str, str]]]:
    """Return (match_pct, diffs). Reloc'd words on either side are wildcards.

    In resolved mode, is_reloc is always False, so the wildcard branch
    never triggers — every word (including pool entries and BL targets)
    is compared exactly. This is the key to catching Modes A and B.
    """
    m2, o2 = _strip_pool(mine), _strip_pool(orig)
    total = max(len(m2), len(o2))
    if total == 0:
        return 100.0, []
    diffs: list[tuple[int, str, str]] = []
    for i in range(total):
        mw = m2[i] if i < len(m2) else None
        ow = o2[i] if i < len(o2) else None
        if mw and ow and (mw[1] or ow[1]):
            continue    # reloc'd — wildcard (only active in --unresolved mode)
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
    out = _run_objdump(["-t"], obj)
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
    unresolved: bool = False,
) -> dict:
    """Compile c_path via ninja and compare against its gap object.

    By default (unresolved=False), applies reloc resolution to both the
    compiled .o and the gap .o before comparing — this catches Mode-A
    (wrong pool value) and Mode-B (wrong callee) failures that raw
    objdiff misses. Pass unresolved=True for the old wildcarded path.
    """
    result: dict = {
        "file": str(c_path),
        "region": region,
        "tier": _tier_for(c_path),
        "functions": [],
        "status": "ok",
        "resolved": False,  # updated below once resolution is attempted
    }

    # --- Step 1: compile via ninja ---
    out_o = ninja_target_path(c_path, region)
    ok, err = ninja_compile_one(out_o)
    if not ok:
        result["status"] = "compile_error"
        result["error"] = err
        return result

    # --- Step 2: list functions ---
    funcs_in_obj = list_funcs_in_obj(out_o)
    if not funcs_in_obj:
        result["status"] = "no_functions"
        return result

    targets = [func] if func else funcs_in_obj
    module = _module_for(c_path)

    # --- Step 3: resolve, then compare ---
    # Use a temp dir so resolved sidecars don't pollute build/.
    with tempfile.TemporaryDirectory(prefix="fastmatch_") as _tmpdir:
        tmp = Path(_tmpdir)

        # Resolve compiled .o (once; shared across all functions in the TU).
        resolved_out_o = out_o
        use_resolved = not unresolved
        if use_resolved:
            mine_bytes = _resolve_obj_bytes(out_o)
            if mine_bytes is not None:
                resolved_out_o = tmp / "mine.resolved.o"
                resolved_out_o.write_bytes(mine_bytes)
            else:
                use_resolved = False

        result["resolved"] = use_resolved
        my_dump = _objdump_text(resolved_out_o)

        for fn_idx, fn in enumerate(targets):
            mine = _parse_words(my_dump, fn)

            # Find gap .o for this function.
            if gap_override:
                current_gap: Path | None = gap_override
            else:
                current_gap = find_gap_from_objdiff(out_o)
                if current_gap is None:
                    current_gap = find_gap_by_glob(fn, module, region)

            if current_gap is None:
                result["functions"].append({
                    "name": fn,
                    "status": "not_in_gap",
                    "match_percent": None,
                    "note": "already matched or gap object not found",
                })
                continue

            # Resolve gap .o (per-function, different gap files).
            resolved_gap = current_gap
            if use_resolved:
                gap_bytes = _resolve_obj_bytes(current_gap)
                if gap_bytes is not None:
                    resolved_gap = tmp / f"gap_{fn_idx}.resolved.o"
                    resolved_gap.write_bytes(gap_bytes)
                # If gap resolve fails, compare resolved mine vs unresolved gap:
                # still better than fully unresolved, but note the asymmetry.

            orig_dump = _objdump_text(resolved_gap)
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
                "gap_obj": str(current_gap.relative_to(ROOT)),
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
            "Per-TU fast match check — `ninja <unit.o>` + RESOLVED word-diff "
            "vs delinked gap object. Catches wrong pool values (Mode A) and "
            "wrong callees (Mode B) that raw objdiff wildcards."
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
        "--unresolved",
        action="store_true",
        help=(
            "Use raw/wildcarded comparison (old behaviour, faster but blind "
            "to wrong pool values and wrong callees)"
        ),
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
                "resolved": False,
            })
            continue

        r = match_one(
            c_path,
            args.region,
            func=args.func,
            gap_override=args.gap,
            unresolved=args.unresolved,
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
        mode = "resolved" if r.get("resolved") else "unresolved"

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
                    f"100.0%  OK  ({mode}, {mine_w} words, gap={gap_rel})"
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
                    f"({mode}, {ndiff} diff{'s' if ndiff != 1 else ''}, {size_note}, "
                    f"gap={gap_rel})"
                )
                if args.verbose:
                    for i, a, b in fn_r.get("diffs_sample", []):
                        print(f"    word[{i:3d}]  mine={a}  orig={b}")

    return exit_code


if __name__ == "__main__":
    sys.exit(main())
