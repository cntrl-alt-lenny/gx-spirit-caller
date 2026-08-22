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


def _display_path(path: Path) -> str:
    """A ROOT-relative path string for display, or the absolute path if
    `path` isn't under ROOT at all -- e.g. a user-supplied `--gap` object
    outside the repo. `.relative_to(ROOT)` alone raises ValueError for
    that case; every other caller in this file only ever passes a path
    it derived itself (always under ROOT), so this is reserved for the
    one genuinely user-controlled path."""
    try:
        return str(path.relative_to(ROOT))
    except ValueError:
        return str(path)

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

try:
    from get_platform import get_platform  # type: ignore[import-not-found]
except ImportError:
    get_platform = None  # type: ignore[assignment]


# ---------------------------------------------------------------------------
# objdump wrapper — clean error if binary is missing
# ---------------------------------------------------------------------------


def _resolve_objdump() -> str:
    """Prefer the project's own downloaded copy under
    tools/arm-none-eabi/bin (brief 369: download_tool.py arm-binutils),
    matching verify.py's/asm_escape.py's _binutil() convention -- native
    Windows CreateProcess needs an absolute path (no PATH lookup for a
    bare name unless the launching shell already exported one), and
    every other tool in this project's toolkit already resolves this
    way. Falls back to the bare name for a system-installed toolchain
    (Linux/macOS) if the download isn't present."""
    p = get_platform() if get_platform else None
    exe = p.exe if p is not None else ""
    cand = ROOT / "tools" / "arm-none-eabi" / "bin" / f"arm-none-eabi-objdump{exe}"
    return str(cand) if cand.exists() else "arm-none-eabi-objdump"


_OBJDUMP = _resolve_objdump()


class ObjdumpError(RuntimeError):
    """The objdump process could not produce a usable report."""


def _run_objdump(extra_args: list[str], obj: Path) -> str:
    """Run objdump and return non-empty stdout, or raise on launch failure."""
    cmd = [_OBJDUMP] + extra_args + [str(obj)]
    try:
        completed = subprocess.run(cmd, capture_output=True, text=True, cwd=ROOT)
    except OSError as exc:
        raise ObjdumpError(
            f"ERROR: '{_OBJDUMP}' failed to launch: {exc}\n"
            "  Run `ninja` once to download toolchain binaries, or:\n"
            "  python tools/download_tool.py"
        ) from exc
    stdout = completed.stdout or ""
    stderr = (completed.stderr or "").strip()
    if completed.returncode != 0:
        detail = stderr or stdout.strip() or f"exit code {completed.returncode}"
        raise ObjdumpError(
            f"ERROR: '{_OBJDUMP}' failed (exit code {completed.returncode}):\n{detail}"
        )
    if not stdout.strip():
        raise ObjdumpError(f"ERROR: '{_OBJDUMP}' ran but produced no output")
    return stdout


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


# A .s has no routing-tier concept (a tier only selects which mwcc
# invocation compiles a .c); longest-suffix-first because each tier
# suffix also ends in plain ".c", so a bare ".c" strip tried first would
# leave "func_X.legacy" as the stem for a "func_X.legacy.c" input.
# Mirrors batch_sha1.py's _c_to_s_rel / _TIER_SUFFIXES exactly.
_TIER_SUFFIXES = (".legacy_sp3.c", ".legacy.c", ".thumb.c")

# Same regexes as batch_sha1.py's own stale-sibling self-heal, reused
# rather than re-derived: ninja's own fatal-configuration-error line
# (distinct by construction from a real compile error's output -- this
# prefix only appears when ninja refused to even start the build), and
# the specific "two source files target the same object" shape.
_NINJA_ERROR_RE = re.compile(r"^ninja: error:.*$", re.M)
_MULTIPLE_RULES_RE = re.compile(r"multiple rules generate (?P<path>\S+)")


def _sibling_s_path(c_path: Path) -> Path:
    """The plain `.s` path this `.c` candidate's own translation unit
    collides with if that `.s` is still on disk (still the active
    delinks.txt entry -- fastmatch never edits delinks.txt, so this is
    the common case for any candidate being test-compiled)."""
    name = c_path.name
    for suffix in _TIER_SUFFIXES:
        if name.endswith(suffix):
            return c_path.with_name(name[: -len(suffix)] + ".s")
    return c_path.with_suffix(".s")


def _ninja_config_error(output: str) -> str | None:
    """None if `output` shows no ninja-level fatal; otherwise the matched
    error line(s), joined."""
    hits = _NINJA_ERROR_RE.findall(output)
    return "\n".join(hits) if hits else None


def _displace_stale_sibling(s_path: Path) -> bytes | None:
    """Move s_path out of the way (delete, return its exact bytes so the
    caller can restore it byte-for-byte). None if there was nothing to
    displace. Uses read_bytes/write_bytes, not text, so line endings and
    encoding round-trip exactly (same reasoning as batch_sha1.py)."""
    if not s_path.is_file():
        return None
    data = s_path.read_bytes()
    s_path.unlink()
    return data


def _restore_stale_sibling(s_path: Path, data: bytes | None) -> None:
    """Undo _displace_stale_sibling. No-op if nothing was displaced --
    fastmatch must never leave delinks.txt's active .s entry missing,
    since (unlike batch_sha1) it never flips delinks.txt to compensate."""
    if data is not None:
        s_path.write_bytes(data)


def _find_stale_c_s_collisions(c_path: Path) -> list[Path]:
    """Scan c_path's own directory for every `.c` file with a still-
    present plain `.s` sibling -- the general shape of the "multiple
    rules generate" collision, not just c_path's own.

    q-fastmatch-selfheal-inflight: the original self-heal only matched
    a collision against the CURRENT candidate's own sibling, so it
    failed (naming the wrong file, no self-heal) whenever a DIFFERENT
    in-flight candidate's `.c`+`.s` pair was what ninja's parser hit
    first -- independently rediscovered by 4 of 5 worktree batches in
    cm-ov002-unknown-sweep-2 (#1372), all mid-draft on several
    candidates in the same module directory at once (exactly what a
    parallel sweep batch does). Scoped to c_path's own directory
    (not the whole src/ tree) so an unrelated stray pair elsewhere in
    the repo -- a different module, a different lane's in-progress
    work -- is never touched.
    """
    stale: list[Path] = []
    for sibling_c in sorted(c_path.parent.glob("*.c")):
        sibling_s = _sibling_s_path(sibling_c)
        if sibling_s.is_file():
            stale.append(sibling_s)
    return stale


def _reconfigure(region: str) -> tuple[int, str]:
    """Re-run configure.py for `region`. Returns (returncode, combined
    stdout+stderr)."""
    result = subprocess.run(
        [sys.executable, "tools/configure.py", region],
        cwd=ROOT, capture_output=True, text=True,
    )
    return result.returncode, (result.stdout or "") + (result.stderr or "")


def _run_ninja_once(target: str) -> subprocess.CompletedProcess:
    return subprocess.run(
        ["ninja", target],
        capture_output=True, text=True, cwd=ROOT,
    )


def ninja_compile_one(out_o: Path, c_path: Path, region: str) -> tuple[bool, str]:
    """Run `ninja <out_o>` to compile exactly one translation unit.

    Returns (ok, error_message). On success ok=True and error_message is empty.
    Ninja reads the existing build.ninja; the caller must ensure
    `python tools/configure.py <region>` has been run at least once.

    Self-heals ninja-level (not compile-level) fatals of one specific
    shape: configure.py's auto-discovery adds a build rule for every .c
    AND every .s file it finds under src/, regardless of delinks.txt --
    so a candidate .c draft sitting beside its own still-`.s`-routed
    sibling makes ninja refuse to build ANYTHING with "multiple rules
    generate <output>.o". This is the SAME root cause batch_sha1.py's
    _displace_stale_sibling/_reconfigure already fixed for its own
    (multi-candidate, permanent-flip) use case (brief q-toolbugs-round2,
    #1351) -- ported here rather than reinvented. Adapted for fastmatch's
    read-only, single-file use: every displaced sibling is ALWAYS
    restored byte-for-byte afterward (success or failure), since
    fastmatch never touches delinks.txt and must leave the tree exactly
    as it found it.

    Heals EVERY stale .c/.s collision in c_path's own directory in one
    pass, not just one matching c_path's own sibling (q-fastmatch-
    selfheal-inflight): the original narrower check failed outright
    whenever a DIFFERENT in-flight candidate's pair was what ninja's
    parser hit first, which 4 of 5 worktree batches in cm-ov002-
    unknown-sweep-2 (#1372) independently hit while multiple candidates
    were mid-draft in the same module at once -- exactly what a
    parallel sweep batch does. Fixing every collision in the directory
    together (rather than reactively one at a time) also avoids one
    report's sharper finding: restoring a single sibling and
    reconfiguring can reintroduce the SAME fatal for whichever other
    candidate is still mid-draft at that moment.
    """
    target = str(out_o.relative_to(ROOT))
    result = _run_ninja_once(target)

    if result.returncode != 0:
        combined = "\n".join(filter(None, [result.stderr.strip(), result.stdout.strip()]))
        config_error = _ninja_config_error(combined)
        m = _MULTIPLE_RULES_RE.search(config_error) if config_error else None

        stale: list[Path] = []
        if m is not None:
            hit_dir = m.group("path").replace("\\", "/").rsplit("/", 1)[0]
            target_dir = str(out_o.parent.relative_to(ROOT)).replace("\\", "/")
            # Only scan+heal when the reported collision is in the SAME
            # build-output directory as the candidate being compiled --
            # a hit reported for some other module can't be fixed by
            # touching files here, and treating it as in-scope would
            # displace unrelated siblings for no benefit (see the
            # directory-scoped docstring note above).
            if hit_dir == target_dir:
                stale = _find_stale_c_s_collisions(c_path)

        if stale:
            backups = [(s, _displace_stale_sibling(s)) for s in stale]
            try:
                reconf_rc, reconf_output = _reconfigure(region)
                if reconf_rc != 0:
                    return False, (
                        "ninja config error self-heal failed: "
                        f"`configure.py {region}` errored while retrying "
                        "after removing stale sibling(s) "
                        f"{', '.join(str(s.relative_to(ROOT)) for s in stale)}:\n"
                        f"{reconf_output}"
                    )
                result = _run_ninja_once(target)
            finally:
                for s_path, backup in backups:
                    _restore_stale_sibling(s_path, backup)
                if any(backup is not None for _, backup in backups):
                    # Best-effort: resync build.ninja with the restored
                    # .s file(s). A stale build.ninja here only affects
                    # whoever runs ninja next (they'd get a correct file
                    # anyway via their own configure.py/ninja
                    # invocation), so a failure here doesn't change
                    # fastmatch's own result.
                    _reconfigure(region)

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
        return False, (
            f"Target '{target}' not in build.ninja.\n"
            f"  Run `python tools/configure.py {region}` first.\n"
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

    dsd only emits a `_dsd_gap@` object for a genuinely-unassigned region
    (bytes with no delinks.txt entry of their own yet) -- it NEVER emits
    one for a function that already has its own individual delinks.txt
    entry, which is the common case for a whole-function-ship `.s`
    candidate. This glob reliably finds nothing for that case; callers
    needing it should fall back to find_gap_by_delinked_object.
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


def find_gap_by_delinked_object(c_path: Path, func: str, region: str) -> Path | None:
    """Fallback: look up the per-function delinked reference object directly.

    Every delinks.txt entry (whether still `.s` or already converted to
    `.c`) gets its own reference object at
    build/<region>/delinks/<same-dir-as-source>/<name-with-suffix-swapped>.o
    -- confirmed on disk (brief q-fastmatch-sweep-friction): an unconverted
    candidate `src/overlay002/func_ov002_021aa4a0.s` has its reference at
    `build/eur/delinks/src/overlay002/func_ov002_021aa4a0.o`, no tier
    suffix, because dsd names it after the CURRENT (still-`.s`) source
    path, not the function name in isolation. This is the path
    find_gap_by_glob's `_dsd_gap@` search can never reach: individually
    carved candidates always have this entry, never a `_dsd_gap@` blob.
    """
    src_rel = c_path.relative_to(ROOT) if c_path.is_absolute() else c_path
    delinks_dir = ROOT / "build" / region / "delinks" / src_rel.parent
    candidate = delinks_dir / f"{func}.o"
    if candidate.is_file():
        return candidate
    # Tier-suffixed fallback (e.g. "<func>.legacy.o"), in case the
    # delinks.txt entry was already converted to a suffixed .c tier.
    if delinks_dir.is_dir():
        matches = sorted(delinks_dir.glob(f"{func}.*.o"))
        if matches:
            return matches[0]
    return None


# ---------------------------------------------------------------------------
# Word comparison
# ---------------------------------------------------------------------------

_HDR   = re.compile(r"^[0-9a-f]+ <(\S+)>:")
# Thumb instructions disassemble as 4 hex digits (2 bytes), ARM ones and
# literal-pool `.word` entries as 8 (4 bytes) -- try 8 FIRST so a pool word
# inside an otherwise-Thumb function isn't mis-split into two 4-digit halves.
#
# This is the same fix verify.py:69 already carries (brief 683). It was never
# ported here, so fastmatch kept the 8-digit-only pattern: for a Thumb-mode
# function it matched NOTHING, both word lists came back empty, and
# match_percent's `total == 0` branch reported a false 100.0%. 119 `.thumb.c`
# TUs are in-tree, so this silently "verified" every Thumb candidate it was
# ever pointed at.
_INSN  = re.compile(r"^\s+([0-9a-f]+):\s+([0-9a-f]{8}|[0-9a-f]{4})\s")
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
        # FAIL CLOSED. Zero words on BOTH sides never means "a perfect match of
        # nothing" -- every real function has at least one instruction, so this
        # can only mean the disassembly was not parsed (wrong instruction-width
        # regex, an empty/!.text object, or the wrong symbol name). Returning
        # 100.0 here is what turned the Thumb regex bug above into a silent
        # false PASS on every Thumb candidate. Report 0.0 with an explanatory
        # synthetic diff so the caller's existing `pct < 100.0` mismatch path
        # fires and the reason is visible, rather than inventing a match.
        return 0.0, [(0, "NO-INSTRUCTIONS-PARSED", "NO-INSTRUCTIONS-PARSED")]
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
    ok, err = ninja_compile_one(out_o, c_path, region)
    if not ok:
        result["status"] = "compile_error"
        result["error"] = err
        return result

    # --- Step 2: list functions ---
    try:
        funcs_in_obj = list_funcs_in_obj(out_o)
    except ObjdumpError as exc:
        result["status"] = "objdump_error"
        result["error"] = str(exc)
        return result
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
        try:
            my_dump = _objdump_text(resolved_out_o)
        except ObjdumpError as exc:
            result["status"] = "objdump_error"
            result["error"] = str(exc)
            return result

        for fn_idx, fn in enumerate(targets):
            mine = _parse_words(my_dump, fn)

            # Find gap .o for this function.
            if gap_override:
                current_gap: Path | None = gap_override
            else:
                current_gap = find_gap_from_objdiff(out_o)
                if current_gap is None:
                    current_gap = find_gap_by_delinked_object(c_path, fn, region)
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

            try:
                orig_dump = _objdump_text(resolved_gap)
            except ObjdumpError as exc:
                result["status"] = "objdump_error"
                result["error"] = str(exc)
                result["functions"] = []
                return result
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
                "gap_obj": _display_path(current_gap),
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
        help="Show first 8 differing words for non-100%% matches",
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
                "region": args.region,
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

        if r["status"] in (
            "compile_error", "objdump_error", "no_functions", "file_not_found",
        ):
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
        if r["status"] == "objdump_error":
            err = r.get("error", "")
            print(f"{tag} {label}: OBJDUMP ERROR")
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
