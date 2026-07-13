# Brief 563 — USA/JPN drain, Waves 3-10

Date: 2026-07-13
Branch: `claude/drain-w3plus-563`

## Result

Waves 3 through 10 of `docs/research/campaign-analytics/post-ov002-runbook.md`
all executed to completion, turnkey, via `batch_carve.py`'s self-gating
(real `ninja sha1` per batch) + auto-commit-on-green. Waves 1-2 (`ov000`,
`ov008`) were already done before this brief started.

| Wave | Modules | USA shipped | JPN shipped | Total | vs. runbook estimate |
| --- | --- | ---: | ---: | ---: | --- |
| 3 | `ov005` | 63 | 63 | 126 | 126 — exact |
| 4 | `ov010` | 62 | 62 | 124 | 124 — exact |
| 5 | `ov016` | 56 | 56 | 112 | 112 — exact |
| 6 | `ov017` + `ov015` | 78 | 78 | 156 | 156 — exact |
| 7 | `main` | 27 | 27 | 54 | 68 estimated — **14 short (see floor below)** |
| 8 | `ov019`+`ov020`+`ov014`+`ov009` | 116 | 116 | 232 | 232 — exact |
| 9 | `ov003`+`ov007`+`ov021`+`ov012`+`ov022` | 87 | 87 | 174 | 174 — exact |
| 10 | `ov013`+`ov018`+`ov001`+`ov023` | 23 | 23 | 46 | 46 — exact |
| **Total** | | **512** | **512** | **1024** | |

Every wave matched the runbook's pre-computed estimate exactly except
Wave 7, which hit a genuine residual floor (below). USA and JPN shipped
byte-identical counts (often the exact same addresses) in every single
wave — the two regions' candidate populations are effectively mirrored
for all of these modules.

### Wave 7 (`main`) floor ledger

`main`'s 34-candidate population per region broke down as:

- **26 absorbed-routed** — the `C-absorbed, base+offset-recoverable`
  population brief 549/553 already characterized; recovered via
  `whole_function()`'s built-in `--allow-absorbed-offset` handling, no
  manual flag needed.
- **1 clean** ship (of the runbook's estimated "8 clean").
- **5 verify-fail** (parked): `func_020b40cc`, `func_020b40e0`,
  `func_02099834`, `func_020b2c38`, `func_020b3b84`.
- **2 gate-fail** (self-bisected and parked): `func_02020fa4`,
  `func_020b3988`.

Identical addresses failed identically in both USA and JPN — this is a
reproducible population, not flakiness. `batch_carve.py`'s own bisection
isolated each gate-fail culprit and committed every other candidate in
the batch around it, so no manual recovery was needed to keep the wave
moving; the 7 parked functions/region (14 total) are a genuine residual
floor for a future targeted brief, not a mechanical-drain target.

### Mid-wave interruption (Wave 5, JPN `ov016`)

The JPN `ov016` run was stopped mid-batch by the user between sessions
(bed time) — 2 batches (40 ships) had already landed cleanly, and a
third batch was left staged but never gated (10 uncommitted `.s` files +
a modified `delinks.txt`, no matching commit). Recovered by reverting the
unvalidated partial batch (`git checkout --` the delinks file, `git clean
-fd` the untracked `.s` files) back to the last green commit, then
re-running the identical `batch_carve.py` command — confirming the
documented idempotent-resume guarantee ("reads live `delinks.txt` state
fresh every invocation, only acts on functions still uncarved"). The
resumed run shipped the remaining 16, landing on JPN's same 56-ship total
as USA.

## Gates

- `python tools/configure.py usa && ninja delink` / same for `jpn`: run
  once per wave, all passed.
- Every `batch_carve.py` batch: internal `ninja sha1` gate, `--batch 20`,
  auto-commit on green only, bisect-and-park on red.
- Final: `python tools/gate3.py --no-tests` — **GATE PASS**, all three
  regions (`eur` / `usa` / `jpn`) SHA1 PASS.

## Environment note

Mid-brief, backgrounded `batch_carve.py` launches twice resolved
`tools/batch_carve.py` one directory too high (from the worktree's parent
instead of `decomper/`) immediately after a background-task
notification boundary — the persistent shell's cwd had reset. Fixed by
prefixing subsequent commands with an explicit `cd` into the worktree
rather than relying on carried-over state; no build or commit was
affected since the failure happened before any file access.

## Not in this brief's scope

- Wave 11 (`ov002` mop-up) — explicitly deferred per the runbook, a
  separate brief.
- A targeted follow-up on the Wave 7 `main` floor (7 functions/region:
  5 verify-fail + 2 gate-fail) — needs manual diagnosis, not a
  drain-lane task.
