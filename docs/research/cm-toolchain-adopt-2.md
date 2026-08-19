[//]: # (markdownlint-disable MD013 MD041)

# cm-toolchain-adopt-2 — dsd v0.12.0 leg: DECLINE, with the boundary-drift evidence

**Item:** `cm-toolchain-adopt-2` (scaffolder, effort MEDIUM). Third attempt at the dsd leg first
scoped in `q-toolchain-repin-eval` (#1512) and blocked twice since (#1515). This round was
scheduled first, ahead of the CC Decomper's round, specifically so the wine lane would be
available — and it was. This is not a contention report. This is a real finding.

## Verdict: DECLINE

**Not because v0.12.0 is worse — the evidence below suggests its function-boundary analysis is
genuinely better than v0.11.0's. DECLINE because adopting it would move real `.text`/`.rodata`
boundaries by tens of kilobytes in at least two overlays, which would require re-deriving and
reconciling the entire committed `config/eur/` tree (delinks, symbols, relocs) against the new
boundaries before the project could even configure again — a project-wide re-bootstrap, not a
toolchain pin bump. That is real work, but it is not this item's scope.**

## Contention check (as instructed, before starting)

```
$ pgrep -fl 'mwcc|mwld|mwasm|ninja'
6335 ninja sha1
48619+ ... claude-decomper-queue/.wine-lane ... mwasmarm.exe ... (batch of overlay002 assembles + patch_section_align.py)
```

This matched the dispatch's own predicted caveat exactly: `claude-decomper-queue` (the
consolidated branch, not a `-bN` batch worktree) running a finite verification gate left over
from the previous round. Waited via a bounded background poll (up to ~25 min, checking every
90s) instead of reporting blocked immediately — it cleared after 1 check (~1 minute). Re-verified
clear with a fresh independent `pgrep` immediately after. The wine lane was then fully available
for the rest of this round; no further contention was observed.

## Dedicated worktree

`/Users/leo/Dev/spirit-caller/scaffolder-dsd-eval-2`, branch `claude/dsd-eval-scratch-2` off
`origin/main` (`dd214255d`, matching the dispatch). Baseroms symlinked in from the main
worktree (gitignored, not tracked, each worktree needs its own). `DSD_VERSION` bumped to
`v0.12.0` **in this worktree only** — never touched in the actual PR branch
(`claude-scaffolder-queue`, `claude/cm-toolchain-adopt-2`), which is why `git diff --stat` for
this PR shows no toolchain file changed. This scratch worktree was removed after the
investigation; nothing from it is part of this PR.

## Why a direct diff against the tracked config is the wrong comparison

`config/eur/arm9/**/delinks.txt` today is not raw `dsd init` output — it is v0.11.0's original
output plus roughly 500 briefs of hand edits (functions matched, symbols renamed, `.s` retitled
to `.c`, etc.). Diffing a fresh v0.12.0 `init` run against it directly would be swamped by that
entire edit history and would say nothing about dsd itself. The only clean comparison is
**both versions' `init` output, freshly regenerated from the same source, with no project
history in either.** That's what follows.

## Extract-layer finding: the `config.yaml` schema changed

Ran `dsd rom extract` with both versions against the same baserom, into separate scratch
directories. Both succeeded, but the generated `config.yaml` differs:

```diff
< file_image_padding_value: 255
< section_padding_value: 255
---
> padding:
>   arm9: 0
>   arm9_overlay_table: 255
>   arm9_overlays: 255
>   arm7: 255
>   arm7_overlay_table: 255
>   arm7_overlays: 255
>   fnt: 255
>   fat: 255
>   banner: 255
>   file_image: 255
>   rom: 255
```

v0.11.0's two flat padding fields became an 11-key structured `padding:` block in v0.12.0, with
per-region granularity (and `arm9: 0` instead of `255` — a real value change, not just
restructuring). **v0.11.0's `dsd init` cannot even parse a v0.12.0-extracted `config.yaml`**
("missing field `file_image_padding_value`") — confirmed by feeding it across versions before
correcting the methodology to extract separately per version. This alone is a real, reportable
compatibility break at the extract/config layer, independent of anything below.

## Init-layer canary: log signature already tells the story

Ran `dsd init --allow-unknown-function-calls` with each version against its own matching
extraction (same ROM, same config schema per version). Both exited 0. The logs are not
remotely the same shape:

```
v0.11.0: 129 log lines — 102× "No functions from X in overlay Y to Z", 25× "Local
         function call ... goes to middle of function ... adding an external label
         symbol", spread across overlays 11/12/13.
v0.12.0:  10 log lines — 0× "No functions from ...", 8× "Local function call ...".
```

Every one of v0.11.0's 102 "no functions found" gap warnings is gone in v0.12.0. That's not
log-message rewording — dsd's own commit history between the pins explains exactly why (see
root-cause section below).

## Delink-layer ground truth: real boundary shifts, not just log noise

Full recursive diff of the two `init` output trees (82 files each) — **21 files differ**:

```
arm9/config.yaml
arm9/relocs.txt
arm9/symbols.txt
arm9/overlays/ov000/delinks.txt   <- boundary shift
arm9/overlays/ov000/relocs.txt
arm9/overlays/ov000/symbols.txt
arm9/overlays/ov004/delinks.txt   <- boundary shift
arm9/overlays/ov004/relocs.txt
arm9/overlays/ov004/symbols.txt
arm9/overlays/ov006/relocs.txt
arm9/overlays/ov007/symbols.txt
arm9/overlays/ov009/symbols.txt
arm9/overlays/ov010/relocs.txt
arm9/overlays/ov011/relocs.txt
arm9/overlays/ov012/relocs.txt
arm9/overlays/ov013/relocs.txt
arm9/overlays/ov015/relocs.txt
arm9/overlays/ov016/relocs.txt
arm9/overlays/ov017/relocs.txt
arm9/overlays/ov019/relocs.txt
arm9/overlays/ov021/symbols.txt
```

**The two `delinks.txt` diffs — the actual `.text`/`.rodata` boundaries — pasted verbatim:**

```diff
# arm9/overlays/ov000/delinks.txt
1,2c1,2
<     .text       start:0x021aa4a0 end:0x021af7d0 kind:code align:32
<     .rodata     start:0x021af7d0 end:0x021b63fc kind:rodata align:4
---
>     .text       start:0x021aa4a0 end:0x021b55dc kind:code align:32
>     .rodata     start:0x021b55dc end:0x021b63fc kind:rodata align:4
```

`.text` end moved `0x021af7d0` → `0x021b55dc` = **+0x5E0C (24,076 bytes)** reclassified from
rodata to code.

```diff
# arm9/overlays/ov004/delinks.txt
1,2c1,2
<     .text       start:0x021c9d60 end:0x021de638 kind:code align:32
<     .rodata     start:0x021de638 end:0x02209a5c kind:rodata align:4
---
>     .text       start:0x021c9d60 end:0x02200dbc kind:code align:32
>     .rodata     start:0x02200dbc end:0x02209a5c kind:rodata align:4
```

`.text` end moved `0x021de638` → `0x02200dbc` = **+0x22784 (141,700 bytes)** reclassified.

**Confirmed these are real functions, not a relabeling artifact:** `arm9/overlays/ov000/symbols.txt`
in the v0.12.0 tree has genuine `kind:function(arm,size=...)` entries throughout the
newly-reclassified `0x021af7d0`-`0x021b55dc` span (e.g. `func_ov000_021af7d0
kind:function(arm,size=0x30c) addr:0x021af7d0`, `func_ov000_021afadc
kind:function(arm,size=0x34) ...`, 20+ more) — v0.11.0's `symbols.txt` has nothing there but
undifferentiated rodata. Total `kind:data`/`kind:function` entries for ov000: 1484 (v0.11.0) →
1536 (v0.12.0), +52.

**Confirmed my v0.11.0 baseline matches what's actually on `main` today** (not just a
theoretical "what v0.11.0 would produce"): `config/eur/arm9/overlays/ov000/delinks.txt` and
`.../ov004/delinks.txt` on the real tracked tree show the exact same `0x021af7d0` /
`0x021de638` boundaries as my freshly-regenerated v0.11.0 output. The comparison is against the
real current state, not a hypothetical.

**A `relocs.txt`/`symbols.txt`-only spot check (ov007, `delinks.txt` untouched)** shows a
smaller-scale but still real change:

```diff
88d87
< data_ov007_021b4002 kind:bss addr:0x021b4002 ambiguous
```

v0.11.0 flagged this symbol `ambiguous`; v0.12.0 doesn't emit it at all — resolved cleanly, not
just reworded.

## Root cause, corroborated from dsd's own commit history

`git log v0.11.0..v0.12.0` (upstream `AetiasHax/ds-decomp`) contains, among others:

```
a445230 init: Search for functions between build info and main
        Hybrid solution alongside f06a61a
f06a61a init: Use address of main function as starting point for ARM9 function search
        Some games have a BuildInfo that inserts a function between the nitrocodes
        and the library version strings, which messed with the version string
        detection in ds-rom.
6669fea init: Thumb jump table case with large tables
204666c fix: Exclude PC offset on Thumb jump tables dispatched by `bx`
0aeb268 init: Disregard final return if long branch within function
a85f408 init: Clear LSB in labels
        Unsure why this happens, but it sometimes led the analyzer to read
        instructions misaligned (1-byte boundary instead of 2 or 4).
fef88db dis: Fix 2-aligned Thumb BLX having the wrong destination
```

These are direct changes to `init`'s function-search and jump-table analysis — exactly the
mechanism that would find 52 previously-missed functions in ov000 and clear 102 "no functions
found" warnings. This is not a mysterious regression; it's dsd getting measurably better at a
hard analysis problem, landing squarely in the version range this project hasn't picked up yet.

## Carried items

**dsd v0.11.0 `dis` panic — still present, unfixed, at v0.12.0.** Same repro
(`./dsd dis --config-path config/eur/arm9/config.yaml --asm-path <out>`):

```
thread 'main' (354534) panicked at cli/src/cmd/dis.rs:283:44:
index out of bounds: the len is 640 but the index is 640
stack backtrace:
   0: __rustc::rust_begin_unwind
   1: core::panicking::panic_fmt
   2: core::panicking::panic_bounds_check
   3: <ds_decomp_cli::cmd::dis::Disassemble>::dump_bytes
   4: <ds_decomp_cli::cmd::dis::Disassemble>::run
   5: dsd::main
```

Same message as v0.11.0's crash, just shifted from `dis.rs:267` to `dis.rs:283` (intervening
line changes, not a different bug) — confirmed via `RUST_BACKTRACE=1`, culprit narrowed to
`Disassemble::dump_bytes`. Not a second adoption argument; still worth the upstream issue
already tracked as a background task after #1512 (not re-flagged here to avoid a duplicate).

**m2c `MagicFuncPattern` assert on post-link `bl symbol+offset` targets** — pre-existing,
identical on both pins, already documented in `docs/research/q-toolchain-repin-eval.md` and
restated in `docs/research/cm-toolchain-adopt-1.md`. No action this round, noted for visibility
only per the dispatch.

## Why the full gate was not run

The dispatch was explicit: *"CANARY — this is the cheap half and it comes BEFORE the 40-minute
gate... If that one module already drifts, you have your finding without spending a full
gate — paste the diff, report it, and stop there."* Two modules drift with real, large,
non-cosmetic boundary shifts, corroborated at the log level, the symbol level, and against
dsd's own commit history. Running `gate3.py --scope all` from here would either (a) fail to
configure cleanly against the shifted boundaries without first reconciling the whole config
tree, or (b) require doing that reconciliation work first — which is the real adoption cost
this finding identifies, not a 40-minute verification step. Spending the gate now would not
have produced a different answer, only a slower one.

**Delink-ref audit: performed, not skipped — result is drift.** The full recursive diff above
(21 of 82 generated files differ, 2 with real `.text`/`.rodata` boundary moves) *is* the
delink-ref audit for this bump. Stated explicitly per the gate instructions: **drift found, not
auto-accepted.**

## `python3.13 -m pytest -q tests`

Run on the actual PR branch (`claude-scaffolder-queue`, `claude/cm-toolchain-adopt-2`). First
run, taken *before* regenerating `docs/research/README.md`:

```
FAILED tests/test_generate_research_index.py::TestCommittedIndexIsCurrent::test_committed_index_matches_regeneration
1 failed, 3280 passed, 3 skipped, 72 subtests passed in 232.52s (0:03:52)
```

Expected and self-explanatory — this test checks the committed index against a fresh
regeneration, and this doc had just been added without regenerating it yet (the dispatch's own
"regenerate `docs/research/README.md` LAST" ordering). Re-ran after regenerating (see below):

```
3281 passed, 3 skipped, 72 subtests passed in 206.46s (0:03:26)
```

Green.

## `git diff --stat` (this PR)

```
 docs/queue/claude-scaffolder.md       |   2 +-
 docs/research/README.md               |   1 +
 docs/research/cm-toolchain-adopt-2.md | 279 ++++++++++++++++++++++++++++++++++
 3 files changed, 281 insertions(+), 1 deletion(-)
```

No toolchain pin file appears — `tools/configure.py`'s `DSD_VERSION` stays `v0.11.0` on this
branch, exactly as a DECLINE verdict should leave it. The v0.12.0 bump only ever existed in the
now-removed scratch worktree.
