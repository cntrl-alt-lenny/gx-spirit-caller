# Permuter workflow — macOS Apple Silicon

**Brief:** 096 (cloud). decomp-permuter is the matching-accelerator
the project uses for any function where natural-form C source +
known C-N coercions don't converge. Brief 063 (PR #473) shipped
`tools/permute.py --run` as the auto-runner; brief 093 (PR #487)
surfaced 5 vendor patches + 1 .s normalization gap on macOS Apple
Silicon; brief 096 (this PR) wraps them at the project layer so a
fresh worktree runs cleanly without manual intervention.

## Quick start

```bash
# 0. One-time prerequisites (homebrew):
#    arm-none-eabi-binutils — provides arm-none-eabi-as
#    gcc                    — provides cpp-15 (homebrew_gcc_cpp)
brew install arm-none-eabi-binutils gcc

# 1. Generate the per-function .s (one-off after each ninja rom):
mkdir -p build/eur/disasm
./dsd dis -c config/eur/arm9/config.yaml -a build/eur/disasm
cp build/eur/disasm/src/main/func_<addr>.s build/eur/disasm/main_<addr>.s

# 2. Run permuter. The wrapper auto-installs decomp-permuter into
#    tools/_vendor/decomp-permuter/, applies the brief 096 patches,
#    normalises the .s file, and starts iterating:
python tools/permute.py func_<addr> --run --max-seconds 600
```

The `--run` mode handles:

- Cloning + checking out the pinned upstream commit (cold path).
- Patching the vendor for macOS/ARM (idempotent — second run is
  a no-op).
- Normalizing the dsd-dis `.s` into permuter-acceptable form.
- Stripping the `&& transform_dep.py` chunk from the ninja-derived
  compile.sh.
- Streaming stdout to `permute_log/<func>.log` + tail-printing
  best-score events.
- Enforcing the wall-clock cap (default 600s).
- Detecting byte-matches via `--stop-on-zero` (or the
  `output-0-<ctr>/source.c` glob after exit).

## Vendor patches applied automatically (brief 096)

The wrapper layer in `tools/permute.py` applies these at
post-clone time. All patches are idempotent — second invocation
detects the guard substring `brief 096 patch applied` and
fast-paths.

| # | Target | Change |
|---|---|---|
| 1 | `import.py:homebrew_gcc_cpp` | catch `FileNotFoundError` (Apple Silicon has no `/usr/local/bin`) |
| 2 | `import.py:cpp_command builder` | accept lowercase `-i` as include flag (mwccarm convention) |
| 3 | `import.py:DEFAULT_AS_CMDLINE` | switch from MIPS (`mips-linux-gnu-as -march=vr4300 -mabi=32`) to ARM (`arm-none-eabi-as -mcpu=arm946e-s -mthumb-interwork`) |
| 4 | `prelude.inc` | replace MIPS `.set noat / .set noreorder / .set gp=64` + `@function` macros with ARM-flavoured `%function` macros |

If upstream lands a refactor that moves any patch's anchor string,
the patcher fails loud with `ValueError: brief 096 patch …: search
string not found.` Bump `PERMUTER_PINNED_COMMIT` after auditing
the new upstream shape.

## Per-run rewrites (brief 096)

These run on each `--run` invocation, not on the vendor:

- **`.s` normalization** (`normalize_disasm_for_permuter`). The
  raw dsd-dis output is staged at
  `build/<region>/disasm/main_<addr>.s` but uses dsd-flavoured
  directives that upstream permuter chokes on:
  - `.global func_<addr>` → `.globl func_<addr>` (permuter
    scrapes `.globl`).
  - `.include "macros/function.inc"` → removed.
  - `arm_func_start <name>` / `arm_func_end <name>` → removed.
  - `; <annotation>` trailers → removed (ARM GNU as treats `;`
    as junk; the annotations carry no semantics).

  The wrapper writes the normalized version next to the original
  (`build/<region>/disasm/main_<addr>.permuter.s`) and feeds that
  to import.py. The original stays untouched so `ninja dis`
  re-runs don't fight.

- **`compile.sh` `&&` strip** (`strip_compile_sh_ampersand`).
  The project's ninja rule chains
  `mwccarm.exe ... -c $in -o $basedir && python tools/transform_dep.py …`
  so the dep-file gets cleaned up after each compile. import.py
  scrapes `ninja -t commands` verbatim, capturing the whole
  chain. mwccarm rejects `&&` as a literal arg, AND
  `"$INPUT"`/`"$OUTPUT"` end up in the wrong position (after
  transform_dep.py's args). The wrapper strips the
  `'&&' ... transform_dep.py X.d Y.d` chunk, leaving
  `"$INPUT" -o "$OUTPUT"` in the natural mwccarm position.

## Calibration

Brief 096's success criterion was: a fresh macOS Apple Silicon
worktree should run permuter on `func_02009758` (brief 091's P-N
candidate) for a few hundred iterations without manual
intervention. Result: **104 iterations × 2 threads = ~208
thread-iterations in 30 seconds**, best score **65** (down from
baseline 400). All 4 vendor patches applied automatically; .s
normalization + compile.sh strip ran in `_run_mode`. No manual
hand-edits.

Whether `func_02009758` actually byte-matches under permuter is
out of scope for brief 096. Brief 091 classified it as P-N
(mwcc-2.0 modulo peephole + reg-alloc — the 4-insn signed-mod
recovery formula is mwcc-1.2-only); permuter's source-level
mutations may or may not unlock it. That's a future P-class
investigation.

## Cycle-cost notes

- **Cold-clone cost**: first `--run` clones decomp-permuter
  (~50 MB shallow), pip-installs `toml` + `Levenshtein`, applies
  the 4 vendor patches. ~30 seconds wall-clock on a fresh
  worktree.
- **Warm-clone cost**: second `--run` skips clone + pip + patcher
  (idempotent); ~1 second for the rev-parse check.
- **Per-run rewrite cost**: O(file size) for both .s normalization
  and compile.sh strip. Negligible for individual functions
  (~0.01s per kbyte).

## Forward-looking implications

- **P-class permuter sweeps** are now tractable as cloud-
  autonomous briefs. Targets surfaced by brief 091 (P-N
  `func_02009758`), brief 094 byte-diff drops
  (`func_020068d8`/`_020331a4`/`_02052b50`, classic single-byte
  reg-alloc divergences), and any future P-class candidates.
- **Vendor pulls stay clean**. Because the patcher is text-
  substitution-based with anchor strings, future
  `PERMUTER_PINNED_COMMIT` bumps just need the patch anchors to
  remain present in the new upstream HEAD (audit step before
  bumping).
- **macOS-only assumption is documented**. The patches are
  conditional on the upstream behaviours that bit on macOS
  Apple Silicon. Linux + native Windows hosts are not exercised
  by these patches; the wrapper's behaviour on those hosts
  defaults to "apply patches anyway" (idempotent — they're
  text replacements, not platform-conditional logic).

## Related

- Brief 063 (PR #473) — `tools/permute.py --run` mode that this
  wrapper extends.
- Brief 093 (PR #487) — surfaced the 5 patches + 1 .s
  normalization, ran them manually, classified P-4 as confirmed
  permanent.
- C-22 brief-091 sub-note in `codegen-walls.md` — references
  the manual patch list this wrapper supersedes.
