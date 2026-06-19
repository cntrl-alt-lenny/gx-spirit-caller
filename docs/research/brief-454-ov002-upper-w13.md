[//]: # (markdownlint-disable MD013 MD041)

# Brief 454 — ov002 reg-alloc to .s, UPPER half (wave 13)

**Brief:** 454 (scaffolder). Continue the ov002 UPPER-half (addr ≥ 0x02234000)
`.s`-bound reg-alloc backlog (post brief 452 / PR #988). Wave 12 drained the
whole ≤0xc0 tier; this wave climbs the **0xc1–0x100 tier (~138 funcs)**. Report
the clean-rate so the lane's tail is visible. Target ~28–40.

## Headline — 40 shipped; the 0xc1–0x100 tier is 100% clean (no tail here)

**40 byte-exact upper-half ov002 `.s` shipped** (the 40 smallest, sizes
**0xc4–0xdc**). The brief predicted byte-pack drops would begin ≥0xd0 — **they
did not appear anywhere in 0xc1–0x100.**

## Finding — the entire 0xc1–0x100 tier is byte-clean (probe-exhaustive)

The full **138-func** 0xc1–0x100 tier was probed end-to-end (not a sample):

| stage | n | result |
|---|---:|---|
| `--classify-data` census (whole tier) | 138 | **138 clean, 0 REFUSE** |
| `--whole-function` byte-verify (whole tier) | 138 | **138 PASS, 0 DROP** |

**Clean-rate by sub-band — 100% across the board:**

| sub-band | PASS / total | clean-rate |
|---|---:|---:|
| 0xc1–0xcf | 11 / 11 | 100% |
| 0xd0–0xe0 | 54 / 54 | 100% |
| 0xe1–0x100 | 73 / 73 | 100% |

So the predicted ≥0xd0 byte-pack tail is **not** in this tier. Combined with the
wave-12 census (≤0x100 is fully kind:data-clean) and wave-12's 58/58 ≤0xc0
byte-clean, **the entire uncarved ≤0x100 upper-half is byte-`.s`-clean: 196
classify-clean + 196 byte-verify-clean, 0 REFUSE, 0 byte-pack.** The lane's tail
(if any) lives in `>0x100`, where this wave did not yet probe.

**Roadmap implication:** the next several waves can drain `0xc1–0x100` (138
funcs, ~98 still held after this wave) at full yield with no expectation of
drops; the byte-pack question only opens up above 0x100.

## Shipped 40, held 98

The whole tier verified clean (138), but the brief target is ~28–40 and 138 is
too large for one reviewable wave with no natural sub-boundary at 40 — so 40
(smallest-first, 0xc4–0xdc) shipped, the other 98 clean probes held for the next
wave (their `--whole-function` `.s` are cached and re-verify trivially).

## ⚠️ Wine deadlock recurred — handled with a self-healing probe

The decomper is running concurrent USA/JPN region-port builds (brief 455) in
repeated batches, so the shared machine-wide **wineserver deadlocked** twice
mid-probe (`0 live wine procs`, my probe hung on one func, the decomper's
`.ninja_log` frozen). Recovery, observed live:

1. **Killing my own probe's wine job freed the wineserver** — the decomper's
   build resumed within ~15 s. The scaffolder is the resumable side; yield it.
2. A plain serial probe cannot finish a 138-func sweep when the other worktree
   rebuilds every few minutes. So the probe was made **self-healing**: a 30 s
   per-func timeout kills the hung call + orphan `mwasmarm` (freeing the
   wineserver) and **re-queues** the func; up to 6 retry rounds interleave with
   the decomper. Result: the full 138-func sweep completed with **1 timeout in
   round 1, resolved on round 2** — no human coordination, no permanent stall.

**Gotcha confirmed:** `asm_escape --whole-function --out` writes the `.s`
*before* the byte-verify (`generate_whole():798` vs `:800`), so a killed/partial
probe's `.s` files are **attempts, not confirmed passes** — the PASS/DROP record
must come from the batch JSON, never from "the `.s` exists." (A partial wave-13
probe was discarded and re-run clean for exactly this reason.)

## Dedup — two layers, both clean (Verify item 10)

File-level (no existing `.s`/`.c`) + address-level (no carved `start:`), both
clean for all 40. The decomper is on USA/JPN region-port this round (off ov002
source carving) — no cross-lane collision, but the wineserver is shared (above).

## Delink hygiene

b450 newline-guard applied. Post-sort audit: **2103 → 2143 `.text` intervals
(+40), 0 overlaps, 0 concatenated lines, 0 size-mismatches** (every carve's
`end − start` == its `symbols.txt` size). Upper-half guard asserted every pick ≥
0x02234000.

## Thinning watch

Uncarved upper-half after this wave (**607**): `≤0xc0` = 0 (w12), `0xc1–0x100` =
**98** (was 138 — ~2–3 waves left at 40/wave, all expected clean), `0x101–0x140`
= 135, `0x141–0x200` = 195, `>0x200` = 179. The lane has ~470 funcs of runway
above 0x100 plus the 98 clean-and-held in this tier.

## Gate — EUR ninja sha1

| EUR | USA | JPN |
|:---:|:---:|:---:|
| **OK** | n/a (`src/overlay002/*.s` is EUR-only) | n/a |

`gx-spirit-caller_eur.nds: OK`. Brain reproduces 3-region on merge.

## Files

`src/overlay002/` +40 `.s`; `config/eur/arm9/overlays/ov002/delinks.txt`
2103 → 2143 `.text` intervals (sort-normalised, 0 overlaps). No main/USA/JPN
change.

🤖 Generated with [Claude Code](https://claude.com/claude-code)
