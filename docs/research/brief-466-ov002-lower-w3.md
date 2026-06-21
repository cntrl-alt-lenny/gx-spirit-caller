[//]: # (markdownlint-disable MD013 MD041)

# Brief 466 — ov002 LOWER-half ARM `.s` drain, wave 3

**Brief:** 466 (scaffolder). Continue `tools/batch_carve.py` over the ov002
lower-half range (`addr < 0x02234000`). Same chunked `--limit 50` protocol
from b464 (each commits durably in ~5 min, under the ~8–10 min background-task
cap).

## What shipped — 77 carves across 3 batches, EUR sha1 OK

| commit | shipped | verify-fail | clean-rate | size band |
|---|---|---|---|---|
| `77ecbbd2` | +26 | 24 | **52%** | 0xbc–0xc4 |
| `cafbfa94` | +1 | 49 | **2%** | 0xc4–0xc4 |
| `7bddf070` | +50 | 0 | **100%** | 0xcc–0xdc |

**77 total shipped, 73 verify-fails parked** (73 new + 1 prior = 74 total in
`build/known_verifyfail_ov002.txt`), 0 REFUSE.

## KEY FINDING — Verify-fail wall at 0xbc-0xcc, recovers above 0xcc

This wave hit the **first verify-fails in the ov002 lower-half lane**. The
pattern is striking:

| size band | clean-rate | notes |
|---|---|---|
| ≤0xb8 (w2, b464) | 100% | previous wave, all sizes |
| 0xbc–0xc4 (batch 1) | 52% | first fails |
| 0xc4–0xcc (batch 2) | 2% | near-total wall |
| 0xcc–0xdc (batch 3) | **100%** | full recovery |

The wall is a **narrow dip at 0xbc–0xcc** — it clears above 0xcc. This
contrasts sharply with the upper-half (b458), which was 100% clean at
**all** sizes, including 2700-byte functions. The lower-half has a real
but bounded problem at this specific size band.

**Verify-fail address spread:** the 73 parked funcs span both lower-half
(0x021b…–0x021e…) and upper-half (0x022…) addresses, confirming this is a
**size-driven** wall, not an address/overlay-swap-zone issue. The b406
`--classify-data` preflight is not the blocker — all 150 candidates passed
classify; the verify-fail happens at the byte-identity check
(`asm_escape --whole-function` output ≠ delinked reference bytes).

**What could drive the 0xbc–0xcc dip?** Most likely candidates for the brain:
1. **Byte-pack idioms** — mwcc's register allocator uses different patterns at
   this function size, e.g. `(u8)` truncation or signed-vs-unsigned comparisons
   that asm_escape can't reproduce.
2. **Inline scheduling thresholds** — mwcc may start/stop inlining small helpers
   differently around this size, producing a fundamentally different instruction
   schedule.
3. The dip being bounded (100% clean at both 0xb8 and 0xcc+) suggests a
   specific optimization pass that activates then deactivates. Permuter may
   crack some of these — they're real matches, just byte-wrong.

## Runway after this wave

Post-wave authoritative dry-run (`--min-addr 0x0 --dry-run`, skipping 74
known verify-fails and 2 kind:data REFUSE):

```
scope ov002 0x0-0x10000: 621 candidates, clean-rate 100%
```

**621 carvable ov002 lower-half ARM funcs remain** (~4 waves of 150).

Lower-half drain progress:

| wave | brief | PR | shipped | verify-fails | sizes |
|---|---|---|---|---|---|
| w1 | 462 | #998 | 100 | 0 | 0x4c–~0x90 |
| w2 | 464 | #1001 | 150 | 0 | 0x94–0xb8 |
| **w3** | **466** | **this** | **77** | **73** | **0xbc–0xdc** |
| remaining | — | — | **621** | 74 parked | 0xdc+ |

## Operational notes

- **Wineserver contention** (GateTimeout): the decomper was mid-gate on batches
  1 and 2 (first tries). Recovery: verify wineserver is idle (`ps aux |
  grep ninja`), revert the trailing-newline artifact
  (`git checkout config/eur/arm9/overlays/ov002/delinks.txt`), re-run the
  batch. The tool's abort-on-dirty guard catches this correctly.
- **Chunked `--limit 50` protocol**: still the right approach — each batch
  committing durably in ~5 min avoids the ~8–10 min background-task kill.
- **Final gate**: clean rebuild `ninja sha1` after all 3 batches = OK.

🤖 Generated with [Claude Code](https://claude.com/claude-code)
