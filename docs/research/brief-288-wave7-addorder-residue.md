[//]: # (markdownlint-disable MD013 MD041)

# Brief 288 — wave-7 add-order residue: source lever vs permuter verdict

**Status:** cracked to a verdict. decomp.me / research / tools only — no
SHA1, no `.c`/`.s` shipped (sample compiles + permuter run are `/tmp` +
the gitignored vendor). Fetched content treated as data. **Verdict: NO
source lever exists, and the permuter does NOT crack them (piloted: base
score 10, 1484 iterations, floor stays 10, 0 matches). All 5 are
byte-identical to the original except ONE commutative add-operand-order
instruction that mwcc canonicalises invariant to source. They are an
honest permanent C-wall — route the class to the `.s` asm escape hatch
(precedent: `func_ov002_021ff3bc.s`, brief 207), a one-instruction asm
edit per function. Closed, not an open defer.**

## The divergence — one instruction, all five

Each residue member compiles **byte-identical to the orig except a single
instruction**: the f30 base pointer add `cf16c + player*0x868 + idx*20`,
where the commutative operands come out swapped. `idx*20` is CSE'd (shared
with a `cf1a4`/`cf1a2` read), so it is already in a register when the f30
add is emitted, and mwcc puts that CSE temp **first**; the orig puts the
running accumulator first.

| member | helper | our f30 add → orig | other byte diffs |
|---|---|---|---|
| `021ec094` | `021c1ef0` | `add r3,r4,r3` → `add r3,r3,r4` | none |
| `021f15a8` | `021c1ef0` | `add lr,ip,lr` → `add lr,lr,ip` | none |
| `021eec48` | `021c1ef0` | `add lr,ip,lr` → `add lr,lr,ip` | none |
| `021efc64` | `021c1e44` | `add r3,lr,r3` → `add r3,r3,lr` | none |
| `021f0174` | `021c1e44` | `add lr,ip,lr` → `add lr,lr,ip` | none |

"other byte diffs: none" — every other instruction, pool word, reloc, and
guard (the `idx>=5` / `idx>4` / `player==self->b0` / f30 / `cf1a4`-nonzero
checks, in each member's specific order and polarity) is byte-exact. The
verifier counts a 2–3 instruction gap only because objdump renders my
literal pool as `.word` lines vs the orig's raw bytes — a rendering
artifact, not a code difference.

## (A) Source lever — FAILS (the cheapest outcome is unavailable)

The brief's three suggested levers, each compiled + byte-checked against
the delinked `.o`:

- **Reorder the f30 expression operands** (`idx*20 + (cf16c+player)` vs
  the natural `(cf16c+player) + idx*20`): **no change** — mwcc emits the
  identical `add idx20, ACC` regardless of source operand order. (This is
  exactly the permuter's `perm_commutative` pass; see B.)
- **Force/avoid the shared `idx*20` CSE** (named pointer var; explicit
  `p += idx*20` accumulate; `Slot20[idx]` array indexing): each **breaks
  the prologue** — the player/idx multiplies and the `idx>=5` guard get
  re-scheduled, producing *more* diffs, not fewer.
- **Restructure the row pointer** (group `player+idx` first, derive cf1a4
  from cf16c): changes the orig's two-add / two-pool structure → diverges
  elsewhere.

**Why it can't be steered:** this is gotcha 19 (commutative-operand
order), but a sharper variant. Gotcha 19 is source-steerable when the
operands are **pool-loaded globals** (the first one referenced claims the
first slot). Here the swapped operand is a **CSE'd computed temp**
(`idx*20`) that is live across the upcoming helper call; mwcc's
commutative canonicalisation for that case is **independent of source
operand order and of expression structure** (proven: the swap survives
both operand orders, and every structural change perturbs other
instructions first). No source form lands them.

## (B) Permuter pilot — does NOT crack them

Piloted the real `decomp-permuter` (deps installed into a venv; the
vendored checkout from brief 276) on `021ec094`, seeded with the
1-instruction-off source above and a **byte-accurate target** (`target.o`
assembled from the orig disasm — validated: every instruction byte matches
the delinked `.o` modulo the `bl`/pool relocs).

| metric | value |
|---|---|
| base score | **10** (the single swapped add) |
| iterations (`-j 4`, ~4 min) | **1484** |
| best score reached | **10** (never improved) |
| matches (score 0) | **0** |
| typical mutation outcome | `inf` (compile error) or worse (≥105); few neutral |

**The permuter plateaus at the base score.** It cannot fix the add for the
same reason source can't: its `perm_commutative` pass is the operand swap
that mwcc ignores here, and its structural passes (`perm_temp_for_expr`,
`perm_reorder_*`, `perm_expand_expr`) have **no slack to work with** — the
function is `<0x100` and every instruction is load-bearing, so almost
every mutation either fails to compile or worsens the score.

This refines brief 276: the permuter "anneals scheduling" on **larger**
functions with reschedulable slack; on these tight accessors there is no
slack, so the operand-order divergence is the permuter's **plateau**
(reg-alloc/canonicalisation) class, not its favourable case.

## Verdict + recommendation — ships via asm, not an open defer

The 5 (and the shared-`idx*20`-CSE accessor class behind them) are
**byte-identical-except-one-commutative-add** and **unmatchable by C**
under mwcc 2.0/sp1p5 — neither source nor the permuter reaches byte-exact.

**Route them to the `.s` asm escape hatch.** The project already ships
ov002 functions as hand-assembly when C can't express the exact encoding
(`src/overlay002/func_ov002_021ff3bc.s`, brief 207). For these 5 the asm
is trivial: take the byte-identical C output and flip the one
`add ACC, idx20` operand order — a one-line edit per function makes each
byte-exact. That turns the residue into **5 ready ships** (decomper's call
to author the `.s`), with the rest of the class following the same recipe.

Alternatively, if the team prefers to keep them C-only, they are an
**honest, documented permanent C-wall** (mwcc commutative canonicalisation
of a CSE'd temp) — no longer an open "deferred, root cause unknown."

## Falsification

- "single-add divergence, all 5": `/tmp/sc286/verify.py <member>.c <func>`
  on each — every one diffs at exactly the f30 add, nowhere else.
- "source can't steer it": V8/V9 (idx*20-first in source) reproduce the
  *identical* `add idx20,ACC`; V2/V7/V11 (temp/array/accumulate) perturb
  the prologue. Re-runnable.
- "permuter doesn't crack it": 1484 iterations, floor 10, 0 matches.
  Flips iff a future mwcc/flag change alters commutative canonicalisation.
- The verdict flips to a source recipe iff any source form emits
  `add ACC, idx20` while keeping the prologue byte-exact — none found
  across hand variants + 1484 permuter iterations.

## Scope

Research + verdict only: no `.c`/`.s` shipped (the `.s` authoring is the
decomper's, per the recipe above); the permuter scratch + venv are in the
gitignored vendor / `/tmp`. The deliverable is this verdict + the gotcha-19
refinement so the class is closed.

## Cross-references

- `docs/research/recipe-gotchas.md` — gotcha 19, extended here: the
  commutative-order lever is source-steerable for **pool globals** but a
  hard wall for a **CSE'd computed temp**.
- `docs/research/brief-286-ov002-core-header.md` — the accessor family
  these 5 belong to (wave 7 shipped 15; this is the deferred residue).
- `docs/research/brief-276-permuter-standup-pilot.md` — the permuter setup
  reused here; refined re: tight-function plateau.
- `src/overlay002/func_ov002_021ff3bc.s` — the `.s` escape-hatch precedent
  (brief 207) the recommendation points to.
