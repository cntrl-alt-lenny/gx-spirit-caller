#!/usr/bin/env python3

"""
Generates build.ninja for the Yu-Gi-Oh! GX Spirit Caller decompilation.

Layout follows dqix (https://github.com/StanHash/dqix), with two project-
specific divergences:

  1. The clean baserom lives at orig/baserom_<version>.nds (not extract/),
     keeping user-supplied input separate from dsd's extraction output.
  2. A SHA-1 check on the baserom runs at configure time. A wrong or
     modified dump fails loudly before any build.ninja is generated.

Usage:
    python tools/configure.py usa
"""

import argparse
import hashlib
import os
import sys
from pathlib import Path

import ninja_syntax

from get_platform import get_platform


DEFAULT_WIBO_PATH = "./wibo"
# macOS auto-detects whichever Win32 runner is on PATH:
#   - `wine`   → wine-stable cask (deprecated, disabled 2026-09-01)
#   - `wine64` → Gcenx/wine/game-porting-toolkit cask (post-deprecation)
# See docs/research/wine-migration.md for the migration write-up.
DEFAULT_MACOS_WINE_CANDIDATES = ("wine", "wine64")


def _resolve_macos_wine(
    candidates: tuple[str, ...] = DEFAULT_MACOS_WINE_CANDIDATES,
    which=None,
) -> str:
    """Pick the first candidate that resolves on PATH; otherwise the
    first candidate, so the resulting build.ninja error surfaces as a
    clear "wine: command not found" rather than a silent miss here.

    `which` is injectable for tests."""
    if which is None:
        from shutil import which as _which
        which = _which
    for cand in candidates:
        if which(cand):
            return cand
    return candidates[0]


parser = argparse.ArgumentParser(description="Generates build.ninja")
parser.add_argument('-w', type=str, default=None, dest="wine", required=False,
                    help="Path to the Win32 runner. Linux: wibo (auto-downloaded). macOS: auto-detects wine (wine-stable cask) or wine64 (game-porting-toolkit cask) on PATH. Unused on Windows.")
parser.add_argument("--compiler", type=Path, required=False, help="Path to pre-installed compiler root directory")
parser.add_argument("--no-extract", action="store_true", help="Skip extract step")
parser.add_argument("--dsd", type=Path, required=False, help="Path to pre-installed dsd CLI")
parser.add_argument("--skip-sha1", action="store_true", help="Skip baserom SHA-1 verification (not recommended)")
parser.add_argument('version', help='Game version (e.g. "usa")')
args = parser.parse_args()


# --------------------------------------------------------------------------- #
# Project config
# --------------------------------------------------------------------------- #

GAME = "gx-spirit-caller"
DSD_VERSION = 'v0.11.0'
WIBO_VERSION = '0.6.16'
OBJDIFF_VERSION = 'v2.7.1'
MWCC_VERSION = "2.0/sp1p5"
# Older mwcc revision used by the original ROM for a subset of TUs
# that emit Style A epilogues (`pop {regs, lr}; bx lr`). mwcc 2.0
# tightened the optimiser in 1.2/sp3 onward to merge `pop +
# bx lr` into `pop {pc}` (Style B). Per-TU routing is the
# dual-compiler approach pokediamond / pokeplatinum / pokeheartgold
# also use; see docs/research/style-a-epilogue.md for the per-version
# sweep that confirmed the boundary.
LEGACY_MWCC_VERSION = "1.2/sp2p3"
LEGACY_C_SUFFIX = ".legacy.c"  # filename routing convention
# Third routing tier — mwcc 1.2/sp3. Same `push {regs, lr}; sub sp,
# #4` prologue as sp2p3, but `pop {regs, pc}` (Style B) epilogue
# instead of `pop {regs, lr}; bx lr` (Style A). The combination is
# unique to sp3: neither sp1p5 (default — no sub-sp; r3-spill) nor
# sp2p3 (Style A epilogue) emits it. brief 044 / PR #337
# (docs/research/sp3-routing-decision.md) verified the count and
# justified shipping the tier; brief 042 (PR #334) verified W-B
# (`func_020467f4`) byte-matches under sp3.
LEGACY_SP3_MWCC_VERSION = "1.2/sp3"
LEGACY_SP3_C_SUFFIX = ".legacy_sp3.c"  # filename routing convention
DECOMP_ME_COMPILER = "mwcc_30_131"

# Known-good SHA-1 hashes of clean baserom dumps, keyed by version.
# Leave None until a verified dump is hashed by a human; once set, a wrong
# dump fails configure.py with a clear error.
BASEROM_SHA1: dict[str, str | None] = {
    "usa": "9e53dcc74d8a9db4de6b655d62a1da6f5e9c2a83",  # AYXE
    "eur": "1da50df7c210fae96dc69b3825554b9ce13b4f75",  # AYXP — En,Fr,De,Es,It
    "jpn": "761fbfc62f4fe74f867e973a5eda91b8e86424f6",  # AYXJ
}

CC_FLAGS = " ".join([
    "-O4,p",                # Optimize maximally (adjust if objdiff disagrees)
    "-enum int",            # Use int-sized enums
    "-char signed",         # Char type is signed
    "-str noreuse",         # Equivalent strings are different objects
    "-proc arm946e",        # Target processor
    "-gccext,on",           # Enable GCC extensions
    "-fp soft",             # Compute float operations in software
    "-inline noauto",       # Inline only functions marked with 'inline'
    "-Cpp_exceptions off",  # Disable C++ exceptions
    "-RTTI off",            # Disable runtime type information
    "-interworking",        # Enable ARM/Thumb interworking
    "-w off",               # Disable warnings
    "-sym on",              # Debug info, including line numbers
    "-gccinc",              # Interpret #include "..." and #include <...> equally
    "-nolink",              # Do not link
    "-msgstyle gcc",        # Use GCC-like messages
])
LD_FLAGS = " ".join([
    "-proc arm946e",
    "-nostdlib",
    "-interworking",
    "-m Entry",
    "-map closure,unused",
    "-msgstyle gcc",
    "-nodead",
])
# mwasmarm invocation for hand-written .s files. Kept minimal:
#   -proc arm5TE   ARM9 is armv5te; mwasmarm's valid-list uses this
#                  exact spelling (case-sensitive — `v5te`,
#                  `arm5te`, `ARM5TE` all rejected by our build of
#                  mwasmarm). pokediamond uses the same knob.
#   -msgstyle gcc  Consistent with the C-compile rule.
#   -g             Debug info. `-sym on` (the mwccarm knob) is
#                  rejected by mwasmarm as unknown.
# We do not enable `-MD` on the asm rule: mwasmarm doesn't reliably
# emit depfiles, and hand-written .s files rarely have include chains
# worth tracking. If the decomper later adds .s files with #includes
# that need automatic rebuild, revisit this decision.
ASM_FLAGS = " ".join([
    "-proc arm5TE",
    "-msgstyle gcc",
    "-g",
])
DSD_OBJDIFF_ARGS = " ".join([
    "--scratch",
    f"--compiler {DECOMP_ME_COMPILER}",
    f'--c-flags "{CC_FLAGS} -lang=c"',
    "--custom-make ninja",
])


# --------------------------------------------------------------------------- #
# Paths
# --------------------------------------------------------------------------- #

current_path     = Path(__name__)
root_path        = current_path.parent
build_ninja_path = root_path / "build.ninja"
arm7_bios_path   = root_path / "arm7_bios.bin"
config_path      = root_path / "config"
build_path       = root_path / "build"
src_path         = root_path / "src"
libs_path        = root_path / "libs"
extract_path     = root_path / "extract"
orig_path        = root_path / "orig"
tools_path       = root_path / "tools"
mwcc_root            = args.compiler or tools_path / "mwccarm"
mwcc_path            = mwcc_root / MWCC_VERSION
mwcc_legacy_path     = mwcc_root / LEGACY_MWCC_VERSION
mwcc_legacy_sp3_path = mwcc_root / LEGACY_SP3_MWCC_VERSION


# --------------------------------------------------------------------------- #
# Includes (expand once src/ and libs/ have contents)
# --------------------------------------------------------------------------- #

includes = [str(root_path / "include")]
if libs_path.is_dir():
    for root, dirs, _ in os.walk(libs_path):
        for d in dirs:
            if d == "include":
                includes.append(Path(root) / d)
CC_INCLUDES = " ".join(f"-i {include}" for include in includes)


# --------------------------------------------------------------------------- #
# Platform detection
# --------------------------------------------------------------------------- #

platform = get_platform()
if platform is None:
    exit(1)
EXE = platform.exe
# Pick the Win32 runner for running mwccarm.exe / mwldarm.exe on non-Windows hosts.
# Linux: wibo (auto-downloaded via a ninja rule). macOS: probe PATH
# for either `wine` (wine-stable cask) or `wine64` (game-porting-toolkit cask).
if platform.system == "windows":
    WINE = ""
elif platform.system == "macos":
    WINE = args.wine if args.wine is not None else _resolve_macos_wine()
else:
    WINE = args.wine if args.wine is not None else DEFAULT_WIBO_PATH
DSD = str(args.dsd or os.path.join('.', str(root_path / f"dsd{EXE}")))
OBJDIFF = os.path.join('.', str(root_path / f"objdiff-cli{EXE}"))
CC = os.path.join('.', str(mwcc_path / "mwccarm.exe"))
LD = os.path.join('.', str(mwcc_path / "mwldarm.exe"))
# Legacy compiler for Style A TUs. Linker stays on MWCC_VERSION —
# only the mwccarm.exe path differs per-TU.
LEGACY_CC = os.path.join('.', str(mwcc_legacy_path / "mwccarm.exe"))
# Third compiler tier — mwcc 1.2/sp3 — for TUs whose
# prologue/epilogue combination matches neither sp1p5 (default) nor
# sp2p3 (.legacy.c). See `LEGACY_SP3_MWCC_VERSION` above for
# rationale. Routed via `*.legacy_sp3.c` (`is_legacy_sp3_c()`).
LEGACY_SP3_CC = os.path.join('.', str(mwcc_legacy_sp3_path / "mwccarm.exe"))
# mwasmarm ships inside the same mwccarm.zip bundle we already
# download. Used for hand-written .s assembly — the only escape
# hatch for the Thumb section-alignment wall (see
# docs/research/thumb-align-wall.md + brief 013). Pokediamond +
# pokeheartgold ship BIOS SWI thunks this way.
ASM = os.path.join('.', str(mwcc_path / "mwasmarm.exe"))
PYTHON = sys.executable


# --------------------------------------------------------------------------- #
# Shell-chain wrap for Windows
# --------------------------------------------------------------------------- #

def _wrap_chain_for_windows(chain: str, system: str | None = None) -> str:
    """Make a `&&`-chained command line runnable under Ninja on Windows.

    Ninja on Windows invokes commands via `CreateProcess` directly — no
    `cmd.exe` shell — so `&&` lands as a literal argv token to the
    first executable in the chain (`dsd.exe`, `mwasmarm.exe`, etc.)
    and the build dies on the first such rule. Wrapping in
    `cmd /c "..."` defers chain parsing to cmd, which interprets `&&`
    natively. No-op on non-Windows hosts (Ninja on POSIX uses
    `/bin/sh -c`, which handles `&&` correctly).

    The `mwcc` / `mwcc_legacy` / `mwcc_legacy_sp3` rules use a
    different idiom: they omit their post-processing tail on Windows
    entirely because `transform_dep.py` is a host-tool nicety, not
    correctness. The three rules treated here — `delink`, `lcf`,
    `mwasm` — chain steps that are required on every platform (gap
    `.o` alignment fixups, LCF rewrites, mwasm size-trim), so the
    Windows fix has to keep running them. See brief 058 / PR #393.

    `system` is injectable for tests; falls back to the module-level
    `platform.system` (set at import time by `get_platform()`).
    """
    if system is None:
        system = platform.system
    if system == "windows":
        return f'cmd /c "{chain}"'
    return chain


# --------------------------------------------------------------------------- #
# Baserom SHA-1 verification
# --------------------------------------------------------------------------- #

def verify_baserom(version: str) -> Path:
    """Hash orig/baserom_<version>.nds and compare to BASEROM_SHA1[version].
    Fails loudly with a clear error if the file is missing or wrong."""
    baserom = orig_path / f"baserom_{version}.nds"
    if not baserom.is_file():
        print(
            f"\nERROR: baserom not found at {baserom}\n"
            f"\n"
            f"  Drop a clean US-region Yu-Gi-Oh! GX Spirit Caller ROM at:\n"
            f"      {baserom}\n"
            f"\n"
            f"  (Game code: AYXE. Use your own dump — we do not ship ROMs.)\n",
            file=sys.stderr,
        )
        exit(1)

    expected = BASEROM_SHA1.get(version)
    if expected is None:
        print(
            f"\nWARNING: no expected SHA-1 recorded for version '{version}'.\n"
            f"  Compute it and paste into BASEROM_SHA1 in tools/configure.py:\n"
            f"      sha1sum {baserom}\n"
            f"  Proceeding without verification.\n",
            file=sys.stderr,
        )
        return baserom

    print(f"Verifying SHA-1 of {baserom}...", file=sys.stderr)
    with baserom.open('rb') as f:
        actual = hashlib.sha1(f.read()).hexdigest()
    if actual.lower() != expected.lower():
        print(
            f"\nERROR: baserom SHA-1 mismatch for {baserom}\n"
            f"  expected: {expected}\n"
            f"  actual:   {actual}\n"
            f"\n"
            f"  Your dump does not match the known-good hash. Common causes:\n"
            f"    - wrong region (we require AYXE / US)\n"
            f"    - trimmed / headered / patched ROM\n"
            f"    - corrupt dump — try re-dumping from cartridge\n",
            file=sys.stderr,
        )
        exit(1)
    print(f"  OK  ({actual})", file=sys.stderr)
    return baserom


# --------------------------------------------------------------------------- #
# Project object
# --------------------------------------------------------------------------- #

class Project:
    def __init__(self, game_version: str):
        self.game_version = game_version
        self.game_config = config_path / game_version

        if not self.game_config.is_dir():
            print(
                f"\nWARNING: config/{game_version}/ not found. Run `dsd init` after extracting\n"
                f"  the baserom, or let `ninja` drive the extract and run configure.py again.\n",
                file=sys.stderr,
            )

        self.game_build = build_path / game_version
        self.game_extract = extract_path / game_version

        self.delinks_files = get_config_files(self.game_config, "delinks.txt")
        self.relocs_files = get_config_files(self.game_config, "relocs.txt")
        self.symbols_files = get_config_files(self.game_config, "symbols.txt")

    def dsd_configs(self) -> list[str]:
        return self.delinks_files + self.relocs_files + self.symbols_files

    def arm9_config_yaml(self) -> Path:
        return self.game_config / "arm9" / "config.yaml"

    def baserom(self) -> Path:
        return orig_path / f'baserom_{self.game_version}.nds'

    def build_rom(self) -> str:
        return f"{GAME}_{self.game_version}.nds"

    def baserom_config(self) -> Path:
        return self.game_extract / 'config.yaml'

    def build_rom_config(self) -> Path:
        return self.game_build / "build" / "rom_config.yaml"

    def source_object_files(self) -> list[str]:
        return [
            str(self.game_build / source_file.with_suffix(".o"))
            for source_file in get_source_files(
                [src_path, libs_path], region=self.game_version,
            )
        ]

    def arm9_lcf(self) -> Path:
        return self.game_build / "arm9.lcf"

    def arm9_objects_txt(self) -> Path:
        return self.game_build / "objects.txt"

    def arm9_delink_yaml(self) -> Path:
        return self.game_build / "delinks" / "delink.yaml"

    def arm9_o(self) -> Path:
        return self.game_build / "arm9.o"

    def arm9_delinks(self) -> Path:
        return self.game_build / "delinks"

    def objdiff_report(self) -> Path:
        return self.game_build / "report.json"


# --------------------------------------------------------------------------- #
# Ninja generation
# --------------------------------------------------------------------------- #

def main():
    if not args.skip_sha1:
        verify_baserom(args.version)

    project = Project(args.version)

    with build_ninja_path.open("w") as file:
        n = ninja_syntax.Writer(file)

        n.rule(
            name="download_tool",
            command=f'{PYTHON} tools/download_tool.py $tool $tag --path $path'
        )
        n.newline()

        if arm7_bios_path.is_file():
            n.variable("arm7_bios_flag", f"--arm7-bios {arm7_bios_path.relative_to(root_path)}")
        else:
            n.variable("arm7_bios_flag", "")
        n.newline()

        n.rule(
            name="extract",
            command=f"{DSD} rom extract --rom $in --output-path $output_path $arm7_bios_flag"
        )
        n.newline()

        # After `dsd delink` produces the gap `.o` files, patch each
        # one's `.text` sh_addralign 4 -> 2. Without this step
        # `mwldarm` uses max(section.sh_addralign, ALIGNALL) which
        # means the ALIGNALL(2) in the LCF is useless — every gap
        # `.o` still forces 4-alignment at link time, cascade-shifting
        # every Thumb thunk downstream. See PR #115 second-round
        # bisect in the same PR body.
        #
        # Only alignment, not size trimming: dsd delink extracts
        # pre-built bytes from the baserom, so there's no mwasm
        # size-pad artifact to undo. Keep --trim-padding off here
        # (it would produce correct output on already-exact-size
        # sections but it's wasted work, and the tool's
        # no-op-on-already-clean path would dominate).
        # $out is delink.yaml; its parent dir is where dsd drops the
        # gap `.o`s. The --dir mode walks that tree recursively —
        # cross-platform (ninja's `find | xargs` breaks on Windows
        # cmd.exe).
        patch_align = "tools/patch_section_align.py"
        n.rule(
            name="delink",
            command=_wrap_chain_for_windows(
                f"{DSD} delink --config-path $config_path"
                f" && {PYTHON} {patch_align} --dir $delinks_dir"
            ),
        )
        n.newline()

        mwcc_cmd = f'{WINE} "{CC}" {CC_FLAGS} {CC_INCLUDES} $cc_flags -d $game_version -MD -c $in -o $basedir'
        mwcc_implicit = [CC]
        if platform.system != "windows":
            transform_dep = "tools/transform_dep.py"
            mwcc_cmd += f" && {PYTHON} {transform_dep} $basefile.d $basefile.d"
            mwcc_implicit.append(transform_dep)
        n.rule(
            name="mwcc",
            command=mwcc_cmd,
            depfile="$basefile.d",
        )
        n.newline()

        # Per-TU dual-compiler rule for Style A epilogue TUs. Same
        # CC_FLAGS / CC_INCLUDES as the default `mwcc` rule — the only
        # difference is the binary path. Files routed via the
        # `*.legacy.c` suffix (`is_legacy_c()`) compile through this
        # rule. See docs/research/style-a-epilogue.md for the
        # mwcc-version sweep that motivated the routing.
        mwcc_legacy_cmd = f'{WINE} "{LEGACY_CC}" {CC_FLAGS} {CC_INCLUDES} $cc_flags -d $game_version -MD -c $in -o $basedir'
        mwcc_legacy_implicit = [LEGACY_CC]
        if platform.system != "windows":
            mwcc_legacy_cmd += f" && {PYTHON} {transform_dep} $basefile.d $basefile.d"
            mwcc_legacy_implicit.append(transform_dep)
        n.rule(
            name="mwcc_legacy",
            command=mwcc_legacy_cmd,
            depfile="$basefile.d",
        )
        n.newline()

        # Third-tier per-TU compiler rule for sp3-unique epilogue
        # shapes (no r3-spill + sub-sp + pop-into-pc). Files routed
        # via the `*.legacy_sp3.c` suffix (`is_legacy_sp3_c()`)
        # compile through this rule. Same CC_FLAGS / CC_INCLUDES as
        # the default `mwcc` and `mwcc_legacy` rules; only the
        # mwccarm.exe path differs. See
        # docs/research/sp3-routing-decision.md (brief 044) for the
        # 3-tier discriminator and the candidate count that
        # justified shipping this third tier.
        mwcc_legacy_sp3_cmd = f'{WINE} "{LEGACY_SP3_CC}" {CC_FLAGS} {CC_INCLUDES} $cc_flags -d $game_version -MD -c $in -o $basedir'
        mwcc_legacy_sp3_implicit = [LEGACY_SP3_CC]
        if platform.system != "windows":
            mwcc_legacy_sp3_cmd += f" && {PYTHON} {transform_dep} $basefile.d $basefile.d"
            mwcc_legacy_sp3_implicit.append(transform_dep)
        n.rule(
            name="mwcc_legacy_sp3",
            command=mwcc_legacy_sp3_cmd,
            depfile="$basefile.d",
        )
        n.newline()

        # Assembly rule — unlocks the .s escape hatch for the Thumb
        # section-alignment wall (see docs/research/thumb-align-wall.md).
        # Scoped just to .s files under src/ + libs/; .c files stay on
        # the mwcc rule. Uses mwasmarm.exe from the same mwccarm bundle.
        #
        # Post-compile, we patch the emitted .o's `.text` section
        # header so its `sh_addralign` is 2 instead of the 4 that
        # mwasmarm emits regardless of source-level `.thumb` /
        # `.balign 2` directives. Required to let mwldarm place
        # Thumb thunks at 2-aligned (not-4-aligned) addresses like
        # the baserom does — see brief 013 / PR #110 for the
        # empirical confirmation that the pokediamond `.s`-pattern
        # alone isn't sufficient for our scattered-thunk layout.
        # `--trim-padding` flag added in PR #116 fix for PR #115's
        # regression: mwasmarm also pads `.text` section SIZE to a
        # 4-byte multiple with trailing 0x0000 bytes. For size-6
        # thunks (VBlankIntrWait, Mod) that's a 2-byte cascade shift
        # at link time. The trim path reverses it at the .o level.
        patch_align = "tools/patch_section_align.py"
        mwasm_cmd = _wrap_chain_for_windows(
            f'{WINE} "{ASM}" {ASM_FLAGS} $asm_flags -o $out $in'
            f' && {PYTHON} {patch_align} --trim-padding $out'
        )
        mwasm_implicit = [ASM, patch_align]
        n.rule(
            name="mwasm",
            command=mwasm_cmd,
        )
        n.newline()

        # Post-process the dsd-generated arm9.lcf to rewrite the
        # `.arm9` segment's `ALIGNALL(4)` to `ALIGNALL(2)`. Without
        # this, mwldarm honors the ALIGNALL floor and re-raises
        # our .o-level sh_addralign=2 back to 4 at link time,
        # defeating the Thumb-thunk fix. See PR #115 bisect and
        # docs/research/thumb-align-wall.md.
        #
        # Also chained: `patch_objects_legacy.py`. dsd lcf strips
        # `.legacy.` from objects.txt entries while preserving the
        # full filename in arm9.lcf, breaking mwldarm's link step
        # for every `.legacy.c`-routed TU (brief 037 → brief 038
        # escalation → brief 039 fix). The patcher rewrites
        # `func_X.o` → `func_X.legacy.o` post-emit. No-op on
        # default `.c` files; idempotent. See
        # docs/research/style-a-epilogue.md for the dual-compiler
        # context.
        patch_lcf = "tools/patch_lcf_arm9_align.py"
        patch_objects = "tools/patch_objects_legacy.py"
        # Brief 131: also patch `.ov004` (ALIGNALL 4 → 2). dsd's
        # gap-carving for ov004 exposes 2-aligned Thumb function
        # boundaries inside the segment; without the patch mwldarm's
        # ALIGNALL(4) floor inserts 2-byte padding between gap
        # objects, shifting every downstream byte. Combined with the
        # `-nointerworking` LD flag (suppresses 86 spurious thumb→arm
        # veneers), this resolves ov004's full 1024-byte cascade and
        # the corresponding 16-byte cascade in ARM9 main. See
        # docs/research/ov004-thunk-section-fix.md for the full
        # bisect + flip-to-OK evidence.
        n.rule(
            name="lcf",
            # v0.11+ `dsd lcf` writes to conventional paths under the build dir:
            # build/<ver>/arm9.lcf and build/<ver>/objects.txt. No CLI paths needed.
            command=_wrap_chain_for_windows(
                f"{DSD} lcf -c $config_path"
                f" && {PYTHON} {patch_lcf} $lcf_file"
                f" --also-segments .ov004"
                f" && {PYTHON} {patch_objects}"
                f" --config-dir $config_dir"
                f" --objects $objects_file"
            ),
        )
        n.newline()

        n.rule(
            name="mwld",
            command=f'{WINE} "{LD}" {LD_FLAGS} @$objects_file $lcf_file -o $out'
        )
        n.newline()

        n.rule(
            name="rom_config",
            command=f"{DSD} rom config --elf $in --config $config_path"
        )
        n.newline()

        n.rule(
            name="rom_build",
            command=f"{DSD} rom build --config $in --rom $out $arm7_bios_flag"
        )
        n.newline()

        n.rule(
            name="objdiff",
            command=f"{DSD} objdiff --config-path $config_path {DSD_OBJDIFF_ARGS}"
        )
        n.newline()

        n.rule(
            name="objdiff_report",
            command=f"{OBJDIFF} report generate -o $out"
        )
        n.newline()

        n.rule(
            name="m2ctx",
            command=f"{PYTHON} tools/m2ctx.py -f $out $in"
        )
        n.newline()

        n.rule(
            name="check_modules",
            command=f"{DSD} check modules --config-path $config_path --fail"
        )
        n.newline()

        n.rule(
            name="check_symbols",
            command=f"{DSD} check symbols --config-path $config_path --elf-path $elf_path --fail"
        )
        n.newline()

        n.rule(
            name="sha1",
            command=f"{PYTHON} tools/sha1.py $in -c $sha1_file"
        )
        n.newline()

        n.rule(
            name="progress",
            command=f"{PYTHON} tools/progress.py --version $game_version"
        )
        n.newline()

        n.rule(
            name="heatmap",
            command=f"{PYTHON} tools/generate_heatmap.py --version $game_version --report $in --out $out"
        )
        n.newline()

        add_download_tool_builds(n)
        add_extract_build(n, project)
        add_delink_and_lcf_builds(n, project)
        add_mwcc_builds(
            n,
            project,
            mwcc_implicit,
            mwcc_legacy_implicit,
            mwcc_legacy_sp3_implicit,
        )
        add_mwasm_builds(n, project, mwasm_implicit)
        add_mwld_and_rom_builds(n, project)
        add_check_builds(n, project)
        add_objdiff_builds(n, project)
        add_progress_build(n, project)
        add_heatmap_build(n, project)


def add_download_tool_builds(n: ninja_syntax.Writer):
    if args.dsd is None:
        n.build(
            rule="download_tool",
            outputs=DSD,
            variables={"tool": "dsd", "tag": DSD_VERSION, "path": DSD},
        )
        n.newline()

    n.build(
        rule="download_tool",
        outputs=OBJDIFF,
        variables={"tool": "objdiff", "tag": OBJDIFF_VERSION, "path": OBJDIFF},
    )
    n.newline()

    if args.compiler is None:
        # The mwccarm `latest` bundle ships every published 1.2 + 2.0
        # SP under `tools/mwccarm/<series>/<sp>/`, so a single
        # download covers the default (`MWCC_VERSION`), the Style A
        # legacy compiler (`LEGACY_MWCC_VERSION`), and the third sp3
        # tier (`LEGACY_SP3_MWCC_VERSION`). See
        # docs/research/style-a-epilogue.md and
        # docs/research/sp3-routing-decision.md for the per-tier
        # sweeps that motivated each routing.
        n.build(
            rule="download_tool",
            outputs=[CC, LD, ASM, LEGACY_CC, LEGACY_SP3_CC],
            variables={"tool": "mwccarm", "tag": "latest", "path": tools_path},
        )
        n.newline()

    # wibo is Linux-only; macOS uses a system-installed `wine`, so no download rule there.
    if platform.system == "linux" and WINE == DEFAULT_WIBO_PATH:
        n.build(
            rule="download_tool",
            outputs=WINE,
            variables={"tool": "wibo", "tag": WIBO_VERSION, "path": WINE},
        )
        n.newline()


def add_extract_build(n: ninja_syntax.Writer, project: Project):
    if not args.no_extract:
        n.build(
            inputs=str(project.baserom()),
            implicit=DSD,
            rule="extract",
            outputs=str(project.baserom_config()),
            variables={"output_path": str(project.game_extract)},
        )
        n.newline()


def add_mwld_and_rom_builds(n: ninja_syntax.Writer, project: Project):
    lcf_file = str(project.arm9_lcf())
    objects_file = str(project.arm9_objects_txt())
    delink_file = str(project.arm9_delink_yaml())
    elf_file = str(project.arm9_o())
    n.build(
        inputs=project.source_object_files() + [lcf_file, objects_file, delink_file],
        implicit=LD,
        rule="mwld",
        outputs=elf_file,
        variables={
            "target_dir": str(project.game_build),
            "objects_file": objects_file,
            "lcf_file": lcf_file,
        },
    )
    n.newline()

    n.build(inputs=elf_file, rule="phony", outputs="arm9")
    n.newline()

    rom_config_file = str(project.build_rom_config())
    n.build(
        inputs=elf_file,
        implicit=DSD,
        rule="rom_config",
        outputs=rom_config_file,
        variables={"config_path": str(project.arm9_config_yaml())},
    )
    n.newline()

    rom_file = project.build_rom()
    n.build(
        inputs=rom_config_file,
        implicit=DSD,
        rule="rom_build",
        outputs=rom_file,
    )
    n.newline()

    n.build(inputs=rom_file, rule="phony", outputs="rom")
    n.newline()

    sha1_file = str(Path(rom_file).with_suffix(".sha1"))
    n.build(
        inputs=rom_file,
        implicit=[sha1_file],
        rule="sha1",
        variables={"sha1_file": sha1_file},
        outputs="sha1",
    )
    n.newline()


def add_mwcc_builds(
    n: ninja_syntax.Writer,
    project: Project,
    mwcc_implicit: list,
    mwcc_legacy_implicit: list,
    mwcc_legacy_sp3_implicit: list,
):
    """Emit one mwcc build per .c / .cpp file under src/ + libs/.

    Routing (checked in order; first match wins — the suffixes are
    mutually exclusive in practice but the ordering is defensive):

      - `*.legacy_sp3.c` → `mwcc_legacy_sp3` rule
        (mwcc 1.2/sp3, sub-sp prologue + Style B epilogue).
      - `*.legacy.c` → `mwcc_legacy` rule
        (mwcc 1.2/sp2p3, sub-sp prologue + Style A epilogue).
      - everything else → default `mwcc` rule
        (mwcc 2.0/sp1p5, r3-spill prologue + Style B epilogue).

    See docs/research/sp3-routing-decision.md (brief 044) for the
    3-tier discriminator and the per-compiler prologue/epilogue
    sweep that motivated each routing tier.
    """
    for source_file in get_c_cpp_files(
            [src_path, libs_path], region=project.game_version):
        src_obj_path = project.game_build / source_file
        cc_flags = []
        if is_cpp(source_file):
            cc_flags.append("-lang=c++")
        elif is_c(source_file):
            cc_flags.append("-lang=c")
        if is_legacy_sp3_c(source_file):
            rule = "mwcc_legacy_sp3"
            implicit = mwcc_legacy_sp3_implicit
        elif is_legacy_c(source_file):
            rule = "mwcc_legacy"
            implicit = mwcc_legacy_implicit
        else:
            rule = "mwcc"
            implicit = mwcc_implicit
        n.build(
            inputs=str(source_file),
            implicit=implicit,
            rule=rule,
            outputs=str(src_obj_path.with_suffix(".o")),
            variables={
                "game_version": project.game_version,
                "cc_flags": " ".join(cc_flags),
                "basedir": os.path.dirname(src_obj_path),
                "basefile": str(src_obj_path.with_suffix("")),
            },
        )
        n.newline()

        extension = source_file.suffix
        ctx_file = str(project.game_build / source_file.with_suffix(f".ctx{extension}"))
        n.build(
            inputs=str(source_file),
            rule="m2ctx",
            outputs=ctx_file,
        )
        n.newline()


def add_mwasm_builds(
    n: ninja_syntax.Writer, project: Project, mwasm_implicit: list,
):
    """Emit one `mwasm` build per .s file under src/ + libs/.

    No m2ctx / scratch-context sibling here (unlike the C path) —
    decomp.me's asm scratches are fed the extracted disassembly
    directly, not a preprocessed source file, so there's nothing
    useful to preprocess from a hand-written .s file."""
    for source_file in get_asm_files(
            [src_path, libs_path], region=project.game_version):
        src_obj_path = project.game_build / source_file
        n.build(
            inputs=str(source_file),
            implicit=mwasm_implicit,
            rule="mwasm",
            outputs=str(src_obj_path.with_suffix(".o")),
            variables={
                # Reserved for per-file overrides — e.g. a sub-
                # architecture switch if one TU needs `-proc arm4t`
                # for libc compatibility.
                "asm_flags": "",
            },
        )
        n.newline()


# Known regions for per-region source-tree filtering. A path
# `src/<R>/...` where R ∈ KNOWN_REGIONS is treated as
# region-specific source — only included when the current build
# targets region R. Paths under `src/<module>/...` without a
# region prefix (e.g. `src/main/`, `src/overlay002/`) are the EUR
# baseline and only appear in EUR builds. See brief 064
# deliverable 2's strawman convention.
KNOWN_REGIONS: tuple[str, ...] = ("eur", "usa", "jpn")


def _is_region_source_excluded(path: Path, region: str | None) -> bool:
    """True when `path` is under a per-region source tree that
    doesn't match `region`. Filters cross-region sources out of
    per-region builds.

    Rules (per deliverable-2 strawman):
      - `src/<R>/...` where R ∈ KNOWN_REGIONS  → for region R only
      - `src/<module>/...` (no region prefix)  → EUR baseline,
        only included in EUR builds
      - Anything outside `src/` (e.g. `libs/`) → region-neutral,
        always included
      - `region=None` disables filtering (back-compat for any
        importer that doesn't care about regions).
    """
    if region is None:
        return False
    parts = path.parts
    for i, p in enumerate(parts):
        if p == "src" and i + 1 < len(parts):
            sub = parts[i + 1]
            if sub in KNOWN_REGIONS:
                # Explicit region prefix; must match the build region.
                return sub != region
            # No region prefix → EUR-implicit baseline.
            return region != "eur"
    # Outside src/ (libs/, etc.) → never excluded.
    return False


def get_c_cpp_files(dirs: list[Path], region: str | None = None):
    for d in dirs:
        if not d.is_dir():
            continue
        for root, _, files in os.walk(d):
            root = Path(root)
            for file in files:
                if is_cpp(file) or is_c(file):
                    candidate = root / file
                    if _is_region_source_excluded(candidate, region):
                        continue
                    yield candidate


def get_asm_files(dirs: list[Path], region: str | None = None):
    """Walk `dirs` for hand-written .s assembly files. Kept
    separate from get_c_cpp_files so the caller can attach the
    right compile rule per-file."""
    for d in dirs:
        if not d.is_dir():
            continue
        for root, _, files in os.walk(d):
            root = Path(root)
            for file in files:
                if is_asm(file):
                    candidate = root / file
                    if _is_region_source_excluded(candidate, region):
                        continue
                    yield candidate


def get_source_files(dirs: list[Path], region: str | None = None):
    """Every source file that produces a linkable .o — C, C++, or
    hand-written assembly. Order matters for reproducible ninja
    output; yields C/C++ first, then asm.

    `region` filters per-region `src/<R>/` subtrees; see
    `_is_region_source_excluded` for the rule."""
    yield from get_c_cpp_files(dirs, region=region)
    yield from get_asm_files(dirs, region=region)


def is_cpp(name):
    return Path(str(name)).suffix in [".cpp"]


def is_c(name):
    return Path(str(name)).suffix in [".c"]


def is_legacy_c(name):
    """A `.legacy.c` file routes through mwcc 1.2/sp2p3 (Style A
    epilogue) instead of the default mwcc 2.0/sp1p5 (Style B). The
    suffix decision is per-file; the rest of the project's CC_FLAGS
    are unchanged. See LEGACY_C_SUFFIX above and
    docs/research/style-a-epilogue.md."""
    # Path.suffix only returns the LAST dotted suffix (so `.c` here),
    # not the full multi-dot tail; check the literal end-of-name.
    return str(name).endswith(LEGACY_C_SUFFIX)


def is_legacy_sp3_c(name):
    """A `.legacy_sp3.c` file routes through mwcc 1.2/sp3 — the
    third compiler tier. Used for TUs whose prologue/epilogue
    combination (sub-sp + Style B pop-into-pc, no r3-spill)
    matches neither the default sp1p5 nor the sp2p3 .legacy.c
    routing. See LEGACY_SP3_C_SUFFIX above and
    docs/research/sp3-routing-decision.md (brief 044)."""
    return str(name).endswith(LEGACY_SP3_C_SUFFIX)


def is_asm(name):
    return Path(str(name)).suffix in [".s", ".S"]


def add_delink_and_lcf_builds(n: ninja_syntax.Writer, project: Project):
    n.comment("Delink ELF binaries when any delinks.txt file is modified")
    rom_config = str(project.baserom_config())
    delinks_path = project.arm9_delinks()
    n.build(
        inputs=project.dsd_configs() + [rom_config],
        implicit=[DSD, "tools/patch_section_align.py"],
        rule="delink",
        outputs=str(delinks_path / "delink.yaml"),
        variables={
            "config_path": str(project.arm9_config_yaml()),
            "delinks_dir": str(delinks_path),
        },
    )
    n.newline()

    n.build(inputs=str(delinks_path / "delink.yaml"), rule="phony", outputs="delink")
    n.newline()

    lcf_file = project.arm9_lcf()
    objects_file = project.arm9_objects_txt()
    n.build(
        inputs=project.delinks_files + [rom_config],
        implicit=[
            DSD,
            "tools/patch_lcf_arm9_align.py",
            "tools/patch_objects_legacy.py",
        ],
        rule="lcf",
        outputs=[str(lcf_file), str(objects_file)],
        variables={
            "config_path": str(project.arm9_config_yaml()),
            "config_dir": str(project.game_config),
            "lcf_file": str(lcf_file),
            "objects_file": str(objects_file),
        },
    )
    n.newline()


def add_check_builds(n: ninja_syntax.Writer, project: Project):
    n.build(
        inputs=str(project.arm9_o()),
        rule="check_modules",
        outputs="check_modules",
        variables={"config_path": str(project.arm9_config_yaml())},
    )
    n.newline()

    n.build(
        inputs=str(project.arm9_o()),
        rule="check_symbols",
        outputs="check_symbols",
        variables={
            "config_path": str(project.arm9_config_yaml()),
            "elf_path": str(project.arm9_o()),
        },
    )
    n.newline()

    n.build(
        inputs=["check_modules", "check_symbols"],
        rule="phony",
        outputs="check",
    )
    n.newline()


def add_objdiff_builds(n: ninja_syntax.Writer, project: Project):
    n.build(
        inputs=project.dsd_configs(),
        implicit=DSD,
        rule="objdiff",
        outputs="objdiff.json",
        variables={"config_path": str(project.arm9_config_yaml())},
    )
    n.newline()

    n.build(inputs="objdiff.json", rule="phony", outputs="objdiff")
    n.newline()

    n.build(
        inputs=["objdiff.json"],
        implicit=[OBJDIFF] + project.source_object_files(),
        rule="objdiff_report",
        outputs=str(project.objdiff_report()),
    )
    n.newline()

    n.build(inputs=str(project.objdiff_report()), rule="phony", outputs="report")
    n.newline()


def add_progress_build(n: ninja_syntax.Writer, project: Project):
    n.build(
        inputs=str(project.objdiff_report()),
        rule="progress",
        outputs="progress",
        variables={"game_version": project.game_version},
    )
    n.newline()


def add_heatmap_build(n: ninja_syntax.Writer, project: Project):
    heatmap_path = "assets/progress-heatmap.svg"
    n.build(
        inputs=str(project.objdiff_report()),
        implicit=["tools/generate_heatmap.py"],
        rule="heatmap",
        outputs=heatmap_path,
        variables={"game_version": project.game_version},
    )
    n.newline()
    n.build(inputs=heatmap_path, rule="phony", outputs="heatmap")
    n.newline()


def get_config_files(game_config: Path, name: str) -> list[str]:
    if not game_config.is_dir():
        return []
    return [
        f"{root}/{file}"
        for root, _, files in os.walk(game_config)
        for file in files
        if file == name
    ]


if __name__ == "__main__":
    main()
