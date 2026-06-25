[//]: # (markdownlint-disable MD013 MD041)

# Brief 485 — USA/JPN main `.s` drain, chunk 1 (rolling autonomous, stacked PR 1/N)

**Brief:** 485 (decomper). Long autonomous rolling-drain of the big USA/JPN **main**
`.s` vein (main only; ov004/006/011 stay drained). Apply the brief-483 name≠addr
drift fix (merged in #1021) across the run. Stack PRs (485, 487, 489…) off each
pushed branch; brain merges in order. This is chunk 1.

## Result

- **1,276 ships: USA 636 + JPN 640** (the ~1,000–1,500/chunk target).
  USA: SHIPPED 636 / REFUSE 10 / verify-fail 3 / gate-fail 1, clean-rate **97%**.
  JPN: SHIPPED 640 / REFUSE 6 / verify-fail 3 / gate-fail 1, clean-rate **98%**.
- 3-region `ninja sha1`: **EUR / USA / JPN all `OK`** (per-batch region gates + final confirm).
- Drift fix carried the run: drift-band funcs (name≠addr) carve clean now.

## Census (this branch off origin/main) + remaining after chunk 1

| region | uncarved at start | shipped | **uncarved remaining** | remaining ≤0x200 |
|--------|------------------:|--------:|-----------------------:|-----------------:|
| USA main | 2011 | 636 | **1375** | 1096 |
| JPN main | 2430 | 640 | **1790** | 1511 |

Deep runway — supports ~2–3 more stacked chunks before thinning.

## Residual gate-fail class (the one thing not the drift fix)

- **`func_02020fa4` gate-fails in BOTH regions** (same address `0x02020fa4`, parked
  in each). asm_escape self-verifies it byte-exact, but the linked ROM `sha1`
  mismatches — a non-drift byte-mismatch (region-identical, so likely a
  self-referential reloc / literal-pool placement the delink can't reproduce). 1
  func per region; isolated + parked by the bisect, not shipped. **Not a
  `to_mwasm` assemble gap** (it assembles) — a deeper link/placement residual,
  the same *category* as the pre-fix `func_020a60a8` but NOT the name≠addr cause
  (this one's name==addr). Flagged as the next residual to autopsy if it recurs.

## to_mwasm gaps

**No NEW `to_mwasm` "did-not-assemble" gaps** in chunk 1. The verify-fails (3+3)
are the pre-existing hard residue. Clean-rate 97–98% on the small-first bands.

## Method

`batch_carve --version <usa|jpn> --srcdir src/<region>/main --min-addr 0x0
--batch 50 --limit 650`, smallest-first, **`python -u`** (kill-survivable log),
gate-each-batch + commit-on-pass, reap python between region runs. batch_carve
self-sorts the per-region delinks (post-run `sort_delinks.py` = no-op). Scaffolder
is on EUR ov002 (disjoint files) — no co-lane collision.
