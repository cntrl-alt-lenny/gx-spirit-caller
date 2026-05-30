# First-wave wall — C-23 MMIO/register-base folding expansion

**Brief:** 199 (scaffolder). C-23 has been a recipe-resolved wall
since brief 086 (`.legacy.c` routing for the DS hardware divider
`func_0208bde0`). Brief 193 (PR #640) skipped pick #5
(`func_02096434`) as "StyleA + C-23 stacked"; brief 199 picks
that up, demonstrates the C-23 recipe also applies to picks
*outside* the brief 086 `0x04000xxx` MMIO range (DTCM kernel
block at `0x027ffc00`, duplicate pool refs, clustered pool
windows), ships pick #5 as a worked example, and extends
`tools/predict_walls.py` so the classifier flags the broader
C-23 cohort.

## The brief 086 recipe — still the right answer

> mwcc 2.0/sp1p5 has a base-folding peephole that consolidates
> 3+ separate `ldr rN, =0x04000xxx` MMIO pool loads into a single
> `ldr base; ldr/str [base, #offset]` form. mwcc 1.2/sp2p3 lacks
> the peephole and emits per-MMIO `ldr` instructions matching the
> orig. Route through `*.legacy.c` (mwcc 1.2/sp2p3) — no source
> change needed.

`func_0208bde0`, `func_0208e61c`, `func_0208e664`, etc. all
shipped via this recipe. Brief 088 verified across 5 C-source
variations × 15 mwcc SPs that `1.2/sp2p3` is the canonical
routing tier.

## Brief 199 expansion — signal beyond `0x04000xxx`

Pick #5 (`func_02096434`, 0x6c bytes) doesn't have any
`0x04000xxx` pool word. Its pool is:

- `0x021a8288` — main-module BSS array (`data_021a8288`).
- `0x027ffc00` — DTCM kernel block top, where the NDS OS keeps
  IRQ state, callback tables, work area.

But the function still hits the C-23 wall: two separate `ldr
r3, =0x027ffc00` loads, one per if/else branch. mwcc 2.0/sp1p5
would fold these into a single base load before the cmp; mwcc
1.2/sp2p3 reloads per branch.

The original brief 086 detector keyed on `0x04000xxx` pool
literals — brief 199 expands to capture:

1. **Main MMIO** (`0x04000xxx`) — brief 086's original signal.
2. **DTCM kernel block** (`0x027ff[c-f]xx`) — top 1 KB of DTCM
   where NDS NitroSDK keeps IRQ state, callback tables, and OS
   work area.
3. **Duplicate pool ref** — same `@ 0xADDR` referenced by 2+
   `ldr` instructions in the function body. mwcc 2.0 always
   folds these; presence of duplicates means the function was
   built with 1.2/sp2p3.
4. **Clustered pool** — 3+ distinct pool targets within ±0x20
   bytes of each other. The classic "struct fields read as
   separate pool words" shape; mwcc 2.0 base-folds, 1.2/sp2p3
   keeps separate slots.

Any one signal is sufficient — they all point to the same
`.legacy.c` recipe.

## Worked example — pick #5 (`func_02096434`)

### Orig disasm

```text
push  {r4, r5, lr}
sub   sp, sp, #0x4
mov   r4, r0                       ; r4 = slot
mov   r5, r1                       ; r5 = value
bl    OS_DisableIrq                ; mask in r0, preserved through body
ldr   r1, .L_SLOT_TABLE            ; r1 = &data_021a8288
cmp   r5, #0
str   r5, [r1, r4, lsl #2]         ; slot_table[slot] = value
beq   .L_clear

.L_set:
  ldr   r3, .L_KERNEL_BLOCK_A       ; r3 = 0x027ffc00  ← FIRST  pool load
  mov   r1, #0x1
  ldr   r2, [r3, #0x388]
  orr   r1, r2, r1, lsl r4          ; r1 |= (1 << slot)
  str   r1, [r3, #0x388]
  b     .L_restore

.L_clear:
  ldr   r3, .L_KERNEL_BLOCK_B       ; r3 = 0x027ffc00  ← SECOND pool load
  mov   r1, #0x1
  mvn   r1, r1, lsl r4              ; r1 = ~(1 << slot)  (1.2/sp2p3
                                    ;     inline-shift peephole;
                                    ;     mwcc 2.0 emits `bic`)
  ldr   r2, [r3, #0x388]
  and   r1, r2, r1
  str   r1, [r3, #0x388]

.L_restore:
  bl    OS_RestoreIrq               ; r0 still holds mask (no clobber
                                    ;     between OS_DisableIrq and here)
  add   sp, sp, #0x4
  ldmfd sp!, {r4, r5, lr}
  bx    lr
```

`.L_KERNEL_BLOCK_A` and `.L_KERNEL_BLOCK_B` BOTH point at the
same pool word (`0x027ffc00`) — that's the duplicate-pool-ref
signal.

### Failed naive C

```c
*(int *)(0x027ffc00 + 0x388) |= (1U << slot);
*(int *)(0x027ffc00 + 0x388) &= ~(1U << slot);
```

…compiles (with `.legacy.c` routing) to:

```text
ldr r3, [pc, #N]      ; r3 = 0x027fff88   ← single pool word!
ldr r2, [r3]          ; no offset
...
```

mwcc 1.2/sp2p3 constant-folds `0x027ffc00 + 0x388` at the C-
expression level, BEFORE any peephole pass runs. The resulting
pool word is `0x027fff88` (the full computed address) and the
load uses `[r3]` with no offset. Orig has two `0x027ffc00`
pool words and `[r3, #0x388]` loads.

Constant folding happens regardless of mwcc tier — it's part
of expression evaluation, not a peephole. Changing the routing
tier doesn't unfold the source.

### Working C — keep the base separate

```c
volatile int *block = (volatile int *)0x027ffc00;
if (value != 0) {
    block[226] = block[226] | (1U << slot);   /* 226 * 4 = 0x388 */
} else {
    block[226] = block[226] & ~(1U << slot);
}
```

`block[226]` compiles to `ldr/str [r3, #904]` with `r3` holding
the base `0x027ffc00`. The two branches each materialise the
base separately (no fold across the cmp). mwcc 1.2/sp2p3 emits
the matching `ldr r3, =0x027ffc00; ldr r2, [r3, #0x388]`
sequence both times.

Verified byte-identical to orig — 3-region `ninja sha1` PASS.

### Why `volatile int *` and not `int *`

`volatile` prevents mwcc from optimising the second branch's
load by reusing the value loaded in the first branch. Without
`volatile`, mwcc might decide the load result hasn't changed
and skip the second `ldr` — that would diverge from orig in a
different way. `volatile` matches the semantics anyway: the
backing memory at `0x027fff88` is OS-modified state, not
program-managed.

(The brief 086 recipe also uses `vu16 *` / `vs32 *` for the same
reason — MMIO state is inherently volatile.)

## Why this stacks cleanly with StyleA

Pick #5's prologue/epilogue:

- `sub sp, sp, #0x4` (stack scratch slot) — sub-sp prologue.
- `add sp, sp, #0x4; pop {regs, lr}; bx lr` — Style A epilogue
  (no `pc` in pop; separate `bx lr`).

The mixed sub-sp + Style A shape comes naturally from mwcc
1.2/sp2p3 for functions whose call layout needs a stack
scratch. Brief 086's worked example (`func_0208bde0`) has
the same hybrid shape. The C-23 + StyleA combo isn't a
"stack" of two distinct walls — it's the natural shape mwcc
1.2/sp2p3 emits, and routing through `.legacy.c` resolves
both at once.

## Classifier extension — `tools/predict_walls.py`

The existing C-23 detector (brief 189) required `pc_loads >= 3`
AND a `0x04000xxx` MMIO literal. Brief 199 broadens to:

```python
pc_loads >= 3 AND (
    mmio_lits >= 1                  # main MMIO (0x04000xxx)
                                    # OR DTCM kernel (0x027ff[c-f]xx)
    OR duplicate_refs >= 1          # same @ pool target ≥ 2 ldr
    OR clustered_pool               # 3+ targets in a ±0x20 window
)
```

Pool words are extracted from the hex column of objdump output
(works whether objdump runs in `-D -b binary` mode or `-d` on
the linked `.o`). The `@ 0xADDR` annotation in `ldr [pc, ...]`
lines drives the duplicate-ref + clustered-pool checks.

Real-corpus smoke (against EUR config):

```bash
$ python tools/predict_walls.py --version eur --module main --address 0x02096434 --size 0x6c
  C-23: 3 pc-relative loads + literal(s): 1 DTCM kernel (0x027ffxxx); 1 duplicate pool ref(s) — `.legacy.c` routing

$ python tools/predict_walls.py --version eur --module main --address 0x0208bde0 --size 0x58
  C-23: 4 pc-relative loads + literal(s): 4 main MMIO (0x04000xxx); clustered pool window (≤0x20 B span) — `.legacy.c` routing

$ python tools/predict_walls.py --version eur --module main --address 0x020904d4 --size 0x9c
  C-23: 5 pc-relative loads + clustered pool window (≤0x20 B span) — `.legacy.c` routing
```

Brief 086 originals AND the brief 199 expansion fire correctly.

### Survey of C-23 candidates beyond brief 086

| Function | Module | Size | Signal that fired | Brief queue status |
|---|---|---:|---|---|
| `func_02096434` (pick #5) | main | 0x6c | DTCM kernel + dup-ref | **shipped** (brief 199 worked example) |
| `OSi_PostIrqEvent` | main | 0x9c | clustered pool (`0x021a635x` triple) | brief 200+ |
| `func_02021b38` | main | 0x74 | clustered pool | brief 200+ |
| `func_02093dc8` | main | 0x70 | main MMIO + dup-ref (DMA register access) | brief 200+ |

Plus the brief 086 originals (`func_0208bde0`, `func_0208e61c`,
`func_0208e664`) which the brief-189 detector already flagged
and which already shipped.

### Calibration trade-off — false positives on contiguous pool words

The brief 199 detector accepts a known false-positive class:
ordinary functions with 3+ pc-relative loads to a CONTIGUOUS
pool will fire on the "clustered pool" signal even if the
loaded values are unrelated (e.g. three independent `int *`
table bases that happen to be in the pool's first 12 bytes).

This is intentional — the cost of a false positive is "decomper
tries `.legacy.c` routing, finds it doesn't help, removes the
suffix". Total cost: a few minutes. The cost of a false NEGATIVE
on a real C-23 wall is "decomper iterates for hours trying to
coerce the wrong source shape". The asymmetry favours over-
firing.

Brief 200+ can tighten the cluster check (e.g. require the
loaded VALUES themselves to cluster, not just the pool offsets)
if the false-positive rate proves disruptive in practice.

## Reg-alloc-sensitive subset — drainable vs defer (brief 270)

`.legacy.c` routing fixes the **base-fold**, but only when base-folding
is the function's ONLY divergence. Brief 270 triaged the 221 unmatched
real-MMIO picks and found **only 11 are cleanly drainable** — the rest
(95 %) carry a *second* divergence: a materialized VALUE-constant that
competes with the MMIO base register for allocation.

**Discriminator.** `func_0208be38` (shipped) and `func_0208be9c`
(failed) are near-identical MMIO inits; `be9c` differs only by storing
`mov r3, #0x1000` — a value-constant that must hold a register
alongside the 3 MMIO bases, shifting the allocation. So:

> **Drainable** iff the function materializes **no value-constant** —
> no `mov rN, #K` with `K ≥ 0x100`, and no pool `.word` that is a value
> (`< 0x01000000`, e.g. a mask `0x1ff`) rather than an address.
> Otherwise → **defer** (per-pick / permuter; same class as P-11/P-15).

| Tier | n | Signal |
|---|--:|---|
| Drainable (`be38`-class) | 11 | no value-constant; small; ≤6 pool bases |
| Defer — value-constant | 146 | `mov #K≥0x100` or pool value-word competes with base |
| Defer — large/many-pool | 63 | n > 24 or > 6 bases |

Verified byte-identical this session: `func_ov006_021b4d68` (a uniform
8-member ov006 family: guard → compute globals → write one MMIO reg →
`return 1`). Full worklist + the `0x1ff`/`0x1000` defer-anchor pilots in
[`brief-270-c23-mmio-triage-and-sinit-alias.md`](brief-270-c23-mmio-triage-and-sinit-alias.md).
Note gotcha 19 (commutative-operand order) applies to these globals-OR
shapes.

## Cross-references

- [`docs/research/codegen-walls.md` § C-23](codegen-walls.md#c-23)
  — canonical taxonomy entry (with brief 199's expanded signal
  set).
- [Brief 086 PRs #474 + #478](https://github.com/cntrl-alt-lenny/gx-spirit-caller/pull/478)
  — original C-23 discovery + recipe + SP boundary sweep.
- [Brief 088](../briefs/088-mmio-base-folding-wall-sweep.md) —
  the 5-variant × 15-SP empirical methodology.
- [Brief 193 PR #640](https://github.com/cntrl-alt-lenny/gx-spirit-caller/pull/640)
  — surfaced pick #5 as "StyleA + C-23 stacked".
- [`src/main/func_02096434.legacy.c`](../../src/main/func_02096434.legacy.c)
  — brief 199's worked example.
- [`src/main/func_0208bde0.legacy.c`](../../src/main/func_0208bde0.legacy.c)
  — brief 086's canonical recipe.

## Tests

`tests/test_predict_walls.py::TestC23Detection` (brief 199 expanded):

- `test_mmio_block` — brief 086's original main-MMIO path.
- `test_dtcm_kernel_block` — DTCM kernel literal fires (pick #5
  signal).
- `test_duplicate_pool_ref` — same `@` target loaded twice fires
  (pick #5 signal).
- `test_clustered_pool_within_0x20` — 3+ targets in tight window
  fire (`OSi_PostIrqEvent` signal).
- `test_three_pc_loads_no_signal_no_match` — 3+ pc-loads with
  contiguous-pool-position but spread VALUES; documents the
  brief 199 false-positive trade-off.
- `test_two_pc_loads_with_mmio_below_threshold` — `pc_loads <
  3` doesn't fire even with MMIO literal.
- `test_clustered_only_two_within_window` — 2-target cluster
  (not 3) doesn't fire.
