[//]: # (markdownlint-disable MD013 MD041)

# Brief 358 — ov002 routing/permuter pass (the transition)

**Brief:** 358 (decomper). ov002's pure-easy ≤0x38 vein is exhausted; pivot to a
**conversion pass** on the catalogued finicky backlog (the `ov002_core.h`
WALL/defer sections). Order: (1) re-try byte-pack near-misses with the `(u8)` cast;
(2) dispatch-order inversion; (3) permuter the residue (predicate-vs-branch,
store-scheduling, mirror-reg, reg-choice); (4) `asm_escape --c` for true
canonicalisation misses → surgical `.s`, only when 1–3 can't. **Report the recovery
breakdown** (C-via-lever / C-via-permuter / `.s`) — that sizes ov002's real
matchable-vs-walled split. Gate = 3-region `ninja sha1`; GOTCHA-18.

## Headline — the recovery breakdown

**27 catalogued backlog functions routed; 3-region `ninja sha1` = EUR/USA/JPN OK.**

| bucket | count | what |
|---|---:|---|
| **C-via-lever** | **6** | byte-pack arg-pack family (`(u8)` cast) — real C, shipped |
| **C-via-permuter** | **0** | the permuter **plateaus** on the reg-mirror residue (see below) |
| **`.s` (whole-function)** | **17** | reg-mirror + predicate-branch + range-opt + loop-SR + legacy + reg-alloc walls |
| **deferred** | **4** | scheduling-class (permuter-recoverable in principle; harness-blocked) |

The dominant finding: **a large chunk of what wave-5 deferred as "finicky" is real C**
(the byte-pack class), while the rest is **genuinely walled** — the permuter does
**not** crack it, and `asm_escape --c` does not fit it. So the walled tail is a
`--whole-function` `.s` endgame, not a permuter or `--c` job.

## (1) The `(u8)` byte-pack lever recovers a real-C class — 6 shipped

The `func_021d479c` **arg-pack family** (125 uncarved callers; the `021d5xxx`
cluster) builds its 2nd payload by packing two bytes. Wave 5 found the lever:
`(u8)lo | ((u8)hi << 8)` → `and; and; orr …,lsl#8` (matches) vs the
`lsl#24; lsr#16` peephole the `&0xff` form triggers. Applied here:

`021d5d08`, `021d5c50`, `021d5be0`, `021d5a6c`, `021d5ca4`, `021d5a08` — all
matched. These are full arg-pack tail-calls (guard + bit0/`>>1` derivations +
byte-pack payload + stacked u16 args). **This family is a fresh *drain* vein, not a
wall** — ~30–50 of the 125 callers are this shape. Two sub-recipes banked:

- `if (r == 0) return r;` (return the guard value already in r0) elides the
  redundant `moveq` that `return 0` adds (`021d5c50`/`5be0`/`5ca4`).
- a guard sink declared in `core.h` with a fixed arity (`func_021c1e44(self, a, b)`)
  must be called with that arity — re-externing it 1-arg is a compile error.

The big `021d5d58`/`6434`/`6870` and the per-player `021d677c`/`7054`/`7100`
dispatchers are a *different* (drainable) sub-family, deliberately left for a future
drain wave — not this routing pass.

## (2) `goto`/`switch` fix inline-vs-branch STRUCTURE — but reg-mirror remains

A new structural lever: an inline-vs-branch guard whose `return CONST` the orig
*branches* to a shared epilogue is recovered by **`goto`** (`02267f90`, `0220d7c0`)
or, for a value chain, **`switch`** (`021efd38`). **Caveat — it only fires when ≥2
returns share the epilogue.** With a *single* early-return, mwcc predicates
regardless: `021f95f8`, `0220c2c0` (single guard), and the *frameless* pair
`02201e38`/`02205dc8` stay predicated — unsteerable by C.

But even where `goto`/`switch` fixed the structure, a **register-mirror** residue
remained (orig uses higher regs `r2/r3/ip`, mwcc picks `r1/r2`). So the structural
lever alone does not complete the match — the reg-mirror has to go too.

## (3) The permuter PLATEAUS on the reg-mirror — C-via-permuter = 0

`02267f90` (structure-correct after `goto`, pure reg-mirror, base score **45**) was
handed to `decomp-permuter` with default randomization: **477 iterations, stuck at
45, no improvement, no byte-match.** This confirms the standing note — *the permuter
anneals scheduling but plateaus on reg-allocation.* A base-reg `r1`-vs-`r2` mirror is
reg-alloc, so the permuter does not reach it. **C-via-permuter is 0 for this class.**

## (4) `asm_escape --c` doesn't fit — `--whole-function` is the escape (17 shipped)

`asm_escape --c` **refuses** anything that is not a single commutative-operand swap
(by design). A reg-mirror is a whole-register-assignment difference, not a swap → it
refuses. So the walled residue ships via **`--whole-function`** (byte-exact orig
`.s`, the reg-alloc-wall endgame). 17 shipped:

- reg-mirror (post-`goto`/`switch`): `02267f90`, `021efd38`, `0220d7c0`, `0220599c`
- predicate-vs-branch: `021f95f8`, `0220c2c0`, `02201e38`, `02205dc8`, `0220cf0c`
- range-opt (mwcc range-opts `==N||==N+1||==N+2` where orig didn't): `022abf88`
- mirror / reg-choice / loop-SR / legacy / predication / reg-alloc:
  `0220cff8`, `02273b1c`, `022576d8`, `0223b3cc`, `021b91d0`, `021b9ba0`, `021d5ab4`

## Deferred (4) — scheduling-class, harness-blocked

`021d90c0` (1-insn schedule swap) and the store-scheduling trio
`0226acf8`/`022592b8`/`02259324` are **scheduling**, which the permuter *does* anneal
— so they are genuine C-via-permuter candidates, **not** walls. Two harness gaps
blocked them this pass:

1. **`asm_escape --whole-function` has a trailing-constant-pool bug** — on the three
   store-sched funcs it emits the code but drops the pool words, so the `.s` is
   short and fails its own byte-verify (`[8] e8bd8008 vs e8bd8008` — identical
   opcode, wrong length). (Worth a one-line fix in `asm_escape.py`.)
2. **`dsd dis` won't emit a per-function `.s`** for these gap functions under the
   ov002 overlay-swap, so `permute.py` can't stage a target — the scheduling-permuter
   path is plumbing-blocked, not logically blocked.

→ Recommend a follow-up: fix the two harness gaps, then permuter the scheduling
class (likely 4 more C-via-permuter recoveries).

## What this says about ov002's real matchable-vs-walled split

| class | verdict | route |
|---|---|---|
| byte-pack arg-pack family (~30–50 funcs) | **real C** | `(u8)` lever — *drain*, not route |
| inline-vs-branch, **≥2 shared returns** | **real C** | `goto`/`switch` (if no reg-mirror) |
| reg-mirror / single-return predicate-branch / range-opt / loop-SR | **walled** | `--whole-function` `.s` |
| scheduling (1-insn swap, store-sched) | **real C** (permuter) | permuter — *once harness fixed* |

So the split is **better than wave 5's "finicky" framing**: the byte-pack class and
the scheduling class are recoverable C; only the reg-mirror / predicate-branch /
range-opt / loop-SR tail is a true `.s` wall. The permuter's role is narrower than
the brief assumed (scheduling only, not reg-alloc).

## Verification

| Gate | Status |
|---|:---:|
| EUR / USA / JPN `ninja sha1` | **OK** (6 `.c` + 17 `.s`, byte-identical) |
| `check_match_invariants.py` | 0 errors (5415 warns, pre-existing placeholders) |
| `ruff check .` | clean |
| `tests/` | passed |
| GOTCHA-18 cross-wire | clean (`.c` picks reference no ov000/005/008 sym; `.s` = orig bytes; sha1 proves isolation) |

Carve-size audit caught **10 mis-sizes** (I initially guessed sizes for the pooled
byte-pack `.c` and several `.s` from instruction counts; fixed to the true gap-symbol
sizes — code+pool — before the gate, 0 after). EUR-only config change (+6 `.c`, +17
`.s` `complete` blocks); `ov002_core.h` §VERIFIED extended.

## Recommendation for the brain

1. **Resume the byte-pack drain** — the `func_021d479c` arg-pack family is a real-C
   vein (~30–50 funcs), best worked as a normal drain wave (not a routing pass), with
   the per-player slot-dispatcher sub-family (`021d677c`/`7054`/`7100`) alongside.
2. **Fix the two harness gaps** (asm_escape pool-tail; permuter target-`.s` for
   overlay-swap gap funcs), then permuter the scheduling class for ~4 C recoveries.
3. **Accept the reg-mirror / predicate-branch tail as a `--whole-function` `.s`
   endgame** — the permuter cannot reach it and `--c` does not fit it.

## Cross-references

- `src/overlay002/ov002_core.h` — §VERIFIED through brief 358 + the `goto`/`switch`
  lever + the permuter-plateau finding.
- `docs/research/brief-356-ov002-deep-drain-wave5.md` — the `(u8)` lever's origin and
  the exhaustion census that triggered this pass.
