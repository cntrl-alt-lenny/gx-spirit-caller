[//]: # (markdownlint-disable MD013 MD041)

# Brief 441 — PIVOT back to EUR `.s`: ov002 lower-half wave 5

**Brief:** 441 (decomper). Region-porting is parked (brief 439 confirmed the main
clean-port lane is drained; the USA/JPN MEDIUM + hard residue waits for the
end-campaign). Back on the EUR `.s` frontier: resume the ov002 **lower-half**
(`addr < 0x02234000`) whole-function `.s` drain (waves 1-4 = briefs 385/387/389/391).
Scaffolder owns the upper half (`≥0x02234000`). Target ~28.

## Result

- **38 ov002 lower-half functions shipped as byte-exact `.s`** (target ~28) —
  3-region `ninja sha1` (EUR / USA / JPN) all `OK`.
- Decomper lower-half ov002 `.s` running total: **94** (waves 1-4 = 56, + 38).

## Method (the established ov002 `.s` flow)

1. Branch off fresh main; baseline EUR build (so the delinked gap `.o` exist for
   `asm_escape`).
2. **Enumerate uncarved lower-half** via the dsd-dis-panic workaround: `symbols.txt`
   funcs `MINUS` `delinks.txt` carved set, `addr < 0x02234000`, size ≤0x80,
   excluding 5 known-bad (`0222ceac` asm-gap, `021bc6e8` kind:data, `021d8184` /
   `021e2cd4` argpack, `021aff4c` bytepack). **215 candidates** — deep runway (the
   ≤0x58 band drained in waves 1-4; this wave is the 0x5c-0x68 band).
3. `asm_escape --whole-function` the top 40 → **38 verified byte-identical**, 0
   verify-fails, 0 `kind:data`. Screened out **2 argpack-sink callers**
   (`021d8128`, `021d87dc` — call `func_ov002_021d479c`; left for clean-C), 0
   bytepack.
4. Carve EUR-only (`src/overlay002/*.s` + `config/eur/.../ov002/delinks.txt`,
   `end = addr + symbols.txt size`), then `python tools/sort_delinks.py …` so the
   lower-half blocks land in their sorted region and **auto-merge with the
   scaffolder's upper-half** wave.

USA/JPN keep these funcs in the gap → byte-identical for free.

## Runway (not thinning)

After this wave, **~175 uncarved lower-half ≤0x80 candidates remain** (215 − 38 −
2 argpack), plus far more above 0x80. Many waves of lower-half runway.

## Gate

3-region `ninja sha1`: **EUR / USA / JPN all `OK`** (re-ran `configure eur`
before `ninja sha1` so the 38 new `.o` have compile edges). `sort_delinks.py`
canonicalised the delinks (auto-merges with the scaffolder's upper half).
