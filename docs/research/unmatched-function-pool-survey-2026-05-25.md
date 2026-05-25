# Unmatched function pool — survey at 17.3% matched (post brief 207)

**Investigation:** brain-PR while briefs 208 + 209 are in flight
(2026-05-25). Strategic compass for brief 210+ direction.
**Question:** what's left to match, where does it concentrate, what's
the cheapest pick we haven't touched yet?

## Headline

8,149 of 9,849 functions are still unmatched (82.7%). They contain
**2.27 MB of code (95.08% of total code by byte volume)**.

The 1,700 matched functions are dominated by short library thunks
(`.s` ships) + the early-project tier waves (briefs 4-100). Most of
the project's surface area remains.

## Size distribution

| Bucket | Count | Bytes | KB | Notes |
|---|---:|---:|---:|---|
| Trivial (≤0x20) | **231** | 5,774 | 5.6 | BIOS thunks, leaf functions. Many likely 1-instruction routing decisions. |
| Easy (0x21-0x60) | **2,440** | 157,956 | 154 | Wrappers, accessors, simple helpers. Tier-wave territory. |
| Medium-easy (0x61-0x100) | **3,160** | 510,444 | 499 | **Largest function bucket.** Brief 187's queue picked 25 from here. |
| Medium (0x101-0x200) | 1,384 | 492,646 | 481 | Untouched after the curated queue. |
| Medium-hard (0x201-0x400) | 616 | 434,724 | 425 | Walls heavily concentrated here. |
| Hard (>0x400) | 318 | 668,208 | **653** | **Largest BYTE bucket.** Includes the structural game code. |

**Reading the table.** By function-count, the work pool is centered
in medium-easy (3,160). By byte volume, the long tail in the hard
bucket dominates (653 KB across 318 functions averages ~2 KB per
function — these are the structural game-loop / engine functions).

## Module distribution

- Overlays: **4,997** unmatched (61.3%)
- Main: 3,138 (38.5%)
- ITCM: 14 (negligible)
- DTCM: 0

The pre-pivot phase focused on main + brief 197/205/207 hit overlays.
A full overlay sweep is the largest remaining structural target.

## Named vs placeholder

| Status | Count |
|---|---:|
| Placeholder name (`func_<8hex>`, no rename yet) | 3,112 |
| Renamed (decomper-identified or domain-known) | 5,037 |

The 5,037 renamed-but-unmatched are HIGH-LEVERAGE — the symbol is
already understood; only the matching work remains. These are
mostly NitroSDK / MSL_C / mwcc-runtime functions in `libs/nitro/`
+ early decomper waves that named symbols without finishing the
match. Concrete examples in the smallest-20 below:

| Module | Addr | Size | Name |
|---|---|---:|---|
| main | 0x020000f2 | 4 | `LZ77UnCompReadByCallbackWrite16bit` |
| main | 0x0200017a | 4 | `RLUnCompReadByCallbackWrite16bit` |
| main | 0x020001f2 | 4 | `Div` |
| main | 0x02000254 | 4 | `CpuSet` |
| main | 0x020002ae | 4 | `BitUnPack` |
| main | 0x02000394 | 4 | `HuffUnCompReadByCallback` |
| main | 0x02000400 | 4 | `WaitByLoop` |
| main | 0x0200045a | 4 | `IsDebugger` |

These are 4-byte BIOS SWI thunks (`svc #N; bx lr; .pool` shape).
There are ~30+ such named-but-unmatched functions in `main/`
at the 0x02000000-0x02001000 range. **A single decomper brief
could ship the entire BIOS thunk family in one go** — same recipe
across all of them, no wall research needed. Possibly under-mined
because they live in `libs/nitro/` rather than `src/main/`.

## Strategic recommendations

### 1. BIOS thunks family — single-brief drain opportunity

The 30+ named-but-unmatched BIOS SWI thunks in `main/` at 4 bytes
each are the highest-leverage easy pick available. They're already
named (identity known), they're all the same shape (`svc #N; bx lr`),
and they're under-mined because they're library thunks. A single
decomper brief could move both `complete_units` AND `matched_functions`
by +30 in one round.

### 2. Trivial-bucket sweep — second-largest opportunity

231 trivial picks (≤0x20 bytes). Brief 188 only got 5 of 12 from
the curated subset. A FULL sweep using brief 189's wall predictor +
brief 202/204's `.s` recipes would likely ship 80-150 in 1-2 rounds.

### 3. Medium-easy bucket — depth target

3,160 picks at 0x61-0x100 bytes is the heart of the project. Brief
187's queue picked 25; brief 190 + 201 shipped a handful. After
brief 209's straggler investigation closes, this bucket becomes the
sustained-drain target. Probably needs additional wall research
(estimate: 1-2 new C-walls or P-walls per 50 medium-easy picks
attempted).

### 4. Hard bucket — strategic priority for "human-readable C" goal

318 functions at >0x400 bytes. These are the engine / game-loop /
core gameplay functions that USER WANT for the "human-readable C
source" goal. Each one is a multi-day decomp effort but matters
disproportionately for the project's higher-value goal.

Recommend: spawn a separate "hard bucket pilot" brief track that
runs in parallel with the regular drain cadence. Pick ONE hard
function, treat it as a long-form decomp project, document the
process. Could become brief 215+ if briefs 208-214 stay on the
recipe-drain track.

## Volume math for the two-track goals

User stated direction: pursue BOTH "byte-identical ROM rebuild" AND
"human-readable C source for every function" in parallel.

**Track 1 (byte-identical):** `complete_units` is the gauge. Current
1666/2553. With `.s` ships handling all hard walls, the trajectory
is +20-30 per recipe-drain round. **Estimated completion: 30-50
more rounds at current pace** (4-7 weeks of brief work if cadence
holds). Reasonable horizon.

**Track 2 (human-readable C source):** `matched_functions` minus the
`.s` underlying count is the gauge. Current ~280 actual C-source
matches estimated (from 1684 minus the ~1400 `.s`+matched-via-
brief-206-recovery ships). To clear 9,801 functions, need 9,520+
more matches. At the current sustained C-source rate (~3-8 per
round), that's **1,200-3,000 more rounds**. The user noted they're
bullish on AI tool improvement making this faster — that's the
right framing because at the current pace, this is multi-year work.

The good news: every wall closed (C-31/32/33/34/35) lowers the
average per-pick cost for future C-source decomp. The closer the
wall taxonomy gets to complete, the faster Track 2 will move.

## What I'd recommend for brief 210 / 211 planning

1. **Brief 210 (decomper) — BIOS thunk family drain.** Ship the
   30+ named SWI thunks as a single batch. Quick win + obviously
   correct.
2. **Brief 211 (scaffolder) — start C-N taxonomy completion sweep.**
   Audit the remaining unmatched-named functions for unrecognised
   wall patterns. Goal: identify the next 2-3 walls that need
   recipes. If brief 209's investigation surfaces a usable extension
   to `objdiff_resolve_relocs.py` (Option B from `brief-209-
   stragger-prevalidation.md`), that goes here too.
3. **Brief 212-214 (decomper) — full trivial-bucket sweep.** Use
   brief 211's expanded taxonomy + brief 189's classifier. Expected
   +80-150 ships over 2-3 rounds.
4. **Brief 215+ — hard bucket pilot.** Pick one large gameplay
   function. Long-form decomp. Document as the template for future
   hard-bucket work.

## Closing observation

The project is at an interesting inflection: **the recipe pipeline
is mature enough that recipe-drain rounds reliably ship 20-30
picks, but the curated queue (52 picks at brief 187) is now
~80% drained**. Future drains need either fresh queues from a
classifier sweep OR a strategic decision about which bucket to
prioritize.

Brief 187's queue covered the easiest 52. The next 52 won't be as
homogeneous. Worth scoping a brief 211-equivalent queue refresh.
