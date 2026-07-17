# Brief 589: Census bundle

This evidence was collected from committed config on 2026-07-17. The census
commands were dry-runs only. No `ninja sha1`, `ninja rom`, Wine, or real carve
was run.

## Task 1: dry-run census

The following are the `scope` and `REPORT` lines emitted verbatim by the fixed
`batch_carve.py` for each requested module.

### USA

```text
scope ov000 0x0-0x10000: 0 candidates (batch=20, dry_run=True)
REPORT: SHIPPED 0 | REFUSE 0 | absorbed-routed 0 | verify-fail 0 | gate-fail 0 | deferred 0 | clean-rate 0% | commits 0
scope ov008 0x0-0x10000: 0 candidates (batch=20, dry_run=True)
REPORT: SHIPPED 0 | REFUSE 0 | absorbed-routed 0 | verify-fail 0 | gate-fail 0 | deferred 0 | clean-rate 0% | commits 0
scope ov005 0x0-0x10000: 0 candidates (batch=20, dry_run=True)
REPORT: SHIPPED 0 | REFUSE 0 | absorbed-routed 0 | verify-fail 0 | gate-fail 0 | deferred 0 | clean-rate 0% | commits 0
scope ov010 0x0-0x10000: 0 candidates (batch=20, dry_run=True)
REPORT: SHIPPED 0 | REFUSE 0 | absorbed-routed 0 | verify-fail 0 | gate-fail 0 | deferred 0 | clean-rate 0% | commits 0
scope ov016 0x0-0x10000: 0 candidates (batch=20, dry_run=True)
REPORT: SHIPPED 0 | REFUSE 0 | absorbed-routed 0 | verify-fail 0 | gate-fail 0 | deferred 0 | clean-rate 0% | commits 0
scope ov017 0x0-0x10000: 0 candidates (batch=20, dry_run=True)
REPORT: SHIPPED 0 | REFUSE 0 | absorbed-routed 0 | verify-fail 0 | gate-fail 0 | deferred 0 | clean-rate 0% | commits 0
scope ov015 0x0-0x10000: 0 candidates (batch=20, dry_run=True)
REPORT: SHIPPED 0 | REFUSE 0 | absorbed-routed 0 | verify-fail 0 | gate-fail 0 | deferred 0 | clean-rate 0% | commits 0
scope ov019 0x0-0x10000: 0 candidates (batch=20, dry_run=True)
REPORT: SHIPPED 0 | REFUSE 0 | absorbed-routed 0 | verify-fail 0 | gate-fail 0 | deferred 0 | clean-rate 0% | commits 0
scope ov020 0x0-0x10000: 0 candidates (batch=20, dry_run=True)
REPORT: SHIPPED 0 | REFUSE 0 | absorbed-routed 0 | verify-fail 0 | gate-fail 0 | deferred 0 | clean-rate 0% | commits 0
scope ov014 0x0-0x10000: 0 candidates (batch=20, dry_run=True)
REPORT: SHIPPED 0 | REFUSE 0 | absorbed-routed 0 | verify-fail 0 | gate-fail 0 | deferred 0 | clean-rate 0% | commits 0
scope ov009 0x0-0x10000: 0 candidates (batch=20, dry_run=True)
REPORT: SHIPPED 0 | REFUSE 0 | absorbed-routed 0 | verify-fail 0 | gate-fail 0 | deferred 0 | clean-rate 0% | commits 0
scope ov003 0x0-0x10000: 0 candidates (batch=20, dry_run=True)
REPORT: SHIPPED 0 | REFUSE 0 | absorbed-routed 0 | verify-fail 0 | gate-fail 0 | deferred 0 | clean-rate 0% | commits 0
scope ov007 0x0-0x10000: 0 candidates (batch=20, dry_run=True)
REPORT: SHIPPED 0 | REFUSE 0 | absorbed-routed 0 | verify-fail 0 | gate-fail 0 | deferred 0 | clean-rate 0% | commits 0
scope ov021 0x0-0x10000: 0 candidates (batch=20, dry_run=True)
REPORT: SHIPPED 0 | REFUSE 0 | absorbed-routed 0 | verify-fail 0 | gate-fail 0 | deferred 0 | clean-rate 0% | commits 0
scope ov012 0x0-0x10000: 0 candidates (batch=20, dry_run=True)
REPORT: SHIPPED 0 | REFUSE 0 | absorbed-routed 0 | verify-fail 0 | gate-fail 0 | deferred 0 | clean-rate 0% | commits 0
scope ov022 0x0-0x10000: 0 candidates (batch=20, dry_run=True)
REPORT: SHIPPED 0 | REFUSE 0 | absorbed-routed 0 | verify-fail 0 | gate-fail 0 | deferred 0 | clean-rate 0% | commits 0
scope ov013 0x0-0x10000: 0 candidates (batch=20, dry_run=True)
REPORT: SHIPPED 0 | REFUSE 0 | absorbed-routed 0 | verify-fail 0 | gate-fail 0 | deferred 0 | clean-rate 0% | commits 0
scope ov018 0x0-0x10000: 0 candidates (batch=20, dry_run=True)
REPORT: SHIPPED 0 | REFUSE 0 | absorbed-routed 0 | verify-fail 0 | gate-fail 0 | deferred 0 | clean-rate 0% | commits 0
scope ov001 0x0-0x10000: 0 candidates (batch=20, dry_run=True)
REPORT: SHIPPED 0 | REFUSE 0 | absorbed-routed 0 | verify-fail 0 | gate-fail 0 | deferred 0 | clean-rate 0% | commits 0
scope ov023 0x0-0x10000: 0 candidates (batch=20, dry_run=True)
REPORT: SHIPPED 0 | REFUSE 0 | absorbed-routed 0 | verify-fail 0 | gate-fail 0 | deferred 0 | clean-rate 0% | commits 0
scope main 0x0-0x10000: 1 candidates (batch=20, dry_run=True)
REPORT: SHIPPED 1 | REFUSE 0 | absorbed-routed 0 | verify-fail 0 | gate-fail 0 | deferred 0 | clean-rate 100% | commits 0
```

### JPN

```text
scope ov000 0x0-0x10000: 0 candidates (batch=20, dry_run=True)
REPORT: SHIPPED 0 | REFUSE 0 | absorbed-routed 0 | verify-fail 0 | gate-fail 0 | deferred 0 | clean-rate 0% | commits 0
scope ov008 0x0-0x10000: 0 candidates (batch=20, dry_run=True)
REPORT: SHIPPED 0 | REFUSE 0 | absorbed-routed 0 | verify-fail 0 | gate-fail 0 | deferred 0 | clean-rate 0% | commits 0
scope ov005 0x0-0x10000: 0 candidates (batch=20, dry_run=True)
REPORT: SHIPPED 0 | REFUSE 0 | absorbed-routed 0 | verify-fail 0 | gate-fail 0 | deferred 0 | clean-rate 0% | commits 0
scope ov010 0x0-0x10000: 0 candidates (batch=20, dry_run=True)
REPORT: SHIPPED 0 | REFUSE 0 | absorbed-routed 0 | verify-fail 0 | gate-fail 0 | deferred 0 | clean-rate 0% | commits 0
scope ov016 0x0-0x10000: 0 candidates (batch=20, dry_run=True)
REPORT: SHIPPED 0 | REFUSE 0 | absorbed-routed 0 | verify-fail 0 | gate-fail 0 | deferred 0 | clean-rate 0% | commits 0
scope ov017 0x0-0x10000: 0 candidates (batch=20, dry_run=True)
REPORT: SHIPPED 0 | REFUSE 0 | absorbed-routed 0 | verify-fail 0 | gate-fail 0 | deferred 0 | clean-rate 0% | commits 0
scope ov015 0x0-0x10000: 0 candidates (batch=20, dry_run=True)
REPORT: SHIPPED 0 | REFUSE 0 | absorbed-routed 0 | verify-fail 0 | gate-fail 0 | deferred 0 | clean-rate 0% | commits 0
scope ov019 0x0-0x10000: 0 candidates (batch=20, dry_run=True)
REPORT: SHIPPED 0 | REFUSE 0 | absorbed-routed 0 | verify-fail 0 | gate-fail 0 | deferred 0 | clean-rate 0% | commits 0
scope ov020 0x0-0x10000: 0 candidates (batch=20, dry_run=True)
REPORT: SHIPPED 0 | REFUSE 0 | absorbed-routed 0 | verify-fail 0 | gate-fail 0 | deferred 0 | clean-rate 0% | commits 0
scope ov014 0x0-0x10000: 0 candidates (batch=20, dry_run=True)
REPORT: SHIPPED 0 | REFUSE 0 | absorbed-routed 0 | verify-fail 0 | gate-fail 0 | deferred 0 | clean-rate 0% | commits 0
scope ov009 0x0-0x10000: 0 candidates (batch=20, dry_run=True)
REPORT: SHIPPED 0 | REFUSE 0 | absorbed-routed 0 | verify-fail 0 | gate-fail 0 | deferred 0 | clean-rate 0% | commits 0
scope ov003 0x0-0x10000: 0 candidates (batch=20, dry_run=True)
REPORT: SHIPPED 0 | REFUSE 0 | absorbed-routed 0 | verify-fail 0 | gate-fail 0 | deferred 0 | clean-rate 0% | commits 0
scope ov007 0x0-0x10000: 0 candidates (batch=20, dry_run=True)
REPORT: SHIPPED 0 | REFUSE 0 | absorbed-routed 0 | verify-fail 0 | gate-fail 0 | deferred 0 | clean-rate 0% | commits 0
scope ov021 0x0-0x10000: 0 candidates (batch=20, dry_run=True)
REPORT: SHIPPED 0 | REFUSE 0 | absorbed-routed 0 | verify-fail 0 | gate-fail 0 | deferred 0 | clean-rate 0% | commits 0
scope ov012 0x0-0x10000: 0 candidates (batch=20, dry_run=True)
REPORT: SHIPPED 0 | REFUSE 0 | absorbed-routed 0 | verify-fail 0 | gate-fail 0 | deferred 0 | clean-rate 0% | commits 0
scope ov022 0x0-0x10000: 0 candidates (batch=20, dry_run=True)
REPORT: SHIPPED 0 | REFUSE 0 | absorbed-routed 0 | verify-fail 0 | gate-fail 0 | deferred 0 | clean-rate 0% | commits 0
scope ov013 0x0-0x10000: 0 candidates (batch=20, dry_run=True)
REPORT: SHIPPED 0 | REFUSE 0 | absorbed-routed 0 | verify-fail 0 | gate-fail 0 | deferred 0 | clean-rate 0% | commits 0
scope ov018 0x0-0x10000: 0 candidates (batch=20, dry_run=True)
REPORT: SHIPPED 0 | REFUSE 0 | absorbed-routed 0 | verify-fail 0 | gate-fail 0 | deferred 0 | clean-rate 0% | commits 0
scope ov001 0x0-0x10000: 0 candidates (batch=20, dry_run=True)
REPORT: SHIPPED 0 | REFUSE 0 | absorbed-routed 0 | verify-fail 0 | gate-fail 0 | deferred 0 | clean-rate 0% | commits 0
scope ov023 0x0-0x10000: 0 candidates (batch=20, dry_run=True)
REPORT: SHIPPED 0 | REFUSE 0 | absorbed-routed 0 | verify-fail 0 | gate-fail 0 | deferred 0 | clean-rate 0% | commits 0

scope main 0x0-0x10000: 1 candidates (batch=20, dry_run=True)
REPORT: SHIPPED 1 | REFUSE 0 | absorbed-routed 0 | verify-fail 0 | gate-fail 0 | deferred 0 | clean-rate 100% | commits 0
```

## Ledger comparison

The ledger has no per-module byte rows. The byte column below is therefore the
current byte-derived unmatched total from the same committed symbols/delinks
inputs; it is labeled explicitly rather than inferred from the stale prose
snapshot. Counts are `USA / JPN`; a flag is emitted only for a non-zero
census-vs-ledger discrepancy.

| Module | Ledger bytes (USA / JPN) | Census candidates (USA / JPN) | Flag |
|---|---:|---:|---|
| main | `0x956` / `0x8e2` | 1 / 1 | — |
| ov000 | `0x0` / `0x0` | 0 / 0 | — |
| ov008 | `0x6c` / `0x6c` | 0 / 0 | FLAG |
| ov005 | `0xe0` / `0xe0` | 0 / 0 | FLAG |
| ov010 | `0x170` / `0x170` | 0 / 0 | FLAG |
| ov016 | `0xdc` / `0xdc` | 0 / 0 | FLAG |
| ov017 | `0x11c` / `0x11c` | 0 / 0 | FLAG |
| ov015 | `0x11c` / `0x11c` | 0 / 0 | FLAG |
| ov019 | `0x414` / `0x414` | 0 / 0 | FLAG |
| ov020 | `0x1dc` / `0x1dc` | 0 / 0 | FLAG |
| ov014 | `0x3b4` / `0x3b4` | 0 / 0 | FLAG |
| ov009 | `0x88` / `0x88` | 0 / 0 | FLAG |
| ov003 | `0x394` / `0x394` | 0 / 0 | FLAG |
| ov007 | `0xb0` / `0xb0` | 0 / 0 | FLAG |
| ov021 | `0x58` / `0x58` | 0 / 0 | FLAG |
| ov012 | `0x0` / `0x0` | 0 / 0 | — |
| ov022 | `0xa0` / `0xa0` | 0 / 0 | FLAG |
| ov013 | `0x14` / `0x14` | 0 / 0 | FLAG |
| ov018 | `0x15c` / `0x15c` | 0 / 0 | FLAG |
| ov001 | `0x1c4` / `0x1c4` | 0 / 0 | FLAG |
| ov023 | `0x64` / `0x64` | 0 / 0 | FLAG |

## Task 2: signature census

```text
Sampled: 40  (sig_new failures: 1)
Elapsed: 45.6s

Internal clone census (boolean signal only — see tool docstring):
  applied_noop     29
  multiple         10
  -> 9 NOT in any known-family catalogue (candidate new families), 1 already catalogued

Region-twin map:
  eur:
    applied_noop         29
    multiple             10
  usa:
    applied_rename       29
    multiple             10
  jpn:
    applied_rename       29
    multiple             10
wrote docs/research/sig-census-results.json
```

## Task 3: ITCM census

The per-function ITCM table is appended to `endgame-ledger.md` under
`Appendix: ITCM detail`. The tool summaries were:

```text
EUR: 11 unmatched, 0x794 bytes (9 under 0x100; 2 from 0x100-0x200)
USA: 14 unmatched, 0x86c bytes (12 under 0x100; 2 from 0x100-0x200)
JPN: 14 unmatched, 0x86c bytes (12 under 0x100; 2 from 0x100-0x200)
```

| Name | Address | Size | Region |
|---|---|---:|---|
| `func_01ff8000` | `0x01ff8000` | `0x98` | EUR |
| `func_01ff8098` | `0x01ff8098` | `0xe8` | EUR |
| `func_01ff8180` | `0x01ff8180` | `0x58` | EUR |
| `func_01ff81d8` | `0x01ff81d8` | `0x15c` | EUR |
| `func_01ff8334` | `0x01ff8334` | `0xcc` | EUR |
| `func_01ff8414` | `0x01ff8414` | `0x130` | EUR |
| `func_01ff8544` | `0x01ff8544` | `0xe0` | EUR |
| `func_01ff8624` | `0x01ff8624` | `0x40` | EUR |
| `func_01ff8664` | `0x01ff8664` | `0x60` | EUR |
| `func_01ff86c4` | `0x01ff86c4` | `0x38` | EUR |
| `func_01ff87c0` | `0x01ff87c0` | `0xac` | EUR |
| `func_01ff8000` | `0x01ff8000` | `0x98` | USA |
| `func_01ff8098` | `0x01ff8098` | `0xe8` | USA |
| `func_01ff8180` | `0x01ff8180` | `0x58` | USA |
| `func_01ff81d8` | `0x01ff81d8` | `0x15c` | USA |
| `func_01ff8334` | `0x01ff8334` | `0xcc` | USA |
| `func_01ff8400` | `0x01ff8400` | `0x14` | USA |
| `func_01ff8414` | `0x01ff8414` | `0x130` | USA |
| `func_01ff8544` | `0x01ff8544` | `0xe0` | USA |
| `func_01ff8624` | `0x01ff8624` | `0x40` | USA |
| `func_01ff8664` | `0x01ff8664` | `0x60` | USA |
| `func_01ff86c4` | `0x01ff86c4` | `0x38` | USA |
| `func_01ff86fc` | `0x01ff86fc` | `0x74` | USA |
| `func_01ff8770` | `0x01ff8770` | `0x50` | USA |
| `func_01ff87c0` | `0x01ff87c0` | `0xac` | USA |
| `func_01ff8000` | `0x01ff8000` | `0x98` | JPN |
| `func_01ff8098` | `0x01ff8098` | `0xe8` | JPN |
| `func_01ff8180` | `0x01ff8180` | `0x58` | JPN |
| `func_01ff81d8` | `0x01ff81d8` | `0x15c` | JPN |
| `func_01ff8334` | `0x01ff8334` | `0xcc` | JPN |
| `func_01ff8400` | `0x01ff8400` | `0x14` | JPN |
| `func_01ff8414` | `0x01ff8414` | `0x130` | JPN |
| `func_01ff8544` | `0x01ff8544` | `0xe0` | JPN |
| `func_01ff8624` | `0x01ff8624` | `0x40` | JPN |
| `func_01ff8664` | `0x01ff8664` | `0x60` | JPN |
| `func_01ff86c4` | `0x01ff86c4` | `0x38` | JPN |
| `func_01ff86fc` | `0x01ff86fc` | `0x74` | JPN |
| `func_01ff8770` | `0x01ff8770` | `0x50` | JPN |
| `func_01ff87c0` | `0x01ff87c0` | `0xac` | JPN |
| **Totals** |  |  | **EUR 11 / USA 14 / JPN 14** |

## Verification

The full test command was run without ROM or SHA-1 build commands. Final tail:

```text
........... [ 74%]
........................................................................ [ 77%]
........................................................................ [ 79%]
........................................................................ [ 82%]
........................................................................ [ 85%]
........................................................................ [ 88%]
........................................................................ [ 91%]
........................................................................ [ 93%]
........................................................................ [ 96%]
........................................................................ [ 99%]
...............                                                          [100%]
2591 passed, 3 skipped, 13 subtests passed in 12.66s
```
