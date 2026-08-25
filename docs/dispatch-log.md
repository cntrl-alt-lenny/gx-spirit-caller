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
| 0822c | 2026-08-22 | Windows PC | Opus 5 | CC-D → `cm-main-boundary-rerun` · CC-S → `cm-restock-carve-11`, `cm-progress-dashboard` · CX-D → `q-worktree-gc` · CX-S → `q-pool-freshness-tool` (re-take), `q-make-kickoff-generator` | Windows | Merged #1526, #1528, #1529, #1530, #1532, #1535, #1536; held #1534; closed #1520 as superseded. **First round since 0817 where control 12's transcript audit was fully executable** — all four lanes ran on this host and all four were read. #1536's 0/40 boundary result disclosed as effort-confounded by the lane itself; re-run seeded rather than acted on. |
| 0824 | 2026-08-24 | Windows PC | Opus 5 | CC-D → `cm-main-band-followthrough` · CC-S → `cm-restock-carve-12` (rewritten as the group verifier) · CX-D → `q-ledger-chronology`, `q-remaining-opportunity-census` · CX-S → `q-make-kickoff-generator` (commit the paused work FIRST) | Windows | Merged #1542, #1544-#1553 (11 PRs); closed #1534 as superseded. **The 193-256 B band returned 0/20 at matched effort — the small-code frontier is closed on clean evidence and Outcome B fires.** Codex Decomper cleared 7/7. Two brain findings against merged work: #1546's contradiction audit reads row order as chronology (2 of 3 false positives), and the Codex Scaffolder's paused generator sat uncommitted in kb-types, one `reset --hard` from loss. |
| 0824c | 2026-08-24 | Windows PC | Opus 5 | CC-D → `cm-main-band-finish` · CC-S → next data item · CX-D → re-seed · CX-S → `q-wine-link-concurrency` (deferred, retry on an idle machine) | Windows | Merged #1557-#1565 (nine PRs). **Composition into the data pool is DEAD (0/575)**; 257-320 B is NOT closed — 2/9 partial with parked median 55.2% vs 11.2% at 193-256 B and zero dead drafts, so the sample gets finished rather than spent. First round with the `attempts` column populated. Brain fixes at merge: the census's stale `bl`-tool caveat, and #1561's red ruff check. |
| 0825 | 2026-08-25 | Windows PC | Opus 5 | all four QUEUE-EMPTY; re-seeded pending an owner ROI call on the 257-320 B band | Windows | Merged #1569-#1574 (six PRs). **Code frontier now fully mapped**: 257-320 B is MARGINAL at 4/20 = 20.0% on a complete sample (263 candidates / 75,980 B behind it); 513-1023 B returned 0/15; every other band closed or exhausted. bl/blx dispatch-pool counting consolidated into `scan()` and brain-verified agreeing with `pool_freshness.py` at three caps. Wine-link concurrency measured cleanly (4-way deterministic, ~3.1x throughput) but the lock was never active on Windows — brain corrected its own earlier framing. |
| 0825b | 2026-08-25 | Windows PC | Opus 5 | all four QUEUE-EMPTY; re-seed pending the owner's direction call | Windows | Merged #1577-#1580. **321-376 B CLOSED at 1/15**, leaving 257-320 B's 20.0% as the only live code pocket. **#1580 found a Windows-only `load_module_sections` bug** that hid every overlay/ITCM/DTCM data symbol since carve-10 — reachable pool 187,760 B → 407,506 B once fixed; brain reproduced it (26 of 27 map keys were raw backslash paths). Brain supplied the census's missing byte-sim half from a worktree with `extract/`: **~198,232 B of the port backlog is byte-identical**. |

Rounds before 0817 predate this log and are deliberately not reconstructed —
the per-round research docs and `docs/research/brain-rounds-*.md` archives are
the record there. Backfilling from memory would violate the log's own premise
(state is captured, never recalled).
