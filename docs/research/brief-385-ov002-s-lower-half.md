[//]: # (markdownlint-disable MD013 MD041)

# Brief 385 — join the ov002 `.s` drain (lower half)

**Brief:** 385 (decomper). The permuter verdict (383) is banked — niche, not
volume. Pivot back to the productive `.s` lane and join the scaffolder on ov002
(1,713 funcs, big enough for two). **Split:** decomper takes the LOWER half of
ov002's address range (`addr < 0x02234000`), scaffolder the upper. Source
reg-alloc / plateau-class targets; `asm_escape --whole-function`; gate 3-region
`ninja sha1`. Target ~8-10. Ran on **Windows** (the `.s` lane is native there —
no wibo — and avoids the WSL keepalive friction).

## Result

- **10 ov002 lower-half functions shipped as byte-exact `.s`** — 3-region
  `ninja sha1` (EUR / USA / JPN) all `OK`.
- **The vein is deep:** 1,411 uncarved lower-half ov002 funcs remain (21 of them
  ≤0x4c — the small-leaf seam this wave drew from). Multi-wave runway.

## Method (matches the scaffolder's proven ov002 flow)

1. Enumerate uncarved lower-half (`addr < 0x02234000`) ov002 gap funcs ≤0x4c from
   `symbols.txt`, excluding any already carved in `delinks.txt` → 21 candidates.
2. `asm_escape --whole-function` each → **20/21 verified byte-identical**. The 1
   failure (`0222ceac`) is the known `to_mwasm` opcode gap (also failed scaffolder
   waves 4 & 6) — skipped.
3. **Screen** the 20:
   - **`kind:data` extern → DROP** (no dsd-linkable def → invisible link-fail).
     Dropped `021bc6e8` (refs `data_ov002_022bdfc4` = `kind:data`).
   - **bytepack / argpack-sink (`021d479c`) callers → leave for clean-C** (not
     `.s` class). Skipped `021aff4c` (bytepack), `021e2cd4` (argpack-sink caller).
4. Ship 10 of the remaining clean (`kind:bss`) targets; carve EUR-only.

## The 10 ships

| function | size | wiring |
|---|---|---|
| `func_ov002_021b085c` | 0x4c | `src/overlay002/*.s` (EUR baseline) + carve in |
| `func_ov002_021b8ecc` | 0x44 | `config/eur/arm9/overlays/ov002/delinks.txt`, |
| `func_ov002_021b9b64` | 0x3c | `end = addr + symbols.txt size`. |
| `func_ov002_021d81d4` | 0x30 | USA/JPN keep them in the gap → byte-identical |
| `func_ov002_021d90c0` | 0x3c | for free (the 358 "scheduling-deferred" func; |
| `func_ov002_02200084` | 0x3c | `.s` ships it byte-exact regardless of class). |
| `func_ov002_02200400` | 0x48 | |
| `func_ov002_022032f0` | 0x40 | |
| `func_ov002_022056ac` | 0x44 | |
| `func_ov002_0220a7f0` | 0x48 | |

## Coordination

Split is by address: decomper = `021aa4a0..0223422a` (lower), scaffolder =
`0223422a..022bdfb4` (upper). My enumeration filters `addr < 0x02234000` and skips
anything already carved, so there's no overlap with the scaffolder's shipped
funcs.

## Windows gotcha (worth recording)

When piping an enumerated func list through a file on Windows, **`python print`
writes CRLF**, and bash `read` keeps the trailing `\r` → `asm_escape` searches
for `func_…\r` and reports "not found in delinks" for *every* func (a false
negative — the funcs are in the gap). Strip CR (`sed -i 's/\r$//'`) or pipe
through `tr -d '\r'` before feeding func names to the tools.

## Gate

3-region `ninja sha1`: **EUR / USA / JPN all `OK`**.
