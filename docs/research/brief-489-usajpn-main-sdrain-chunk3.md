[//]: # (markdownlint-disable MD013 MD041)

# Brief 489 — USA/JPN main `.s` drain, chunk 3 (stacked PR 3/N): USA main drained

**Brief:** 485-series rolling autonomous drain, chunk 3. Stacked off the pushed
chunk-2 branch (`decomper/usajpn-main-s-487`, PR #1027). USA + JPN main only;
ov004/006/011 stay drained. Skip-list (`--skip-list`/`--verifyfail-list`) active
this chunk.

## Result

- **1,325 ships: USA 696 + JPN 629.**
  USA: SHIPPED 696 / REFUSE 26 / verify-fail 6 / gate-fail 1, clean-rate **95%**.
  JPN: SHIPPED 629 / REFUSE 18 / verify-fail 3 / gate-fail 0, clean-rate **96%**.
- 3-region `ninja sha1`: **EUR / USA / JPN all `OK`** (per-batch region gates + final confirm).

## ⭐ USA main is effectively DRAINED

| region | uncarved | carved (chunks 1-3) | note |
|--------|---------:|--------------------:|------|
| USA main | **49** (42 ≤0x200) | 2009 | drained — residue is refuse/verify-fail/hard tail |
| JPN main | **530** (251 ≤0x200) | 1900 | ~1 more chunk for the clean tail |

USA went 2011 → 49 uncarved across three chunks. The 49 left are the
non-`.s`-able residue (kind:data refuse + verify-fail + a couple gate-fails). So
**chunk 4 (#491) is the final JPN-tail chunk**, after which both veins are at the
hard-residue floor.

## Skip-list now working (no wasted bisects)

- The seeded skip-list killed the recurring `func_02020fa4` — JPN chunk 3 had
  **gate-fail 0** and never re-attempted it.
- A NEW USA gate-fail surfaced this chunk: **`func_020b3988`** (same non-drift
  byte-mismatch category — asm_escape verifies, ROM `sha1` differs on link).
  Auto-parked to `build/_skip_usa.txt` (the `--skip-list` now accumulates all
  refuse/verify-fail/gate-fail parks), so it won't recur.

## to_mwasm gaps

**No NEW `to_mwasm` "did-not-assemble" gaps.** verify-fails (6 USA + 3 JPN) are
the pre-existing hard residue (slightly more as the larger funcs come in).
Clean-rate eased 98→95% as sizes grow, still high.

## Method

Same rolling pipeline + `--skip-list build/_skip_<region>.txt --verifyfail-list
build/_vf_<region>.txt` so parks persist across chunks. `python -u`, batch 50,
commit-on-pass, reap between region runs, self-sorted delinks. USA run was
`--limit 800` to drain the remaining tail.
