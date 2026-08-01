# cm-ov002-unknown-sweep-12: two newly-isolated mechanisms, closed (2026-08-01)

## Purpose

Same shape as sweep-11 (plain, module-agnostic selection across
149-512B), plus the round's mini-item: sweep-11 isolated two specific,
still-open mechanisms from the register-allocation-plateau family and
flagged them as the natural next dedicated-investigation targets — the
`rowBase+0x120+idx*4` addressing residual (3 instances) and the
`goto`-vs-predicated condition-code question (3 instances, 2 workers).
Investigate both directly via standalone `mwccarm` compilation against
synthetic reproductions, before dispatching any batches.

## Result: 40/100 shipped (9,296 bytes) — best round this campaign

| Source | Shipped | Bytes | Notes |
|---|---|---|---|
| Mini-item (direct) | 1/1 targeted | 168 | `func_ov002_0224f4a0`, C-63 |
| Batch 1 | 7/20 | 1,776 | New ARM jump-table addressing gotcha; C-44 reconfirmed |
| Batch 2 | 3/20 | 928 | Lowest ship count, richest negative-result data |
| Batch 3 | 12/20 | 2,704 | Best batch; independently reconfirmed C-64 3x |
| Batch 4 | 10/20 | 2,292 | Second-best; bitfield-vs-mask refined |
| Batch 5 | 7/20 | 1,428 | Flagged a false "tooling bug," corrected below |
| **Total** | **40/100** | **9,296** | |

39 from the 5 dispatched batches plus 1 from direct mini-item
investigation. 40 is the highest single-round ship count this campaign
has produced (previous best: sweep-10's 30/100).

## The mini-item: both mechanisms closed, one with a real ship, one as a general lever

**C-63 — the `rowBase+0x120` residual wasn't a C-60 case at all.**
Sweep-11's flagged functions (`func_ov002_02221348`, `func_ov002_0224f4a0`,
`func_ov002_02236bbc`) resisted both of C-60's addressing families
because they aren't indexed by a small fixed column — they're indexed
by a genuine runtime variable (a loop index or forwarded argument), for
which mwcc's plain array-subscript addressing mode is simpler than
either C-60 family and nobody had tried it because everyone was
pattern-matching to the wrong family. Confirmed via standalone
compilation, then shipped **`func_ov002_0224f4a0` 100%** as direct
proof — including correctly reverse-engineering its packed-bitfield row
entry and a redundant same-address memory reload that has to stay as
two independent dereferences, not a cached pointer, or the compiler
drops an instruction the target actually has. The other two flagged
functions (`func_ov002_02221348`, `func_ov002_02236bbc`) confirm the
same addressing shape recurs, but remain parked — both carry
substantial *unrelated* complexity (a 5-way computed-goto switch with
packed multi-argument UI calls; a second computed-goto switch with a
CSE-driven addressing variant) that wasn't closed this round.

**C-64 — the goto-vs-predicated theory from sweep-11's addendum does
not survive direct testing.** Falsified cleanly: a hand-written
`if (count <= 0) return;` and a hand-written `if (count <= 0) goto
skip;` compile *identically* (both fold to `EQ`), regardless of how
much code the guard skips or how much register pressure is present.
The real mechanism: `LS` only appears when the check is mwcc's *own*
synthesized entry pre-check for a genuine `for` loop — never from any
hand-written guard, in any form tested. Whether that pre-check
if-converts to a predicated skip or a genuine branch depends on how
much if-conversion has already happened earlier in the same function,
not on anything local to the guard — flagged as its own open question.
**This mechanism got independent, blind confirmation in the very same
round**: batch 3, working ordinary candidates with no knowledge of this
investigation, hit the identical `EQ`-not-`LS` pattern 3 times and
converged on the same "condition-code version of the register-letter
wall" framing independently. Full derivation and both confirmations are
in `codegen-walls.md`'s C-64 entry.

**Also corrected an overclaim from the prior round.** Re-checking
sweep-11's own C-61 entry against the project's real `fastmatch.py`
(not assuming its "verified 100%" language was still accurate) found
`func_ov002_02250540` currently re-compiles to 60.5%, not 100%, blocked
by an unrelated register-preference mismatch. The loop-triangle lever
itself is still real and correctly documented; the specific claim about
this one target's ship status wasn't. Corrected in place in
`codegen-walls.md` rather than silently fixed, per this campaign's own
standing rule to report a caught error, not just quietly patch it.

## New levers and reconfirmations from the main sweep

**Reconfirmed, not new — but each recurred independently across
multiple batches with no cross-talk, which is itself the strongest kind
of evidence:**
- **C-55** (goto-to-shared-exit forces a real branch over predication):
  independently rediscovered and applied in batches 1, 2, 3, and 4,
  each without being told the lever existed. This is the single most
  load-bearing lever this round, touching a majority of shipped
  functions across every batch.
- **C-44** (case-body physical layout order need not match case-value
  or dispatch order): independently rediscovered in batch 1 (descending
  value order in source) and batch 3 (address-order-not-value-order in
  a plain jump table), plus batch 5 explicitly flagged its own hit as
  fitting C-44 but wanted its scope note broadened to cover
  non-jump-table `cmp`/`beq` switches too, not just jump-table-lowered
  ones — worth doing as a follow-up doc edit.
- **P-20** (register-pairing scramble in `(player&1)*0x868` row
  address): reconfirmed twice more in batch 2, both word-count-identical
  to target except the one computation — consistent with its existing
  "permanent" classification.
- **C-61's early AND/MUL scratch residual**: reconfirmed 3 more times
  (batch 2 twice, batch 4 once — the batch 4 instance was the
  pre-flagged `func_ov002_02249cec`, and came in *worse* than the usual
  signature: a register-**count** mismatch, not just a letter scramble).

**Refined:**
- **Bitfield-vs-mask canonicalization** is stricter than previously
  documented: a genuine C bitfield struct member *always* compiles to a
  shift-pair extraction; a plain `x & N` expression *always*
  canonicalizes back to AND-based extraction, even when hand-written as
  an equivalent shift-pair — mwcc's optimizer collapses it regardless.
  Confirmed across 5 functions in batch 4.

**New, real, but narrow enough to document here rather than promote to
a numbered entry this round** (each has clean before/after evidence in
its batch's own notes, available if a future round wants to formalize
one):
- A 2-word "paired" return value (two correlated 32-bit values consumed
  directly from r0/r1) needs `long long`, not a custom struct — a
  struct triggers a hidden-pointer memory-return convention and
  produces a completely different, much larger shape (batch 5).
- Single-bit bitfield reads compile to `lsl#(31-N); lsr#31` with the
  shift's own flags usable directly, genuinely distinct from a plain
  `field & (1<<N)` AND (batch 5, batch 3).
- Hidden call arguments via caller-saved register reuse: a register
  loaded early and never explicitly re-touched before a `bl` can still
  be a real implicit argument to that call — has to be checked by
  tracing liveness to the call site, not assumed dead from an absence
  of visible use (batch 4). The mini-item hit this same class of error
  independently — an under-derived 2-argument call signature for
  `func_ov002_02257ab8` cost a full round-trip before the second
  argument (`player`, carried in a register with no other visible use)
  was found.
- Mixed signedness within one rounding-divide expression: the inner
  shift needs to be unsigned, the outer signed — using the same
  signedness for both breaks one half or the other (batch 4).

**Flagged, not yet resolved — the natural next dedicated-investigation
candidate:** batch 2 hit what may be a genuinely new, uncatalogued wall
twice (`func_020899c0`, `func_020506b0`): a 2-condition
`if (a==0 || b==0) return X;` early-return compiles branch-based in the
target but predicates inline under every phrasing tried (4+ variants
each — `&&`, nested-if, goto, explicit labels — zero movement). This is
distinct from the existing predication-threshold and inline-vs-branch
entries; only 2 instances so far, not enough to promote to a numbered
wall, but worth a dedicated pass with the same standalone-compilation
method if it recurs.

## Process note: a worker's own "critical finding" was a misread, caught and corrected in-round

Batch 5 initially reported all 20 of its candidates as belonging to a
"stale, already-permanently-shipped pool," framing the candidate
selector as buggy, and spawned a follow-up task suggesting the
selection tool be fixed. Checked directly rather than accepted: the
`"whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302)"` comment
the worker keyed off is universal boilerplate on 17,457 of 17,864 `.s`
files repo-wide (97.7%) — the standard header for *any* not-yet-matched
function in this project, per `brief-294-regalloc-wall-scout.md`'s own
explicit framing ("ship-as-.s" as the accepted whole-project endgame
convention for anything unmatched), not a per-function "permanently
done" marker. This is, in fact, exactly the pool this entire
`cm-ov002-unknown-sweep` campaign has existed to chip at since sweep-1.
Disproven twice over in the same round: this round's own mini-item
shipped `func_ov002_0224f4a0` 100%, one of the exact functions carrying
this header, and batch 5's own worker went on to ship 7 more from the
same "already permanent" list a few tool calls later. The spawned task
was withdrawn with this explanation rather than left to mislead a
future session. Batches 1-4 did not need re-checking — there was never
a real contamination, only one batch's mistaken framing of a universal
convention.

## Verification

- `check_activation_invariant.py 9af2c18a0..HEAD`: OK — 40 `.c` added
  == 40 `.s` deleted == 40 delinks activations.
- `check_delink_dupes.py`: OK — 81 `delinks.txt`, no duplicate `.text`
  addresses.
- `gate3.py --scope all --clean`: run ONCE on this consolidated branch.
- Candidate pool was C-32-screened twice: once by a targeted grep
  against the 160-item pre-screen buffer (3 genuine hits caught,
  excluded), then cross-verified against a full-region
  `predict_walls.py` scan of all 5,401 functions — 100/100 selected
  candidates matched with zero additional C-32 hits found.
- Each batch independently verified `git status` and per-function
  `delinks.txt` lines before committing; no full build in any batch
  worktree.

## What this suggests for future targeting

The clearest next candidate is the 2-condition inline-vs-branch
mismatch batch 2 flagged (2 instances so far) — same standalone-
compilation method as C-60/C-61/C-63/C-64, next-narrowest sub-pattern
in the same family. Separately, `func_ov002_02221348` and
`func_ov002_02236bbc` (C-63's un-shipped confirmations) are close: the
addressing lever is proven, what's left is unrelated switch-body and
call-argument-packing complexity in those two specific functions, not a
new mechanism. C-44's scope note is worth broadening in a future doc
pass to explicitly cover non-jump-table switches, since 2 independent
batches this round hit that exact gap in the existing writeup.
