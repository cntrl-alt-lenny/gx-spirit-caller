[//]: # (markdownlint-disable MD013 MD041)

# Small Overlays Re-triage — R8 (9 overlays, virgin residual)

Round 8 pushes into virgin (never examined in R4-R7) hard-tier E/F residual
across 9 smaller overlays: ov016, ov010, ov008, ov003, ov014, ov015, ov020,
ov005, ov009. Cross-referenced against each overlay's `docs/research/map/`
naming pass, `docs/research/retriage/Ov008Ov010Retriage.md` (R6, ov008/ov010),
`docs/research/retriage/Ov016Ov020Ov015Retriage.md` (R6, ov016/ov020/ov015),
`docs/research/retriage/SmallOverlaysRetriage.md` (R6, ov003/ov005/ov009/ov014),
`docs/research/retriage/Ov017Ov019Retriage.md` (R7 template — the "bounded,
discriminant-driven computed branch is not scheduling entropy" methodology
this round applies throughout), plus per-overlay `docs/research/data/`,
`docs/research/types/`, and `docs/research/constants/` docs cited inline.

**Overall result: 60 examined, 52 newly tractable (87%), 8 confirmed wall.**
The 8 walls are concentrated entirely in ov008 — every one of that batch's
addresses turned out to be already-documented in `src/overlay008/ov008_core.h`
as a prior C-match attempt with permuter runs and explicit wall verdicts
(peephole divergence, 20v20 reg-alloc, signed-modulo ror-idiom mismatch) —
not missing-KB walls. Every other overlay in this batch hit 100%.

---

## Summary by overlay

| Overlay | Examined | Newly tractable | Confirmed wall | Notes |
|---------|----------|------------------|-----------------|-------|
| ov016   | 8        | 8                | 0               | Pure literal-state dispatchers, every callee already SHIP/MATCHED |
| ov010   | 8        | 8                | 0               | CardList/ov005-bridge family, deep pre-existing map-doc naming |
| ov008   | 8        | 0                | 8               | All pre-documented in `ov008_core.h` as prior-attempt walls (permuter-probed) |
| ov003   | 8        | 8                | 0               | Bounded discriminant switches; `func_ov003_021cedf8` dominant sibling callee |
| ov014   | 8        | 8                | 0               | TaskConfig/sprite-anim idiom family; near-clone confirms repeated pattern |
| ov015   | 6        | 6 (3 clean, 3 conditional) | 0     | Includes 1 bonus coincidental-address function (021b2c18 confirmed unrelated to ov010's) |
| ov020   | 5        | 5                | 0               | OV006-pattern hardware init + 2-level state machine (largest: 4196B) |
| ov005   | 8        | 8                | 0               | `func_0201e964` UI-slot-rebuild sink family; 1 map-doc name correction flagged |
| ov009   | 1        | 1 (conditional)  | 0               | Last unexamined ov009 address; 55 BL calls, all named/resolved |
| **TOTAL** | **60** | **52**          | **8**           | |

---

## ov016 Newly Tractable Funcs

### 0x021B296C (288 B, class E, overlay=ov016)

**Original verdict:** not examined (virgin) — map doc proposes `CardSlot_DrawNumber` (HIGH).

**Upgrade reason:** Straight-line arithmetic, zero pool words, 4 named callees (`func_02094504` VRAM DMA, `func_02001d0c` display-config, `func_020054a4` string-measure, `func_02004f58` blit). The `0x6600000` CardScroll VRAM-band constant matches the identical formula in `Ov017_DrawCardCount` (`Ov017Ov019Retriage.md`). Bounded 2-row tile-fill loop, no scheduling entropy.

**Struct/data needed:** `data_02102c90` (documented `GlobalData02102c7c` cluster member, passed opaque to `func_02001d0c`).

**Ground-truth pool words (verbatim):**

```
data_02102c90   ; _LIT0 — GlobalData02102c7c cluster member
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_02094504
func_02001d0c
func_020054a4
func_02004f58
func_02094504   (x2 total)
func_02094550   (x2, two-row tile-fill loop)
```

**Recipe sketch:**

```c
void func_ov016_021b296c(int panelIdx, void *cellDst, int val, int count) {
    int mid = count / 4;
    func_02094504(0, cellDst, count);
    int div12 = mid / 8;
    func_02001d0c(data_02102c90, div12, 2);
    int measured = func_020054a4(val, 0xc);
    void *base = (void*)((panelIdx << 7) + 0x6600000);
    func_02094504(0, base, 0x400);
    /* bounded 2-row func_02094550 tile-fill loop follows */
}
```

---

### 0x021B2D4C (544 B, class F, overlay=ov016)

**Original verdict:** not examined (virgin) — map doc proposes `CardList_DrawPage` (HIGH).

**Upgrade reason:** Clean 3-way branch on `[r6+4]` (Task-dispatch pattern). Every callee is an already-SHIP/MATCHED ov016 sibling: `func_ov016_021b5dd0`(HandleTouch), `_287c`/`_28f4`(HitTest A/B), `_3498`(DrawCellLayerMain), `_39e4`(UpdatePageLabel), `_2a8c`(DrawSprites), `_423c`(CardDetail_DrawAll, also this round's target), `_6350`(RenderListOverlay). Pool words are 10-byte "HitRect" record clusters already catalogued in `OverlayDataGlobs.md`.

**Struct/data needed:** `data_ov016_021b9000`/`_900a`/`_9014` (10-byte HitRect records, extending known `+0xc`/`+0x16` u16 fields), `data_ov016_021bac38` (state-gate, `+0x8`).

**Ground-truth pool words (verbatim):**

```
data_ov016_021bac38   ; state-gate struct (+0x8 tested)
data_ov016_021b9000   ; 10-byte record #1
data_ov016_021b900a   ; 10-byte record #2
data_ov016_021b9014   ; 10-byte record #3
data_ov016_021babec   ; SubsysB struct
data_ov016_021bac64   ; arg to func_ov016_021b6350
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_ov016_021b5dd0   func_ov016_021b287c   func_ov016_021b3498
func_ov016_021b287c   func_ov016_021b39e4   func_ov016_021b3498
func_ov016_021b2a8c   func_ov016_021b287c   func_ov016_021b39e4
func_ov016_021b3498   func_ov016_021b2a8c   func_020061ac
func_ov016_021b3498   func_ov016_021b2a8c   func_ov016_021b423c
func_ov016_021b6350
```

**Recipe sketch:**

```c
int func_ov016_021b2d4c(CardListCtrl *self) {
    if (data_ov016_021bac38.f8 != 0) func_ov016_021b5dd0();
    switch (self->f_4) {
    case 0: /* 3 hit-test+draw pairs on _9000/_900a/_9014, touch-A gate, final draw */ break;
    case 1: func_ov016_021b423c(&data_ov016_021babec); break;
    case 2: func_ov016_021b6350(&data_ov016_021bac64); break;
    }
    return 1;
}
```

---

### 0x021B2F6C (520 B, class F, overlay=ov016)

**Original verdict:** not examined (virgin) — map doc proposes `SubsysA_PollResult` (HIGH).

**Upgrade reason:** Two-branch top-level structure on `[data_ov016_021b9740+8]` (poll-scroll vs state-machine on `[r6]` 0/1/2). MASTER_BRIGHT fade ramp identical to `Ov017_MainCtrlStateMachine` (`Ov017Ov019Retriage.md`). Every callee named/SHIP.

**Struct/data needed:** `data_ov016_021b9740` (step-counter, extends `+0x8`/`+0x10`), caller controller `+0x98`/`+0x8` (fade counter, matches `Ov017_MainCtrlStateMachine` shape).

**Ground-truth pool words (verbatim):**

```
data_ov016_021b9740   data_02104f4c   data_ov016_021bac64
0x0400006c   0x0400106c   0x000006b3
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_ov016_021b5a6c   func_ov016_021b5a28   func_ov016_021b700c
func_02009494   func_02037208   func_0208c884   func_0208c884
func_ov016_021b3174   func_0202c0c0   func_ov016_021b5544
func_0208c884   func_0208c884
```

**Recipe sketch:**

```c
int func_ov016_021b2f6c(CardListCtrl *self) {
    if (data_ov016_021b9740.f8 != 0) { /* scroll-poll branch, MASTER_BRIGHT fade */ }
    switch (self->f0) {
    case 0: /* fade-in counter to 0x10, DISPCNT priority */ break;
    case 1: if (func_ov016_021b3174()) { /* transition */ } break;
    case 2: /* fade-out counter */ break;
    }
    return 0;
}
```

---

### 0x021B3174 (380 B, class F, overlay=ov016)

**Original verdict:** not examined (virgin) — map doc proposes `CardList_InputHandler` (HIGH).

**Upgrade reason:** 3-way state dispatch on `[r4+4]`. State-0 branch reads `data_02104bac+0x52`/`+0x54` (extends documented `GlobalData02104bac.md` flags field). All 10 callees already SHIP/MATCHED ov016 siblings; `func_02037208` toast uses the documented "id-1" literal-arithmetic idiom.

**Struct/data needed:** `data_02104bac` (extends `+0x54` flags with sibling `+0x52` gate field).

**Ground-truth pool words (verbatim):**

```
data_02104bac         data_ov016_021b9000   data_ov016_021b900a
data_ov016_021b9014   data_ov016_021babec   data_ov016_021bac64
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_ov016_021b39e4   func_02037208   func_ov016_021b32f0 (x2)
func_ov016_021b28f4   func_ov016_021b32f0 (x2)   func_ov016_021b28f4
func_ov016_021b32f0   func_ov016_021b47c8   func_ov016_021b4204
func_ov016_021b35dc   func_ov016_021b3650   func_ov016_021b6688
func_ov016_021b6324   func_ov016_021b35dc   func_ov016_021b3650
```

**Recipe sketch:**

```c
int func_ov016_021b3174(CardListCtrl *self) {
    switch (self->f_4) {
    case 0: {
        u16 count = data_02104bac.f52;
        if (count != 0) { /* bitmask dispatch on +0x54, page-turn calls */ }
        else { /* touch hit-test loop over 3 HitRect records */ }
        break;
    }
    case 1: /* release handle + clear + render */ break;
    case 2: /* reset scroll + clear + render */ break;
    }
    return 0;
}
```

---

### 0x021B32F0 (424 B, class F, overlay=ov016)

**Original verdict:** not examined (virgin) — map doc proposes `CardList_PageTurn` (HIGH).

**Upgrade reason:** Clean 3-way dispatch on `r1` (0/1/2). DISPCNT BG-mode-field bic/orr pack idiom (documented `Ov017Ov019Retriage.md` pattern) repeated with different literal nibbles. All callees named/SHIP.

**Struct/data needed:** `data_ov016_021b9740+0x8c` (new gate field, case-2 branch).

**Ground-truth pool words (verbatim):**

```
0x04001000   data_ov016_021babec   data_ov016_021b9740
data_ov016_021bac64   0x000006b5   data_ov016_021bac38
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_02037208   func_02037208   func_ov016_021b35dc   func_ov016_021b3b14
func_ov016_021b61dc   func_ov016_021b35dc   func_ov016_021b61dc
func_02037208   func_0202c0c0   func_ov016_021b5544   func_02037208
```

**Recipe sketch:**

```c
int func_ov016_021b32f0(CardListCtrl *self, int mode) {
    switch (mode) {
    case 0: func_02037208(0x42-0x43,0,1); return 1;
    case 1: /* clear+init, DISPCNT pack */ return 0;
    case 2: /* gated on +0x8c, subsys init or fallback text */ return 0;
    }
    return 0;
}
```

---

### 0x021B3A78 (156 B, class E, overlay=ov016)

**Original verdict:** not examined (virgin) — map doc proposes `CardList_GenDigitBitfields` (MED).

**Upgrade reason:** Bounded 12-iteration loop, exactly 2 callees (`func_020b3814`/`func_020b3808`, main-module 64-bit divmod primitives, already KB-documented as un-C-matchable *callees* — but that classification is about those callees' own bodies, not this caller, which only sees a clean `bl`/return ABI). Decimal-digit extraction, deterministic bounded pattern.

**Struct/data needed:** none — pure register-level arithmetic loop.

**Ground-truth pool words (verbatim):**

```
none
```

**Ground-truth BL targets (verbatim, x12 loop iterations each):**

```
func_020b3814   (x12)
func_020b3808   (x12)
```

**Recipe sketch:**

```c
void func_ov016_021b3a78(u16 *out, u32 lo, u32 hi) {
    for (int i = 0; i < 0xc; i++) {
        u32 rem = func_020b3814(lo, hi, 0xa, 0);
        /* accumulate into fixed-point word */
        u64 q = func_020b3808(lo, hi, 0xa, 0);
        lo = (u32)q; hi = (u32)(q >> 32);
    }
}
```

---

### 0x021B423C (1420 B, class F, overlay=ov016)

**Original verdict:** F — "588-byte body, 34 calls, dense stat-panel rendering" (plausible terse phrase for size/call-count).

**Upgrade reason:** `CardDetail_DrawAll`. All 34 `bl` targets already SHIP/MATCHED (`_5154` DrawCellPackedSub x4, `_5188` DrawDigits x2, `_287c` HitTest x8, `_3498` DrawCellLayerMain x8, paired 1:1). `data_02104f4c+4` 3-bit language-ID idiom confirmed. Packed-attribute-word builder (orr chains) is deterministic enumeration, not entropy.

**Struct/data needed:** `data_02104bac+0x52` (reused bitmask field, cross-confirms `021b3174`), `data_ov016_021b8df8` (5-halfword coord struct), `data_ov016_021b9184` cluster (HitRect family), `data_ov016_021bab44` (audio/sprite config table).

**Ground-truth pool words (verbatim, in order):**

```
data_ov016_021bac38   data_02104bac   0x80000083   data_ov016_021b8df8
data_ov016_021b9184   data_ov016_021bab44   data_ov016_021b918e
data_ov016_021b9198   data_02104f4c   data_ov016_021b91a2
data_ov016_021b91ac   0x000042b8   0x000042ba   0x000042bb
0x000042a8   0x00600100   0x05000696
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_ov016_021b5154 (x4)   func_ov016_021b5188 (x2)   func_02005dac
func_020944a4   func_ov016_021b287c   func_ov016_021b3498  (x5 paired iterations)
func_020061ac   func_ov016_021b5390   func_ov016_021b5414
func_02005dac (x6)   func_020944a4 (x6)   func_ov016_021b5424
```

**Recipe sketch:**

```c
int func_ov016_021b423c(CardDetailCtrl *self) {
    if (self->f_0 != 1) return 0;
    func_ov016_021b5154(&data_ov016_021bac38, 0x2d, 0, -1, 0xd);
    /* 4 packed-attribute sprite draws, 2 digit draws */
    /* 5 stat-icon rows: hit-test + draw pairs */
    /* touch-A gated blend-word build (up to 4 calls) */
    func_ov016_021b5424(self, 5, self->word3, 0x600100, 0x5000696);
    return 1;
}
```

---

### 0x021B47C8 (1100 B, class F, overlay=ov016)

**Original verdict:** F — "1100-byte state machine, 27 calls, nested sub-state branching."

**Upgrade reason:** `CardDetail_StateMachine`. Top-level 3-way dispatch on `[r4]` (0/1/2). `func_02052ecc`/`func_0205307c` are documented main-module functions with pinned dual-register-return conventions. State-1's 8-clause bitmask sub-dispatch on `data_02104bac+0x54` is a bounded literal-field-write pattern, not entropy.

**Struct/data needed:** `data_ov014_021b8e04` (16-byte literal block), `data_02105b70` (main-module class-B struct arg), self `+0x14`/`+0x18`/`+0x1c`/`+0x20` (saturating counters).

**Ground-truth pool words (verbatim, in order):**

```
data_ov016_021b8e04   data_ov016_021bab44   0x04001000
data_02105b70   0x00000678   data_ov016_021bac38
0x000006bd   data_02104bac   data_ov016_021b9184
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_ov016_021b398c   func_02052ecc   func_0202c0c0   func_ov016_021b5544
func_0205307c   func_0202c0c0   func_ov016_021b5544   func_02037208
func_ov016_021b5390   func_ov016_021b5414   func_ov016_021b4c14 (x4)
func_02037208 (x4)   func_ov016_021b5284   func_ov016_021b28f4
func_ov016_021b5244   func_ov016_021b5390   func_ov016_021b5414
```

**Recipe sketch:**

```c
int func_ov016_021b47c8(CardDetailCtrl *self) {
    switch (self->f_0) {
    case 0: /* rebuild main obj, DISPCNT pack, dual-register-return gate */ return 0;
    case 1: /* 8-clause data_02104bac.f54 bitmask sub-dispatch, or touch-poll */ return 0;
    case 2: return 1;
    }
    return 0;
}
```

---

## ov010 Newly Tractable Funcs

### 0x021B2C18 (416 B, class F, overlay=ov010)

**Original verdict:** not examined (virgin) — map doc proposes `Ov010_FillTilemapStrip` (HIGH).

**Upgrade reason:** Sole sub-call `func_ov010_021b2b08` is byte-verified as the `Ov010_GetVramBankBase` 8-way dispatcher (`Ov008Ov010Retriage.md`). 4-way outer switch picks a sound-load literal; bounded inner width-search loop over a fixed candidate set. Tail-calls byte-verified `Ov010_WriteTilemapRow`. Zero indirect calls.

**Struct/data needed:** `data_02102c90` (display-config), `data_02104f4c` (`+4` language extract), caller struct `+4`/`+6` (row/dim s16).

**Ground-truth pool words (verbatim):**

```
0x0000028b   ; sound-effect ID (default/mode-0/mode-3 arms)
data_02102c90   data_02104f4c
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_ov010_021b2b08   func_0202c0c0   func_020054a4   func_02001d0c
func_02001d68   func_02001c98   func_02005088   func_ov010_021b35e4
```

**Recipe sketch:**

```c
int Ov010_FillTilemapStrip(int mode, void *arg1, StripDims *dims, int bankIdx) {
    void *vramBase = Ov010_GetVramBankBase(bankIdx);
    /* 4-way sound-load switch, bounded width-search loop, font-config, blit */
    return Ov010_WriteTilemapRow(mode, arg1, dims, 0);
}
```

---

### 0x021B3A1C (540 B, class F, overlay=ov010)

**Original verdict:** not examined (virgin) — map doc proposes `Ov010_Init` (HIGH).

**Upgrade reason:** Textbook OV006 full-init family (`func_02094504` with documented `OverlayConstants.md` literals, `func_0208da2c(1)`, `func_0208d8c0`/`_d7ac` BG-layer family). DISPCNT bic/orr pack idiom seen 6+ times elsewhere. 3-way mode dispatch tail-calls named `Ov010_InitMode1Display`/`Ov010_InitMode2Display` siblings.

**Struct/data needed:** `data_ov010_021b8d44` (Fill32 dest), `data_02104f1c` (`+0x1c` source), `data_ov010_021b8d08` (mode/language/singleton fields).

**Ground-truth pool words (verbatim, in order):**

```
data_ov010_021b8d44   data_02104f1c   data_ov010_021b8d08   0x1ff
0x4000304   0x4000008   0x238c   0xffcfffef   0xffbfff9f
data_ov010_021b8d48   data_ov010_021b8d18   data_ov010_021b8d64
data_02104f4c   data_ov010_021b8d08
```

**Ground-truth BL targets (verbatim, in call order):**

```
Fill32   func_0207deb0   func_0200592c   func_0208d1e4   func_02094504 (x3)
func_0208cc90   func_0208da2c   func_0208d1e4 (x2)   func_0208d8c0
func_0208d7ac   func_0208c8cc   func_02005bfc   func_0207f420
func_0207f138   func_0207e8b8   func_02001a34   func_0202adf8
func_0202ae1c   func_0202c93c   func_ov010_021b534c   func_ov010_021b72c0
func_ov010_021b2bf8
```

**Recipe sketch:**

```c
int Ov010_Init(int mode) {
    Fill32(0, data_ov010_021b8d44, 0x70);
    /* OV006-family VRAM/DISPCNT init sequence */
    switch (mode) { case 1: Ov010_InitMode1Display(); break; case 2: Ov010_InitMode2Display(); break; }
    Ov010_InitDisplayBanks();
    return 1;
}
```

---

### 0x021B4320 (856 B, class F, overlay=ov010)

**Original verdict:** not examined (virgin) — map doc proposes `Ov010_InitManagerBPanel` (HIGH).

**Upgrade reason:** All callees named ov010/ov005 siblings with known signatures. 20-entry sentinel-fill loop + 2 nested table-index loops, all deterministic table-index writers, not scheduling entropy.

**Struct/data needed:** `data_ov010_021b91b4` (`+0x128`), `data_ov010_021b9260` (row/col dims `+0x4`/`+0x6`, extends known `+0x8`/`+0xc`), `data_ov010_021b93d0` (halfword-pair table).

**Ground-truth pool words (verbatim):**

```
data_ov010_021b91b4   data_ov010_021b9260   data_ov010_021b93d0
data_02102c90   data_02104f4c
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_ov005_021ab3b4   Vram_GetBankBaseCD   func_ov010_021b476c
func_ov010_021b4194   Task_PostLocked   func_ov010_021b421c
func_02001d0c   func_02001d68   func_02004fb8 (x2)   func_02001e40 (x2)
Task_InvokeLocked   Task_PostLocked   Fill32   func_02001d0c (x2)
func_02001c98   func_02005210 (x2)   func_02001e40 (x2)   Fill32   Copy32
func_ov010_021b2ddc   func_0208e200   Task_InvokeLocked
func_ov010_021b2450 (x2)   func_ov010_021b23f4
```

**Recipe sketch:**

```c
void Ov010_InitManagerBPanel(void *self, int *outHandle) {
    int idx = func_ov005_021ab3b4(data_ov010_021b91b4.f128, self);
    /* bind slot, build glyph entries, measure/layout labels, fill+copy VRAM */
    Ov010_ScrollSetValue(0);
}
```

---

### 0x021B4884 (604 B, class F, overlay=ov010)

**Original verdict:** not examined (virgin) — map doc proposes `Ov010_RenderManagerBList` (HIGH).

**Upgrade reason:** `func_ov005_021abb00` has a full matched-shape reconstruction in c-match-prep. `func_ov010_021b2630` byte-verified. Every branch is a deterministic field-compare, no indirect calls in the body.

**Struct/data needed:** `data_ov010_021b91b4` (`+0x12c`/`+0xd8`/`+0x18`/`+0x220`/`+0x2c`/`+0x80` nested handle struct).

**Ground-truth pool words (verbatim):**

```
data_ov010_021b91b4   data_ov010_021b9260   data_ov010_021b9270
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_ov005_021abb00   func_ov010_021b2630   func_ov010_021b238c
func_ov005_021ac9c8   func_020b3870   func_ov010_021b23f4 (x2)
func_ov005_021abc68   func_ov005_021abe5c   func_ov005_021ac91c
func_ov005_021ab858   func_ov005_021abc74   func_ov010_021b23f4
func_ov005_021ac984   func_ov005_021ac9d0   func_ov010_021b3a14
func_ov005_021ab108   func_ov010_021b3734   func_ov010_021b3774
```

**Recipe sketch:**

```c
int Ov010_RenderManagerBList(void *panel) {
    int idx = CardList_WriteScrollMMIO(data_ov010_021b91b4.f12c);
    /* scroll-drag / dimension-set / clamp-selection cascade */
    return total;
}
```

---

### 0x021B4AE0 (636 B, class F, overlay=ov010)

**Original verdict:** not examined (virgin) — map doc proposes `Ov010_HandleInputManagerB` (HIGH).

**Upgrade reason:** Every branch is a deterministic bitfield gate on `data_02104bac+0x54`/`+0x56` (extends documented flags field with 6 sibling bit tests). Each of 6 mutually-exclusive arms dispatches to a named ov005/ov010 callee.

**Struct/data needed:** `data_ov010_021b91b4` (`+0x198`/`+0xb0`/`+0xe0`/`+0x220` etc.), `data_02104bac` (extends `+0x56`).

**Ground-truth pool words (verbatim):**

```
data_ov010_021b91b4   data_ov010_021b9260   data_02104bac
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_ov005_021ac9d0   func_ov010_021b3998   func_ov005_021ab108
func_ov010_021b39c0   func_ov005_021ab260   func_ov005_021ab384
func_ov010_021b4090   func_ov005_021ac984   func_ov010_021b39c0
func_ov005_021ab260   func_ov005_021ab384   func_ov010_021b4090
func_ov005_021ab318   func_ov005_021ac984   func_ov005_021ac9d0
func_ov010_021b3a14   func_ov005_021ac9dc   func_ov005_021ac9c8
func_ov010_021b23f4   func_ov010_021b3a14   func_02037208
```

**Recipe sketch:**

```c
int Ov010_HandleInputManagerB(void) {
    if (data_ov010_021b91b4.f198 == 1 && ...) return data_ov010_021b91b4.fb0;
    /* 6-arm bitmask dispatch on data_02104bac.f56, each a named callee */
    func_02037208(0x38, 0x38 - 0x39, 0, 1);
    return data_ov010_021b91b4.fb0;
}
```

---

### 0x021B4D58 (276 B, class E, overlay=ov010)

**Original verdict:** not examined (virgin) — map doc proposes `Ov010_UpdateScrollWindowB` (HIGH).

**Upgrade reason:** All callees byte-verified or matched. MMIO pack shape matches `CardList_WriteScrollMMIO`'s documented `0x01ff0000` mask. Bounded 20-iteration cache-scan, deterministic.

**Struct/data needed:** `data_ov010_021b93d0` (`+0x48`/`+0x4a` scroll-pos cache), `data_ov010_021b91b4` (20-slot row-cache array).

**Ground-truth pool words (verbatim):**

```
data_ov010_021b93d0   0x01ff0000   0x04001010
data_ov010_021b91b4   data_ov010_021b9260
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_ov010_021b24f4   func_ov010_021b2630   func_ov010_021b238c (x2)
Vram_GetBankBaseCD   Copy32
```

**Recipe sketch:**

```c
int Ov010_UpdateScrollWindowB(void *panel) {
    short pos = data_ov010_021b93d0.f48 - 0x24;
    int count = 0;
    if (Ov010_ScrollRangeNonEmpty(...)) count += Ov010_HitTestSprites(...);
    /* bounded 20-slot cache-miss VRAM copy loop */
    return count;
}
```

---

### 0x021B5168 (484 B, class F, overlay=ov010)

**Original verdict:** not examined (virgin) — map doc proposes `Ov010_AnimScrollBarBB` (MED, twin of 021b4fdc).

**Upgrade reason:** Independently confirmed byte-for-byte via historical dossier `docs/research/dossiers/021b4fdc.md` — its "GROUND TRUTH" pool words are verbatim identical to this file (that dossier's prose header is mislabeled as ov019; a content/filename mismatch, flagged for a future fix — the ground-truth table is authoritative for THIS ov010 address).

**Struct/data needed:** `data_ov010_021b91b4` (`+0x8`/`+0xc` clamp fields), `data_ov010_021b9260` (`+0xb4` running total).

**Ground-truth pool words (verbatim):**

```
data_ov010_021b91b4   data_ov010_021b9260   0x04001008   0x0400000a
data_ov010_021b8d44   0x0400104c   0x0400004d
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_020b3870 (x2)   func_0208e318 (x2)
```

**Recipe sketch:**

```c
int Ov010_AnimScrollBarBB(int arg0) {
    int cur = data_ov010_021b9260.fb4 - arg0;
    int barLen = func_020b3870(a * 0x10 - a, b);
    int barPos = func_020b3870(a << 4, b);
    func_0208e318(0x11, 8, remLen, barPos, 0x04001008 + 0x48);
    func_0208e318(6, 8, remLen, barPos, 0x0400000a + 0x46);
    return 0;
}
```

---

### 0x021B534C (1356 B, class F, overlay=ov010) — largest in ov010 batch

**Original verdict:** not examined (virgin) — map doc proposes `Ov010_InitMode1Display` (HIGH).

**Upgrade reason:** Despite size (largest in this sub-batch), every construct is a catalogued idiom: OV006-family VRAM/DISPCNT init, 4-halfword bitfield pack (same shape as `021b3a1c`'s `data_ov010_021b8d08` pack), 16-entry struct-copy loop, two 40-iteration data-driven glyph-table build loops (all named callees, deterministic per-iteration literal arithmetic), ov005 CardList_* setup tail.

**Struct/data needed:** `data_ov010_021b8c2c` (4-halfword bitfield pack, extends 0xa4-byte zeroed block), `data_ov010_021b88c0` (16-entry table), `data_ov010_021b91c0` (40-entry int array), `data_ov000_021b1ddc`/`_1db4` (cross-overlay shared config).

**Ground-truth pool words (verbatim, in order):**

```
0x04001000   data_ov010_021b9260   0x07000400   0x05000400   0x04001008
0x05000420   0x000003ff   0x050005c0   0x00007c1f   data_ov010_021b88c0
data_0210249c   0xffcfffef   data_ov010_021b8c2c   data_ov000_021b1ddc
data_ov000_021b1db4   data_ov010_021b8870   data_020c3f54   data_02104f4c
data_ov010_021b91c0   func_ov010_021b476c   func_ov010_021b46a8   func_ov010_021b4750
```

**Ground-truth BL targets (verbatim, in call order):**

```
Fill32   func_02094504 (x2)   func_0208d138   func_0208d0bc   func_0208d030
func_02001bc8 (x2)   func_0208f368   func_0208f2a8   func_02005bfc
func_0207f420   func_0207f138   func_ov010_021b235c   func_ov010_021b2864 (x2)
func_ov005_021aaf08   func_ov005_021aaf6c   func_0200a488   Copy32 (x2)
func_ov005_021ab0fc   func_ov005_021ab3b4   func_ov005_021ab32c   func_ov005_021ab260
func_ov005_021ab354   func_0202c0c0   func_020a6a00   Task_PostLocked
Fill32   func_ov010_021b4194   Task_PostLocked (x2)   Fill32 (x2)
func_0202c0c0   func_020a6afc   func_ov010_021b421c   func_ov005_021ab3e8
func_ov005_021acacc   func_ov005_021acad4
```

**Recipe sketch:**

```c
void Ov010_InitMode1Display(void *self, void **outHandle) {
    /* OV006-family init, bitfield pack, 16-entry copy, dual 40-iter glyph
       build loops (accumulator-based), ov005 CardList setup tail */
}
```

---

## ov008 — Confirmed intractable (8/8)

All 8 addresses in this sub-batch turned out to be **already-documented, already-permuter-attempted walls**, not missing-KB territory. `src/overlay008/ov008_core.h` (a project-internal "lessons learned" header, separate from the retriage docs) records a prior C-match attempt with permuter runs and explicit wall verdicts for this exact address neighborhood — "never examined by retriage rounds R4-R7" (true) does not mean "never examined at all." No struct/global/constant needed upgrading any of the 8 — every symbol was already fully resolved before examination; the walls are genuine mwcc-codegen-choice divergences (peephole splitting, reg-alloc pressure, signed-modulo ror-idiom mismatch), not KB gaps.

| Address | Size | Verdict | Root cause (per `ov008_core.h`) |
|---------|------|---------|----------------------------------|
| `0x021AA94C` | 188 B | wall | Dual-tail dispatcher over an already-`.s` neighborhood; loop-carried live registers, no data gap |
| `0x021AAE04` | 280 B | wall | 26-slot bit-test scan with inter-iteration register dependencies — same class R6 doc confirmed wall for a structurally identical scan |
| `0x021ABBF0` | 108 B | wall | "Command-record pack" family (`021aba3c`/`021abb08`/`021abba0`) — 20v20 reg-alloc, explicitly catalogued, shipped whole-function `.s` |
| `0x021AC4D0` | 100 B | wall | "Fixed-point" family (`021ac430`/`021ac4d0`/`021af4c4`) — signed-%8 ror idiom, explicitly named by address in `ov008_core.h` |
| `0x021AC658` | 192 B | wall | Same reg-alloc/scheduling class as `021abbf0`, structurally harder (two nested smull chains) |
| `0x021AC718` | 216 B | wall | Same family as `021ac658`/`021abbf0`; initial stack-marshal call adds no new information |
| `0x021AC7F0` | 356 B | wall | "Large tier, many branch paths + multiple callee-saved live temps" class, already walled for a direct neighbor (`021abcdc`) |
| `0x021ACEAC` | 128 B | wall | "Byte-combine builders" family (`021acfa0`/`021ac208`/`021aceac`/`021adbbc`) — peephole `(hw<<24)>>24 → and #0xff` divergence, 900s/~7k-iteration permuter run already failed on the sibling `021acfa0` |

**Recommendation:** cross-check `ov008_core.h` (and any sibling per-overlay `_core.h` files) for prior-attempt records before allocating future ov008 addresses to a re-triage wave — it covers a materially larger fraction of ov008's E/F pool than `Ov008Ov010Retriage.md` (R6) alone suggests.

---

## ov003 Newly Tractable Funcs

All 8 addresses already carry HIGH-confidence proposed names in `docs/research/map/_names_overlay003.md`/`overlay003.md` (status="SHIP", not yet C-matched) — a *very* different result from `SmallOverlaysRetriage.md`'s R6 finding (2/20 tractable, both trivial no-ops): this R8 batch targets the module's named, high-confidence hub functions (state machines, dispatchers, draw pipeline), not the anonymous residue R6 swept. All 8 resolve to bounded discriminant dispatches (`Ov017Ov019Retriage.md` "addls pc,pc" pattern), not scheduling-entropy walls.

### 0x021CBB78 (636 B, class E/F, overlay=ov003)

**Original verdict:** not examined (virgin) — `Ov003_FreeCardSlots`.

**Upgrade reason:** Pure straight-line teardown: sequentially tests fixed-offset alloc pointers and frees each via `func_0201ef3c` if nonzero, then a 2×5 nested bounded loop frees per-slot pointers. Single invariant callee, no fn-ptr dispatch.

**Struct/data needed:** base struct three "single alloc" families (`+0xc4`/`+0xe4`/`+0x11c` live-flags) + stride-`0x6c`/`0x40`/`0x1b8` nested arrays.

**Ground-truth pool words (verbatim):**

```
none
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_0201ef3c (x9 — one per guarded free site)
```

**Recipe sketch:**

```c
void Ov003_FreeCardSlots(Ov003Scene *sl) {
    if (sl->slotA_c4) func_0201ef3c(sl->slotA_b8, &sl->tmpA0, &sl->tmpA1);
    if (sl->slotB_e4) func_0201ef3c(sl->slotB_cc, &sl->tmpB0, &sl->tmpB1);
    if (sl->slotC_11c) func_0201ef3c(sl->slotC_ec, &sl->tmpC0, &sl->tmpC1);
    /* 2x5 nested-array free loop, final single free at sl+0x30 */
}
```

---

### 0x021CC0D8 (2016 B, class F, overlay=ov003)

**Original verdict:** F — "16-state machine, ~40 calls, dense branchy dispatch."

**Upgrade reason:** `Ov003_DuelPhaseStep` — a 17-way bounded, range-checked discriminant switch over `sl->field_4`. Every case block is deterministic straight-line code: MMIO BLDCNT/BLDALPHA packing, `TaskConfig` build via the documented task-creation convention, `÷3` magic-divide (`0x55555556`, documented). No indirect calls anywhere across all 16 blocks.

**Struct/data needed:** `data_ov003_021cf6c0` (scene-context singleton, `+0x44`/`+0x48`/`+0x4c`/`+0x50`/`+0x54`), `data_02104c40` (new selector array), `data_021040ac` (`GlobalAudioState`, `+0xc3c`/`+0xc48`).

**Ground-truth pool words (verbatim):**

```
0x000001ff   0x04000014   0x04001018   data_021040ac
data_ov003_021cf370   data_02104c40   0x55555556
0x0400006c   0x0400106c
```

**Ground-truth BL targets (verbatim, across 16 case blocks):**

```
func_0201d47c   func_02006c0c   func_0201e5b8 (x2)   Task_Invoke
func_ov003_021cc8b8   func_02037208   func_02034784 (x4)   func_02034888 (x2)
func_020a991c (x2)   func_0207fce8 (x5)   func_ov003_021cca88
func_ov003_021cef78   func_0208c884 (x4)
```

**Recipe sketch:**

```c
int Ov003_DuelPhaseStep(Ov003Scene *r5) {
    switch (r5->phase) {
    case 1: /* BLDCNT/BLDALPHA setup */ break;
    case 2: /* audio result branch, spawn TaskConfig tasks */ break;
    case 4: if (Ov003_PollCardSelection(r5)) { r5->phase = 4; } break;
    case 0xb: if (Ov003_PollConfirmButton(r5)) { Ov003_QueueButtonEvent(...); r5->phase = 0xc; } break;
    case 0xf: /* MASTER_BRIGHT fade ramp, both engines */ break;
    /* remaining cases: bounded counters/gates, all deterministic */
    }
    return 0;
}
```

---

### 0x021CC8B8 (464 B, class E/F, overlay=ov003)

**Original verdict:** not examined (virgin) — `Ov003_PollCardSelection`.

**Upgrade reason:** Straight-line polling logic with a deterministic 4-way test on `data_02104bac`'s halfword flag bits (extends documented struct with `+0x52/+0x54/+0x56`) and a bounded touch-dispatch (two 3-iteration hit-test loops, both already MATCHED).

**Struct/data needed:** `data_02104bac` (extended), `data_021040ac` (`+0xc3c`), `data_02104cec` (new selector-index array), `data_ov003_021cf1b8` (hit-test rect array, stride 6).

**Ground-truth pool words (verbatim):**

```
data_021040ac   data_02104cec   data_ov003_021cf6c0   data_02104bac
data_ov003_021cf1b8
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_02034844   func_02034784   func_020061ac
func_ov003_021cefec (loop, ≤3 iters)   func_ov003_021cf064 (loop, ≤3 iters)
func_02037208 (x2)
```

**Recipe sketch:**

```c
int Ov003_PollCardSelection(Ov003Player *r5) {
    if (data_02104cec[data_021040ac[0xc3c]] == 1) { /* active check, write result */ return 1; }
    if (func_02034784() == 2) { /* counter-to-0x258 gate */ return 0; }
    /* data_02104bac 4-way flag dispatch, then touch hit-test loop */
    return 0;
}
```

---

### 0x021CCA88 (664 B, class E/F, overlay=ov003)

**Original verdict:** not examined (virgin) — `Ov003_PollConfirmButton`, sibling of `021cc8b8`.

**Upgrade reason:** Same 5 globals as `021cc8b8`, extended with `func_ov003_021cef78`=`Ov003_QueueButtonEvent` (already MATCHED). Same 4-way flag dispatch, touch-dispatch pair confirms `data_ov003_021cf1b8` array holds ≥6 rects.

**Struct/data needed:** Same as `021cc8b8`, plus `data_ov003_021cf6c0+0x50`/`+0x58`/`+0x4c` (new fields).

**Ground-truth pool words (verbatim):**

```
data_ov003_021cf6c0   data_02104cec   data_021040ac   data_02104bac
data_ov003_021cf1b8
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_020a991c   func_ov003_021cef78 (x3)   func_02037208 (x5)
func_02034784   func_020061ac
func_ov003_021cefec (loop, ≤2 iters)   func_ov003_021cf064 (loop, ≤2 iters)
```

**Recipe sketch:**

```c
int Ov003_PollConfirmButton(Ov003Player *r6) {
    int sel = data_02104cec[data_021040ac[0xc3c] ^ flag];
    if (sel == 1) { /* parity/timeout confirm-index compute */ return (r6->cnt_c >= 0x20); }
    if (sel == 2) { /* secondary flag gate */ return g4->f58 != 0; }
    /* fallback: counter gate, flag dispatch, touch hit-test pair */
    return 0;
}
```

---

### 0x021CCEA4 (1204 B, class F, overlay=ov003)

**Original verdict:** F — "large fn, ~50 calls, dense stream-push pattern."

**Upgrade reason:** `Ov003_PushColourStreams` — a repeated 4-call block macro for each of 5 colour-band groups (27 sequential stream-descriptor globals, stride 0x20). Group-selector extracted via a fixed 5×5-bit packed-bitfield sequence off `data_02104c68`. Every BL target is named/fixed.

**Struct/data needed:** `data_02104c68` (packed 5-field selector table, new), `data_021040ac` (`+0xc3c`/`+0xba8`), `data_02104f4c` (`+0xa64`), 27 stream-descriptor globals.

**Ground-truth pool words (verbatim, in order):**

```
data_021040ac   data_ov003_021cf388   data_ov003_021cf3a8   data_ov003_021cf3c8
data_ov003_021cf3e8   data_ov003_021cf408   data_ov003_021cf428   data_ov003_021cf448
data_ov003_021cf468   data_ov003_021cf488   data_ov003_021cf4a8   data_ov003_021cf4c8
data_ov003_021cf4e8   data_ov003_021cf508   data_ov003_021cf528   data_ov003_021cf548
data_ov003_021cf568   data_ov003_021cf588   data_ov003_021cf5a0   data_ov003_021cf5b8
data_ov003_021cf5d0   data_02104f4c   data_ov003_021cf5e8   data_ov003_021cf600
data_ov003_021cf618   data_ov003_021cf630   data_ov003_021cf648   data_ov003_021cf660
data_ov003_021cf678   data_ov003_021cf690   data_02104c68
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_0201e7e0   func_02091554 (x4, x5 groups = x20)   func_ov003_021cd358 (x5)
func_ov003_021cce58
```

**Recipe sketch:**

```c
void Ov003_PushColourStreams(Ov003Player *r6, int arg1) {
    int idx = data_021040ac[0xc3c] ^ arg1;
    int sel = data_02104c68[idx];
    /* 5 groups of 4-stream push + Ov003_SubmitSlotStream(group), gated by
       consecutive 5-bit fields of gbase; final dispatch on CheckTransitionReady */
}
```

---

### 0x021CD420 (520 B, class E/F, overlay=ov003)

**Original verdict:** not examined (virgin) — `Ov003_DrawCardFace`.

**Upgrade reason:** Cleanest of the batch — pure call-macro-expansion of a single sibling function (`Ov003_DrawSlotLayer`, target below). Every branch target is that one callee (repeated with different literal args) or `Ov003_CheckTransitionReady`.

**Struct/data needed:** `data_02104c68` (cross-confirms `021ccea4`'s selector table), `data_021040ac`, `data_02104f4c`.

**Ground-truth pool words (verbatim):**

```
data_021040ac   data_02104c68   data_02104f4c
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_ov003_021cd628 (x6, varying literal args)   func_ov003_021cce58
```

**Recipe sketch:**

```c
void Ov003_DrawCardFace(Ov003Player *r6, int arg1) {
    int sel = data_02104c68[data_021040ac[0xc3c] ^ arg1];
    if (sel != 0) {
        Ov003_DrawSlotLayer(r6, arg1, 0, 0, 3);
        Ov003_DrawSlotLayer(r6, arg1, 1, 3, 4);
        Ov003_DrawSlotLayer(r6, arg1, 1, 0, 3);
        if (Ov003_CheckTransitionReady(r6, sel)) Ov003_DrawSlotLayer(r6, arg1, 4, 3, 3);
        return;
    }
    /* sel==0: 4 fixed draws + 2 conditional bitfield-gated draws */
}
```

---

### 0x021CD628 (436 B, class E/F, overlay=ov003)

**Original verdict:** not examined (virgin) — `Ov003_DrawSlotLayer`, leaf callee of `021cd420`/`021ccea4`.

**Upgrade reason:** `lr==0x4b` threshold check against `data_02104f4c+0x928` matches `Ov003_CheckTransitionReady`'s own matched `.c` body byte-for-byte. Clean 6-way bounded switch selects a stride constant; 16-byte literal-block copy; single named tail callee.

**Struct/data needed:** `data_02104c68` (3rd confirmation site), `data_02104f4c+0x928` (confirmed SystemWork-alias, threshold `0x17`), `data_ov003_021cf0f4` (16-byte literal block), `data_021040ac+0x38` (new offset).

**Ground-truth pool words (verbatim):**

```
data_02104c68   data_02104f4c   data_ov003_021cf0f4   data_021040ac
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_0201942c (conditional)   func_0201e964 (unconditional tail)
```

**Recipe sketch:**

```c
void Ov003_DrawSlotLayer(Ov003Player *r6, int arg1, int arg2, int arg3) {
    int lr = data_02104c68[arg1];
    int bonus = (lr == 0x4b && data_02104f4c[0x928/4] >= 0x17) ? 0x20 : 0;
    /* 6-way stride switch, 16-byte literal copy, UV-transform compute */
    func_0201e964(blendMode, finalDest, stride << 7, (arg2+1) << 9, 0, 0, uvB, uvA);
}
```

---

### 0x021CD7DC (3336 B, class F, overlay=ov003) — largest in ov003 batch, 913 lines, read in full

**Original verdict:** F — "massive 913-line state machine, huge call count."

**Upgrade reason:** `Ov003_AnimateBattleLine` — a 10-case discriminant switch. Every case body is a bounded nested loop (outer <2 player × inner <3 slot) calling the single dominant sibling `func_ov003_021cedf8`=`Ov003_SubmitSpriteStream` with per-iteration literal/computed stack args. Two magic-divide constants (`0x88888889` new postshift variant, `0x55555556` ÷3 confirmed cross-reference to `021cc0d8`). Zero fn-ptr indirection despite size — the largest single confirmation of the batch's thesis.

**Struct/data needed:** `data_ov003_021cf6c0` (`+0x44`/`+0x48`/`+0x50`/`+0x54`, cross-confirmed against `021cc8b8`/`021cca88`), battle-line state (`+0x4` phase, `+0x8`/`+0xc`/`+0x10`/`+0x14`/`+0xf4`/`+0xc0`).

**Ground-truth pool words (verbatim, IN ORDER — `_LITn` reused across all 10 cases):**

```
data_021040ac   0x88888889   0x55555556   data_ov003_021cf6c0
```

**Ground-truth BL targets (verbatim, full enumeration across all 10 cases):**

```
func_ov003_021cedf8 (x6, case 0)   func_020a991c   func_ov003_021cedf8 (x8, case 1)
func_02034784   func_020a991c   func_ov003_021cedf8 (x8, case 2)
func_02034784 (x2)   func_020a991c   func_ov003_021cedf8 (x12, case 3)
func_ov003_021cedf8 (x6, case 4 sub 0)   func_ov003_021cedf8 (x2, case 4 sub 1)
func_02034784   func_ov003_021cedf8 (x2, case 5)
func_0201e7e4   func_ov003_021cedf8 (up to x3, case 6)
func_ov003_021cedf8 (x2 x3, case 7 sub 0/1/2)
func_ov003_021cedf8 (x1, case 8)
```

**Recipe sketch:**

```c
int Ov003_AnimateBattleLine(Ov003BattleLine *r4) {
    switch (r4->phase) {
    case 3: /* countdown-wipe row draw, outer<2 x inner<3 */ break;
    case 4: /* player-parity settle recompute (÷30-ish or ÷3), then draw */ break;
    /* cases 5-9: same "outer<2 x (inner<3 draw + 0-2 extra calls)" template */
    case 9: /* single unconditional draw, no loop */ break;
    }
    return 0;
}
```

---

## ov014 Newly Tractable Funcs

All 8 addresses genuinely virgin to R4-R7, but already examined at the naming/mapping level by a more recent lane (brief-344 clean-C drain + briefs 494/496 campaign-prep) — all appear in `docs/research/map/overlay014.md`/`_names_overlay014.md` with MED-confidence names. None has a `c-match-prep/*.c` draft or matched `.c`; all remain pure `.s` ships, still listed in `ov014_core.h`'s §DEFERRED as un-drained "big render/init builders."

### 0x021B2908 (1508 B, class F, overlay=ov014)

**Original verdict:** F, tract=low — "1508-byte big body, 22 calls, heavy stack marshalling."

**Upgrade reason:** `Ov014_DrawPaneAHUD` — decomposes into 6 near-identical unrolled "hit-test rect N, build OAM block, call `func_0201e964`" blocks against 6 named data bases, followed by a bounded 4-case jump table. `Ov014_HitTestPrimary` is already matched with a reusable signature. "22 calls" reads as scheduling entropy in isolation but decomposes into 6 unrolled blocks + a 4-way dispatch — the same pattern found universally tractable in `Ov017Ov019Retriage.md`.

**Struct/data needed:** new ov014-local `HudIconRect` struct at `data_ov014_021b4d48` (+5 siblings, stride TBD), `data_ov014_021b4bf8` (4×u16 color-blend source), `data_02104f4c` (new field, distinct bit offset from the documented `+0xa64` cluster), `[r4,#0x40]→+0x2c` (stride-8 pointer array).

**Ground-truth pool words (verbatim):**

```
data_ov014_021b4bf8   0x600100   0x5000618   data_ov014_021b4d48
data_02104f4c   data_ov014_021b4d54   data_ov014_021b4d60
data_ov014_021b4d6c   data_ov014_021b4d78   data_ov014_021b4d84
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_ov014_021b3a84   Ov014_HitTestPrimary (x5)   func_0201e964 (x6)
func_020061ac   func_02005dac (x3)   func_020944a4 (x3)
```

**Recipe sketch:**

```c
int Ov014_DrawPaneAHUD(PaneA *r4) {
    /* Ov014_BlendPixels backdrop, then 6x { HitTestPrimary?, func_0201e964 submit } */
    if (r4->field_4 == 0 && !func_020061ac()) { /* 4-way jump-table tail draw */ }
    return 1;
}
```

---

### 0x021B2FB8 (1160 B, class F, overlay=ov014)

**Original verdict:** F, tract=low — "huge render build, 6 loops 39 calls."

**Upgrade reason:** `Ov014_BuildPaneATiles` — 6 near-identical TaskConfig builds (`func_0201d47c`→`func_02006c0c`→`func_0201e5b8`→`Task_Invoke`, same idiom as `Ov017_MainSceneSetupBg`), each differing only in literal template pointer. Two double-nested 5×20 fill loops build OAM tables. Tail-calls `Ov014_RenderPaneBName` (also this batch's target) twice, then DISPCNT-clear pattern matching `021b4810`.

**Struct/data needed:** 6 OBJ/BG template pointers, `data_02102c90` (font/glyph), `data_020b4728` (palette source), `data_ov014_021b4c08` (16-byte literal block).

**Ground-truth pool words (verbatim):**

```
data_ov014_021b4d90   data_02102c90   0x000006a5   data_ov014_021b4da4
data_ov014_021b4dc0   data_020b4728   0x05000460   data_ov014_021b4de0
data_ov014_021b4dfc   data_ov014_021b4e18   data_ov014_021b4c08
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_0201d47c   func_02006c0c   func_0201e5b8   Task_Invoke
func_0208e0a0   func_0208de4c   func_02094504   func_02001d0c
func_0202c0c0   func_02004f58   func_020054a4 (conditional)
func_02004f58 (x2)   func_0208e0a0   func_ov014_021b3938
func_0208e0a0   func_ov014_021b3938
func_0201d47c (x5 more TaskConfig blocks, each with func_02006c0c/func_0201e5b8/Task_Invoke)
func_02094550   func_0201e7e0   func_0201ef90
```

**Recipe sketch:**

```c
void Ov014_BuildPaneATiles(PaneA *r5) {
    Task_Invoke(build_task(&cfg, data_ov014_021b4d90, 0xf, 0x8, ...));
    fill_5x20_table(func_0208e0a0() + 0x42);
    /* text blit + conditional label */
    Ov014_RenderPaneBName(r5, 0);
    Ov014_RenderPaneBName(r5, 1);
    /* 5 more TaskConfig blocks */
    func_0201ef90(r5+0x38, r5+0x3c, r5+0x40, tmp, 1, 1, 0x200, r5+0x44);
    /* DISPCNT clear, both engines */
}
```

---

### 0x021B3568 (564 B, class F, overlay=ov014)

**Original verdict:** F, tract=low — "564-byte state machine, jump tables, many branches."

**Upgrade reason:** `Ov014_UpdateCursorMenu` — top-level 4-way switch on `[r4,#0x4]`, dominant case (state 0) gates on `data_02104bac` d-pad bitmask (same base as `021b379c`). Every leaf resolves to 1 of 4 bounded `func_02037208` dispatches. Fallback hit-tests 6 rects via already-matched `Ov014_HitTestSecondary`.

**Struct/data needed:** `data_02104bac` (`+0x52`/`+0x54` d-pad decode), `data_ov014_021b4d48` (shared with `021b2908`), `data_ov014_0223515c` (third resource-group object).

**Ground-truth pool words (verbatim):**

```
data_02104bac   data_ov014_021b4d48   data_ov014_0223515c
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_ov014_021b379c   func_02037208 (x4)   Ov014_HitTestSecondary (loop, ≤6 iters)
func_ov014_021b379c   func_ov014_021b484c   func_ov014_021b4ac4   func_ov014_021b4810
```

**Recipe sketch:**

```c
int Ov014_UpdateCursorMenu(PaneCtrl *r4) {
    switch (r4->field_4) {
    case 0: /* d-pad bitmask decode, or 6-rect touch fallback */ return 0;
    case 1: if (func_ov014_021b484c(...)) r4->field_4 = 2; func_ov014_021b4ac4(...); return 0;
    case 2: /* teardown check */ return 0;
    }
    return 0;
}
```

---

### 0x021B379C (412 B, class F, overlay=ov014)

**Original verdict:** F, tract=low — "jump-table state dispatch, big."

**Upgrade reason:** `Ov014_ConfirmCursorSel` — single 4-way jump table on `[r4,#0x34]` (same field `021b3568` maintains — the two functions co-drive a state machine together). Cases 1/2 near-identical byte-pack increment/decrement with wraparound clamp, tail-calling `Ov014_RenderPaneBName` (also this batch's target).

**Struct/data needed:** `data_ov014_022350f4` (pane-B controller, `+0x54` byte-pair, `+0x58` mode flag), `data_ov014_0223515c`.

**Ground-truth pool words (verbatim):**

```
data_ov014_022350f4   data_ov014_0223515c
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_ov005_021ad018   func_02037208   func_ov014_021b3938   func_02037208
func_ov014_021b3938   func_02037208   func_ov014_021b44e8 (conditional)   func_02037208
```

**Recipe sketch:**

```c
int Ov014_ConfirmCursorSel(PaneCtrl *r4) {
    switch (r4->field_34) {
    case 0: func_ov005_021ad018(...); func_02037208(-1,0,1); return 1;
    case 1: /* pack low byte of slot, RenderPaneBName(0) */ return 0;
    case 2: /* pack high byte of slot, RenderPaneBName(1) */ return 0;
    case 3: if (r4->field_c != 0) { func_ov014_021b44e8(...); r4->field_4 = 1; } return 0;
    }
    return 0;
}
```

---

### 0x021B3938 (332 B, class F, overlay=ov014)

**Original verdict:** F, tract=low — "332-byte init, struct copy + 8 calls."

**Upgrade reason:** `Ov014_RenderPaneBName` — the shared render back-end both `021b379c` cases 1/2 call. "Struct copy" is a fixed 4-iteration format-string ("No.%02d") staging, not a struct. 2-way dispatch on `r1` selects the same `data_ov014_022350f4+0x54` byte-pair `021b379c` writes.

**Struct/data needed:** `data_ov014_021b4bf8` (shared literal blob, `+0x0..+0x7` string prefix), `data_ov014_022350f4` (`+0x54`).

**Ground-truth pool words (verbatim):**

```
data_ov014_021b4bf8   data_ov014_022350f4   0x000006a7   0x000006a6   data_02102c90
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_0208de4c   func_02094504   func_02001d0c   func_0202c0c0
func_02004f58   func_02091554   func_020054a4   func_02004f58
```

**Recipe sketch:**

```c
void Ov014_RenderPaneBName(PaneCtrl *r5, int side) {
    char fmt[8]; memcpy(fmt, data_ov014_021b4bf8, 8);
    int x = (side == 0) ? 0x78 : 0xdc;
    u8 slot = (side == 0) ? data_ov014_022350f4->field_54 & 0xff
                           : (data_ov014_022350f4->field_54 >> 8) & 0xff;
    /* VRAM tile-region resolve, font-config, format+blit digit string, centered */
}
```

---

### 0x021B3A84 (280 B, class F, overlay=ov014)

**Original verdict:** F, tract=low — "color-blend, heavy reg-alloc mul/asr chains, nested liveness."

**Upgrade reason:** `Ov014_BlendPixels` — a pure leaf loop (zero `bl`/`blx`). The "heavy chains" decompose into a single deterministic unrolled RGB555 linear-interpolation formula applied to 3 independent 5-bit channels, with the blend factor hoisted out of the per-pixel loop. Same rounding idiom repeated 3x verbatim for R/G/B — NOT a reg-alloc coin-flip.

**Struct/data needed:** `data_021040ac+0x38` (fade/blend-factor byte — genuine new KB gap, no other fields of this base documented anywhere).

**Ground-truth pool words (verbatim):**

```
data_021040ac
```

**Ground-truth BL targets (verbatim):**

```
none
```

**Recipe sketch:**

```c
void Ov014_BlendPixels(u16 *dst, u16 *src, int count, FadeState *r0) {
    int factor = r0->field_38 & 0x3f;
    int weight = (factor < 0x20) ? factor : (0x40 - factor);
    for (int i = 0; i < count; i++) {
        /* extract r/g/b, apply weight*channel with rounding, clamp, repack RGB555 */
    }
}
```

**Levers:** the `mul`→`asr#0x4`→`add,lsr#0x1b` 3-instruction rounding idiom must reproduce identically for R/G/B; channel extraction order and clamp-after-shift ordering are load-bearing for register numbering.

---

### 0x021B3C20 (932 B, class F, overlay=ov014)

**Original verdict:** F, tract=low — "932-byte init, repeated struct field packing, big-body."

**Upgrade reason:** `Ov014_BuildPaneBTiles` — 4x-repeated "load 4 palette rows, stage into stack pointer array, call `func_0201e7e0`+`func_0201ef90`" pattern, mechanical not scheduling-sensitive. One-time bic/orr prologue gated by a zeroed guard. Ends passing `func_ov014_021b3b9c` (already-matched `Ov014_TeardownRenderTasks`) BY ADDRESS to `func_02005800` (function-pointer-as-data, not a call).

**Struct/data needed:** `data_ov014_022350e0` (render-task-pair guard), `data_ov014_022350f4` (`+0x54`/`+0x56` selector bytes), 16 palette-table globals (4 quadruples of 4).

**Ground-truth pool words (verbatim, 19 total):**

```
data_ov014_022350e0   data_ov014_022350f4   data_ov014_021b4e34   data_ov014_021b4e54
data_ov014_021b4e74   data_ov014_021b4e94   data_ov014_021b4eb4   data_ov014_021b4ed4
data_ov014_021b4ef4   data_ov014_021b4f14   data_ov014_021b4f34   data_ov014_021b4f54
data_ov014_021b4f74   data_ov014_021b4f94   data_ov014_021b4fb4   data_ov014_021b4fd4
data_ov014_021b4ff4   data_ov014_021b5014   func_ov014_021b3b9c
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_02094504   func_02091554 (x4, block1, selector low-byte)   func_0201e7e0   func_0201ef90
func_02091554 (x4, block2, selector high-byte)   func_0201e7e0   func_0201ef90
func_02091554 (x4, block3, unconditional)   func_0201e7e0   func_0201ef90
func_02091554 (x4, block4, unconditional)   func_0201e7e0   func_0201ef90
func_02005800 (data arg, not called)
```

**Recipe sketch:**

```c
void Ov014_BuildPaneBTiles(PaneB *r4) {
    /* zero guard, one-time bic/orr prologue on field_54/field_56 */
    /* 4x { load 4 palette rows, func_0201e7e0, func_0201ef90 } with
       different task sizes 0x200/0x6000/0xa000/0x12000 */
    func_02005800(Ov014_TeardownRenderTasks);
}
```

---

### 0x021B4294 (292 B, class F, overlay=ov014)

**Original verdict:** F, tract=low — "292B, 4x struct-init calls plus tail body" (documented near-clone sibling at `021b43b8`).

**Upgrade reason:** `Ov014_RenderDeckSlotA` — simplest of the 8. Exactly 4 unconditional `func_02091554` palette-loads (same quadruple as `021b3c20` block 1) + single `func_0201ef90`. No branches beyond one cleanup guard. The documented near-clone (`021b43b8`) confirms the shape is genuinely repeated, not coincidental — almost certainly the standalone callable form of `021b3c20`'s block 1.

**Struct/data needed:** same palette quadruple as `021b3c20` block 1, `data_ov014_022350e0[0]` (task-handle write).

**Ground-truth pool words (verbatim):**

```
data_ov014_021b4e34   data_ov014_021b4e54   data_ov014_021b4e74
data_ov014_021b4e94   data_ov014_022350e0
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_02091554 (x4)   func_0201ef3c (conditional)   func_0201e7e0
func_0201ef90   func_0201ede4
```

**Recipe sketch:**

```c
void Ov014_RenderDeckSlotA(PaneB *r4) {
    void *pal[4] = { load_pal(...), load_pal(...), load_pal(...), load_pal(...) };
    if (r4->field_10 != 0) func_0201ef3c(...);
    func_0201e7e0();
    build_sprite_anim(..., &r4->field_4, &r4->field_8, &r4->field_c, pal);
    data_ov014_022350e0[0] = func_0201ede4(...);
}
```

---

## ov015 Newly Tractable Funcs

All 6 already carry HIGH-confidence proposed names in `docs/research/map/_names_overlay015.md`/`overlay015.md` — this round's value-add is byte-verified pool-word/callee/struct-offset ground truth backing those names. 2 cleanly tractable, 4 conditionally tractable (named gap only — dense arithmetic/jump-table bodies needing objdiff iteration, zero unresolved symbols). 0 confirmed wall.

### 0x021B3280 (548 B, class F, overlay=ov015)

**Original verdict:** low — "per-frame scroll animation, mode-2/3 magic-divide interpolation, dense reg-alloc."

**Upgrade reason:** `Ov015_AnimateScroll`. Sole pool word `0x66666667` is the documented ÷10 smull reciprocal. Both mode branches use identical smull/interpolation shape. All 7 callees named (overlay-local or documented cross-overlay utilities). Struct fields match the established `Ov015Scroller` struct.

**Struct/data needed:** `Ov015Scroller` (self=r9): `+0x54..+0x74` window/scroll/mode/countdown fields.

**Ground-truth pool words (verbatim):**

```
0x66666667   ; smull ÷10 reciprocal
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_0207ec28   func_02006194   func_02006110   func_020b3870
func_ov015_021b3520   func_02037208   func_0207fd28   func_0207f934
```

**Recipe sketch (conditionally tractable — interpolation arithmetic + final font-cell stack-arg block need 1-2 objdiff iterations):**

```c
int func_ov015_021b3280(Ov015Scroller *self, int a1, void *a2, void **out) {
    if (self->f70 > 0) { /* mode-2/3 smull interpolation, clamp */ }
    else if (!(self->f74 & 1)) { /* touch scroll-drag */ }
    /* clamp f5c to [f60,f64] */
    func_0207fd28(self, a1);
    return 0;
}
```

---

### 0x021B3E14 (184 B, class E, overlay=ov015)

**Original verdict:** low — "display-flag repack, unlabelled bit-shuffle, unnamed handle field."

**Upgrade reason:** `Ov015_UpdateDisplayFlags`. `0x04001008` is documented BG-control MMIO family; `data_ov015_021b5e44` is the confirmed central ov015 state struct. 12-op bit-shuffle repacks a halfword field permutation — dense but every input/register accounted for, no unknowns. **Cleanly tractable.**

**Struct/data needed:** `data_ov015_021b5e44` (`+0` task handle, `+0xa84` flags word).

**Ground-truth pool words (verbatim):**

```
0x04001008   data_ov015_021b5e44
```

**Ground-truth BL targets (verbatim, in call order):**

```
Task_InvokeLocked   func_ov005_021ab6ac
```

**Recipe sketch:**

```c
void func_ov015_021b3e14(void *self) {
    if (*(int *)self != 0) { Task_InvokeLocked(); *(int *)self = 0; }
    u16 v = *(vu16*)0x04001008 & ~0x80;
    *(vu16*)0x04001008 = (dst & 0x43) | packed_bit_shuffle(v);
    data_ov015_021b5e44[0xa84/4] |= 1;
    func_ov005_021ab6ac();
}
```

---

### 0x021B4444 (304 B, class E, overlay=ov015)

**Original verdict:** low — "scroller-to-VRAM row copy, unnamed struct offsets, unnamed scroll-target callee."

**Upgrade reason:** `Ov015_CopyScrollerToVram` (4th-most-called ov015 function). Every symbol named — `Ov015_UpdateScrollTarget` already NAMED, `Ov015_ScrollRangeNonEmpty`/`Ov015_HitTestAndScroll` confirmed. Row-cache-validity table matches "tracks row changes, copies updated rows" description exactly. **Cleanly tractable.**

**Struct/data needed:** `data_ov015_021b6828` (`+0x4c` scroll value), `data_ov015_021b5e44` (`+0x900..` row-cache table, `+0xa00`/`+0xa38`).

**Ground-truth pool words (verbatim):**

```
data_ov015_021b6828   0x01ff0000   0x04001010   data_ov015_021b5e28   data_ov015_021b5e44
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_ov015_021b24f4   func_ov015_021b2630   Ov015_UpdateScrollTarget (x2)
Vram_GetBankBaseCD   Copy32
```

**Recipe sketch:**

```c
int func_ov015_021b4444(void *arg0, void *arg1) {
    /* masked scroll-value write, ScrollRangeNonEmpty gate + HitTestAndScroll,
       row-cache-validity scan with Copy32 on cache-miss */
}
```

---

### 0x021B4574 (340 B, class E, overlay=ov015)

**Original verdict:** low — "d-pad scroll handler, cluttered branch tree, unnamed KEY struct."

**Upgrade reason:** `Ov015_HandleDpadScroll`. All 3 callees confirmed (`Ov015_GetScrollLo`/`Hi`/`SetScrollPos`). `data_02104bac` confirmed as KEYINPUT block (`+0x52`/`+0x54`), matches the independently-documented `021b429c` prep draft exactly. D-pad-hold-accelerates-scroll ramp pattern.

**Struct/data needed:** `data_ov015_021b5e28+0x864`, `data_ov015_021b5e44+0xa00` (window: current/step/repeat), `data_02104bac+0x52/+0x54`.

**Ground-truth pool words (verbatim):**

```
data_ov015_021b5e28   data_ov015_021b5e44   data_02104bac
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_ov015_021b2480   func_ov015_021b2488   func_ov015_021b23f4
```

**Recipe sketch (conditionally tractable — one field binding needs objdiff confirmation):**

```c
int func_ov015_021b4574(void) {
    int lo = func_ov015_021b2480(...); int hi = func_ov015_021b2488(...);
    u16 keys = data_02104bac.f54;
    /* up/down scroll with step-size ramp, repeat-counter acceleration */
    if (fired) func_ov015_021b23f4(...);
    return 0;
}
```

---

### 0x021B47CC (980 B, class F, overlay=ov015) — largest, richest confirmation in this batch

**Original verdict:** low — "large multi-stage module init, 45+ callees, dense VRAM/MMIO setup."

**Upgrade reason:** `Ov015_Init`. Despite size, every callee and pool word already named. VRAM/DISPCNT setup is the identical OV006 full-init recipe (`OverlayConstants.md`, verbatim literal matches). 12 ov015-local/ov005-bridge tail callees all confirmed names. Only genuinely unlabelled items are two opaque handle-table pointers not dereferenced with unknown offsets in this function.

**Struct/data needed:** `data_ov015_021b5e44`/`_5e34`/`_5e28` (central state), `data_ov015_021b5a8c` (resource-config, flagged R6 naming gap, second confirmed user), `data_0210694c+0xa4` (count/threshold).

**Ground-truth pool words (verbatim, 27 total, in order):**

```
data_ov015_021b5e44   0x00000a88   data_02104f1c   data_ov015_021b5e34
0x000001ff   data_ov015_021b6794   0x04000304   0x0400000e   0xffcfffef
data_ov015_021b5e54   0x07000400   0x05000400   0x04001008   0x04001000
data_ov015_021b6270   data_ov015_021b68bc   data_ov015_021b68c0   data_ov015_021b5d4c
data_ov015_021b5e28   data_ov015_021b6694   data_ov000_021b1db4   data_ov000_021b1ddc
data_0210694c   data_ov015_021b5a8c   func_ov015_021b3ecc   func_ov015_021b3f98   func_ov015_021b4040
```

**Ground-truth BL targets (verbatim, in call order):**

```
Fill32   func_0207deb0   func_0200592c   func_0208d1e4   func_02094504 (x4)
func_0208cc90   func_0207e8b8   func_02001a34   Ov015_RegisterCallbacks
func_0208da2c   func_0208d8c0   func_0208d7ac   func_0208c8cc   func_02005bfc (x2)
func_0207f420 (x2)   func_0207f138 (x2)   func_0208d138   func_0208d0bc   func_0208d030
func_ov015_021b3578   func_ov015_021b235c   func_ov015_021b2864
func_ov005_021aaf08   func_ov005_021ab00c   func_0200a2f4   func_ov005_021ab3c8
func_ov005_021ab32c (x2)   func_ov005_021ab3e8   func_ov005_021acacc   func_ov005_021acad4
```

**Recipe sketch (conditionally tractable — largest/highest register-pressure function in the batch, but zero unresolved symbols):**

```c
int func_ov015_021b47cc(void) {
    Fill32(0, G, 0xa88);
    /* OV006-family VRAM/DISPCNT full-init, BGCNT halfword packs */
    func_ov015_021b3578(...); func_ov015_021b235c(); func_ov015_021b2864(...);
    /* ov005 card-list bridge setup, count-driven loop, dual-printer init */
    return 1;
}
```

---

### 0x021B2C18 (416 B, class E, overlay=ov015) — coincidental cross-overlay address

**Original verdict:** low — "sprite/tile factory, branch-table dispatch on distance, unnamed resource IDs."

**Upgrade reason:** `Ov015_DrawTileGlyph`. **Confirmed unambiguously overlay-local, NOT a copy-paste twin of ov010's `021b2c18`** — every symbol resolves to ov015-specific names (tail call to ov015-local `Ov015_BlitTileRow`, `Ov015_SelectVramBank`, cross-overlay `data_02102c90`/`data_02104f4c` with the same language-ID idiom seen elsewhere in this overlay). The 8-way jump table is a "clamp row index to bucket" pattern.

**Struct/data needed:** `data_02102c90`, `data_02104f4c+4`, caller rect struct.

**Ground-truth pool words (verbatim):**

```
0x0000028b   data_02102c90   data_02104f4c
```

**Ground-truth BL targets (verbatim, in call order):**

```
Ov015_SelectVramBank   func_0202c0c0   func_020054a4 (per-iteration)
func_02001d0c   func_02001d68   func_02001c98   func_02005088
func_ov015_021b30f0
```

**Recipe sketch (conditionally tractable — jump-table body case→value mapping needs one more careful re-check):**

```c
int func_ov015_021b2c18(int mode, int a1, s16Rect *rect, int a3) {
    void *vbank = Ov015_SelectVramBank(a1);
    /* 8-way row-index clamp jump table, resource-ID 3-way switch */
    func_02005088(data_02102c90, tile, dst, y, r9, x);
    func_ov015_021b30f0(a1, rect, a3, 0);
    return 1;
}
```

---

## ov020 Newly Tractable Funcs

All 5 have HIGH-confidence proposed names in `docs/research/map/overlay020.md`/`_names_overlay020.md` — first round to do pool-word/BL-target/struct-offset ground-truth extraction. Unusually dense pre-existing sibling coverage (9 of ~15 distinct callees already byte-verified dossiers) is why even the two large functions resolved cleanly.

### 0x021AAEAC (448 B, class E, overlay=ov020)

**Original verdict:** not examined (virgin) — `Ov020_InitPanel` (HIGH).

**Upgrade reason:** Allocate two text/task buffers via `Task_PostLocked`+`Fill32`, format via already-SHIP `func_ov020_021aa700`/`_a4a0`, font-engine config with confirmed `data_02104f4c+4` language extract, `data_02102c90` bitfield pack. Zero unresolved indirection.

**Struct/data needed:** `data_ov020_021ae0a8` (plain pointer, VRAM base offset), `data_02102c90`, `data_02104f4c`.

**Ground-truth pool words (verbatim):**

```
data_ov020_021ae0a8   data_02102c90   data_02104f4c
```

**Ground-truth BL targets (verbatim, in call order):**

```
Vram_GetBankBaseCD   func_ov020_021aa700 (x2)   Task_PostLocked (x2)   Fill32 (x2)
func_ov020_021aa4a0 (x2)   func_02001d0c (x2)   func_02001d68 (x2)
func_02004fb8   func_02001e40   func_02001c98   func_02004fe8
Task_InvokeLocked (x2)
```

**Recipe sketch:**

```c
void Ov020_InitPanel(int cardId) {
    void *vramCD = Vram_GetBankBaseCD();
    /* size-then-alloc-then-format for 2 text buffers, font config,
       data_02102c90 bitfield pack, render both, free both */
}
```

---

### 0x021AB1DC (392 B, class E, overlay=ov020)

**Original verdict:** not examined (virgin) — `Ov020_InitCardPanel` (HIGH, "sibling of Ov020_InitPanel").

**Upgrade reason:** Structurally near-identical to `021aaeac`. New piece: a clean 2-way font-size threshold (`func_020054a4` result vs `0xc8`). `0xc80`-stride slot layout already established by sibling dossiers.

**Struct/data needed:** `data_02104f4c`, `data_02102c90`.

**Ground-truth pool words (verbatim):**

```
data_02104f4c   data_02102c90
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_0208df0c   func_ov020_021aa700 (x2)   Task_PostLocked (x2)   Fill32 (x2)
func_ov020_021aa4a0   func_02001d68 (x2)   func_020054a4   func_02001d0c
func_02001c98   func_02004fb8   func_02001e5c   func_02005088
Task_InvokeLocked (x2)
```

**Recipe sketch:**

```c
void Ov020_InitCardPanel(int slot, int cardId, int mode) {
    void *slotBase = func_0208df0c() + 0x20 + slot * 0xc80;
    /* format 2 buffers, 2-way font-size threshold, 2-way row-count select */
}
```

---

### 0x021ABBE8 (1964 B, class F, overlay=ov020)

**Original verdict:** not examined (virgin) — `Ov020_Init` (HIGH, "master overlay init, shuffle roster 100 iterations").

**Upgrade reason:** Confirmed exactly by map doc: standard OV006-pattern hardware init, VRAM DMA at documented literals, DISPCNT bitfield pack. Shuffle loop uses the confirmed ÷10 reciprocal (`0x66666667`) and confirmed no-arg RNG (`func_020a991c`, 100 total iterations matching the map doc's own note). 3 bounded bucket-scan loops for ownership/deck classification, deterministic.

**Struct/data needed:** `data_ov020_021ae060` (`+0xa64` bitfield, `+0xab8`/`+0xae0` per-card ownership bitmask), `data_0210594c` (`+0xb8`).

**Ground-truth pool words (verbatim, in order):**

```
data_ov020_021ae0a8   0xa54   data_02104f1c   data_ov020_021ae060
data_ov020_021ae084   data_ov020_021ae070   0x1ff   data_ov020_021ae988
0x7000400   0x5000400   0x4000304   0x4000008   0x1c0c   0x400100e
0x50001e0   0x7fff   0x421   0x50001c0   0x3def   0x50005e0
data_ov020_021ae0ac   data_02104f4c   data_ov020_021ae060   0xffcfffef
data_ov020_021ae0e8   data_ov020_021ae504   data_0210594c   0x66666667
0x106   data_ov020_021addc8
```

**Ground-truth BL targets (verbatim, in call order):**

```
Fill32   func_0207deb0   func_0207f884   func_0207f85c   func_0200592c
func_0208d1e4   func_02094504 (x5)   func_0208cc90   func_0207e8b8
func_0208da2c   func_0208d8c0   func_0208d138   func_0208d0bc   func_0208d7ac
func_0208d030   func_0208c8cc   func_02001a34   func_02001bc8 (x3)
func_0202adf8   func_0202ae1c   func_02005bfc (x2)   func_0207f420
func_0207f138 (x2)   func_ov020_021aa6cc   Task_PostLocked
func_020a991c (x100 total, shuffle loop)   func_020b3870 (x6)
Task_InvokeLocked
```

**Recipe sketch:**

```c
void Ov020_Init(void) {
    /* DISPCNT pack, Fill32, OV006-family VRAM/DISPCNT init */
    /* Fisher-Yates shuffle, 100 iterations, func_020a991c()%10 */
    /* 3 bounded bucket-scan loops for card ownership classification */
    Task_InvokeLocked(task);
}
```

---

### 0x021AC4FC (544 B, class F, overlay=ov020)

**Original verdict:** not examined (virgin) — `Ov020_TransitionIn` (HIGH, "fade-in transition, measures sprite width, done when scroll reaches 0").

**Upgrade reason:** Fully deterministic: 2-iteration scroll-reset loop, `Ov020_MeasurePanel` call (already documented), 2-iteration conditional apply, OV006-pattern DISPCNT priority pack (4 BG-layer ladder, both engines), MASTER_BRIGHT fade via confirmed addresses + documented `func_020b3870` scale helper.

**Struct/data needed:** `data_ov020_021ae0a8` (`+0x40`/`+0x5c`/`+0x78`/`+0x87c`/`+0x878` fade-timer cluster).

**Ground-truth pool words (verbatim):**

```
data_ov020_021ae0a8   data_ov020_021ae0e8   0x04001008   0x04001000
0x0400006c   0x0400106c
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_0207ed94 (x2)   func_0207ec68 (x2)   func_ov020_021ab81c
func_0207f05c (x2)   func_0208c940   func_020b3870
func_0208c884 (x2)   func_0208c884 (x2, completion path)   func_020373cc
```

**Recipe sketch:**

```c
int Ov020_TransitionIn(void) {
    /* reset 2 BG-layer scroll blocks, measure widths, apply, DISPCNT priority ladder */
    int fadeVal = func_020b3870(-((g->f87c >> 8) << 4), g->f878);
    func_0208c884(0x0400006c, fadeVal); func_0208c884(0x0400106c, fadeVal);
    if (g->f87c == 0) { /* zero both, signal done */ return 1; }
    return 0;
}
```

---

### 0x021AC71C (4196 B, class F, overlay=ov020) — largest in whole R8 batch, 1177 lines, read in full

**Original verdict:** not examined (virgin) — `Ov020_Update` (HIGH, "per-frame main update: input, hit-test, selection, scroll").

**Upgrade reason:** Structurally identical in shape to `Ov017_MainSceneUpdate` (3256 B in R7) — a top-level bounded 10-way computed branch followed by a SECOND independent 10-way computed branch (next-state advance table). Every case block is deterministic; no unresolved fn-ptr indirection anywhere despite 68 call sites, all independently re-verified via grep against the raw file.

**Struct/data needed:** `data_ov020_021ae060` (`+0xa50` UI-mode-flags bitfield, `+0` state index, `+0x894`/`+0x898`/`+0x89c` cursor fields, `+0x87c..+0x8cc` timer cluster shared with `021ac4fc`, `+0xab8`/`+0xae0` ownership bitmask shared with `021abbe8`), `data_02104bac` (extends `+0x54` with new bits `0x1`/`0x800`).

**Ground-truth pool words (verbatim, 9 total):**

```
data_ov020_021ae0a8   data_ov020_021ae0e8   data_02104bac   0x0000ffff
data_02104f4c   data_ov020_021addd0   data_ov020_021ae060   data_0210594c
0x08f00003
```

**Ground-truth BL targets (verbatim, 68 call sites — full enumeration, grep-verified):**

```
func_0207ed94   func_0207ec68   func_02006164   func_ov020_021aa7ac
func_020061ac   func_ov020_021aa7ac   func_0200617c   func_02006164
func_ov020_021aa80c   func_02037208   func_020061ac   func_ov020_021aa80c
func_02037208   func_0200617c   func_02037208 (x2)   func_ov020_021ab06c
func_ov020_021ab0d8   func_02037208   func_ov020_021aae0c   func_ov020_021aae48
func_ov020_021ab06c   func_ov020_021ab0ac   func_ov020_021ab3c8   func_ov020_021ab418
func_ov020_021aad10   func_ov020_021aae64   func_02037208 (x2)   func_ov020_021aaeac
func_ov020_021ab0d8   func_ov020_021aabf0   func_ov020_021aac78   func_ov020_021ab1dc
func_ov020_021ab364   func_020b3870 (x2)   func_02037208   func_ov020_021aaa80
func_ov020_021abb2c   func_ov020_021ab43c   func_02037208 (x3)   func_ov020_021aba54
func_ov020_021ab8f8   func_ov020_021abac0   func_ov020_021ab964   func_ov020_021abb2c
func_ov020_021aabf0   func_ov020_021aac78   func_ov020_021aae0c   func_ov020_021aae48
func_ov020_021ab06c   func_ov020_021ab0ac   func_ov020_021ab3c8   func_ov020_021ab418
func_ov020_021ab4a0   func_ov020_021aad10   func_ov020_021aae64   func_ov020_021ab4a0
func_020b3870 (x2)   func_ov020_021ab5c4 (x2)   func_ov020_021ab4a0   func_ov020_021ab81c
func_ov020_021aaa80   func_ov020_021ab9d0   func_ov020_021abb94   func_0207f05c
func_0207fd28   func_020a991c (x2)   func_020b3870 (x2)   func_02037208
func_02036590 (x2)
```

**Recipe sketch:**

```c
int Ov020_Update(void) {
    /* reset 2 BG-layer scroll blocks; primary/secondary touch hit-test dispatch */
    /* state-6-specific card select/deselect via GetHitSlot */
    switch (st->f0) {
    case 2: /* select-slot: clear rows, draw card list */ break;
    case 3: /* scroll-in timer */ break;
    /* cases 4-9: same struct-field-driven shape, named panel/sprite family */
    }
    /* sprite-placement loops, next-state advance table (10-way), DISPCNT toggle */
    return st->f0;
}
```

**New KB gaps (7, cross-referenced with existing docs):** `data_02104bac+0x1/+0x800` bit extensions; `data_ov020_021ae060+0xa50` UI-mode-flags cluster (≥8 bits); `+0x87c..+0x8c4` scroll/timer cluster (shared across 3 functions — worth consolidating into a named sub-struct); `+0xab8/+0xae0` ownership bitmask (shared with `021abbe8`); `data_0210594c+0x88/+0xb8` (2 offsets, 2 functions); `func_020a991c` = `Rng_Next` (not yet formally named in `MainConstants.md`); the `0x08f00000/0x08f00003` audio-cue command-pair convention (cross-overlay, also seen in ov022).

---

## ov005 Newly Tractable Funcs

All 8 independently HIGH-confidence-named in `docs/research/map/overlay005.md`/`_names_overlay005.md`, giving strong triangulation. Scanned all 8 files for unusual instruction forms (`stmib`/`swp`/`mrs`/`msr`) — none found, all standard ARM forms. A striking reversal of R6's `SmallOverlaysRetriage.md` finding for ov005 (2/34 = 6%) — but not a contradiction: R6 examined a genuinely-harder sample; this batch sits in a "second-tier accessor/builder" zone R6 didn't reach.

### 0x021AB3E8 (708 B, class F, overlay=ov005)

**Original verdict:** not examined (virgin) — `CardList_InitVram` (HIGH).

**Upgrade reason:** VRAM/display-channel constructor. Zero-init, box copy, tile-column/row divide-by-8 idiom, 4-way mode dispatch through 4 already-catalogued VRAM-bank-base helper pairs. Every branch target and pool word known; jump table is clean 4-case bounded dispatch.

**Struct/data needed:** self struct (`+0xc..+0x6c` box/mode/task fields), `data_02102c90`, `data_02104f4c` (`+4` language).

**Ground-truth pool words (verbatim):**

```
data_ov005_021b1ddc   data_02102c90   data_02104f4c   0x00007fff
```

**Ground-truth BL targets (verbatim, in call order):**

```
Fill32   Vram_GetBankBaseCD/func_0208e200   Vram_GetBankBaseE/func_0208e1ac
func_0208de4c/func_0208e0a0   func_0208dd9c/func_0208df94   Task_PostLocked (x2)
func_020945f4 (x2)   func_ov005_021ab0fc   func_ov005_021ab6ac
func_02001d0c   func_02001d68   func_ov005_021abc88 (x2)   func_02094504
func_02001bc8   func_02001c98
```

**Recipe sketch:**

```c
void CardList_InitVram(CardListChannel *self, void *cmdBuf, Rect16 *box, int glyphIdx, int stackArg1c) {
    Fill32(self, 0, 0x70);
    /* box copy, tile col/row divide-by-8, 4-way VRAM-bank mode switch */
    CardList_BuildDisplayList(self);
    func_02001d0c(data_02102c90, self->cols, self->rows);
}
```

---

### 0x021AB6AC (428 B, class F, overlay=ov005)

**Original verdict:** not examined (virgin) — `CardList_BuildDisplayList` (HIGH).

**Upgrade reason:** The function `021ab3e8` tail-calls. `blx r3` at `.L_334` is NOT unresolved — `r3` is a caller-injected callback pointer (`[r8,#0x6c]`) with a fully-pinned calling convention (deterministic populate-then-clear field sequence). Every non-callback callee is small, already-MATCHED.

**Struct/data needed:** self (`+0x0`/`+0x5c`/`+0x60`/`+0x6c`), 16-byte-stride callback contract struct.

**Ground-truth pool words (verbatim):**

```
none
```

**Ground-truth BL targets (verbatim, in call order):**

```
Task_PostLocked (x2)   func_ov005_021ab274   func_ov005_021ab384 (x2 per iter)
blx r3 (caller callback via [r8,#0x6c])   func_ov005_021ab260   func_ov005_021ab274
func_ov005_021ab2e0 (x1-2)   func_ov005_021abc88   Task_InvokeLocked (x2)
```

**Recipe sketch:**

```c
void CardList_BuildDisplayList(CardListChannel *self) {
    /* do/while: build node -> validate -> populate via caller callback ->
       validate -> advance; backward-walk on fail */
    CardList_ClearVramRegion(self, (self->field_5c << 0x1c) >> 0x1f);
    Task_InvokeLocked(nodeArr); Task_InvokeLocked(entryArr);
}
```

---

### 0x021AB858 (680 B, class F, overlay=ov005)

**Original verdict:** not examined (virgin) — `CardList_ScrollUpdate` (HIGH).

**Upgrade reason:** `func_0207ec28` has a full recipe dossier. Straight-line scroll-animation step + independent touch/hit-test scan + per-glyph render loop. Both `blx` sites are caller-pinned callback contracts (same shape as `021ab6ac`'s `[r8,#0x6c]`), not unresolved dispatch.

**Struct/data needed:** self (`+0x28`/`+0x34`/`+0x38`/`+0x3c`/`+0x4c`/`+0x50`/`+0x54`/`+0x58`/`+0x5c`/`+0x64`/`+0x68`), hit-scan entry struct (0xc-stride), glyph entry struct (0x60-stride).

**Ground-truth pool words (verbatim):**

```
0x04000304   0x00003fff
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_0207ec28   func_020b3870   blx [sl,#0x68] (conditional)
func_02006164   func_02006110   blx [sl,#0x64] (conditional, in scan loop)
func_0207f934 (in render loop)
```

**Recipe sketch:**

```c
int CardList_ScrollUpdate(CardListChannel *self, int elapsed, int touchX, void *arg3) {
    /* scroll-remaining countdown + interpolate, on-complete callback */
    /* touch hit-scan over rect array, hit callback */
    /* glyph-render loop gated by 2-bit field */
    return done;
}
```

---

### 0x021ABCC4 (244 B, class E, overlay=ov005)

**Original verdict:** not examined (virgin) — `CardList_FillColumnSlice` (HIGH).

**Upgrade reason:** Pure computation + `Fill32` loop, zero unresolved indirection. Matches map doc's description exactly. Early-return guards are simple zero-column-count checks, not scheduling walls.

**Struct/data needed:** self (`+0x14` row count), indexed pointer table (`self+idx*4 → +0x18`).

**Ground-truth pool words (verbatim):**

```
none
```

**Ground-truth BL targets (verbatim):**

```
Fill32 (x1-3, loop-invoked)
```

**Recipe sketch:**

```c
void CardList_FillColumnSlice(CardListChannel *self, int idx, int colOffset, int fillVal) {
    /* 3-phase Fill32: leftover-column partial, full-8-column blocks, final leftover-row */
}
```

---

### 0x021AC91C (104 B, class E, overlay=ov005)

**Original verdict:** not examined (virgin) — `CardList_WriteTileRow` (HIGH).

**Upgrade reason:** Zero calls, zero pool words — pure nested fixed-bound loop (32 outer × variable inner) writing a packed 16-bit tile value. Row-padding arithmetic is deterministic, not entropy.

**Struct/data needed:** self (`+0xc`/`+0x14`/`+0x20`/`+0x24`).

**Ground-truth pool words (verbatim):**

```
none
```

**Ground-truth BL targets (verbatim):**

```
none
```

**Recipe sketch:**

```c
void CardList_WriteTileRow(CardListEntry *self) {
    u16 *dst = (u16*)self->p_20 + (self->f_c >> 3);
    for (int row = 0; row < 0x20; row++) {
        /* write self->f_14 columns, then pad row to fixed stride */
    }
}
```

---

### 0x021AD060 (428 B, class F, overlay=ov005)

**Original verdict:** not examined (virgin) — `CardList_ResetAndRebuild` (HIGH).

**Upgrade reason:** Straight-line reset with two clean bounded sub-blocks. `data_02104f4c+0x4` language-ID idiom doubly confirmed (matches `Ov017Ov019Retriage.md`'s `021b22ec` verbatim). `tst r1,#0x19` region-selector idiom matches `021aef74` below — a shared cross-function convention within this overlay.

**Struct/data needed:** `data_ov005_021b1e6c`, `data_02104f4c` (`+4`), self (`+0x8`/`+0x20`/`+0x28`/`+0x44`/`+0x48`).

**Ground-truth pool words (verbatim):**

```
data_ov005_021b1e6c   data_02104f4c
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_02094504   func_020aadf8   func_ov005_021af2dc   func_020aaddc (x1-2)
func_020054a4 (loop)   func_ov005_021adf3c   func_ov005_021afac8 (conditional)
```

**Recipe sketch:**

```c
int CardList_ResetAndRebuild(CardListChannel *self) {
    /* save/clear/restore Fill32, language-ID branch, threshold clamp cascade */
    CardList_DrawScene(self);
    if (self->field_20 > 6) CardList_AnimateEntries(self);
    return 1;
}
```

---

### 0x021AD35C (2976 B, class F, overlay=ov005) — largest in ov005, 832 lines, read in full

**Original verdict:** not examined (virgin) — map doc proposes `CardList_Destroy` (HIGH), but this description is a MISMATCH with the actual disassembly.

**Upgrade reason:** Despite size, resolves to near-pure repetition of ONE well-documented cross-overlay idiom (`func_0201e964` 12-arg cell/OAM reconfigure, 11+ independent dossier entries across other overlays) — appears 16 times, walking a fixed set of ~16-20 named UI slots. **This is actually a "static text panel rebuild," not a destructor** — the map-doc name appears based on a shallow read (flagged as a naming correction for a follow-up pass). Hit-test/byte-sum/blend calls are minor decorations (1-2 calls each), not the function's core.

**Struct/data needed:** `data_ov005_021b1568`/`_1a44`/`_1ab2`/`_1a76`/`_1d4c` (new KB gaps, simple scalar/small-array pool literals), `data_02104f4c` (`+4`), `data_021040ac` (new `+0x38` offset), self (`+0x4..+0x3cc`, 12+ fields).

**Ground-truth pool words (verbatim, in order):**

```
data_ov005_021b1568   0x40f02000   0x00600100   0x050006b8   0x00005402
data_ov005_021b1a44   0x00005406   0xc0004000   0x0000ee80   0x00000439
0x8067408f   0x80a6408f   0x00000437   data_02104f4c   data_ov005_021b1ab2
0x80df408f   0x0000043b   data_021040ac   0x0000581e   0x00004008
data_ov005_021b1d4c   data_ov005_021b1a76
```

**Ground-truth BL targets (verbatim, in call order — 16 `func_0201e964` sites total):**

```
func_02034784   func_02034810 (conditional)   func_02005dac   func_020944a4 (x5 loop)
func_ov005_021aee84 (hit-test gate, multiple sites)   func_0201e964 (x16 total, slot-populate)
func_ov005_021af704 (measure width)   func_02005dac   func_020944a4 (decorations)
```

**Recipe sketch:**

```c
int CardList_RebuildStaticUI(CardListChannel *self) {
    /* header box submit, blend-pixel-row decoration */
    /* score/level readout OR touch-driven slot-populate cascade */
    /* 6x10 score-star grid via func_0201e964 */
    /* win/lose/draw 3-row table, percentage readout, fixed decorations */
    return 1;
}
```

---

### 0x021AEF74 (284 B, class E, overlay=ov005)

**Original verdict:** not examined (virgin) — `CardList_SetupTileMap` (HIGH).

**Upgrade reason:** Small, fully bounded BG-tile-map setup matching map doc exactly. `tst r1,#0x19` region-selector idiom shared with `021ad060` (confirms shared "is region in {0,3,4}" gate). Bounded leading-space scan, deterministic.

**Struct/data needed:** `data_02102c90`, `data_02104f4c`, self (`+0x8`/`+0x48+idx`).

**Ground-truth pool words (verbatim):**

```
data_02102c90   data_02104f4c
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_0208de4c   func_02094504   func_02001d0c   func_02004f58
```

**Recipe sketch:**

```c
void CardList_SetupTileMap(CardListChannel *self) {
    void *base = func_0208de4c();
    int isRegionGroup = (self->region <= 4) && ((1 << self->region) & 0x19);
    func_02094504(0, base + 0x40, 0x4c0 | (isRegionGroup ? 0xc0000 : 0));
    func_02001d0c(data_02102c90, 0x13, 2);
    /* bounded leading-space scan, func_02004f58 render */
}
```

---

## ov009 Newly Tractable Funcs

### 0x021AC4D0 (2448 B, class F, overlay=ov009) — last unexamined ov009 address, 55 BL calls, 12 unique targets

**Original verdict:** not examined (virgin) — `Ov009_Scene_Update` (HIGH), already the documented main scene-update state machine.

**Upgrade reason:** Top-level clean bounded 4-way dispatch (states 0-3: selection input, animate-in, animate-out, confirm). Every one of the 12 unique `bl` targets is already MATCHED/SHIP/HIGH-confidence — zero unknown callees, ZERO `blx` instructions anywhere in the file (all direct `bl`, no fn-ptr indirection). Dominant callee `func_02037208` (24 of 55 calls) is the documented toast idiom. The only genuine gap is a one-line struct-field extension.

**Struct/data needed:** `data_02104bac` (extends documented struct with `+0x52`), `data_ov009_021adc00`/`_dbcc`/`_dac0`/`_da90`/`_da9c`/`_dacc` (self-contained ov009-local structs, all already targeted by other matched/ship siblings).

**Ground-truth pool words (verbatim, all 7):**

```
data_02104bac   data_ov009_021adac0   data_ov009_021ada90   data_ov009_021ada9c
data_ov009_021adbcc   data_ov009_021adc00   data_ov009_021adacc
```

**Ground-truth BL targets (verbatim, 55 calls / 12 unique targets, all direct `bl`, no `blx`):**

```
func_02037208 (x24)   func_ov009_021acf1c (x6)   func_ov009_021acff8 (x3)
func_ov009_021ac458 (x4)   func_ov009_021aa4a8 (x2)   func_ov009_021aa5d8 (x2)
func_ov009_021ab7b4 (x2)   func_0202224c (x2)   func_02022234 (x2)
func_020061ac   func_ov009_021ace60   func_02006164 (x2)   func_0200617c
func_ov009_021ab74c   func_0202cdf8   func_0202ce24   func_ov009_021aaaec
func_ov009_021aa59c
```

**Recipe sketch (conditionally tractable — no unresolved callees, ordinary reg-alloc/jump-table-ordering risk only):**

```c
int Ov009_Scene_Update(Ov009ScoreCtrl *self) {
    switch (self->state) {
    case 0: /* fallthrough touch-driven hit-testing, or field54 bitmask directional dispatch */ break;
    case 1: /* animate-in: 3-phase entrance, transition to state 2 on completion */ break;
    case 2: /* animate-out: hit-test + score-ctrl-update, transition to state 3 */ break;
    case 3: /* confirm cleanup, transition back to state 0 */ break;
    }
    return 0;
}
```

---

## New KB gaps found (rollup across all 9 overlays)

| Gap | Overlay(s) | Notes |
|-----|-----------|-------|
| `data_02104bac+0x52` (extends documented `+0x54 flags`) | ov016, ov009 | Same field independently confirmed twice — secondary gate before the `+0x54` bitmask test |
| `data_02104bac+0x1/+0x800` | ov020 | Two new bit positions on the flags field |
| `data_ov020_021ae060+0xa50` UI-mode-flags cluster | ov020 | ≥8 distinct bits, heavily reused, not yet a named enum |
| `+0x87c..+0x8c4` scroll/timer cluster | ov020 | Shared across 3 functions (`021ac4fc`, `021ac71c`, `021aaa80`) — worth one named sub-struct |
| `+0xab8/+0xae0` per-card ownership bitmask | ov020 | Shared writer across `021abbe8` and `021ac71c` |
| `func_020a991c` = no-arg RNG accessor | ov020 (cross-overlay) | Not yet named in `MainConstants.md`'s RNG section |
| `0x08f00000/0x08f00003` audio-cue command pair | ov020, ov022 (cross-overlay) | Recurring convention, worth a named wrapper note |
| `data_021040ac+0x38` fade/blend-factor byte | ov014 | No other fields of this base documented anywhere |
| `data_ov014_021b4d48` (+5 siblings) wider-than-Rect struct | ov014 | `+0x6`/`+0x8` extra fields feeding `func_0201e964`, stride unconfirmed |
| `data_ov014_021b4bf8` dual-purpose blob | ov014 | Format-string prefix + separate RGB555 array — worth splitting if it lands in `src/` |
| `data_02104c68`/`data_02104c40`/`data_02104cec` packed selector tables | ov003 | New ov003-local lookup family, cross-confirmed across 5 functions |
| `data_021040ac+0x38`/`+0xba8`, `data_02104f4c+0xa64` | ov003 | Alt-index sources for the ov003 selector tables |
| `data_ov005_021b1568`/`_1a44`/`_1ab2`/`_1a76`/`_1d4c` | ov005 | New small scalar/array pool literals in `021ad35c`'s UI-rebuild function |
| `data_021040ac+0x38` (ov005 instance) | ov005 | DISPCNT-adjacent bit-test gate, new offset on an already-documented global |
| `data_ov010_021b8c2c`/`_88c0`/`_91c0` | ov010 | Bitfield-pack block, 16-entry copy table, 40-entry accumulator array |
| `docs/research/dossiers/021b4fdc.md` filename/content mismatch | ov010 | Ground-truth table is verbatim-identical to ov010's `021b5168`, but the prose header claims ov019 — flagged, not fixed in this pass (out of scope) |
| `ov008_core.h` prior-attempt coverage | ov008 | Cross-check this file before allocating future ov008 retriage addresses — it covers more ground than `Ov008Ov010Retriage.md` alone suggests |

---

## Tally

| Overlay | Examined | Tractable | Wall |
|---------|----------|-----------|------|
| ov016   | 8        | 8         | 0    |
| ov010   | 8        | 8         | 0    |
| ov008   | 8        | 0         | 8    |
| ov003   | 8        | 8         | 0    |
| ov014   | 8        | 8         | 0    |
| ov015   | 6        | 6         | 0    |
| ov020   | 5        | 5         | 0    |
| ov005   | 8        | 8         | 0    |
| ov009   | 1        | 1         | 0    |
| **TOTAL** | **60** | **52**  | **8** |

87% newly tractable overall. The 8 walls (all ov008) are genuine mwcc-codegen-choice divergences already caught and permuter-probed by a prior campaign wave, not KB gaps — see `ov008_core.h` cross-check note above. Every other overlay in this batch hit 100%, consistent with the R7 (`Ov017Ov019Retriage.md`) finding that "many calls"/"big body"/"branchy dispatch" swarm-classifier flags systematically over-count difficulty once the struct/data KB is mature: every non-ov008 function in this round decomposed into either a bounded, range-checked discriminant switch or a long but fully-named straight-line/loop sequence — never a genuine unresolved-indirection wall.

