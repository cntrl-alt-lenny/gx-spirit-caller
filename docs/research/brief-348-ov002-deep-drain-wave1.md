[//]: # (markdownlint-disable MD013 MD041)

# Brief 348 — ov002 deep-drain wave 1 (the big overlay)

**Brief:** 348 (decomper). Pivot to **ov002** — the biggest matchable vein left
(paused in the early era, not mined out). Survey, drain small-first (accessor /
dispatch tier, then hand-RE mid bodies), watch GOTCHA-18 (overlay-swap base
`0x021aaee0`, group `{0,2,5,8}`), gate = 3-region `ninja sha1`, audit carve
sizes, and **classify the residue matchable-C vs reg-walled**. Collision-free
(the scaffolder is on main).

## Headline

**19 shipped, 3-region `ninja sha1` = EUR / USA / JPN all OK** — above the 12–18
target. The small accessor/forwarder/predicate tier (0x24–0x28) is **richly
matchable-C**: 19 of 20 attempted matched (the 20th is a compiler-routing hold,
not a wall). The drain re-confirmed that ov002's apparent "1-register-off"
accessors are **not reg-walls** — they're the **pass-through lever**, and once
applied they match cleanly.

## The pass-through lever (the wave's dominant recipe)

An ov002 forwarder keeps its incoming args **live** by passing them **through**
to the sink. That reserves the low registers and bumps the scratch register the
body uses — which is exactly the "1-reg-off" signature that looks like a wall.
**Diagnose from the orig and the arity falls out:**

| orig loads the base/temp into… | ⇒ pass-through args |
|---|---|
| `r1` | 0 (leaf) |
| `r2` | 1 (`arg1` live) |
| `r3` | 2 (`arg1, arg2` live) |

Match by declaring the sink with that arity and forwarding the args
(`021b4204`/`422c`/`022038b0` → `+arg1`; `021f0f58` → `+arg1,arg2`; `021f2068` →
`+arg1,arg2`). A forwarder that needs `r0` (the return value) preserved across
the call **returns the sink's result** — diagnosed on `021f0f58`, where the
post-call `0x183e` store lands in `r1` to keep `r0` alive.

This is the single most useful ov002 idiom: it converts a whole apparent
reg-wall class into clean C.

## Other recipes confirmed

1. **Tail-call** — `return sink(...)` with no frame → `ldr ip,=sink; …; bx ip`
   (`021ae680`, `0226b274`, `022953c4`, `0220d070`).
2. **value-map `if` form** — `int v = 0; if (arg) v = 1;` gives `mov#0;movne#1`;
   the ternary `arg?1:0` gives `movne#1;moveq#0` (wrong order) (`021ff14c`).
3. **Bitfields** — bit0 via `struct { u16 b0 : 1; }` (`lsl#31;lsr#31`, never `& 1`);
   a multi-field holder `struct { u16 b0:1; u16 f1:5; }` reads the u16 once and
   extracts both (`0220d070`).
4. **Asymmetric shift extract** is safe as raw C `(unsigned)(x << 17) >> 23` —
   mwcc does NOT fold unequal shifts (only symmetric `(x<<N)>>N` folds to a mask,
   gotcha 6/16) (`02208668`, `02203558`, `0224326c`).

## The 19 picks

`021ae680` (command-post tail-call), `021e7584` (mask-bit guard), `021f0f58`
(field save/sink/stamp, returns sink), `021ff14c` (kind value-map), `02208668`
(9-bit field query), `0224326c` (kind-field guard), `0226b274` (arg-shuffle
tail-call), `0229d2c8` / `0229d9f8` (frameless predicates), `021de4b0` (bit-test,
mask in r4), `02203558` (3-arg classify), `021cb084` (reset sequence), `02222040`
(event-send), `022953c4` (bitfield tail-call), `021b4204` / `021b422c` (id-table
resolve pair), `022038b0` (phase-gated forward), `021f2068` (player-flag
dispatch), `0220d070` (multi-bitfield tail-call).

**HELD:** `021b91d0` — an int-swap whose `stmfd {r3}; sub sp,#4` frame is the
legacy-compiler epilogue shape; a `.legacy.c` routing candidate, **not a reg-wall**.

## Classification — matchable-C vs reg-walled (the brief's sizing question)

Census of the unmatched ov002 bodies:

| shape | count | bucket |
|---|---:|---|
| simple | 1109 | matchable-C |
| dispatcher | 629 | mostly matchable-C |
| permuter | 1088 | reg-alloc-walled (→ permuter/.s endgame) |

So **~1738 (62%) are hand-drainable / matchable-C** and **~1088 (38%) are the
reg-walled endgame.** This wave's 19/20 hit rate on the small "simple" tier
**validates the `simple`+`dispatcher` bucket as real C** — the apparent reg-misses
were the pass-through lever, not walls. ov002 is majority-matchable; expect many
more clean waves before the permuter tail dominates.

## Verification

| Gate | Status |
|---|:---:|
| EUR / USA / JPN `ninja sha1` | **OK** (byte-identical, all 19 carved) |
| `check_match_invariants.py` | 0 errors (5263 warns, pre-existing placeholder names) |
| `ruff check .` | clean |
| `tests/` | passed |
| GOTCHA-18 cross-wire | clean (no pick references an ov000 symbol; sha1 proves isolation) |

Carve-size audit caught **5 mis-sizes** (a dedup'd worklist carried stale sizes;
one over-carve overlapped the next function) — fixed before the gate, 0 mismatches
after. EUR-only config change (+19 `complete` blocks); `ov002_core.h` §VERIFIED
extended.

## Recommendation for the brain

ov002 is a **deep, high-yield matchable vein** — keep the decomper here for
several waves. Wave 2 should continue small-first through the 0x2c–0x40 tier and
start the matchable mid bodies (0x40–0x100); the pass-through lever + the bitfield
struct recipes carry directly. The ~1088 permuter bodies are the eventual
assembly/permuter endgame — sizeable but a minority. (Also: route the
legacy-frame stragglers like `021b91d0` to `.legacy.c` in a dedicated pass.)

## Cross-references

- `src/overlay002/ov002_core.h` — the canonical header (§VERIFIED now through
  brief 348) + the per-player 0x868 vocabulary + the pass-through lever doc.
- `docs/research/brief-286-ov002-core-header.md` / `brief-296` — the original
  Cluster-A core + the band extension this wave builds on.
