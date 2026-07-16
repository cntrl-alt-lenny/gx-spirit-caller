[//]: # (markdownlint-disable MD013 MD041)

# Small Overlays Re-triage — Round 9 (R9)

Mop-up of the FULL remaining residual (down to zero) for 10 small overlays:
ov009(9), ov012(10), ov020(8), ov015(8), ov003(4), ov014(4), ov021(5),
ov013(1), ov018(1), ov000(2) — 52 functions total, each overlay's LAST
unexamined hard-tier functions after 1-2 prior rounds each. Examined
against `docs/research/data/OverlayDataGlobs.md`,
`docs/research/constants/OverlayConstants.md`,
`docs/research/constants/OverlayConstantsExtended.md`,
`docs/research/data/Ov004Ov006DataTables.md`, plus each overlay's own
`_core.h` and prior retriage docs.

---

## Summary

| Overlay | Examined | Newly tractable | Wall | Notes |
|---------|----------|------------------|------|-------|
| ov009   | 9        | **9**            | 0    | 100% — old R6 "confirmed intractable" bucket predated the per-function map doc |
| ov012   | 10       | **8** clean + 1 nuanced (11-way dispatcher, partial) | 1 | `021cb49c` dispatcher: 5/10 cases + shell tractable, 4 gap-flagged, 1 sub-block wall (cross-referenced) |
| ov003   | 4        | **4**            | 0    | includes a task-brief size/description mismatch caught and corrected |
| ov014   | 4        | **4**            | 0    | |
| ov020   | 8        | **7**            | 1    | 2 prior wall/defer notes independently overturned on fresh read |
| ov015   | 8        | **7**            | 1    | same-template family as ov020's tractable set |
| ov021   | 5        | 0                | **5**| all 5 independently re-confirmed byte-for-byte against R7's own claims |
| ov013   | 1        | 1 nuanced (18-case dispatcher, partial) | — | dispatch shell + 9/18 cases + 3 gated tractable; 6/18 cases wall |
| ov018   | 1        | 0                | **1**| confirmed genuine wall (6 discriminant-reload jump tables, richer than R7's original count) |
| ov000   | 2        | 0                | **2**| both inherited/confirmed unchanged from `Ov000Deep.md` |
| **TOTAL** | **52** | **39 clean + 2 nuanced = 41** | **11** | |

---

## ov009 (9/9 tractable)

All 9 already carried HIGH-confidence semantic names in
`docs/research/map/overlay009.md`, written BEFORE this campaign's original
"confirmed intractable" bucket (`SmallOverlaysRetriage.md` R6) — a
pre-KB, size-based dismissal, not a reshape-attempt wall. None hit a
genuine, nameable scheduling wall.

| Address | Size | Name | Upgrade reason |
|---|---:|---|---|
| `021AD214` | 280B | (palette blend) | Textbook RGB555 per-channel linear-interpolation blend, zero calls, one documented global (`data_021040ac+0x38`). |
| `021ACFF8` | 452B | `Ov009_OnConfirm` | 8-nibble base-10 decode (fixed 8-iter `mla` accumulator) → 32-bit score; hidden-unlock magic-compare; LP-percentage-cap formula. All 9 callees named. |
| `021AAAEC` | 472B | `Ov009_EntryPanel_DrawSprite` | 2-orientation dispatch (single-slot vs 2-iter dual-slot loop), OAM attribute pack, all 4 callees named. |
| `021AC214` | 580B | `Ov009_ScoreCtrl_InitSubViews` | 5 near-identical unrolled task-init blocks — intra-function duplication (mechanical), not a scheduling puzzle. |
| `021AD32C` | 912B | `Ov009_Scene_Init` | 40-call linear init, only 1 early-out guard in the whole body — the easiest shape to transcribe. |
| `021AB374` | 984B | `Ov009_EntryPanel_DrawAll` | Small bounded 4-way (2 duplicate-target) jump table + two fixed 8-iter loops (memcpy-shape + OAM-call-build). |
| `021AACC4` | 1264B | `Ov009_ScoreCtrl_SetupVram` | Two SEQUENTIAL bounded switches (not nested/ambiguous) + 4 bounded VRAM tile-fill loops. |
| `021AA5D8` | 1300B | `Ov009_ScoreCtrl_Update` | 3-state top-level switch, state 1 has its own bounded bitmask sub-switch (`data_02104bac+0x54`). Ease-in/ease-out blocks are algebraic mirrors, not scheduling ambiguity. |
| `021AB9F8` | 2076B | `Ov009_ScoreCtrl_DrawFrame` | ~10 near-identical straight-line OAM-marshalling blocks (same mechanical-duplication class as `021ac214`) + one bounded LP-digit-scroll loop (max ~10 iters via `/10` reduction). |

**New KB gaps (ov009):** `data_0210594c+0xe0` (LP-cap selector);
`data_ov009_021ad858` (16-byte block, unconfirmed content);
`data_02103da0`/`data_020c3e48` (paired flag words); `data_ov009_021ad82c`
(8×2-byte lookup table); `data_02104bac+0x52` (independently confirmed a
3rd time — strengthens the case for formal documentation);
`data_02102c90+0xc` sub-field; `data_ov009_021ad84c` (5×u16 RGB555 source
array feeding `021ad214`'s blend); `data_ov009_021ada18` array usage
(corrects `OverlayDataGlobs.md`'s "possibly a bitmask" guess — it's a
12-byte-stride array base); `data_ov009_021adaa8` family (6 related
sprite-descriptor structs, map doc undercounted as "3 elements").

---

## ov003 (4/4 tractable)

**Task-brief correction:** `021CEDF8` was specified as "632B, smull
divmod chain" — the ACTUAL file at `src/overlay003/func_ov003_021cedf8.s`
is **188B** with zero smull/divmod; that description belongs to a
same-numbered-address sibling in **ov004**
(`config/eur/arm9/overlays/ov004/symbols.txt` confirms `func_ov004_
021cedf8 size=0x278`=632B). Triaged the file that actually exists at the
specified ov003 path.

| Address | Size | Name | Upgrade reason |
|---|---:|---|---|
| `021CEC24` | 468B | `Ov003_DrawTimerDigits` | Bounded 2-way gate + selector-table lookup (same shape R8 proved for `021cca88`/`021cc8b8`) + 2-value multi-exit gate + 3 straight-line sprite-stream calls. |
| `021CEDF8` | 188B | `Ov003_SubmitSpriteStream` | Trivial 7-arg passthrough wrapper — dominant sibling callee of `021cd7dc` (R8), called ~50+ times from that function alone, 4× from `021cec24`, 12× from `021ce4e4` (both in this batch). |
| `021CE4E4` | 1696B | `Ov003_AnimateLifePoints` | Clean bounded `addls pc,pc` jump table (6 cases, one 3-target-shared-label group), every case a bounded 2-iter player loop calling only `021cedf8`+`021ceb84` (both matched/tractable). |
| `021CA2BC` | 6332B | `Ov003_BuildDuelScreen` | Largest in the whole R9 wave. 220 `bl` calls (not 166 as the brief estimated), ZERO `blx` — pure top-to-bottom sequential scene construction, only ONE genuinely runtime-conditional branch family (a `data_02104c68[player_idx]` truthy/falsy pair, repeated 4×, always the identical shape). Flagged "tractable, no wall, but high-effort/iterative" since the 4 repeated text-truncation blocks and the 2-player-mirror halves' exact source form (shared helper vs. duplicated inline) can't be resolved from assembly alone. |

**New KB gaps (ov003):** `[arg2,#0x2c]` on the `SubmitSpriteStream` target
struct; `data_ov003_021cf0dc` 6-entry pointer table; `data_02104f4c+0x4`
new 3-bit-field offset.

---

## ov014 (4/4 tractable)

| Address | Size | Name | Upgrade reason |
|---|---:|---|---|
| `021B43B8` | 296B | `Ov014_RenderDeckSlotB` | Near-clone of R8-tractable `021b4294`; the one structural difference (cleanup guard placement) independently confirmed with a concrete offset. |
| `021B4AC4` | 308B | `Ov014_DrawDeckRevealSprites` | Bounded 2-iter loop, single 2-way discriminant, every "guard" a bounded rect-threshold compare. `rsb r9,r9,#1` toggle (not decrement) — flagged as a transcription lever. |
| `021B484C` | 632B | `Ov014_AnimateDeckReveal` | Clean bounded 3-way (state 0/1/2) switch, state 1 has its own bounded 3-way bitmask sub-dispatch. "Divmod-ish shifts" are a fixed-point easing formula (mul→shift chain), not a magic-divide reciprocal. |
| `021B44E8` | 808B | `Ov014_InitSpiritVram` | Straight-line init, exactly 4 loops, ALL fixed-trip-count (one 0-or-more outer, one fixed-28, two trivial sequential blits). |

**New KB gaps (ov014):** `021b484c`/`021b44e8`'s tail MMIO write vs.
already-matched `021b4810` — same idiom, opposite bit polarity, flagged as
a possible near-duplicate not byte-identical (needs a side-by-side check).

---

## ov012 (8 clean tractable + 1 nuanced dispatcher, 1 wall)

| Address | Size | Verdict | Reason |
|---|---:|---|---|
| `021CB320` | 224B | Tractable | 5-entry jump table collapses to 3 distinct actions (small bounded switch); 2 documented callees + 1 documented data table. |
| `021C9E1C` | 300B | Tractable, gap-flagged | Double-nested VRAM-zero loop is completely mechanical (only 2 live cross-iteration registers); the ONE genuine obstacle is 2 raw `.word 0xebffXXXX` calls with unresolved symbols — NOT a scheduling wall, a missing-symbol gap. |
| `021CA6DC` | 312B | Tractable | Textbook OAM cell-config builder recipe (`func_0201d47c`/`func_0201e5b8`/`Task_Invoke` on a stack command record) — same idiom proven elsewhere. |
| `021CA814` | 336B | Tractable | Same OAM-builder family + the documented `func_02006c0c(table,4,mode)` task-spawn idiom. |
| `021C9F48` | 580B | Tractable | Single most mechanical function in the batch — pure straight-line, ONE conditional-free path, all ~33 `bl` targets called with only literal setup. |
| `021CA450` | 652B | Tractable, gap-flagged | `Ov012_UpdateSlotSelect` — R6's "12 ORR over 5 registers" cited concern independently re-checked: actual count is a clean bitfield repack. One raw `.word` gap gates a corner-highlight branch. |
| `021CB088` | 664B | Tractable | `Ov012_HandleTouchInput` — every callee named/matched, NO raw-word gaps at all. |
| `021CA964` | 1348B | Tractable, gap-flagged | `Ov012_Init` — overwhelmingly straight-line (only 2 real branches in 1348B). One raw `.word` gap in the tail. |
| `021CB49C` | 2584B | **Nuanced — 11-way dispatcher, per-case verdict** | See below. |
| `021CC01C` | 80B | **WALL** | Post-`blx r0` register-reuse choice (which of two equally-valid live pointers mwcc picks post-call) — confirmed by this project's own prior C-match attempt (plateaued at 80%) and `brief-294-regalloc-wall-scout.md`'s broader finding that no C-level lever steers this choice. |

**`021CB49C` per-case breakdown (2584B, `Ov012_UpdateMain`, 10-state
dispatch on documented `+0x168` byte):**

| State | Verdict | Reason |
|---|---|---|
| 0 | GAP (not wall) | 4 raw `.word` calls; control flow otherwise clean |
| 1 | **TRACTABLE** | Clean single-iteration loop + 2 known sibling calls, no gaps |
| 2 | GAP (not wall) | 3 raw `.word` calls; well-understood table lookup otherwise |
| 3 | **TRACTABLE** | Trivial counter + 1 conditional call |
| 4 | Mostly tractable, **1 confirmed WALL sub-block** | Outer dispatch clean; the 64-bit LCG sub-block matches an independently-documented (dossier `0201a9d0.md`) permuter-class verdict — cross-referenced, not fresh guesswork |
| 5 | GAP (not wall) | Several raw `.word` calls in one sub-path; other sub-paths clean |
| 6 | **TRACTABLE** | Single call + conditional flag set |
| 7 | GAP (not wall) | 3 raw `.word` calls; otherwise clean |
| 8 | GAP (not wall) | 1 raw `.word` call; rest is a simple 2-branch dispatch |
| 9 | **TRACTABLE** | Fully clean, 3 known calls |

The dispatch table + 4 fully-clean cases (1/3/6/9) should be attempted
directly; the ~15 raw-word gaps across the other cases (all decoded to
addresses clustering in `0x021b12xx`-`0x021b1dxx`, inside ov002) need
symbol resolution before those specific cases can be attempted.

**New KB gaps (ov012):** `data_ov012_021cc6a0[0x19c]` (4-bit mode nibble,
2 independent sites); `data_02104bac[0x54]` button-state byte (2 sites);
`data_ov012_021cc6dc[0x4e8]` DMA source pointer; `data_ov012_021cc6dc
[0x144+i*4]` back-pointer array; `data_021040ac[0xb7c]/[0xb80]` step-cursor
save/restore pair; `data_021040ac[0x40]`/`[0x48]`; several inferred small
lookup tables (`data_ov012_021cc150`, `021cc0f0`, `021cc1e8`,
`021cc06c/78/7c/80`); `data_02104f4c[+0x4]` 3-bit field; ~15 unresolved
raw-`.word` symbols (recommend a decomper with `dsd`/objdump tooling
resolve against ov002's symbol table).

---

## ov020 (7/8 tractable, 1 wall)

| Address | Size | Name | Verdict |
|---|---:|---|---|
| `021ADA1C` | 80B | (state dispatcher entry) | **WALL** — `ov020_core.h` §WALL explicitly records a prior C-match attempt at this exact address: "predicated return-1 vs forward-branch" block-layout gotcha, independently re-confirmed against the actual block ordering. |
| `021AB81C` | 220B | `Ov020_MeasurePanel` | Tractable, MED-confidence — single bounded loop, all callees named; one stack-arg-marshalling convention needs 1 objdiff pass to pin exactly (shared risk with `021ab5c4`). |
| `021AB0D8` | 260B | `Ov020_DrawCardRows` | Tractable — OVERTURNS `ov020_core.h`'s bundled wall listing on independent re-read: the register set used does NOT match the wall note's cited rotation description (that description applies to sibling functions, not this one). Sequential 3-stage magic-divide, each value consumed once, no rotation. |
| `021AD910` | 268B | `Ov020_Finalize` | Tractable — both loops fixed-bound (2 and 10 iters), no register rotation. |
| `021ADA74` | 280B | `Ov020_RgbToHsv` | Tractable — self-contained RGB→HSV, the "coin-flip" original verdict describes VISUAL density of `movgt`/`movle` pairs but each is an independently well-defined ternary. |
| `021AB5C4` | 324B | `Ov020_UpdateArtPanel` | Tractable — close structural sibling of `021ab81c`; two magic-divides computed with DIFFERENT post-shift precision must be kept as separate locals (not collapsed as "redundant"). |
| `021AC394` | 360B | `Ov020_LoadAssets` | Tractable — TWO conflicting prior signals (R6 defer, no R8 re-visit) resolved: every callee named, every loop bounded, R6's "dense callee-saved spill" is a density observation not a named ambiguity. |
| `021AD780` | 400B | `Ov020_TransitionOut` | Tractable — template match against R8-confirmed-tractable sibling `021ac4fc` (`Ov020_TransitionIn`); same preamble/body/tail shape, low risk. |

**New KB gaps (ov020):** `data_ov020_021ae9bc/9b4/9c4/9cc` (2 handle-pair +
2 row-metrics table quad, cross-confirmed at 2 sites); `data_021040ac
[+0x3c]`/`[+0xa4c]`; `data_02104f4c[+0x1b00]` region (open naming question
vs. `data_02106a4c[+8]` — could not fully disambiguate); `data_ov020_
021addd0` (per-panel sprite count array); `0x000001cb`(=459, meaning
unconfirmed); `0x78787879` reciprocal at post-shift `asr#3` → **÷17** (a
NEW divisor/shift pairing for an existing constant, same multi-divisor
caveat already established for `0x88888889`).

---

## ov015 (7/8 tractable, 1 wall)

Strong cross-overlay template confirmation: `021ad780`(ov020) and
`021b5818`/`021b50b8`(ov015) share a near-identical "2-stream reset →
paired-update-calls → conditional-scroll-apply → fade-timer → dual-
MASTER_BRIGHT → completion-DISPCNT-clear" template, matching R8's already-
confirmed `021ac4fc`(ov020)/`021b47cc`(ov015) siblings — 5+ independently-
triaged functions across two overlays now share this one template.

| Address | Size | Name | Verdict |
|---|---:|---|---|
| `021B405C` | **576B** (task brief said 52B — actual file matches the map doc's `Ov015_UpdateScrollerAndText` exactly) | `Ov015_UpdateScrollerAndText` | Tractable — dense but every branch and call target pinned; repeated guarded "arm redraw" bit-set blocks are self-contained macros, not a rotation. |
| `021B5A14` | 80B | (state dispatcher entry) | **WALL** — `ov015_core.h` §DEFERRED lists this address TWICE (wave 1 AND wave 2) as PERMUTER-class, kin to `ov005 021acfb0`/`ov008 021aafa4` — a stronger, prior-probed claim than ov020's sibling. |
| `021B3D2C` | 232B | `Ov015_DrawScrollbarThumb` | Tractable — R6's borderline "resource ID + struct must be named" blocker now RESOLVED: `data_ov015_021b5a8c` cross-confirmed at 2 further sites in this same batch. |
| `021B5818` | 396B | `Ov015_DrawCardListMain` | Tractable — structurally identical to ov020's `021ad780` and ov015's own `021b50b8` (3rd confirmed instance of the shared template). |
| `021B50B8` | 524B | `Ov015_DrawCardListSub` | Tractable — near-twin of `021b5818` with a richer teardown tail; flagged one MMIO address (`0x04001008`) whose role is genuinely uncertain (write pattern doesn't match a simple VRAMCNT role — do not assume a name until confirmed). |
| `021B4BA0` | 1304B | `Ov015_LoadCardList` | Tractable — EVERY callee named despite density; 3 fixed-bound loops. Densest part (an 8-iter OAM/palette pack) needs its own objdiff pass for exact arg bindings but has no ORDER ambiguity. |
| `021B37FC` | 1328B | `Ov015_RenderCardCell` | Tractable — OVERTURNS R6's specific "12 ORR over 5 registers" reg-alloc-wall claim: independent count found 6 ORR over 3 registers (a much more tractable shape). Recommend re-attempting direct-mwcc. |
| `021B52C4` | 1364B | `Ov015_FrameTick` | Tractable — decomposes into two clean bounded 8-way `addls pc,pc` jump tables; 10+ of its 31 callees independently confirmed elsewhere in THIS SAME batch. |

**New KB gaps (ov015):** `data_ov015_021b5e54` (paired preamble array,
shared across 3 functions); `data_ov015_021b5e44[+0x1c]`/`[+0x84c]`/
`[+0x8dc]`; `data_ov015_021b6880`/`021b6828[+0x8]`; `data_0210249c`
(save/sentinel/restore pattern); `data_ov015_021b5ae8` (language-indexed
table); `data_ov015_021b67c0/c4/c8/cc`; explicit caution flagged on
`0x04001008` — used with TWO apparently-different roles at different call
sites, do not assume one shared name.

---

## ov021 (0/5 — all confirmed wall)

All 5 target addresses were ALREADY fully examined by R7's
`SmallOverlaysRetriageR7.md` ("ov021 Confirmed Wall" section). Independent
spot-check confirmed every pool word, call count, loop-iteration count,
and magic constant R7 cited — no KB growth since R7 unlocks any of them.
This is a confirmed-complete residual, not a fresh discovery.

| Address | Size | Reason |
|---|---:|---|
| `021AA5CC` | 524B | 34 sequential VRAM/BG/palette/IRQ calls across 2 branches — genuine mwcc register-choice coin-flip, no natural C statement order forces it. |
| `021AB150` | 684B | 29 calls across 3 counted loops, 8 callee-saved regs simultaneously live. |
| `021AB3FC` | 708B | 9-way `cmp`-cascade (not a table) with branch-tail duplication — 2 confirmed magic-divide constants (`0x2aaaaaab` ÷48, `0x38e38e39` ÷72). |
| `021AB6C0` | 784B | 7-way `cmp`-ladder on a frame-counter milestone field, 3 nested small loops. |
| `021ABAA0` | 160B | Strength-reduction coin-flip: mwcc caches a base-pointer computation across a store+conditional-reload where the natural C form recomputes fresh — same class as `ov015 021af704`. |

---

## ov013 (1 function, nuanced split verdict)

**`021CA7CC`** (3704B, `Ov013_UpdateFrame`) — dispatch shell + prologue/
epilogue fully tractable; 18-case switch on `data_ov013_021cbc00+0x198`
bits[15:8]. **9 of 18 cases tractable, 3 gated-tractable** (clean body,
blocked only by an unresolved veneer symbol), **6 of 18 cases confirmed
wall** for specific named reasons (unbounded register-computed-shift bit
scans in 2 cases, a genuine multi-veneer register-order ambiguity in
another, a multi-register block struct-copy reg-alloc wall in another).

A correction to R7's own veneer-target decode: independently hand-decoded
all 16 hand-encoded `.word 0xebffXXXX` BL veneers via ARM's BL encoding
(cross-checked against the function's own total-length invariant) and
found DIFFERENT absolute target addresses than R7's summary table listed
— same total count (16) and same per-case call-site/sharing pattern, only
the specific hex addresses needed correction:

| Target | Count |
|---|---|
| `0x021b13b8` | 5× |
| `0x021b142c` | 5× |
| `0x021b2198` | 2× |
| `0x021b1e40` | 2× |
| `0x021b12a4` | 1× |
| `0x021b1ab4` | 1× |

**Lever:** ship dispatch shell + the 9 fully-tractable cases as C now;
leave cases 1/4/6/8/14/15 (and the 3 gated cases, pending veneer symbol
resolution) as `.s`. No new KB gaps — every struct offset/pool word/
constant encountered was already documented in `ov013_core.h`.

---

## ov018 (0/1 — confirmed wall)

**`021AB694`** (5684B, `Ov018_StateMachine`) — R7 had already examined
this exact address in detail (not just a summary-line flag). Independent
full re-read (all 1565 lines) found the actual structure slightly MORE
complex than R7's prose described: **6 distinct discriminant-reload
`addls pc,pc` jump-table dispatches** (not 4 as R7's prose stated), all
keyed off the same state word, each independently reloading the
discriminant fresh from memory rather than reusing a live register —
reinforcing rather than undermining the wall verdict. Not a documentation
gap — 45+ callees are already well-named per `overlay018.md`/`ov018_core.h`.
No confirmed shared prologue/epilogue boundary between the 6 dispatches
(one stack frame throughout) — genuinely one function, no splitting lever
available.

---

## ov000 (0/2 — confirmed wall, both inherited unchanged from Ov000Deep.md)

### `021ABEC8` (96B) — WALL

Leaf function tail-calling the confirmed divmod helper `func_020b3a7c`.
Four-field extract-and-combine sequence interleaves live registers
`r1/r2/r3/r4/ip/lr` across ~18 instructions with no loop and no natural
grouping — the mwcc-chosen evaluation order of the two product operands
has no natural C statement ordering that reproduces it. Matches the
already-documented "reg-alloc/instruction-schedule wall on a dense
4-live-register bitfield-extract-then-multiply chain" class
(`ov000_core.h`, flagged for sibling `021ab850`). Genuine dependency of
the already-walled caller `021ac144` (calls this + its twin `021abe64`
four times combined) — stays `.s` regardless of independent tractability.

### `021AD8DC` (636B) — WALL

Sibling of the HIGH-confidence `Ov000_SetupMainVram` (`021ad660`). ~30
interleaved stack writes threaded between 14 `bl` calls, where fields are
written, partially overwritten, then consumed by a call several
instructions later — writes and calls are interleaved throughout the body,
not front-loaded, which is what a straightforward "build struct, then
call" C shape would produce instead. The exact interleave order is
schedule-determined, not recoverable from natural C source order.

**Both verdicts independently re-verified** (not rubber-stamped): full
re-read confirmed every pool word, every BL target, every claimed constant
diff vs. the `021ad660`/`021abe64` twins, and the dependency relationships.
No new KB fact in any of the 4 specified docs resolves either open struct
gap (`021ABE64`/`021ABEC8`'s packed-field object struct; the 14-symbol
`data_ov000_021b55dc`-family globals).
