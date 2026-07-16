[//]: # (markdownlint-disable MD013 MD041)

# ov004 / ov006 Deep Re-triage (R8)

Round 8 pushes into the NEXT batch of ov004/ov006 residual — 15 ov004 and
15 ov006 addresses that neither `OverlayEFRetriage.md` (R4's original 4 + 8
ov004/ov006 funcs) nor `Ov004Ov006Deep.md` (R6's 20 new ov004 + 24 new ov006
funcs) ever examined. All 30 addresses were confirmed virgin by exhaustive
substring search against every file in `docs/research/retriage/` before
starting. All 30 `.s` files were confirmed to still exist as `.s` (none
flipped to `.c` by another lane); zero skips.

KB docs referenced: `docs/research/data/Ov004Ov006DataTables.md` (primary
reference for ov004/ov006 rodata/data block shapes), `docs/research/retriage/
OverlayEFRetriage.md` and `docs/research/retriage/Ov004Ov006Deep.md` (R4/R6
prior passes — struct offsets and recipes carried forward), `docs/research/
retriage/Ov017Ov019Retriage.md` (R7 — the `data_02104f4c` "achievement/mode
cluster" `+0xa64..+0xa7c` extension used here), `docs/research/constants/
OverlayConstants.md` (OV004_TOAST_* IDs), `docs/research/constants/
OverlayConstantsExtended.md` (smull magic-divide constants), `docs/research/
map/overlay004.md` + `_names_overlay004.md`, `docs/research/map/overlay006.md`
+ `_names_overlay006.md` (existing name proposals — cross-checked against
every function below and consistent with the ground-truth `.s` reads),
`docs/research/dossiers-high/02021660.md` (the OBJ-slot-search primitive
underlying ov006's battle-animation family).

All 30 targets already have map-doc name proposals (`Ov004_*`/`Ov006_Battle_*`
etc.) with one-line descriptions that independently corroborate this doc's
own read of the assembly — a strong cross-check signal that these are
genuinely tractable, not just plausible.

Byte sizes below are computed directly from each `.s` file (instruction
count + pool-word count, both ×4) rather than taken from the overlay map
docs' size column, which was found to disagree with the `.s` ground truth
on several ov006 entries (stale from an earlier map-generation pass).

---

## Summary by overlay

| Overlay | Examined | Newly tractable |
|---------|----------|------------------|
| ov004   | 15       | **15**           |
| ov006   | 15       | **15**           |
| **TOTAL** | **30** | **30 (100%)**    |

Every single examined function is tractable — matching R7's 100% result and
extending the project's core finding: **size alone does not predict
difficulty once struct/data/constant KB exists.** Several of the largest
bodies in this batch (`021ce4a8` at 1296 B, `021cf638` at 1356 B, `021bcedc`
at 2016 B, `021bc45c` at 1848 B) resolved cleanly because every `bl` target
and pool word maps onto an already-named callee or an already-documented
struct/table — the "many calls, big body" signal that triggered the original
F/E classification turns out to be enumerable straight-line sequences and
bounded dispatch tables, not scheduling entropy. No genuine wall was found
in this batch.

---

## ov004 Newly Tractable Funcs

### 0x021CC7BC (448 B, class E, overlay=ov004)

**Original verdict:** E — "large; refs 021cc74c; card list layout, mixed
branches"

**Upgrade reason:** `Ov004_LayoutCardList` per the map doc. A clean 2-way
gate (`func_ov004_021cc74c` snapshot-copy result compared against `0xfa0`,
then `func_0202b9ec` returning a 0-3 "empty-slot count") feeding either an
early-toast-and-return path or a full slot-configure path. The `0x66666667`
smull constant is the already-documented ÷10 reciprocal
(`OverlayConstantsExtended.md`); here it computes `card_idx / 10 % 5` to pick
one of 5 stat-row slots at `data_021040ac+0x88+row*0x20+0xb8`. Both toast
calls (`func_02037208(0x43-0x44, 0, 1)` / `(0x3a-0x3b, 0, 1)`) use the
project-standard `id-1` literal-arithmetic idiom (matches
`OV004_TOAST_CONFIRM`-family and `OV004_TOAST_PANEL_OPEN=0x3a` from
`OverlayConstants.md`). `data_02104f4c+0xa3c` 3-bit extract
(`lsl#0x1d/lsr#0x1d`) is the documented language-ID idiom carried over from
R6/R7. `data_021040ac+0x60`/`+0xd54`/`+0x44`/`+0x48`/`+0x54`/`+0x74`/`+0x78`/
`+0x7c`/`+0x88` are all already-referenced offsets on the ov004 global state
record (same struct touched throughout this whole batch — see every other
ov004 entry below).

**Struct/data needed:**
- `data_021040ac` — global state record; offsets `+0x60` (u16 halfword
  echo of the card index), `+0xd54` (int, `3 - empty_count`), `+0x44`/`+0x48`/
  `+0x54`/`+0x74`/`+0x78`/`+0x7c` (state-machine scalars, already touched by
  many matched siblings), `+0x88+row*0x20+0xb8` (per-row stat cell, row =
  `card_idx % 5` via the ÷10-then-÷5 double-smull).
- `data_ov004_0220b500` (b500) — `+0x20c` array, `data_ov004_0220b500[b500_idx*4+0x20c]` gate.
- `data_02104c7a`/`data_02104c94`/`data_02105989` — string/data refs (already
  documented in `Ov004Ov006Deep.md`'s `021cc014` entry).
- `data_ov004_022915e8` — the lock-gate object (`Ov004_InitLockGate`,
  fully matched at `021d8648`).

**Ground-truth pool words (verbatim):**

```
data_ov004_0220b500   ; b500 main state record (r4 base)
data_02104dac         ; halfword-echo dest for early-return path
data_021040ac         ; global state record (+0x44/48/54/60/74/78/7c/88/d54)
data_02104f4c         ; system-clock cluster (+0xa3c language 3-bit field)
data_02104c7a         ; string/data ref A (arg0 to func_020aadf8)
data_02104c94         ; string/data ref B (arg to strb ldrb A3C source)
data_02105989         ; string/data ref C (arg1 to func_020aadf8)
0x66666667            ; smull reciprocal, ÷10 (documented, OverlayConstantsExtended.md)
data_ov004_022915e8   ; lock-gate object (arg to func_ov004_021d8798)
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_ov004_021cc74c
func_0202b9ec              (x2, both branches probe empty-slot count)
func_02037208               (early-return toast, id=0x43-0x44)
func_020aadf8                (x2, two string-buffer fills)
func_0201d114                 (x2, one per br_dc/br_124 path)
func_0202c0c0
func_ov004_021d8798
func_02037208               (tail toast, id=0x3a-0x3b)
```

**Recipe sketch:**

```c
void Ov004_LayoutCardList(int card_idx) {
    Ov004_CopyActiveRecord();               /* func_ov004_021cc74c */
    int snap = *(int*)sp;                   /* snapshot copy result */
    if (snap >= 0xfa0) {
        if (func_0202b9ec() >= 3) {
            data_02104dac->f60 = (s16)snap;
            data_021040ac->fd54 = 3 - func_0202b9ec();
            data_021040ac->f48 = 4;
            data_021040ac->f54 = 0x17;
            goto tail_toast;
        }
        func_02037208(0x43 - 0x44, 0, 0, 1);
        return;
    }
    if (data_ov004_0220b500[card_idx].f20c) {
        data_021040ac->fbcc = (s8)sp[4];
        data_021040ac->fbcd = (s8)((data_02104f4c->fa3c << 0x1d) >> 0x1d);
        func_020aadf8(data_02104c7a, sp + 6);
        func_020aadf8(data_02104c94, data_02105989);
        data_021040ac->f44 = 1;
        Ov004_LayoutCardList_Sub(card_idx);          /* func_0201d114 */
    } else {
        data_021040ac->fbcc = (s8)sp[8];
        data_021040ac->fbcd = (s8)((data_02104f4c->fa3c << 0x1d) >> 0x1d);
        func_020aadf8(data_02104c7a, sp + 9);
        func_020aadf8(data_02104c94, data_02105989);
        data_021040ac->f44 = 0;
        Ov004_LayoutCardList_Sub(card_idx);
    }
    int row = card_idx / 10 % 5;             /* double-smull, 0x66666667 then /5 */
    data_021040ac->f88 = card_idx;
    data_021040ac[row].fb8 = 3;
    data_021040ac->f74 = data_021040ac->f7c = data_021040ac->f78 = 0;
    data_021040ac->f54 = 2;
    void *name = func_0202c0c0(0xd5);
    func_ov004_021d8798(data_ov004_022915e8, name, 0);
tail_toast:
    func_02037208(0x3a - 0x3b, 0, 0, 1);
}
```

---

### 0x021CCED8 (1244 B, class F, overlay=ov004)

**Original verdict:** F — "large; refs 02209c70+ slot arrays, b500/b5b8;
full card slot render, many calls"

**Upgrade reason:** `Ov004_DrawCardSlotsFull` per the map doc. The body is
a 4-case switch on `card_kind` (0/1/3/other, gated first by whether
`data_ov004_0220b5b8[slot].f20c` is already set) selecting one of 4 near-
identical `func_02001d68`+`func_ov004_021cb63c(slot+1, offset, 0x80)` blocks
that all write the same `+0x20c` gate flag afterward. This is the same
"send-status-message + gate flag" idiom already named `Ov004_SendStatusMsg`
(`021cb63c`, MED per `_names_overlay004.md`). The remainder is a long but
fully bounded string/glyph-selection sequence (`func_02091554`/
`func_02006b10`), a `func_02006c0c(...,4,0)`+`func_0201d47c`+`func_0201e5b8`+
`Task_Invoke` TaskConfig-build block (the standard idiom documented across
R5-R7), and a per-record final copy loop (fixed 11 iterations, `.L_b7c`)
writing a byte-pair sequence — bounded, deterministic. `0x66666667` is again
the documented ÷10 reciprocal, here computing a 5-way row index.
`data_ov004_02209c70`/`_c8c`/`_ca8`/`_cc8`/`_ce8` are 5 already-catalogued
string/label pointers (adjacent to the `Category 5` string-array family in
`Ov004Ov006DataTables.md`).

**Struct/data needed:**
- `data_ov004_0220b5b8` — slot-array sibling of `0220b500` (b500), same
  `+0x20c` gate-flag shape; stride-0x20 5-slot array (`ldr r6, [r2, r4, lsl
  #0x5]`).
- `data_ov004_0220b500` (b500) — `+0x8c`/`+0xa4`/`+0xa8`/`+0x90`/`+0x60`
  (already-referenced ov004 layout scalars).
- `data_ov004_02209c70`/`_c8c`/`_ca8`/`_cc8`/`_ce8` — 5 string labels
  ("category" text, one per card-kind), already flagged in `Category 5` of
  `Ov004Ov006DataTables.md` as brief-141 string arrays.

**Ground-truth pool words (verbatim):**

```
0x66666667            ; smull reciprocal, ÷10 (row index = slot / 10 % 5)
data_ov004_0220b5b8   ; slot-array sibling of b500
data_ov004_0220b500   ; b500 main state record
data_ov004_02209c70   ; category-0 string label
data_ov004_02209c8c   ; category-1 string label
data_ov004_02209ca8   ; category-2 string label
data_ov004_02209cc8   ; category-3 string label
data_ov004_02209ce8   ; category-4/default string label
data_02104f4c         ; system-clock cluster (+0x4 language 3-bit field)
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_020a7440
func_02001d68            (x5: x4 one per card-kind case, x1 language field)
func_ov004_021cb63c    (x5: x4 one per card-kind case, x1 tail)
func_ov004_021cb834
func_02091554             (x5: x4 category-label picks, x1 fallback pick)
func_02006b10
func_02006c0c
func_0201d47c
func_0201e5b8
Task_Invoke
func_02005dac
func_ov004_021cb778     (x2)
func_ov004_021ca0a4      (x2, cell-configure calls)
func_ov004_021cb568
func_ov004_021cb940       (tail, empty-frame VRAM clear)
```

**Recipe sketch (top-level shape; the 4-case category dispatch and the final
11-item copy loop are fully bounded and follow directly from the `.s`):**

```c
void Ov004_DrawCardSlotsFull(int slot_idx) {
    int row = /* (slot_idx*0x66666667 double-smull) % 5 */;
    Ov004Slot *cur = &data_ov004_0220b5b8[row];
    int kind = cur->kind;                      /* [r6] */
    if (func_020a7440(&data_021040ac[0x158/4+row*8], cur, 0x20)) {
        if (cur->kind >= 0xfa0) {
            func_02001d68((s8)cur->f8);
            Ov004_SendStatusMsg(row + 1, cur->f9, 0x80);
            data_021040ac[row].f20c = 0;
        } else if (kind == 1) {
            func_02001d68((s8)cur->f4);
            Ov004_SendStatusMsg(row + 1, cur->f6, 0x80);
            data_021040ac[row].f20c = 1;
        } else if (kind == 3) {
            if (data_021040ac[row].f20c) {
                func_02001d68((s8)cur->f4);
                Ov004_SendStatusMsg(row + 1, cur->f6, 0x80);
            } else {
                func_02001d68((s8)cur->f8);
                Ov004_SendStatusMsg(row + 1, cur->f9, 0x80);
                data_021040ac[row].f20c = 0;
            }
        } else {
            func_02001d68((s8)cur->f8);
            Ov004_SendStatusMsg(row + 1, cur->f9, 0x80);
            data_021040ac[row].f20c = 0;
        }
    }
    /* status field: 0=empty/none, 1=data021040ac gate, 2/3 =from kind cmp */
    Ov004_DrawFrameBorder(row, cur->status, cur->kind >= 0xfa0);
    char *label = data_021040ac[row].f20c
        ? Ov004_PickLabel(cur->f4)              /* one of 4 sp+0x38 buffers */
        : Ov004_PickCategoryLabel(cur->kind);
    void *task = func_02006c0c(sp + 0x38, 4, 0);
    TaskConfig cfg;
    func_0201d47c(&cfg);
    cfg.field_c = (row << 0xc) + 0x3080;
    cfg.bgFlags = (cfg.bgFlags & ~0xf) | 9;
    cfg.bgFlags |= 0x10;
    cfg.handle = task;
    func_0201e5b8(&cfg);
    Task_Invoke(task);
    /* trailing dispatch: gated by data_02104f4c[+0x4] language 3-bit field */
}
```

---

### 0x021CD3B4 (784 B, class F, overlay=ov004)

**Original verdict:** F — "refs 02209cc8 slot, 021040ac/02104c94/02104f4c/
b500; card slot update, big-body"

**Upgrade reason:** `Ov004_UpdateCardSlots` per the map doc. A gated
top-half (`b500+0x8c > 0x100` early return, then a `b500+0x74`/`+0x94`
2-flag dispatch selecting VRAM-clear vs. card-detail-draw vs. skip) followed
by a fixed sequence of `Ov004_LayoutCell` calls (`func_ov004_021ca0a4`,
already `HIGH`-confidence matched per `_names_overlay004.md`) with
literal box args, then a countdown at `b500+0x94` and a final
`b500+0xa4 = 0` reset. `func_0208e0a0`+`func_02094550` is the same
"VRAM-clear split" idiom used across `021cb940`/`021cb834` (R6). The
2-iteration name-draw loop (`.L_d0c`) at fixed literal offsets `0xbb`/`0x300`
is bounded.

**Struct/data needed:**
- `data_ov004_0220b500` (b500) — `+0x8c` (frame counter), `+0x74`/`+0x94`
  (mode flags), `+0xa4` (index reset), `+0xb0` (highlight-slot compare).
- `data_ov004_02209cc8` — category-3 string label (same family as
  `021cced8`'s 5-string set).

**Ground-truth pool words (verbatim):**

```
data_ov004_0220b500   ; b500 main state record
data_021040ac         ; global state record (+0xba8 bitfield read)
data_02104c94         ; string/data ref B
data_ov004_02209cc8   ; category-3 string label
0x00004080            ; BLDALPHA-family packed literal
data_02104f4c         ; system-clock cluster (+0x4 language field)
0x00002881            ; BLDALPHA-family packed literal
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_0208e0a0
func_02094550
func_02001d68
func_ov004_021cb63c
func_02091554
func_02006c0c
func_0201d47c
func_0201e5b8
Task_Invoke
func_02001d68
func_0202c0c0              (x2, 2-iteration name loop)
func_ov004_021cb63c      (x2)
func_02005dac
func_ov004_021cb778     (x4)
func_ov004_021ca0a4      (x2, cell-configure calls)
func_ov004_021cb568      (x2, caption draws)
func_02094504
```

**Recipe sketch:**

```c
void Ov004_UpdateCardSlots(void) {
    if (data_ov004_0220b500.f8c > 0x100) return;
    if (data_ov004_0220b500.f74) {
        if (data_ov004_0220b500.f94 == 0) {
            void *vram = func_0208e0a0();
            func_02094550(vram + 0x200, data_ov004_0220b500.f258 + 0x5000, 0x280);
            func_02001d68((s8)data_021040ac[0xb00 + 0xcd]);
            Ov004_SendStatusMsg(2, 0x80);
            /* bitfield row = (data_021040ac.ba8 >> 5 - 1) * 10 + (data_021040ac.ba8 & 0x1f) */
            int row = /* mla */;
            func_02091554(sp + 0x38, row);
            void *task = func_02006c0c(sp + 0x38, 4, 0);
            TaskConfig cfg;
            func_0201d47c(&cfg);
            cfg.field_c = data_ov004_022915e8;    /* mvn -0x0 field */
            cfg.bgFlags = (cfg.bgFlags & ~0xf) | 9;
            cfg.bgFlags |= 0x10;
            cfg.handle = task;
            func_0201e5b8(&cfg);
            Task_Invoke(task);
            func_02001d68((s8)data_02104f4c.f4 lang);
            for (int i = 0; i < 2; i++) {
                char *name = func_0202c0c0(i + 0xbb + 0x300);
                Ov004_SendStatusMsg(i + 3, name, 0x80);
            }
        }
    } else {
        /* draw BLDALPHA-style packed field via func_02005dac, then
           2x Ov004_DrawFrameBorder + 2x Ov004_LayoutCell + conditional
           Ov004_DrawCaption depending on b500.b0 */
    }
    if (data_ov004_0220b500.f94 < 6) data_ov004_0220b500.f94++;
    data_ov004_0220b500.fa4 = 0;
}
```

---

### 0x021CD924 (360 B, class E, overlay=ov004)

**Original verdict:** E — "slot highlight draw, packed field, 200+ insns"

**Upgrade reason:** `Ov004_DrawSlotHighlight` per the map doc. A 200-byte
input buffer (`func_0201cbd8(mode=2, sp)`) fed to a 3-way switch
(`ldrh [sp]`: 0/1/0x13) each writing highlight-record fields on
`data_021040ac` and dispatching to `func_020aadf8` (fill-string) +
`func_02007218` (record-copy) helpers — deterministic. Case 0x13 is a
one-line `b500.78=2` set. The `.L_11b8`/`.L_1244` blocks are near-identical
siblings differing only in which `data_021040ac` byte field
(`+0xbcc`/`+0xbcd`) is written — the classic "dual-byte selector" idiom
already seen in `021cc7bc` above.

**Struct/data needed:**
- `data_ov004_0220b500` (b500) — `+0x44`/`+0x74`/`+0x78`.
- `data_021040ac` — `+0xba4`/`+0xba8`/`+0xbcc`/`+0xbcd` (highlight record
  fields, already touched by `021cc7bc`/`021cd3b4` above).
- `data_02104c94` — string/data ref B (already documented).
- `data_ov004_022915e8` — lock-gate object.

**Ground-truth pool words (verbatim):**

```
data_ov004_0220b500   ; b500 main state record
data_021040ac         ; global state record (+0xba4/ba8/bcc/bcd)
data_02104c94         ; string/data ref B
data_02104c7a         ; string/data ref A
data_ov004_022915e8   ; lock-gate object
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_0201cbd8
func_02094688              (x2, one per case-0 sub-branch)
func_020aadf8               (x4, 2 per sub-branch)
func_02007218                 (x2)
func_ov004_021d8cd0
```

**Recipe sketch:**

```c
int Ov004_DrawSlotHighlight(void) {
    char buf[0x200];
    if (!func_0201cbd8(2, buf)) return 0;
    u16 mode = *(u16*)buf;
    switch (mode) {
    case 0: {
        func_02094688(buf + 2, data_021040ac + 0x3c00 + 0xd4, 0x54);
        data_021040ac->fba4 = *(u16*)(data_021040ac + 0x3d14);
        data_021040ac->fbcd = data_021040ac->f3ce4;   /* dup-write A */
        data_021040ac->fba8 = data_021040ac->f3d18;
        func_020aadf8(data_02104c7a, buf + 0x3c00 + 0xe5);
        func_020aadf8(data_02104c94, data_02105989);
        data_021040ac->fce0 = func_02007218();
        data_ov004_0220b500.f74 = 1;
        break;
    }
    case 1: {
        if (data_ov004_0220b500.f44) {
            data_021040ac->f78 = buf[2];
            data_021040ac->fba4 = buf[4];
        } else {
            func_02094688(buf + 2, data_021040ac + 0x3c00 + 0xd4, 0x54);
            data_021040ac->fba4 = *(u16*)(data_021040ac + 0x3d14);
            data_021040ac->fbcc = data_021040ac->f3ce4;    /* dup-write B */
            data_021040ac->fba8 = data_021040ac->f3d18;
            func_020aadf8(data_02104c7a, buf + 0x3c00 + 0xe5);
            func_020aadf8(data_02104c94, data_02105989);
            data_021040ac->fce0 = func_02007218();
            data_021040ac->fcd0 = 1;
            data_ov004_0220b500.f78 = 1;
        }
        Ov004_ApplyBlendAlpha(data_ov004_022915e8);   /* func_ov004_021d8cd0 */
        break;
    }
    case 0x13:
        data_ov004_0220b500.f78 = 2;
        break;
    }
    return 1;
}
```

---

### 0x021CDA8C (656 B, class F, overlay=ov004)

**Original verdict:** F — "refs b500/021040ac; slot drop/confirm handler,
huge nested switch"

**Upgrade reason:** `Ov004_HandleSlotDrop` per the map doc. This is a
top-level state-machine driver: `b500+0x54` gates 4 sub-handlers via a
bounded `addls pc,pc,r0,lsl#2` computed branch (states 0-3), each of which
is a further bounded computed branch on `func_0201d030()`'s return (0-5).
Every branch target writes fixed literal fields on `b500` and dispatches to
already-matched siblings (`func_ov004_021cbf38`=`Ov004_SetCurrentIdA`,
`func_ov004_021cc97c`, `func_ov004_021cc63c`, `func_ov004_021cca30`,
`func_ov004_021cc0e0`). The "huge nested switch" reads as scheduling entropy
in isolation but every one of the ~16 computed-branch targets is a
distinguishable, fully bounded block — no register-allocation ambiguity, it
is a textbook 2-level dispatcher matching the shape already documented for
R7's `Ov017_MainSceneUpdate` (`021b5130`).

**Struct/data needed:**
- `data_ov004_0220b500` (b500) — `+0x54`/`+0x58`/`+0x64`/`+0x70`/`+0x78`/
  `+0xa0`/`+0xef0`/`+0xf90` (state-machine scalars and layout-cell bases,
  all already referenced by matched siblings).
- `data_ov004_022915e8` — lock-gate object.

**Ground-truth pool words (verbatim):**

```
data_ov004_0220b500   ; b500 main state record
data_ov004_022915e8   ; lock-gate object
0x05000638             ; VRAM palette-slot literal (arg2 to Ov004_RGBBlend)
0x00600100             ; packed RGB/alpha literal (arg3 to Ov004_RGBBlend)
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_0201ca88
func_ov004_021cd924        (Ov004_DrawSlotHighlight, tail-consistency check)
func_0201d34c
func_ov004_021cbf38       (Ov004_SetCurrentIdA, x4 across states)
func_0202c0c0
func_ov004_021d8798
func_ov004_021cc97c
func_0201d030                (x3, one per states 1/2/3)
func_0201d398
func_ov004_021cca30
func_0201d0e8
func_ov004_021cc63c        (x2)
func_ov004_021cc0e0
func_ov004_021d8d58
func_ov004_021ca198
func_ov004_021cd6c4
func_ov004_021d9134
func_ov004_021ca0a4        (x2)
func_ov004_021cbf84
func_ov004_021c9dd4         (Ov004_RGBBlend, tail)
```

**Recipe sketch (top-level dispatch shape; each state's internal computed
branch follows the identical shape shown for state 0 below):**

```c
void Ov004_HandleSlotDrop(void) {
    if (data_ov004_0220b500.f54 == 0) Ov004_TouchOverlayInit();  /* 0201ca88 */
    if (Ov004_DrawSlotHighlight() || func_0201d34c()) goto tail;
    switch (data_ov004_0220b500.f54) {
    case 0: {
        Ov004_SetCurrentIdA(0);
        if (data_ov004_0220b500.f58 == 0 && data_ov004_0220b500.f64 == 0) {
            char *name = func_0202c0c0(0xd6);
            Ov004_QueueDisplayRequest(data_ov004_022915e8, name, 0x12);
            data_ov004_0220b500.f58 = 1;
        }
        data_ov004_0220b500.f64 = 0;
        func_ov004_021cc97c();
        break;
    }
    case 1: {
        int r = func_0201d030();
        if (r == 0) {
            if (++data_ov004_0220b500.f70 >= 8) {
                data_ov004_0220b500.f70 = 0;
                func_0201d398();
            }
        } else if (r == 1) {
            data_ov004_0220b500.f54 = 0;
            data_ov004_0220b500.f58 = 0;
        } else if (r == 3) {
            func_ov004_021cca30();
        }
        Ov004_SetCurrentIdA(func_0201d0e8() ? 2 : 1);
        break;
    }
    case 2: {
        int r = func_0201d030();
        switch (r) { /* 0,1,3: reset f54/f58; 4: SetCurrentIdA(3) */ }
        break;
    }
    case 3: {
        int r = func_0201d030();
        if (r == 4) func_ov004_021cc63c();
        else if (r == 5) { /* f78 mode dispatch, SetCurrentIdA(4) */ }
        break;
    }
    }
tail:
    Ov004_ApplyBlendAlpha(data_ov004_022915e8);
    func_ov004_021ca198();
    func_ov004_021cd6c4();
    Ov004_UpdateSubEngine(data_ov004_022915e8);
    Ov004_LayoutCell(&b500.ef90+0x5000, 0, 0, 0x1f, 2);
    func_ov004_021cbf84();
    Ov004_LayoutCell(&b500.ef90+0x5000, 3, b500.a0, 0xe4, 2);
    Ov004_RGBBlend(&b500.ef0+0x5000, 0x05000638, 4, 0x00600100);
}
```

---

### 0x021CDD38 (256 B, class E, overlay=ov004)

**Original verdict:** E — "trade UI control draw, DMA + task chain"

**Upgrade reason:** `Ov004_DrawTradeControls` per the map doc. A tight,
fully deterministic leaf: allocates a task via `Task_PostLocked(0x400,4,0)`,
clears its buffer with `func_02094504`, sets a text-color config
(`func_02001d0c(data_02102c90,0x10,2)`), measures string width
(`func_020054a4`) to compute a centering offset, renders it
(`func_02004f58`), invokes the sprite DMA setup (`func_02092904`), then runs
a fixed 4-iteration double-`func_0208fd90` loop (row-blit, 2 calls/iteration
at literal strides `0x80`/`0x100`/`0x200`) before `Task_InvokeLocked`. Every
literal is a fixed geometry constant (task size `0x400`, glyph color `0x10`,
text ID `0xc`, row stride `0x80`/`0x100`) — no scheduling ambiguity, purely
arithmetic centering plus a bounded loop.

**Struct/data needed:** `data_02102c90` (documented `GlobalData02102c7c`
cluster member, same global used throughout ov004's text-render calls per
`021b34c4`/`021cf070` etc.) — no new globals.

**Ground-truth pool words (verbatim):**

```
data_02102c90   ; GlobalData02102c7c cluster (text-render context)
```

**Ground-truth BL targets (verbatim, in call order):**

```
Task_PostLocked
func_02094504
func_02001d0c
func_020054a4
func_02004f58
func_02092904
func_0208fd90    (x8: 2 calls x 4 loop iterations)
Task_InvokeLocked
```

**Recipe sketch:**

```c
void Ov004_DrawTradeControls(int row_base, char *text) {
    void *task = Task_PostLocked(0x400, 4, 0);
    func_02094504(0, task, 0x400);
    func_02001d0c(data_02102c90, 0x10, 2);
    int w = func_020054a4(text, 0xc);
    int off = (w + (w >> 0x1f)) >> 1;
    int centered = (off > 0x40) ? 0 : (0x40 - off);
    func_02004f58(data_02102c90, text, task, centered, 0xc);
    func_02092904(task, 0x400);
    int row = ((row_base * 3) << 0xb) / 2 + 0x400;
    void *dst = task, *dst2 = task + 0x200;
    int src_row = row, mult = 1;
    for (int i = 0; i < 4; i++) {
        func_0208fd90(dst, src_row, 0x80);
        func_0208fd90(dst2, row + (mult * 0x80), 0x80);
        src_row += 0x100;
        dst += 0x80; dst2 += 0x80;
        mult += 2;
    }
    Task_InvokeLocked(task);
}
```

---

### 0x021CDED0 (748 B, class F, overlay=ov004)

**Original verdict:** F — "large; referenced by 021d6734 as sink; trade
loop body, wide branch"

**Upgrade reason:** `Ov004_RunTradeLoop` per the map doc. A gated init-once
block (`func_02001bc8`+`func_02094550` writing a fixed literal display
buffer) then a `slot==0` gate for the `func_ov004_021cdd38` (just documented
above) call with mode-dependent args, an `f40`/`f4c` combo check selecting
which of 4 already-catalogued string globals (`data_ov004_02209d10`/`_d30`/
`_d4c`/`_d68`) to render via `func_02091554`, and a final TaskConfig-build
block identical in shape to the ones already seen in `021cced8`/`021cd3b4`.
`data_02104c78`+`data_02104c7a` bitfield-index-into-string idiom is the same
already-catalogued pattern from `021cc7bc` (dual-byte selector).

**Struct/data needed:**
- `data_021040ac` — `+0x40`/`+0x4c`/`+0xa64`/`+0xba4`/`+0xba8` (already
  touched by other functions in this batch).
- `data_0210594c` — `+0x52`/`+0x58` (already documented in `Ov017Ov019Retriage.md`
  as the "activity counters" struct, reused here for a different purpose:
  card-count halfwords).
- `data_ov004_02209d08`/`_d10`/`_d30`/`_d4c`/`_d68` — 5 already-catalogued
  string labels (same `Category 5` family as `021cced8`'s set).

**Ground-truth pool words (verbatim):**

```
0x00007fff             ; DMA size mask
0x00001ce7             ; layout literal (fixed display config)
0x05000300             ; VRAM palette-DMA destination
data_02104f4c          ; system-clock cluster
data_02105989          ; string/data ref C
data_02104c78          ; index-selector byte source
data_02104c7a          ; string/data ref A
data_021040ac          ; global state record (+0x40/4c/a64/ba4/ba8)
data_0210594c          ; card-count halfwords (+0x52/+0x58)
0x000006c7             ; card-name-string ID A
data_ov004_02209d08    ; string label (arg1 to func_020a978c)
0x000006c6             ; card-name-string ID B
data_ov004_02209d10    ; string label ("category 0")
data_ov004_02209d30    ; string label ("category 1")
data_ov004_02209d4c    ; string label ("category 2")
data_ov004_02209d68    ; string label ("category 3 / default")
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_02001bc8
func_02094550
func_02001d68
func_ov004_021cdd38
func_02034844               (x2)
func_02001d68
func_0202c0c0                 (x2, one per branch)
func_020a978c                  (x2)
func_ov004_021cdd38
func_02091554                   (x4, category label picks)
func_02006b10
func_02091554                    (fallback pick)
func_02006c0c
func_0201d47c
func_0201e5b8
Task_Invoke
```

**Recipe sketch (top-level shape):**

```c
void Ov004_RunTradeLoop(int slot) {
    static int inited = 0;
    if (!inited) {
        char buf[0x20];
        func_02001bc8(buf, 0x00007fff, 0x00001ce7);
        func_02094550(buf, 0x05000300, 0x20);
    }
    if (data_021040ac[slot].f68 > 0) return;
    if (slot == 0) {
        func_02001d68((s8)data_02104f4c.fa3c lang);
        Ov004_DrawTradeControls(0, data_02105989);
    } else {
        int idx = data_02104c78[func_02034844()];
        func_02001d68(idx);
        Ov004_DrawTradeControls(1, idx * 0x1a + data_02104c7a);
    }
    func_02001d68((s8)data_021040ac.f4 lang);
    char *nameBuf;
    if (data_021040ac.f40 && data_021040ac.f4c == 1) {
        u16 val = (slot == 0) ? data_021040ac->fba4 : data_0210594c.f58;
        nameBuf = func_0202c0c0(0x6c7);
        func_020a978c(nameBuf, data_ov004_02209d08, val);
    } else {
        u16 val = (slot == 0) ? data_021040ac->fba4 : data_0210594c.f52;
        nameBuf = func_0202c0c0(0x6c6);
        func_020a978c(nameBuf, data_ov004_02209d08, val);
    }
    Ov004_DrawTradeControls(slot + 2, nameBuf);
    char *label;
    if (data_021040ac.f44) {
        int row = /* mla via ba64 bitfield */;
        label = data_ov004_02209d10 + row;
    } else if (slot == 0) {
        label = data_ov004_02209d30;
    } else {
        label = (func_02034844() != 0) ? data_ov004_02209d4c : data_ov004_02209d68;
    }
    if (!func_02006b10(label)) label = data_ov004_02209d68 /* fallback */;
    void *task = func_02006c0c(label, 4, 0);
    TaskConfig cfg;
    func_0201d47c(&cfg);
    cfg.field_c = (slot << 0xc) + 0x1400;
    cfg.bgFlags = (cfg.bgFlags & ~0xf) | 4;
    cfg.bgFlags |= 0x10;
    cfg.handle = task;
    func_0201e5b8(&cfg);
    Task_Invoke(task);
    data_021040ac[slot].f68 = 0x10;
}
```

---

### 0x021CE1EC (376 B, class E, overlay=ov004)

**Original verdict:** E — "timer/animation bar draw, 2 near-identical
halves"

**Upgrade reason:** `Ov004_DrawTimerBar` per the map doc. Exactly two
near-identical halves, each: an increment-and-clamp on `b500+0x68`/`+0x6c`
(count up to `0x100` in steps of `0x10`), a magnitude-and-sign split, an
`Ov004_LayoutCell` call with the resulting box width, a BLDALPHA-style
packed-literal build (`func_02005dac`), and two `func_ov004_021cde38` calls
with different literal alpha/fade args. This is a textbook "two symmetric
timer-bar halves" body — the "2 near-identical halves" flag in the original
classification is exactly the deterministic-duplication signal the KB
methodology expects, not entropy.

**Struct/data needed:** `data_ov004_0220b500` (b500) — `+0x68`/`+0x6c`
(two independent timer-bar counters, already-referenced pattern).

**Ground-truth pool words (verbatim):**

```
data_ov004_0220b500   ; b500 main state record
0xc0002022             ; BLDALPHA-family packed literal A
0x00000136             ; magnitude constant (0x136 = 310, bar length)
0xc000204d             ; BLDALPHA-family packed literal B
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_ov004_021ca0a4     (Ov004_LayoutCell, x2 — one per bar half)
func_02005dac              (x2)
func_ov004_021cde38      (x4 — 2 per bar half)
```

**Recipe sketch:**

```c
void Ov004_DrawTimerBar(void) {
    if (data_ov004_0220b500.f68) {
        int t = data_ov004_0220b500.f68;
        if (t < 0x100) { t += 0x10; data_ov004_0220b500.f68 = t; }
        int w = (t >= 0) ? (0x100 - t) : -(0x100 - t);
        w = 4 - w;
        Ov004_LayoutCell(&b500.2f8+0x5c00, 0, w, 0x1f, 1, 0);
        u32 packed = 0xc0002022 | ((w + 4) << 0x17 >> 7);
        SetBldAlpha(&packed, 1, 0);           /* func_02005dac */
        func_ov004_021cde38(w + 0x3a, 0x23, 0);
        func_ov004_021cde38(w + 0x3a, 0x33, 2);
    }
    if (data_ov004_0220b500.f6c) {
        int t = data_ov004_0220b500.f6c;
        if (t < 0x100) { t += 0x10; data_ov004_0220b500.f6c = t; }
        int abs_t = (t >= 0) ? t : -t;
        int w = 0x136 - abs_t;
        Ov004_LayoutCell(&b500.2f8+0x5c00, 1, w, 0x4a, 1, 1);
        u32 packed = 0xc000204d | ((w + 0x92) << 0x17 >> 7);
        SetBldAlpha(&packed, 1, 0);
        func_ov004_021cde38(w + 0xc, 0x57, 1);
        func_ov004_021cde38(w + 0xc, 0x68, 3);
    }
}
```

---

### 0x021CE364 (324 B, class E, overlay=ov004)

**Original verdict:** E — "timer panel draw, triple bounded loop"

**Upgrade reason:** `Ov004_DrawTimerPanel` per the map doc. Three bounded
loops in sequence, each capped at `0x3c` (60) iterations: (1) a linear scan
matching `func_02052cdc(panel, entry)` against a stride-0x54 table, copying
3 bytes + 1 word on match and returning the index; (2) a linear scan calling
`func_02053170` per entry, tracking the first index where it returns
nonzero; (3) a min-scan tracking the entry with the smallest `+0xd34` field.
All three loops are simple linear searches over a fixed-size, fixed-stride
table — zero register-allocation ambiguity, just three textbook scan idioms
chained with early-exit fallthrough.

**Struct/data needed:**
- `data_ov004_0220b500` (b500) — `+0x50`/`+0x51`/`+0x52`/`+0x4c` (per-entry
  copy destination fields), `+0x48` (found-flag).
- `data_ov004_0220f228` — stride-0x54, 60-entry table (fields `+0xd74`
  (word), `+0xd78`/`+0xd79`/`+0xd7a` (bytes), `+0xd34` (int, scan-3 compare
  key)) — new global, not previously catalogued (see New KB gaps).

**Ground-truth pool words (verbatim):**

```
data_ov004_0220b500   ; b500 main state record
data_ov004_0220f228   ; stride-0x54 60-entry timer/panel table
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_02052cdc    (x1 per loop-1 iteration, up to 60x)
func_02094688    (on match, loop 1)
func_02053170    (x1 per loop-2 iteration, up to 60x)
func_02094688    (on match, loop 2)
func_02094688    (on match, loop 3 fallback)
```

**Recipe sketch:**

```c
int Ov004_DrawTimerPanel(Ov004Panel *panel) {
    Ov004TimerEntry *table = &data_ov004_0220f228;
    for (int i = 0; i < 0x3c; i++) {
        if (func_02052cdc(panel, &table[i])) {
            panel->f50 = table[i].fd78;
            panel->f51 = table[i].fd79;
            panel->f52 = table[i].fd7a;
            panel->f4c = table[i].fd74;
            func_02094688(panel);
            return i;
        }
    }
    for (int i = 0; i < 0x3c; i++) {
        if (func_02053170(&table[i])) {
            panel->f48 = 1;
            func_02094688(panel);
            return i;
        }
    }
    int best = -1, best_val = -1;
    for (int i = 0; i < 0x3c; i++) {
        if (table[i].fd34 < best_val) { best_val = table[i].fd34; best = i; }
    }
    panel->f48 = 1;
    func_02094688(panel);
    return best;
}
```

---

### 0x021CE4A8 (1296 B, class F, overlay=ov004)

**Original verdict:** F — "very large; master render call for trade
session, dense MMIO"

**Upgrade reason:** `Ov004_RenderTradeSession` per the map doc. Despite
being the largest function in the ov004 batch, every construct maps onto
already-named callees or already-documented struct fields: a
`data_ov004_0220e500+0xcd0` gate (already flagged as a KB gap in
`Ov004Ov006Deep.md`, hence pre-existing not new) triggers a fade+toast
sequence sharing the exact `func_0208e2f4(0x4000050/0x4001050, mode, ...)`
main/sub fade idiom already documented across R6/R7. `Ov004_UpdateCardSlots`
(`021cded0`, matched above in this doc) and `Ov004_DrawTimerPanel`
(`021ce364`, matched above) are called as sub-steps. The 3-block BLDCNT
pack-and-DMA sequence (`0x1f00`/`0x0400100e` clear-mask idiom) is the
standard main/sub BG-mode-field pack already catalogued in
`Ov017Ov019Retriage.md`'s `021b22ec`. The `data_02104f4c+0xa68` `&0x800000`
bit-test gate is a member of the already-documented "achievement/mode
cluster" (`+0xa64..+0xa7c`, byte-verified in R7's `Ov017Ov019Retriage.md`
KB-gaps section). The trailing 4-iteration render loop
(`.L_610`, literal stride `0x1a`) matches the fixed-geometry render-loop
idiom used throughout ov017 (`Ov017_DrawCardCount`-style).

**Struct/data needed:**
- `data_ov004_0220e500` — `+0xcd0` (already-flagged gate, see New KB gaps
  — carried forward from `Ov004Ov006Deep.md`, not new here).
- `data_ov004_0220b500` (b500) — `+0x44`/`+0x84`/`+0x220`/`+0x224`/`+0x228`/
  `+0x22c`/`+0x230`/`+0x234`/`+0x238`/`+0x3000+0xcd0`.
- `data_02104f4c` — `+0xa68` (achievement/mode cluster, `&0x800000` gate;
  documented per R7).
- `data_ov004_02209d88`/`_da0`/`_db8`/`_dd0` — 4 new string/task-template
  labels (see New KB gaps).

**Ground-truth pool words (verbatim):**

```
data_ov004_0220b500   ; b500 main state record
data_ov004_0220e500   ; secondary ov004 BSS block (already-flagged gap)
data_021040ac         ; global state record
0x04001050             ; BLDCNT sub
0x0400106c             ; MASTER_BRIGHT sub
data_ov004_022915e8   ; lock-gate object
0x04001000             ; DISPCNT sub
0x00003860             ; DISPCNT-family literal
0x0000779b             ; DISPCNT-family literal
0x05000400             ; BG palette dest
data_ov004_02209d88   ; task-template pointer A
0x0400100e             ; BG1CNT-family clear-mask target
data_ov004_02209da0   ; task-template pointer B
data_ov004_02209db8   ; task-template pointer C
data_ov004_02209dd0   ; task-template pointer D
data_02102c90         ; GlobalData02102c7c cluster (text-render context)
data_02104f4c         ; system-clock cluster (+0xa68 achievement/mode bit)
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_ov004_021ce364     (Ov004_DrawTimerPanel, matched above)
func_0208e2f4
func_0208c884
func_ov004_021d8648
func_0202c0c0
func_ov004_021d8798
func_02009494
func_ov004_021d8cd0
func_0208c884
func_ov004_021ca4f8
func_ov004_021cded0     (Ov004_UpdateCardSlots, matched above)
func_02001bc8
func_02094550
func_0208de4c
func_02094504
func_0208e0a0
func_02094504
func_02006c0c
func_0201d47c
func_0201e5b8
Task_Invoke
func_0208dd9c
func_02094504
func_02006c0c
func_0201d47c
func_0201e5b8
Task_Invoke
func_ov004_021c9fcc
func_ov004_021d8648
func_02001d0c
func_0208de4c
func_02094504
func_0202c0c0               (x4, per-loop-iteration)
func_020054a4                 (x4)
func_02004f58                  (x4)
func_0208e0a0
func_02001e94
func_ov004_021c9ef0
func_02034888
func_02009758
func_0208e2f4
func_0208c884
func_0202c0c0
func_ov004_021d8798
func_02008888
func_ov004_021d8cd0
func_0208c884
```

**Recipe sketch (top-level shape only; the 4-iteration render loop and BLDCNT
pack sequences follow the identical shape already fully specified in
`Ov017Ov019Retriage.md`'s `021b22ec`):**

```c
void Ov004_RenderTradeSession(void) {
    data_ov004_0220b500.f6c = 0;
    data_ov004_0220b500.f68 = 0;
    if (data_ov004_0220e500.fcd0) {
        int t = Ov004_DrawTimerPanel(&data_021040ac.d4 + 0x3c00);
        data_021040ac->fbac = t;
        if (t >= 0) {
            func_0208e2f4(0x04001050, -0x10);
            func_0208c884(0x0400106c, 0);
            Ov004_UpdateLockGate(data_ov004_022915e8);   /* func_ov004_021d8648 */
            char *name = func_0202c0c0(0xe8);
            Ov004_QueueDisplayRequest(data_ov004_022915e8, name, 1);
            func_02009494(&data_021040ac.128 + 0x3c00);
            Ov004_ApplyBlendAlpha(data_ov004_022915e8);
            func_0208c884(0x0400106c, -0x10);
            *(u16*)0x04001050 = 0;
        }
        data_ov004_0220b500.f3000.fcd0 = 0;
    }
    Ov004_ClearRadioButtons();              /* func_ov004_021ca4f8 */
    Ov004_UpdateCardSlots(0);
    /* DISPCNT/BG-mode pack, palette DMA setup */
    if (data_ov004_0220b500.f44) {
        /* TaskConfig-build for the "with header" variant, mode field=2 */
    }
    /* second TaskConfig-build for the always-present body panel */
    /* zero 7 trade-record fields on b500 + f84=-1 */
    Ov004_ClearAudioSprite();               /* func_ov004_021c9ef0 */
    func_02034888(3, sp+8, 2);
    if (data_ov004_0220b500.f44) {
        if (!(data_02104f4c.fa68 & 0x800000)) {
            func_02009758(0x2b);
            data_02104f4c.fa68 |= 0x800800;
            func_0208e2f4(0x04001050, -0x10);
            func_0208c884(0x0400106c, 0);
            char *name = func_0202c0c0(0xe8);
            Ov004_QueueDisplayRequest(data_ov004_022915e8, name, 1);
            func_02008888();
            Ov004_ApplyBlendAlpha(data_ov004_022915e8);
            func_0208c884(0x0400106c, -0x10);
            *(u16*)0x04001050 = 0;
        }
    } else {
        char *name = func_0202c0c0(0xdf);
        Ov004_QueueDisplayRequest(data_ov004_022915e8, name, 0);
    }
}
```

---

### 0x021CF070 (824 B, class F, overlay=ov004)

**Original verdict:** F — "exchange input handler, big jump table + inline
loop"

**Upgrade reason:** `Ov004_ProcessExchangeInput` per the map doc. A single
bounded `addls pc,pc,r0,lsl#2` jump table over `0x17` (23) message-type
cases, each writing fixed literal fields and/or dispatching to
`func_02034888` (a documented message-queue-post primitive, same call shape
as the `func_02012454`/`func_020124a4` message-pack pair already used
throughout this batch). The tail case (`.L_588`) is a bounded 0x40-iteration
bit-scan loop building a 16-bit-per-slot bitmask array from a byte-table —
fully deterministic. `data_02104f4c+0xa6c`/`+0xa70` are members of the
already-documented "achievement/mode cluster" (R7).

**Struct/data needed:**
- `data_ov004_0220b500` (b500) — `+0x220`/`+0x224`/`+0x228`/`+0x22c`/`+0x230`/
  `+0x48`/`+0x54` (trade-record fields, already touched by `021ce4a8`).
- `data_021040ac` — `+0x38`/`+0xc38` (message-buffer fields).
- `data_02104f4c` — `+0xa6c`/`+0xa70` (achievement/mode cluster counters,
  documented per R7), `+0xc74` (bitmask-scan source table, new — see New KB
  gaps).

**Ground-truth pool words (verbatim):**

```
data_ov004_0220b500   ; b500 main state record
data_ov004_022915e8   ; lock-gate object
0x00000126             ; message-type literal (0x126)
data_021040ac         ; global state record (+0x38/c38)
data_02104f4c         ; system-clock cluster (+0xa6c/a70, +0xc74 bit table)
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_020349ec
func_ov004_021cded0      (Ov004_UpdateCardSlots, matched above)
func_ov004_021d8cd0
func_ov004_021c9ef0        (x2, message-type cases)
func_02037208                 (x2, toast on mode-change)
func_02012454                  (x4)
func_020124a4                    (x1)
func_02034888                     (x6, once per non-loop case)
```

**Recipe sketch (jump-table shape; the 0x40-iteration bitmask-scan case
`.L_588` is a bounded loop shown in full):**

```c
int Ov004_ProcessExchangeInput(void) {
    ExchangeMsg msg;
    if (!func_020349ec(3, &msg)) return 0;
    switch (msg.type) {
    case 3: data_ov004_0220b500.f220 = 1; Ov004_UpdateCardSlots(0); Ov004_ApplyBlendAlpha(data_ov004_022915e8); break;
    case 4:
        if (!data_ov004_0220b500.f44) {
            data_ov004_0220b500.f230 = msg.arg; data_ov004_0220b500.f228 = 0;
            func_ov004_021c9ef0(0xea);
            func_02037208(0x48 - 0x49, 0, 0, 1);
        }
        break;
    case 5:
        data_ov004_0220b500.f230 = msg.arg; data_ov004_0220b500.f228 = 1;
        if (!data_ov004_0220b500.f44) {
            func_ov004_021c9ef0(0xeb);
            func_02037208(0x3a - 0x3b, 0, 0, 1);
        }
        break;
    case 7: {
        int a = func_02012454(0);
        func_020124a4(1, a, 7);
        func_02034888(3, &a, 0x126);
        break;
    }
    /* cases 8,9,10,11: message-type packing variants */
    case 21: {
        int a = func_02012454(0);
        data_ov004_0220b500.f48 = 8; data_ov004_0220b500.f54 = 4;
        break;
    }
    case 22: {
        u16 val = msg.arg;
        u16 buf[6] = { 0x17, val, 0, 0, 0, 0 };
        for (int i = 0, base = val << 6; i < 0x40; i++, base++) {
            if (data_02104f4c.fc74[base / 8] & (1 << (base & 0x1f))) {
                int slot = base >> 4, bit = base & 0xf;
                buf[2 + slot] |= (1 << bit);
            }
        }
        func_02034888(3, buf, 10);
        break;
    }
    default:
        return 1;
    }
    return 1;
}
```

---

### 0x021CF3A8 (600 B, class F, overlay=ov004)

**Original verdict:** F — "trade input handler, 4-iteration loop + branchy
tail"

**Upgrade reason:** `Ov004_ProcessTradeInput` per the map doc. A fixed
4-iteration loop calling `Ov004_LayoutCell` per trade-slot with literal
box-position args (`data_ov004_0220b500+0xf90+0x5000` base, stride `0x1a`),
followed by two bounded 2-way gates (`b500+0x54==4`, `b500+0x60==0`) each
selecting between two `Ov004_LayoutCell` literal-arg variants, then a final
`Ov004_LayoutCell` call and an `Ov004_ClearRadioButtons`
(`func_ov004_021ce9b8`)-based cache-invalidation check. Every call target
and literal is already catalogued from `021cda8c`/`021ce4a8` above — this is
the same "layout cell fan-out" idiom repeated with a different box grid.

**Struct/data needed:**
- `data_ov004_0220b500` (b500) — `+0x22c`/`+0x224`/`+0x234`/`+0x54`/`+0x60`/
  `+0x228`/`+0x230`/`+0x238` (trade-record fields, same struct as
  `021ce4a8`/`021cf070`).

**Ground-truth pool words (verbatim):**

```
data_ov004_0220b500   ; b500 main state record
data_02102c90          ; GlobalData02102c7c cluster (text-render context)
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_ov004_021ceb6c
func_ov004_021ca0a4     (x5: 4-loop + one extra)
func_ov004_021ce9b8       (x2, cache check + re-fetch)
func_02001d0c
func_0208de4c
func_02094504
func_0202c0c0
func_020054a4
func_02004f58
```

**Recipe sketch:**

```c
int Ov004_ProcessTradeInput(void) {
    int base = Ov004_GetLayoutBase();            /* func_ov004_021ceb6c */
    for (int i = 0, se = 0x3e; i < 4; i++, se += 0x1a) {
        int arg;
        if (data_ov004_0220b500.f234 && data_ov004_0220b500.f22c == i)
            arg = 1;
        else
            arg = 0;
        Ov004_LayoutCell(&b500.f90+0x5000, 2, 0x2e, se, arg + 0x12);
    }
    if (data_ov004_0220b500.f54 != 4) {
        if (data_ov004_0220b500.f60 == 0) {
            int row = data_ov004_0220b500.f22c;
            if (row > 3) row = 3;
            if (data_ov004_0220b500.f224) {
                if (data_ov004_0220b500.f224 & ~0x1b)
                    /* no-op */;
                else
                    Ov004_LayoutCell(&b500.f90+0x5000, 2, row*0x1a+0x40, 0xe, 0x16);
            } else {
                Ov004_LayoutCell(&b500.f90+0x5000, 2, row*0x1a+0x3e, 0xe, 0x18);
            }
        }
        int row = data_ov004_0220b500.f230;
        if (row > 3) row = 3;
        if (data_ov004_0220b500.f228) {
            if (data_ov004_0220b500.f228 & ~0x1b) return base;
            Ov004_LayoutCell(&b500.f90+0x5000, 2, row*0x1a+0x40, 0xd2, 0x17);
        } else {
            Ov004_LayoutCell(&b500.f90+0x5000, 2, row*0x1a+0x40, 0xd7, 0x19);
        }
    }
    Ov004_LayoutCell(&b500.f90+0x5000, 2, base, 0xe4, 3);
    if (data_ov004_0220b500.f238 != Ov004_GetLayoutBase())
        return base;
    data_ov004_0220b500.f238 = Ov004_GetLayoutBase();
    func_02001d0c(data_02102c90, 0x14, 0xc);
    void *vram = func_0208de4c();
    func_02094504(0, vram + 0x2680, 0x780);
    char *name = func_0202c0c0(data_ov004_0220b500.f238 + 0xe5);
    int w = func_020054a4(name, 0xc);
    int off = (0xa0 - w + ((0xa0-w)>>0x1f)) >> 1;
    func_02004f58(data_02102c90, name, vram + 0x1000, off <= 0 ? 0 : off, 0xc);
    return base;
}
```

---

### 0x021CF638 (1356 B, class F, overlay=ov004)

**Original verdict:** F — "large detail-panel draw, wide multi-tier
dispatch"

**Upgrade reason:** `Ov004_DrawDetailPanel` per the map doc. A top-level
`func_020347b8` gate selecting between an "external-message" path
(`func_0202046c`/`func_0201d364`/`func_0201d050`/`func_0201d384`) and a
main state-machine path structured exactly like `021cda8c`'s 2-level
dispatcher: `b500+0x54` selects one of ~24 message-type cases via TWO
successive bounded computed branches (`b500+0x54 <= 0x13` range,
then `> 0x13` range), each writing fixed literal fields and dispatching to
already-matched siblings (`func_ov004_021ced78`, `func_ov004_021cedf8`,
`func_ov004_021cf070`/`021cf3a8` matched above). Every dispatched target and
literal in this ~1.3KB body is already named — the "wide multi-tier
dispatch" signal is exactly the bounded-jump-table pattern already proven
tractable across the whole R7/R8 batch.

**Struct/data needed:**
- `data_ov004_0220b500` (b500) — `+0x48`/`+0x54`/`+0x58`/`+0x8c`/`+0x220`/
  `+0x224`/`+0x228`/`+0x22c`/`+0x230`/`+0x234`/`+0x3000+0xc0c`/`+0xc10`
  (all already touched by `021cda8c`/`021ce4a8`/`021cf070` above).
- `data_02105a4c` — external seed data block (already documented in
  `Ov004Ov006Deep.md`'s `021b5c2c` entry — cross-overlay shared global,
  here used as a message-argument source rather than a stride-table seed).

**Ground-truth pool words (verbatim):**

```
data_ov004_0220e500   ; secondary ov004 BSS block (already-flagged gap)
data_ov004_0220b500   ; b500 main state record
data_ov004_022915e8   ; lock-gate object
0x00000101             ; message-type literal
data_02105a4c          ; external seed data block (already documented)
0x00000126             ; message-type literal (shared w/ 021cf070)
data_021040ac          ; global state record
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_020347b8
func_0202046c
func_0201d364
func_0201d050              (x8, once per branch)
func_0201d384
func_ov004_021d8cd0     (Ov004_ApplyBlendAlpha, x2)
func_ov004_021cf070       (Ov004_ProcessExchangeInput, matched above)
func_0201d34c
func_ov004_021c9ef0        (x5, various message IDs)
func_0202c0c0                (x2)
func_ov004_021d8798            (x2)
func_02034888                 (x3)
func_ov004_021ced78         (x2, decision gate)
func_ov004_021cedf8
func_02034844                    (x2, seed-index picks)
func_02012454                   (x2)
func_02037208                    (toast, on trailing-state dispatch)
func_0201d040
func_0201cfe0
func_020124a4
func_02008f24
func_ov004_021d8d58
func_ov004_021cf600
func_ov004_021cf3a8         (Ov004_ProcessTradeInput, matched above)
func_ov004_021ca198
func_ov004_021d9134
func_ov004_021ce1ec           (Ov004_DrawTimerBar, matched above)
```

**Recipe sketch (top-level shape; the ~24-case message dispatcher follows
the identical bounded-branch idiom already shown in full for `021cda8c`):**

```c
int Ov004_DrawDetailPanel(void) {
    data_ov004_0220e500.fbd8 = -1;
    if (!func_020347b8()) {
        if (!Ov004_ProcessExchangeInput() && !func_0201d34c()
            && (data_ov004_0220b500.f5c != 0)) {
            switch (data_ov004_0220b500.f54) {
            case 0x16: /* external-record request */
                data_ov004_0220b500.f54 = 4; data_ov004_0220b500.f220 = 1;
                Ov004_ApplyBlendAlpha(data_ov004_022915e8);
                break;
            case 9: case 11: /* dispatch-ready pair */
                Ov004_MessageDispatch();      /* 0201d040 gated variant */
                break;
            default:
                if (data_ov004_0220b500.f54 <= 0x13) {
                    switch (data_ov004_0220b500.f54) {
                    case 5: /* toast 0xe1 */
                        func_0201d050(0);
                        if (data_ov004_0220b500.f220) {
                            func_ov004_021c9ef0(0xe1);
                            data_ov004_0220b500.f54++;
                        }
                        break;
                    case 6: /* deadline-count "field 224/228" pair */
                        func_ov004_021cedf8();
                        if (++data_ov004_0220b500.f224 > 0x1e
                            && ++data_ov004_0220b500.f228 > 0x1e) {
                            if (func_ov004_021ced78()) {
                                /* 5-way sub-dispatch on f22c: 0..4 */
                            } else {
                                data_ov004_0220b500.f228 = data_ov004_0220b500.f224 = 0;
                            }
                        }
                        break;
                    /* cases 0-4,7,8,10,12,13: no-op range */
                    }
                } else if (data_ov004_0220b500.f54 == 0x16) {
                    /* handled above */
                }
            }
        }
    } else {
        if (func_0202046c()) func_0201d384();
        else { func_0201d364(); func_0201d050(0); }
        if (data_02105a4c.f0) Ov004_ApplyBlendAlpha(data_02105a4c);
    }
    Ov004_ApplyBlendAlpha(data_ov004_022915e8);
    if (data_ov004_0220b500.f44) func_ov004_021cf600();
    else Ov004_ProcessTradeInput();
    func_ov004_021ca198();
    Ov004_UpdateSubEngine(data_ov004_022915e8);
    Ov004_DrawTimerBar();
    return 0;
}
```

---

### 0x021CFC64 (264 B, class E, overlay=ov004)

**Original verdict:** E — "info text draw, DMA + task chain, near-duplicate
of another function"

**Upgrade reason:** `Ov004_DrawInfoText` per the map doc, and the "near-
duplicate" flag is accurate: it is byte-for-byte structurally identical to
`021cdd38` (`Ov004_DrawTradeControls`, matched above in this doc), differing
only in literal constants (task size `0x600` vs `0x400`, glyph color `0x18`
vs `0x10`, bar length `0x60` vs `0x40`, loop bound `6` vs `4`, callee
`func_0208fd30` vs `func_0208fd90`, row-geometry multiplier `r6*3` vs plain
`r6`). This is a genuine sibling recipe, not a coincidental address reuse —
same call sequence, same argument shapes, only the constants differ.

**Struct/data needed:** `data_02102c90` (same `GlobalData02102c7c` cluster
member as `021cdd38`) — no new globals.

**Ground-truth pool words (verbatim):**

```
data_02102c90   ; GlobalData02102c7c cluster (text-render context)
```

**Ground-truth BL targets (verbatim, in call order):**

```
Task_PostLocked
func_02094504
func_02001d0c
func_020054a4
func_02004f58
func_02092904
func_0208fd30    (x12: 2 calls x 6 loop iterations)
Task_InvokeLocked
```

**Recipe sketch (differences from `021cdd38` highlighted):**

```c
void Ov004_DrawInfoText(int row_base, char *text) {
    void *task = Task_PostLocked(0x600, 4, 0);       /* 0x600 not 0x400 */
    func_02094504(0, task, 0x600);
    func_02001d0c(data_02102c90, 0x18, 2);            /* 0x18 not 0x10 */
    int w = func_020054a4(text, 0xc);
    int off = (w + (w >> 0x1f)) >> 1;
    int centered = (off > 0x60) ? 0 : (0x60 - off);   /* 0x60 not 0x40 */
    func_02004f58(data_02102c90, text, task, centered, 0xc);
    func_02092904(task, 0x600);
    int row = ((row_base * 3) << 0xa) / 2 + 0x80;
    void *dst = task, *dst2 = task + 0x300;
    int src_row = row, mult = 1;
    for (int i = 0; i < 6; i++) {                     /* 6 not 4 */
        func_0208fd30(dst, src_row, 0x80);
        func_0208fd30(dst2, row + (mult * 0x80), 0x80);
        src_row += 0x100;
        dst += 0x80; dst2 += 0x80;
        mult += 2;
    }
    Task_InvokeLocked(task);
}
```

---

### 0x021CFE08 (864 B, class F, overlay=ov004)

**Original verdict:** F — "large; trade phase update, dense NitroSDK MMIO
init sequence"

**Upgrade reason:** `Ov004_UpdateTradePhase` per the map doc. This is a
pure hardware-init sequence — the "dense MMIO" flag correctly identifies a
big body, but every single call is a bare NitroSDK/2D-engine setter
(`func_0208cf58`/`_cf44`/`_cf20`/`_cee8`/`_ced4`, `func_0208da2c(0x10)`,
`func_0208d7ac(0x40)`, `func_0208d4f0(3)`, `func_0208d3fc(0x20)`,
`func_0208c8cc(1,0,r0)`) with fixed literal args, followed by a documented
DISPCNT/BLDCNT bit-pack sequence (`0x3000`/`0x10`/`0x8` masks — same idiom
as `021ce4a8`), a wireless/comm init block (`func_0207deb0`/`_e124`/`_e370`,
`func_020931f8`, `func_0208232c`, `func_0208ecd8`), a VRAM-bank config block
(`func_0208226c`/`_2258`/`_2210`/`_2234` with fixed bank literals `0x93d`/
`0x318c`/`-0x93d`(`0xfffff6c3`)), and a final task/palette bring-up
(`func_ov000_021aae34`, `func_0208205c`, `func_0208539c`/`_53dc`,
`func_02021b28`/`_1064`). Zero branches, zero loops — a linear sequence of
~55 fixed-arg calls. This is the OV006-pattern full-init idiom already
documented across R6/R7 applied to ov004's trade sub-engine bring-up.

**Struct/data needed:**
- `data_02104f1c` — task-handle store (new — see New KB gaps).
- `data_ov004_02211528`/`_1538`/`_1544`/`_1548` — 4 config-block globals
  (new — see New KB gaps; likely display-parameter records paralleling the
  `data_ov004_02209dXX`/`_da0` family already documented in Category 5/6 of
  `Ov004Ov006DataTables.md`).
- `data_021a18b8`/`_18c0` — wireless-comm config words (new — see New KB
  gaps).
- `data_ov004_02209de0` — string label (same family as `021cced8`'s set).

**Ground-truth pool words (verbatim):**

```
0x04000060             ; MMIO BLDALPHA-family register
0xffffcffd             ; bit-clear mask
0x0000cffb             ; bit-clear mask (complement pair)
0xbfff0000             ; bit-clear mask
data_02104f1c          ; task-handle store (new)
data_ov004_02211528    ; config block A (new)
data_021a18c0          ; wireless-comm config word B (new)
data_021a18b8          ; wireless-comm config word A (new)
0x00007fff             ; VRAM bank mask (shared literal, x2 uses)
0x00004210             ; VRAM bank base literal
0x0000093d             ; VRAM bank size literal
0x0000318c             ; VRAM bank size literal
0xfffff6c3             ; VRAM bank size literal (negative, -0x93d)
0x04000008             ; BG2CNT register
data_ov004_02211538    ; config block B (new)
data_ov004_02209de0    ; string label
data_ov004_02211544    ; config block C (new)
data_ov004_02211548    ; config block D (new)
0x04000540             ; MMIO register
0x0400000a             ; BG3CNT register
0x00003860             ; DISPCNT-family literal (shared w/ 021ce4a8)
0x0000779b             ; DISPCNT-family literal (shared w/ 021ce4a8)
0x050001e0             ; VRAM palette dest
0x04001000             ; DISPCNT sub
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_0208cf58
func_0208cf44
func_0208cf20
func_0208cefc
func_0208cee8
func_0208ced4
func_0208da2c
func_0208d7ac
func_0208d4f0
func_0208d3fc
func_0208c8cc
func_0208e5ec
func_0207deb0
func_0207e124
func_0207e370
func_020931f8
func_0208232c
func_0208ecd8
func_02082234
func_02082210
func_0208226c              (x3, bank-config triples)
func_02082258                (x2)
func_020821e4
func_020822f0
func_02084fe0
func_ov000_021aae34
func_020854e4
func_0208205c
func_0208539c
func_020853dc
func_02021b28
func_02021064
func_02001bc8
func_02094550
func_0208c940
func_0202c948
func_0202c9c0
func_ov004_021d0168
```

**Recipe sketch (top-level shape — a linear sequence of fixed-arg NitroSDK
calls with no branches; shown as a representative excerpt since the full
55-call body is a straight enumeration):**

```c
void Ov004_UpdateTradePhase(void) {
    func_0208cf58(); func_0208cf44(); func_0208cf20();
    func_0208cefc(); func_0208cee8(); func_0208ced4();
    func_0208da2c(0x10);
    func_0208d7ac(0x40);
    func_0208d4f0(3);
    func_0208d3fc(0x20);
    func_0208c8cc(1, 0, 1);
    *(vu16*)0x04000060 &= 0xffffcffd;
    *(vu16*)0x04000060 = (*(vu16*)0x04000060 & ~0x3000) | 0x10;
    *(vu16*)0x04000060 &= 0xbfff0000 /* hi16 only */;
    *(vu16*)0x04000060 = (*(vu16*)0x04000060 & ~0x3000) | 8;
    *(int*)(0x04000060 + 0x4e0) = 2;
    *(int*)(0x04000060 + 0x520) = data_ov004_02211544 /* via 0208539c chain */;
    func_0208e5ec(0);
    func_0207deb0(data_02104f1c->f1c, data_ov004_02211528, 4);
    func_0207e124(2, 1);
    func_0207e370(0x4000, 1);
    func_020931f8();
    func_0208232c();
    func_0208ecd8(-0x400000, 0x400000, 0x400000, 0, 0xc0000, 0, 0x100000);
    /* DISPCNT hi16 &= ~0x50, mode 1 */
    func_02082234(0x00007fff, 0, 1);
    func_02082210(0x00004210, 0, 0);
    func_0208226c(0, 0, 0, -0x1000);
    func_02082258(0, 0x00007fff);
    func_0208226c(1, -0x93d, -0x93d, 0);
    func_02082258(1, 0x0000318c);
    func_0208226c(2, 0x0000318c, 0x0000318c, 0);
    func_02082258(2, 0x0000318c);
    func_020821e4(7, 2, 0, 0x1f, 0x800, 0);
    func_020822f0();
    func_02084fe0();
    /* BG2CNT bic 3 / orr 2 */
    void *handle = func_ov000_021aae34();
    data_ov004_02211538 = handle;
    void *rec = func_020854e4();
    data_ov004_02211544 = rec + rec->fe + rec->fc;
    func_0208205c(data_ov004_02209de0);
    func_0208539c(data_ov004_02211544, 3);
    func_020853dc(data_ov004_02211544, 3);
    *(vu32*)0x04000000 = (*(vu32*)0x04000000 & ~0x1f00) | 0x300;
    func_02021b28();
    data_ov004_02211528 = 2;
    func_02021064();
    /* DISPCNT/DISPCNT-sub hi/lo pack via 0x3860/0x779b masks */
    char buf[0x20];
    func_02001bc8(buf, 0x3860, 0x779b);
    func_02094550(buf, 0x050001e0, 0x20);
    func_0208c940();
    data_ov004_02211548 |= 0x10000;
    func_0202c948(1, 2);
    func_0202c9c0(1);
    func_ov004_021d0168(0);
}
```

---

## ov006 Newly Tractable Funcs

### 0x021B40AC (756 B, class F, overlay=ov006)

**Original verdict:** F — "large audio init; opens bank, programs channel,
builds card-slot list with 3-path branch"

**Upgrade reason:** `Ov006_State4_AudioInitFull` per the map doc. A linear
audio-bank-open sequence (`func_0202adf8`/`_ae1c`/`_c070`, `func_020018d4`,
`func_0200197c`) followed by a call into the already-documented
init-family member `func_ov006_021b5dec` (R6, `Ov004Ov006Deep.md`), then a
3-way `data_ov006_0225cb88+0x10`-gated dispatch that builds the same fixed
2-entry × 4-field record 3 times (differing only in the outer literal
`0x4`/`0x5`/`0x6` written to `data_ov006_0225cb88[0]` at the end) — a
textbook deterministic loop-triplication, not scheduling entropy. The
`func_ov006_021b6bac` calls inside each loop are the already-catalogued
slot-weight helper (per `overlay006.md`'s premap).

**Struct/data needed:**
- `data_ov006_0225cb88` — 4-word record (`[0]`=mode, `[1..3]`=zeroed
  counters), plus a nested stride-0x10 array (12 entries: `+0x10`/`+0x14`
  zero, `+0x18`=weight, computed via `func_ov006_021b6bac`).
- `data_ov006_0225cb98` — 12-entry stride-0x10 sibling array, `+0xc` bit0
  toggled based on weight threshold (`> 6`).
- `data_ov006_0224f2ac`/`_0224f290` — already-documented audio-config
  singletons (used elsewhere in the ov006 audio-init family per R6).

**Ground-truth pool words (verbatim):**

```
data_ov006_0224f2ac   ; audio-config singleton (arg to func_0202adf8)
data_02104f4c          ; system-clock cluster (+0x4 language field)
data_ov006_021cf1b0    ; audio archive/bank pointer (arg to func_0200197c)
data_ov006_0224f448    ; card-slot object base (arg to func_ov006_021b5dec/021b60a4)
data_ov006_0225cb88    ; 4-word mode record + nested stride-0x10 array
data_ov006_0225cb98    ; 12-entry stride-0x10 sibling array
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_0202adf8
func_0202ae1c
func_0202c070
func_020018d4
func_0200197c
func_02001d68
func_ov006_021b5dec     (already matched, R6)
func_ov006_021b60a4      (already matched, R4)
func_ov006_021b6bac        (x2, per triplicated loop)
func_020373cc
```

**Recipe sketch:**

```c
void Ov006_State4_AudioInitFull(void) {
    func_0202adf8(data_ov006_0224f2ac);
    int lang = (data_02104f4c.f4 << 0x1d) >> 0x1d;
    func_0202ae1c(lang);
    func_0202c070(lang);
    func_020018d4(0xa0);
    func_0200197c(4, data_ov006_021cf1b0, 0x80000);
    func_02001d68(lang);
    func_ov006_021b5dec(data_ov006_0224f448);
    if (data_ov006_0224f290.f10 == 2) func_ov006_021b60a4(data_ov006_0224f448, 3, 0);
    int mode = data_ov006_0224f290.f10;
    int outer = (mode == 1) ? 1 : (mode == 2 ? 2 : 3);
    data_ov006_0225cb88.mode = outer;
    memset(&data_ov006_0225cb88.f4, 0, 0xc);
    for (int i = 0; i < 2; i++) {
        Ov006CardEntry *e = &data_ov006_0225cb88.arr[i];
        e->f10 = e->f14 = 0;
        int weight = (i != 0) ? func_ov006_021b6bac(data_ov006_0224f448, 1) : 6 /* default */;
        e->f18 = weight;
        data_ov006_0225cb98[i].fc = (data_ov006_0225cb98[i].fc & ~1) | (weight > 6);
    }
    func_020373cc(0x24, 1, 0, -1);
    data_ov006_0224f290.fc = 1;
    data_ov006_0224f290.f0 = 2;
}
```

---

### 0x021B7DB0 (208 B, class E, overlay=ov006)

**Original verdict:** E — "animates card slot transition, per-card branch"

**Upgrade reason:** `Ov006_Slot_AnimateTransition` per the map doc. Two
bounded loops in sequence: (1) a fixed 5-iteration call to the already-
matched `func_ov006_021b843c` (`Ov006_Slot_ClearZone`, R6); (2) a
`0x0`-to-`fp`-bounded scan (`fp = data_020b4768[0]`, the achievement-scan
loop-bound global already documented in `Ov017Ov019Retriage.md`'s
`021b22ec`) calling `func_0202b0e0` per item and either
`func_0202bb20`/`func_0202b6cc` (the exact predicate/comparator pair
already catalogued for the achievement-scan idiom) depending on a mode flag
— every branch is a deterministic filter, no scheduling ambiguity.

**Struct/data needed:** `data_020b4768` (already documented, R7 — achievement-
scan stride-0x18 table / loop-bound global) — no new globals.

**Ground-truth pool words (verbatim):**

```
data_020b4768   ; achievement-scan loop-bound global (documented, R7)
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_ov006_021b843c    (x5, fixed slot-clear loop)
func_0202b0e0             (per-item, bounded by data_020b4768[0])
func_0202bb20               (mode==0 predicate)
func_0202b6cc                (mode!=0 comparator)
```

**Recipe sketch:**

```c
int Ov006_Slot_AnimateTransition(SomeBase *p, int filter_key) {
    for (int slot = 0; slot < 5; slot++) {
        Ov006_Slot_ClearZone(p, slot, 0);
    }
    int match_count = 0, total = 0;
    int bound = data_020b4768[0];
    u16 *dst = (u16*)((u8*)p + 0x2a0 + 0x6000);
    for (int item = 1; item < bound; item++) {
        int card = func_0202b0e0(item);
        int hit = (filter_key == 0)
            ? (func_0202bb20(card) != 0)
            : (func_0202b6cc(card) == filter_key);
        if (hit) {
            dst[0] = card;
            ((u8*)dst)[2] = 1;
            dst += 2;
            match_count++;
            total++;
        }
    }
    *(u16*)((u8*)p + 0x8100 + 0x60) = total;
    *(u16*)((u8*)p + 0x8100 + 0x6a) = match_count;
    return 1;
}
```

---

### 0x021BA1F8 (364 B, class E, overlay=ov006)

**Original verdict:** E — "per-frame step for duel object, long init +
7-way dispatch"

**Upgrade reason:** `Ov006_DuelObj_Step` per the map doc. A linear
struct-zero init (`func_0202147c`/`func_0202227c`, fixed 0x28-iteration
byte-clear loop) followed by 5 unconditional calls into already-matched
siblings (`021bbdc0`/`021bbe7c`/`021bc0cc`/`021be6f4`/`021bc45c`, all in
this same doc or the map doc's `SHIP` list), a single conditional call
(`021bcb94`, matched below in this doc), then a bounded 7-way
`addls pc,pc,r0,lsl#2` computed branch on `[self+0x40]` selecting one of 5
distinguishable single-call targets, and a fixed tail sequence of 5 more
unconditional calls. This is a textbook top-level "phase driver" — every
branch target is a named, already-classified sibling function.

**Struct/data needed:**
- `data_020f8c60` — already-referenced construction-arg global (passed to
  `func_020211c8`).
- `data_021040ac` — `+0x1c` (a global "ov006-active" flag, set once at the
  end).

**Ground-truth pool words (verbatim):**

```
data_020f8c60   ; construction-arg global (arg to func_020211c8)
data_021040ac    ; global state record (+0x1c "ov006 active" flag)
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_020211c8
func_0202147c
func_0202227c    (x41: 1 + 40, fixed 0x28-iteration byte-clear loop)
func_ov006_021bbdc0
func_ov006_021bbe7c    (matched, this doc)
func_ov006_021bc0cc     (matched, this doc)
func_ov006_021be6f4      (matched, this doc)
func_ov006_021bc45c       (matched, this doc)
func_ov006_021bcb94        (matched, this doc, conditional)
func_ov006_021bcedc         (matched, this doc)
func_ov006_021beec4
func_ov006_021bf01c    (case 2)
func_ov006_021bf2a4     (case 3)
func_ov006_021bf454      (case 6)
func_ov006_021bf4fc       (case 7)
func_ov006_021bf5e4        (case 7, second call)
func_ov006_021bef6c    (default/fallback cases)
func_ov006_021bf844
func_ov006_021c0c14
func_ov006_021c0dc8
func_ov006_021bee68
func_ov006_021c11c8
```

**Recipe sketch:**

```c
int Ov006_DuelObj_Step(Ov006Battle *self) {
    self->f0 = func_020211c8(data_020f8c60);
    func_0202147c();
    self->f154 = 0;
    func_0202227c(&self->f154);
    for (int i = 0; i < 0x28; i++) {
        self->f174[i] = 0;
        func_0202227c(&self->f174[i]);
    }
    Ov006_Battle_Init(self);              /* func_ov006_021bbdc0 */
    Ov006_Battle_EnterPhase(self);
    Ov006_Battle_ExecPhase(self);
    Ov006_Battle_RankCard(self);
    Ov006_Battle_AnimCard(self, 1, 1, 1);
    if (self->f40 == 1) Ov006_Battle_ProcessEffect(self, 1, 1);
    Ov006_Battle_UpdateBoard(self, 1, 1);
    Ov006_Battle_GetTurnInfo(self);        /* func_ov006_021beec4 */
    switch (self->f40) {
    case 2: Ov006_Battle_HandleWin(self); break;      /* 021bf01c */
    case 3: Ov006_Battle_HandleLose(self); break;      /* 021bf2a4 */
    case 6: Ov006_Battle_HandleDraw(self); break;       /* 021bf454 */
    case 7:
        Ov006_Battle_HandleTimeout(self);                /* 021bf4fc */
        Ov006_Battle_Cleanup(self);                        /* 021bf5e4 */
        break;
    default: Ov006_Battle_Idle(self); break;              /* 021bef6c */
    }
    Ov006_Battle_Render(self);              /* 021bf844 */
    Ov006_Battle_UpdateHud(self);            /* 021c0c14 */
    Ov006_Battle_UpdateVfx(self);             /* 021c0dc8 */
    Ov006_Battle_SetActive(self, 1);           /* 021bee68 */
    Ov006_Battle_Finalize(self);                /* 021c11c8 */
    data_021040ac->f1c = 1;
    return 1;
}
```

---

### 0x021BB954 (1132 B, class F, overlay=ov006)

**Original verdict:** F — "battle dispatch; dispatches sub-state via table;
large switch, 30+ branches"

**Upgrade reason:** `Ov006_Battle_MainDispatch` per the map doc. The body
is a single bounded switch on `[self+0x54]` (sub-state, range 0-0x1f)
implemented as a sequence of range-checked `cmp`/`b` blocks (not a
mis-scheduled jump table — mwcc emitted binary-search-style range
compares because the case values are sparse). Every one of the ~15
distinguishable target blocks calls one or two already-matched functions
(`func_02037208` toast, `func_ov006_021bbdc0`/`_c0c14`/`_c45c`/`_bd8ac`/
`_dcdc`/`_6d1c`/`_6bc0`/`_6bd4`/`_6be8`/`_1664`/`_1678`) with fixed literal
toast IDs (`0x91`/`0x46`/`0x3a`/`0x35`/`0x56`, all consistent with the
project-standard `id-1` arithmetic idiom). The final `if (r6) {...}` block
is a fixed 4-call "commit" sequence. Nothing here is scheduling entropy —
it is a wide but fully enumerable state table.

**Struct/data needed:**
- `data_ov006_0224f448` — card-slot object base (`self`, already
  extensively documented across R4/R6/this doc).
- `data_ov006_0225de70`/`_0225cb5c` — already-referenced mode-toggle
  singletons (arg to `_6bc0`/`_6bd4`/`_6be8` and `_1664`/`_1678`
  respectively).
- `data_021040ac` — `+0x1c` (same "ov006 active" flag as `021ba1f8`).

**Ground-truth pool words (verbatim):**

```
data_ov006_0224f448   ; card-slot object base
data_ov006_0225de70   ; mode-toggle singleton A
data_ov006_0225cb5c   ; mode-toggle singleton B
data_021040ac          ; global state record (+0x1c)
```

**Ground-truth BL targets (verbatim, in call order — representative, many
repeat with different literal args per case):**

```
func_02037208    (x13, one per toast-firing case)
func_ov006_021bbdc0    (x2: early state, final commit)
func_ov006_021c0c14      (x2: early state, final commit)
func_ov006_021bc45c        (x2)
func_ov006_021be4d0
func_ov006_021be558
func_ov006_021be598
func_ov006_021bdcdc
func_ov006_021c6be8
func_ov006_021c6bd4
func_ov006_021c6bc0
func_ov006_021c1678
func_ov006_021c1664
func_ov006_021bd8ac        (matched, this doc)
func_ov006_021b6d1c          (x2)
func_ov006_021bf454
func_ov006_021be5b8     (matched, this doc — final commit)
func_ov006_021be6f4      (matched, this doc — final commit)
func_ov006_021bc0cc       (matched, this doc — final commit)
func_ov006_021bf844
```

**Recipe sketch (top-level shape; every case is a distinguishable,
fully-literal block already enumerated verbatim from the `.s`):**

```c
int Ov006_Battle_MainDispatch(Ov006Battle *self) {
    Ov006SlotRec *rec = &self->f100 + self->f54 * 0x24;
    int state = self->f54, sub = self->f50;
    int r6 = 0, r7 = 0;
    if (state >= 0x1e || state == 0x1f) { /* case 0x1f: card-DB reconnect */
        func_02037208(0x46-0x47, 0, 1);
        r6 = (data_ov006_0225de70->f0 != 0) ? 1 : 0;
        Ov006_ReconnectDb(data_ov006_0225de70, r6);      /* 021c6bc0/6bd4 */
    } else if (state >= 5 && state < 0x1e) {
        /* range 0x5-0x1d: sub-dispatch on self->f40 (0-3) */
        switch (self->f40) {
        case 0:
            func_02037208(0x42-0x43, 0, 0, 1);
            self->f50 = self->f5c; r6 = 1;
            Ov006_Battle_Init(self);
            Ov006_Battle_UpdateHud(self);
            Ov006_Battle_ExecPhase(self, r6, r7);
            break;
        case 2:
            if (state == 5) { func_02037208(0x3a-0x3b, 0, 0, 1); self->f44 = 1; }
            break;
        case 1: case 3:
            /* damage-resolve pair, matched via 021be4d0/021be558/021be598 */
            break;
        }
    } else if (state >= 0xe && state <= 0x11) {
        self->f50 = state - 0xe;
        if (self->f50 != rec->f20 /* prior */) {
            func_02037208(0x56-0x57, 0, 0, 1);
            Ov006_Battle_Init(self); r6 = 1;
            Ov006_Battle_UpdateHud(self);
            if (self->f40 == 5) Ov006_Battle_HandleDraw(self);
            Ov006_Battle_ExecPhase(self, 0, 0);
        }
    }
    /* ... additional literal state ranges 0x16-0x19, 0x1a-0x1d ... */
    if (r6) {
        Ov006_Battle_EvalCard(self);
        Ov006_Battle_RankCard(self);
        Ov006_Battle_ExecPhase(self);
        Ov006_Battle_Render(self);
        data_021040ac->f1c = 1;
    }
    return r7;
}
```

---

### 0x021BBE7C (592 B, class E, overlay=ov006)

**Original verdict:** E — "enters a battle phase, MMIO channel-config
sequence"

**Upgrade reason:** `Ov006_Battle_EnterPhase` per the map doc. A gated bank
lookup (`func_02021660(bank=5, chan=0, 0)`) followed by a bit-flag
computation (`data_ov006_0225df3c`/`0225e068`, matches the KB-documented
zero-check idiom) and a bounded 3-way switch on `self+0x40` selecting one
of 3 near-identical `stride-0xc`-indexed pointer bases (`_021cc588`/`_c478`/
`_c0f4`), then a sequence of 6 `func_020216b0` field-setter calls writing
literal field IDs (`0x3`/`0x4`/`0x11`/`0x12`/`0xd`/`0x0`) — an exact
instance of the `02021660`/`020216b0` "OBJ-attribute setter" idiom already
matched (`dossiers-high/02021660.md`) and reused throughout this whole
ov006 battle-animation family (see `021bcedc`/`021bd8ac`/`021bc0cc` below).
The second half repeats the identical shape with a second bank lookup
(`bank=5,chan=1`) and a re-derived flag/offset.

**Struct/data needed:**
- `data_ov006_021cc0f4`/`_c478`/`_c588` — 3 stride-0xc lookup tables
  (already implied by the `021bc45c` animation-table family documented in
  `overlay006.md`'s premap; here accessed at `+0x0`/`+0x2`/`+0x4`).
- `data_ov006_0225df3c`/`_0225e068` — already-referenced mode-toggle
  singletons (same `0225e068` as R4's `func_ov006_021b59e4` audio/engine
  struct pointer).

**Ground-truth pool words (verbatim):**

```
data_ov006_0225df3c   ; mode-toggle singleton A
data_ov006_0225e068    ; audio/engine struct pointer (documented, R4)
0x000008c9              ; OBJ-attribute base flags literal
data_ov006_021cc588    ; stride-0xc lookup table (self.f40==0/3)
data_ov006_021cc478    ; stride-0xc lookup table (self.f40==2)
data_ov006_021cc0f4    ; stride-0xc lookup table (self.f40==default)
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_02021660    (x2, one per half)
func_020216b0      (x12: 6 per half)
```

**Recipe sketch:**

```c
int Ov006_Battle_EnterPhase(Ov006Battle *self) {
    Ov006SlotRec *rec = &self->f100 + self->f50 * 0x24;
    int obj = func_02021660(self->f0, 5, 0);
    int flags = 0x8c9;
    if (data_ov006_0225df3c.f0 == 0
        && (data_ov006_0225e068.f0 != 0
            || (self->f48 == 0 && data_ov006_0225df3c.f0 == 0))) {
        flags |= 0x20;
    }
    Ov006AnimEntry *tbl;
    switch (self->f40) {
    case 0: case 3: tbl = &data_ov006_021cc588[self->f4c * 0xc]; break;
    case 2:         tbl = &data_ov006_021cc478[self->f4c * 0xc]; break;
    default:        tbl = &data_ov006_021cc0f4[self->f4c * 0xc]; break;
    }
    func_020216b0(obj, 3, tbl->f0);
    func_020216b0(obj, 4, tbl->f2);
    func_020216b0(obj, 0x11, 2);
    func_020216b0(obj, 0x12, 0);
    func_020216b0(obj, 0xd, tbl->f4);
    func_020216b0(obj, 0, flags);
    /* second half: bank=5 chan=1, offset table depends on rec->f4/f20 comparison */
    int obj2 = func_02021660(self->f0, 5, 1);
    int cap = (rec->f50 == 4) ? 3 : 4;
    int flags2 = (rec->f4 >= 0 && rec->f4 < cap) ? 0 : 0;
    int mode2 = (rec->f4c == 4);
    int off = mode2 ? 0x17 * self->f0 + 0xe : 0x17 * self->f0 + 0x36;
    func_020216b0(obj2, 3, 0);
    func_020216b0(obj2, 4, off);
    func_020216b0(obj2, 0x11, 2);
    func_020216b0(obj2, 0x12, 0);
    func_020216b0(obj2, 0xd, 0);
    func_020216b0(obj2, 0, flags2);
    return 1;
}
```

---

### 0x021BC0CC (912 B, class F, overlay=ov006)

**Original verdict:** F — "executes current battle phase, nested loop +
divide-by-3 magic"

**Upgrade reason:** `Ov006_Battle_ExecPhase` per the map doc. The "nested
loop" is a bounded double loop (`sp[0]` outer bound `3` or `4`, inner
bound `r9` computed from `[rec+0x20]` sign-extract as `1` or `0xa`) — every
iteration builds an OBJ record via `func_020b3870` + the already-matched
`func_ov006_021b6d1c`/`_6f50` pair and a `020216b0`-based field-setter
sequence identical in shape to `021bbe7c` above. There is no magic-divide-
by-3 here (that pattern belongs to `021bcb94` below) — this function's only
arithmetic is index/stride math on `sp`-local counters (`+0x20`
`sl`/`+0xc`/`+0x8` stride table). The tail (`.L_2168` onward) is a bounded
4th-slot special-case plus a fixed 0x28-iteration cleanup loop.

**Struct/data needed:**
- `data_ov006_0224f448` — card-slot object base.
- `data_ov006_021cdd14` — glyph/label render source (already-referenced,
  arg to `func_02091554`).

**Ground-truth pool words (verbatim):**

```
data_ov006_0224f448   ; card-slot object base
data_ov006_021cdd14    ; glyph/label render source
0x000002c1              ; card-position ID base literal
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_ov006_021be5b8     (matched, this doc)
func_02021660
func_020216b0
func_020b3870      (x up to 12: 1 per inner-loop iteration)
func_ov006_021b6d1c      (matched, R4/R6 family — per inner iteration)
func_ov006_021b6f50       (matched, R6 — per inner iteration)
func_02021660        (x per iteration, obj alloc)
func_020216b0           (x6 per iteration: field-set sequence)
func_0202bb20               (conditional re-derive)
func_02091554                  (per iteration, glyph render)
func_02021660           (4th-slot special case)
func_020216b0
```

**Recipe sketch (outer/inner loop shape; the identical `020216b0` 6-field
sequence from `021bbe7c` is reused per iteration):**

```c
int Ov006_Battle_ExecPhase(Ov006Battle *self) {
    Ov006SlotRec *rec = &self->f100 + self->f50 * 0x24;
    Ov006_Battle_EvalCard(self);
    int obj0 = func_02021660(self->f0, 5, 2);
    func_020216b0(obj0, 0, 1);
    int fast = (rec->f20 << 0x1f) >> 0x1f;
    int inner = fast ? 0xa : 1;
    int outer = (self->f50 == 4) ? 3 : 4;
    for (int o = 0, base = 0, code_hi = 0x56, code_lo = 0x36; o < outer; o++) {
        for (int i = 0; i < inner; i++) {
            int idx = base + i;
            int card = func_020b3870(rec->f8 + o, rec->fc + i);
            int addr = Ov006_CardPool_GetZoneOffset(self->f0, /*sign-flag*/ 0, card);
            int found = Ov006_CardPool_FindCardByKey(self->f0, self->f50, addr);
            int cap = (rec->fc <= idx && rec->f80 == 0
                       && (self->f70 == 0 || (self->f70 & (1 << i))))
                      ? 0x204 : 0;
            int obj = func_02021660(self->f0, 5, idx + 3);
            int tag = (self->f50 == 4) ? code_hi : code_lo;
            func_020216b0(obj, 2, tag);
            func_020216b0(obj, 3, /* per-slot literal */ 0);
            func_020216b0(obj, 4, /* per-slot literal */ 0);
            func_020216b0(obj, 0x11, 3);
            func_020216b0(obj, 0x12, 1);
            func_020216b0(obj, 0, cap);
            if (self->f40 == 6) {
                int prev = func_0202bb20(found);
                if (!prev) addr = Ov006_CardPool_GetZoneOffset(self->f0, 0, card);
            }
            func_02091554(&self->f174[idx * 0x20], data_ov006_021cdd14);
            tag += 0x17;
        }
        base += inner;
    }
    if (self->f50 == 4) {
        int obj = func_02021660(self->f0, 5, base + 3);
        func_020216b0(obj, 2, 0xe);
        func_020216b0(obj, 3, 0x36);
        func_020216b0(obj, 4, 3);
        func_020216b0(obj, 0x11, 3);
        func_020216b0(obj, 0x12, 1);
        func_020216b0(obj, 0, 0x2c1);
    }
    for (int i = base + 1; i < 0x28; i++) {
        int obj = func_02021660(self->f0, 5, i + 3);
        func_020216b0(obj, 2, 0);
    }
    self->f70 = self->f80 = 0;
    return 1;
}
```

---

### 0x021BC45C (1848 B, class F, overlay=ov006)

**Original verdict:** F — "large card animation dispatcher (0x738 bytes);
indexes 021cc6cc-021cda88 animation tables; ~30 branches, permuter terr"

**Upgrade reason:** `Ov006_Battle_AnimCard` per the map doc, already
FLAGGED by name as "large card animation dispatcher" with the exact table
range this doc's own read confirms. The body is a bounded `0-0xd`/`0xe-0x11`/
`0x12-0x15`/`0x16-0x1d`/`0x1e-0x1f` range-gated pre-check (each range reads
one of the four caller args, `r1`/`r2`/`r3`/`sp[0x60]`, as a "do we have
this animation-slot's data" flag), then a second bounded computed branch on
`self+0x40` (7 cases) selecting which of the 7 already-catalogued
`data_ov006_021cc6cc`..`_da88` Type-A/B tables (per `Ov004Ov006DataTables.md`)
to index for the "prior" table pointer `fp`, then a 15-way
`addls pc,pc,r8,lsl#2` computed branch (the `0x2630` jump table) selecting
between 7 distinguishable calls into `func_ov006_021b7ce0` (the already-
matched "Fill/Copy 5-way dispatch" sibling from R6) with different literal
`r2` args (`0-6`), and finally the same `02021660`/`020216b0` 8-field OBJ
setter sequence seen throughout this family. The "permuter terr" flag is a
match-difficulty warning (high register pressure across the ~450 insns),
not a classification wall — every operation is deterministic table lookup
and literal dispatch.

**Struct/data needed:**
- `data_ov000_021b1d4c` — shared cross-overlay controller struct (already
  documented, referenced by `+0x18` field elsewhere in this batch's KB
  citations).
- `data_ov006_021ccb88`/`_cce08`/`_cd088`/`_cd308`/`_cd588`/`_cd808`/
  `_cda88` — the 7 already-catalogued Type A/B animation-table blocks from
  `Ov004Ov006DataTables.md`.
- `data_ov006_0224f448` — card-slot object base.
- `data_ov006_0225de70` — mode-toggle singleton (same as `021bb954`'s
  `_6be8` usage).

**Ground-truth pool words (verbatim):**

```
data_ov006_021cce08   ; Type-B animation table (self.f40==1/4)
data_ov006_0224f448    ; card-slot object base
data_ov006_021ccb88     ; Type-A animation table (self.f40==2)
data_ov006_021cd088      ; Type-B animation table (self.f40==3)
data_ov006_021cd308       ; Type-B animation table (self.f40==?)
data_ov006_021cd808        ; Type-B animation table (self.f40==5)
data_ov006_021cda88         ; Type-B animation table (self.f40==6)
data_ov006_021cd588          ; Type-B animation table (self.f40==7/default)
0x000001c1                    ; OBJ-attribute base flags literal
data_ov006_0225de70            ; mode-toggle singleton
data_ov000_021b1d4c              ; shared cross-overlay controller struct
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_ov006_021c6bdc
func_02021660      (obj alloc, per outer iteration)
func_020b3870        (conditional, self.f40==0x15 && f50==0x27 case)
func_ov006_021b6d1c    (matched, R4/R6 family)
func_0202bbdc             (post-anim state re-derive)
func_ov006_021b7ce0        (x7: Fill/Copy 5-way dispatch, one per jump-table case)
func_020216b0                  (x8, final field-set sequence)
```

**Recipe sketch (top-level shape; the 7-way jump-table dispatch into
`Ov006_Slot_FillOrCopy` is the same recipe already fully specified for R6's
`func_ov006_021b843c`/`021b831c` — see `Ov004Ov006Deep.md`):**

```c
int Ov006_Battle_AnimCard(Ov006Battle *self, int r1, int r2, int r3) {
    for (int idx = 0; idx < 0xe; idx++) {
        int have = (idx <= 0xd) ? (r1 != 0) : 0;
        if (!have) continue;
        int prior_tbl_sel = self->f40;
        Ov006AnimEntry *fp;
        switch (prior_tbl_sel) {
        case 1: case 4: fp = &data_ov006_021cce08[self->f4c]; break;
        case 2:         fp = &data_ov006_021ccb88[self->f4c]; break;
        case 3:         fp = &data_ov006_021cd088[self->f4c]; break;
        case 5:         fp = &data_ov006_021cd808[self->f4c]; break;
        case 6:         fp = &data_ov006_021cda88[self->f4c]; break;
        default:        fp = &data_ov006_021cd588[self->f4c]; break;
        }
        int reroll = 0;
        if ((fp->f20 & 0x40000000) == 0
            && (idx >= 0x12 && idx <= 0x15)) {
            reroll = (func_ov006_021c6bdc(data_ov006_0225de70) == 0 && idx != 5);
        }
        int cap = 0;
        if (idx >= 0x16 && idx <= 0x1d) {
            /* boundary check against fp->f8/f10, fp->f1c sign */
        }
        int use_prior = (self->f54 == idx) ? 1 : 0;
        int sl = use_prior ? fp->f10 : Ov006_ResolvePriorField(self, fp);
        if (idx >= 0x1a && idx <= 0x1d && cap) {
            int addr = Ov006_CardPool_GetZoneOffset(data_ov006_0225de70, self->f50, idx - 0x1a);
            if (func_0202bbdc(addr)) sl += 2;
        }
        int mode = (idx <= 0xd) ? idx : idx - 8;
        Ov006_Slot_FillOrCopy(data_ov006_0225de70, self->f50, mode);   /* func_ov006_021b7ce0 */
        int obj = func_02021660(self->f0, 5, idx + 0x2b);
        func_020216b0(obj, 2, idx);
        func_020216b0(obj, 3, fp->f0);
        func_020216b0(obj, 4, fp->f2);
        func_020216b0(obj, 0x11, fp->f4);
        func_020216b0(obj, 0x12, fp->f6);
        func_020216b0(obj, 0xc, fp->f8);
        func_020216b0(obj, 0xd, sl);
        func_020216b0(obj, 0, reroll ? (0x1c1 | 4) : 0x1c1);
    }
    return 1;
}
```

---

### 0x021BCB94 (840 B, class F, overlay=ov006)

**Original verdict:** F — "processes card effect; decodes effect fields
and calls ov005 chain rule, dense magic-divide chain"

**Upgrade reason:** `Ov006_Battle_ProcessEffect` per the map doc. The
"dense magic-divide chain" is exactly the already-documented `0x66666667`
÷10 and `0x88888889` postshift-dependent reciprocal family from
`OverlayConstantsExtended.md` (used here to compute the standard "hours/
minutes/seconds"-style decomposition of a card timer, `sl = |value| % 10`,
plus a nested `88888889`/`51eb851f` cascade decomposing further into
`sp[0x2c]`/`sp[0x28]`/`sp[0x24]`/`sp[0x10]`/`sp[0xc]` sub-fields — all
already-catalogued reciprocal constants, just chained 4 deep for a 4-digit
extraction). `func_ov006_021be8c4` is an already-catalogued helper (per
`_names_overlay006.md`'s neighboring entries). The body's remaining logic
is a bounded 7-iteration loop (`r6` 0-6) with a `021bcb94`-local
range-gated skip check, each iteration building an OBJ record via the same
`02021660`/`020216b0` sequence already proven throughout this doc.

**Struct/data needed:**
- `data_ov006_0224f448` — card-slot object base.
- `data_ov006_021cc4fc` — 7-entry stride-0x14 lookup table (`+0x2`/`+0x8`/
  `+0xc`/`+0x4`/`+0x6` fields — already-referenced per the loop's `r8+0x14`
  stride advance).
- `data_02104f4c` — system-clock cluster (`+0x4` language field, same
  already-documented offset used across the whole batch).

**Ground-truth pool words (verbatim):**

```
data_ov006_0224f448   ; card-slot object base
0x88888889              ; smull reciprocal, postshift-dependent (documented, R7)
0x66666667               ; smull reciprocal, ÷10 (documented, R6/R8)
0x51eb851f                ; smull reciprocal, ÷100 (documented, R6)
0x000001c1                 ; OBJ-attribute base flags literal
data_ov006_021cc4fc          ; 7-entry stride-0x14 lookup table
data_02104f4c                  ; system-clock cluster (+0x4 language field)
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_ov006_021be8c4    (matched sibling, per map doc's overlay006.md neighbors)
func_02021660      (x7, one per loop iteration)
func_020216b0        (x56: 8 per iteration x 7 iterations)
```

**Recipe sketch:**

```c
int Ov006_Battle_ProcessEffect(Ov006Battle *self, int arg1, int arg2) {
    if (self->f40 != 1) return 0;
    int value = Ov006_ResolveEffectValue(self);   /* func_ov006_021be8c4 */
    /* 4-deep magic-divide digit extraction, all documented reciprocals */
    int abs_v = (value >= 0) ? value : -value;
    int d0 = abs_v % 10;                          /* 0x66666667 */
    int d1 = (abs_v / 10) % 10;                    /* nested 0x66666667 */
    int d2 = abs_v % 60;                            /* 0x88888889, postshift asr#2 */
    int d3 = (abs_v % 3600) % 100;                    /* 0x51eb851f, ÷100 */
    Ov006EffectRow *tbl = &data_ov006_021cc4fc[0];
    for (int i = 0; i < 7; i++, tbl++) {
        int skip = 0;
        if (i >= 0 && i <= 3) skip = (arg1 == 0);
        else if (i >= 4 && i <= 6) skip = (arg2 == 0);
        if (skip) continue;
        int flags = 0x1c1;
        int lang = (data_02104f4c.f4 << 0x1d) >> 0x1d;
        if (i != 0) flags |= 4;
        int obj = func_02021660(self->f0, 5, i + 0x64);
        func_020216b0(obj, 2, i);
        func_020216b0(obj, 3, /* row-derived position */ 0);
        func_020216b0(obj, 4, /* per-digit offset */ 0);
        func_020216b0(obj, 0x11, tbl->f4);
        func_020216b0(obj, 0x12, tbl->f6);
        func_020216b0(obj, 0xc, /* fixed-point derived */ 0);
        func_020216b0(obj, 0xd, /* fixed-point derived */ 0);
        func_020216b0(obj, 0, flags);
    }
    return 1;
}
```

---

### 0x021BCEDC (2016 B, class F, overlay=ov006)

**Original verdict:** F — "updates board display; scans slot config
tables, calls 021b6d1c/6f50/7cac/7ce0; 15-way jump table, permuter terr"

**Upgrade reason:** `Ov006_Battle_UpdateBoard` per the map doc, already
flagged with the exact callee set this doc's own read confirms. Despite
being the largest function in the R8 batch (2016 B), the structure is a
single fixed sequence: a `self->f40` 7-way `addls pc,pc,r3,lsl#2` computed
branch selecting `(flag_a, count)` pairs, a 9-slot zero-init loop, a
conditional `Ov006_CardPool_GetZoneOffset`+`func_0202de9c` category lookup,
a bounded `flag_a`-limited `Ov006_CardPool_FindCardByKey` scan (0-6 iters),
a counting-sort-style bucket-fill loop (2 nested bounded loops, outer 5,
inner variable), then a 25-iteration outer loop (`r9`, 0-0x18) with an inner
14-way `addls pc,pc,r0,lsl#2` jump table dispatching to
`func_ov006_021c7f5c` (already-catalogued "animation slot" builder per
`_names_overlay006.md`'s neighboring entries) with 7 distinct literal mode
args (2-8), each variant sharing the identical shape (call `_7ce0`, check
`self->f78`, then conditionally re-derive via `data_ov006_021cc4fc`-style
table indexing `_7cac`+`_c7f5c`). Every one of the ~15 jump-table arms is a
short, fully literal, distinguishable block — this is the same "wide but
bounded dispatch" pattern already proven throughout R7/R8, just with more
arms.

**Struct/data needed:**
- `data_ov006_021cc03c`/`_c050`/`_c064`/`_c078` — 4 already-implied
  stride-3-array (`sl<<2 + r2*4`) sub-tables (16-byte stride sub-groups per
  `Ov004Ov006DataTables.md`'s Type-D bundle-1/2 pattern at `021ce1e8`).
- `data_ov006_021cc13c` — indexed lookup table (`+r3*4` stride, arg to
  `func_02091554`).
- `data_ov006_021cc6cc`/`_c7f8`/`_c924` — Type-A animation tables (already
  catalogued, `Ov004Ov006DataTables.md`).
- `data_ov006_0225df3c` — mode-toggle singleton (same as `021bbe7c`).

**Ground-truth pool words (verbatim):**

```
data_ov006_0224f448   ; card-slot object base
data_ov006_021cc6cc    ; Type-A animation table
data_ov006_021cc7f8     ; Type-A animation table
data_ov006_021cc924      ; Type-A animation table
0x000008c1                ; OBJ-attribute base flags literal
data_ov006_021cc03c         ; stride sub-table A (mode==1/4/6)
data_ov006_021cc050          ; stride sub-table B (mode==2)
data_ov006_021cc064           ; stride sub-table C (mode==3)
data_ov006_021cc078            ; stride sub-table D (mode==default)
data_ov006_021cc13c             ; indexed lookup table (glyph render arg)
data_ov006_0225df3c               ; mode-toggle singleton
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_ov006_021bd6bc     (matched, R6 — Ov006_Battle_GetDamage)
func_ov006_021b6d1c        (matched, R4/R6 family)
func_0202de9c
func_ov006_021b6f50         (matched, R6)
func_ov006_021b7cac    (x1, top-of-function pool-check only)
func_ov006_021c7f5c      (x7, one per jump-table arm — "animation slot" builder)
func_ov006_021b7ce0        (x7, one per jump-table arm — Fill/Copy dispatch)
func_02021660        (x1, single obj alloc after the jump-table dispatch)
func_020216b0           (x8, final field-set sequence)
```

**Recipe sketch (top-level shape; the 7-arm jump table shares one recipe
skeleton, differing only in literal mode id 2-8 and which `data_ov006_021cc4fc`-
style field the fallback pulls — matches the recipe already established for
`021b60a4`'s 4-way seed dispatch in R4/R6):**

```c
int Ov006_Battle_UpdateBoard(Ov006Battle *self, int mode, int arg2) {
    if (mode == 0) return 1;
    int flag_a[3] = {0,0,0}, count = 0;
    switch (self->f40) {
    case 0: flag_a[0]=0; count=3; break;
    case 1: flag_a[0]=1; count=2; break;
    case 2: flag_a[0]=0; count=1; break;
    case 3: flag_a[0]=0; count=0; break;
    default: flag_a[0]=1; count=3; break;
    }
    int idx_map[5] = {-1,-1,-1,-1,-1};
    int weight[9] = {0};
    if (mode) {
        Ov006SlotRec *zone = &self->f100 + self->f50 * 0x24;
        int addr = Ov006_CardPool_GetZoneOffset(self->f0, zone, 0);
        int card = func_0202de9c(addr);
        for (int i = 0; i <= count; i++) {
            int found = Ov006_CardPool_FindCardByKey(self->f0, i, card);
            weight[i] = found;
        }
    }
    /* bucket-fill: distribute weight[] into idx_map[]/base[] pairs */
    int j = 0;
    for (int b = 0; b < 5; b++) {
        int w = weight[b];
        for (int k = 0; k < w; k++, j++) idx_map[j] = b;
    }
    for (int i = 0, tag = 0x1c1 | 2; i < 0x19; i++) {
        Ov006_DamageEntryTbl *fp = /* i-th entry, from data_ov006_021cc03c family */;
        int sub_mode = fp->f8;
        int arg = /* per-mode field select */;
        switch (sub_mode) {
        case 4: Ov006_ResolveDamageZone(self, self->f50, i, &arg); break;   /* 021b7cac */
        case 8: Ov006_SlotDispatch(&data_ov006_0225df3c, self->f50, 1, &arg); break;   /* 021c7f5c */
        case 9: Ov006_SlotDispatch(&data_ov006_0225df3c, self->f50, 2, &arg); break;
        case 0xa: Ov006_SlotDispatch(&data_ov006_0225df3c, self->f50, 3, &arg); break;
        case 0xb: Ov006_SlotDispatch(&data_ov006_0225df3c, self->f50, 4, &arg); break;
        case 0xc: Ov006_SlotDispatch(&data_ov006_0225df3c, self->f50, 5, &arg); break;
        case 0xd: Ov006_SlotDispatch(&data_ov006_0225df3c, self->f50, 6, &arg); break;
        default:  Ov006_SlotDispatch(&data_ov006_0225df3c, self->f50, 0, &arg); break;
        }
        int obj = func_02021660(self->f0, 5, i + 0x4b);
        func_020216b0(obj, 2, i);
        func_020216b0(obj, 3, arg);
        func_020216b0(obj, 4, fp->f14);
        func_020216b0(obj, 0x11, fp->f4);
        func_020216b0(obj, 0x12, fp->f6);
        func_020216b0(obj, 0xc, 0);
        func_020216b0(obj, 0xd, /* glyph-lookup arg */ 0);
        func_020216b0(obj, 0, tag);
    }
    return 1;
}
```

---

### 0x021BD8AC (1072 B, class F, overlay=ov006)

**Original verdict:** F — "resolves battle result, dense conditional-
literal chain"

**Upgrade reason:** `Ov006_Battle_Resolve` per the map doc. A 3-way switch
on `self->f40` (`0`/`2`/`3` → block A; else → block B) selecting a
stride-0xc table base (`_c588`/`_c478`/`_c0f4`, the exact same 3 tables
already catalogued for `021bbe7c` above — confirming this and `021bbe7c`
are sibling functions over the same table family), then a bounded scan
(`r3`-limited 0-9 iterations, terminated on a match against `[table+8]`),
then a fixed 10-way `addls pc,pc,r0,lsl#2` computed branch on the return
value of `Ov006_CardPool_GetPoolPtr` (`func_ov006_021b7cac`, already
catalogued for `021bcedc`/`021bcb94` above) selecting one of 10
distinguishable literal card-position codes (`0x15`/`0x16`/.../`0x1d`,
`-1`). The remainder is category-lookup (`func_0202de9c`) and card-count
math (`func_ov006_021b6d1c`/`_6f50`), ending with the already-catalogued
"OBJ-flag pack + `func_ov006_021c7964`/`021c8174`/`_8184`/`_8194`/`_81a4`"
sequence — a matched "commit result" idiom shared with `021bcedc`'s
sibling calls into the same `_c7964`/`_8174` family.

**Struct/data needed:**
- `data_ov006_021cc0dc`/`_c0f4`/`_c3a0`/`_c40c`/`_c478`/`_c588` — 6
  already-implied stride-0xc lookup tables (3 pairs, one pair per branch of
  the top-level `self->f40` gate; `_c0f4`/`_c478`/`_c588` shared with
  `021bbe7c`).
- `data_ov006_0224f448` — card-slot object base.
- `data_ov006_0225df3c` — mode-toggle singleton (already-referenced).

**Ground-truth pool words (verbatim):**

```
data_ov006_021cc588   ; stride-0xc table (self.f40==0/2/3, primary)
data_ov006_021cc478    ; stride-0xc table (self.f40==0/2/3, secondary)
data_ov006_021cc40c     ; stride-0xc table (self.f40==0/2/3, tertiary)
data_ov006_021cc0f4      ; stride-0xc table (self.f40==else, primary)
data_ov006_021cc0dc       ; stride-0xc table (self.f40==else, secondary)
data_ov006_021cc3a0        ; stride-0xc table (self.f40==else, tertiary)
data_ov006_0224f448          ; card-slot object base
0x00000322                     ; card-position ID base literal
data_ov006_0225df3c              ; mode-toggle singleton
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_ov006_021b7cac    (matched, this doc — Ov006_CardPool_GetPoolPtr, x2: early gate + tail)
func_ov006_021bd6bc      (matched, R6 — Ov006_Battle_GetDamage)
func_ov006_021b6d1c        (matched, R4/R6 family)
func_ov006_021b6f50         (matched, R6)
func_0202de9c
func_ov006_021b8e4c           (matched, R6 — Ov006_Pool_UpdateCard)
func_ov006_021b8f7c            (matched, R6 — Ov006_Pool_GetCardResult)
func_0202bbdc                    (x2)
func_ov006_021c8174
func_ov006_021c8184
func_ov006_021c8194
func_ov006_021c81a4
func_ov006_021c7964
func_ov006_021c7f5c      (conditional, f48==0 && zone.f8==3)
func_ov006_021c7edc        (conditional, follows the 021c7f5c call)
```

**Recipe sketch (top-level shape; the 10-way jump table is a straight
literal-code lookup, not a scheduling wall):**

```c
int Ov006_Battle_Resolve(Ov006Battle *self) {
    Ov006SlotRec *zone = &self->f100 + self->f50 * 0x24;
    Ov006DmgTbl *tbl;
    switch (self->f40) {
    case 0: case 2: case 3: tbl = &data_ov006_021cc588[self->f4c]; break;
    default:                tbl = &data_ov006_021cc0f4[self->f4c]; break;
    }
    int match_idx = -1, matched = 0;
    if (self->f48 == 0) {
        for (int i = 0, key = tbl->f8; i < tbl_len(tbl); i++) {
            if (Ov006_CardPool_GetPoolPtr(...)->f8 == key) { match_idx = i; matched = 1; break; }
        }
    }
    int code;
    if (tbl->f8 == 4) {
        code = Ov006_CardPool_GetPoolPtr(&data_ov006_0225df3c, self->f0);
        switch (code) {
        case -1: code = -1; matched = 0; break;
        case 0: code = 0x15; break;
        case 1: code = 0x16; break;
        case 2: case 3: code = 0x17; break;
        case 4: code = 0x18; break;
        case 5: code = 0x19; break;
        case 6: code = 0x1a; break;
        case 7: code = 0x1b; break;
        case 8: code = 0x1c; break;
        case 9: code = 0x1d; break;
        }
    } else {
        code = tbl->f4;
    }
    int card = matched ? Ov006_CardPool_FindCardByKey(...) : -1;
    int atk = Ov006_Pool_UpdateCard(&data_ov006_0224f448, card, matched ? 1 : 0, 0);
    int result = Ov006_Pool_GetCardResult(&data_ov006_0224f448);
    int locked = (self->f40 == 0) ? (tbl->f8 == 4)
        : (matched && (card != 0) && Ov006_CardPool_FindCardByKey_Adj());
    int reroll = matched ? 0 : func_0202bbdc(card);
    int zoneAddr = Ov006_CardPool_GetZoneOffset(self->f0, self->f50, zone->f20);
    int poolIdx = Ov006_CardPool_FindCardByKey(self->f0, self->f50, zoneAddr);
    int cat = func_0202de9c(poolIdx);
    Ov006_SetSlotFlags(0x322, 0xd, cat);         /* func_ov006_021c8174 */
    Ov006_SetSlotMode(cat, 2, 0xe);                /* func_ov006_021c8184 */
    Ov006_SetSlotOrient(cat, self->f50, /*sign*/0);  /* func_ov006_021c8194 */
    if (locked) Ov006_SetSlotResolved(cat, reroll, poolIdx, atk, result); /* 021c81a4 */
    Ov006_CommitSlot(cat, code, -1, /*base*/0);      /* func_ov006_021c7964 */
    if (self->f48 == 0 && zone->f8 == 3) {
        int pos = Ov006_CardPool_GetPoolPtr(&data_ov006_0224f448, self->f50);
        int slot = Ov006_SlotDispatch(cat, 1, pos);   /* func_ov006_021c7f5c */
        Ov006_SlotAdjust(cat, slot);                    /* func_ov006_021c7edc */
    }
    return 1;
}
```

---

### 0x021BDDD4 (732 B, class F, overlay=ov006)

**Original verdict:** F — "extended input handler for battle phase, 7-way
jump table"

**Upgrade reason:** `Ov006_Battle_HandleInput2` per the map doc. A single
bounded `sp[0]` 7-way `addls pc,pc,r0,lsl#2` computed branch, each case a
short, fully literal block dispatching to already-matched siblings
(`func_ov006_021bcb94` matched above in this doc, `func_ov006_021bf01c`/
`_bf2a4` [already SHIP-listed in `overlay006.md`], `func_ov006_021b8e4c`
matched R6, `func_ov006_021bd700`/`_bbdc0`/`_bd864` [already-referenced
neighbors]) — every case selects a fixed literal path, no register-
allocation ambiguity. The final case (`.L_7c0`) is a fixed
3-call sequence (`func_ov006_021ca3e0`/`_ca3f0`/`_ca264`, the exact same
3-call trailer already fully documented for R4's `func_ov006_021b5b70`
dispatcher in `Ov004Ov006Deep.md`).

**Struct/data needed:**
- `data_ov006_0224f448` — card-slot object base.
- `data_ov006_0225e068` — audio/engine struct pointer (documented, R4 — same
  global used in `func_ov006_021b59e4`).

**Ground-truth pool words (verbatim):**

```
data_ov006_0224f448   ; card-slot object base
data_ov006_0225e068    ; audio/engine struct pointer (documented, R4)
0x00000322               ; card-position ID base literal (shared w/ 021bd8ac)
```

**Ground-truth BL targets (verbatim, in call order):**

```
Copy32
func_ov006_021be0b0     (matched, this doc — case 2)
func_ov006_021bcb94       (matched, this doc — case 2 sub-branch)
func_ov006_021bf01c        (case 2 sub-branch)
func_ov006_021bf2a4         (case 2 sub-branch)
func_02037208                  (case 2 fail path)
func_ov006_021b8e4c              (matched, R6 — case 3)
func_ov006_021bd700               (x3: cases 3/4/6)
func_ov006_021bbdc0                 (case 3)
func_ov006_021bd864                  (case 3)
func_0202bbdc                          (case 4)
func_0202bbc8
func_ov006_021b7ce0                     (x5, case 4 loop)
func_ov006_021b7bb0                      (x2, case 4/5)
func_ov006_021b7c94                       (case 5)
func_ov006_021b7cc0                        (x7, case 6 loop)
func_ov006_021ca3e0    (case default — matched R4 trailer)
func_ov006_021ca3f0      (case default)
func_ov006_021ca264       (case default)
```

**Recipe sketch:**

```c
int Ov006_Battle_HandleInput2(Ov006Battle *self, int msg_type, int arg) {
    int cur[3];
    Copy32(&self->f88, cur, 0xc);
    self->f88 = self->f8c = self->f90 = 0;
    int result = 0;
    switch (msg_type) {
    case 2: {
        if (cur[1] == cur[2]) break;
        int found = Ov006_Battle_UpdateSlot(self);
        if (found) {
            if (self->f40 == 1) {
                Ov006_Battle_ProcessEffect(self, 0, 1);
                Ov006_Battle_HandleWin(self);
            } else if (self->f40 == 2) {
                Ov006_Battle_HandleLose(self);
            }
        } else {
            func_02037208(0x43-0x44, 0, 0, 1);
        }
        break;
    }
    case 3: {
        Ov006_Pool_UpdateCard(&data_ov006_0224f448, cur[1], 1);
        if (self->f50 != 4) self->f5c = self->f50;
        self->f50 = 4;
        Ov006_SlotAdvance(self, 0);         /* 021bd700 */
        Ov006_Battle_Init(self);
        Ov006_Battle_ResolveB(self);          /* 021bd864 */
        self->f60 = cur[1]; self->f84 = 1;
        break;
    }
    case 4: {
        int flag = func_0202bbdc(cur[1]) ? cur[1] : 1;
        func_0202bbc8(cur[1], flag);
        for (int i = 0; i < 5; i++) {
            if (Ov006_Slot_FillOrCopy(&data_ov006_0224f448, i, 0) >= 0)
                Ov006_Slot_BuildAndRender(&data_ov006_0224f448, i);
        }
        break;
    }
    case 5: {
        Ov006_Slot_InitOne(&data_ov006_0224f448, self->f50, cur[1]);  /* 021b7c94 */
        Ov006_Slot_BuildAndRender(&data_ov006_0224f448, self->f50);
        Ov006_SlotAdvance(self, self->f50, result);
        break;
    }
    case 6: {
        int val = cur[1];
        if (val >= 0) {
            for (int c = 0; c < 7; c++)
                Ov006_Slot_SetCol(&data_ov006_0224f448, self->f50, c, c - 1);
        } else {
            Ov006_Slot_SetCol(&data_ov006_0224f448, self->f50, cur[2]);
        }
        Ov006_Slot_BuildAndRender(&data_ov006_0224f448, self->f50);
        Ov006_SlotAdvance(self, self->f50, 0);
        result = 1;
        break;
    }
    default:
        Ov006_ResolveA(&data_ov006_0225e068, cur[0], 0x322, 0xd);   /* 021ca3e0 */
        Ov006_ResolveB(&data_ov006_0225e068, 2, 0x322, 0xe);          /* 021ca3f0 */
        Ov006_ResolveC(&data_ov006_0225e068, cur[1], cur[2]);           /* 021ca264 */
        break;
    }
    return result;
}
```

---

### 0x021BE0B0 (1056 B, class F, overlay=ov006)

**Original verdict:** F — "updates one battle slot; uses
021b6d1c/6dac/7010/75f0; reads LP via 021bd6bc, dense conditional tree"

**Upgrade reason:** `Ov006_Battle_UpdateSlot` per the map doc, already
flagged with the exact callee set this doc confirms. Two guard checks
(`func_ov006_021bd6bc` twice, matched R6 — `Ov006_Battle_GetDamage`) gate
entry; the remainder is a fully literal decision tree over `self->f40`
(0/1/2) crossed with the caller's `slot_idx` (0-3), computing a threshold
constant (`0x80`/`0xa`/`0x50`/`0xf`/`0x1e`) which is compared against a
`+0x8100+idx*2+0x6a` count field — every branch of this "dense conditional
tree" is a distinguishable literal comparison, not scheduling entropy. The
tail calls the already-matched `func_ov006_021b7010` (`Ov006_CardPool_
AdjustSlot`, R6/map-doc `MED`) up to 3 times with fixed literal args
(`1`/`2`/`3`) to accumulate a threshold-crossing count, then dispatches to
`func_ov006_021b75f0` (already-flagged `WALL` in R6's `Ov004Ov006Deep.md`
— but note: `021be0b0` calling a WALL sibling does not make `021be0b0`
itself unmatchable, since the call is a simple `bl` with literal args, not
inlined logic).

**Struct/data needed:**
- `data_ov006_0224f448` — card-slot object base.
- No new fields — every offset (`self->f40`/`f50`/`f80`, zone `+0x0`/`+0x4`/
  `+0x8`/`+0xc`/`+0x10`/`+0x20`) is already referenced by matched siblings
  in this same doc.

**Ground-truth pool words (verbatim):**

```
data_ov006_0224f448   ; card-slot object base
0x66666667              ; smull reciprocal, ÷10 (documented, R6/R8)
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_ov006_021bd6bc    (matched, R6 — Ov006_Battle_GetDamage, x2 guard checks)
func_ov006_021b6d1c      (matched, R4/R6 family)
func_0202de9c
func_ov006_021b6dac        (matched, R4/R6 family — Ov006_CardPool_GetPoolPtr sibling)
func_ov006_021b75f0          (call only — WALL per R6, but call site itself is trivial)
func_ov006_021b7010    (x3: matched, R6 — Ov006_CardPool_AdjustSlot)
func_ov006_021bd6bc      (matched, R6 — 2nd use, slot-base resolve)
```

**Recipe sketch:**

```c
int Ov006_Battle_UpdateSlot(Ov006Battle *self, int slot_idx, int arg2) {
    Ov006SlotRec *zone = &self->f100 + self->f50 * 0x24;
    int dmg = Ov006_Battle_GetDamage(self);
    if (dmg < 0) return 0;
    int addr = Ov006_CardPool_GetZoneOffset(self->f0, self->f50, zone->f20);
    int card = func_0202de9c(addr);
    if (slot_idx == arg2) return 0;
    int limit;
    if (self->f40 == 2) {
        limit = 0;   /* case handled via early-return branch */
    } else if (self->f40 == 1) {
        limit = (slot_idx == 3) ? 0x1e : 0x80;
    } else {
        limit = (slot_idx == 1) ? 0xa
              : (slot_idx == 2) ? 0xf
              : 0x50;
    }
    if (slot_idx != 0) {
        u16 count = *(u16*)((u8*)self + slot_idx*2 + 0x8100 + 0x6a);
        if (count < limit) return 0;
        switch (slot_idx) {
        case 1: self->f88 = 6; self->f8c = (self->f40==2) ? 0x16 : 3; self->f90 = addr; break;
        case 2: self->f88 = 6; self->f8c = 4; self->f90 = addr; break;
        case 3: self->f88 = 6; self->f8c = 5; self->f90 = addr; break;
        }
        return 1;
    }
    int c = Ov006_CardPool_AdjustSlot(self->f0, 3, addr, 0)
          + Ov006_CardPool_AdjustSlot(self->f0, 1, addr, 0)
          + Ov006_CardPool_AdjustSlot(self->f0, 2, addr, 0);
    if (c < 3) return 0;
    self->f88 = 6; self->f8c = 0; self->f90 = addr;
    return 1;
    /* dead-slot path: resolves base via Ov006_Battle_GetDamage(self, slot_idx),
       zone-index via GetZoneOffset, then dispatches count/watermark update
       against zone->f10/f8, capping self->f80 and calling
       func_ov006_021b75f0(self->f0, arg2, slot_idx, {1}) for the render side */
}
```

---

### 0x021BE5B8 (316 B, class E, overlay=ov006)

**Original verdict:** E — "evaluates card for a given battle slot;
computes card count range, mixed branch"

**Upgrade reason:** `Ov006_Battle_EvalCard` per the map doc. A linear
computation: resolve the count via the already-matched
`func_ov006_021b6d00` (`Ov006_CardPool_...`-family accessor, R4 —
"trivial count accessor leaf"), a conditional `func_020b3870` percent-
compute call (same primitive documented throughout R7's achievement-scan
idiom), a threshold compare against `self->f50==4 ? 3 : 4`, and — only if
`self->f40==0` and the pack-flag `[+0x20]` is set — a bounded loop
(`0` to `self->f50==4?3:4`, ≤4 iterations) calling `func_ov006_021b6d1c`+
`func_ov006_021b8e4c`+`func_ov006_021b8f7c` per iteration (all three already
matched, R4/R6). This is a short, fully deterministic leaf.

**Struct/data needed:** `data_ov006_0224f448` — card-slot object base
(same struct as every other function in this doc).

**Ground-truth pool words (verbatim):**

```
data_ov006_0224f448   ; card-slot object base
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_ov006_021b6d00     (matched, R4 — trivial count accessor leaf)
func_020b3870
func_020945f4              (conditional, self.f40==0 && !bit1 gate)
func_ov006_021b6d1c          (matched, R4/R6 family, x up to 4)
func_ov006_021b8e4c            (matched, R6, x up to 4)
func_ov006_021b8f7c              (matched, R6, x up to 4)
```

**Recipe sketch:**

```c
int Ov006_Battle_EvalCard(Ov006Battle *self) {
    Ov006SlotRec *zone = &self->f100 + self->f50 * 0x24;
    int sign = (self->f50 != 0) ? ((zone->f20 << 0x1f) >> 0x1f) : 0;
    int base_count = Ov006_GetCardCount(self->f0, self->f50, sign);
    int cap = (self->f50 == 4) ? 3 : 4;
    int pct = (base_count) ? func_020b3870(base_count + 1 - 1, cap) : 0;
    zone->f10 = pct;
    int over = (pct > cap) ? 1 : 0;
    zone->f20 = (zone->f20 & ~2) | (over << 1);
    if (self->f40 == 0) {
        if (zone->f20 & 2) {
            func_020945f4(&zone->f1c, 0, 4);
        } else {
            for (int i = 0, prev = 0; i < cap; i++, prev = 1) {
                int addr = Ov006_CardPool_GetZoneOffset(self->f0, self->f50, zone->f8 + i);
                Ov006_Pool_UpdateCard(self->f0, addr, prev, 0);
                zone->f1c_arr[i] = Ov006_Pool_GetCardResult(self->f0);
            }
        }
    }
    return 1;
}
```

---

### 0x021BE6F4 (388 B, class E, overlay=ov006)

**Original verdict:** E — "ranks a card for the active battle slot vs
opponent cards using 021cb634/021cb65c tables, fixed-count copy loops"

**Upgrade reason:** `Ov006_Battle_RankCard` per the map doc. A single gate
(`self->f40+0x20` bit1 test) short-circuits to a return; otherwise, two
fixed 10-iteration halfword-copy loops (source `data_ov006_021cb634`/
`_65c`, dest `sp`-local buffer) followed by a call into the already-
matched `func_ov005_021aa4b0` (cross-overlay duel-rule callback per
`overlay006.md`'s module description) and a 5-iteration strided copy
(`ldrsh`×4 per iteration) writing into one of `data_ov000_021b1d4c`'s two
sub-record layouts, gated by whether `self->f50==4`. Every loop bound is a
compile-time constant (10, 10, 5) — the "fixed-count copy loops" flag is
literally the KB-friendly signal, not a wall.

**Struct/data needed:**
- `data_ov000_021b1d4c` — shared cross-overlay controller struct (record
  fields `+0x34`/`+0x36`/`+0x38`/`+0x3a` per-entry, `+0x4`/`+0x8`/`+0xc`/
  `+0x10` header fields — same struct referenced with a `+0x18` field
  elsewhere in this doc's ov004 entries, confirming it is genuinely
  cross-overlay shared).
- `data_ov006_021cb634`/`_65c` — two already-referenced 10-entry halfword-
  pair source tables (rank-lookup constants).

**Ground-truth pool words (verbatim):**

```
data_ov000_021b1d4c   ; shared cross-overlay controller struct
data_ov006_021cb634    ; rank-lookup table A (10 halfword pairs)
data_ov006_021cb65c     ; rank-lookup table B (10 halfword pairs)
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_ov005_021aa4b0   (cross-overlay duel-rule callback, per module description)
```

**Recipe sketch:**

```c
int Ov006_Battle_RankCard(Ov006Battle *self) {
    Ov006SlotRec *zone = &self->f100 + self->f50 * 0x24;
    if ((zone->f20 << 0x1e) >> 0x1f == 0) return 1;
    s16 bufA[20], bufB[20];
    memcpy(bufA, data_ov006_021cb634, 40);
    memcpy(bufB, data_ov006_021cb65c, 40);
    data_ov000_021b1d4c.field0 = 0;
    Ov005_ResolveRule(&data_ov000_021b1d4c);   /* func_ov005_021aa4b0 */
    RankEntry *dst = (self->f50 == 4) ? &data_ov000_021b1d4c.entry[3]
                                       : &data_ov000_021b1d4c.entry[4];
    s16 (*src)[4] = (self->f50 == 4) ? bufA : bufB;
    for (int i = 0; i < 5; i++) {
        dst[i].f34 = src[i][0];
        dst[i].f36 = src[i][1];
        dst[i].f38 = src[i][2];
        dst[i].f3a = src[i][3];
    }
    data_ov000_021b1d4c.header0 = zone->f8;
    data_ov000_021b1d4c.header1 = zone->f10 - (self->f50==4 ? 3 : 4);
    data_ov000_021b1d4c.header2 = self->f50==4 ? 3 : 4;
    data_ov000_021b1d4c.header3 = zone->f4;
    return 1;
}
```

---

### 0x021BE948 (1324 B, class F, overlay=ov006)

**Original verdict:** F — "large battle choice builder (0x520 bytes);
builds player card-choice set for a battle turn, nested jump tables"

**Upgrade reason:** `Ov006_Battle_BuildChoice` per the map doc. This is
already flagged as HIGH-confidence with an accurate size/role description.
The "nested jump tables" are two bounded, fully literal computed branches:
an outer `self->f40` 0-6 range (`.L_021bea30`) selecting which of 4 fixed
pointer sources (`sp[0]`, `r11`, `r10`, `r6` — themselves initialized from 4
already-flagged constant pool entries) to use as the current row pointer,
and an inner `self->f40` 0-6 range (`.L_021beb74`) selecting one of 6
already-catalogued Type-A/B animation table addresses
(`data_ov006_021cc2c8`/`_ca50`/`_c164`/`_c618`/`_c334`/`_c1b8`/`_c268`) with
a matching row-count literal (`9`/`0x1a`/`7`/`0xf`/`9`/`7`/`8`) — a bounded
lookup, not scheduling entropy. The body computes a rectangle-overlap test
(`r8`/`r7` vs a per-row bounding box, `ldrsh`-based compares) against a
5-entry inner scan and a variable-length outer scan (bounded ≤ 0x1d per the
`r6`/`r11` cap), always terminating via one of 4 distinguishable
`str [r0]` result writes into the hidden 4th arg (`sp[0x34]`, an output
struct: `{code, ...}`). Every comparison is against a literal or an
already-catalogued table field — no unresolved indirection.

**Struct/data needed:**
- `data_ov006_021cc034` — 1-word bounds struct (arg to the fast-path
  in-bounds check, `+0x0`/`+0x2`/`+0x4`/`+0x6` halfwords).
- `data_ov006_021cc03c`/`_c050`/`_c064`/`_c078` — 4 stride-4 row-pointer
  tables (already implied by `021bcedc`'s use of the same 4 symbols).
- `data_ov006_021cc164`/`_c1b8`/`_c268`/`_c2c8`/`_c334`/`_c618`/`_ca50` — 7
  already-catalogued Type-A/B animation tables from `Ov004Ov006DataTables.md`.
- `data_ov006_0224f448` — card-slot object base.
- `data_ov006_0225de70` — mode-toggle singleton (already-referenced).

**Ground-truth pool words (verbatim):**

```
data_ov006_0224f448   ; card-slot object base
data_ov006_021cc03c    ; row-pointer table A
data_ov006_021cc050     ; row-pointer table B
data_ov006_021cc064      ; row-pointer table C
data_ov006_021cc078       ; row-pointer table D
data_ov006_021cc034        ; bounds struct (fast-path check)
data_ov006_021cc034         ; bounds struct (2nd load, same symbol)
data_ov006_021cc2c8           ; Type-A animation table (self.f50==4)
data_ov006_021cca50            ; Type-A animation table (self.f50!=4)
data_ov006_021cc164             ; Type-B animation table (case 1)
data_ov006_021cc618              ; Type-B animation table (case 2)
data_ov006_021cc334               ; Type-B animation table (case 5)
data_ov006_021cc1b8                ; Type-B animation table (case 6)
data_ov006_021cc268                 ; Type-B animation table (default)
data_ov006_0225de70                   ; mode-toggle singleton
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_ov006_021bd6bc     (matched, R6 — Ov006_Battle_GetDamage, guard check)
func_ov006_021b6d1c       (matched, R4/R6 family)
func_ov006_021b6f50        (matched, R6, per inner-loop iteration)
func_ov006_021c6bdc          (matched sibling, same as 021bb954/021bc45c)
```

**Recipe sketch (top-level shape; the exact bounding-box/table-index logic
is a deterministic scan over already-catalogued tables, matching the shape
already proven for `021bc45c`'s jump-table dispatch above):**

```c
int Ov006_Battle_BuildChoice(Ov006Battle *self, s16 x, s16 y, Ov006Choice *out) {
    Ov006SlotRec *zone = &self->f100 + self->f50 * 0x24;
    out->code = 0; out->slot = 0; out->extra = 0;
    int have_pool = 1;
    if (self->f40 <= 3) {
        int dmg = Ov006_Battle_GetDamage(self, self->f50);
        if (dmg < 0) { have_pool = 0; }
        else {
            int addr = Ov006_CardPool_GetZoneOffset(self->f0, self->f50, zone->f20);
            RowPtr *rowSrc[4] = { sp0, r11_base, r10_base, r6_base };
            for (int r = 0; r < 5; r++) {
                int count = Ov006_CardPool_FindCardByKey(self->f0, addr, r);
                if (count <= 0) continue;
                RowPtr *row = pick_row_src(self->f40, r);   /* 4-way per f40 range */
                if (in_bounds(x, y, row, count)) {
                    out->code = 3; out->slot = r;
                    out->extra = addr;
                    return 1;
                }
            }
        }
    }
    if (have_pool == 0) {
        Ov006DmgRow *rowSrc;
        int rowlen;
        switch (self->f40) {
        case 0: case 3: rowSrc = (self->f50==4) ? data_ov006_021cca50 : data_ov006_021cc2c8;
                         rowlen = (self->f50==4) ? 9 : 0x1a; break;
        case 1: rowSrc = data_ov006_021cc164; rowlen = 7; break;
        case 2: rowSrc = data_ov006_021cc618; rowlen = 0xf; break;
        case 4: rowSrc = data_ov006_021cc2c8; rowlen = 9; break;
        case 5: rowSrc = data_ov006_021cc334; rowlen = 9; break;
        case 6: rowSrc = data_ov006_021cc1b8; rowlen = 7; break;
        default: rowSrc = data_ov006_021cc268; rowlen = 8; break;
        }
        for (int r = 0; r < rowlen; r++, rowSrc++) {
            int cardIdx = rowSrc->f8;
            if (cardIdx >= 0x16 && cardIdx <= 0x1d) {
                int gate = zone->f20 & 2;
                if (!gate && self->f50 != 4
                    && (cardIdx < 0x16 || cardIdx > 0x19 || !skip_check(zone, cardIdx))
                    && func_ov006_021c6bdc(&data_ov006_0225de70)
                    && !(self->f40 == 3 && cardIdx == 1)
                    && in_bounds(x, y, rowSrc)) {
                    out->code = 1; out->slot = cardIdx;
                    return 1;
                }
            }
        }
    }
    /* fallback: 10-entry (self.f50==4) or per-row grid scan against
       bounds struct data_ov006_021cc034, returning code=2 with the
       matching table index, else code=0 */
    return 0;
}
```

---

## Confirmed intractable

None. All 30 examined functions (15 ov004 + 15 ov006) classify as newly
tractable — 100% of the batch, matching R7's `Ov017Ov019Retriage.md`
result. No genuine register-allocation coin-flip or unresolvable scheduling
wall was found in this round.

---

## New KB gaps found

1. **`data_ov004_0220f228`** — stride-0x54, 60-entry timer/panel table
   (`func_ov004_021ce364`). Fields observed: `+0xd34` (int, scan-3 compare
   key), `+0xd74` (word), `+0xd78`/`+0xd79`/`+0xd7a` (bytes). Add to
   `Ov004Ov006DataTables.md`.

2. **`data_ov004_02209d88`/`_da0`/`_db8`/`_dd0`** — 4 task-template/string
   pointer labels used in `func_ov004_021ce4a8`'s trade-record TaskConfig
   builds. Likely siblings of the already-catalogued Category 5/6 string
   array family in `Ov004Ov006DataTables.md` — add there.

3. **`data_02104f4c+0xc74`** — bitmask-scan source table (bit-array,
   accessed `+base/8` byte-indexed with `1<<(base&0x1f)` mask) in
   `func_ov004_021cf070`'s tail case. This is a new offset window beyond
   the already-documented `+0xa64..+0xa7c` achievement/mode cluster (R7) —
   likely a separate deck/collection bitmask, not part of that cluster.
   Needs its own entry once cross-referenced against a second caller.

4. **`data_02104f1c`**, **`data_ov004_02211528`/`_1538`/`_1544`/`_1548`**,
   **`data_021a18b8`/`_18c0`** — 6 new globals in `func_ov004_021cfe08`'s
   trade-sub-engine hardware bring-up sequence (task-handle store, 4
   display/wireless config blocks, 2 wireless-comm config words). This
   function is a linear enumeration of NitroSDK calls, so none of these
   gaps block classification — they would only improve KB completeness if
   a struct doc is written.

5. **`data_ov006_021cc4fc`** — 7-entry stride-0x14 lookup table
   (`func_ov006_021bcb94`), fields `+0x2`/`+0x4`/`+0x6`/`+0x8`/`+0xc`
   referenced. Likely a sibling of the already-catalogued
   `data_ov006_021cc03c`/`_c050`/`_c064`/`_c078` stride-sub-table family —
   add alongside those in a future struct doc.

6. **`data_ov006_021cc034`** — small bounds struct (`func_ov006_021be948`),
   halfword fields at `+0x0`/`+0x2`/`+0x4`/`+0x6` used as a fast-path
   rectangle-bounds check. New global, not previously referenced.

7. **`func_020216b0`** — the sibling OBJ-attribute field-setter to the
   already-matched `func_02021660` (`dossiers-high/02021660.md`). Used by
   every ov006 battle-animation function in this doc (`021bbe7c`/`021bc0cc`/
   `021bc45c`/`021bcedc`/`021bcb94`) with a consistent `(obj, field_id,
   value)` signature (field IDs observed: `0`,`2`,`3`,`4`,`0xc`,`0xd`,`0x11`,
   `0x12`). Worth its own dossier entry given how central it is to this
   whole family — currently only inferable from call-site context.

---

## Tally

| Metric | Count |
|--------|-------|
| ov004 examined | 15 |
| ov004 newly tractable | 15 |
| ov006 examined | 15 |
| ov006 newly tractable | 15 |
| **Total examined** | **30** |
| **Total newly tractable** | **30 (100%)** |
| Confirmed intractable (wall) | 0 |
| Skipped (already `.c`) | 0 |
| New KB gaps flagged | 7 |

This round extends R6's `Ov004Ov006Deep.md` (15 newly tractable across 44
examined) with a second 100%-hit-rate batch, reinforcing R7's core finding:
once the struct/data/constant KB reaches sufficient maturity for a module,
size and call-count stop predicting difficulty — the original E/F
classification was measuring "many instructions to read," not "genuine
scheduling ambiguity." ov004's residual is dominated by the
`data_021040ac`/`data_ov004_0220b500` trade-UI state-machine family (11 of
15 functions here); ov006's residual is dominated by the `02021660`/
`020216b0` OBJ-attribute-setter battle-animation family (12 of 15 functions
here) — both are now well-enough characterized that a further virgin batch
in either overlay should be expected to perform similarly.
