[//]: # (markdownlint-disable MD013 MD041)

# Hard-Tier Re-triage Index

Re-assessment of the 2,188 E/F class `.s` functions that were originally
classified as "intractable" — before the struct/data/constants KB existed.
Now that the KB explains struct offsets and data table layouts, many of these
were re-examined to find newly plausible matches.

> Branch: `kb/retriage-r9-containment` (R9 extension — 5 waves, ~195 newly
> tractable; also folds in R8's ~152, never previously indexed)
> Do NOT regenerate — the brain handles the index at merge.

---

## Files

| File | Module(s) | Newly tractable | KB gaps found |
|------|-----------|-----------------|--------------|
| [Ov002EFRetriage.md](Ov002EFRetriage.md) | ov002 (980 E/F, 413 examined < 400 B) | **297** (72% of examined) | `id_lo13` bitfield=158, PPT=120, DQS=59, DSS=58 |
| [MainEFRetriage.md](MainEFRetriage.md) | main (755 E/F) | 8 definite + 2 conditional | data_02102c7c beyond 0x03B, GameSingleton +0x348/+0x464 |
| [OverlayEFRetriage.md](OverlayEFRetriage.md) | all other overlays (453 E/F) | **23** definite | ov006 stride constants, ov011 actor struct |
| [R5SupplementaryRetriage.md](R5SupplementaryRetriage.md) | main (2) + ov002 dispatch (3) | **5** (conditional → confirmed tractable) | — (gaps now closed) |
| [Ov002EFRetriagedLarge.md](Ov002EFRetriagedLarge.md) | ov002 (400–1200 B tier, 25 examined) | **25** (100% of examined) | DSS+0xD84/D6C/D58/D98 gap fields (init-only, tractable without names) |
| [Ov008Ov010Retriage.md](Ov008Ov010Retriage.md) | ov008 (35 E/F), ov010 (24 E/F) | **9** | ov008 slot-array, ov010 VRAM-bank tables (→ OverlayDataGlobs.md) |
| [SmallOverlaysRetriage.md](SmallOverlaysRetriage.md) | ov003/005/009/012/014 (112 total .s, all examined) | **10** | dispatch-table-advance pattern; sub-display MMIO clear pattern |
| [Ov016Ov020Ov015Retriage.md](Ov016Ov020Ov015Retriage.md) | ov016 (44), ov020 (33), ov015 (32) — 56 examined | **13** | new data globals in OverlayDataGlobs.md |
| [Ov004Ov006Deep.md](Ov004Ov006Deep.md) | ov004 (20 new files), ov006 (24 new files) | **15** | 3 new ov006 globals; smull ÷10 pattern |
| [Ov017Ov019Retriage.md](Ov017Ov019Retriage.md) | ov017 (14 E/F), ov019 (10 E/F) — never examined before R7 | **24** (100% of examined) | SystemWork+0x91C/0x920 (→ MainConstants.md); GlobalAudioState/DSS extensions |
| [SmallOverlaysRetriageR7.md](SmallOverlaysRetriageR7.md) | ov001/007/013/018/021/022 (28 funcs) | **20** | 4 new smull reciprocals (→ OverlayConstantsExtended.md); ~15 new data globals |
| [Ov000Deep.md](Ov000Deep.md) | ov000 (26 residual, only 8/32 examined before R7) | **2** | 8 gaps flagged (VRAM descriptors, unnamed bitfield struct); mostly reconfirms genuine wall |
| [Ov011Deep.md](Ov011Deep.md) | ov011 (19 residual, only 8/27 examined before R7) | **5** | actor-struct field table extension (+0x21c..+0x288); 7 new data globals |
| [MainEFRetriageR8.md](MainEFRetriageR8.md) | main (35 residual, never examined before R8) | **35** (100%) | none — fully KB-resolved |
| [Ov002EFRetriageR8.md](Ov002EFRetriageR8.md) | ov002 (35 residual, never examined before R8) | **35** (100%; 31 clean + 4 conditional-with-caveats) | — |
| [Ov004Ov006DeepR8.md](Ov004Ov006DeepR8.md) | ov004 (15), ov006 (15) — 3rd pass | **30** (100%) | 7 new gaps (inline) |
| [SmallOverlaysRetriageR8.md](SmallOverlaysRetriageR8.md) | 10 small overlays, 60 residual | **52** (87%), 8 confirmed wall | several (inline) |
| [Ov002EFRetriageR9.md](Ov002EFRetriageR9.md) | ov002 (50 residual) | **38** (76%), 12 wall | 6 new gaps (inline) |
| [MainEFRetriageR9.md](MainEFRetriageR9.md) | main (50 residual) | **34** (68%), 16 wall (7 R4-reconfirmed + 9 new) | 20 new gaps (inline) |
| [Ov004Ov006DeepR9.md](Ov004Ov006DeepR9.md) | ov004 (19), ov006 (20) — 4th pass | **38** (97.4%: 29 clean + 10 risk-noted), 1 wall-adjacent | — |
| [Ov011Ov016Ov010Ov005RetriageR9.md](Ov011Ov016Ov010Ov005RetriageR9.md) | ov005 (15), ov010 (12), ov011 (14), ov016 (17) | **44** (76%), 14 wall | — |
| [SmallOverlaysRetriageR9.md](SmallOverlaysRetriageR9.md) | 10 small overlays, 52 residual (drained to zero) | **41** (39 clean + 2 nuanced dispatchers), 11 wall | several (inline) |

---

## Grand Total: Newly Tractable Funcs

| Tier | Count | Notes |
|------|-------|-------|
| **ov002** (< 400 B, from R4) | **297** | 413 examined, 72% |
| **main** (R4 definite) | **8** | |
| **main** (R4 conditional → R5 confirmed) | **+2** | GS+0x348/464 gaps now filled |
| **Overlays** (R4 definite) | **23** | |
| **ov002 dispatch** (R5 conditional → confirmed) | **+3** | DSS D1C/D2C gaps now filled |
| **main** (R5: GS+0x464 also unblocks `0204c120` + `02050054`) | **+2** | same gap as R5 supplementary; 4 main total |
| **ov002** (400–1200 B, R5 large-tier) | **+25** | 25/25 (100%); agent result |
| **R6: ov008 + ov010** | **+9** | Ov008Ov010Retriage.md |
| **R6: ov003/005/009/012/014 (small)** | **+10** | SmallOverlaysRetriage.md |
| **R6: ov016 + ov020 + ov015** | **+13** | Ov016Ov020Ov015Retriage.md |
| **R6: ov004 deep + ov006 deep** | **+15** | Ov004Ov006Deep.md |
| **R6: main E/F unblocked by GlobalData02102c7c extension** | **+6** | GlobalData02102c7c.md (+0x03B→+0x0B4) |
| **R7: ov017 + ov019** | **+24** | Ov017Ov019Retriage.md (100% of examined) |
| **R7: ov001/007/013/018/021/022 (small)** | **+20** | SmallOverlaysRetriageR7.md |
| **R7: ov000 deep (residual)** | **+2** | Ov000Deep.md |
| **R7: ov011 deep (residual)** | **+5** | Ov011Deep.md |
| **R8: main (residual)** | **+35** | MainEFRetriageR8.md (100% of examined) |
| **R8: ov002 (residual)** | **+35** | Ov002EFRetriageR8.md (100%; 4 conditional-with-caveats) |
| **R8: ov004 + ov006 (3rd pass)** | **+30** | Ov004Ov006DeepR8.md (100%) |
| **R8: 10 small overlays** | **+52** | SmallOverlaysRetriageR8.md (87% of 60 examined) |
| **R9: ov002 (residual)** | **+38** | Ov002EFRetriageR9.md (76% — genuine hard tier reached) |
| **R9: main (residual)** | **+34** | MainEFRetriageR9.md (68% — genuine hard tier reached) |
| **R9: ov004 + ov006 (4th pass)** | **+38** | Ov004Ov006DeepR9.md (97.4%) |
| **R9: ov005 + ov010 + ov011 + ov016** | **+44** | Ov011Ov016Ov010Ov005RetriageR9.md (ov011 outlier: 1/14) |
| **R9: 10 small overlays (residual drained to zero)** | **+41** | SmallOverlaysRetriageR9.md (39 clean + 2 nuanced dispatchers) |
| **Grand total** | **~813** | R4 ~330 + R5 +32 + R6 +53 + R7 +51 + R8 +152 + R9 +195 |

> **R9 count: +195 newly tractable across 5 waves (ov002, main, ov004+ov006,
> and two mop-up groups spanning 9 overlays).** Hit rates dropped sharply
> for ov002 (76%) and main (68%) — the first sub-R7-level rates since R4 —
> confirming the campaign is now reaching genuinely hard residue rather than
> merely-undocumented KB gaps (main's doc explicitly re-confirms 7 of its 16
> walls against R4 precedent). ov004/ov006's 4th pass still ran 97.4% — KB
> maturity for a well-covered module keeps paying off long after the
> "obvious" funcs are gone. The ov005/ov010/ov011/ov016 wave surfaced a
> stark within-wave contrast: ov011 (1/14) had already absorbed a full R7
> deep pass, while its three neighbors were genuinely fresh territory and
> hit near-100%. The 10-small-overlay mop-up drained its residual to zero,
> closing ov021/ov018/ov000 as fully-confirmed wall (byte-for-byte
> re-verification of prior rounds' own claims) alongside two large
> dispatcher functions (ov012 `021cb49c`, ov013 `021ca7cc`) resolved with a
> per-case verdict instead of one flat call.
> Running total: **~813** confirmed tractable funcs across R4 + R5 + R6 +
> R7 + R8 + R9.

> **R8 count: +152 newly tractable (35 main + 35 ov002 + 30 ov004/ov006 +
> 52 of 10 small overlays).** main/ov002/ov004+ov006 all ran at or near
> 100% — R7's KB-maturity trend continued unbroken. The 10-small-overlay
> batch was the first sub-100% "small overlays" round (87%, 8 confirmed
> wall) — an early signal, later confirmed by R9's follow-up mop-up, that
> the small-overlay tier was approaching its genuine floor.

> **R7 count: +51 newly tractable across 10 overlays.** ov017/ov019 (never
> examined before) ran 24/24 = 100% tractable — the highest hit rate of any
> retriage round to date. ov000 and ov011 got the deep second pass their R4
> 8-of-N shallow sample never got; most of their backlog reconfirmed as
> genuine wall (consistent with `ov000_core.h`'s existing thinning verdict),
> but both still yielded a handful of clean recipes plus rich struct-field
> extensions for a future pass.
> Running total: **~466** confirmed tractable funcs across R4 + R5 + R6 + R7.

> **R6 count: +53 newly tractable (47 from retriage docs + 6 main unblocked by KB extension).**
> 16 overlays examined for the first time in R6; ov004/ov006 got a deep second pass.

> **Final R5 count: 362 funcs confirmed tractable across R4 + R5.**
> The large-tier 400–1200 B band ran 100% tractable (25/25) — even higher than
> the <400 B tier's 72% — because larger functions have more struct anchors per
> instruction, making classification unambiguous.

---

## Key Findings by Module

### ov002 (see [Ov002EFRetriage.md](Ov002EFRetriage.md))

- **747 of 980** E/F funcs access ≥1 known struct (DSS / PPT / DQS / tables).
- The original "scheduling coin-flip" label was often a misdiagnosis: funcs with
  `ldr r?, =0x022d016c` + documented offset had *no* scheduling ambiguity —
  the offset was simply unknown, not unresolvable.
- **CardHandlerTable dispatch** (2 funcs, 92–96 B): fully tractable today.
- **DSS fn-ptr dispatch via `f_d2c`** (~10 funcs): tractable once two new DSS
  fields (+0xD2C/+0xD30) are added to `DuelStateSingleton.md`.
- **PerPlayerRowTable PPT-A scans** (~30–40 funcs, < 250 B, single blx):
  tractable with `Ov002Slot.id_lo13 : 13` bitfield shape and documented stride.
- **~900 ov002 E/F funcs remain intractable**: nested loops + multiple blx
  callbacks where the scheduling coin-flip is genuine, not a KB gap.

### main (see [MainEFRetriage.md](MainEFRetriage.md))

- **2 vtable-slot dispatch funcs** (28 B each, `func_020a71e4/720a724c`):
  now tractable — `data_02102958` is a matched C file.
- **3 SDK FX math funcs** (`020b1e4c`, `020b1e0c`, `020b319c`): NitroSDK
  `FX32_Normalize` / float-round patterns; deterministic mwcc output.
- **3 GlobalAudioState accessor funcs**: unlocked by documented `GlobalAudioState.f3c`
  offset and audio array stride.
- **4 conditionals → tractable (R5)**: `func_0204bf44`, `func_0204ca70` (R5 supplementary doc),
  `func_0204c120`, `func_02050054` (same GS+0x464/0x468 gap, now filled).

### R9 Overlays (see retriage docs above)

- **ov002 + main residual (76% / 68%):** the first sub-R7-level hit rates
  since R4 — both docs explicitly re-confirm several walls against R4
  precedent (main: 7 of 16) instead of discovering new KB gaps, meaning
  these batches are the campaign's first genuinely-representative sample of
  the *remaining* hard tier rather than a backlog of merely-undocumented KB
  gaps. One contested verdict (`0x020970a8`) was initially claimed
  tractable by an internal sub-batch, then reverted to wall after
  cross-referencing brief 271's "6/23 are clean shells" caveat plus a
  direct `.s` re-read. Conversely `0x022640F4` (ov002) was found listed as
  BOTH an intractable-prose entry AND a tractable-summary-table entry
  within R4 itself — resolved tractable on fresh read.
- **ov004 + ov006 (4th pass, 97.4%):** still finding clean recipes this
  deep into an already-well-covered module — KB maturity compounds.
- **ov005 / ov010 / ov011 / ov016 mop-up:** ov005 (15/15), ov010 (11/12),
  ov016 (17/17) were genuinely fresh residual and hit near-100%; **ov011
  (1/14) is the outlier** — it already absorbed a full deep pass in R7
  (`Ov011Deep.md`), so this batch is its *second* hard layer, not its
  first.
- **10-small-overlay mop-up (residual drained to zero):** ov009/ov003/ov014
  100%; ov021 (0/5), ov018 (0/1), ov000 (0/2) all independently
  byte-for-byte re-confirmed as genuine wall, matching prior rounds' own
  verdicts exactly; ov012's `021cb49c` (2584 B, 11-way dispatcher) and
  ov013's `021ca7cc` (18-case dispatcher) each got a **per-case verdict**
  instead of one flat call — several cases ship-clean today, others are
  gap-flagged (unresolved raw `.word` `bl` callee symbols, not scheduling
  walls), and exactly one sub-block in each is a confirmed wall
  cross-referenced to an existing dossier.
- **New tooling:** [`tools/containment_check.py`](../../../tools/containment_check.py)
  (Task 2, this round) diffs `build/<ver>/build/arm9.bin` against
  `extract/<ver>/arm9/arm9.bin` inside a candidate's delinked address range
  to classify a sha1 failure as CONTAINED (byte diff stays inside the
  range — normal C-shaping miss, keep iterating) vs AVALANCHE (diff spills
  outside — link/layout perturbation, park immediately). Build-free to
  write; validated against brief-514's own ground-truth dataset.
- **KB gaps:** ~40 new fields/tables flagged across this round's docs (raw
  `.word` `bl` callee-symbol gaps cluster in ov002's `0x021b12xx`–
  `0x021b1dxx` range and need a decomper with `dsd`/objdump access to
  resolve). Documented inline per-file only this round, consistent with
  R7's precedent for high-volume/variable-confidence gap sets — see
  "KB Gaps: Status" below.

### R8 Overlays (see retriage docs above)

- **main + ov002 + ov004/ov006 (all ~100%):** continued R7's KB-maturity
  trend without interruption — every residual func in these 3 docs (100
  combined) resolved to a deterministic struct/literal/callee shape.
- **10-small-overlay batch (87%, 8 wall):** the first "small overlays"
  round to land under 100% — an early signal (later confirmed by R9's
  follow-up mop-up) that the small-overlay tier was approaching its
  genuine floor rather than still being gated by KB gaps.

### R7 Overlays (see retriage docs above)

- **ov017 wins (14, 100%):** every remaining hard-tier func tractable, including two large (2-3KB) state machines/inits previously tagged "permuter terr" — larger bodies again proved easier to classify, not harder.
- **ov019 wins (10, 100%):** same pattern — jump-table dispatchers, MMIO setup sequences, and layout-marshalling bodies all resolved once `SystemWork`, `GlobalAudioState`, and DSS-adjacent fields were cross-referenced.
- **Small overlays (20 of 28):** ov001 (3/3), ov007 (1/1), ov013 (4/5 + partial case-level recipe on the 5th), ov018 (5/6), ov022 (7/7); ov021 confirmed fully wall (matches its existing `ov021_core.h` verdict exactly, 0/6).
- **Address-reuse finding:** `0x021aa4a0` recurring across ov018/ov021/ov022 (and already-matched ov000/ov008) is confirmed COINCIDENTAL — different, unrelated functions placed at the same overlay-relative offset, not shared code. Do not assume same-address-across-overlays implies same-function.
- **Genuine cross-overlay clone found:** `func_ov022_021ab4b0` is byte-identical to `func_ov020_021ada74` — one recipe covers both.
- **ov000 deep pass (2 of 26):** the bulk of ov000's backlog reconfirms as genuine wall — consistent with `ov000_core.h`'s standing verdict — but surfaced 2 clean recipes plus a twin-pair (`021abe64`/`021abec8`, `021ad660`/`021ad8dc`) worth a dedicated struct doc once bit-widths are pinned down.
- **ov011 deep pass (5 of 19):** actor-struct fields at `+0x274`/`+0x284` resolved but did NOT unlock the 3 dispatch funcs that touch them (walled by jump-table topology, not missing facts) — a reminder that KB gaps and scheduling-entropy walls are independent failure modes.

### R6 Overlays (see retriage docs above)

- **ov004 wins (6 new, beyond R4's 4):** VRAM-clear/palette-DMA split-at-0xd0 pair, toast dispatcher, 9-case tear-down/reconnect, panel-open/close wrappers.
- **ov006 wins (9 new, beyond R4's 8):** 5th and 6th init-family members, stride-copy variant, 4-way seed+loop, Fill/Copy 5-way dispatch pair, trivial count accessor, state setter.
- **ov008 wins (5):** dispatch driver, full-init VRAM, sprite draw, sub-display MMIO, slot-clear.
- **ov010 wins (4):** 3-path boolean switch, 3-way rect setter, 8-way VRAM bank-base + bank-size dispatch pair.
- **ov016 wins (5):** OV006-pattern full-init, state dispatcher, touch hit-test pair, dual-task-creation.
- **ov020 wins (4):** OBJ tilemap init, OBJ tile fill pair, SE dispatch.
- **ov015 wins (4):** predicate, coord layout setter, tilemap writer, sprite factory.
- **Small overlays (10):** ov003 no-op stubs (2), ov005 BG-scroll MMIO + dispatch-advance, ov009 MMIO-clear + hit-test + dispatch-advance, ov012 tile-mode lookup, ov014 bitfield-packer + MMIO-clear.
- **Recurring patterns found:** dispatch-table-advance (ov005/ov009), sub-display MMIO clear (ov009/ov014), OV006-pattern VRAM full-init (ov016/ov020), smull ÷10 magic constant (ov006).

### Overlays (see [OverlayEFRetriage.md](OverlayEFRetriage.md))

- **ov006 wins (8):** `OV006_STRIDE_SLOT_COUNT=5` / `OV006_STRIDE_COL_COUNT=7`
  constants unlock 4 stride-init family funcs; VRAM full-init + stride bitmask
  pattern add 4 more.
- **ov011 wins (4):** Actor-slot `lsl #0x17 / lsr #0x1c` 4-bit extract + tile
  dispatch table.
- **ov000 wins (4):** `0x40000000` deferred-task bit + smull magic constants.
- **ov004 wins (4):** Post-BLX register rotation confirmed tractable once the
  indirect call chain resolves to `data_ov004_` rodata constants.
- **ov013 (2)** + **ov021 (1)**: BLDALPHA layout / sparse-LUT scan.

---

## KB Gaps: Status After R5

| Gap | Status | Doc updated | Funcs unblocked |
|-----|--------|-------------|-----------------|
| `DuelStateSingleton+0xD1C/D20/D24/D28` | ✅ **FILLED (R5)** | DuelStateSingleton.md | ~20 dispatch funcs |
| `DuelStateSingleton+0xD2C/D30/D34` | ✅ **FILLED (R5)** | DuelStateSingleton.md | ~10 dispatch funcs |
| `DuelStateSingleton+0xD44/D54/D9C` | ✅ **FILLED (R5)** | DuelStateSingleton.md | supporting fields |
| `data_ov002_022cb96c` (fn-ptr table) | ✅ **DOCUMENTED (R5)** | FunctionPointerTables.md §9 | dispatch callers |
| `data_ov002_022ca998` (fn-ptr table) | ✅ **DOCUMENTED (R5)** | FunctionPointerTables.md §8 | dispatch callers |
| `GameSingleton+0x348`, `+0x1A8`, `+0x464`, `+0x468` | ✅ **FILLED (R5)** | GameSingleton.md | 4 main E/F funcs (`0204bf44`, `0204ca70`, `0204c120`, `02050054`) |
| `data_ov002_022cdc78+0xC` (int counter) | already counted | — | CardHandlerTable callers |
| `GlobalData02102c7c` beyond `+0x03B` | ✅ **FILLED (R6)** | GlobalData02102c7c.md (+0x03C→+0x0B4, ptr table + task handle) | 6 main E/F funcs |
| `data_ov008_021b2780` (entry pool), `021b2c80` (control hdr) | ✅ **DOCUMENTED (R6)** | OverlayDataGlobs.md | ov008 slot-clear + sprite funcs |
| `data_ov010_021b9260` (card-list singleton, 12 fields) | ✅ **DOCUMENTED (R6)** | OverlayDataGlobs.md | ov010 VRAM-bank dispatch pair |
| `data_ov016_021b8f80` (fn-ptr dispatch table, 32 slots) | ✅ **DOCUMENTED (R6)** | OverlayDataGlobs.md | ov016 state dispatcher |
| smull reciprocals 0x1b4e81b5 (÷150), 0x55555556 (÷3) | ✅ **DOCUMENTED (R6)** | OverlayConstantsExtended.md | ov008, ov016 magic-divide funcs |
| `SystemWork+0x91C/+0x920` (aliased via `data_02104f4c`) | ✅ **FILLED (R7)** | MainConstants.md (`SYSWORK_ANIM_FRAME_COUNT`/`SYSWORK_ANIM_SUBFRAME`) | ov017/ov019/ov003 funcs |
| smull reciprocals 0xb60b60b7 (÷360), 0x2aaaaaab (÷48), 0x38e38e39 (÷72), 0x88888889 (postshift-dependent ÷15/30/60) | ✅ **DOCUMENTED (R7)** | OverlayConstantsExtended.md | ov001, ov018, ov021, ov022 magic-divide funcs |
| ov011 actor-struct fields `+0x21c..+0x288` (extended) | documented, not yet unblocking | Ov011Deep.md (inline; not folded into a types/ doc) | resolved fields didn't unlock the 3 dispatch funcs — walled by topology, not facts |
| ov000 `021abe64`/`021abec8` packed-field struct, `data_ov000_021b56b4` wide row | documented, not yet unblocking | Ov000Deep.md (inline; not folded into a types/ doc) | needs dedicated struct doc + full-row survey before it unlocks anything |
| R8/R9 new fields (~40+, across ov009/ov012/ov002/main/ov004/ov006/ov005/ov010/ov016/etc.) | documented, not yet folded | inline in each round's own retriage doc only | mixed confidence — a handful corroborated 2-3× across independent function sites within R8+R9 (e.g. `data_02104bac+0x52` flagged in both `SmallOverlaysRetriageR8.md` and this round's ov009 doc; `data_ov012_021cc6a0[0x19c]` and `data_02104bac[0x54]` each corroborated 2× across independent ov012 functions within `SmallOverlaysRetriageR9.md`), most single-site; needs a dedicated fold-in pass into `types/`/`data/`/`constants/` docs before promotion, same as R7's ov000/ov011 residue above |

---

## What This Means for the Campaign

R4 + R5 together have moved **~362 E/F funcs** from "intractable" to "candidate
pool" — the large-tier result (25/25 = 100%) pushed the final count well past
the R4 estimate.

Key message:
- The conditional/gap bucket is now largely drained — most blocked funcs have
  their KB dependencies filled.
- The remaining E/F intractable tier is **genuinely hard**: multiple-blx
  callbacks, float CPSR, large loop bodies with real scheduling entropy.
- New tractable funcs are class C/D difficulty — they need reg-reuse and
  decl-order levers, but they **can** be matched in principle.

**All tracked KB gaps now filled.** `GlobalData02102c7c` beyond +0x03B is
documented in `GlobalData02102c7c.md` (+0x088..+0x0B4, switch-pointer table,
task handle), unblocking ~5 main E/F funcs. Overlay globals and constants for
ov008/ov010/ov016 are documented in `docs/research/data/OverlayDataGlobs.md`
and `docs/research/constants/OverlayConstantsExtended.md`.

**New gap (low-priority):** DSS+0xD84/+0xD6C/+0xD58/+0xD98 — observed in R5
large-tier init funcs; the funcs are tractable without the field names (pure
write sequence, no scheduling), but naming them would improve KB completeness.
