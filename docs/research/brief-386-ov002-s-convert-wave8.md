[//]: # (markdownlint-disable MD013 MD041)

# Brief 386 — ov002 reg-alloc → `.s`, wave 8 (Windows lane)

**Brief:** 386 (scaffolder). Continue the ov002 `.s`-bound reg-alloc backlog from
waves 1–7 (= 56 ships). The decomper is **joining ov002** (the permuter is
shelved as niche), so split by address: **scaffolder = upper half** (addr ≥
`0x02234000`), decomper = lower half — no overlap. `asm_escape --whole-function`
each, gate on 3-region `ninja sha1`. Target ~8. Flag if my half thins.

## Headline — 8 upper-half ov002 `.s` shipped, 3-region `ninja sha1` green

**8 byte-exact `.s` shipped, all addr ≥ `0x02234000`** (no overlap with the
decomper's lower half). Verify rate **13/13 = 100%**. All eight are **bl≥1** funcs
— the upper-half bl=0 leaves were consumed in wave 5, but per wave 7 the
call-bearing walls translate just as cleanly, so the split-half is productive.

## The 8 ships (all ov002, upper half ≥ 0x02234000)

| addr | size | bl |
|---|---|---|
| `0226acf8` | 0x2c | 1 |
| `02285df0` | 0x38 | 2 |
| `02249e84` | 0x40 | 1 |
| `0228deac` | 0x40 | 1 |
| `0223b584` | 0x48 | 1 |
| `02256108` | 0x48 | 2 |
| `0226ad5c` | 0x48 | 1 |
| `0227c630` | 0x48 | 1 |

All `asm_escape` → `✅ byte-identical vs the delinked .o`. Link-clean — every
`data_` reference is `kind:bss` (the wave-4 mandatory check; no `kind:data` risks
this batch). No byte-pack.

## Coordination — upper-half split resumed

ov002 funcs span `021aa4a0`–`022bdfb4` (midpoint `0223422a`). With the decomper
back on ov002, the scaffolder takes **only addr ≥ 0x02234000** (enumerate with an
`if int(a,16) < 0x02234000: continue` filter), the decomper takes below. Same as
the wave-5 split. (Waves 6–7 were full-range while the decomper was off; from here
the scaffolder is upper-half again.)

## Gate — 3-region `ninja sha1`

| EUR | USA | JPN |
|:---:|:---:|:---:|
| **OK** | **OK** (unaffected — `src/overlay002/*.s` is EUR-only) | **OK** |

## Thinning watch — upper half is healthy

The upper-half `≤0x4c` non-arg-pack non-byte-pack enumeration has **23**
candidates (8 shipped this wave → ~15 remain), all bl≥1 and verifying at ~100%.
Extending past 0x4c (most ov002 walls are 0x48–0x60) widens it further. The
upper half is good for **2+ more waves** at this band; not thinning yet.

## Files

`src/overlay002/` +8 `.s`; `arm9/overlays/ov002/delinks.txt` +8 `complete .text`.
No main/USA/JPN change. Running total scaffolder reg-alloc `.s`: 8×8 = **64**
(main 17, ov002 47).

🤖 Generated with [Claude Code](https://claude.com/claude-code)
