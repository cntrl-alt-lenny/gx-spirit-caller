[//]: # (markdownlint-disable MD013 MD041)

# ov004 / ov006 / ov008 Residual Closeout — Round 10 (R10)

Generated 2026-07-02. Intended to drain the full remaining E/F residual
for all three modules to zero (14 ov004 + 20 ov006 + 16 ov008 = 50
functions, computed as the complete not-yet-mentioned-anywhere set per
this round's residual methodology). **ov006 was not reached this round**
(its sub-agent hit a server-side rate limit before producing content) —
**carries to R11 in full (20 functions)**. ov004 and ov008 were both
examined by dedicated sub-agents.

## Critical calibration note — read before using any verdict below

Unlike this round's `Ov002EFRetriageR10.md` and `MainEFRetriageR10.md`
sub-agents (which explicitly checked every target `.s` file for the
brief-302 "GLOBAL_ASM endgame" ship-as-.s marker before rendering a
verdict), **the ov004 and ov008 sub-agents that produced the analysis
below did not check for or mention this marker anywhere in their work.**
The orchestrating session verified independently, after the fact:

| Module | Examined | Carry the brief-302 marker | Marker-free |
|--------|----------|------------------------------|-------------|
| ov004  | 14       | **14 (100%)**                | 0           |
| ov008  | 16       | **13 (81%)**                  | 3           |

This round's ov002/main batches — which DID check the marker on a
comparable sample size — found that when explicitly audited, roughly
**95% of marker-carrying functions hold up as genuine, still-correct
walls** (only 2 of 40 ov002 functions and 2 of 50 main functions were
"swept in mechanically" false positives, and both were small,
low-branching outliers, not large call-dense bodies). Several of the
functions marked "TRACTABLE" below are 1000-2000+ byte, 30-70-call
bodies — structurally the LEAST likely candidates for a marker
false-positive based on this round's own calibration data, not the most
likely.

**Given this, the verdicts below are NOT treated as confirmed newly-
tractable upgrades for the campaign total.** They are real, valuable,
ground-truth-grade structural analysis (accurate C sketches, pool words,
call graphs, and several genuine new KB-gap discoveries) that correctly
documents what each function's struct/data dependencies now resolve to
— but per this round's own calibration, they should be treated as
**candidate reshape targets pending a proper marker-aware re-audit**
(the same back-edge/register-pressure check the `main`/ov002 sub-agents
applied), not as verified wall-overturns. The 3 ov008 functions that are
free of the brief-302 GLOBAL_ASM marker (`0x021ae3a0`, `0x021ae70c`,
`0x021b01d8`) ARE counted as confirmed newly tractable below, since no
reg-alloc-wall claim conflicts with their verdict.

**One more nuance, confirmed while cross-checking `Ov002EFRetriageR10.md`'s
own "true frontier" section:** these same 3 ov008 functions (and ov004's
sibling addresses in this doc do NOT carry it) actually carry a
*different*, earlier header — `"brief 207 / Phase 2: C-34 candidate.
Vanilla brief 202 .s recipe"` — a purely mechanical build-tooling
classification (a literal-pool trim-protect workaround in
`patch_section_align.py`, see `docs/research/brief-207-c34-c35-rescan-
drain.md`), NOT a reg-alloc-wall claim. This does not weaken their
tractable verdict at all — if anything it explains why they were `.s`
for an unrelated reason and confirms nothing has actually tested (or
rejected) C-expressibility for them before this round.

---

## ov008 (16 examined: 3 confirmed tractable, 13 candidate/pending re-audit, 0 confirmed wall)

All 16 functions were independently confirmed as a genuinely virgin
residual (zero prior mention in any `docs/research/retriage/*.md`) with
a HIGH-confidence map-doc name proposal (`docs/research/map/
overlay008.md`) that matched ground truth on direct read in every case.
The sub-agent's full per-function write-ups (original verdict, upgrade
reasoning, struct dependencies, ground-truth pool words, BL/BLX targets,
complete C sketches, and match-difficulty risk notes) are preserved in
full below for the 3 confirmed-tractable, marker-free functions, and
summarized in a table for the 13 marker-carrying candidates (full detail
available in the session transcript if a future re-audit round needs it).

### Confirmed tractable (marker-free) — 3 functions

#### 0x021AE3A0 (724 B) — `Ov008_DrawBattleAnim`

**Verdict: TRACTABLE (risk-noted).** Deterministic sprite-position
computer using the documented `0x66666667` ÷10 smull reciprocal, a
bounded loop with a fixed 5-or-10-iteration count from
`data_ov008_021b279c[idx]` (documented row-pointer array), and one
bit-test into `data_ov008_021b27bc` (the same 0x34-stride bitset table
documented in `dossiers/021aef18.md`, here at concrete word-offset
`+0xc`). 9 callee-saved registers live simultaneously across the loop
body (`func_02005dac`/`func_020944a4` call pair every iteration) — a
proven-reshapeable multi-call-liveness pattern per
`mwcc-register-reuse-recipe`, not a genuine wall.

**Ground-truth pool words:** `data_ov008_021b2dc0`, `data_ov008_021b2dc8`,
`data_ov008_021b279c`, `0x66666667`.

**Ground-truth BL/BLX targets:** `func_020b3870`, `func_02005dac` (loop),
`func_020944a4` (loop), `func_ov008_021aba3c` (conditional),
`func_ov008_021ab484` (conditional).

**C sketch:** see the full sub-agent write-up in the session transcript
— reproduces the bounded-loop sprite-position/bit-test shape faithfully;
the precise per-arm literal offsets need one objdiff pass to pin exactly
but the overall structure and every callee is unambiguous.

---

#### 0x021AE70C (1776 B) — `Ov008_DuelOutcomeTick`

**Verdict: TRACTABLE (clean).** An early-exit gate followed by a large
but fully enumerable one-bit-at-a-time flag ladder over
`data_ov008_021b2dc8+0x4` (11 mutually-exclusive `tst`-guarded arms, each
terminating in a `func_02037208` toast call and a literal numeric
return). Every literal, bitmask, and callee is compile-time fixed —
"many calls/branches/loops" describes real breadth, not runtime-unknown
control flow. Confirmed structurally distinct from the same-address
ov002 sibling this round (`0x021ae70c`, this round's ov002 upgrade,
above) — purely coincidental overlay-RAM-window reuse.

**Ground-truth pool words:** `data_ov008_021b2dc8`, `data_ov008_021b2780`,
`data_ov008_021b2dc0`, `data_ov008_021b27a0`, `data_ov008_021b27a4`,
`data_02104f4c`, `data_02104bac`, `data_ov008_021b2dd4`, `0x66666667`,
`data_ov008_021b2dcc`, `0xfffc`, `data_ov008_021b279c`.

**Ground-truth BL/BLX targets:** `func_0200617c`, `func_02037208`
(13+ conditional), `func_ov008_021adc44` (conditional), `func_02006194`,
`func_ov008_021ada90` (conditional ×4).

**C sketch:** see the full sub-agent write-up — full 11-arm flag ladder
transcribed; two visually-similar `0x40`-tested arms confirmed as
genuinely distinct `.L` targets (`#0x40` vs `#0x80`), not a duplicate.

---

#### 0x021B01D8 (480 B) — `Ov008_InitDuelResult`

**Verdict: TRACTABLE (clean).** Fully deterministic straight-line init:
one DMA-clear, a DISPCNT bitfield RMW, a fixed 26-iteration score-
accumulation loop, a second bounded loop, the standard OAM-sprite
build+submit idiom, and a signed-saturating-add into one of two
mutually-exclusive fields on `data_02105f4c` selected by a boolean flag.
Every branch is a fixed loop-count comparison or a single boolean gate.

**Ground-truth pool words:** `data_ov008_021b2de4`, `0x4001000`,
`data_ov008_021b26f0`, `0x14980`, `data_ov008_021b2dc8`, `data_02104f4c`,
`data_ov008_021b2780`, `data_02105f4c`, `0x4001050`.

**Ground-truth BL/BLX targets:** `func_02094504`, `func_ov008_021aa540`
(×26), `func_ov008_021aedfc`/`021aefd4` (per-iteration), `func_0201d47c`,
`func_02006c0c`, `func_0201e5b8`, `Task_Invoke`, `Task_PostLocked`,
`func_0208e2f4`.

**C sketch:** see the full sub-agent write-up — clean linear transcription,
no branches beyond loop-count comparisons.

---

### Candidate / pending marker-aware re-audit — 13 functions (marker present, NOT counted toward campaign total)

The sub-agent's analysis for these 13 correctly resolves every struct
and data dependency against the current KB (several genuine new-gap
discoveries below), but per this round's calibration should not be
treated as a confirmed wall-overturn without the same back-edge/register-
pressure audit applied to `main`/ov002's marker-carrying functions. Full
C sketches, pool words, and BL-target lists for each are preserved in the
session transcript.

| Address | Size | Sub-agent's proposed name | Sub-agent's claimed shape |
|---------|------|----------------------------|-----------------------------|
| `0x021AD570` | 1180 | `Ov008_ResolveTouchAction` | one-bit-at-a-time flag ladder, toast dispatcher |
| `0x021AF154` | 484  | `Ov008_AnimateCardFlip` | bounded 2-phase reverse/forward walk, ÷5 magic-divide |
| `0x021AF588` | 404  | `Ov008_GetCardProperties` | 60-iter bounded filter/classify loop, 5-way branch table |
| `0x021AF71C` | 792  | `Ov008_PickCardForSlot` | fixed 5-iter outer loop, 5-way branch table, LCG-driven pick |
| `0x021AFA34` | 376  | `Ov008_DrawPickedCards` | ÷5 magic-divide, fixed 5-iter sprite-submit loop |
| `0x021AFCA4` | 548  | `Ov008_PickOpponentCard` | bounded 5-iter loop, 2 ÷5 magic-divides, 5-way branch table |
| `0x021AFEC8` | 784  | `Ov008_DrawDuelResultScreen` | hub function, clamped-to-3 loop + fixed post-loop pass + fixed 4-iter tail |
| `0x021B04C0` | 1364 | `Ov008_HandleScrollInput` | 5 near-identical zone-hit-test blocks (30 calls total) |
| `0x021B0A14` | 432  | `Ov008_DrawDuelSideBar` | linear hub, 2-way + 3-way + gated achievement blocks |
| `0x021B0BC4` | 2868 | `Ov008_DuelResultTick` | **claims to overturn original `tract=never`** — 8 one-bit flag arms (71 calls total, zero `blx`), claimed to decompose into 9 repetitions of one known 3-call idiom |
| `0x021B16F8` | 428  | `Ov008_SubmitCardBatch` | nested bit-scan loops (26×64 bounded), 3 fixed loops |
| `0x021B1998` | 320  | `Ov008_InitSpiritObj` | linear init + nested 3×32 grid-fill loop |
| `0x021B1C14` | 244  | `Ov008_InitSpiritNameText` | fully linear text-render init, zero loops |

**`0x021B0BC4` deserves particular caution before any future re-audit**:
it was originally heuristic-tagged `tract=never` (2868B, 71 calls — the
largest function in this batch), and the sub-agent's claim that its
"huge call count decomposes into 9 near-identical repetitions of a
single already-documented 3-call idiom, not genuine scheduling entropy"
is a strong, specific, well-argued claim — but per this round's own
finding that large call-dense bodies are the LEAST likely marker
false-positive category (not the most), this specific function is the
single highest-priority candidate for a real back-edge/register-pressure
audit in R11, not an assumed win.

### New KB gaps found in ov008 (both confirmed-tractable and candidate functions)

Preserved from the sub-agent's own gap table — genuinely useful
regardless of final tractability status, since these are struct/offset
facts, not tractability claims:

| Symbol/offset | Notes |
|---|---|
| `data_ov008_021b279c` | Stride-0x34 row-pointer array, related to but distinct from documented `data_ov008_021b2790` |
| `data_ov008_021b2780+0x55c`/`+0x560`/`+0x638`/`+0x4` | New offsets on the documented `_2780` base |
| `data_ov008_021b2780+0x634` new bits `0x40`/`0x80`/`0x100`/`0x200`/`0x400`/`0x1` | Extends the documented "bits 4,5,8" note |
| `data_02104bac+0x54`/`+0x56` | Cross-overlay global; only `+0xa8` was previously listed |
| `data_ov008_021b2dd4` | Separate bitset table from the documented `_27bc`, same row/word/bit shape scaled by `0x66666667` |
| `data_ov008_021b2dcc` | Small struct, `+0x0` u16 — generic prose note existed, specific field new |
| `data_ov008_021b27bc` word offsets `+0xc`, `+0x28` | Specific indices within the documented bitset table |
| `data_ov008_021b2c80+0x58` | Per-zone countdown/hold-counter for scroll-repeat debounce |
| `data_ov008_021b26dc`, `data_ov008_021b2dec` | New globals, not in the documented BSS catalog at all |
| `data_ov008_021b2780+0x5fc` | 4-entry BGM-channel handle pointer array |
| `data_ov008_021b2de4+0xc4`/`+0xb0` | Draw-progress counter / achievement-slot-scan cursor |
| `data_ov008_021b26f0` | New global, OAM-template pointer arg |
| `data_ov008_021b2dc8+0x568` | Boolean selector between two `data_02105f4c` targets |
| `data_ov008_021b270c` fields `+0x8`,`+0x10`,`+0x14`,`+0x18`,`+0x1c`,`+0x20` | Substantially extends the documented pointer-variable's field set |
| `data_ov008_021b2714` | Adjacent sibling scalar to documented `data_ov008_021b2710` |
| `func_0202224c`/`func_02022234` | Self-evident flags-get/flags-set pair, not separately named |

---

## ov004 (14 examined: 0 confirmed tractable, 14 candidate/pending re-audit)

All 14 ov004 targets carry the brief-302 marker (100%, verified directly
by the orchestrating session — see calibration note above). The
sub-agent's analysis is thorough and internally well-cross-referenced
(it independently caught and corrected an inconsistency in R9's own
`021d7440` entry — see gap #1 below), and correctly resolves the
TaskConfig-build idiom, the `022ce950`/`0220b500`/`0220e500` struct
families, and the OV006-pattern full-init sequence against the current
KB for every function. **None of these 14 are counted toward the
campaign's newly-tractable total this round** — they are candidate
reshape targets pending the same marker-aware audit flagged for ov008
above. Full C sketches, pool words, and complete BL-target lists for
each are preserved in the session transcript.

| Address | Size | Sub-agent's proposed name | Sub-agent's claimed shape |
|---------|------|------------------------------|-----------------------------|
| `0x021D06AC` | 2028 | `Ov004_UpdateSessionMain` | 70-call render-setup hub; sub-agent's own risk note: "expect several incremental reshape passes... not a scheduling wall, just large" |
| `0x021D1448` | 1520 | `Ov004_ProcessCmdResponse` | 85-branch guard-chain controller, 2-way top split, enumerated bitmask decode |
| `0x021D2C40` | 644  | `Ov004_UpdateCardView` | 7-way branch table, ÷10 magic-divide (matches R9's `021d0f98`/`021d2aac` family) |
| `0x021D2EC4` | 1228 | `Ov004_RenderCardPanel` | state-machine dispatcher, 43 calls; contains the 3rd confirmed call site of R9's `Ov004_RGBBlend` (`func_ov004_021c9dd4`) |
| `0x021D3390` | 488  | `Ov004_DrawCardStats` | fully linear, zero branches — sub-agent notes "matching R9's `021d03ec` precedent exactly" |
| `0x021D4E0C` | 504  | `Ov004_UpdateSlotRecord` | string-builder, single deterministic mla; **corrects an R9 internal inconsistency**, see gap #1 |
| `0x021D5DC8` | 1264 | `Ov004_UpdateSessionDisplay` | 57-call MMIO/VRAM full-init + 7-way branch table |
| `0x021D6B88` | 840  | `Ov004_UpdateRemoteState` | 26-call MMIO RMW + umull-based `%18` index compute |
| `0x021D71EC` | 596  | `Ov004_UpdateRemoteCards` | 8-way branch table + bounded 3-iter loop |
| `0x021D7564` | 752  | `Ov004_DrawRemoteHandFull` | 2-value gate + bounded 4-iter loop, sibling of `021d71ec` |
| `0x021DAC7C` | 1228 | `Ov004_UpdateStreamRecord` | 5 bounded scan loops, 2 magic-divides (÷48 + ÷10 combined) |
| `0x021DB148` | 1000 | `Ov004_ProcessStreamInput` | ÷10-then-mod-5 index compute (matches R8's `021cced8`), 3-way byte-dispatch |
| `0x021DB530` | 592  | `Ov004_RenderStreamUI` | bounded 5-iter loop + ÷48 magic-divide + progress-bar draw |
| `0x021DBA08` | 624  | `Ov004_RenderStreamSession` | OV006-pattern full-init idiom (documented), 6-way branch table tail |

**Cross-check confirmation:** the sub-agent independently grepped all
`docs/research/retriage/*.md` for each of the 14 addresses and found zero
prior mentions in any round's document — the residual-list computation
is confirmed correct, this was a genuinely virgin set regardless of the
marker-status question above.

### New KB gaps found in ov004

1. **Correction to R9's `021d7440` entry:** R9 attributed the `+0xc94`/
   `+0xc98`/`+0xc9c`/`+0xca0` cluster to `data_ov004_0220b500`, but this
   round's `021d4e0c` directly reads this exact cluster off
   `data_ov004_0220e500` (confirmed via a live pool-word cross-check).
   R9's own separate `021d53c0` entry independently and correctly
   attributes `+0xc94` to `0220e500` — an internal R9 inconsistency, not
   a new ambiguity. Recommend correcting `021d7440`'s struct-dependency
   line in a future doc pass.
2. **`b500+0x3c90` vs `data_ov004_0220e500+0xc90`** — confirmed DIFFERENT
   fields despite the same relative sub-offset (021db530 reads the
   former, the already-matched `021d5004.c` reads the latter) — flagged
   so a future pass does not conflate them.
3. **`0xb21642c9`** (`021d1448`) — new smull magic constant, derived to
   be the ÷23 reciprocal (post-shift `asr #0x4`), corroborated by a
   paired `mov fp,#0x17` (23) remainder-multiply. Not yet in
   `MagicDivisionConstants.md`/`OverlayConstantsExtended.md`.
4. **`0x38e38e39` reused as unsigned ÷18-modulo, not ÷72** (`021d6b88`)
   — same hex constant `OverlayConstantsExtended.md` documents as the
   ÷72 reciprocal (ov021), applied here via `umull` with a different
   post-shift/remultiply shape for a `%18` array-index modulus. The KB
   entry should note both the post-shift AND the multiply-back shape
   must be checked, not just the hex constant (extends the existing
   `0x88888889` divisor-ambiguity caution in the same doc).
5. **`data_02104eac`** (`021d5dc8`, `021d6b88`) — small struct, `+0x68`/
   `+0x6a`/`+0x6c` u16 fields, accumulated into `data_02104f4c+0xa5c`/
   `+0xa54`/`+0xa60` (capped at 0x64 each) then zeroed — confirmed live
   in 2 independent functions with identical layout, a "pending
   achievement/score delta" staging record.
6. **`data_ov004_0221159c`**, **`data_ov004_022915a0`** — new VRAM-
   transfer-dest / init-object pointers, each confirmed live in 2
   independent full-init-idiom functions (`021d5dc8`, `021dba08`).
7. **`data_02104cae`/`data_02104cb0`** (`021d6b88`) — byte-array pair,
   stride `0x1a`, near but not identical to R9's already-flagged
   `data_02104cec` "selector-index array" — likely a related family
   member.
8. **`data_02104bac+0x54`/`+0x56`** (`021d1448`, `021dac7c`) — new
   bit-tested u16 offsets, a directional-input bitmask feeding UI
   navigation; extends the documented `+0xa8` field with 2 more offsets.
9. **`func_ov004_021e7e30_unk`** (`021dba08`) — already independently
   classified by dsd's own static analysis as a real ARM function (per
   `docs/research/ov004-rodata-misclassification-survey.md`'s
   code-in-`.rodata` veneer band) — fully callable/resolvable for this
   function's tractability, but its own internals remain undocumented.

Several smaller single-site gaps (small string/format-arg globals in the
`data_ov004_0220a0xx` band, per-slot cached-record sub-struct fields on
`b500+0x3000`) are preserved in the session transcript.

---

## ov006 — NOT REACHED this round

The ov006 sub-agent (20 residual functions: `0x021c19ec` through
`0x021c91e0`) hit a server-side rate limit before producing any content.
A separate context-gathering pass (skimming R6/R8's existing ov006
recipes — the OBJ-attribute-setter idiom via `func_02021660`/
`func_020216b0`, the card-slot-object-base struct `data_ov004_0224f448`,
the 5-way slot-base address resolver, and ~15 other already-documented
globals/idioms) completed and is preserved in the session transcript as
useful groundwork for whichever round picks this module back up, but no
per-function verdicts were produced. **All 20 ov006 addresses carry over
to R11 in full.**

Per this round's calibration finding, a future ov006 pass should check
each target `.s` file for the brief-302 marker FIRST (a one-line grep,
build-free) before doing any KB cross-referencing — this round's
experience shows checking the marker up front is far cheaper than
discovering the calibration issue after a full sub-agent analysis pass.

---

## Summary

| Module | Examined | Confirmed tractable (marker-free) | Candidate (marker present, pending re-audit) | Not reached |
|--------|----------|-------------------------------------|-------------------------------------------------|-------------|
| ov004  | 14       | 0                                     | 14                                                | 0           |
| ov006  | 0        | 0                                     | 0                                                  | 20          |
| ov008  | 16       | **3**                                 | 13                                                 | 0           |
| **Total** | **30** | **3**                              | **27**                                             | **20**      |

**Campaign-total contribution this round: 3** (ov008's marker-free
functions only). The 27 candidate write-ups and 20 not-reached ov006
functions all carry over to R11 — the candidates need a back-edge/
register-pressure audit (not a full re-read; the struct/KB facts are
already resolved and can be reused directly), and ov006 needs a first
pass with the marker checked up front.
