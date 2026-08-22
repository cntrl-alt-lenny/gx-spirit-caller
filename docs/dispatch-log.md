[//]: # (markdownlint-disable MD013 MD041)

# Dispatch log — which machine ran which round

One row per brain round, appended **in the round's seeding/doc PR** at dispatch
time. Exists because machine-locality has been the campaign's most persistent
unfixed failure class: worktrees misread as evidence about a lane (the
PR #1504 correction), kickoffs pasted with the wrong machine's paths,
transcripts unreadable
from the other machine (round 0822's review), a machine-local git object making
a test suite falsely green (#1520), and a location guard asserting a directory
the session never navigated to (round 0822's Codex re-dispatch). A future brain
on either machine reads this table and knows where round N ran, where its
transcripts live, and which worktrees are evidence — instead of rediscovering it
painfully.

Columns: **Host** is where the brain session ran AND dispatched from (if those
ever differ, say so in Notes). **Transcripts** is where AGENTS.md control 12's
audit can actually be performed. Worktree sets: Windows =
`C:/Users/leona/Dev/gx-spirit-caller/{decomper, scaffolder, kb-map, kb-types}`;
Mac = `~/Dev/spirit-caller/{decomper, scaffolder, codex-decomper-queue,
codex-scaffolder-queue}`.

| Round | Date | Host | Brain model | Lanes dispatched (lane → item) | Transcripts | Notes |
|---|---|---|---|---|---|---|
| 0817 | 2026-08-17 | Windows PC | Opus 5 | CC-D → `cm-main-wall-filtered-sweep-1` · CC-S → `cm-restock-carve-9` · CX-D → `q-park-class-normalisation` · CX-S → `q-ledger-ship-coverage` | Windows | Merged #1499–#1502, #1503. |
| 0818 | 2026-08-18 | Mac M1 | Fable 5 | CC-D → `cm-main-exploit-drain-1` (others mid-flight or per 0818b) | Mac | Merged #1506–#1508; held #1505. |
| 0818b | 2026-08-18 | Mac M1 | Fable 5 | CX-D / CX-S queues deepened to 3 items each | Mac | Merged #1511, #1512; partial round, CC-D still draining. |
| 0819 | 2026-08-19 | Mac M1 | Fable 5 | CC-S → `cm-toolchain-adopt-2` · CX-S → 3 items (`q-kickoff-lint-canary-check`, `q-pool-freshness-tool`, `q-unittest-required-evidence`) | Mac | Merged #1513–#1519, #1521, #1523. Seed commit `ec8148a9b`. |
| 0822 | 2026-08-22 | Windows PC | Opus 5 | CC-D → `cm-main-exploit-drain-2` · CC-S → `cm-restock-carve-10` · CX-D → 3 items (`q-wall-citation-backfill`, `q-batch-sha1-stale-s`, `q-fastmatch-error-masking`) · CX-S → 3 items (`q-kickoff-lint-sha-brittleness`, `q-pool-freshness-tool`, `q-unittest-required-evidence`) | Windows | Merged #1522, #1524, #1525, #1527; held #1520. **Incident:** first Codex kickoffs asserted the worktree without navigating to it — both lanes correctly STOPped `WRONG WORKTREE`; re-dispatched with `Set-Location` first. Transcript audit of round 0819 was impossible from this host (recorded in state.md). |
| 0822b | 2026-08-22 | Windows PC | Fable 5 | — (no lane dispatch; all four mid-flight) | Windows | Owner-approved hardening package: `unittest` made a required check (#1531 + ruleset), this log created, post-small-pool strategy memo, 3 queue seeds, `q-unittest-required-evidence` parked as superseded. |

Rounds before 0817 predate this log and are deliberately not reconstructed —
the per-round research docs and `docs/research/brain-rounds-*.md` archives are
the record there. Backfilling from memory would violate the log's own premise
(state is captured, never recalled).
