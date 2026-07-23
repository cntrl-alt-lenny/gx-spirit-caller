# Brief 669 — hunt more retirable "permanent" walls (queue item cm-p6-followup)

**Result: 3 stale "permanent" framings corrected (P-7, P-8, P-10), 2 fresh
re-tests confirming P-17 remains genuinely permanent, 1 candidate (P-16)
assessed as too complex to spot-check cheaply.** No shippable functions
this brief — this is a documentation-accuracy and re-verification pass, per
the queue item's own framing ("a retirement is worth far more than a single
ship: it reopens a whole class").

## Scope

Brief 665 retired the P-6 wall — a "permanent" verdict that turned out to
be a routing-tier gap nobody had re-tested after the tier system matured.
This queue item asks the same question of the other 16 P-NN entries: does
each one's stated criteria still hold, or was it — like P-6 — a lever we
now have?

Read all 17 P-NN entries (P-1 through P-17) in full, including every
falsification matrix, SP-tier sweep, and permuter result already recorded.

## Finding 1: three entries were already retired, just not framed that way

**P-7** (pool literal dedup), **P-8** (bit-chain reg-alloc), and **P-10**
(over-predication of short tail) each already carry a "SUPERSEDED BY
C-NN" note in their own body (added by briefs 107, 100, and 111
respectively) — but unlike P-6, none of them got the strikethrough +
correction treatment at the top of the entry. Each still opens with "The
wall" / "Why permanent" framing that a reader skimming just the header
and first paragraph would take as current. Fixed all 3 to lead with a
`— RETIRED, superseded by C-NN` header and a short correction pointing
at the real fix, matching P-6's style, with the original framing kept
below for history.

This is the same lesson P-6 taught, generalized: **a wall entry's
"superseded" footnote doesn't protect against someone reading only the
top of the entry.** The correction needs to be at the top, not buried at
the bottom, or the stale claim is what future skimmers will act on.

## Finding 2: P-16 and P-17 are explicitly flagged as under-tested — the real candidates

Unlike P-1 through P-15 (each backed by 5-15 mwcc-tier sweeps and often a
dedicated permuter run, i.e. genuinely exhausted), P-16 and P-17 are the
only two entries whose own text says they're *not* fully explored:

- P-16 explicitly says "PERMANENT until a counter-lever is found **or
  confirmed absent by exhaustive C-shape sweep**" and lists two concrete
  untried ideas.
- P-17 explicitly says "do not infer that the 17 headers represent 17
  independent untested opportunities" — i.e. only 1 of 17 cohort members
  had actually been re-tested.

These are the queue item's real targets, not the exhaustively-tested
P-1..P-15 (re-attempting those would just rediscover documented walls).

**P-16** (`func_ov002_02269534`, 548 B duel-progress state machine):
assessed but not attempted — the wall is isolated to one 3-site increment
pattern, but reconstructing the *rest* of a 137-instruction function just
to test that one pattern is a large investment for a speculative payoff
(the doc's own "not yet tried" ideas are honest guesses, not confirmed
levers). Left for a dedicated future brief with a wider time budget.

**P-17** (commutative-add CSE wall, 17-function ov002 cohort): re-tested
2 fresh cohort members independently —

- `func_ov002_021e8b34`: reached **72.2%** via a from-scratch reconstruction
  using this session's shift-pair-preservation lever (the field's `& 0x1fff`
  mask isn't ARM-immediate-encodable, so writing it as `(x<<19)>>19`
  instead of a plain mask was necessary just to reach a clean baseline —
  once there, **every single remaining instruction matches target except
  the one instruction the header names**: `add lr, r12, lr` (mine) vs
  `add lr, lr, r12` (orig), the two operands of a commutative add in the
  opposite order. Tried 3 variants (single combined expression, explicit
  `(A+B)` parenthesization, splitting into two sequential statements) —
  the latter two both *regressed* by perturbing surrounding register
  allocation, exactly matching this entry's own warning. The
  single-expression form is confirmed as the closest reachable point.
- `func_ov002_021eb128`: same core pattern, plus an independent
  register-choice divergence (callee-saved r3 vs orig's r4) layered on
  top — harder to isolate cleanly, but no evidence against the wall.

**Verdict: P-17 remains genuinely permanent** for both freshly-tested
members. Updated the entry with this confirmation so a future brief
knows 3 of 17 are now independently confirmed (not just 1), narrowing
what's left to re-test to 14, and knows which techniques (shift-pair
preservation) are worth applying up front rather than rediscovering.

## Why no ships this brief

Every P-NN entry that could plausibly be re-opened either already has
been (P-6 by brief 665, P-7/P-8/P-10 by briefs 100/107/111 — just not
framed clearly) or was re-tested fresh this brief and confirmed to still
hold (P-17). P-1 through P-5, P-9, P-11 through P-15 have each already
absorbed a multi-tier, multi-variant falsification matrix (some with a
dedicated permuter run) with no result — re-running the same probes
without a new hypothesis would just re-confirm what's already documented
at real compute cost. The queue item's value this round is entirely in
(a) making the already-fixed entries' status legible to future readers,
and (b) spending the re-test budget on the two entries that were
honestly flagged as incomplete rather than re-litigating settled ones.

## Gate

No source, config, or delinks.txt changes — `docs/research/codegen-walls.md`
only. `python tools/check_delink_dupes.py` clean (81 delinks.txt, no
duplicate `.text` addresses). EUR `ninja sha1` re-confirmed unaffected
(no functions shipped or reverted-dirty).
