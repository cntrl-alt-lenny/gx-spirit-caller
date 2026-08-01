# cm-ov002-unknown-sweep-13: no mini-item, heavy cross-batch reconfirmation (2026-08-01)

## Purpose

Same shape as sweep-9 through sweep-12: plain, module-agnostic
selection across 149-512B, 5 worktrees, `ninja delink` in setup, one
consolidated gate. No mini-item this round by explicit instruction —
sweeps 11 and 12 both spent their mini-item budget productively and
closed the mechanisms that were blocking cohorts; this round's job was
to let the next candidate emerge from evidence rather than assign one
in advance. Two things carried forward from sweep-12's own findings:
C-55 and C-44 (both got heavy blind convergence last round) stated
VERBATIM in every dispatch prompt rather than left for a worker to
rediscover, and an explicit instruction to leave `func_ov002_02250540`
parked rather than re-grind its already-documented register-preference
residual.

## Result: 27/100 shipped, 6,408 bytes

| Batch | Shipped | Bytes | Notes |
|---|---|---|---|
| 1 | 6/20 | 1,680 | Hardest ship needed a 5-lever chain; found a genuine C-55 failure mode |
| 2 | 6/20 | 1,152 | Independently cited and correctly applied last round's memory correction |
| 3 | 6/20 | 1,344 | Independently rediscovered C-64 a third time, fully blind |
| 4 | 3/20 | 668 | Lowest ship count, two clean C-61 reconfirmations (one pre-flagged) |
| 5 | 6/20 | 1,564 | New strength-reduction lever; a new preamble-scheduling wall class |
| **Total** | **27/100** | **6,408** | |

## Process note: one real mistake this round, caught immediately

Partway through setup, a queue-file edit landed as a direct commit on
`main` instead of this round's branch — the working directory had been
synced to `main` to check the latest merge and never switched to a
branch before the next commit. Caught immediately after the push. Did
not attempt to rewrite or force-push `main` (a worse action than the
mistake itself); the commit's content is a harmless, accurate
documentation edit that would have reached `main` anyway once this
round's PR merged, so it was left in place and this round's branch was
created from that point forward. Flagged to the user in-session rather
than folded quietly into this writeup.

## Cross-batch reconfirmation was the round's real signal

**C-55 (goto-to-shared-tail) — both reconfirmed AND given a real
caveat.** Applied correctly, independently, in batches 1 (5 times), 2,
3, and 5. But batch 1 also found a genuine failure mode: applying the
identical restructuring to 2 *other* functions with a superficially
identical "shared tail" shape made the match measurably worse, not
better. Added as a caveat directly on C-55's own entry in
`codegen-walls.md` — the lever is real and still the single most
load-bearing one in the catalogue, but "looks like a C-55 shape" isn't
sufficient on its own; verify with `fastmatch.py` every time.

**C-64 (LS-vs-EQ condition code) — third consecutive round of blind
confirmation.** Sweep-12 established the mechanism and got one
same-round blind confirmation; this round, a different batch with zero
knowledge of either prior investigation hit the identical pattern on 2
more functions (`func_ov002_021ff170`, `func_ov002_0220ad78` — the
latter at 98.4%, one instruction short) and proposed it as a new,
uncatalogued wall. The phrasings they tried are exactly the class of
hand-written guard C-64 already predicts will fail; they didn't try the
one form that works (a bare compiler-synthesized `for` loop). Added as
a third-confirmation addendum to C-64. `func_ov002_0220ad78` is a
good, low-effort candidate to close with the known fix in a future
round.

**C-61's early AND/MUL residual reconfirmed twice more**, including
once on the pre-flagged `func_ov002_0224c440` — both instances hit the
*identical* two instructions, strong evidence this residual generalizes
across the whole `data_ov002_022cf16c` row-table family rather than
being specific to the originally-flagged targets.

**C-44 (case-body address order) applied proactively** in at least 2
functions this round (workers reaching for it before being told a
specific candidate needed it, on the strength of last round's verbatim
dispatch-prompt text) — the clearest evidence yet that stating a lever
verbatim in the dispatch prompt changes behavior, not just documents it
after the fact.

**New: C-65, loop-body strength reduction, with an honest unresolved
asymmetry.** Three independent batches touched this in the same round:
a load-side fix (array-indexed struct access avoids an
induction-variable artifact raw pointer arithmetic triggers), a
store-side negative result (all four source forms tested, including
array-indexing, got strength-reduced regardless), and the first
confirmed ov002-module instance of a wall previously only documented
for ov004. Whether the read-vs-write direction is the actual controlling
factor or these are two unrelated instances of the same general
heuristic mismatch is flagged as open, not forced into a single theory.

## Other new levers, documented in-round rather than promoted to the catalogue

- Boolean-normalize idiom: `flag=0; if(cond){...flag=1;} if(flag)...`
  rather than a single combined `if` (batch 5).
- `volatile` preventing unwanted loop-invariant hoisting of a
  repeatedly-reloaded global address in a busy-wait loop (batch 3).
- Bitfield container-size gotcha: an `unsigned int:8` bitfield forces a
  4-byte `LDR`; basing it on `u16` instead gets the `LDRH` the target
  actually has (batch 3).
- `unsigned short` vs `short` intermediate changing ASR-vs-LSR
  instruction selection even when the final masked value is identical —
  the *promoted* type of the shift operand is what matters, not the
  final result's type (batch 2).
- A reuse-count threshold for CSE hoist-vs-inline: 3+ uses → don't
  hoist; 2 uses → do hoist (batch 1).
- Correct division magic constants derived via the Hacker's Delight
  signed-division algorithm rather than guessed-and-checked (batch 4).
- A new, distinct wall class: switch/if-chain dispatch *preamble/tail*
  scheduling unresponsive to any C-level reordering tried, separate
  from C-44's already-documented body-order issue (batch 5).

## Verification

- `check_activation_invariant.py 37b143ca5..HEAD`: OK — 27 `.c` added
  == 27 `.s` deleted == 27 delinks activations.
- `check_delink_dupes.py`: OK — 81 `delinks.txt`, no duplicate `.text`
  addresses.
- `gate3.py --scope all --clean`: run ONCE on this consolidated branch
  — all three regions SHA1 PASS.
- Candidate pool C-32-screened twice: targeted grep against a 170-item
  pre-screen buffer (3 genuine hits caught, excluded), cross-verified
  against a full-region `predict_walls.py` scan of all 5,401 functions
  — 100/100 selected candidates matched, zero additional C-32 hits.
- `docs/state-table.md` and the research/tool indexes regenerated
  before push — checked proactively this round given sweep-12's gate
  caught the state table stale.

## What this suggests for future targeting

`func_ov002_0220ad78` (98.4%, C-64's known fix not yet applied) is the
single cheapest closeable target on record right now. The C-65
load-vs-store asymmetry is worth a dedicated look if it recurs a third
time. No new mini-item is being proposed unilaterally here, consistent
with this round's own instruction — the next one should come from
whichever of these threads produces the clearest evidence.
