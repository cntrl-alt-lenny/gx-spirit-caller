# Brief 471 — USA/JPN `.s` mechanical drain w3 (dual-lane, shared gate-lock)

**Decomper, brief 471.** Continued the USA/JPN `.s` drain from the b469 baseline
(USA main 521, JPN main 140), running **concurrently with the scaffolder's
EUR-ov002 lane** (brief 470) sharing `/tmp/spirit-caller-gate.lock`.

## Ships (vs `main`)

| Module | This PR | On disk | Gate |
|--------|---------|---------|------|
| **USA main** | **+120 `.s`** | 641 | `usa sha1` **OK** |
| **JPN main** | **+98 `.s`** | 238 | `jpn sha1` **OK** |
| EUR | 0 (untouched) | — | green by construction* |

\* `git diff --name-only origin/main..HEAD` touches only `src/usa/`, `src/jpn/`,
`docs/` — no EUR build input — so EUR is byte-identical to green `main`.
**+218 region `.s` total**, every one a per-batch `ninja sha1`-gated commit. No
new tooling — the b469 fixes (now merged on `main`) carried the lane. Bands
drained: USA `0x34→0x40`, JPN `0x10→0x18`, both ~95–100 % clean.

## The dual-lane reality: the shared gate-lock works, but it serialises throughput

The b469 cross-process `fcntl.flock` + `_wait_wine_quiet` (now on **both** sides)
did its job: across the whole round there was **zero deadlock and zero crash** —
when the scaffolder held the wineserver, our gate's lock-wait simply hit
`--gate-timeout 600` and **DEFERRED the batch** (`⏳ gate timed out (contention)
-> DEFER N, re-attemptable next run`), never a park, never a corruption. That is
the b469 design working as intended and is a real improvement over b468 (where
the scaffolder was *starved to +2*).

**But the lock prevents starvation-death, not throughput-halving.** Only one lane
can link at a time, so the system's total gate throughput is ~one lane's worth,
split between us. Observed pattern over the round:

- **Scaffolder active** (its EUR gates back-to-back): our gates lose the flock
  race and DEFER after 600 s. Net ship rate ≈ **0** during these windows (saw two
  consecutive ~14-min stretches at +0 USA, 2 defers).
- **Scaffolder paused** (between its chunked `--limit 50` waves): we get the lock
  immediately and drain at near-solo speed (JPN jumped +44 in one such window).

So progress is **bursty and gated by the scaffolder's pause windows**, not by our
clean-rate (which stayed ~95–100 %). USA main netted +120 before the contention
windows dried up; pivoting to JPN main (a fresh band) caught a long scaffolder
pause and netted +98 quickly.

### Operational notes banked this round

- **`--batch 25` is worse than `--batch 10` in culprit-bearing bands.** I tried
  batch-25 on JPN to reduce flock-acquisition frequency under contention, but the
  `0x10–0x18` band has scattered link-culprits → a RED triggers a *25-way* bisect
  (≈6–8 gates) that stalls badly under contention. **Stick with `--batch 10`** —
  the cheaper bisect outweighs the extra flock acquisitions.
- The `reconfigure-after-kill` and `resync-delink-refs` gotchas (b469) recurred
  and were handled: every clean-stop was followed by `configure.py <ver>` before
  the next gate, and a fresh `configure && ninja sha1` at the committed state
  before each new wave.
- I am the **resumable side** (per brief): every DEFER is re-attemptable; the
  deferred USA batches (≈2–3 batches of 10) and the un-drained tail are picked up
  by simply re-running the same command.

## Runway remaining

- USA main: ~2,330 funcs (was ~2,450; drained 120). Plus ~2–3 deferred batches to
  re-attempt.
- JPN main: ~2,825 funcs (was ~2,925; drained 98).
- USA/JPN overlays (non-ov002): untouched — next lever (ov004 166, ov011 103,
  ov000 86, ov008 72, ov010 64 USA candidates; JPN ≈ equal).

## Recommendation for the brain

The shared gate-lock makes concurrent lanes **safe** but not **fast** — total
throughput is bottlenecked on the single machine-wide wineserver (one link at a
time). For maximum *project* throughput, **b468's conclusion still holds: prefer
serialising the two `batch_carve` drivers** (run one heavy lane at a time) rather
than splitting one wineserver's worth of gate bandwidth across both. If the brain
*wants* both lanes live (e.g. to make parallel progress on EUR-ov002 and USA/JPN
simultaneously), this round proves it now works without starvation — just expect
each lane at ≈half speed, drained during the other's pause windows.

Recipe unchanged (see [[reference-usajpn-sdrain-scaled]] / brief-469 doc):
`--version <r> --srcdir src/<r>/main --min-addr 0x02000000 --batch 10
--gate-timeout 600` + persistent skip-lists.
