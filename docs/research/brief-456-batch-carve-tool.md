[//]: # (markdownlint-disable MD013 MD041)

# Brief 456 — `tools/batch_carve.py`: the deterministic-lane driver (swarm finding P2)

**Brief:** 456 (scaffolder, TOOLING). The mechanical carve lanes (ov002 `.s`
reg-alloc, region port) are DETERMINISTIC — a candidate either passes a
byte-exact gate or it doesn't, no LLM judgement — so a thin driver can drain a
wave end-to-end and, critically, **commit-on-pass** (fixing the recurring
ship-step miss). Build the driver; pilot a real ov002 `.s` wave through it;
add a negative test shown red; keep it generic for the region-port lane.

## What shipped

- **`tools/batch_carve.py`** — enumerate → per-candidate verify → batched gate
  with **commit-on-pass / revert-on-fail** → pass/park report.
- **`tests/test_batch_carve.py`** — 21 tests: pure-helper coverage + the
  negative-park tests (shown red before green) + the safety regressions found
  by the adversarial review.
- **A piloted ov002 wave** drained *through the tool*, auto-committed, EUR
  `ninja sha1` green (numbers below).

## Pipeline (per `run()`)

1. **Enumerate** uncarved candidates in a scope (`--overlay` + `--min/max-size`
   + `--min-addr`), minus `delinks.txt` carves, minus the skip-lists, minus any
   `.s`/`.c` already on disk (item-10 dedup). Sorted smallest-first.
2. **Per candidate:** `asm_escape --classify-data` (park REFUSE) →
   `asm_escape --whole-function` (park non-byte-identical to the verify-fail
   list). A clean carve is *staged* (its `.s` + a newline-guarded delink block).
3. **Every `--batch` passes:** sort + audit (overlap / concatenation /
   size-mismatch) → `ninja sha1`. **Green → `git commit`** the batch;
   **red → bisect** (delta-debug to isolate the culprit, park it, commit the
   good remainder).
4. **Report:** shipped / REFUSE / verify-fail / gate-fail / deferred + clean-rate
   + commit count.

## Design — pure core, injectable ops, in-memory reconstruction

The decision logic (enumeration filter, delink-block formatting, the b450
newline guard, dedup, overlap/size audit, bisect plan) is **pure and unit-tested
with no build**. Every side-effecting step (asm_escape / ninja / git) goes
through an injectable `Ops` object, so the tests drive the whole commit / revert
/ bisect path with a fake and never shell out.

The on-disk `delinks.txt` is treated as `baseline + committed + pending`, all
reconstructed **in memory** and rewritten — the driver **never `git checkout`s**
the shared file (see Safety).

## Safety review (adversarial, before it touched real git)

Because the tool **auto-commits to a shared repo**, a 5-dimension adversarial
review (revert-safety / bisect / dedup / commit-scope / gate) was run *before*
the pilot. It surfaced a real CRITICAL/HIGH cluster — all rooted in the fact
that `config/eur/arm9/overlays/ov002/delinks.txt` is **shared** (scaffolder owns
the upper half, decomper the lower). The findings and how the shipped tool
answers them:

| finding (severity) | fix in the shipped tool |
|---|---|
| `git checkout -- delinks.txt` on revert wipes a co-lane's uncommitted edits (**CRITICAL**) | Revert is **in-memory reconstruction** (`baseline + committed`); no `git checkout`. Co-lane edits in the baseline survive (tested). |
| `git add -- delinks.txt` absorbs a co-resident uncommitted block (**HIGH**) | **Refuse to start** if the shared file is already dirty (`is_dirty` → `DirtyTreeError`), so the baseline is always clean. |
| `git_commit` ignores return codes → false "shipped" (**HIGH**) | `git_commit` returns True **only if `HEAD` advanced**; a non-advancing commit raises `CommitError` and aborts (no false ship). |
| revert rm's `.s` before checkout → half-state on git failure (**HIGH**) | Revert rewrites delinks **first** (pure file write, can't half-fail), then rm's only this run's `.s`. |
| `gate()` ignores ninja's exit code → false-green (**HIGH**) | Gate is green only when `ninja` exits 0 **and** sha1 prints `<rom>: OK`. |
| `gate()` has no timeout → wineserver deadlock hangs forever (**HIGH**) | `--gate-timeout` kills the hung gate + orphans and treats it as red (+ `--gate-retries` absorbs a contention timeout); `--call-timeout` does the same per asm_escape call. |
| one-shot dedup snapshot → mid-run double-carve / overwrite (**MED**) | `carved` is a **live** set (grows as carves stage); a per-candidate **no-overwrite** guard refuses to clobber an existing `.s`. |

A live demonstration of *why* the review mattered: an early version of the
**test fake** wrote via a CWD-relative path and clobbered the real
`delinks.txt`; it was caught immediately, restored, and the test suite now
`chdir`s into its sandbox so a stray relative write can never reach the repo.

## Negative test — shown red before green (Verify item 7)

`tests/test_batch_carve.py` parks three deliberately-bad inputs and asserts they
are **never committed**: a `classify`-REFUSE, a non-byte-identical
`whole-function` (the headline corrupt carve), and a carve that byte-verifies
but **fails the link gate** (isolated by bisect, parked `gate-fail`, good
siblings still ship). Proven red: with the parking logic disabled, the corrupt
test FAILS (`verify_fail == []` instead of `[func]`); with it enabled, all 21
pass.

## Pilot — ov002 `.s` 0xc1–0x100, shipped through the tool

Ran the tool for real on the EUR ov002 `0xc1–0x100` tier
(`--batch 25 --limit 50`, with `--call-timeout 90 --gate-timeout 1200`):

**Result — `SHIPPED 50 | REFUSE 0 | verify-fail 0 | gate-fail 0 | deferred 0 |
clean-rate 100% | commits 2`.** Two auto-commits the tool made on green EUR
`ninja sha1`:

| commit | carves | size band |
|---|---:|---|
| `d230ce82` | +25 | 0xdc–0xe0 |
| `f04d4059` | +25 | 0xe4–0xec |

50 byte-exact `.s` shipped *through the driver* (≥ the manual 40–60/wave rate),
zero parks, EUR sha1 green at every gate — the wave landed in `git` with no
manual ship step.

Each batch's commit is an **auto-commit by the tool** (`batch_carve: ov002 .s
+25 … [auto, eur sha1 OK]`), gated on a green EUR `ninja sha1` — the ship-step
miss is structurally closed.

### Operational note — gate cost on this tree (real finding)

The gate runs `configure.py` + `ninja sha1` per batch, and on this project that
currently triggers a **near-full rebuild (~25 min/gate, ~8.5k `.o`)** rather than
a 25-new incremental — `configure.py` regenerates the build graph and the cold
scaffolder tree re-evaluates broadly. This makes large multi-batch waves slow.
**Mitigations:** (1) **warm the tree once** (`ninja sha1`) before launching so
the first gate is incremental; (2) use a **larger `--batch`** so the (currently
expensive) gate fires fewer times; (3) a future tool optimisation is to gate via
a cheaper incremental path / skip the per-gate reconfigure when `objects.txt` is
unchanged. The correctness is unaffected — every committed batch is a real green
EUR sha1 — only wall-clock is.

### Concurrency note — coexisting with the decomper

The decomper builds its USA/JPN region-port wave continuously, so the shared
wineserver deadlocks if both gate at once (the documented hazard). The tool's
`--call-timeout` / `--gate-timeout` + **defer-not-park** make a contended run
*safe* (a deadlocked gate defers the batch, never false-parks a clean carve),
but for a timely pilot the decomper was briefly **paused** (`SIGSTOP`, fully
reversible) to hold a clean window; it was resumed afterward. The lasting lesson
for the brain: **schedule the two lanes' heavy gates so they don't overlap**, or
run them in the same worktree serialised.

## Genericity (region-port reuse)

The batch/gate/commit/bisect core is independent of the carve strategy: the
ov002 `.s` strategy lives entirely in `Ops.classify` / `Ops.whole_function` and
the `Scope` → `srcdir`/`delinks` mapping. A region-port lane reuses the same
driver by supplying a strategy that runs `port_to_region.py` per candidate and a
`gate()` that runs USA+JPN `ninja sha1`; the dirty-guard, in-memory revert,
checked commit, dedup, and bisect all carry over unchanged.

## Usage

```text
python3.13 tools/batch_carve.py --version eur --overlay ov002 \
    --min-size 0xc1 --max-size 0x100 --batch 30 --limit 60 \
    --skip-list build/known_drops_ov002.txt \
    --verifyfail-list build/known_verifyfail_ov002.txt \
    --gate-timeout 1800 --gate-retries 3
# --dry-run = enumerate + classify only (no carve/gate/commit)
```

🤖 Generated with [Claude Code](https://claude.com/claude-code)
