# Research archive

This directory holds clearly superseded status/planning snapshots. The
original paths remain as short pointer stubs so historical links still land on
the successor or archive copy. Brief reports are intentionally not archived.

## Moves in the 2026-07-22 archive pass

| Former path | Archive copy | Evidence for supersession |
|---|---|---|
| `campaign-analytics/path-to-100-coverage.md` | `path-to-100-coverage.md` | Its header explicitly names `endgame-ledger.md` as the definitive successor. |
| `campaign-analytics/safe-queue-v2.md` | `safe-queue-v2.md` | v3 is an explicit top-up of v2; v4 re-audits the v3 population. |
| `campaign-analytics/safe-queue-v3.md` | `safe-queue-v3.md` | v4 explicitly re-verifies v3 and finds 99 of 107 carried rows already resolved. |
| `campaign-analytics/cmatch-sweep-queue.md` | `cmatch-sweep-queue.md` | Brief 580's unified `cmatch-queue.md` merges the main census and parked/floor ledger. |
| `campaign-analytics/cmatch-sweep-queue-overlays.md` | `cmatch-sweep-queue-overlays.md` | Brief 580's unified queue supersedes the earlier overlay-only census. |
| `campaign-analytics/pick-lists.md` | `pick-lists.md` | `singleton-cmatch-queue.md` records the committed list as stale and regenerates the current singleton census. |
| `campaign-analytics/post-ov002-drain-workorder.md` | `post-ov002-drain-workorder.md` | `post-ov002-runbook.md` explicitly turns this work order into the copy-paste-ready successor. |

`docs/research/README.md` remains the generated top-level research index;
`python tools/generate_research_index.py --check` is the regeneration gate.
