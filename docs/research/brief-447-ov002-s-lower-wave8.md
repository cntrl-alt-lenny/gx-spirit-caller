[//]: # (markdownlint-disable MD013 MD041)

# Brief 447 — ov002 `.s` lower-half wave 8

**Brief:** 447 (decomper). Wave 8 of the ov002 lower-half (`addr < 0x02234000`)
whole-function `.s` drain (waves 1-7 = briefs 385/387/389/391/441/443/445).
Scaffolder owns the upper half. Target ~40.

## Result

- **46 ov002 lower-half functions shipped as byte-exact `.s`** (target ~40) —
  3-region `ninja sha1` (EUR / USA / JPN) all `OK`.
- Decomper lower-half ov002 `.s` running total: **226** (waves 1-8).
- Clean batch: **46/46 verified, 0 verify-fail, 0 kind:data, 0 argpack, 0
  bytepack.**

## Method (turnkey)

`symbols.txt` MINUS `delinks.txt` enumeration, `addr < 0x02234000`, ≤0x80, excl 9
known-bad (5 longstanding + 4 argpack-sink callers from waves 5/7) → **87
candidates**. Probed the top 46 via `build/_ovprobe.py` in **two foreground
batches of 23** (wave-7 lesson: foreground batches avoid the background
process-pile-up that stalled the probe) → all 46 clean. Carved EUR-only,
`sort_delinks.py` (lower-half blocks land in their sorted region → auto-merge with
the scaffolder's upper half). USA/JPN keep these in the gap → byte-identical for
free.

## Runway — ≤0x80 band approaching its tail

After this wave, **~41 uncarved lower-half ≤0x80 candidates remain** (87 − 46).
The ≤0x80 size band is ~1 wave from exhaustion. **The lower half is NOT
thinning overall** — there are far more lower-half funcs above 0x80 (the size
filter has been ≤0x80 since wave 1; next wave should extend it, e.g. ≤0xc0, to
open the larger-but-still-tractable lower-half funcs, exactly as the scaffolder
did on the upper half).

## Gate

3-region `ninja sha1`: **EUR / USA / JPN all `OK`** (`configure eur` re-run before
`ninja sha1` so the 46 new `.o` have compile edges).
