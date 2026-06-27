[//]: # (markdownlint-disable MD013 MD041)

# Brief 495 — USA/JPN overlay `.s` drain, chunk 2 (ov002, stacked PR 2/N)

**Brief:** 493-series solo overlay drain, chunk 2. Stacked off the pushed chunk-1
branch (`decomper/usajpn-ov-s-493`, PR #1034). All ov002; USA + JPN overlays only;
ov004/006/011 stay drained.

## Result

- **1,298 ov002 ships: USA 649 + JPN 649.** Both regions: SHIPPED 649 / REFUSE 1
  / verify-fail 0 / **gate-fail 0**, clean-rate **99%**.
- 3-region `ninja sha1`: **EUR / USA / JPN all `OK`** (per-batch region gates +
  final serial confirm). Note: the USA confirm hit a one-off transient build-error
  on the first pass (EUR/JPN green, every USA batch had gated `usa sha1 OK`); a
  clean re-run of `configure usa && ninja sha1` returned `OK` — transient, not a
  real mismatch. (Worth adding a retry to the confirm-gate loop, as batch_carve
  already has `--gate-retries`.)
- The 99% clean-rate holds in the second chunk — ov002 is a uniformly clean vein.

## ov002 remaining after chunk 2

| region | shipped (chunks 1-2) | **uncarved remaining** |
|--------|---------------------:|-----------------------:|
| USA ov002 | 1298 | **1447** |
| JPN ov002 | 1303 | **1583** |

~2 more chunks drains ov002. The brief caps at ~4 PRs, so chunks 3-4 stay in
ov002 and this stack ends with ov002 ~80-90% drained.

## to_mwasm gaps / residue

**No NEW `to_mwasm` gaps, 0 gate-fails, 0 verify-fails** in chunk 2. The only
residue so far is ~1 kind:data REFUSE/region/chunk. Solo lane keeps it full-speed
(no brief-486 contention).

## Method

Identical to chunk 1: `batch_carve --version <r> --overlay ov002 --srcdir
src/<r>/overlay002 --min-addr 0x021aa000 --batch 50 --limit 650`, `python -u`,
`--skip-list`/`--verifyfail-list` per ov002 scope, serial foreground gates,
self-sorted delinks. Stacked off chunk 1 (no re-baseline — batch gates keep the
overlay gap `.o` current).
