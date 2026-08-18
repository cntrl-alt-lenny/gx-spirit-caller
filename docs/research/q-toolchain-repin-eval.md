[//]: # (markdownlint-disable MD013 MD041)

# q-toolchain-repin-eval — toolchain pin evaluation (m2c / decomp-permuter / dsd)

**Item:** `q-toolchain-repin-eval` (scaffolder, effort MEDIUM, **evaluation only** — no pin
actually changed on `main` in this PR). Seeded by an external audit: our pins had drifted
2-4 months from upstream on all three tools.

**Layer correction carried from the brief:** upstream m2c epilogue work cannot subsume the
project's `.legacy` / `.legacy_sp3` compile-tier routing — routing picks which mwcc compiles
a TU so the shipped bytes match; m2c is draft generation for the cold-RE track only. Evaluated
strictly on that basis throughout.

## Verdict summary

| Pin | Current → candidate | Verdict | Basis |
|---|---|---|---|
| m2c | `ce052171` → `19f2ddb2` | **ADOPT** | Real draft-quality fix on 3/8 live panel functions, zero build risk (draft-generation only, not build-affecting) |
| decomp-permuter | `efc5c5e7` → `27952473` | **DECLINE** (no evidence either way) | Live wall-case run proven blocked by a real prerequisite gap (see below); vendor test suite shows zero regression |
| dsd | `v0.11.0` → `v0.12.0` | **NOT ATTEMPTED** | In scope after m2c showed value, but the shared wine lane was mid-gate from the concurrent Decomper round at execution time |

No pin file was modified: `tools/m2c_bootstrap.py`'s `M2C_COMMIT`, `tools/permute.py`'s
`PERMUTER_PINNED_COMMIT`, and `tools/configure.py`'s `DSD_VERSION` are all unchanged on this
branch. All bump testing happened against scratch clones and one gitignored vendor checkout
that was restored to the committed pin afterward (see **Methodology** below).

## Methodology

- m2c is vendored (gitignored) at `tools/_vendor/m2c`; the committed pin lives in
  `tools/m2c_bootstrap.py`'s `M2C_COMMIT`. Bumped it *locally only* by checking out the new
  commit directly inside that gitignored directory (never editing the constant), regenerated
  drafts, then restored the checkout to the committed pin.
- decomp-permuter is likewise vendored (gitignored) at `tools/_vendor/decomp-permuter`, pinned
  by `tools/permute.py`'s `PERMUTER_PINNED_COMMIT`. Used the tool's own `--permuter-path`
  override to point at two independent scratch clones (old pin / new pin under
  `/private/tmp/.../scratchpad/repin-eval/`) instead of touching the committed constant.
- Both upstream repos are reachable from this machine (`git ls-remote` verified for m2c;
  confirmed HEAD = `19f2ddb22dcf5161c27b7eae62f142e697ae895f`, matching the brief exactly).

## 1. m2c bump (`ce052171` → `19f2ddb2`) — ADOPT

### Confirmed upstream delta

8 commits touch ARM support between the two pins (not 3 — the brief's "three ARM commits
landed 2026-08-10" undercounts; there are 5 earlier ARM commits too):

```
13405ef arm: fix PopAndReturnPattern
eb7f7d2 Make Label hashable
80d61ae sh2: don't unify shll inputs with u32
40cbae3 arm: fold xor by 1 to negation
7b50f4d arm: add test for vpush/vpop/vldr/vstr
5ecc9f6 arm: recognize low float registers
8440942 arm: vldr, vstr
776d9c6 arm: handle vpush/vpop
b7d4c1b arm: normalize vstm/vldm to vpush/vpop
```

`m2c.py --help` is otherwise unchanged for our invocation (`-t arm-mwcc-c` still valid on
both; the new `--visualize-format` flag and expanded target-inference text are unrelated).

### Canary (baseline at the current pin, before any bump)

Required by the brief before touching anything. `func_ov004_021dc474` (a currently-live gap
function) at `m2c ce052171`:

```c
s32 func_020b3870(s32, s32);                        /* extern */
s16 func_ov004_021dbd6c(u16);                       /* extern */
s32 func_ov004_021dbd84(s32);                       /* extern */
? func_ov004_021dbe68(void *, ? *, s16, s32);       /* extern */
extern ? data_ov004_02291630;

s16 func_ov004_021dc474(void *arg0) {
    s16 temp_r4;
    s16 temp_r7;
    void *temp_r4_2;

    arg0->unk0 = (s8) data_ov004_02291630.unk19;
    arg0->unk1 = 1;
    temp_r4 = (s16) data_ov004_02291630.unk4;
    func_ov004_021dbe68(arg0 + 6, data_ov004_02291630.unk0, temp_r4);
    arg0->unk2 = func_ov004_021dbd6c((u16) temp_r4);
    temp_r7 = func_020b3870((s16) (temp_r4 + 6) + 1, 2) * 2;
    arg0->unk4 = func_ov004_021dbd6c((u16) temp_r7);
    temp_r4_2 = arg0 + temp_r7;
    *(arg0 + temp_r7) = 0x60;
    temp_r4_2->unk1 = 0;
    temp_r4_2->unk4 = func_ov004_021dbd6c();
    func_ov004_021dbe68(temp_r4_2 + 6, &subroutine_arg0, 4, func_ov004_021dbd84(0xE));
    temp_r4_2->unk2 = func_ov004_021dbd6c(4U);
    return (s16) (temp_r7 + 0xA);
}
```

Pipeline works at the current pin — proceeded to the full panel.

### Doc-staleness finding (important, changes the panel composition)

The brief asked for a panel drawn from historical cold-RE docs including 2 Style A/B epilogue
exemplars and 1 pool-literal mis-resolution case. Every one of those 4 named exemplars
(`func_0207cbbc`, `func_020a1e3c`, `func_020458d8`, `func_ov004_021dd374`), plus 3 of the 4
general cold-RE draft targets the survey found, **have since been matched** by later work —
`m2c_feed.py` refuses them outright ("matched functions are not in gap objects"). Only
`func_ov004_021dc474` from the original 8-function candidate list is still live today.

A full live census (`objdump -t` over every `_dsd_gap@*.o` in the EUR build) found the true
current pool: **30 unmatched functions project-wide** — 18 in ov004, 10 tiny ITCM stubs, and 4
single-function overlay-swap residues (`ov001`/`ov003`/`ov014`/`ov019`, each sharing a base
address with a sibling overlay). This project is materially closer to done than the historical
docs suggest, at least at the function-count level; worth a headline update somewhere in the
campaign tracking if not already known.

I tried one workaround to still exercise the named epilogue/pool-literal shapes: feeding m2c
the *post-build* compiled object for a matched function via `m2c_feed.py`'s `--obj` override
(which does work as a resolution mechanism). It produced a `bl OS_DisableIrq+0x8`-style
symbol+offset branch target that **crashes m2c's `MagicFuncPattern` with an `AssertionError`
identically on both pins** (`arch_arm.py:982` old / `:998` new — same assert, shifted only by
intervening lines). Reproduced on both clones to confirm it's a pre-existing input-quality
limitation of feeding post-link objects, not a version-dependent regression, then abandoned
that approach in favor of a panel built entirely from genuinely live gap functions.

### Rebuilt panel (8 functions, all currently live/unmatched, region eur)

| Function | Module · size | Natural epilogue (from real `.s`) |
|---|---|---|
| `func_ov004_021dc474` | ov004 · 0x8c | `pop {r3}; bx r3` |
| `func_ov004_021dc0ac` | ov004 · 0x3c | (data-only tail, no branch-return in last lines) |
| `func_ov004_021dd648` | ov004 · 0xaec (largest live gap) | (data-only tail) |
| `func_01ff8180` | itcm · 0x58 | `bx r0` |
| `func_01ff8624` | itcm · 0x40 | `ldmfd sp!, {lr}; bx lr` (Style-A-like, separated) |
| `func_ov001_021c9d60` | ov001 · 0x1c4 (overlay-swap residue) | `pop {r3, pc}` (Style-B, fused) |
| `func_ov014_021b2280` | ov014 · 0x330 (overlay-swap residue) | `pop {r3, pc}` (Style-B, fused) |
| `func_ov004_021dcbcc` | ov004 · 0x22 (smallest live gap) | `pop {r4, r5}; bx lr` (Style-A-like, separated) |

No live function with a literal-pool mis-resolution matching the historical case was found;
noting this as a real coverage gap in this evaluation rather than fabricating one.

### A/B diffs (old pin → new pin, `--m2c`, no `--context`)

5 of 8 produced byte-identical drafts (`func_ov004_021dc0ac`, `func_ov004_021dd648`,
`func_01ff8624`, `func_ov001_021c9d60`, `func_ov004_021dcbcc`) — pasting the 3 that differ:

```diff
--- func_ov004_021dc474.old.c
+++ func_ov004_021dc474.new.c
@@ -1,10 +1,11 @@
 s32 func_020b3870(s32, s32);                        /* extern */
 s16 func_ov004_021dbd6c(u16);                       /* extern */
 s32 func_ov004_021dbd84(s32);                       /* extern */
-? func_ov004_021dbe68(void *, ? *, s16, s32);       /* extern */
+? func_ov004_021dbe68(void *, s32 *, s16);          /* extern */
 extern ? data_ov004_02291630;

 s16 func_ov004_021dc474(void *arg0) {
+    s32 sp0;
     s16 temp_r4;
     s16 temp_r7;
     void *temp_r4_2;
@@ -20,7 +21,8 @@
     *(arg0 + temp_r7) = 0x60;
     temp_r4_2->unk1 = 0;
     temp_r4_2->unk4 = func_ov004_021dbd6c();
-    func_ov004_021dbe68(temp_r4_2 + 6, &subroutine_arg0, 4, func_ov004_021dbd84(0xE));
+    sp0 = func_ov004_021dbd84(0xE);
+    func_ov004_021dbe68(temp_r4_2 + 6, &sp0, 4);
     temp_r4_2->unk2 = func_ov004_021dbd6c(4U);
     return (s16) (temp_r7 + 0xA);
 }
```

```diff
--- func_01ff8180.old.c
+++ func_01ff8180.new.c
@@ -1,5 +1,4 @@
 extern ? OSi_IrqCallbackTable;
-extern ? func_01ff81d8;

 void func_01ff8180(void) {
     s32 temp_r0;
```

```diff
--- func_ov014_021b2280.old.c
+++ func_ov014_021b2280.new.c
@@ -33,6 +33,8 @@
 extern ? data_ov014_022350f4;

 s32 func_ov014_021b2280(void) {
+    ? sp0;
+
     func_02094504(0xC0, 0x07000000, 0x400);
     func_02094504(0xC0, 0x07000400, 0x400);
     func_02094504(0, 0x05000000, 0x400);
@@ -80,8 +82,8 @@
     }
     func_0200197c(4, &data_ov014_021b5088, 0x80000);
     func_02001d68((u32) (data_02104f4c.unk4 << 0x1D) >> 0x1D);
-    func_02001bc8(&subroutine_arg0, 0x7FFF, 0x810);
-    func_02094550(&subroutine_arg0, 0x05000400, 0x20);
+    func_02001bc8(&sp0, 0x7FFF, 0x810);
+    func_02094550(&sp0, 0x05000400, 0x20);
     func_0208c884(0x0400006C, -0x10);
     func_0208c884(0x0400106C, -0x10);
     if (data_ov014_021b5040.unk44 == 0) {
```

### Analysis

Both real diffs are the same fix class: the old pin invents a nonsense `&subroutine_arg0`
placeholder for a stack slot passed by reference to a callee, and — in the `021dc474` case —
gets the callee's **arity wrong** (`func_ov004_021dbe68` drafted with 4 params instead of the
real 3, silently dropping the by-reference relationship between the last two arguments). The
new pin materializes a real, named stack local (`sp0`) and gets the call signature right. This
isn't cosmetic: a decomper hand-fixing the old draft would be debugging a phantom parameter.
The `func_01ff8180` diff is a minor hygiene win (drops an unreferenced spurious extern). None
of the 3 changed functions' differences are about epilogue shape specifically, despite 2 of
them being fused-epilogue (Style B) functions — the fix is about stack-argument materialization,
which is plausibly explained by the vpush/vpop/vldr/vstr commits in the delta rather than the
named PopAndReturnPattern fix.

**Verdict: ADOPT.** m2c output feeds `m2c_feed.py`'s draft only — never touches the build graph
— so the downside of adopting is zero; the upside is a real, reproducible correctness
improvement on 2/8 sampled live functions (25%), which over the current 30-function live pool
is a meaningful expected win for the cold-RE track. Recommend bumping `M2C_COMMIT` in
`tools/m2c_bootstrap.py` to `19f2ddb22dcf5161c27b7eae62f142e697ae895f` as a follow-up adoption
item (not this PR).

## 2. decomp-permuter bump (`efc5c5e7` → `27952473`) — DECLINE (no evidence either way)

### Confirmed upstream delta

Exactly the 3-commit `perm_var_cond_block` sequence the brief named:

```
6c8b32f Don't duplicate complex statements in perm_var_cond_block
f888fb3 Fix expr dedup for perm_var_cond_block and adjust weights
5583a94 Add perm_var_cond_block rule (#160)
```

### Candidates (with a stale-doc correction of our own)

`codegen-walls.md`'s P-11 re-audit (`brief-678-wall-reaudit-p11-p16.md`) lists 3 functions as
"genuinely remain unmatched," each with a non-matching `.c` draft already sitting in `src/` —
they looked like ideal candidates. Cross-checking `git log` showed all 3 were actually **shipped
as matched C on 2026-07-25** (commits `879210a49`, `5b5d1547f`, `e8d2969ea`); the wall doc never
looped back. Excluded them and used the verified-still-open replacements:

| Candidate | Module · size | Doc characterization | Prior permuter history |
|---|---|---|---|
| `func_ov002_02200084` | ov002 · 0x3c | C-39 residue / P-11-class register-*choice* plateau | Never run with `tools/permute.py` |
| `func_02024574` (E-12) | main · 0x74 | P-11 flagship — register-choice plateau | **Already run** (brief 198): 3 variants, 120s×4 threads, plateaued at score 480, never reached 0 |
| `func_0207db8c` | main · 0x6c | P-12 — permanent, "budget zero ships" | Never run with `tools/permute.py` (falsified via 45 hand-compiled source/tier combos instead) |

`func_02024574` is the strongest candidate (real prior permuter history at the *current* pin to
compare against) and is where the rest of this evaluation focused.

### Prerequisite blocker (proven by direct experiment, not inferred)

All 3 candidates are registered in `delinks.txt` as `.s` TUs, not `.c`:

```
src/main/func_02024574.s:
    .text start:0x02024574 end:0x020245e8
```

`tools/permute.py func_02024574 --print` confirms: `Source TU: src/main/func_02024574.s
[exists]`. `--run`'s source-resolution (`tu_containing()`) doesn't check file type, so it would
hand this `.s` to `import.py` as if it were C.

Traced the failure past that assumption to its actual root cause by driving `import.py`
directly (bypassing `tools/permute.py`'s delinks.txt-based path resolution, reusing its real
`normalize_disasm_for_permuter()` / `strip_compile_sh_ampersand()` / `run_permuter()` helpers
and its real brief-096 vendor patches, applied via `patch_permuter_vendor()` to both scratch
clones): even given an explicit, valid starting `.c` (the existing, unwired
`docs/research/c-match-prep/02024574.c` campaign-prep candidate) and a freshly generated target
disassembly (via `./dsd dis`, run to a scratch output directory), `import.py` fails with
**"Can't find root dir of project!"** — even with `--settings` pointed explicitly at the
project's `permuter_settings.toml`. Root cause: `import.py` derives the actual compile command
via the project's **ninja graph** (`ninja -t commands`), which has no rule for compiling this
address as C, because `delinks.txt` registers it as `.s`. There is no flag-level workaround —
making any of these 3 candidates truly runnable requires retitling its `delinks.txt` TU from
`.s` to `.c` (with a compiling seed source), which is real carve-scope work, is exactly what
the concurrent C-match campaign lanes do, and is out of scope for an evaluation-only branch
overlapping a live Decomper worktree this round.

Incidentally hit a real, reproducible **dsd v0.11.0 bug** while generating the target
disassembly: `./dsd dis --config-path config/eur/arm9/config.yaml --asm-path <scratch>` panics
partway through (`cli/src/cmd/dis.rs:267:44: index out of bounds: the len is 640 but the index
is 640`) — after successfully writing our target function's `.s`, so it didn't block this
evaluation, but it's a real defect worth its own report (unrelated to the v0.12.0 question,
present at the currently-shipped v0.11.0).

### Test-suite parity check (real signal, though not a wall-crack)

Since a live wall-case run wasn't achievable without the delinks.txt prerequisite, ran
decomp-permuter's own bundled test suite (`python -m unittest discover -s test/`, the project's
documented runner) at both pins, patched identically with our real brief-096 patches:

```
=== OLD pin (efc5c5e7) ===
Ran 25 tests in 0.677s
FAILED (failures=16)

=== NEW pin (27952473) ===
Ran 25 tests in 0.498s
FAILED (failures=16)
```

`diff` of the full per-test pass/fail listing between pins is **empty** — byte-identical
outcome. All 16 failures are the same root cause at both pins (`test/compile.sh: line 2:
mips-linux-gnu-gcc: command not found` — the vendor suite's generic MIPS-target tests need a
cross-compiler this machine doesn't have installed; unrelated to our ARM/mwcc usage). The 9
tests that don't need that compiler (the typedef-deduplication suite) pass identically at both
pins.

### Verdict

**DECLINE — no evidence either way, not a regression.** No wall was cracked because no live
wall-case run was achievable within this evaluation's scope; the bump introduces zero detected
regression in what is testable (identical vendor test results, both scratch clones patch and
import equally well up to the delinks.txt wall). Per brief 403's standing rule, the adoption
bar for permuter is cracking a documented wall case, not "upstream is newer" — that bar was not
met, but it was also never actually tested against a live case, so this should not be read as
"the new mutation doesn't help." **Recommend as a real follow-up** (decomper-scope, not
scaffolder-scope): retitle `func_02024574`'s `delinks.txt` TU to `.c` with the existing
`docs/research/c-match-prep/02024574.c` candidate as the seed, then re-run this same probe at
both pins — that would be the first *actual* apples-to-apples wall-crack test either pin has
had.

## 3. dsd bump (`v0.11.0` → `v0.12.0`) — NOT ATTEMPTED (blocked by contention)

Per the brief's gating, item 3 proceeds only if item 1 or 2 showed value — item 1 (m2c) did, so
this was in scope by the time item 1 finished. `DSD_VERSION = 'v0.11.0'` in
`tools/configure.py:74` flows straight into a tag-based GitHub release download in
`tools/download_tool.py` (no separate hash pin), so the bump itself would be a one-line change
in a dedicated worktree.

Before attempting the full 3-region gate this requires, checked the Mac contention rule:

```
$ pgrep -fl 'mwcc|mwld|mwasm|ninja'
1176 ninja sha1
<dozens of live mwccarm.exe / wine rows under claude-decomper-batch1/.wine-lane>
```

The CC Decomper's consolidated `--clean` 3-region gate was actively compiling at check time —
not idle, not a stale process. Per the brief's own instruction ("a reported blocked item beats
a rushed gate"), did not wait on an indeterminate-length live gate or risk wineserver
contention across worktrees. **No dsd files were touched; nothing to revert.** This item is
still open — retry when the shared wine lane is free.

## Incidental findings (out of scope for the pin questions, worth flagging separately)

1. **dsd v0.11.0 `dis` subcommand panics** on a full-ROM disassembly (`index out of bounds` at
   `cli/src/cmd/dis.rs:267:44`) — reproducible, present at the currently-shipped version,
   unrelated to the v0.12.0 evaluation.
2. **m2c's `MagicFuncPattern` asserts on `bl symbol+offset` branch targets** (identically on
   both pins) — surfaces only when feeding m2c a post-link compiled object instead of a
   pre-link gap object; not encountered in normal `m2c_feed.py` usage, but worth knowing if
   anyone tries to feed m2c an already-matched function's object directly in the future.
3. **Only 30 unmatched functions remain project-wide** as of this check (18 ov004, 10 ITCM, 4
   overlay-swap residues) — 7 of 8 functions named in cold-RE m2c panel docs and all 3 of the
   P-11 re-audit's "still open" permuter candidates have already been matched by work not yet
   reflected in those docs. The project is closer to function-level completion than the
   historical doc trail suggests.

## `git diff --stat` (this PR)

```
 docs/research/README.md                 |   1 +
 docs/research/q-toolchain-repin-eval.md | 372 ++++++++++++++++++++++++++++++++
 2 files changed, 373 insertions(+)
```

Two files: this doc, and the one-line README index entry it generates. No pin file
(`tools/m2c_bootstrap.py`, `tools/permute.py`, `tools/configure.py`) appears — confirmed both
before writing this doc (clean preflight tree) and here, immediately before committing.
