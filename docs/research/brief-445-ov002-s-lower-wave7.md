[//]: # (markdownlint-disable MD013 MD041)

# Brief 445 — ov002 `.s` lower-half wave 7

**Brief:** 445 (decomper). Wave 7 of the ov002 lower-half (`addr < 0x02234000`)
whole-function `.s` drain (waves 1-6 = briefs 385/387/389/391/441/443). Scaffolder
owns the upper half. Target ~40.

## Result

- **44 ov002 lower-half functions shipped as byte-exact `.s`** (target ~40) —
  3-region `ninja sha1` (EUR / USA / JPN) all `OK`.
- Decomper lower-half ov002 `.s` running total: **180** (waves 1-7).

## Method (turnkey)

`symbols.txt` MINUS `delinks.txt` enumeration, `addr < 0x02234000`, ≤0x80, excl 7
known-bad → **133 candidates** (0x68-0x80 band now; the smaller bands drained in
waves 1-6). Probed the top 46 via `build/_ovprobe.py` → **44 verified, 0
verify-fail, 0 kind:data, 2 argpack-sink callers dropped** (`021b0184`,
`021e2d20` — left for clean-C), 0 bytepack. Carved EUR-only, `sort_delinks.py`
(lower-half blocks land in their sorted region → auto-merge with the scaffolder's
upper half). USA/JPN keep these in the gap → byte-identical for free.

### Tooling note (process hygiene)

A background probe stalled this wave under accumulated `python` processes from
prior waves' background tasks (~17 lingering). Cleared them
(`Get-Process python | Stop-Process`), cleaned the untracked `.s` slate, and
re-ran the probe deterministically in two foreground batches of 23 — clean both
times. Lesson: reap stray background `python` between waves; for the probe,
foreground batches avoid the pile-up entirely. The 3-region gate is the safety net
for any `.s` write-race regardless.

## Runway (not thinning)

After this wave, **~89 uncarved lower-half ≤0x80 candidates remain** (133 − 44),
plus far more above 0x80. Multiple waves of runway.

## Gate

3-region `ninja sha1`: **EUR / USA / JPN all `OK`** (`configure eur` re-run before
`ninja sha1` so the 44 new `.o` have compile edges).
