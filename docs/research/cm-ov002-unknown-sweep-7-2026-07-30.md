# cm-ov002-unknown-sweep-7: measurement sweep, 149-1023B (2026-07-30)

## Purpose and scope change

This item's originally-filed scope (an ov002-only 168-180B band) was
explicitly rejected by the coordinating process in favor of a
**module-agnostic measurement sweep**: 100 candidates split 60/40 across
the 149-512B and 513-1023B bands, drawn from every module with
candidates in range, not just ov002. The deliverable is data — bytes
shipped, ship-rate, and time-per-candidate broken out **by band** — not
a ship count. Six prior ov002-only sweeps had worked a tier that holds
only 6.75pp (percentage points of the project's remaining unshipped
bytes, per the coordinating process's own accounting); this sweep is
the first real data point on the much larger 149-1023B tier (33.00pp +
18.14pp = 51.14pp combined).

**Metric correction, per explicit instruction:** report bytes and
ship-rate, not ship-rate alone. Across the six ov002 sweeps, ship-rate
alone fell (63.2%→45.0%) while real output per attempt rose — a
misleading signal if read in isolation. This doc leads with bytes.

## Method

Sample construction: `wall_aware_headroom.py --exclude-attempted` for
each band, across all modules, stride-sampled (not first-N-by-address,
to get genuine module diversity) to 60 (149-512B) and 40 (513-1023B)
candidates. **A real data-quality issue surfaced during sampling**: 3 of
an initial 60-candidate 149-512B sample were functions
`cm-ov002-unknown-sweep-6` had already parked with documented
residuals — `attempts.tsv` (what `--exclude-attempted` actually reads)
has never been written to by any of the 6 ov002 worktree sweeps this
session (114 rows total vs. 450+ real parked candidates across those 6
sweeps alone). Fixed by excluding ov002 candidates ≤164B from the
sample pool before resampling (the only overlap zone, since sweep-6's
own band topped out at 164B) — see
`feedback_attempts-tsv-never-tracks-worktree-sweeps` memory for the
full finding; the durable fix (populating `attempts.tsv` going forward
and backfilling the 6 sweeps) has not been done.

100 candidates partitioned round-robin (not sliced) into 5 worktrees of
20 each (12 in 149-512B + 8 in 513-1023B per worktree) for module
diversity within every batch, not just in aggregate.

Dispatch prompts required: the brief-582/brief-586 comprehension-first
method (hand-trace behavior before drafting, cross-reference matched
siblings in the same module for signature ground truth, `fastmatch.py`
to iterate); explicit **non-negotiable** no-nested-sub-agent language;
mandatory approximate time-per-candidate logging; park-at-first-
orthogonal-residual guidance (breadth over depth, consistent with this
being a measurement exercise); and the known larger-function levers
(C-24 legacy-tier routing, un-inline-via-macro, P-16).

## Result: 20/100 shipped (20% blended) — but the band split is the real finding

| Band | Candidates | Shipped | Ship rate | Bytes shipped | Bytes/attempt |
|---|---:|---:|---:|---:|---:|
| 149-512B | 60 | 20 | 33.3% | 4,968 | 82.8 |
| 513-1023B | 40 | 0 | **0%** | **0** | **0** |

**Zero functions shipped in the 513-1023B band, across 40 genuine
attempts with real time investment** (several 25-65 minute attempts
that produced full drafts and real partial-match data, not just
abandoned reads). This is the headline result. It's a sharper cutoff
than briefs 582/586 anticipated (which shipped functions up to 952B) —
but per batch 5's finding below, the driver looks like it isn't size
per se.

**The strongest predictor found wasn't byte size — it was callee
ground-truth availability.** One batch's data: every unshipped
513-1023B candidate had a matched-callee ratio under 65% (several
under 15%); shipped/near-shipped 149-512B candidates consistently had
60-100% of their callees already matched elsewhere. A function whose
callees are still `.s` themselves has no ground truth for their real
signatures — every argument count, type, and calling convention is a
guess, compounding uncertainty on top of the function's own logic.
This is consistent with — and sharpens — briefs 582/586's own
"comprehension usually isn't the blocker, iteration budget is" finding:
the 513-1023B band's real blocker looks like it's specifically
*ground-truth availability*, a proxy for how much of the surrounding
call graph is already matched, not raw density or size alone.

## Per-batch summary

| Batch | Shipped (149-512) | Shipped (513-1023) | Notable findings |
|---|---:|---:|---|
| 1 | 5/12 | 0/8 | **Second independent confirmation of the P-16 counter-lever** (see below) — the single most valuable individual finding this round. Condition-polarity/if-true-block-placement drove all 5 ships. |
| 2 | 4/12 | 0/8 | New C-53 (literal `%` matches mwcc's modulo codegen) and C-54 (XOR-vs-zero selects `teq`). Confirmed P-20's wall is context-dependent — same idiom in 4 candidates, only 1 walled. One real behavioral bug caught via diff-then-trace. |
| 3 | 4/12 | 0/8 | **Process incident**: made one mistaken sub-agent-spawn detour on a single hard candidate, caught immediately, no stray files, rest done directly (see below). Found a genuinely misplaced candidate (a C-32 permanent wall, hand-encoded raw opcodes, that should never have been in the pool — see memory). New generalizable lever: bitfield-struct-cast beats mask arithmetic even when the mask fits as a valid ARM immediate (7 recurrences). |
| 4 | 4/12 | 0/8 | Confirmed the header-boilerplate premise was wrong (see below). Confirmed P-20's idiom doesn't guarantee the wall again. New unnamed residual (`TST` vs `ANDS`). 2 real bugs found and fixed, not walls. |
| 5 | 3/12 | 0/8 | **Corrects an existing wall-doc claim**: sparse (non-jump-table) switch case order DOES measurably affect codegen, contradicting S-2's "doesn't affect codegen at all" note. Strong reconfirmation: `switch` beats nested-if/`&&` for state dispatches (4 of this batch's candidates). Identified the callee-ground-truth-availability finding above. |

## Process incident: one mistaken sub-agent spawn, caught and corrected

Batch 3 spawned a single research sub-agent for one difficult candidate
mid-sweep, against the explicit non-negotiable instruction. Caught via
its own vague "still waiting on the real research agent" language in a
routine check-in (the coordinator verified the worktree directly rather
than trusting the framing, per standing practice) — resumed with
corrective instructions, confirmed no stray files resulted, and the
remaining 19 candidates were completed directly. The spawned
sub-agent's own research (a genuine, well-cited fixed-point-multiply
recipe) did complete and route to the coordinator rather than back to
its parent, consistent with the project's documented nested-agent-
notification-routing failure mode — relayed back to the batch as a
one-time FYI since the content was directly useful, without re-opening
the delegation channel. This is a **single, immediately-caught, no-
consequence instance**, unlike sweep-6's batch 2 (4 unauthorized
sub-agents, a real file-corruption race) — the explicit non-negotiable
framing in this round's dispatch prompts appears to have substantially
reduced, though not fully eliminated, the delegation impulse.

## The P-16 counter-lever: second confirmation, now believed systemic

`codegen-walls.md`'s P-16 (repeated-address rematerialization after a
call) had one prior counter-lever data point (`cm-parked-reaudit-1`,
2026-07-25): accessing a repeated global through a real typed struct
member instead of raw `*(int*)(base+K)` pointer-offset casting
reproduces the original's indexed addressing with zero extra pool
words. That entry explicitly asked for "two more independently-observed
instances... to confirm the pattern is systemic." This sweep's batch 1
— working from briefs 582/586, which predate and don't reference the
2026-07-25 update, so this was a genuinely independent re-derivation —
hit the identical pattern on a different function
(`func_ov002_02269ab8`) and found the identical fix (a padded struct
with the field at its natural offset), closing a ~30-point match gap.
**The pool-fold half of P-16 is now confirmed fixable in general, not
just on the one function it was first found on.** codegen-walls.md
updated accordingly.

## Two corrections to existing documentation

1. **The "brief 302/294 header is ov002-exclusive" premise was wrong.**
   Every batch independently found the identical boilerplate header on
   `.s` files in `main`, `overlay000`, `overlay004`, and `overlay011` —
   not just `overlay002`. Harmless in practice (every worker assessed
   every candidate on its own merits regardless of the header), but the
   framing in this round's own dispatch prompts ("ov002-specific") was
   inaccurate and should be corrected for any future cross-module
   sweep.
2. **S-2's "sparse switch case order is irrelevant" claim is too
   strong** — see the per-batch table above and the codegen-walls.md
   entry itself for the counter-example and correction.

## codegen-walls.md updates (this PR)

- P-16: second independent confirmation, reclassified as systemic
  (pool-fold half only; the scheduling-residual half remains open).
- S-2: correction noting a real sparse-switch counter-example.
- New C-53 (literal `%` matches mwcc's modulo lowering) and C-54
  (XOR-vs-zero selects `teq`).
- (Separately, this branch also carries a standalone correction to the
  P-20/P-21 "permuter inventory" framing from a prior round, made before
  this sweep's candidates were dispatched — see that commit for detail.)

## Verification

- **Three-way count via `tools/check_activation_invariant.py
  origin/main..HEAD`**: **20 == 20 == 20**, clean on first check.
- `python tools/check_delink_dupes.py`: OK, 81 delinks.txt, no
  duplicate `.text` addresses.
- 5 worktree branches merged via `git merge --no-ff` — zero conflicts
  on source files; the shared `config/eur/arm9/delinks.txt` (touched by
  4 of 5 batches, since most shipped `main` functions) and
  `config/eur/arm9/overlays/ov002/delinks.txt` both auto-merged
  cleanly.
- All 5 batches self-verified cleanly (`git status` matched claimed
  shipped counts exactly) after the one process incident above was
  resolved.
- `python tools/gate3.py --scope all --clean`: PASS — all three of
  `[eur]`/`[usa]`/`[jpn] SHA1 PASS` individually grepped from the full
  log.
- `python tools/generate_research_index.py` / `generate_tool_index.py
  --check` / `generate_briefs_index.py --check`: research index
  regenerated, all three drift-check generators confirmed current
  before push.
- `python -m ruff check` / `npx markdownlint-cli2`: clean.

## No mid-flight main catch-up needed this time

`origin/main` had not moved since this branch's base commit
(`c3cfad3ae`) — confirmed via `git fetch` + `git rev-list
--left-right --count origin/main...HEAD` showing 0 commits behind.

## Time-per-candidate: qualitative summary, with an honest caveat

Every worker logged an approximate time per candidate. For candidates
that received a genuine draft-and-iterate attempt (shipped or parked
with real match% data), typical times ran roughly 15-65 minutes in the
149-512B band and 25-65 minutes for the subset of 513-1023B candidates
that got a full attempt. **This understates the true cost of the
513-1023B band**: roughly half of that band's 40 candidates were
time-boxed to a 5-20 minute "comprehension only, not drafted" or
"assessment only" state rather than a genuine attempt-to-failure —
workers correctly triaged away from candidates whose callee coverage
looked hopeless, per the park-early instruction. The raw time data for
this band therefore reflects "time to *decide not to attempt*" as much
as "time to attempt," and should not be read as a per-candidate cost
estimate for a future sweep that *did* commit to drafting every
513-1023B candidate regardless of callee coverage — that would cost
meaningfully more per candidate than this round's numbers suggest,
consistent with briefs 582/586's own finding that 900B+ functions need
"meaningfully more than the ~80 minute soft cap."

## What this suggests for future targeting (data, not a decision)

This was explicitly a measurement exercise; the strategic call belongs
to the coordinating process. What the data shows:

- 149-512B is a real, productive band at roughly triple the ship-rate
  and comparable or better bytes-per-attempt to the recent ov002
  small-function sweeps (82.8 B/attempt here vs. the ov002 series'
  37.9-71.1 B/attempt trend), and it's module-agnostic — this sweep
  shipped functions in `main`, `overlay002`, `overlay006`, `overlay014`.
- 513-1023B shipped nothing this round, but the callee-ground-truth
  finding suggests **targeted** selection (candidates whose callees are
  already mostly matched) rather than **address-order** selection could
  change that outcome meaningfully — worth testing as a specific
  hypothesis before writing the whole band off.
- >=1024B was out of scope for this sweep entirely; a separate,
  independently-run analysis line (`completion-model-terminus` /
  `large-band-unsampled` memory) has already flagged that band as
  effectively unsampled by the project's own tooling (m2c_feed.py's
  object-finder is blind to non-gap delink objects) — a tooling fix
  there, not a sweep, looks like the higher-leverage next step for that
  tier specifically.
