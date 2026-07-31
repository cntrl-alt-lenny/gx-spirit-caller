# cm-ov002-unknown-sweep-10: plain selection + a solved mini-item (2026-07-31)

## Purpose

Same shape as sweep-9 (plain, module-agnostic selection across
149-512B), with two additions requested directly: fix the dispatch-
prompt gap that let two sweep-9 batches rediscover the project's own
"route before you draft" guidance mid-session, and take the 4-
recurrence MLA-vs-indexed-load cohort sweep-9 flagged as a "dedicated
mini-item" rather than delegating it blind.

## Result: 30/100 shipped, 8,344 bytes — the best round this campaign

| Batch | Shipped | Bytes | Notes |
|---|---|---|---|
| 1 | 4/20 | 1,120 | Carried the 3 C-60 priority candidates; validated the lever, didn't fully close them (see below) |
| 2 | 6/20 | 1,768 | Surfaced a 3rd rediscovery incident — this round's own routing text was incomplete |
| 3 | 9/20 | 2,128 | 2 more P-17 cohort resolutions; found a real worktree-setup gap |
| 4 | 6/20 | 2,004 | Found the largest single instance of the dominant register-wall pattern (9/14 parks) |
| 5 | 5/20 | 1,324 | 1 more confirmed C-32 wall |

4 C-32 permanent walls caught by the mechanical screen before dispatch
across this round and last (2 each) — 0 escaped to a worker's drafting
time either round.

## The MLA-vs-indexed-load mini-item: solved the mechanism, not the residual

Investigated directly via standalone `mwccarm 2.0/sp1p5` compilation
(a synthetic table matching the real stride/offset constants, several
candidate C phrasings, diffed against the real disassembly) rather
than delegated blind — see **C-60** in `codegen-walls.md`. The
mechanism is real and confirmed: a single compound address expression
produces a double-`mla`-chain; an intermediate pointer variable
incremented as a separate step produces a single-`mla` + separate-
`mul` + explicit-`add` + register-indexed load. Applied directly to
the 3 flagged candidates this round:

- `func_ov002_021ed1f8`: its Family-A occurrence shipped at 100% via
  C-55. Its Family-B occurrence got the *correct* C-60 instruction
  selection (confirmed) but a register-letter/scheduling permutation
  on top of that resisted ~7 rewrites.
- `func_ov002_0220d974`: both occurrences kept compiling to Family A
  instead of the target's Family B despite ~9 rewrites — the lever
  didn't reproduce here the way it did for `021ed1f8`'s Family-B
  occurrence, suggesting C-60's stated mechanism isn't the complete
  picture for every case.
- `func_ov002_0222ad54`: a C-55 fix took control-flow to fully correct
  (13.6%→57.1%); the remaining table-address computation hit the same
  register-scheduling wall as the other two.

**Honest verdict: C-60 is real and correctly predicts which
instruction family mwcc selects, but is not sufficient alone to close
these specific functions** — a second, distinct, still-unresolved
register-allocation wall sits on top of all three. Don't oversell this
as "cracked"; it's a genuine partial win that removed one layer of the
problem and exposed a cleaner view of what's actually left.

## The dominant residual pattern, now unmistakably the campaign's real bottleneck

Every batch this round independently hit the same register-letter/
scheduling wall — "immune to declaration/statement reordering,"
"consistently the last blocker after semantic/structural bugs were
fixed" — at higher volume than any prior round. Batch 4 alone: **9 of
14 parks** shared an identical signature (a `(player&1)*0x868` table-
offset feeding a do-while loop over the *same* `data_ov002_022cf16c`
table C-60 investigates, but in a loop-scan access pattern rather than
a single lookup — distinct from C-60's domain, confirmed by the
worker as not fixed by the existing C-39f lever either). Batch 1's
worker, independently, called it "a real, currently-undocumented
systemic wall beyond what C-55–C-59/S-2 cover." This is the same
P-4/P-11/P-12/P-15/P-17 family flagged at lower volume in sweep-9 —
now confirmed across three consecutive rounds as the single most
consequential open problem in the whole campaign, and this round's
data suggests the loop-scan variant on `data_ov002_022cf16c`
specifically is common enough (9 in one batch) to be worth the same
standalone-compilation investigation that produced C-60.

## P-17: 2 more resolutions

`func_ov002_021eb630` — a genuine, previously-untested listed cohort
member — shipped 100% first-try via the constant-immediate-placement
lever found last sweep. **Cohort count drops from 15 to 14.**
`func_ov002_021f162c` (not one of the 17 originally-enumerated
addresses, but in the same surveyed neighborhood) shipped 100%
first-try with the same lever — treated as cohort-expansion evidence,
not a literal reclassification, per the entry's own existing framing
for this situation. Both are documented in `codegen-walls.md`.

## Process findings

**A 3rd rediscovery incident — this time my own fault for paraphrasing
instead of reading the source.** Batch 2 found that 3 candidates were
initially misrouted because the epilogue shape it saw looked ambiguous
between the default tier and `.legacy_sp3.c`; it correctly diagnosed
the real disambiguator (odd register count → an r3-spill the target
doesn't show) and shipped from it. **This is not a new discovery** —
it's already documented, precisely, in `style-a-epilogue.md`'s brief-
044/045/049 3-tier discriminator table. The verbatim "route before you
draft" text I wrote for this round's dispatch prompts was an
oversimplified 2-way paraphrase from memory that dropped this exact
detail — I hadn't re-read the source doc before writing it. Fixed for
next round: the corrected verbatim text is the full 3-tier table
(default / `.legacy.c` / `.legacy_sp3.c`) plus the brief-049 pop-target
disambiguator, copied directly from `style-a-epilogue.md` rather than
paraphrased. **Lesson for future "state this verbatim" instructions:
read the primary source doc immediately before writing the verbatim
text, don't reconstruct it from memory.**

**A real worktree-setup gap, not yet fixed.** Batch 3 found that a
fresh worktree (this round's lighter `configure.py`-only setup, no
`ninja delink`) leaves `fastmatch.py`'s reference-object cache
unpopulated — its first call silently compiled against the *stale*
`.s` rule instead of the new `.c` draft, with no error. The worker
caught it by noticing and ran `ninja delink` once (dsd-only, no
mwcc/mwld — doesn't violate the no-parallel-compile fix). Other
batches may have hit this silently without reporting it; the final
gate is still the authoritative check regardless, so shipped results
are trustworthy, but **`ninja delink` should be added to the standard
worktree setup step next round** (still zero compiler invocation) to
remove this risk rather than rely on each worker noticing.

**C-32 screening held.** 2 more genuine instances caught by the
mechanical pre-dispatch screen (`func_ov006_021be6f4`,
`func_ov015_021b3ecc`) — 4 total across sweeps 9 and 10, 0 escaped to
a worker's drafting time in either round. One process slip on my part:
the exclusion+backfill script left an off-by-one in batch 5's list (21
dispatched instead of 20, including the original flagged file) — no
harm resulted, since the worker independently re-verified and
correctly caught it anyway (cross-checked against
`extract/eur/arm9_overlays/overlays.yaml`'s actual base addresses).
Root cause of the off-by-one not fully diagnosed; worth diffing the
regenerated batch file against the post-fix worktree list directly
next time rather than trusting the regeneration.

**The suggestion-chip tool is being used correctly.** Batch 4
explicitly named a flagged background task ID when using
`spawn_task` to flag an out-of-scope finding — direct confirmation
(not just inference) that workers are using the sanctioned mechanism,
not a prohibited concurrent sub-agent, when they say they've "flagged
a follow-up."

## New/reconfirmed levers this round

Beyond C-59/C-60's own reconfirmation and application: a bitfield
struct member compiles via shift-pair (`lsl`/`lsr`), never AND-with-
pool-constant, even where mathematically identical to a plain mask —
confirmed on 2 independent candidates in batch 5 (one constant-index,
one runtime-index extraction). Isolating a branch to just a pointer-
selection sub-expression (not duplicating a whole call in each arm)
lets mwcc predicate the load and share one call site. A clamp must
happen on the un-truncated type *before* narrowing, not after —
truncating first flips a signed comparison to unsigned. Two candidates
needed their callee's true argument count re-derived from the
callee's own body (2 args, not 1; ~8 args, not 4) rather than trusted
from an existing signature. Not yet promoted to numbered C-N entries —
each is a single instance so far; flagging for reconfirmation.

## Verification

- `check_activation_invariant.py b4ca6bb9b..HEAD`: OK — 30 `.c` added
  == 30 `.s` deleted == 30 delinks activations.
- `check_delink_dupes.py`: OK — 81 `delinks.txt`, no duplicate `.text`
  addresses.
- `gate3.py --scope all --clean`: run ONCE on this consolidated branch
  — all three regions SHA1 PASS.
- Research index regenerated before push.
- Each batch independently verified `git status`, per-function
  `delinks.txt` lines, and `fastmatch.py` before committing — no full
  build in any batch worktree.

## What this suggests for future targeting

The register-allocation-plateau family (P-4/11/12/15/17, plus the
loop-scan variant on `data_ov002_022cf16c` this round surfaced at
volume) is now clearly the campaign's dominant open problem, not a
background nuisance — three consecutive rounds, rising volume each
time. C-60's investigation method (standalone compilation against a
synthetic reproduction, not correlation across shipped attempts) is
the right tool for cracking a narrow, high-volume sub-pattern like the
loop-scan variant batch 4 found — a strong candidate for the next
round's own dedicated mini-item, the same way this round's was chosen.
