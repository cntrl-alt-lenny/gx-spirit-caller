[//]: # (markdownlint-disable MD013 MD041)

# Brief 431 — region port, wave 5 (USA + JPN) — USA HIGH-floor lane reaches its tail

**Brief:** 431 (decomper). Wave 5 of the turnkey USA/JPN region-port lane (briefs
421 scout/pilot, 423/425/427/429). Mechanism, tooling, hazards: see
[`brief-423-region-port-scale.md`](brief-423-region-port-scale.md).

## Result

- **45 USA + 34 JPN `.c` ports** (79 this wave), each into `src/<region>/main/`,
  HIGH-confidence / byte-sim 1.000, gated byte-identical.
- **3-region `ninja sha1`: EUR / USA / JPN all `OK`** (EUR unchanged).
- **KEY FINDING: USA's HIGH-floor / byte-sim-1.000 `.c` lane on `main` is at its
  tail.** This wave the USA porter attempted *all* 184 remaining portable
  candidates and only 46 were link-clean. JPN is still healthy (ported 34 with
  plenty left).

## USA tail analysis

USA `main` `.c` lane total is now **255** (briefs 421–431). Of the 137
portable-unported candidates remaining after this wave:

| Bucket | Count | Why it won't port at the current bar |
|--------|------:|--------------------------------------|
| SDK-name-blocked | 47 | references `Fill32` / `OS_RestoreIrq` — named in EUR, address-named in USA → undefined symbol (parked since 423) |
| Sub-floor self-refusal | 90 | `port_to_region` refuses: a *called* symbol resolves below the HIGH confidence floor |

So the HIGH-floor link-clean USA pool is effectively drained — the 45 this wave
were the last of it. **Levers to keep USA scaling (for a future brief):**

1. **Lower the confidence floor to MEDIUM** (`--confidence-floor MEDIUM`,
   auto-promote on) — ports the 90 sub-floor candidates; higher risk, but the
   3-region `sha1` gate validates every byte, so a wrong resolution fails loudly.
2. **Verified region alias for `Fill32` / `OS_RestoreIrq`** — unblocks the 47
   SDK-blocked (siblings are LOW-confidence, so this needs a careful by-hand map).
3. **Move USA to clean overlay funcs** — the scout's overlay pools (ov002 etc.)
   are mostly port-clean too.

JPN, by contrast, still has a healthy HIGH-floor pool (~3 more waves of `main`).

## Running totals (region-port lane: 421 + 423 + 425 + 427 + 429 + 431)

| Region | This wave | Lane total | Byte-portable `.c` | HIGH-floor link-clean remaining |
|--------|----------:|-----------:|-------------------:|--------------------------------:|
| USA | 45 | 254 | 877 | ~0 on main (tail reached; 47 SDK-blocked + 90 sub-floor remain) |
| JPN | 34 | 154 | 877 | healthy (239 raw; ~3 waves) |

## Method (turnkey)

Cached scan + validated porter. Filters parked the usual residue (USA
mismatch 4 / SDK-name 44; JPN mismatch 6 / SDK-name 52 across the two JPN runs);
no spurious `void` rejects. Both delinks `sort_delinks.py`-canonicalised; static
collision scan clean. Proactive MD018 doc sweep before push (tree clean).

**Recurrence fix:** the brief-429 compile-fail `func_020821e0` re-ported this wave
— it was *parked* (not on `main`), so the porter's live-exists check didn't skip
it and it isn't catchable by the static filters. The gate caught it again; I
dropped it and added a persistent `KNOWN_BAD_OUTPUTS` skip-set to
`build/_region_port.py` so parked compile-fails never re-port.

## Parked (unchanged)

`Fill32`/`OS_RestoreIrq` referencers, sub-floor (HIGH) candidates, duplicate-shape
mismatches, and brief 421's divergent residue (`main` `-244`/0xf4 drift band +
overlay-swap group `{ov000, ov002, ov005, ov008}`).

## Gate

3-region `ninja sha1`: **EUR / USA / JPN all `OK`**.
