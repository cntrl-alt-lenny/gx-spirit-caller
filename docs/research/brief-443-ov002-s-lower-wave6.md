[//]: # (markdownlint-disable MD013 MD041)

# Brief 443 — ov002 `.s` lower-half wave 6

**Brief:** 443 (decomper). Wave 6 of the ov002 lower-half (`addr < 0x02234000`)
whole-function `.s` drain (waves 1-5 = briefs 385/387/389/391/441). Scaffolder
owns the upper half. Target ~30.

## Result

- **42 ov002 lower-half functions shipped as byte-exact `.s`** (target ~30) —
  3-region `ninja sha1` (EUR / USA / JPN) all `OK`.
- Decomper lower-half ov002 `.s` running total: **136** (waves 1-6).
- An exceptionally clean band: **42/42 verified, 0 verify-fail, 0 kind:data, 0
  argpack, 0 bytepack.**

## Method (turnkey)

`symbols.txt` MINUS `delinks.txt` enumeration (dsd-dis-panic workaround),
`addr < 0x02234000`, size ≤0x80, excluding 7 known-bad (5 longstanding + wave-5's
2 argpack drops `021d8128`/`021d87dc`) → **175 candidates**. Probed the top 42 via
`build/_ovprobe.py` (`asm_escape --whole-function` + verify + kind:data/argpack/
bytepack screen) → all 42 clean. Carved EUR-only, `sort_delinks.py` (lower-half
blocks land in their sorted region → auto-merge with the scaffolder's upper half).
USA/JPN keep these in the gap → byte-identical for free.

## Runway (not thinning)

After this wave, **~133 uncarved lower-half ≤0x80 candidates remain** (175 − 42),
plus far more above 0x80. Many waves of runway.

## Gate

3-region `ninja sha1`: **EUR / USA / JPN all `OK`** (`configure eur` re-run before
`ninja sha1` so the 42 new `.o` have compile edges).
