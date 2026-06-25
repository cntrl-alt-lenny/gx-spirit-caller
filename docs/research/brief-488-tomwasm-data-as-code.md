[//]: # (markdownlint-disable MD013 MD041)

# Brief 488 — to_mwasm tooling lever: data-as-code coprocessor/svc gap + EUR verify-fail census

**Brief:** 488 (scaffolder), low-I/O tooling lane. Pull the EUR verify-fail list,
autopsy the `to_mwasm` gap, extend `tools/asm_escape.py`, ship the unblocked `.s`
+ the fix. Build-light so it runs without contending with the decomper's carve.

## Headline — found + fixed a real `to_mwasm` gap class; but the EUR verify-fail tier is already DRAINED

Two results, both important:

1. **TOOL FIX (shipped):** `asm_escape.py` now emits a byte-exact `.word` for the
   **data-as-code coprocessor / svc / unprivileged-transfer** class that objdump
   produces from embedded data tables and mwasmarm's legacy assembler can't parse.
   + a unit test (`TestDataAsCode`, 3 cases; full suite 50/50 green).
2. **FINDING (the brief's premise is stale):** the EUR verify-fail tier the brief
   targeted (~52 funcs, from the brief-472 census) is **already drained** by the
   prior `to_mwasm` fixes (objdump-`-z`, stm/ldm-ia, ldr/str cond-reorder, b477
   size-overrun, …). An authoritative re-census found **0 verify-fail** and only
   **2 ASMFAIL** across the entire current EUR residue — and those 2 are **data
   blobs**, not a `to_mwasm` gap (below). **0 EUR funcs are cleanly unblocked**, so
   this PR ships the tool, not `.s`.

## The gap class (autopsy)

`func_020b2d2c` / `func_020b3c78` (main) failed to **assemble**. mwasmarm rejected,
line-for-line identically in both, an embedded table objdump rendered as:

```text
ldc2l 15, cr15, [lr, #0x3fc]!     Invalid coprocessor ID - expecting p0 - p15
cdple 15, 13, cr13, cr15, cr0, {7}
stclgt 14, cr12, [lr, #0x33c]
svclt 0x00bfc0c0
ldrtlt fp, [r5], #0x5b6 / strtge sl, [r6], r7, lsr #0xf
mrcls 14, 4, r9, cr14, cr15, {4}
```

objdump prints bare coproc id `15` (mwasmarm wants `p15`), `crN` (wants `cN`), `{N}`
Op2 (wants bare `N`), and `<op><cond>`/`<op><L>` orderings the legacy assembler
can't take. The existing handler covered only **non-conditional MCR/MRC**; this
whole family (`ldc/stc/cdp(+2)(+l)(+cond)`, `svc(+cond)`, `ldrt/strt(+cond)`,
**conditional** `mcr/mrc`) was unhandled.

## The fix

`tools/asm_escape.py`: a `_DATA_AS_CODE_RE` + an emitter check that emits the raw
encoding as `.word 0x<bytes>` for that family (mirrors the existing fixed-address-
branch `.word` fallback). This is **byte-exact by construction** and correct,
because these ops are **never genuine** in this ARM9 game (no FPU/SVC) — they only
appear when objdump disassembles a const/jump-table embedded in a `kind:function`.
Genuine non-conditional CP15 `mcr`/`mrc` (cache/MMU) still translate via `to_mwasm`.
**No regression risk:** `.word` reproduces the exact bytes, so any func that passed
before still passes; the change only affects the previously-un-assemblable cases.

## Why the 2 funcs still don't carve — they are DATA BLOBS (a deeper, separate lever)

With the fix they now **assemble**, but they don't byte-**verify**: the table also
contains words objdump renders as bogus `beq/bmi/bge` **branches** whose targets
shift on re-assembly (5 of 7 diffs), plus dsd delink-placeholder words
(`f9fafbfc`, `f5f6f7f8`, … decrementing by 0x04040404). Two *different* functions
sharing this identical word stream confirms it is a **shared data table**, not
code. Carving these needs a **whole-function-as-data** path (emit every word as
`.word`, bypassing instruction disassembly) — a distinct tooling lever, flagged
for follow-up. The `to_mwasm` fix is necessary but not sufficient for them.

## Forward value — this helps USA/JPN (the brief's "same tool" point)

The same coprocessor/svc data tables exist in the **USA/JPN overlays** now being
carved (brief 486). Before this fix they would **ASMFAIL** there; now they emit
clean `.word`s. So the lever's payoff is on the fresh USA/JPN vein, not the
already-drained EUR tier.

## EUR residue census (authoritative — `.text start:` based, build refreshed)

**120 uncarved EUR funcs** (main 64 + overlays 56). Probed with the fixed tool:

| outcome | n | note |
|---|---:|---|
| REFUSE | ~68 | bytepack / argpack / `kind:data` — clean-C / permuter levers |
| PASS | 9 | **carveable now** — all `main`; clean residue (flagged for the decomper) |
| ASMFAIL→data-blob | 2 | `func_020b2d2c`, `func_020b3c78` — whole-func-data lever |
| CARVED/other | ~41 | already-matched noise from semantic-named carves |

**0 verify-fail, 0 remaining ASMFAIL.** The EUR mechanical/tooling `.s` tier is
effectively closed; the remaining closeout work is clean-C (REFUSE tier) + the 9
carveable PASS + the 2 data-blobs.

## Gate

The tool change is **build-neutral** (`asm_escape.py` is a dev tool, not in the
ninja graph or CI build), so it cannot affect any region's `ninja sha1`; no `.s`
shipped. Validated by the unit suite: **50/50 green** (3 new `TestDataAsCode`).

## Files

`tools/asm_escape.py` (+ `_DATA_AS_CODE_RE` + emitter `.word` fallback);
`tests/test_asm_escape.py` (+ `TestDataAsCode`). No `.s` / config / build change.

🤖 Generated with [Claude Code](https://claude.com/claude-code)
