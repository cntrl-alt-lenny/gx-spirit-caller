[//]: # (markdownlint-disable MD013)

# Brief 572 - EUR residual floor closeout (batch_carve)

Branch: `claude/eur-closeout-572`

Scope: mechanical `batch_carve.py` sweep of the 79-function EUR residual
floor identified by the brief-570 census
(`docs/research/campaign-analytics/eur-floor-closeout.md`), smallest
module first. EUR-side only, per the brief — no USA/JPN source touched,
zero contention with the concurrent USA/JPN drain.

## Outcome

| Module | Predicted (floor) | Shipped | Absorbed-routed | Other clean | Parked (non-floor) | Commit |
|---|---:|---:|---:|---:|---:|---|
| `ov002` | 2 | **2** | 2 | 0 | 0 | `b03d2107` |
| `ov006` | 4 | **4** | 4 | 0 | 11 verify-fail (out of floor scope) | `0ed12abf` |
| `ov004` | 9 | **9** | 9 | 0 | 0 | `2e9d9bea` |
| `main` | 64 (62 closeable + 2 data blobs) | **62** | 53 | 9 | 2 verify-fail (the known data blobs, expected) | `495d6793`, `d3fa878b`, `5e52d6fd`, `f69379ec` |
| **Total** | **79 floor (77 closeable)** | **77** | **68** | **9** | | |

**77/77 closeable funcs shipped — exact match to the brief-570 census's
"Closeable EUR funcs found: 77" figure.** 0 REFUSE, 0 gate-fail across
every module. Every commit was `batch_carve.py`'s own internal `ninja
sha1` gate passing on the first attempt — no retries, no deferrals.

**EUR residual floor remaining: 2 (the data blobs, by design — not a
gap).** `020b2d2c` and `020b3c78` parked as `verify-fail`, exactly as the
census doc predicted: *"they need a whole-function-as-data emitter, not a
normal batch_carve retry."* Batch_carve correctly declined to force them
rather than risk a bad carve; closing them is separate, dedicated work
outside this mechanical lane's scope.

## Per-module detail

### `ov002` (rank 1, smallest)

```
scope ov002 0x0-0x10000: 2 candidates (batch=20, dry_run=False)
  ◆ func_ov002_022b867c REFUSE (C-absorbed, base+offset-recoverable — attempting)
  + func_ov002_022b867c (0x248) staged [1/20]
  ◆ func_ov002_022b5590 REFUSE (C-absorbed, base+offset-recoverable — attempting)
  + func_ov002_022b5590 (0x3cc) staged [2/20]
  ✅ gate OK -> commit 2 carves
REPORT: SHIPPED 2 | REFUSE 0 | absorbed-routed 2 | verify-fail 0 | gate-fail 0 | deferred 0 | clean-rate 100% | commits 1
```

### `ov006` (rank 2)

```
scope ov006 0x0-0x10000: 15 candidates (batch=20, dry_run=False)
  [11x verify-fail parked — func_ov006_021b5c28, _021b9ef4, _021c1558, _021c19a4,
   _021c5080, _021c6960, _021c6bfc, _021c7558, _021c9ed0, _021cac0c, _021cb02c]
  [4x C-absorbed REFUSE → shipped: func_ov006_021ca264, _021c9d00, _021c9efc, _021ca6f4]
  ✅ gate OK -> commit 4 carves
REPORT: SHIPPED 4 | REFUSE 0 | absorbed-routed 4 | verify-fail 11 | gate-fail 0 | deferred 0 | clean-rate 26% | commits 1
```

The 11 verify-fails are **outside the 79-function closeout floor** — the
census doc's ov006 row lists exactly 4 closeout-floor funcs (all 4
C-absorbed), and `batch_carve`'s own candidate scan always sweeps a wider
raw range than the curated floor list. These 11 are pre-existing
residue the brief-570 census's "41 already-carved/semantic-name noise"
reconciliation step already excluded from the 79-count; parking them is
correct, expected behavior, not a regression. Shipped count (4) matches
the census prediction exactly.

### `ov004` (rank 3)

```
scope ov004 0x0-0x10000: 9 candidates (batch=20, dry_run=False)
  [9x C-absorbed REFUSE → all shipped, sizes 0x74-0xa18]
  ✅ gate OK -> commit 9 carves
REPORT: SHIPPED 9 | REFUSE 0 | absorbed-routed 9 | verify-fail 0 | gate-fail 0 | deferred 0 | clean-rate 100% | commits 1
```

### `main` (rank 4, largest — 64 floor funcs across 2509 EUR `.s` files)

```
scope main 0x0-0x10000: 64 candidates (batch=20, dry_run=False)
  [53x C-absorbed REFUSE → shipped]
  [9x clean → shipped]
  ✗ func_020b2d2c verify-fail (parked)   <- known data blob #1
  ✗ func_020b3c78 verify-fail (parked)   <- known data blob #2
  ✅ gate OK -> commit 20 carves   (x3)
  ✅ gate OK -> commit 2 carves    (x1)
REPORT: SHIPPED 62 | REFUSE 0 | absorbed-routed 53 | verify-fail 2 | gate-fail 0 | deferred 0 | clean-rate 96% | commits 4
```

Both verify-fails are exactly the two data blobs the census doc named in
advance (`020b2d2c`, `020b3c78`) — zero surprises, 62/62 of the remaining
closeable candidates shipped clean across 4 gated commits.

## Command notes

The brief text mentioned passing `--allow-absorbed-offset` on the
`batch_carve.py` command line; `batch_carve.py --help` confirms this flag
doesn't exist as a CLI option — grepping the source shows it's already
**always passed internally** to the underlying carve tool for any
`refuse-absorbed`-classified candidate (brief 545: *"Always passes
`--allow-absorbed-offset`... a proven no-op when the preflight is clean or
the REFUSE isn't purely C-absorbed"*). The census doc's own "Recommended
command" column already reflects this (no such flag in any of the 4
listed commands) — ran those verbatim rather than adding a nonexistent
argument that would have failed argparse.

## Verification

```text
$ python tools/gate3.py --scope eur --no-tests
...
[eur] SHA1 PASS
==================== GATE PASS ====================
```

Run scoped to `eur` only (not the default `--scope all`), matching the
brief's "EUR at minimum" instruction and its explicit zero-contention
constraint with the concurrent USA/JPN drain — no USA/JPN build was
triggered by this brief. This is a confirmatory re-check on top of
`batch_carve.py`'s own per-batch `ninja sha1` gate (which already passed
on every one of the 6 commits above before it was allowed to auto-commit).

`git status --short` clean after all commits — every change landed via
`batch_carve.py`'s own auto-commit, nothing hand-staged.

## What's left

Two genuinely non-closeable EUR residuals remain, both already known and
both out of `batch_carve`'s mechanical scope:

- `020b2d2c` and `020b3c78` — data blobs needing a whole-function-as-data
  emitter (not a `batch_carve` retry target). Follow-up work, not a gap
  in this brief.

The permanent ISA floor (42 canonical `mcr`/`mrc`/`swi` inline-assembly
files, per `docs/research/campaign-analytics/cmatch-parked-and-floor.md`)
was correctly excluded from the 79-function count from the start and was
never a target here.

With the 77-function closeable floor now fully shipped, the EUR residual
floor closeout is complete for everything `batch_carve` can reach.
