[//]: # (markdownlint-disable MD013 MD041)

# Brief 380 — ov002 reg-alloc → `.s`, wave 5 (Windows lane)

**Brief:** 380 (scaffolder). Continue the ov002 `.s`-bound reg-alloc backlog from
waves 1–4 (#894/#897/#898/#900 = 32 ships). main is drained; ov002 (the
1,713-func cold tier) has runway. Take the **upper half** of the address range to
avoid overlap if the decomper joins ov002. Use the decomper's stm/ldm +
objdump-`-z` fixes (now on main). Target ~8.

## Headline — 8 ov002 `.s` shipped, 3-region `ninja sha1` green; the store-merge fix removes the thinning drag

**The stm/ldm + objdump-`-z` fixes work** — they recovered the **two prior
translation failures** (`022592b8`, `02273500`, both "did not verify" in waves
3–4) and pushed the batch verify rate to **14/14 = 100%** (vs ~75–92% in waves
3–4). So wave 4's thinning flag is **partly lifted**: the seam wasn't exhausted,
it was tooling-blocked on store-merge funcs, which now translate.

## The 8 ships (all ov002, upper half ≥ 0x02234000)

| addr | size | note |
|---|---|---|
| `02273500` | 0x2c | leaf wall — **recovered** (failed to verify in wave 3, now passes) |
| `022592b8` | 0x34 | leaf wall — **recovered** (failed in wave 3, now passes) |
| `022b0444` | 0x40 | leaf wall |
| `0226aea8` | 0x48 | leaf wall |
| `0226aef0` | 0x48 | leaf wall (sibling of `0226aea8`) |
| `0228db98` | 0x4c | leaf wall |
| `022913cc` | 0x4c | leaf wall |
| `022a16b0` | 0x4c | leaf wall (refs the shared `data_02104f4c`) |

All `asm_escape` → `✅ byte-identical vs the delinked .o`. Link-clean — every
`data_` reference is `kind:bss` (per the wave-4 mandatory check;
`data_ov002_022cd73c`/`…d016c`/`…cd300`/`…cf1ac`/`…cf16c`, `data_02104f4c`,
`data_021064a8`). No byte-pack shapes.

## Coordination — upper-half split

ov002 funcs span `021aa4a0`–`022bdfb4` (midpoint `0223422a`). Per the brief, this
wave takes **only addr ≥ 0x02234000** (the upper half), leaving the lower half
free for the decomper if it joins ov002 — no overlap. (Waves 3–4 were mixed-range;
from here the scaffolder stays upper-half.)

## Tooling note — the store-merge fix

The decomper's fixes on `main` (`to_mwasm` now expands bare `stm`/`ldm` → `stmia`/
`ldmia`; `objdump -d -r -z` keeps zero-pool words instead of collapsing them) are
exactly what unblocked the prior failures — those funcs merge stores via
`stm`/`ldm`, which the old `to_mwasm` couldn't render. The remaining
`asm_escape` failure mode ("did not assemble" on a few funcs) is rarer now;
this batch had **zero** failures.

## Gate — 3-region `ninja sha1`

| EUR | USA | JPN |
|:---:|:---:|:---:|
| **OK** | **OK** (unaffected — `src/overlay002/*.s` is EUR-only) | **OK** |

## Runway

Wave 4 flagged thinning, but the store-merge fix changes the math: the upper-half
enumeration alone has **32** `≤0x4c` non-arg-pack non-byte-pack uncarved
candidates, and they now verify reliably. ov002's upper half is a comfortable
multi-wave vein; the lower half (≥ the decomper coordination) is similar. Wave 6
can stay upper-half ov002.

## Files

`src/overlay002/` +8 `.s`; `arm9/overlays/ov002/delinks.txt` +8 `complete .text`.
No main/USA/JPN change. Running total scaffolder reg-alloc `.s`: 8×5 = **40**
(main 17, ov002 23).

🤖 Generated with [Claude Code](https://claude.com/claude-code)
