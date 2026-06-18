[//]: # (markdownlint-disable MD013 MD041)

# Brief 449 — ov002 `.s` lower-half wave 9 (size filter extended to ≤0xc0)

**Brief:** 449 (decomper). Wave 9 of the ov002 lower-half (`addr < 0x02234000`)
whole-function `.s` drain (waves 1-8 = briefs 385/387/389/391/441/443/445/447).
Scaffolder owns the upper half. Target ~40.

## Result

- **50 ov002 lower-half functions shipped as byte-exact `.s`** (target ~40) —
  3-region `ninja sha1` (EUR / USA / JPN) all `OK`.
- Decomper lower-half ov002 `.s` running total: **276** (waves 1-9).

## Size filter extended ≤0x80 → ≤0xc0 (the wave-8 flag, actioned)

Wave 8 noted the ≤0x80 band was ~1 wave from its tail. This wave I extended the
enumeration size filter to **≤0xc0**, which opened a large pool: **340 candidates
≤0xc0 (41 ≤0x80 + 299 in the 0x84-0xc0 band)**. So the lower half is firmly NOT
thinning — extending the band just unlocked ~300 more tractable funcs (the same
move the scaffolder made on the upper half).

The larger 0x84-0xc0 funcs port just as cleanly as the small ones this wave: of
52 probed, **50 verified byte-identical, 0 verify-fail, 0 kind:data, 2
argpack-sink callers dropped** (`021d8204`, `021e2d94` — left for clean-C), 0
bytepack.

## Method (turnkey)

`symbols.txt` MINUS `delinks.txt` enumeration, `addr < 0x02234000`, **≤0xc0**,
excl 9 known-bad. Reaped stray `python` first; probed the top 52 via
`build/_ovprobe.py` in **two foreground batches of 26** (wave-7 lesson). Carved
EUR-only, `sort_delinks.py` (lower-half blocks → auto-merge with the scaffolder's
upper half). USA/JPN keep these in the gap → byte-identical for free.

## Runway (deep — not thinning)

After this wave, **~288 uncarved lower-half ≤0xc0 candidates remain** (340 − 50 −
2 argpack), plus more above 0xc0. The band-extension confirmed many waves of
runway.

## Gate

3-region `ninja sha1`: **EUR / USA / JPN all `OK`** (`configure eur` re-run before
`ninja sha1` so the 50 new `.o` have compile edges).
