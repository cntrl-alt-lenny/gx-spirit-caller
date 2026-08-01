# Port-harvest contention defer

**Date:** 2026-08-01  
**Base:** `ceefe98c1` (`origin/main`)

## Change

`tools/port_harvest.py` now checks the machine-wide process list before doing
any census or build work, using the brain protocol's exact predicate:

```powershell
Get-Process | Where-Object { $_.Name -match 'mwcc|mwld|mwasm|ninja' }
```

The check is fail-closed: a process-query failure is also deferred. The
harvester exits 0 with `status: deferred`, `ported: 0`, `gates_consumed: 0`,
and `commits: 0`; it does not claim a harvest. `batch_port.py` receives the
same check before each new batch. If contention appears after earlier green
batches, those commits remain reported as shipped and every later candidate
is reported as deferred; no gate is started while the machine is busy.

## Current measured inputs

Fresh tools on this branch reported:

| region | backlog `.s` | exact floor (`sim == 1.0`) | 0.99–<1.0 | <0.99 |
|---|---:|---:|---:|---:|
| USA | 139 | 134 | 1 | 4 |
| JPN | 141 | 136 | 1 | 4 |

`python tools/progress.py --version eur` reported EUR Natural-C as
**316,114 / 2,385,948 bytes (13.25%)**. The committed inputs are also kept in
`port-harvest-snapshots.md` for the next non-zero EUR delta.

## Scheduling verdict

Unattended operation is now safe with respect to machine-wide compiler
contention: the tool defers before census and between batches, and it never
competes with another `mwcc`, `mwld`, `mwasm`, or `ninja` process. It remains a
normal branch/clean-worktree operation, so the existing safe-start refusal is
still part of the scheduler contract.

Use the measured cadence policy from the prior study: re-census after each
substantial EUR merge, and harvest when either region reaches at least 50
exact-floor rows. This is a threshold policy, not a ports-per-EUR-point rate;
the existing endpoints had 0.00 percentage points of EUR movement.

## Reproduction

- `python tools/port_census.py`
- `python tools/progress.py --version eur`
- `python -m pytest -q tests/test_port_harvest.py`
- `python -m pytest -q tests/test_batch_port.py`

The synthetic contention test patches the process query to return `ninja` and
asserts that census and safe-start are not called. The zero-work regression
still asserts a clean exit with no false harvest claim.
