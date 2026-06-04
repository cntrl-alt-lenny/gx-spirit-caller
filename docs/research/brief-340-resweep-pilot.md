[//]: # (markdownlint-disable MD013 MD041)

# Brief 340 — re-sweep pilot: do catalogued "Mac-only" misses fall to the new lever?

**Brief:** 340 (decomper, Windows lane). The ov018 wave-2 lever —
DECLARATION-ORDER controls callee-saved register numbering, which cracked a
4-register permutation from C — was deferred-backlog-recovering in principle.
Pilot a RE-SWEEP: re-attack the catalogued "Mac-only" misses in
ov017_core.h §TIER-TRANSITION and ov020_core.h §WALL with the full current
library. Report the yield; that decides whether to scale to the 435-func
deferred backlog (ov004=123, ov006=76, ov011=46…). If yield <3, fall back to a
fresh overlay (ov019).

## Headline — yield 0; the lever is real but NARROW; the backlog is Mac-bound

**Re-attacked 5 catalogued misses across ov017 + ov020. Recovered 0 to 100%.**
Every one is a *different* register/scheduling class than the one the
declaration-order lever cracks. The lever cracks **callee-saved register
numbering of loop-local variables** (the ov018 `021ad118` case); the catalogued
backlog is dominated by four *other* classes it does not reach. **Do NOT scale
the re-sweep to the 435-func backlog** — those deferrals are genuinely Mac-bound.

Per the brief's <3 rule, fell back to a fresh ov019 wave: **5 clean picks
matched** (see bottom).

## The pilot — 5 misses, every reshape lever applied

| func | best % | catalogued as | class (why it resists) |
|---|---|---|---|
| ov017 `021b2c8c` | 72 | register-rotation | **post-`blx` constant alloc**: the increment block re-loads a constant address + a 0 after a call; base/zero/index land in r2/r0/r1 vs orig r0/r1/r2. No named locals to reorder. (Block-layout guard-flip recovered 45→72.) |
| ov017 `021b33dc` | 93 | switch-discriminant r0/r1 | **caller-saved temp choice**: the switch value sits in r1 (orig) vs r0 (mine). Inline switch, named `state` local (both decl orders), if/else-if — all 93%. |
| ov017 `021b61dc` | 91 | load-dest r0/r1 cascade | **caller-saved load cascade**: two field loads in a 2-field address land in r1/r0 (orig) vs r0/r1 (mine). Named field temps + decl order — 91%. |
| ov017 `021b6774` | 69 | switch-with-held-consts in a loop | **LICM-hoist numbering**: mwcc *does* hold the case consts {2,3,4} in callee-saved regs (good), but allocates them before the base — base=r8 vs orig r5. Named consts, base-first AND base-last decl — all 69%. |
| ov020 `021ab8f8` | 59 | OBJ-dispatch stack-arg builder | **instruction-scheduling reorder**: mwcc hoists the `data_ae060` load above the pair construction. Pure scheduling, orthogonal to register choice. |

### Why declaration-order doesn't reach these

The ov018 `021ad118` success was a permutation of **callee-saved registers
holding loop-local variables** (count / min / loop-i / prod). Reordering their
declarations reorders their allocation. The catalogued misses are:

- **caller-saved temp/discriminant/cascade choice** (`021b33dc`, `021b61dc`,
  and the ov019 `021b4c30` found in the fallback): the value is a short-lived
  r0/r1 temp; its register is chosen by call-arg pressure, not declaration order.
- **post-call constant-address allocation** (`021b2c8c`): re-materialized
  constants after a `blx`; no named locals exist to steer.
- **LICM-hoist numbering** (`021b6774`): the allocator orders hoisted constants
  vs the base in a fixed pass, immune to source declaration order.
- **instruction-scheduling reorder** (`021ab8f8`, the whole ov020 OBJ-dispatch
  family): not a register problem at all.
- (catalogued, not re-tested) **field-pool fold** (`021b768c`) — also not
  register-numbering.

The one lever that *did* help re-sweep-side was **gotcha-20 block-layout**
(guard-flip on `021b2c8c`, 45→72) — but that was already in the library; it
didn't close the function.

## Decision

**Do not scale the re-sweep.** The catalogued backlog misses are
scheduling / caller-saved-choice / hoist / fold class — the Mac permuter's
domain, not Windows source-reshape. The declaration-order lever remains valuable
*prospectively* (it flips callee-saved loop-variable permutations as they arise
in fresh clean-C waves, e.g. ov018 `021ad118`/`021ad1f4`), but it is **not** a
backlog-recovery tool. This corroborates the scaffolder's independent ov003
finding (brief 341) that a callee-saved permutation at 62% stayed Mac-lane.

## Fallback — ov019 fresh clean-C wave (5 matched)

ov019 (46 gap funcs, 23 `<0x100`, clusters 0x5c×4/0x78×4) — picked the clean
clone subset:

| func | shape | lever |
|---|---|---|
| `021b3028` | guarded commit (func_0201ef3c flush + clear dirty/pending) | — (first try) |
| `021b2610` | paired-scene per-frame update; returns `A_done & B_done` | — (first try) |
| `021b4ed0` | gate predicate on a1 (unsigned counter compares) | **switch** for forward-branch case layout (63→100) |
| `021b2728` | touch hit-test (point-in-rect `&&` chain) | comparison **operand order** `r->x+r->w > px` (80→100) |
| `021b27a0` | alt-input sibling of `021b2728` | — (first try) |

Deferred in ov019: `021b4c30` (caller-saved flag r0/r1), `021b26d0` (dispatcher
increment rotation, identical to ov017 `021b2c8c`), `021b3068`/`021b4a4c` (261/120-insn
render builders), `021b3f34` (coord-offset wrapper). The `021b26d0`/`021b2c8c`
match (same wall, two overlays) reinforces: the script-step-dispatcher increment
rotation is a stable Mac-lane shape.

## Recommendation

Continue fresh clean-C waves (ov019 has a render tier left; ov009 = 15 untouched).
Route the re-swept misses + the dispatcher-rotation shape to the Mac permuter.
The declaration-order lever stays in the library for prospective loop-variable
permutations, not backlog re-sweeps.
