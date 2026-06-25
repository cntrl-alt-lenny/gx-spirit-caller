[//]: # (markdownlint-disable MD013 MD041)

# Brief 487 — USA/JPN main `.s` drain, chunk 2 (stacked PR 2/N)

**Brief:** 485-series rolling autonomous drain, chunk 2. Branched off the pushed
chunk-1 branch (`decomper/usajpn-main-s-485`, PR #1025); brain merges the stack in
order. Same lane: USA + JPN main only; ov004/006/011 stay drained.

## Result

- **1,261 ships: USA 630 + JPN 631.**
  USA: SHIPPED 630 / REFUSE 16 / verify-fail 3 / gate-fail 1, clean-rate **96%**.
  JPN: SHIPPED 631 / REFUSE 15 / verify-fail 3 / gate-fail 1, clean-rate **97%**.
- 3-region `ninja sha1`: **EUR / USA / JPN all `OK`** (per-batch region gates + final confirm).

## Remaining after chunk 2

| region | uncarved | carved so far (chunks 1+2) |
|--------|---------:|---------------------------:|
| USA main | **745** | 1266 |
| JPN main | **1159** | 1271 |

Runway thinning on USA (~1 chunk left), JPN ~2 chunks. Expect chunk 3 (#489) and
possibly a final tail chunk (#491).

## Residual gate-fail + a process fix

- **`func_02020fa4` gate-failed again in BOTH regions** (the chunk-1 residual). It
  is NOT carved (parked), so it re-enumerates every chunk and costs a bisect each
  time. **Fix going forward:** seeded a persistent skip-list
  (`build/_skip_<region>.txt`, git-ignored) with it and pass `--skip-list` from
  chunk 3 — so the recurring non-drift gate-fail (and accumulating
  refuse/verify-fail parks via `--verifyfail-list`) stop being re-attempted. (This
  chunk's USA run predated the seed, so it re-failed once more — harmless, parked.)

## to_mwasm gaps

**No NEW `to_mwasm` "did-not-assemble" gaps.** Verify-fails (3+3) are the
pre-existing hard residue. Clean-rate holding 96–97% as sizes grow.

## Method

Same as chunk 1: `batch_carve --version <usa|jpn> --srcdir src/<region>/main
--min-addr 0x0 --batch 50 --limit 650`, `python -u`, gate-each-batch +
commit-on-pass, reap python between region runs, self-sorted delinks. Stacked off
chunk 1 (no re-baseline — the gap `.o` stay current through the batch gates).
