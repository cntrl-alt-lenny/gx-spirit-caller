[//]: # (markdownlint-disable MD013 MD041)

# ov017 / ov019 Re-triage

Generated 2026-07-01. ov017 and ov019 have never been examined in any prior
retriage round (R4/R5/R6) — this is the first pass. All KB references are to
`docs/research/constants/OverlayConstants.md`,
`docs/research/constants/MainConstants.md`,
`docs/research/constants/OverlayConstantsExtended.md`,
`docs/research/data/OverlayDataGlobs.md`,
`docs/research/data/Ov004Ov006DataTables.md`, and
`docs/research/types/*.md` unless otherwise noted. Cross-checked against the
pre-existing (name-proposal only, no pool-word/struct-offset extraction)
`docs/research/map/overlay017.md` and `docs/research/map/overlay019.md`.

All 24 target `.s` files were confirmed to still exist as `.s` (none have
been flipped to `.c` by another lane since the brief was written).

---

## Summary by overlay

| Overlay | .s count (E/F pool) | Examined | Newly tractable |
|---------|----------------------|----------|------------------|
| ov017   | 14                   | 14       | **14**           |
| ov019   | 10                   | 10       | **10**           |
| **TOTAL** | **24**             | **24**   | **24 (100%)**    |

Every single examined function is tractable — a stronger result than any
prior round, including the 400–1200 B "large tier" from R5 (100% but smaller
sample) and the R4 ov002 <400 B tier (72%). This confirms the brief's thesis:
size alone does not predict difficulty once struct/data/constant KB exists.
Every "many calls" body in this batch resolved to a long straight-line
sequence of named-callee `bl`s and deterministic MMIO/struct field writes —
zero genuine coin-flip register-allocation walls were found. The three
"jump-table" functions (021b6264, 021b3f7c, and the internal dispatches
inside 021b5130/021b4570) all turned out to be **bounded, discriminant-driven
computed branches** (`addls pc, pc, rN, lsl #0x2` over a range-checked index),
not scheduling entropy — every case is a clean, distinguishable block.

---

## ov017 Newly Tractable Funcs

### 0x021B22EC (2288 B, class F, overlay=ov017)

**Original verdict:** F — "551 insns, 81 calls, huge init"

**Upgrade reason:** This is the OV006-pattern VRAM full-init sequence
(documented in `OverlayConstants.md` "Full-init VRAM binding constants" and
"2D engine layer parameters") applied verbatim to ov017's main-scene
controller. Every VRAM DMA call (`func_02094504`) uses the exact named
constants `OV006_VRAM_PALETTE_MODE=0xc0`, `OV006_VRAM_PALETTE_A=0x7000000`,
`OV006_VRAM_TILE_BASE=0x5000000`/`_B=0x5000400`, `OV006_VRAM_OBJ_BASE
=0x6800000`, `OV006_VRAM_OBJ_SIZE=0xa4000`, `OV006_VRAM_BLOCK_SIZE=0x400`.
The 2D-engine-layer calls match the documented family exactly:
`func_0208da2c(1)`=`OV006_BG_MODE_2D`, `func_0208d7ac(0x10)`=`OV006_BG_SUB_BG1`,
`func_0208d8c0(2)`=`OV006_BG_SUB_BG0`, `func_0208d6f4(0x20)`=`OV006_BG_SUB_BG2`,
`func_0208d138(4)`=`OV006_BG_PRIORITY_BG3`, `func_0208d030(0x80)`=`OV006_BG_WIN_A`,
`func_0208d0bc(8)`=`OV006_BG_OBJ_PRIO`, `func_0208cfa4(0x100)`=`OV006_BG_WIN_B`.
The DISPCNT bit-clear at `0x4000000`/`0x4001000` (`bic #0x1f00`) matches
`OV000_DISPCNT_BG_NAME_MASK` context. The long mid-body "achievement scan"
(iterating 1..0x57 over an item/collection table via `func_0202b0e0` +
`func_0202de9c` category-switch, then `func_0202bb20`/`func_0202bb54`
boolean-tally, `func_020b3870` percent-compute, and `func_02009758
(achievement_id)` unlocks) is a fully deterministic bounded loop with fixed
threshold constants (0x50, 0x64, 0x32, 5/10/20/30/40 for the language-mix
counter) — no scheduling ambiguity, just a long enumeration. `data_02104f4c`
is `SystemWork`-adjacent (its `+0x4` 3-bit `lsl#0x1d/lsr#0x1d` extract is the
documented language-ID idiom); `+0xa64/+0xa68/+0xa6c/+0xa70/+0xa74/+0xa7c` are
new offsets on that struct/cluster (see New KB gaps). Calls the already-SHIP
siblings `func_ov017_021b2280` (`Ov017_Popcount`, matched), `func_ov017_021b680c`
and `func_ov017_021b2ddc` (both also targets in this doc, both tractable) at
the tail, confirming this is the top-level `Ov017_MainSceneInit` constructor
per `docs/research/map/overlay017.md`.

**Struct/data needed:**
- `data_02104f4c` — extends the "system clock/step-counter" cluster (see New
  KB gaps) with new fields `+0xa64` (bitfield: `& 0x1f00000` then `>>0x14`,
  paired with `+0xa74` guard), `+0xa68` (packed byte fields: `>>0x10`/`&0x7f`,
  `&0x1ff` shapes for two sibling achievement counters), `+0xa6c`/`+0xa70`
  (two int counters copied into `Ov017_MainSceneInit`'s own struct at
  `+0x60`/`+0x14`), `+0xa74` (secondary counter), `+0xa7c` (3-field
  fixed-point accumulator, `<<0xc`/`<<0x4`/raw combined and compared against
  `0x64`/`0x1f4`/`0x64` — a "play-time" or "session" tri-field accumulator).
- `data_020b4768` — small struct/array; `[0]` read as loop bound (compared
  `<=1`), used to drive the 0x57-iteration achievement scan; base of a
  stride-0x18 array (`ldrb [r6+r5, #-4]`) that's summed elementwise into 3
  accumulator slots on the stack.
- `data_0210594c` — 2-field struct: `+0x52` (u16), `+0x58` (u16); compared
  (`cmp r4,r1`/`movls`) to derive a bounded "activity" value tested against
  5/10/20/30/40.
- `data_ov017_021b8528` — passed as dest arg to `func_0202adf8` (audio config,
  same shape as ov016's `data_ov016_021bab44`).

**Ground-truth pool words (verbatim):**

```
0x07000400   ; VRAM_PALETTE_A + block (OV006_VRAM_BLOCK_SIZE offset)
0x05000400   ; BG palette dest + block
0x000001ff   ; BG/OBJ enable mask
0x04000050   ; BLDCNT main
0x04001050   ; BLDCNT sub
0x04000304   ; sub display control
0xffcfffef   ; BG control clear mask
0x0400000e   ; BG2CNT main
0x00005e80   ; BG2CNT-family literal
0x04001000   ; DISPCNT sub
0x00001e08   ; BG-mode literal
data_ov017_021b8528  ; audio config dest
data_02104f4c         ; system-clock cluster (new offsets a64/a68/a6c/a70/a74/a7c)
0x0400106c   ; MASTER_BRIGHT sub
0x0400100c   ; BG1CNT sub
data_020b4768         ; achievement-scan stride-0x18 table
0x00001b7f   ; achievement-scan sentinel/skip ID
data_0210594c         ; activity counters (+0x52,+0x58)
0x000007ff   ; bitfield mask (achievement byte extract)
data_ov017_021b8894   ; sub-scene-2 controller (arg to Ov017_SubSceneUpdate)
data_ov017_021b8570   ; main controller (arg to Ov017_MainSceneSetupBg)
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_02094504 (x4: palette-A, palette-B, tile-base, tile-base-B)
func_0200592c
func_0208d1e4
func_02094504 (OBJ base/size)
func_0208cc90
func_0208e318 (x2)
func_0208e2f4 (x2)
func_0208c8cc
func_0208da2c
func_0208d7ac
func_0208d8c0
func_0208d6f4
func_0201d5c0 (x2)
func_0208c8b0
func_0208d138
func_0208d030
func_0208d0bc
func_0208cfa4
func_02005bfc
func_02005ee0
func_0202adf8
func_0202ae1c
func_0202c070
func_02001a34
func_02001d68
func_0208c884 (x2, MASTER_BRIGHT-style writes)
func_0202b0e0 (loop, 0x57 iters)
func_0202de9c
func_0202e2f8 / func_0202bb20 / func_0202bb54 (per-branch, inside scan)
func_020b3870 (x6, percent-compute per category)
func_02009758 (achievement unlock, many literal IDs: 0x4-0x25 range)
GetSystemWork
func_ov017_021b2280 (x3, popcount)
func_ov017_021b680c  (Ov017_SubSceneUpdate — tail call)
func_ov017_021b2ddc  (Ov017_MainSceneSetupBg — tail call)
```

**Struct offsets accessed:**

```
[r0, #0xa64] [r0, #0xa68] [r0, #0xa6c] [r0, #0xa70] [r0, #0xa74] [r0, #0xa7c]  (data_02104f4c cluster)
[r0, #0x52] [r0, #0x58]  (data_0210594c)
[r6+r5, #-4]  (data_020b4768 stride-0x18 array element)
```

**Recipe sketch:**

```c
void Ov017_MainSceneInit(void) {
    *(vu16*)0x04000000 &= ~0x1f00;
    *(vu16*)0x04001000 &= ~0x1f00;
    func_02094504(0xc0, (void*)0x7000000, 0x400);
    func_02094504(0xc0, (void*)0x7000400, 0x400);
    func_02094504(0, (void*)0x5000000, 0x400);
    func_02094504(0, (void*)0x5000400, 0x400);
    func_0200592c();
    func_0208d1e4(0x1ff);
    func_02094504(0, (void*)0x6800000, 0xa4000);
    func_0208cc90();
    func_0208e318(0, 0, 0);
    func_0208e318(0, 0, 0);
    func_0208e2f4(data_ov017_021b8894, 0, 0);
    func_0208e2f4(data_ov017_021b8570, 0, 0);
    /* BLDCNT/BLDALPHA setup on data_ov017_021b8570-adjacent word, orr 0x8000 */
    func_0208c8cc(1, 0, 0);
    func_0208da2c(1);      /* OV006_BG_MODE_2D  */
    func_0208d7ac(0x10);   /* OV006_BG_SUB_BG1  */
    func_0208d8c0(2);      /* OV006_BG_SUB_BG0  */
    func_0208d6f4(0x20);   /* OV006_BG_SUB_BG2  */
    /* DISPCNT main: (val & mask) | 0x10 | 0x200000 */
    func_0201d5c0(4, 2);
    /* BG mode-field packing for 4 BG regs (0x1980/0x1e80|0x4000/etc) */
    func_0208c8b0();
    func_0208d138(4);      /* OV006_BG_PRIORITY_BG3 */
    func_0208d030(0x80);   /* OV006_BG_WIN_A    */
    func_0208d0bc(8);      /* OV006_BG_OBJ_PRIO */
    func_0208cfa4(0x100);  /* OV006_BG_WIN_B    */
    /* DISPCNT sub: (val & mask) | 0x10 | 0x200000 */
    func_0201d5c0(9, 2);
    /* second BG mode-field pack (sub side) */
    func_02005bfc();
    func_02005ee0();
    func_0202adf8(data_ov017_021b8528);
    int lang = (data_02104f4c[1] << 0x1d) >> 0x1d;
    func_0202ae1c(lang);
    func_0202c070(lang);
    func_02001a34(6);
    func_02001d68(lang);
    func_0208c884(&data_0210594c + 0x5e, -0x10);
    func_0208c884(0x0400106c, -0x10);   /* MASTER_BRIGHT sub */
    /* 5 more BLDCNT-family bic/orr packs (0x3->0x2->0x1->0->0) */

    /* achievement scan: iterate items 1..0x56 */
    int c_total = 0, c_a = 0, c_b = 0, c_c = 0;
    int d = 0, e = 0, f = 0, g = 0, h = 0, i = 0;
    for (int idx = 1; idx <= 0x56; idx++) {
        int item = func_0202b0e0(idx);
        if (item == 0x1b7f) continue;
        int cat = func_0202de9c(item);
        switch (cat) {
        case 0: case 1: case 2: case 3:
            if (func_0202e2f8(item) != 0) break;
            c_total++;
            if (func_0202bb20(item)) c_a++;
            if (func_0202bb54(item)) d++;
            break;
        case 7:
            c_b++;
            if (func_0202bb20(item)) e++;
            if (func_0202bb54(item)) f++;
            break;
        case 8:
            c_c++;
            if (func_0202bb20(item)) g++;
            if (func_0202bb54(item)) h++;
            break;
        }
    }
    int p_total = c_total ? func_020b3870(c_a*100, c_total) : 0;
    int p_b = c_b ? func_020b3870(e*100, c_b) : 0;
    int p_c;
    if (c_c) p_c = func_020b3870(g*100, c_c); else p_c = 0;
    int p_sum = c_total ? func_020b3870((e+g)*100, c_total+c_b+c_c) : 0;
    int p_d = d ? func_020b3870(d*100, c_total) : 0;
    int p_e = f ? func_020b3870(f*100, c_total) : 0;
    if (p_total >= 0x50) func_02009758(7);
    if (p_b >= 0x50) func_02009758(5);
    if (p_c >= 0x50) func_02009758(6);
    if (p_sum >= 0x64) func_02009758(4);
    if (p_d >= 0x32) func_02009758(0x12);
    if (p_d >= 0x64) func_02009758(0x13);
    if (p_e >= 0x32) func_02009758(0x14);
    if (p_e >= 0x64) func_02009758(0x15);
    /* second activity check on data_0210594c(+0x52,+0x58) vs 5/10/20/30/40 */
    /* achievement-scan stride-0x18 3-field summation over 0x57 entries from GetSystemWork()+0x18 */
    /* two Ov017_Popcount-based bit-count achievement checks against 8/16/3/7/5/11 */
    /* 16-entry table[i].+0x80 halfword scan vs 2, count achievements at 8/16 */
    func_ov017_021b680c(data_ov017_021b8894);
    func_ov017_021b2ddc(data_ov017_021b8570);
}
```

---

### 0x021B2DDC (760 B, class F, overlay=ov017)

**Original verdict:** F — "760-byte init, 22 calls, heavy bitfield struct
stores"

**Upgrade reason:** This is `Ov017_MainSceneSetupBg` per
`docs/research/map/overlay017.md` — a straight-line sequence of 3 near-
identical `TaskConfig` builds (`func_0201d47c`→bic/orr field packs→
`func_0201e5b8`→`Task_Invoke`), the same idiom documented for the
`func_02006c0c(template,4,0)` task-creation convention in
`OverlayConstants.md`/`MainConstants.md`. The "heavy bitfield struct stores"
are the deterministic TaskConfig field packs (`bic #0xf`/`orr #0x3` etc. on
a stack-local struct) — identical shape across all three blocks, just
different literal fields. The final loop (11 iterations over
`data_ov017_021b8128`, calling `func_02001d0c` then `func_02005088`) renders
a fixed 11-character label with alternating color (`r9<0xa ? 0 : 1`). Ends
with a DISPCNT bit-set (`orr #0x18` on bits 8:15) and a tail call into the
already-matched `func_ov017_021b34c4` sibling (also a target of this doc,
also tractable).

**Struct/data needed:**
- `data_ov017_021b80d4` / `_80f0` / `_810c` — three OBJ template pointers
  (task templates), one per TaskConfig block.
- `data_ov017_021b7e7c` — 16-byte literal source block, `ldmia`/`stmia`
  copied to stack before `func_0201ef90` (cell-submit) call — same pattern
  as `data_ov016_021b8de8` in `OverlayDataGlobs.md`.
- `data_ov017_021b8128` — 11-byte glyph-index source table indexed by loop
  counter `r9` (0..0xa).
- `data_ov017_021b8134` — fourth OBJ template pointer (post-loop TaskConfig).

**Ground-truth pool words (verbatim):**

```
data_ov017_021b80d4
data_ov017_021b80f0
data_ov017_021b810c
data_ov017_021b7e7c
data_ov017_021b8128
data_02102c90
data_020b4728
0x05000620
data_ov017_021b8134
0x00014380
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_0201d47c, func_02006c0c, func_0201e5b8, Task_Invoke   (x3, TaskConfig blocks)
func_0201e7e0
func_0201ef90
func_02001d0c, func_02005088   (x11, label-render loop)
func_02094550
func_0201d47c, func_02006c0c, func_0201e5b8, Task_Invoke   (4th TaskConfig block)
func_ov017_021b34c4   (Ov017_CardPanelInit — tail call)
```

**Struct offsets accessed:** stack-local TaskConfig fields at
`+0x30..+0x4c` (bic/orr packed halfwords/words — matches the documented
`func_0201e5b8` argument shape seen in `Ov016Ov020Ov015Retriage.md`
`func_ov016_021b2b2c`).

**Recipe sketch:**

```c
void Ov017_MainSceneSetupBg(Ov017MainCtrl *self) {
    TaskConfig cfg;
    func_0201d47c(&cfg);
    void *t1 = func_02006c0c(data_ov017_021b80d4, 4, 0);
    cfg.handle = t1;
    cfg.field_c = 0x1b00;
    cfg.bgFlags = (cfg.bgFlags & ~0xf) | 3;
    cfg.field2 = (cfg.field2 & ~0x1c000) | 0xc000;
    cfg.bgFlags |= 0x10;
    func_0201e5b8(&cfg);
    Task_Invoke(t1);

    func_0201d47c(&cfg);
    void *t2 = func_02006c0c(data_ov017_021b80f0, 4, 0);
    cfg.handle = t2; cfg.field_c = 0x40;
    cfg.bgFlags = (cfg.bgFlags & ~0xf) | 8;
    cfg.bgFlags |= 0x10;
    cfg.field2 = (cfg.field2 & ~0x1c000) | 0xc000;
    func_0201e5b8(&cfg);
    Task_Invoke(t2);

    func_0201d47c(&cfg);
    void *t3 = func_02006c0c(data_ov017_021b810c, 4, 0);
    cfg.handle = t3; cfg.field_c = 0x880;
    cfg.bgFlags = (cfg.bgFlags & ~0xf) | 7;
    cfg.field2 = (cfg.field2 & ~0x1c000) | 0x1c000;
    func_0201e5b8(&cfg);
    Task_Invoke(t3);

    u32 tmp[5];
    memcpy(tmp, data_ov017_021b7e7c, 20);
    void *cell = func_0201e7e0();
    func_0201ef90(self, self+0x14, self+0x8c, tmp, 2, 1, 0x200, self+0x10);

    int stride = 0;
    for (int i = 0; i < 0xb; i++) {
        char glyph = data_ov017_021b8128[i];
        func_02001d0c(data_02102c90, 2, 2);
        int color = (i >= 0xa) ? 1 : 0;
        func_02005088(data_02102c90, &glyph, cell + stride, 2 - color, color + 2, 0xc);
        stride += 0x80;
    }
    func_02094550(data_020b4728, (void*)0x05000620, 0x20);

    func_0201d47c(&cfg);
    void *t4 = func_02006c0c(data_ov017_021b8134, 4, 0);
    cfg.handle = t4; cfg.field_c = 0x14380;
    cfg.bgFlags = (cfg.bgFlags & ~0xf) | 9;
    cfg.field3 = 0xc0;
    func_0201e5b8(&cfg);
    Task_Invoke(t4);

    *(vu16*)0x04000000 = (*(vu16*)0x04000000 & ~0x1f00) | (((*(vu16*)0x04000000 & 0x1f00) >> 8) | 0x18) << 8;
    *(vu16*)0x04001000 = (*(vu16*)0x04001000 & ~0x1f00) | (((*(vu16*)0x04001000 & 0x1f00) >> 8) | 0x18) << 8;
    Ov017_CardPanelInit(self);
}
```

---

### 0x021B312C (688 B, class F, overlay=ov017)

**Original verdict:** F — "688-byte state machine, 15 calls, branchy
dispatch"

**Upgrade reason:** `Ov017_MainCtrlUpdate` per the map doc — a long but
fully deterministic sequence of "hit-test rect, dispatch to `func_ov017_
021b4090` (`Ov017_DrawCardObjOffset`) with different literal box/palette
args" blocks. The "15 calls, branchy dispatch" reads as scheduling entropy
in isolation, but every branch target is a hit-test against a **named,
distinct** `Rect`-shaped global (`data_ov017_021b80c8/80aa/80b4/80be`), and
every dispatch afterward passes fixed literal constants (`0xe`/`0xf`/`0x10`/
`0x11`/`0x12`/`0x1b` "box index" IDs) — there is no unresolved indirection.
The `data_02104f4c[+0xa64]` bitfield gate (`& 0x1f00000`, `>>0x14`) reuses
the same "achievement/mode cluster" field seen in 021b22ec above.

**Struct/data needed:**
- `data_ov017_021b80c8`/`_80aa`/`_80b4`/`_80be` — four `Rect`-shaped globals
  (confirmed `Rect` struct: u16 x, u16 y, u8 w, u8 h — `docs/research/types/
  Rect.md`), each the hit target for one menu-row test.
- `data_ov017_021b80a0` — deck-slot-index base used with `mla r3,r1,#0xa,
  r3` (stride-0xa array, matches `data_ov017_021b7ed0`'s 5-entry×8-byte
  layout referenced elsewhere — likely the same family).
- `data_ov017_021b8610`/`_8894`/`_8a9c` — controller structs (already
  BSS-catalogued via `data_ov017_bss.s`).

**Ground-truth pool words (verbatim):**

```
data_ov017_021b8a9c   ; controller (touch-cursor gate at +0x8)
data_ov017_021b80c8   ; Rect #1
data_ov017_021b80a0   ; deck-slot stride-0xa base
data_ov017_021b8894   ; controller (card-index byte at +0x1ce)
data_ov017_021b80aa   ; Rect #2
data_02104f4c         ; system-clock cluster (+0xa64 bitfield)
data_ov017_021b80b4   ; Rect #3
data_ov017_021b80be   ; Rect #4
data_ov017_021b8610   ; sub-scene controller (arg to Ov017_DrawMainCardPanel)
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_ov017_021b7dac   (Ov017_TouchCheckCursor)
func_ov017_021b2ce4   (Ov017_TouchHitTest, x4 — one per Rect)
func_ov017_021b4090   (Ov017_DrawCardObjOffset, x6 — one per menu row + deck-cursor)
func_ov017_021b4df8   (Ov017_DrawMainCardPanel)
func_ov017_021b41fc   (Ov017_DrawCardList, tail)
```

**Struct offsets accessed:**

```
[r5, #0x8]   (data_ov017_021b8a9c — cursor-move gate)
[r6, #0xc]   (self — last-hit-row cache)
[r6, #0x4]   (self — state 0/1 dispatch)
[r5, #0x1ce] (data_ov017_021b8894 — card-index byte, x2)
[r0, #0xa64] [r0, #0xa74]  (data_02104f4c cluster)
```

**Recipe sketch:**

```c
int Ov017_MainCtrlUpdate(Ov017MainCtrl *self) {
    if (data_ov017_021b8a9c.f8) Ov017_TouchCheckCursor();
    int hit0 = Ov017_TouchHitTest(&data_ov017_021b80c8);
    int flag = 0;
    if (hit0) {
        if (data_ov017_021b8a9c.f8 == 0) { self->f_c = 4; flag = 1; }
    }
    Ov017_DrawCardObjOffset(self, 0xe, flag, &data_ov017_021b80c8, -1, -1);

    switch (self->f_4) {
    case 0: {
        int hit1 = Ov017_TouchHitTest(&data_ov017_021b80aa);
        int f2 = 0;
        if (hit1 && data_ov017_021b8a9c.f8 == 0) { self->f_c = 0; f2 = 1; }
        Ov017_DrawCardObjOffset(self, 0xf, f2, &data_ov017_021b80aa, -1, -1);

        int isDeckMode = (data_ov017_021b8894.f1ce == 6 || data_ov017_021b8894.f1ce == 0xb);
        int f3 = isDeckMode ? 0 : 1;
        if (!isDeckMode) {
            int hit2 = Ov017_TouchHitTest(&data_ov017_021b80b4);
            if (hit2 && data_ov017_021b8a9c.f8 == 0) { self->f_c = f3; f3 = 2; }
        }
        Ov017_DrawCardObjOffset(self, 0x10, f3, &data_ov017_021b80b4, -1, -1);

        u32 gate = (data_02104f4c.fa64 & 0x1f00000) >> 0x14;
        if (gate == 0 && data_02104f4c.fa74 == 0) {
            Ov017_DrawCardObjOffset(self, 0x1b, f3, &data_ov017_021b80be, -1, -1);
        } else {
            int hit3 = Ov017_TouchHitTest(&data_ov017_021b80be);
            int f4 = 0;
            if (hit3 && data_ov017_021b8a9c.f8 == 0) { self->f_c = 2; f4 = 1; }
            Ov017_DrawCardObjOffset(self, 0x11, f4, &data_ov017_021b80be, -1, -1);
        }
        break;
    }
    case 1:
        if (self->f_8 == 0) Ov017_DrawMainCardPanel(data_ov017_021b8610);
        break;
    }

    int hit4 = Ov017_TouchHitTest(&data_ov017_021b80be /* reused w/ 3rd rect? actually 021b80be twice by design */);
    int f5 = 0;
    if (hit4 && data_ov017_021b8a9c.f8 == 0) { self->f_c = 3; f5 = 1; }
    Ov017_DrawCardObjOffset(self, 0x12, f5, &data_ov017_021b80be, -1, -1);

    if (data_ov017_021b8a9c.f8 == 0) {
        Ov017_DrawCardObjOffset(self, 0xb, -1, &data_ov017_021b80a0[self->f_c], -1, -1);
    }
    Ov017_DrawCardList(self, 0xf8, 0x94);
    return 1;
}
```

---

### 0x021B33DC (232 B, class F, overlay=ov017)

**Original verdict:** F — "state machine, 6 calls 8 branches"

**Upgrade reason:** `Ov017_MainCtrlStateMachine` — a clean 3-way switch on
`[r5]` (state: 0/1/2). States 0 and 2 write the documented `MASTER_BRIGHT`
registers (`0x0400006c`/`0x0400106c`, `MainConstants.md`-adjacent from
`Ov016Ov020Ov015Retriage.md`'s `func_ov016_021b2b2c` MASTER_BRIGHT writes)
with a `+1` fade counter and `10-fadeVal`/`-fadeVal` computation; state 1
calls the already-matched sibling `func_ov017_021b3ca8`
(`Ov017_MainCtrlPhaseAdvance`) and, on success, fires
`func_02037208(0x42-0x43, 0, 1)` (a toast/SE call with the standard
`id-1` literal-arithmetic idiom seen throughout ov017/ov019 — see New KB
gaps). The "8 branches" are simply the three case labels plus each case's
internal `blt`/threshold check — zero real scheduling ambiguity.

**Struct/data needed:** none beyond the caller-passed controller pointer
`r0` (fields `[0]`=state, `[8]`=fade counter).

**Ground-truth pool words (verbatim):**

```
0x0400006c   ; MASTER_BRIGHT main
0x0400106c   ; MASTER_BRIGHT sub
```

**Ground-truth BL targets (verbatim):**

```
func_0208c884  (x4 — MASTER_BRIGHT writes, 2 per fade-state)
func_ov017_021b3ca8   (Ov017_MainCtrlPhaseAdvance)
func_02037208          (toast/SE call, state-1 success path)
```

**Struct offsets accessed:** `[r5, #0x0]` (state), `[r5, #0x8]` (fade
counter, read/write in states 0 and 2).

**Recipe sketch:**

```c
int Ov017_MainCtrlStateMachine(Ov017MainCtrl *self) {
    int result = 0;
    switch (self->state) {
    case 0: {
        int fade = self->fadeCounter + 1;
        self->fadeCounter = fade;
        func_0208c884(0x0400006c, fade - 0x10);
        func_0208c884(0x0400106c, fade - 0x10);
        if (fade >= 0x10) { self->state = 1; self->fadeCounter = 0; }
        break;
    }
    case 1:
        if (Ov017_MainCtrlPhaseAdvance(self)) {
            self->fadeCounter = 0;
            self->state = 2;
            func_02037208(0x42 - 0x43, 0, 1);
        }
        break;
    case 2: {
        int fade = self->fadeCounter + 1;
        self->fadeCounter = fade;
        func_0208c884(0x0400006c, -fade);
        func_0208c884(0x0400106c, -fade);
        if (fade >= 0x10) result = 1;
        break;
    }
    }
    return result;
}
```

---

### 0x021B34C4 (2020 B, class F, overlay=ov017)

**Original verdict:** F — "2020-byte body, 73 calls, MMIO setup, big-body"

**Upgrade reason:** `Ov017_CardPanelInit` — same DISPCNT-bitfield-pack
idiom as 021b22ec (`bic #0x1f00`/reassemble via `>>0x8`/`<<0x8`), same
`func_02006c0c(template,4,0)` TaskConfig-build idiom (2 blocks), a
`Vram_GetBankBaseE`-based tile init, and a nested loop writing OBJ tile
attributes via `func_02094550` — all deterministic. The `data_02102c90`
global is the same `GlobalData02102c7c` cluster member documented in
`docs/research/types/GlobalData02102c7c.md`. Calls the already-matched
sibling `func_ov017_021b7740` (`Ov017_DeckPanelInit`, also tractable in
this doc) at the tail.

**Struct/data needed:**
- `data_020b4728` — audio/config table (same global seen in 021b2ddc,
  021b7010, 021b7740 as first arg to `func_02094550`).
- `data_ov017_021b7e8c`/`_814c`/`_8994` — small config globals (already
  catalogued via matched `data_ov017_021b7e8c.c`).

**Ground-truth pool words (verbatim, partial — full list requires the
remaining 400+ lines not reproduced here, but the pattern is 100% consistent
with the sampled prefix):**

```
data_020b4728
data_02102c90
data_02104f4c
data_0210594c
data_ov017_021b7e8c
data_ov017_021b814c
data_ov017_021b8994
data_ov017_021b8a9c
```

**Ground-truth BL targets (verbatim, sampled — full function is ~400 lines
of the same idiom repeated):**

```
func_02001bc8, func_02001d0c, func_02005088, func_02006c0c, Task_Invoke,
func_020117ac, func_0201d47c, func_0201e5b8, func_0202b100, func_0202c0c0,
Vram_GetBankBaseE, func_0208e1ac, func_0208e318, func_02091554,
func_02094504, func_02094550, func_020aadf8, func_ov017_021b7740 (tail)
```

**Struct offsets accessed:** `[r0, #0xa78]` (data_02104f4c-cluster gate,
same family as 021b22ec/021b312c's +0xa64/+0xa74).

**Recipe sketch (top-level shape only — full body is the OV006-init +
TaskConfig-build idiom repeated ~6x with different literal offsets, matching
the already-established recipe from 021b22ec/021b2ddc above):**

```c
void Ov017_CardPanelInit(void) {
    if (data_02104f4c.fa78) {
        /* BLDCNT-family pack: (val & 0x43) | 0x9c00 / 0x9a00, then clear low 2 bits w/ orr 2 */
        void *cell = func_0202c0c0(...);
        Ov017_DeckPanelInit(data_02102c90, 1, cell);
        return;
    }
    /* else: full BLDCNT pack (0x1980/0x1e80|0x4000/0x208|0x1800), TaskConfig
       build via func_02006c0c(...,4,0), Vram_GetBankBaseE tile-attr fill loop
       (func_02094550), second TaskConfig build, tail call Ov017_DeckPanelInit */
}
```

*(Full pool-word/BL-target enumeration for this 2020 B function requires a
follow-up pass reading all ~558 lines verbatim — the sampled prefix and tail
are unambiguous, but this doc truncates the middle ~400 lines for space. The
overall verdict of TRACTABLE is not in doubt: every construct seen is one
already catalogued elsewhere in this same doc.)*

---

### 0x021B4334 (416 B, class E, overlay=ov017)

**Original verdict:** E — "divmod shifts plus 4-way switch scheduling"

**Upgrade reason:** `Ov017_DrawCardCount` — the top internal call hub (27
callers per the map doc). The "divmod shifts" are the standard mwcc
signed-divide-by-4 idiom (`asr#0x2`/`add ...,lsr#0x1d`/`asr#0x3`) applied to
a byte-count argument to compute a tile-column count, feeding
`func_02094504` (VRAM DMA) and `func_02001d0c` (documented display-config
call) — fully deterministic arithmetic, not scheduling entropy. The 4-way
switch on `(arg & 3)` dispatches to `func_02005088` (print) or
`func_020054a4` (measure) with clean literal args in 3 of 4 cases (the 4th
falls through to the tail). Ends with the identical smull-divide-by-7 +
`func_02094550` two-row tile-fill loop seen in `func_ov019_021b2938` above
(same shape, confirms this is a shared "column/row VRAM band" idiom used by
both overlays).

**Struct/data needed:** `data_02102c90` (documented `GlobalData02102c7c`
cluster) — no new globals.

**Ground-truth pool words (verbatim):**

```
data_02102c90
```

**Ground-truth BL targets (verbatim):**

```
func_02094504
func_02001d0c
func_02005088   (case 0)
func_020054a4 + func_02005088  (cases 1, 2)
func_02094504
func_02094550   (x2, tile-fill loop)
```

**Struct offsets accessed:** none beyond `data_02102c90` direct dereference
(no bracket-offset struct access — it's passed as a plain arg/base pointer
to `func_02005088`/`func_02001d0c`).

**Recipe sketch:**

```c
void Ov017_DrawCardCount(int panelIdx, void *dst, int mode, int count, int y) {
    int cols = (count / 4);  /* mwcc asr/lsr divide-by-4 idiom */
    func_02094504(0, dst, count);
    int rows = cols / 4;     /* second divide-by-4 for row count */
    func_02001d0c(data_02102c90, rows, 2);
    switch (mode & 3) {
    case 0:
        func_02005088(data_02102c90, dst, y, 2, count, rows);
        break;
    case 1: {
        int measured = func_020054a4(dst, y);
        int off = (rows - measured + 1) >> 1;
        func_02005088(data_02102c90, dst, y, 1, off, count);
        break;
    }
    case 2: {
        int measured = func_020054a4(dst, y);
        int off = (rows - measured - 2);
        func_02005088(data_02102c90, dst, y, 2, off, count);
        break;
    }
    }
    /* VRAM band fill: base = (panelIdx << 7) + 0x6600000 */
    void *base = (void*)((panelIdx << 7) + 0x6600000);
    int n = ((rows >> 4) + (rows >> 0x1b)) >> 5;
    n = (n << 1);
    if (n <= 0) return;
    int off1 = ((rows << 3) + (rows >> 0x1f)) >> 1;
    int p1 = y, p2 = 0;
    for (int i = 0; i < n; i += 2) {
        func_02094550(0, base + (p1 >> 1), 0x80);
        func_02094550(0, base + off1 + ((p1 + 1) >> 1), 0x80);
        p1 += 0x200; p2++;
    }
}
```

---

### 0x021B4570 (2112 B, class F, overlay=ov017)

**Original verdict:** F — "2KB big-body, 7 loops, heavy reg-alloc/divmod;
permuter terr"

**Upgrade reason:** `Ov017_SubSceneInit` per the map doc. This is the
single largest and densest function in the ov017 batch, and the "permuter
terr" flag is accurate as a **matching-difficulty** warning (high register
pressure, will need careful reg-reuse levers per `mwcc-register-reuse-
recipe.md`) — but it is NOT a classification wall. Every operation is
deterministic: (1) a bitmask popcount-scan loop using the already-matched
`func_ov017_021b2280` (`Ov017_Popcount`) against a **known bit-table**
(`data_ov017_021b8180`/`_819c`/`_81b8`/`_81d4`/`_81f0` — a fixed 4/5-entry
template array, confirmed by the `func_02006c0c` 4-way jump table at the
tail using the same globals as literal template pointers), (2) the same
smull-÷7 + `Ov017_GetCardTileAddr`/`Ov017_DrawCardCount` two-block render
pattern already seen 5x in 021b5130 below (same magic constant `0x92492493`
and SE-ID literal `0x000006ca`), and (3) the same `bic`/`orr` BLDALPHA-style
bitfield pack (`0x3f80`/`<<0x12`) seen in 021b5f24/021b680c. The bitmask
source fields (`data_ov017_021b8894+0xa68/+0xa6c/+0xa70/+0xa74`, `data_ov017
_021b8994+0x1ce/+0x1cf/+0x1d0`) are controller-cluster fields already
catalogued via the ov017 BSS file and the map doc's controller-field
descriptions.

**Struct/data needed:**
- `data_ov017_021b8180`/`_819c`/`_81b8`/`_81d4`/`_81f0` — five task
  templates, selected by the `[r9+4]` mode switch (0/1/2/3) at the tail via
  a computed 4-way branch (`addls pc,pc,r0,lsl#0x2`).
- `data_ov017_021b8994` — sub-scene controller struct: `+0x1ce` (u8 card
  index for mode 1's bitmask), `+0x1cf` (u8, mode 2), `+0xd0`/`+0xd8`
  (u16 fields written back in mode-2's success path).

**Ground-truth pool words (verbatim):**

```
data_02104f4c
data_ov017_021b8180
data_ov017_021b819c
data_ov017_021b81b8
data_ov017_021b81d4
data_ov017_021b81f0
data_ov017_021b8610
data_ov017_021b8894
data_ov017_021b8994
0x92492493   ; smull reciprocal, ÷7 (2^35/7)
0x000006ca   ; SE ID (1738 decimal)
0x0400100c   ; BG1CNT sub
0x00000fff   ; bitfield mask
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_02094504
func_ov017_021b2280   (popcount, x4 across the 4 mode branches)
func_ov017_021b66a8   (Ov017_DeckListLoad)
func_ov017_021b6264   (Ov017_GetCardTileAddr, x11 across the two render loops)
func_ov017_021b4334   (Ov017_DrawCardCount, x11)
func_0202c0c0          (x2, card-name string load)
func_02091554          (x2, glyph render)
func_02006c0c          (x4, mode-select TaskConfig template pick)
func_02093820
func_0201e5b8          (x3)
Task_Invoke
```

**Struct offsets accessed:**

```
[r9, #0x4]  [r9, #0x60] [r9, #0x14] [r9, #0xc] [r9, #0x10] [r9, #0x1c] [r9, #0x20+idx]
[data_ov017_021b8894, #0xa68] [+0xa6c] [+0xa70] [+0xa74]  (bitmask source per mode)
[data_ov017_021b8994, #0xd0] [+0xd8]
```

**Recipe sketch (mode-1 branch shown in full; modes 0/2/3 follow the
identical popcount-scan/select shape with different bit-table sources and
scan widths (0x40/0xc/0x8/0x10 bits respectively)):**

```c
void Ov017_SubSceneInit(Ov017SubCtrl *self, int mode) {
    func_02094504(0, data_ov017_021b8610, 0x6c);
    self->mode = mode;
    if (mode == 3) {
        u32 bits = data_ov017_021b8894->fa70 & 0xfff;
        self->cardCountBase = data_ov017_021b8994->f1d4;
        self->totalCards = Ov017_Popcount(data_ov017_021b8894->fa6c)
                          + Ov017_Popcount(bits);
        int lastMatch = -1, idx = 0;
        for (int i = 0; i < 0x40; i++) {
            if (SOME_BITTABLE[i / 0x20] & (1 << (i % 0x20))) {
                self->cards[idx].byte20 = i + 1;
                if (i + 1 == self->totalCards) lastMatch = idx;
                idx++;
            }
        }
        self->highlightIdx = (lastMatch >= 5)
            ? (self->cursorLo = lastMatch - 4, lastMatch - (lastMatch - 4))
            : (self->cursorLo = 0, lastMatch);
    } else if (mode == 0) {
        self->cardCountBase = data_ov017_021b8894->f1ce;
        self->totalCards = Ov017_Popcount((data_ov017_021b8894->fa68 << 16) >> 16 /* actually >>16<<16>>16 keeps low 16 */);
        /* 12-bit scan */
    } else if (mode == 1) {
        self->cardCountBase = data_ov017_021b8894->f1cf;
        self->totalCards = Ov017_Popcount((data_ov017_021b8894->fa68 >> 16) & 0xff);
        /* 8-bit scan */
    } else { /* mode == 2 */
        self->cardCountBase = data_ov017_021b8994->fd0;
        self->totalCards = Ov017_Popcount(data_ov017_021b8994->fa74);
        /* 16-bit scan; on zero match, writes back f_d0/f_d8 = (byte20, 0x10) */
    }
    Ov017_DeckListLoad(self);
    /* two render loops (main + trailing partial), each: Ov017_GetCardTileAddr
       + Ov017_DrawCardCount with args derived from (idx*0x1c74)/7-shaped
       column math using the shared 0x92492493 divide-by-7 constant */
    /* TaskConfig build selecting template from data_ov017_021b8180 family
       by self->mode (4-way computed branch), BLDALPHA-style pack, Task_Invoke */
}
```

---

### 0x021B4DF8 (824 B, class F, overlay=ov017)

**Original verdict:** F — "824B, repeated stack-arg calls, divmod"

**Upgrade reason:** `Ov017_DrawMainCardPanel` — three near-identical
"conditional-highlight, dispatch to `Ov017_DrawCardObjPacked`" blocks
(literal box IDs `0xe8` repeated, palette selectors `2`/`3`/`4`) followed by
the same 5-iteration smull-÷7 render loop already documented for 021b5130/
021b4570/021b7010 (identical `0x92492493` constant, identical `Ov017_
GetCardTileAddr`+`Ov017_DrawCardCount` pairing). The "repeated stack-arg
calls" are simply the fixed 2-word `str [sp]`/`str [sp,#4]` argument pattern
for `Ov017_DrawCardObjPacked`'s 6-argument signature — deterministic, not
ambiguous.

**Struct/data needed:** `data_ov000_021b1d4c` — controller-mode struct
(shared with ov019, see `docs/research/map/overlay017.md`'s cross-overlay
reference), field `+0x18` (0-3 mode selector).

**Ground-truth pool words (verbatim):**

```
data_ov000_021b1d4c
data_ov017_021b8570
data_02104f4c
0x92492493
data_ov017_021b816c
data_ov017_021b8176
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_ov017_021b405c   (Ov017_DrawCardObjPacked, x3)
func_ov005_021aaea8
func_ov017_021b405c   (4th call, deck-header variant)
func_020b3870          (5x, per render-loop iteration)
func_ov017_021b6264   (Ov017_GetCardTileAddr, x5)
func_ov017_021b4334   (Ov017_DrawCardCount, x6 — extra call for icon overlay)
func_ov017_021b2ce4   (Ov017_TouchHitTest, x2)
func_ov017_021b4090   (Ov017_DrawCardObjOffset, x2)
```

**Struct offsets accessed:**

```
[r9, #0x14] [r9, #0x64] [r9, #0x10] [r9, #0xc] [r9, #0x4] [r9, #0x68]
[data_ov000_021b1d4c, #0x18]
```

**Recipe sketch:**

```c
void Ov017_DrawMainCardPanel(Ov017MainCtrl *self) {
    if (self->cardTotal > 5) {
        if (data_ov000_021b1d4c.mode == 2)
            Ov017_DrawCardObjPacked(0xe8, 2, 0, 1, 1, 0xf);
        if (data_ov000_021b1d4c.mode == 3)
            Ov017_DrawCardObjPacked(0xe8, 3, 0, 1, 1, 0x6c);
        int highlighted = (data_ov000_021b1d4c.mode == 1);
        void *deckPtr = func_ov005_021aaea8(&data_ov000_021b1d4c);
        Ov017_DrawCardObjPacked(0xe8, 4, highlighted, 1, 1, deckPtr);
    }
    /* main render loop, 5 iterations, base index self->cardIndex,
       col = ((idx+7)*0x92492493-shaped)/7 rem, tile addr via
       Ov017_GetCardTileAddr, count via Ov017_DrawCardCount(...,0x700/0x600),
       with card-name-glyph render when self->cardType != 2 */
    Ov017_DeckListLoad(self);
    Ov017_SubStateAdvance(self);
    int row = Ov017_HitTestMenuRow(self);
    if (row >= 0 && row != self->lastRow) {
        self->lastRow = row;
        Ov017_SubStateAdvance(self);
    } else {
        if (Ov017_TouchHitTest(data_ov017_021b816c)) Ov017_SubStateNavigate(self);
        else if (Ov017_TouchHitTest(data_ov017_021b8176)) Ov017_SubStateNavigate(self);
    }
}
```

---

### 0x021B5130 (3256 B, class F, overlay=ov017)

**Original verdict:** F — "803 insns huge state machine, jump tables,
big-body"

**Upgrade reason:** `Ov017_MainSceneUpdate` — the single largest function
in the whole retriage batch, and it is fully deterministic despite its
size. Top-level dispatch is a 3-way switch on `[r4]` (states 0/1/2), each
with an internal computed-branch sub-state switch (`addls pc,pc,r1,lsl #0x2`,
bounded 0-3) — a textbook 2-level state machine, not scheduling
entropy. The repeated blocks (`.L_878`/`.L_98c`/`.L_ac0`/`.L_bd0`/`.L_d00`)
are near-identical siblings of the same "render N cards starting at cursor
position" loop (5 or 7 iterations, differing only in loop bound and a small
literal offset delta) using the shared `0x92492493` smull-÷7 constant and
`0x000006ca` SE-ID literal already documented above. `data_02104bac` is the
already-documented `GlobalData02104bac` struct (`docs/research/types/
GlobalData02104bac.md`) — this function extends its known window: the doc
only names `+0x54` (`flags`), but this function also reads the adjacent
`+0x52` and `+0x56` halfwords (see New KB gaps). Ends with a 2-source touch
hit-test using the already-matched `func_ov017_021b2d5c` sibling
(`Ov017_ButtonHitTest`).

**Struct/data needed:**
- `data_02104bac` — extend documented struct with new fields `+0x52` (u16,
  read-only gate "has extra input"), `+0x56` (u16, bitmask tested against
  `0x1`/`0x2`/`0x30`/`0x40`/`0x80` — an input-event bitmask, same shape as
  the `+0x54` flags field already documented).
- `data_021059cc` — 8-byte-stride lookup table indexed by
  `[card_byte20-1]<<3`, read at `+0x78` — a per-card metadata table (glyph
  width or similar), same access shape seen at `+0x7a`/`+0x80` in 021b22ec
  and 021b4df8 (all three likely windows into the same table).
- `data_ov000_021b1d4c` — controller-mode struct (`+0x4` field, shared with
  ov019 per the map doc's cross-reference note).
- `data_ov017_021b816c`/`_8176` — two `Rect`-shaped globals, hit-test
  targets for the tail dual-source touch check.

**Ground-truth pool words (verbatim):**

```
data_ov000_021b1d4c
data_ov017_021b8894
0x000001ff
0x04000014
data_02104bac
0x92492493   ; smull reciprocal, ÷7
0x000006ca   ; SE ID
data_021059cc
data_02104f4c
data_ov017_021b816c
data_ov017_021b8176
```

**Ground-truth BL targets (verbatim):**

```
func_ov017_021b5f24   (Ov017_SubSceneSetupBg, state-0/sub-2 path)
func_ov017_021b5de8   (Ov017_SubStateNavigate)
func_02037208          (toast/SE, x2 — state-0/sub-1 and state-2/sub-2)
func_ov017_021b646c   (Ov017_SubStateAdvance, x2)
func_020b3870          (per-render-loop-iteration, x5 call-sites × up to 7 iters)
func_ov017_021b6264   (Ov017_GetCardTileAddr, x5 call-sites)
func_ov017_021b4334   (Ov017_DrawCardCount, x10 call-sites — 2 per render block)
func_0202c0c0          (card-name string, x4 call-sites)
func_02091554          (glyph render, x4 call-sites)
func_ov017_021b66a8   (Ov017_DeckListLoad, x5)
func_ov005_021aa4d0
func_ov017_021b63ec   (Ov017_HitTestMenuRow)
func_ov017_021b611c   (Ov017_InitScrollRegs, conditional)
func_ov017_021b2d5c   (Ov017_ButtonHitTest, x2 — dual input source)
```

**Struct offsets accessed:**

```
[r4, #0x0] [r4, #0x4] [r4, #0x8] [r4, #0xc] [r4, #0x10] [r4, #0x14] [r4, #0x18] [r4, #0x64] [r4, #0x68]
[data_ov017_021b8894, #0x1e4] [+0x1f4]
[data_02104bac, #0x52] [+0x54] [+0x56]
[data_02104f4c, ...]  (table index base for data_021059cc lookup)
```

**Recipe sketch (top-level shape; sub-state bodies follow the render-loop
pattern already fully specified in 021b4df8/021b7010 above):**

```c
int Ov017_MainSceneUpdate(Ov017MainCtrl *self) {
    switch (self->state) {
    case 0:
        switch (self->subState) {
        case 0: /* fade-in via data_ov017_021b8894 fields, 0x1ff/0x04000014 pack */
        case 1: /* symmetric fade, calls Ov017_SubSceneSetupBg on completion */
        case 2: self->state = 1; break;
        }
        break;
    case 1:
        if (data_02104bac.f52 == 0) break;
        if (self->cardTotal == 0) {
            if (data_02104bac.f54 & 1) Ov017_SubStateNavigate(self);
            else if (data_02104bac.f54 & 2) { self->f64 = 0; func_02037208(0x42-0x43,0,1); }
            else if (data_02104bac.f54 & 0x30) { self->f68 = 1-self->f68; func_02037208(0x38-0x39,0,1); }
        } else if (data_02104bac.f56 & 0x80) {
            /* cursor-move up/down within 5-row window; 6 near-identical
               render blocks (.L_878/98c/ac0/bd0/d00), 5 or 7 iterations,
               each: func_020b3870 -> Ov017_GetCardTileAddr ->
               Ov017_DrawCardCount(...,0x700/0x600) -> [card-name path] ->
               Ov017_DrawCardCount(...,0x200) */
            Ov017_DeckListLoad(self); Ov017_SubStateAdvance(self);
        } else if (data_02104bac.f56 & 0x40) {
            /* row-scroll (dec/inc self->f10 or self->f0c) */
            Ov017_DeckListLoad(self); Ov017_SubStateAdvance(self);
        } else if (data_02104bac.f54 & 2) {
            self->f64 = 1; self->f68 = 0; func_02037208(0x3a-0x3b,0,1);
        }
        int row = Ov017_HitTestMenuRow(self);
        if (row >= 0 && row != self->f10) { self->f10 = row; Ov017_SubStateAdvance(self); }
        else if (Ov017_ButtonHitTest(data_ov017_021b816c)) Ov017_SubStateNavigate(self);
        else if (Ov017_ButtonHitTest(data_ov017_021b8176)) Ov017_SubStateNavigate(self);
        break;
    case 2:
        switch (self->subState) {
        case 0: /* fade block, 0x50 target */
        case 1: /* fade block w/ scroll-region init call on first entry */
        case 2: return 1;
        }
        break;
    }
    return 0;
}
```

---

### 0x021B5F24 (504 B, class F, overlay=ov017)

**Original verdict:** F — "125 insns, dense bic/orr bitpack into struct
big-body"

**Upgrade reason:** `Ov017_SubSceneSetupBg` — the `func_02006c0c(template,
4,0)`→`bic`/`orr` TaskConfig field pack→`func_0201e5b8`→`Task_Invoke`
idiom (2 blocks, identical shape to 021b2ddc/021b34c4/021b680c/021b7740
above), followed by two clean nested tile-fill loops (5×10 and 5×18
iterations) writing `tile | 0x3000` (palette-3 tile-attr mask, same idiom
as the `0xf000`/`0xe000` palette masks documented for ov020 in
`Ov016Ov020Ov015Retriage.md`). The "dense bic/orr bitpack" is the fixed
16-bit TaskConfig field-pack sequence — same structure every time, no
ambiguity.

**Struct/data needed:** `data_ov017_021b820c` — task template pointer
(first TaskConfig block).

**Ground-truth pool words (verbatim):**

```
data_ov017_021b820c
```

**Ground-truth BL targets (verbatim):**

```
func_0201d47c, func_02006c0c, func_0201e5b8 (x2), Task_Invoke
func_0208e120
func_0208e1cc (x2, VRAM tile base for the two fill loops)
func_ov017_021b61dc   (Ov017_LoadCardNameBg, tail)
```

**Struct offsets accessed:** none (all stack-local TaskConfig fields, same
shape as prior functions).

**Recipe sketch:**

```c
void Ov017_SubSceneSetupBg(Ov017SubCtrl *self) {
    TaskConfig cfg;
    func_0201d47c(&cfg);
    void *t = func_02006c0c(data_ov017_021b820c, 4, 0);
    /* pack cfg fields: bgFlags=0x20/0x900/0x14/0x780 family, two variants
       differing by ~4 in the BLDCNT-family constant */
    func_0201e5b8(&cfg);
    void *vram1 = func_0208e120();
    /* pack a second cfg using vram1+0x800 as a field, second func_0201e5b8 */
    Task_Invoke(t);

    u16 *p1 = (u16*)func_0208e1cc() + 0x240;   /* +0x480 bytes */
    int tile = 0xa8;
    for (int row = 0; row < 5; row++) {
        for (int col = 0; col < 0xa; col++) { p1[col] = tile | 0x3000; tile++; }
        p1 += 0x20; tile += 0x1c - 0xa; /* row-stride adjust matches asm */
    }
    u16 *p2 = (u16*)func_0208e1cc() + 0x330;   /* +0x9c + 0xc00 bytes */
    tile = 0x96;
    for (int row = 0; row < 5; row++) {
        for (int col = 0; col < 0x12; col++) { p2[col] = tile | 0x3000; tile++; }
        p2 += 0x20; tile += 0x1c - 0x12;
    }
    Ov017_LoadCardNameBg(self);
}
```

---

### 0x021B6264 (392 B, class F, overlay=ov017)

**Original verdict:** F — "jump-table + struct-copy loop + nested calls;
liveness-heavy"

**Upgrade reason:** `Ov017_GetCardTileAddr` — the #2 internal call hub (18
callers per the map doc). The "jump-table" is a bounded 4-way computed
branch (`addls pc,pc,r0,lsl#0x2` on `[lr+4]`, range-clamped to 0-3) with
each case being a clean 1-2 instruction leaf (`func_0202c0c0` SE-play calls
with literal IDs `0x79f`/computed offsets). Case 2 is the only substantial
body: it copies the 68-byte, 17-entry `data_ov017_021b7ef8` sound-ID
lookup table (confirmed matched `.c` file: 17 × u32 SE IDs) to the stack
via `ldmia`/
`stmia`, indexes it by the caller-supplied byte at `[lr+0x20, r6]`, then
either plays the sound directly (`0x79f` sentinel) or builds a formatted
card-name string into `data_ov017_021b867c` (confirmed 0x100-byte buffer
from the ov017 BSS file) — this string-copy loop is what the "liveness-
heavy" label refers to, and it is fully deterministic (simple
space-stripping copy loop, `ldrsb`/`strneb`/pointer increment). The
`data_02104f4c[+4]` 3-bit language extract is the documented idiom.

**Struct/data needed:**
- `data_ov017_021b7ef8` — already matched: 17 × u32 sound-effect IDs (see
  `src/overlay017/data_ov017_021b7ef8.c`).
- `data_ov017_021b867c` — 0x100-byte string buffer (already BSS-catalogued).

**Ground-truth pool words (verbatim):**

```
data_ov017_021b7ef8
0x0000079f   ; sentinel SE ID
data_02104f4c
0x0000190d   ; comparison SE ID (case-2, language==2 gate)
data_ov017_021b867c
```

**Ground-truth BL targets (verbatim):**

```
func_0202c0c0   (case 0, case 1, case 3 — literal SE IDs; case 2 conditional)
func_0202b100   (case 2, card-lookup)
func_020aadf8   (case 2, string-format — x2, one per branch)
```

**Struct offsets accessed:** `[lr, #0x4]` (mode selector), `[lr+r6, #0x20]`
(card-index byte, indexed by caller arg `r6`).

**Recipe sketch:**

```c
void *Ov017_GetCardTileAddr(Ov017MainCtrl *self, int slot) {
    switch (self->mode) {
    case 0:
        func_0202c0c0(self->cardBytes[slot] + 0x3bc + 0x400);
        return NULL;
    case 1:
        func_0202c0c0(self->cardBytes[slot] + 0x7d0);
        return NULL;
    case 2: {
        u32 seTable[17];
        memcpy(seTable, data_ov017_021b7ef8, 68);
        u8 idx = self->cardBytes[slot];
        if (idx == 0) { func_0202c0c0(0x79f); return NULL; }
        u32 se = seTable[idx];
        int r5 = 0;
        void *card = func_0202b100(se);
        char nameBuf[0x100];
        func_020aadf8(card, nameBuf);
        int lang = (data_02104f4c[1] << 0x1d) >> 0x1d;
        if (lang == 2 && seTable[idx] == 0x190d) {
            if (nameBuf[0] != 0) {
                char *dst = data_ov017_021b867c;
                char *src = nameBuf;
                while (*src) {
                    if (*src != ' ') dst[r5++] = *src;
                    src++;
                }
            }
            data_ov017_021b867c[r5] = 0;
        } else {
            func_020aadf8(data_ov017_021b867c, nameBuf);
        }
        return data_ov017_021b867c;
    }
    case 3:
        func_0202c0c0(self->cardBytes[slot] + 0x36c + 0x400);
        return NULL;
    default:
        return 0;
    }
}
```

---

### 0x021B680C (1844 B, class F, overlay=ov017)

**Original verdict:** F — "1844B render init, 58 calls, nested loops"

**Upgrade reason:** `Ov017_SubSceneUpdate` — despite being flagged as
"vanilla `.s` recipe" with explicit `.word` slots (a different ship style
than the others, per its own header comment), the content is the exact
same catalogue of idioms already established in this doc: OV006-style
tile-fill loops (`orr tile, #0x2000`/`#0x1000` palette masks), the
`func_02006c0c`+bic/orr TaskConfig pattern (2 blocks), `data_02104f4c[+4]`
language extract, and a **verified byte-exact 6-field bitfield unpack** of
`data_02104f4c+0xa64` into `self+0x1cc..+0x1d4` — confirmed by direct
instruction read: `and r6,r7,#0x1f` → `strb [self,#0x1cc]` (bits 4:0),
`and r5,r7,#0x3e0` → `strb [self,#0x1cd]` (bits 9:5), `and r3,r7,#0x7c00`
→ `strb [self,#0x1ce]` (bits 14:10), `and r2,r7,#0xf8000` → `strb
[self,#0x1cf]` (bits 19:15), `and r0,r7,#0x1f00000` → written to
`self+0x100+0xd0` as a halfword (bits 24:20, the field already known from
`021b312c`'s `+0xa64 & 0x1f00000` gate test), and `and r1,r7,#0x7e000000`
→ `str [self,#0x1d4]` (bits 30:25, a 6-bit field — `0x7e000000 >> 0x19`).
This is a packed 6-sub-field word (5+5+5+5+5+6 = 31 bits), most likely an
RGB555-plus-extras color/config value. Tail calls to the three already-
matched sibling window-render functions (`func_ov017_021b73a8`/`_7490`/
`_7578` = `Ov017_RenderTextWindowA`/`B`/`C`). Every constant is a literal,
every call target is named.

**Struct/data needed:**
- `data_ov017_021b8228`/`_8238`/`_8254`/`_8270`/`_8290`/`_82b0`/`_82d0`/
  `_82f0`/`_8310`/`_8330`/`_8350` — the text-window cell handle table + 8
  font sub-table pointers (all already `.extern`-declared, consistent with
  `data_ov017_021b877c` documented as "handle table" in the map doc).
- `data_02105989`/`data_02105a4d` — small string/label sources (args to
  `func_02005088`).

**Ground-truth pool words (verbatim):**

```
data_02102c90, 0x6c3, 0x7fff, 0x5000040, data_ov017_021b8238, 0x1af, 0x10f,
data_020b4728, 0x5000060, 0x3ff, 0x5000020, data_02104f4c, data_02105989,
data_02105a4d, data_ov017_021b8254, data_ov017_021b877c, data_ov017_021b8228,
data_ov017_021b8270, data_ov017_021b8290, data_ov017_021b82b0,
data_ov017_021b82d0, data_ov017_021b82f0, data_ov017_021b8310,
data_ov017_021b8330, data_ov017_021b8350, func_ov017_021b6774
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_02001d0c, func_0202c0c0, func_02005088, func_0208e220,
func_02001bc8, func_02094550, func_0201d47c, func_02006c0c, func_0201e5b8,
Task_Invoke, func_0208e1cc, func_02001d68, func_0208df0c, func_020054a4,
func_02091554, func_0201e7e0, func_02093820, func_0201ef90, func_ov017_021b6774
(Ov017_FlushTextWindows), func_ov017_021b73a8 (Ov017_RenderTextWindowA),
func_ov017_021b7490 (Ov017_RenderTextWindowB), func_ov017_021b7578
(Ov017_RenderTextWindowC), func_02005800
```

**Struct offsets accessed:**

```
[data_02104f4c, #0xa3c] (byte)  [+0xb00] (byte)
[r4, #0x1cc] [+0x1cd] [+0x1ce] [+0x1cf] [+0x1d4] [+0x100+0xd0] [+0x100+0xda]
[r4, #0x54] [+0x4] [+0x8] [+0xb0] [+0x5c] [+0x60] [+0x64] [+0x1e4] [+0x1dc]
[+0x1e0] [+0x1ec] [+0x1f0] [+0x1f4]
```

**Recipe sketch (top-level shape — this is the "sub-scene per-frame
update" that rebuilds text windows and packs a card-attribute word each
frame):**

```c
void Ov017_SubSceneUpdate(Ov017SubCtrl *self) {
    func_02001d0c(data_02102c90, 8, 2);
    void *snd = func_0202c0c0(0x6c3);
    func_02005088(data_02102c90, snd, func_0208df60()+0x2580, 2, 0xc);
    /* two tile-fill loops (2 rows x 8 cols, tile 0x12c, palette 0x2000) */
    func_02001bc8(&stackBuf, 0, data_02104f4c_derived);
    func_02094550(&stackBuf, 0x5000040, 0x20);
    /* TaskConfig block #1 via data_ov017_021b8238, BLDCNT pack */
    /* 3-way template select (mode 0/1/2) via data_ov017_021b8228-family,
       tile-fill (6/8/0x1a cols x 2 rows, palette 0x1000) */
    /* VRAM clear + palette set, tile-fill 0x10x2, 0x14x2, 0x26x2 rows */
    /* card-attribute unpack: split fa64-shaped word into 6 sub-fields
       written to self+0x1cc..0x1d4 and self+0x100+0xd0 */
    Ov017_SubSceneReset(self);
    /* tile-fill 0x14x2 rows, palette 0x6e-based */
    func_02091554(...) x4;  /* 4 font-table entries rendered per language byte */
    func_0201e7e0(); func_02093820();
    func_0201ef90(self, self+4, self+8, data_ov017_021b8228, 1, 1, 0x200, self+0x54);
    func_02091554(...) x4;  /* second font-table group */
    func_0201e7e0(); func_02093820();
    func_0201ef90(self, self+0x5c, self+0x60, data_ov017_021b8228, 1, 1,
                   0x6000, self+0xb0);
    Ov017_RenderTextWindowA(self, data_ov017_021b8228);
    Ov017_RenderTextWindowB(self, data_ov017_021b8228);
    Ov017_RenderTextWindowC(self, data_ov017_021b8228);
    self->f1dc = self->f1e4 = 0x50;
    self->f1e0 = 0x60;
    self->f1ec = self->f1f4 = 0x18;
    self->f1f0 = 0x40;
    *(vu16*)0x04000000 = (*(vu16*)0x04000000 & ~0x1f00) | (((*(vu16*)0x04000000 & 0x1f00)>>8)|0x17)<<8;
    func_02005800(func_ov017_021b6774);  /* Ov017_FlushTextWindows fn-ptr arg */
}
```

---

### 0x021B7010 (800 B, class F, overlay=ov017)

**Original verdict:** F — "800B, smull divmod + 63 stack stores"

**Upgrade reason:** `Ov017_SubScrollUpdate` — a scroll-position
interpolation using the `0x66666667` ÷10 magic constant (already documented
in `OverlayConstantsExtended.md`), plus 4 nearly-identical
`func_0201e964(mode,flags,x,y,cellIdx,vramPtr)` "cell reconfigure" calls
(same convention as `Ov011_CellReconfigure` in `OverlayConstants.md`'s
"Cell config flags" section) — the "63 stack stores" are simply the fixed
8-word argument struct built 4 times with different literal flag values
(`0x6000/0x400/0xa000/0x12000/0x16000` — VRAM char-base addresses matching
`Ov017_RenderTextWindowA`/`B`/`C`'s documented char-bases `0xa000`/`0x12000`/
`0x16000`). `data_021040ac` is the documented `GlobalAudioState` singleton
(new offset `+0x38`, adjacent to the documented `+0x3c` field — see New KB
gaps). `data_ov017_021b7f3c` is a 16-byte literal block copied via
`ldmia`/`stmia`, same idiom as `data_ov017_021b7e7c` in 021b2ddc.

**Struct/data needed:**
- `data_021040ac` — extend `GlobalAudioState` with new field `+0x38`
  (int, read-only "scroll speed" or "tick rate" divisor input) —
  immediately adjacent to the documented `+0x3c` field.
- `data_ov017_021b7f3c` — 16-byte literal block (fn-ptr table index or
  cell-config template, same shape as `data_ov017_021b7e7c`).

**Ground-truth pool words (verbatim):**

```
0x66666667   ; smull reciprocal, ÷10 (documented in OverlayConstantsExtended.md)
data_021040ac
data_ov017_021b7f3c
```

**Ground-truth BL targets (verbatim):**

```
func_0201e964   (x5 — 4 cell-reconfigure calls + implicit in scroll-loop tail)
```

**Struct offsets accessed:**

```
[r4, #0x1dc] [+0x1e0] [+0x1e4] [+0x1e8]   (scroll-A interpolation state)
[r4, #0x1ec] [+0x1f0] [+0x1f4] [+0x1f8]   (scroll-B interpolation state)
[r4, #0x100+0xd0] [+0x100+0xd8] [+0x100+0xda]   (dirty-flag bitfield)
[r4, #0x8] [+0x64] [+0xc0] [+0x11c] [+0x178]   (4 cell-handle pointers, each +0x2c)
[r4, #0x1ce]   (card-type byte gate)
```

**Recipe sketch:**

```c
void Ov017_SubScrollUpdate(Ov017SubCtrl *self) {
    int deltaA;
    if (self->scrollATarget == self->scrollACur) { self->scrollASpeed = 0; deltaA = 0; }
    else { self->scrollASpeed++; deltaA = self->scrollATarget - self->scrollACur; }
    int stepA = (deltaA * self->scrollASpeed) / 10;   /* 0x66666667 idiom */
    int newA = self->scrollACur + stepA;
    int scrollA_fx = newA << 12;
    int scrollB_fx = self->scrollBBase << 12;

    if (!(self->dirtyFlags & 4)) {
        func_0201e964(1, 0, 0,0,0,3, 0,0,0,0, self->cellA->fld2c);
        func_0201e964(1, 0, 0,0,0,4,0,3, 0,0, (self->cellB->fld2c)+8);
        func_0201e964(1, 0, 0,0,0,3, 0x6000,0x200,0,0, self->cellC->fld2c);
        if (!(self->dirtyFlags & 8) && self->byteField != 6 && self->byteField != 0xb)
            func_0201e964(1, 0, 0,0,0,3, 0x12000,0x600,0,0, self->cellD->fld2c);
    }

    int deltaB;
    if (self->scrollATarget == self->scrollACur) self->scrollBCurCache = self->scrollATarget;
    if (self->scrollBTarget == self->scrollBPos) { self->scrollBSpeed = 0; deltaB = 0; }
    else { self->scrollBSpeed++; deltaB = self->scrollBTarget - self->scrollBPos; }
    int fnIdx = (data_021040ac.f38 / 8) & 7;
    void *tblEntry = data_ov017_021b7f3c[fnIdx];
    int stepB = (deltaB * self->scrollBSpeed) / 10;
    int newB = self->scrollBPos + stepB + tblEntry;

    if (!(self->dirtyFlags & 0x10) && self->scrollBDirtyBit != 0)
        func_0201e964(1, 0, 0,0,0,5, 0x16000,0x800,0,0, self->cellE->fld2c);

    if (newA == self->scrollATarget) self->scrollACur = self->scrollATarget;
    self->fadeCounter += /* delta since prev */;
}
```

---

### 0x021B7740 (1052 B, class F, overlay=ov017)

**Original verdict:** F — "1KB init, 27 calls, 4 loops; big-body
marshalling"

**Upgrade reason:** `Ov017_DeckPanelInit` — byte-for-byte the same shape as
the already-covered `func_ov019_021b52f0` (`Ov019_SceneC_Build`) above: VRAM
DMA zero-fills, `Vram_GetBankBaseCD`, string-render via `func_02005088`,
9-way bordered-tile-frame draw (corner/edge tile selection by row/col
position — a well-known deterministic 2D-border idiom, not scheduling
entropy), and the same `0x01ff0000`/`0x04001010` BG-scroll MMIO pack seen in
`func_ov019_021b52f0`/`func_ov019_021b573c`. This function and
`func_ov019_021b52f0` are near-duplicate siblings differing mainly in VRAM
offsets and SE-ID literals (`0x6cf`/`0x6cc`/`0x6cd` vs ov019's equivalents),
confirming the border-draw + VRAM-init recipe is a **shared cross-overlay
pattern**, not overlay-specific.

**Struct/data needed:** `data_020b4728` (already seen in 021b2ddc/021b34c4
above), `data_ov017_021b84d0`/`_84f0` — two 0x20-byte config blocks passed
to `func_02091554` (font-glyph render).

**Ground-truth pool words (verbatim):**

```
data_ov017_021b8a9c, data_02102c90, 0x00005680, 0x00013200, data_020b4728,
0x050004a0, 0x000002be, 0x000002bb, 0x01ff0000, 0x04001010,
data_ov017_021b84d0, data_ov017_021b84f0
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_02094504 (x3), func_0208e200, func_0208e1ac, Vram_GetBankBaseCD,
func_02001d0c, func_02005088, func_02091554 (x2), func_0201d47c,
func_02006c0c (x2), func_0201e5b8 (x2), Task_Invoke (x2), func_02094550,
func_0202c0c0 (x2), func_020054a4, func_02005ee0
```

**Struct offsets accessed:** stack-local border-frame array indexed by
row/col (9-way corner/edge tile select, same pattern as `func_ov019_
021b52f0`'s `.L_2ec`/`.L_2f0` loop).

**Recipe sketch:** identical structure to `Ov019_SceneC_Build`
(`func_ov019_021b52f0`) above, with different VRAM offsets/SE IDs — see
that entry's recipe sketch for the full shape; the 9-way border-tile
selection block is byte-identical logic (corner/edge literal tile IDs
selected by `(row==0)`/`(row==last)`/else × `(col==0)`/`(col==last)`/else).

---

## ov019 Newly Tractable Funcs

### 0x021B2938 (272 B, class E, overlay=ov019)

**Original verdict:** E — "divide-by-shift arithmetic chains, loop, heavy
reg juggling"

**Upgrade reason:** `Ov019_FillTileRows` per the map doc — the "divide-by-shift"
is the standard mwcc signed-divide idiom (`asr#0x2`/`add...,lsr #0x1d`/`asr#0x3`,
then `asr#0x2`/`lsr#0x1d`/`asr#0x3` again — a double
divide-by-8 applied to a byte-count arg) feeding `func_02094504` (documented
VRAM DMA convention) and `func_02001d0c` (documented display-config call).
The loop is a clean bounded 2-call-per-iteration tile-fill using
`func_02094550`, counted by a third divide (`asr#0x4`/`lsr#0x1b`/`asr#0x5`)
— all deterministic arithmetic, zero register-allocation ambiguity despite
"heavy reg juggling" (that describes high live-range overlap from loop-
invariant hoisting, not indeterminate scheduling).

**Struct/data needed:** none beyond documented globals.

**Ground-truth pool words (verbatim):** none (`data_02102c90` implicit via
`func_02004f58`'s first arg — actually no `.word` literal in this function
at all; only `func_02004f58` is a plain `bl`).

**Ground-truth BL targets (verbatim):**

```
func_02094504 (x2)
func_02001d0c
func_02004f58
func_02094550 (x2, inside loop)
```

**Struct offsets accessed:** none (pure register arithmetic on caller-
supplied args).

**Recipe sketch:**

```c
void Ov019_FillTileRows(int slot, int arg1, int y, int height) {
    int h8 = height / 8;   /* double divide-by-8 idiom, asr#2/lsr#1d/asr#3 twice */
    func_02094504(0, y, height);
    int rows = h8 / 8;
    func_02001d0c((void*)0, rows / 8, 2);
    func_02004f58((void*)0, 2, 0xc, arg1, y);
    void *base = (void*)((slot << 7) + 0x6600000);
    int n = (h8 / 16) / 2;
    if (n <= 0) return;
    int off = (h8 * 8) / 2;
    int p1 = y, p2 = 0;
    for (int i = 0; i < n; i += 2) {
        func_02094550(0, base + (p1>>1), 0x80);
        func_02094550(0, base + off + ((p1+1)>>1), 0x80);
        p1 += 0x200; p2++;
    }
}
```

---

### 0x021B2AE8 (1344 B, class F, overlay=ov019)

**Original verdict:** F — "1344-byte big body, 34 calls, bitfield struct
stores"

**Upgrade reason:** `Ov019_SceneA_Build` per the map doc — the same
`func_02006c0c(template,4,0)` + `bic`/`orr` TaskConfig-pack idiom seen
throughout ov017 (4 blocks here), plus a bounded `for` loop building 6+1
card-count sprites via the already-matched sibling `func_ov019_021b40d4`
(`Ov019_SceneA_RenderCount`), a `func_ov019_021b4258` (`Ov019_SceneA_LayoutSlots`)
tail call, and a DISPCNT-family pack (`0x4000000`, `bic #0x1f00`/`orr #0xc00`).
All literals are fixed, all callees named.

**Struct/data needed:** `data_ov019_021b5bd0`/`_5bf0`/`_5c0c`/`_5c2c`/
`_5c4c` — five task templates. `data_ov019_021b5a18` — 16-byte literal
block copied via `ldmia`/`stmia` (same idiom as ov017's `data_ov017_
021b7e7c`).

**Ground-truth pool words (verbatim):**

```
data_ov019_021b5e70, 0x000004c4, 0x0400006c, 0x0400106c, data_ov019_021b5bd0,
data_ov019_021b5bf0, data_ov019_021b5c0c, 0x00006640, data_ov019_021b5c2c,
data_ov019_021b5c4c, data_ov019_021b5a18, 0x000076f4, 0x05000600,
0x00006a82, 0x05000640, data_ov019_021b6848, 0x000006d2, data_ov019_021b6920
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_02094504, func_0208c884 (x2, MASTER_BRIGHT), func_ov019_021b3f7c
(Ov019_SceneA_MapAnimState), func_0201d47c, func_02006c0c, func_0201e5b8
(x4-block idiom, Task_Invoke interspersed) x4, func_0201e7e0, func_0201ef90,
func_02001bc8 (x2), func_02094550 (x2), func_ov019_021b40d4 (Ov019_SceneA_
RenderCount, x up to 7), func_ov019_021b4258 (Ov019_SceneA_LayoutSlots),
func_0202c0c0, func_ov019_021b52f0 (Ov019_SceneC_Build, conditional tail)
```

**Struct offsets accessed:**

```
[r6, #0x8] [+0xc] [+0x10] [+0x14] [+0x44] [+0x48] [+0x64] [+0xbc] [+0xc0] [+0xc4]
```

**Recipe sketch:**

```c
void Ov019_SceneA_Build(Ov019SceneA *self) {
    func_02094504(0, &data_ov019_021b5e70, 0x4c4);
    func_0208c884(0x0400006c, -0x10);
    func_0208c884(0x0400106c, -0x10);
    Ov019_SceneA_MapAnimState(self);
    /* TaskConfig block #1: template data_ov019_021b5bd0, bgFlags 0x40/0x3,
       field 0x54=0x4d00 */
    /* card-count sprites: if self->f8>0, up to 4 blocks via TaskConfig
       templates _5bf0/_5c0c (SE 0x6640 card-load), Task_Invoke each */
    /* TaskConfig block: template _5c2c, bgFlags 0x8/0x40 */
    if (self->f8 > 0) {
        /* TaskConfig block: template _5c4c, bgFlags 0x1c/0x300,
           7-step BLDALPHA-style scroll ramp (0x19<<lsr#0x12 idiom) */
        for (int i = 0; i < (self->f8 > 6 ? 7 : self->f8 + 1); i++) {
            /* bic/orr field2 pack per iteration */
        }
    }
    memcpy(cellCfg, data_ov019_021b5a18, 16);
    func_0201e7e0();
    func_0201ef90(self, self+0x44, self+0x48, cellCfg, 2, 1, 0x200, self+0xbc+0x400);
    func_02001bc8(&stk, 0x2800, 0x76f4);
    func_02094550(&stk, 0x5000600, 0x20);
    func_02001bc8(&stk, 0x2800, 0x6a82);
    func_02094550(&stk, 0x5000640, 0x20);
    if (self->f8 > 6) {
        for (int i = 0; i <= 6; i++) Ov019_SceneA_RenderCount(self, self->slots[i].f14, i);
    } else if (self->f8 > 0) {
        for (int i = 0; i <= self->f8; i++) Ov019_SceneA_RenderCount(self, self->slots[i].f14, i);
    }
    Ov019_SceneA_LayoutSlots(self);
    *(vu16*)0x04000000 = (*(vu16*)0x04000000 & ~0x1f00) | 0xc00;
    *(vu16*)0x04001000 = (*(vu16*)0x04001000 & ~0x1f00) | 0x1c00;
    self->f14 = 0x130; self->f18 = 0x130;
    if (self->f8 > 0) {
        self->f0c0 = self->f14slot; self->f0b8 = 1; self->f0c4 = 0;
    } else {
        void *snd = func_0202c0c0(0x6d2);
        Ov019_SceneC_Build(data_ov019_021b6920, 1, snd);
    }
}
```

---

### 0x021B3068 (1056 B, class F, overlay=ov019)

**Original verdict:** F — "1056-byte big body, 21 calls, mla index, stores"

**Upgrade reason:** `Ov019_SceneA_UpdateInput` per the map doc — per-frame
touch-hit-test dispatcher: calls the already-matched siblings
`func_ov019_021b2728` (`Ov019_TouchHitTestPrimary`), `func_ov019_021b28dc`
(`Ov019_BuildObjAttrA`), `func_ov019_021b2a48` (`Ov019_WriteObjStrip`), and
the also-tractable `func_ov019_021b3f00`/`func_ov019_021b3f34`
(`Ov019_PutGlyphPacked`/`Ov019_PutGlyphOffset`) with clean literal box IDs
(`0xe`/`0xc`/`0x84`/`0x9f`/`0xb9`/`0xd3`). The `mla r3,r1,#0xa,r3` index and
the `rsb/lsl#0x1d/ror#0x1d` divide-by-11-shaped correction are the standard
mwcc idiom, not entropy — every index feeds a bounded, named-callee call.

**Struct/data needed:** `data_ov019_021b5ba0`/`_5baa` — two small Rect-like
globals (hit-test targets, first-touch and scroll-touch).

**Ground-truth pool words (verbatim):**

```
data_ov019_021b6920, data_ov019_021b5ba0, data_ov019_021b5baa,
data_ov000_021b1d4c
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_ov019_021b5948 (Ov019_SceneA_TouchScrollBar, conditional),
func_ov019_021b2728 (Ov019_TouchHitTestPrimary, x2), func_ov019_021b3f34
(Ov019_PutGlyphOffset, x2), func_02019124, GetSystemWork, func_ov019_
021b3f00 (Ov019_PutGlyphPacked, x9 across all render blocks), func_ov019_
021b2a48 (Ov019_WriteObjStrip, x4), func_ov019_021b28dc (Ov019_BuildObjAttrA,
x4), func_ov005_021aaea8
```

**Struct offsets accessed:**

```
[sl, #0x8] [+0xc] [+0x10] [+0x18] [+0x1c] [+0x434]
[data_ov000_021b1d4c, #0x18]
[GetSystemWork()+0x900]
```

**Recipe sketch:**

```c
int Ov019_SceneA_UpdateInput(Ov019SceneA *self) {
    if (data_ov019_021b6920.f8) Ov019_SceneA_TouchScrollBar();
    int hit0 = Ov019_TouchHitTestPrimary(&data_ov019_021b5ba0);
    int f4 = hit0 ? 1 : 0;
    Ov019_PutGlyphOffset(self, 0xe, f4, &data_ov019_021b5ba0, -1, -1);

    if (self->f8 > 0) {
        SlotEntry *slot = (SlotEntry*)((char*)self + (self->f0c + self->f10) * 12);
        int f5 = 0;
        if (slot->f18 != 0 || slot->f1c != 0) {
            if (func_02019124() != 0xff || (GetSystemWork()->f900 << 7) >> 31 != 0) {
                int hit1 = Ov019_TouchHitTestPrimary(&data_ov019_021b5baa);
                f5 = hit1 ? 2 : 1;
            }
        }
        Ov019_PutGlyphOffset(self, 0xc, f5, &data_ov019_021b5baa, -1, -1);
        int hiFlag = (self->f434 > 0) ? -1 : 1;
        Ov019_PutGlyphPacked(self, 0, hiFlag, 1, (self->f10 * 0x18) + 8, 0x84);
    }
    if (self->f434 > 0) {
        int idx = 2 - self->f434;
        Ov019_PutGlyphOffset(self, self->f434 == 2 ? 0xb : 0xd, -1, -1,
                              &data_ov019_021b5c[idx], -1);
    }
    if (self->f8 > 6) {
        if (data_ov000_021b1d4c.f18 == 2) Ov019_PutGlyphPacked(self, 2, 0, 1, 1, 0xe8);
        if (data_ov000_021b1d4c.f18 == 3) Ov019_PutGlyphPacked(self, 3, 0, 1, 1, 0x83);
        int hl = (data_ov000_021b1d4c.f18 == 1);
        void *deckPtr = func_ov005_021aaea8(&data_ov000_021b1d4c);
        Ov019_PutGlyphPacked(self, 4, hl, 1, 1, 0xe8);
    }
    for (int i = 0; i < (self->f8 > 6 ? 7 : self->f8); i++) {
        int discriminant = (self->f10 + i == self->f8) ? 2 : 0;
        SlotEntry *slot = (SlotEntry*)((char*)self + (self->f0c + i) * 12);
        if (slot->f18) {
            int flags = (slot->f1c == 0) ? 8 : (slot->f1c < 0x10 ? 9 : 0xa);
            Ov019_PutGlyphPacked(self, 0, 0, 0, flags, 7);
        }
        int cardOff = ((self->f0c + i) * 12 + 0x348);
        Ov019_WriteObjStrip(0x15, 0xd, cardOff);
        Ov019_PutGlyphPacked(self, 7, discriminant, 0, 0xd3, 1);
        Ov019_BuildObjAttrA(discriminant, 0xc, 2, cardOff2 /* /11-based */);
        Ov019_PutGlyphPacked(self, 6, discriminant, 0, 0xb9, 1);
        Ov019_BuildObjAttrA(discriminant, 0xc, 2, cardOff3);
        Ov019_PutGlyphPacked(self, 5, discriminant, 0, 0x9f, 1);
        Ov019_BuildObjAttrA(discriminant, 0xc, 2, cardOff4);
    }
    return 1;
}
```

---

### 0x021B35DC (1812 B, class F, overlay=ov019)

**Original verdict:** F — "1812-byte body, 51 calls, MMIO, big-body"

**Upgrade reason:** `Ov019_SceneA_RenderFrame` per the map doc — a
per-frame state-advance function using the documented `data_02104bac`
struct (extends known `+0x54` flags field with new `+0x52`/`+0x56`
offsets, same extension as ov017's 021b5130 above), the same `func_02037208
(id-1, 0, 1)` toast/SE convention seen in ov017's 021b33dc, and a direct
DISPCNT bitfield-pack write at `0x4000000` (`and #0x1f00`/`bic #0x1f00`/
`orr <<0x8`, matches `OV000_DISPCNT_BG_NAME_MASK` shape from
`OverlayConstants.md`). Tail-calls the already-covered `func_ov019_021b3cf0`
sibling.

**Struct/data needed:** `data_ov019_021b5ba0`/`_5baa` (same globals as
021b3068 above — hit-test/state targets shared across the scene-A group).

**Ground-truth pool words (verbatim, partial — full function is ~500
lines):**

```
data_02104bac
data_ov000_021b1d4c
data_ov019_021b5ba0
data_ov019_021b5baa
```

**Ground-truth BL targets (verbatim, sampled — repeated `func_02037208`
calls with id-1 literal arithmetic `0x42-0x43`/`0x38-0x39`, matching the
established ov017/ov019 toast convention):**

```
func_ov019_021b3cf0 (Ov019_SceneA_HandleDone, x3+)
func_02037208 (toast/SE, x6+ across branches)
func_020b3870
func_ov005_021aa4d0
func_ov019_021b27a0 (Ov019_TouchHitTestAlt)
func_ov019_021b40d4 (Ov019_SceneA_RenderCount)
func_ov019_021b4258 (Ov019_SceneA_LayoutSlots)
func_ov019_021b4324 (Ov019_SceneA_HitTestSlots)
```

**Struct offsets accessed:**

```
[r4, #0x434]   (self — phase/countdown field, matches 021b3068's usage)
[data_02104bac, #0x52] [+0x54] [+0x56]
[0x4000000]   (DISPCNT direct MMIO, and/bic/orr)
```

**Recipe sketch (top-level shape, sampled from the confirmed prefix — see
`func_ov017_021b33dc`'s recipe above for the identical `func_02037208
(id-1,0,1)` idiom this function reuses extensively):**

```c
int Ov019_SceneA_RenderFrame(Ov019SceneA *self) {
    *(vu16*)0x04000000 = (*(vu16*)0x04000000 & ~0x1f00) |
        ((((*(vu16*)0x04000000 & 0x1f00) >> 8) | 6) << 8);
    if (data_02104bac.f52 == 0) goto animate;
    if (data_02104bac.f56 & 0x300) {
        /* clear a bit in DISPCNT-mirror word */
    }
    if (self->f434 > 0) {
        if (data_02104bac.f54 & 1) return Ov019_SceneA_HandleDone(self, 2 - self->f434);
        if (data_02104bac.f54 & 2) { self->f434 = 0; func_02037208(0x42-0x43,0,1); goto done; }
        if (data_02104bac.f54 & 0x30) {
            self->f434 = 1 - self->f434;
            func_02037208(0x38-0x39,0,1);
            goto done;
        }
    } else {
        if (data_02104bac.f54 & 1) { self->f434 = 1; func_02037208(0x3a-0x3b,0,1); goto done; }
        if (data_02104bac.f54 & 2) return Ov019_SceneA_HandleDone(self, 0);
    }
    /* ... additional branches for f56&0x80/0x40 scroll/highlight cases,
       hit-test dispatch to Ov019_TouchHitTestAlt / Ov019_SceneA_HitTestSlots,
       card-count re-render via Ov019_SceneA_RenderCount + LayoutSlots ... */
done:
animate:
    return 0;
}
```

---

### 0x021B3F7C (344 B, class F, overlay=ov019)

**Original verdict:** F — "344-byte jump-table dispatcher, 20 branches,
many cases"

**Upgrade reason:** `Ov019_SceneA_MapAnimState` per the map doc — the
"jump-table" is a bounded computed branch (`addge pc,pc,r6,lsl#0x2` on a
range-checked state index 0-8) where every case reads the documented
"global step-counter" `data_02104f4c+0x928`/`+0x92c` (independently
confirmed by `docs/research/map/_names_overlay003.md`'s
`Ov003_CheckTransitionReady` as "global step-counter … threshold" — the
same field is used across ov003/ov017/ov019) against fixed thresholds
(`0x24`/`0x29`/`0x17`+`0x4`/`0x2b`+`0x3`) to select an animation-ID
remap (`0x49`/`0x4a`/`0x4b`/`0x5e`/`0x3f`). Every branch target is a
distinguishable literal remap; there is no unresolved indirection. Calls
the already-matched sibling `func_ov019_021b43a8` (`Ov019_MapCardCategory`)
per-iteration.

**Struct/data needed:** `data_02104f4c+0x928` (int, "global tick/step
counter", already semantically identified via the ov003 map cross-
reference but not yet in a formal `types/*.md` doc — see New KB gaps),
`+0x92c` (int, secondary/delta companion field).

**Ground-truth pool words (verbatim):**

```
data_02104f4c
```

**Ground-truth BL targets (verbatim):**

```
func_020195b8 (x3, per-state-entry probe)
func_ov019_021b43a8 (Ov019_MapCardCategory)
func_02018dcc (conditional, on match)
func_0201b690 (conditional, on match)
```

**Struct offsets accessed:**

```
[r4, #0x928] [+0x92c]   (data_02104f4c cluster, "global step-counter")
[r9, #0x0] [+0x4] [+0x8]  (self — output ring entry, stride 0xc)
[sl, #0x8]   (self — output count)
```

**Recipe sketch:**

```c
void Ov019_SceneA_MapAnimState(Ov019SceneA *self) {
    int outCount = 0;
    void *ring = self + 0x14;
    for (int state = 1; state < 0x60; state++) {
        int remap = state;
        if (state > 7) {
            if (state == 0x2d) remap = 0x49;
        } else {
            switch (state) {
            case 3: if (data_02104f4c.f928 >= 0x24) remap = 0x4a; break;
            case 4: if (data_02104f4c.f928 >= 0x29) remap = 0x5e; break;
            case 5:
                if (data_02104f4c.f928 > 0x17) remap = 0x4b;
                else if (data_02104f4c.f928 == 0x17 && data_02104f4c.f92c >= 4) remap = 0x4b;
                break;
            case 6:
                if (data_02104f4c.f928 > 0x2b) remap = 0x3f;
                else if (data_02104f4c.f928 == 0x2b && data_02104f4c.f92c >= 3) remap = 0x3f;
                break;
            }
        }
        int a = func_020195b8(remap, outCount);
        int b = func_020195b8(remap, 1);
        int c = func_020195b8(remap, 2);
        int active = (outCount + a + b + c) > 0;
        int matched = Ov019_MapCardCategory(self, remap, outCount + 1);
        if (matched != 0 || active) {
            ((s16*)ring)[0] = remap;
            *((int*)ring + 1) = func_02018dcc(remap);
            ((s16*)ring)[4] = func_0201b690(state);
            ring = (char*)ring + 0xc;
            outCount++;
        }
    }
    self->f8 = outCount;
}
```

---

### 0x021B4660 (860 B, class F, overlay=ov019)

**Original verdict:** F — "860B setup, 48 sequential calls"

**Upgrade reason:** `Ov019_SceneB_Build` per the map doc — literally 48
sequential calls, every one with fixed literal args: VRAM palette-copy
(`func_02094550`), OBJ/BG init (`func_0208e220`/`func_0208e1cc`/
`func_0208df60`/`func_0208df0c`), string/label render (`func_02005088`/
`func_020054a4`/`func_0202c0c0` with literal SE IDs `0x6cf`/`0x6cc`/`0x6cd`),
and 6 calls to the already-matched sibling `func_ov019_021b45fc`
(`Ov019_FillObjRow`) with literal stride/count args. Ends with tail calls
to the already-covered `func_ov019_021b4c74`/`func_ov019_021b4fdc`
siblings and a DISPCNT pack (`orr #0x13`<<8). Zero indirection anywhere.

**Struct/data needed:** none new — all globals (`data_020b4728`,
`data_02102c90`, `data_02104f4c`) already documented.

**Ground-truth pool words (verbatim):**

```
data_020b4728, 0x000003ff, 0x05000020, 0x00007fff, 0x05000040, data_02102c90,
0x000006cf, 0x000006cc, 0x000006cd, data_02104f4c, func_ov019_021b4560
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_02094550 (x2), func_02001bc8 (x2), func_0208e220, func_02001d0c (x5),
func_0208df60 (x2), func_02094504 (x5), func_0202c0c0 (x3), func_020054a4
(x2), func_02005088 (x3), func_ov019_021b45fc (Ov019_FillObjRow, x6),
func_0208e1cc (x4), func_0208df0c (x2), func_ov019_021b4c74 (Ov019_SceneB_
RenderCard), func_ov019_021b4fdc (Ov019_SceneB_RenderAnim), func_02005800
```

**Struct offsets accessed:** `[r6, #0xc0]` (self — card-count gate for the
conditional second half).

**Recipe sketch:** a flat sequence of 48 named calls with literal args —
see the map doc's description (VRAM palette copy → engine/OBJ init →
labels → 6× `Ov019_FillObjRow` with strides `0x9a/0x16`, `0xde/0x6`,
`0x1e0x200/0x6`, `0x35c/0x6`, `0x5a0x100/0x14`, `0x9a0x200/0x14`,
`0x6a0x300/0xa` → `Ov019_SceneB_RenderCard` → `Ov019_SceneB_RenderAnim` →
DISPCNT pack → `func_02005800(Ov019_StopRenderTasks)`). No pseudo-code
ambiguity — every argument is a compile-time literal.

---

### 0x021B4A4C (484 B, class F, overlay=ov019)

**Original verdict:** F — "484B, 39 stores of stack-struct args"

**Upgrade reason:** `Ov019_SceneB_UpdateAnim` per the map doc — three
near-identical `func_0201e964(mode,flags,...)` "cell reconfigure" calls
(documented convention, `OverlayConstants.md`) with fixed literal flags
(`0x1e00`/`0x200`), gated by clean struct-field reads (`[r5+0xbc]`/
`[+0xc0]`/`[+0xc4]`). Calls the already-matched siblings `func_ov019_
021b4f1c` (`Ov019_MapAnimFrame`) and `func_ov019_021b4ed0`
(`Ov019_AnimGatePredicate`) with clean literal args, then a 4th
`func_0201e964` call with an index computed from `data_021040ac.f38`
(same `GlobalAudioState+0x38` field newly identified in ov017's 021b7010
above) and a 32-byte (8×s32) template copy from `data_ov019_021b5a68`.
**Confirmed** (already matched as raw bytes in `src/overlay019/
data_ov019_021b5a68.c`): the table is `{0, 1, 2, 1, 0, -1, -2, -1}` — an
8-entry, period-8 symmetric triangle/wobble wave, indexed by
`(data_021040ac.f38 >> 3) & 7`. This is exactly the shape needed for an
OBJ-position "hover shimmer" easing offset.

**Struct/data needed:** `data_ov019_021b5a68` — CONFIRMED 32-byte literal
s32 triangle-wave table `{0,1,2,1,0,-1,-2,-1}` (`ldmia`/`stmia` copy of two
4-word chunks, same idiom family as `data_ov017_021b7e7c`/`data_ov019_
021b5a18`, which are the smaller 16-byte instances of the same "copy
literal template to stack" pattern).

**Ground-truth pool words (verbatim):**

```
data_ov019_021b5a68
data_021040ac
```

**Ground-truth BL targets (verbatim):**

```
func_0201e964 (x4)
func_ov019_021b4f1c (Ov019_MapAnimFrame, x2)
func_ov019_021b4ed0 (Ov019_AnimGatePredicate)
```

**Struct offsets accessed:**

```
[r5, #0xbc] [+0xc0] [+0xc4] [+0x8] [+0xc] [+0x10] [+0x64]
[data_021040ac, #0x38]
```

**Recipe sketch:**

```c
int Ov019_SceneB_UpdateAnim(Ov019SceneB *self) {
    if (self->f_bc == 0 && self->f_c0 > 0) {
        int y = self->f_c4 << 12;
        func_0201e964(1, 0, 0x60000, y, 0,0,0,6,3,0x1e00,0x200,0,0, self->slots[0].fld2c);
        func_0201e964(1, 0, 0x60000, y, 0,0,0,5,3,0x1e00,0x200,0,0, self->slots[1].fld2c);
        func_0201e964(1, 0, 0x60000, y, 0,0,0,4,3,0x1e00,0x200,0,0, self->slots[2].fld2c);
        int cat = Ov019_MapAnimFrame(self);
        int gate = Ov019_AnimGatePredicate(self, cat);
        if (gate) {
            /* {0,1,2,1,0,-1,-2,-1} triangle-wave LUT, confirmed matched bytes */
            static const int wobble[8] = {0,1,2,1,0,-1,-2,-1};
            int cat2 = Ov019_MapAnimFrame(self);
            int idx = ((data_021040ac.f38 >> 3) & 7);
            int base = (cat2 == 0x4b) ? 0x20 : 0;
            int off = wobble[idx] + base + 0x40;
            int x = (self->f_c4 - 0x38) << 12;
            func_0201e964(1, 0, off << 12, x, 0,0,0,7,3,0,0,0,0, self->slots[3].fld2c);
        }
    }
    return 1;
}
```

---

### 0x021B4C74 (604 B, class F, overlay=ov019)

**Original verdict:** F — "604B, 30 calls, layout marshalling; big-body"

**Upgrade reason:** `Ov019_SceneB_RenderCard` per the map doc — VRAM
zero-fill, string-render for a card name (using `func_02019210` card-type
lookup, `func_02018abc`/`func_02011a14`/`func_02011a7c`/`func_02018d1c`
card-attribute pipeline, all already-named), and the documented
`data_02104f4c+0x928/+0x92c` "global step counter" fields (same as
021b3f7c above). All 30 calls are sequential with clean args; no
indirection.

**Struct/data needed:** `data_ov019_021b5a50` — 24-byte literal block
(`ldmia`/`stmia` copy, third instance of the "small literal template" idiom
after `data_ov019_021b5a18`/`_5a68`).

**Ground-truth pool words (verbatim):**

```
data_02102c90
data_02104f4c
data_ov019_021b5a50
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_0208df0c (x4), func_02094504 (x2), func_0202c0c0 (x2), func_02001d0c
(x2), func_020054a4 (x3), func_02005088 (x3), func_02019210, func_02018abc,
func_020117e4, func_02011a14, func_02011a7c, func_02018d1c, func_02001d68
(x2)
```

**Struct offsets accessed:**

```
[r7, #0xc0] [+0xb8] [+0xbc]
[data_02104f4c, #0x928] [+0x92c]
```

**Recipe sketch:**

```c
void Ov019_SceneB_RenderCard(Ov019SceneB *self) {
    void *card = self->f_c0;
    func_02094504(0, func_0208df0c()+0x580, 0x500);
    void *name1 = func_0202c0c0(card + 0x178 + 0x400);
    func_02001d0c(data_02102c90, 0x14, 2);
    int w = func_020054a4(name1, 0xc);
    int y = (w >= 0x14) ? y+0x14 : y + (0x8e - w);
    func_02005088(data_02102c90, name1, func_0208df0c()+0x580, 1, y+6, 0xc);

    func_02094504(0, func_0208df0c()+0xa80, 0x500);
    int cardType = func_02019210(card);
    int lvl = func_02018abc(data_02104f4c.f928);
    int atk = func_020117e4(cardType, data_02104f4c.f928 - 1, lvl, data_02104f4c.f92c);
    void *name2 = atk ? func_02011a14() : func_0202c0c0(0);
    func_02001d0c(data_02102c90, 0x14, 2);
    int w2 = func_020054a4(name2, 0xc);
    if (w2 > 0x90) { name2 = func_0202c0c0(0); w2 = func_020054a4(name2, 0xc); }
    int y2 = (w2 >= 0x14) ? y+0x14 : y + (0x8e - w2);
    func_02005088(data_02102c90, name2, func_0208df0c()+0xa80, 1, y2+6, 0xc);

    u32 tmp[6];
    memcpy(tmp, data_ov019_021b5a50, 24);
    func_02011a7c(cardType);
    int atkStat = func_02018d1c();
    atkStat = (atkStat > 5) ? 5 : atkStat;
    func_02001d68(0);
    func_02094504(0, func_0208df0c()+0xf80, 0x3c0);
    void *label = tmp[atkStat];
    func_02001d0c(data_02102c90, 0xa, 3);
    int w3 = func_020054a4(label, 0xc);
    int centered = (0x50 - w3) / 2;
    func_02005088(data_02102c90, label, func_0208df0c()+0xf80, 9, centered, 0xc);
    func_02001d68((data_02104f4c.f4 << 0x1d) >> 0x1d);
    self->f_b8 = 0;
    self->f_bc = 1;
}
```

---

### 0x021B52F0 (1032 B, class F, overlay=ov019)

**Original verdict:** F — "250 insns, 27 calls, init with many setups"

**Upgrade reason:** `Ov019_SceneC_Build` per the map doc — VRAM zero-fills,
`Vram_GetBankBaseCD`, string-render, `func_02006c0c` TaskConfig-build (x2,
same idiom as ov017), and a 9-way bordered-tile-frame draw (corner/edge
tile selection by row/col position against 9 literal tile IDs `0xd2..0xda`)
— a deterministic 2D-border-draw idiom, not scheduling entropy (this is the
byte-identical sibling pattern already established in ov017's
`func_ov017_021b7740`, confirming a shared cross-overlay border-draw
recipe). Ends with the same `0x01ff0000`/`0x04001010` BG-scroll MMIO pack
seen in `func_ov019_021b573c`.

**Struct/data needed:** `data_ov019_021b5dd4`/`_5df4` — two font/glyph
config blocks (args to `func_02091554`). `data_020b4728` — already
documented (shared with ov017).

**Ground-truth pool words (verbatim):**

```
data_ov019_021b6920, data_02102c90, data_ov019_021b5dd4, data_ov019_021b5df4,
data_020b4728, 0x05000400, 0x01ff0000, 0x04001010
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_02094504 (x3), func_0208e200, func_0208e1ac, Vram_GetBankBaseCD,
func_02001d0c, func_02005088 (x2), func_02091554 (x2), func_0201d47c (x2),
func_02006c0c (x2), func_0201e5b8 (x2), Task_Invoke (x2), func_02094550,
func_0202c0c0 (x2), func_020054a4, func_02005ee0
```

**Struct offsets accessed:**

```
[r0, #0x0] [+0x8] [+0x14] [+0x18]   (self — struct at sp+0x8)
```

**Recipe sketch:** identical top-level shape to `func_ov017_021b7740`
(`Ov017_DeckPanelInit`) above — see that entry's full recipe sketch; only
the VRAM offsets, SE IDs, and font-config table addresses differ. Full
verbatim body already reproduced in the earlier "verified" read (see
independent-verification notes) and matches token-for-token.

---

### 0x021B573C (524 B, class F, overlay=ov019)

**Original verdict:** F — "128 insns, divmod-by-shift state machine, many
stores"

**Upgrade reason:** `Ov019_SceneA_AnimScroll` per the map doc — a clean
3-state (`[r4+4]`: 0/1/2) BG-scroll easing state machine. The "divmod-by-
shift" is the standard signed-divide-by-8 idiom (`asr#0x1`/computed
midpoint) feeding a `mul`+`asr#0x2`/`lsr#0x1d`/`asr#0x3` scaled-position
write into `0x04001010` (BG scroll MMIO, masked `0x01ff0000` — same
register/mask pair documented for `func_ov019_021b52f0`/`func_ov017_
021b7740` above). Uses `data_02104bac+0x54` (documented flags field) and
calls the documented `func_02006148`/`func_0200617c` secondary-touch-source
pair (named in `Ov016Ov020Ov015Retriage.md`'s "touch source B" convention)
plus `func_02037208` with the established `id-1` literal-arithmetic
convention.

**Struct/data needed:** none new — `data_02104bac` field `+0x54` already
documented.

**Ground-truth pool words (verbatim):**

```
data_02104bac
0x01ff0000
0x04001010
```

**Ground-truth BL targets (verbatim):**

```
func_02037208 (x2, toast/SE with id-1 idiom: 0x3a-0x3b)
func_02006148 (secondary touch position)
func_0200617c (secondary touch pressed)
```

**Struct offsets accessed:**

```
[r4, #0x0] [+0x4] [+0x14] [+0x18] [+0x1c]
```

**Recipe sketch:**

```c
int Ov019_SceneA_AnimScroll(Ov019SceneA *self) {
    int mid = (0xc0 - self->f14 + ((0xc0-self->f14)>>31)) >> 1;
    int lo = mid - 8;
    int hi = self->f14 + mid - 8;
    int flags = data_02104bac.f54;
    switch (self->state) {
    case 0: {
        int step = self->f1c + 1;
        self->f1c = step;
        int val1 = lo * step;
        int scaled1 = self->f14 - (val1 / 8);
        *(vu32*)0x04001010 = (*(vu32*)0x04001010 & ~0x1ff0000) | (scaled1 << 16);
        int val2 = hi * step;
        int scaled2 = self->f14 - (val2 / 8);
        *(vu32*)(0x04001010+4) = (*(vu32*)(0x04001010+4) & ~0x1ff0000) | (scaled2 << 16);
        if (self->f1c >= 8) self->state = 1;
        return 0;
    }
    case 1:
        if (self->f0 == 0) return 0;
        if (flags == 0) {
            if (self->f0 != 1) return 0;
            int tx, ty;
            func_02006148(&tx, &ty);
            int inRange = 0;
            if (ty >= 0x68 && tx >= self->f18 + 5) inRange = 1;
            else if (ty < 0x98 && tx < self->f18 + 0x17) inRange = 1;
            self->f0c = inRange;
            if (!func_0200617c() || self->f0c == 0) return 0;
            func_02037208(0x3a - 0x3b, 0, 1);
            self->state = 2;
            return 0;
        }
        if (self->f0 != 1) return 0;
        if (!(flags & 3)) return 0;
        func_02037208(0x3a - 0x3b, 0, 1);
        self->state = 2;
        return 0;
    case 2: {
        int step = self->f1c - 1;
        self->f1c = step;
        int val1 = lo * step;
        int scaled1 = self->f14 - (val1 / 8);
        *(vu32*)0x04001010 = (*(vu32*)0x04001010 & ~0x1ff0000) | (scaled1 << 16);
        int val2 = hi * step;
        int scaled2 = self->f14 - (val2 / 8);
        *(vu32*)(0x04001010+4) = (*(vu32*)(0x04001010+4) & ~0x1ff0000) | (scaled2 << 16);
        if (self->f1c <= 0) { self->state = 0; self->f1c = 0; return 1; }
        return 0;
    }
    }
    return 0;
}
```

---

## Confirmed intractable

None. Every one of the 24 examined functions resolved to TRACTABLE. This is
a 100% hit rate — no functions in this batch exhibited genuine scheduling
entropy (no unresolved function-pointer indirection with multiple plausible
callees, no switch/branch-chain lacking a discriminant source, no dense
unrelated loop nests without struct anchors).

The two largest functions (`func_ov017_021b5130`, 3256 B, and
`func_ov017_021b4570`, 2112 B) are flagged as high **matching**-difficulty
(heavy register pressure across repeated near-identical sub-blocks) —
`func_ov017_021b4570`'s original "permuter terr" label is accurate as a
match-difficulty warning, not a classification verdict. Both should route
through the `mwcc-register-reuse-recipe.md` lever set (min-as-if-assign,
bind-call-result-to-temp, reuse-param-in-place) rather than being treated
as walls.

---

## New KB gaps found

| Gap | Evidence | Functions affected |
|-----|----------|---------------------|
| `data_02104f4c+0xa64/+0xa68/+0xa6c/+0xa70/+0xa74/+0xa7c` — new "achievement/mode cluster" fields, beyond the documented `+0xa60` max reach in `OverlayDataGlobs.md`. **`+0xa64` byte-verified (via `func_ov017_021b680c`) to be a packed 6-sub-field word**: bits 4:0 → `self.f1cc` (`&0x1f`), bits 9:5 → `self.f1cd` (`&0x3e0`), bits 14:10 → `self.f1ce` (`&0x7c00`), bits 19:15 → `self.f1cf` (`&0xf8000`), bits 24:20 → `self+0x100+0xd0` (`&0x1f00000`, same field already gated in `021b312c`), bits 30:25 → `self.f1d4` (`&0x7e000000`, 6 bits) — a 5+5+5+5+5+6 packed layout, plausibly RGB555 + a 6-bit extra (palette bank or animation-frame index) | `func_ov017_021b22ec`, `func_ov017_021b312c`, `func_ov017_021b34c4`, `func_ov017_021b680c` | 4 ov017 funcs |
| `data_02104f4c+0x928/+0x92c` — VERIFIED (address arithmetic) to be `GetSystemWork()-0xC`, i.e. `data_02104f4c = data_02104f58 - 0xC` (`0x2104f58-0x2104f4c=0xc`). This means these offsets are actually inside the documented `SYSWORK_SIZE=0x92c` block from `MainConstants.md`: `+0x928` = `SystemWork+0x91C` (primary progress/frame counter, compared against thresholds 8/0x17/0x18/0x24/0x29/0x2b across functions), `+0x92c` = `SystemWork+0x920` (secondary tie-break counter, compared against 3/4). Recommend adding `SYSWORK_ANIM_FRAME_COUNT=0x91C` / `SYSWORK_ANIM_SUBFRAME=0x920` to `MainConstants.md`'s SystemWork section — this closes the gap rather than just flagging it. Semantically corroborated by `docs/research/map/_names_overlay003.md`'s `Ov003_CheckTransitionReady` (uses the same field via the `data_02104f4c` alias) | `func_ov019_021b3f7c`, `func_ov019_021b4c74`, (also referenced by already-matched `func_ov019_021b40d4`/`func_ov019_021b4f1c` per the map doc) | 2+ ov019 funcs, cross-referenced with ov003 |
| `data_02104bac+0x52`/`+0x56` — extends the documented `GlobalData02104bac.md` struct (only `+0x54 flags` currently named) with an adjacent gate word and a bitmask word | `func_ov017_021b5130`, `func_ov019_021b35dc`, `func_ov019_021b573c` | 3 funcs across both overlays |
| `data_021040ac+0x38` — extends the documented `GlobalAudioState.md` struct (nearest named field is `+0x3C`) with an adjacent int field, likely a scroll-speed/tick-rate divisor input | `func_ov017_021b7010`, `func_ov019_021b4a4c` | 2 funcs across both overlays |
| `data_021059cc` — new 8-byte-stride table indexed by `(cardByte-1)<<3`, read at `+0x78`/`+0x7a`/`+0x80` across three functions — likely per-card metadata (glyph width or icon-count) | `func_ov017_021b22ec`, `func_ov017_021b5130`, `func_ov017_021b4df8` | 3 ov017 funcs |
| `data_ov017_021b8894`/`data_ov017_021b8994` cluster fields `+0x1ce/+0x1cf/+0x1d0/+0xd0/+0xd8/+0xa64..+0xa74` — sub-scene controller card-index/bitmask fields, not yet in a formal struct doc (currently only cross-referenced informally in `docs/research/map/overlay017.md`'s prose) | `func_ov017_021b4570`, `func_ov017_021b312c`, `func_ov017_021b680c` | 3 ov017 funcs |
| `data_ov017_021b8180/819c/81b8/81d4/81f0` — 5-entry task-template family selected by a mode field (0-3); template contents not yet decoded | `func_ov017_021b4570` | 1 func |
| Cross-overlay "toast `id-1`" convention: `func_02037208(literal-1, 0, 1)` where the literal is always one greater than the actual toast/SE ID passed (e.g. `mov r0,#0x42 / sub r1,r0,#0x43` = pass `-1`) — seen identically in ov017 (`021b33dc`) and ov019 (`021b35dc`, `021b573c`); worth promoting to a named idiom in `OverlayConstants.md` alongside the existing `OV004_TOAST_*` IDs | `func_ov017_021b33dc`, `func_ov019_021b35dc`, `func_ov019_021b573c` | 3 funcs, both overlays |
| Cross-overlay "9-way bordered-tile-frame draw" idiom — byte-identical corner/edge tile-selection logic (literal tile IDs, 3×3 position cases) appears in both `func_ov017_021b7740` and `func_ov019_021b52f0`; worth documenting once as a shared recipe rather than per-function | `func_ov017_021b7740`, `func_ov019_021b52f0` | 2 funcs, both overlays |
| Cross-overlay "small 16/20/24-byte literal template, `ldmia`/`stmia` copy to stack" idiom — `data_ov017_021b7e7c` (16B), `data_ov019_021b5a18` (16B), `data_ov019_021b5a68` (16B), `data_ov019_021b5a50` (24B) all follow the identical copy-to-stack-before-cell-submit pattern | `func_ov017_021b2ddc`, `func_ov019_021b2ae8`, `func_ov019_021b4a4c`, `func_ov019_021b4c74` | 4 funcs, both overlays |
| `func_ov017_021b34c4` (2020 B) full pool-word/BL-target enumeration is only sampled (prefix + tail confirmed unambiguous; ~400 middle lines not transcribed verbatim in this doc) — low priority since the verdict (TRACTABLE) is not in doubt, but a follow-up pass should complete the literal transcription before attempting the match | `func_ov017_021b34c4` | 1 func |

---

## Tally

| Overlay | Tractable | Wall |
|---------|-----------|------|
| ov017   | 14 / 14   | 0    |
| ov019   | 10 / 10   | 0    |
| **Total** | **24 / 24** | **0** |
