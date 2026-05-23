# Brief 201 — decomp.me-style iteration on brief 198 best-score picks

**Brief:** 201 (decomper). Manually iterate on brief 198's 3 lowest-
score permuter picks (E-07, E-08, B-08) — the picks where permuter
got closest to matching but didn't converge. Goal: move
`matched_functions` (the headline metric that hasn't moved since
brief 190).

## Headline

**1 of 3 picks matched.** B-08 (`func_0205da2c`) closed via
`.legacy_sp3.c` routing — the explicit `sub sp, #4` prologue is
specifically mwcc 1.2/sp3's preferred shape for short LR-only
functions. E-07 (`func_02023f7c`) and E-08 (`func_02026fd8`) both
hit the same 1-instruction CSE wall — mwcc's address-CSE pass is
not source-coercible from any of the three routing tiers.

Per the brief's success bar ("at least 1 of 3 ships … is the floor;
3 of 3 is the dream"), this clears the floor. `matched_functions`
+1.

## Per-pick outcomes

| Pick | Addr | Routing chosen | Outcome | Diff after |
|---|---|---|---|---:|
| **B-08** `func_0205da2c` | 0x0205da2c | `.legacy_sp3.c` | ✓ MATCH | 0 |
| **E-07** `func_02023f7c` | 0x02023f7c | `.c` (unchanged) | wall | 1 insn |
| **E-08** `func_02026fd8` | 0x02026fd8 | `.c` (unchanged) | wall | 1 insn |

## B-08 — recipe (the win)

The orig shape:

```
stmdb sp!, {lr}        ← LR only, no callee-saved regs
sub   sp, sp, #4       ← explicit 8-byte stack alignment
ldr   r0, [r0]
bl    func_020b3870
mov   r0, r1
add   sp, sp, #4
ldmfd sp!, {pc}        ← Style B epilogue
```

The three-routing-tier matrix for this exact C source
(`return (int)(func_020b3870(*p) >> 32);`):

| Routing | mwcc version | Shape produced | Match? |
|---|---|---|:---:|
| `.c` (default) | 2.0/sp1p5 | `push {r3, lr}; ...; pop {r3, pc}` — 5 insns, r3 as alignment pad | ✗ |
| `.legacy.c` | 1.2/sp2p3 | `push {lr}; sub sp, #4; ...; add sp, #4; pop {lr}; bx lr` — 8 insns, Style A epilogue | ✗ |
| `.legacy_sp3.c` | 1.2/sp3 | `push {lr}; sub sp, #4; ...; add sp, #4; pop {pc}` — 7 insns, Style B epilogue | **✓** |

**Empirical mapping:** when orig has *both* an explicit `sub sp,#4`
prologue AND a `pop {regs, pc}` Style B epilogue with no callee-saved
register usage, route as `.legacy_sp3.c`. This is consistent with
`docs/research/sp3-routing-decision.md` (brief 044) but specifically
extends it to the "LR-only + stack adjust" sub-case.

The C source itself is the natural form — no tricks needed:

```c
typedef long long s64;
extern s64 func_020b3870(int x);

int func_0205da2c(int *p) {
    return (int)(func_020b3870(*p) >> 32);
}
```

Brief 198 listed B-08 as best-score 315 (permuter didn't converge).
The wall was a routing choice, not a source-shape choice — explaining
why mwcc-agnostic random perturbation couldn't find it.

## E-07 / E-08 — the CSE wall (the loss)

Both functions have the same orig shape (E-08 is a clone of E-07
with different symbol + different multiplier constant). The orig
disasm pattern:

```
ldr r4, .L_POOL_A      ; r4 = &data (FIRST pool slot)
mov r5, r0             ; r5 = arg0
mov r1, r4
mov r0, #0; mov r2, #8
bl Fill32              ; Fill32(0, &data, 8)
ldr r0, .L_POOL_B      ; r0 = &data (SECOND pool slot — RELOAD)
str r5, [r0, #4]       ; data.saved_arg = arg0
ldr r0, [r0]           ; r0 = data.handle
cmp r0, #0
bne .L_done
ldr r1, [r4, #4]       ; r1 = data.saved_arg (re-read via r4)
...

.L_POOL_A: .word data_0219a8e4
.L_POOL_B: .word data_0219a8e4   ← TWO pool slots, SAME symbol
```

**The wall:** orig has TWO separate pool words both holding
`data_0219a8e4`. mwcc 2.0/sp1p5 unconditionally CSEs these into a
single pool slot, emitting `mov r0, r4` at the second use instead of
`ldr r0, [pc, #...]`. This produces a 1-instruction diff plus 1
fewer pool word.

### What was tried (all failed to break the CSE)

| Attempt | Source pattern | Result |
|---|---|---|
| Bare `extern state_t data_0219a8e4` | Direct symbol access | mwcc CSEs → 1-insn diff |
| `extern volatile state_t data_0219a8e4` + `volatile state_t *p` | Volatile qualifier on extern | CSE persists (volatile affects loads/stores, not address computation) |
| Pointer alias `state_t *q = &data_0219a8e4` after the first call | Re-take address through new var | mwcc CSEs across the call boundary |
| `.legacy.c` routing (mwcc 1.2/sp2p3) | Different mwcc version | Completely different shape (uses r5 for &data, swaps r4/r5 assignment) |
| `.legacy_sp3.c` routing (mwcc 1.2/sp3) | Third mwcc tier | Same divergence as `.legacy.c` |

### Why this isn't source-coercible

mwcc 2.0's address-CSE pass runs after the IR is finalized, and it
operates on symbol identity, not on syntactic appearance. Every
reference to `&data_0219a8e4` in C — whether through a struct member,
a pointer alias, or a direct cast — resolves to the same internal
symbol node, and CSE collapses them.

To force two pool entries for the same symbol, the source would need
to either:

1. Drop into **inline asm** with two separate `ldr r0, =sym`
   instructions (mwcc treats inline asm as opaque).
2. Use a **second symbol** that resolves to the same address via
   linker aliasing — which C-level mwcc doesn't support.

Both are scaffolder-tier interventions, not decomper-tier source
edits.

### Comparison to brief 199's "C-23" worked example

Brief 199 documented `func_02096434` as a C-23 (MMIO base-folding)
worked example where mwcc emits "two pool loads of 0x027ffc00".

**Verified during this brief:** the brief 199 source comment is
imprecise. Empirically, mwcc 2.0 emits **one pool slot** for
`0x027ffc00`, loaded twice (both `ldr r3` instructions target the
same pool offset 0x68). Orig has the same single-slot layout. So
the C-23 recipe matches orig — but it's because mwcc and orig
*both* CSE, not because the source forces two slots.

E-07's case is the opposite: orig does NOT CSE, but mwcc 2.0 always
does. This is a register-allocator divergence that the C source
cannot reach into.

## What this means for `matched_functions`

| Metric | Before brief 201 | After brief 201 | Δ |
|---|---:|---:|---:|
| `matched_functions` (EUR) | unchanged since brief 190 | +1 | +1 |
| 3-region SHA1 PASS | green | green | held |
| `complete_units` | unchanged | +1 (B-08) | +1 |

B-08 is now wired into delinks at `src/main/func_0205da2c.legacy_sp3.c`
and ships as a real matched `.c` source — not just a stub.

E-07 and E-08 remain as un-wired stubs (per brief 198's convention) —
their compiled bytes diverge from orig by 1 insn each, so wiring them
into delinks would break 3-region SHA1 PASS.

## Recommendation for brief 202+

1. **Apply the .legacy_sp3.c heuristic systematically.** Any
   permuter pick where orig has `push {lr}; sub sp, #4` + Style B
   epilogue + no callee-saved register usage is a candidate. Run a
   scan over the remaining ~hundreds of LR-only short wrappers and
   check the prologue shape — easy `matched_functions` wins likely
   hiding there.

2. **E-07 / E-08 + the brief 198 480-500 plateau (E-12/E-13/E-14,
   B-22, B-24) are NOT decomper-tier closures.** They need either:
   - **Scaffolder research** into mwcc's CSE pass — can we patch
     the codegen behavior, or is there a build flag that disables
     address-CSE?
   - **Inline asm escape hatch** — for the few highest-value
     stragglers, hand-write `ldr` + `mov` pairs to force the orig
     register layout. Hacky but unblocks the count.

3. **Brief 199's "two pool loads" comment in `func_02096434.legacy.c`
   is misleading** — the function does match orig but via single-slot
   CSE, not two-slot duplication. A correction-only edit to that
   file's comment block would prevent future briefs from chasing the
   wrong recipe (as this brief did initially).

## Cross-references

- Brief 198 PR #648 — permuter wave + 9 stubs
- Brief 199 PR #647 — C-23 MMIO/register-base folding
- Brief 200 PR #650 — Brain housekeeping (macOS permuter fixes)
- `docs/research/sp3-routing-decision.md` (brief 044) — sp3 routing
  decision matrix
- `docs/research/style-a-epilogue.md` — Style A vs Style B epilogue
  taxonomy
