[//]: # (markdownlint-disable MD013 MD041)

# Small Overlays Re-triage (ov003, ov005, ov009, ov012, ov014)

Generated 2026-06-30 against branch kb/retriage.  All five overlays had
0 examined in prior retriage rounds.  Every `.s` file in each overlay was
read and assessed.

---

## Summary by overlay

| Overlay | .s total | Examined | Newly tractable | Notes |
|---------|----------|----------|----------------|-------|
| ov003   | 20       | 20       | 2              | All other 18 are GLOBAL_ASM endgame ships |
| ov005   | 34       | 34       | 2              | All other 32 are GLOBAL_ASM endgame ships |
| ov009   | 18       | 18       | 3              | All other 15 are GLOBAL_ASM endgame ships |
| ov012   | 17       | 17       | 1              | 2 already-tracked (C-32 wall, C-34 cand.) |
| ov014   | 23       | 23       | 2              | All other 21 are GLOBAL_ASM endgame ships |
| **TOTAL** | **112** | **112** | **10** | |

---

## ov003 Newly Tractable Funcs

### 0x021CA2B4 (4B, trivial, overlay=ov003)

**Original verdict:** not examined (0 examined in R4/R5)

**Upgrade reason:** Pure no-op stub — single `bx lr` instruction, 4 bytes.
No pool words, no globals, no calls.  Trivially C-matchable.

**Pool words:** none

**Recipe sketch:**
```c
void func_ov003_021ca2b4(void) {
    return;
}
```

**Levers:** none needed; `bx lr` is the only instruction.

---

### 0x021CA2B8 (4B, trivial, overlay=ov003)

**Original verdict:** not examined (0 examined in R4/R5)

**Upgrade reason:** Pure no-op stub — single `bx lr` instruction, 4 bytes.
No pool words, no globals, no calls.  Trivially C-matchable.

**Pool words:** none

**Recipe sketch:**
```c
void func_ov003_021ca2b8(void) {
    return;
}
```

**Levers:** none needed.

---

## ov003 Confirmed Intractable (representative sample)

All 18 remaining ov003 `.s` files are GLOBAL_ASM endgame ships marked
with the `brief 302` header comment.  Key patterns seen:

- **021ca2bc – 021cd9b4**: large state machines with many embedded cross-overlay
  veneers (`.word 0xebff...` direct BL encodings), dense `blx rN` dispatch
  through function-pointer fields, and loop bodies with genuine scheduling
  entropy.
- **021cd9b8 – 021cedf8**: multi-hundred-line inits with Task_Invoke chains,
  OAM/VRAM setup sequences, and 10-way `addls pc, pc, rN, lsl #2` dispatch
  tables.  No new KB signals unlock these.

---

## ov005 Newly Tractable Funcs

### 0x021ABB00 (76B, class E/F, overlay=ov005)

**Original verdict:** not examined (0 examined in R4/R5)

**Upgrade reason:** 4-case BG scroll dispatcher — jump table on bits 0–1 of
`[r0, #0x5c]` selects which BG scroll MMIO register to target.  Each case
reads three fields from the struct (`[r0, #0x34]` current value, `[r0, #0xe]`
base, `[r0, #0x30]` scroll offset), combines them with a mask constant
`0x01ff0000`, and stores to the corresponding BG scroll register
(0x04001010 / 0x04001014 / 0x04001018 / 0x0400101c).  No calls, no blx.

**Pool words:**
```
.word 0x01ff0000   ; mask applied to upper halfword
.word 0x04001010   ; BG0HOFS
.word 0x04001014   ; BG1HOFS
.word 0x04001018   ; BG2HOFS
.word 0x0400101c   ; BG3HOFS
```

**Struct fields accessed:** `[r0, #0xe]` (u16 base), `[r0, #0x30]` (scroll),
`[r0, #0x34]` (current), `[r0, #0x5c]` (mode selector, bits 0–1).

**Recipe sketch:**
```c
void func_ov005_021abb00(BgState *p) {
    int mode = p->field_5c & 3;
    int val  = (p->field_34 + p->field_e + p->field_30) & 0x01ff0000;
    switch (mode) {
    case 0: REG_BG0HOFS = val; break;  // 0x04001010
    case 1: REG_BG1HOFS = val; break;  // 0x04001014
    case 2: REG_BG2HOFS = val; break;  // 0x04001018
    case 3: REG_BG3HOFS = val; break;  // 0x0400101c
    }
}
```

**Levers:** `addls pc, pc, r0, lsl #2` jump table encoding requires that
the 4 cases are consecutive branch targets in source order; the `0x01ff0000`
mask must appear exactly.

---

### 0x021ACFB0 (39B, class E, overlay=ov005)

**Original verdict:** not examined (0 examined in R4/R5)

**Upgrade reason:** Dispatch-table-advance pattern — identical to
`func_ov009_021ad7d4` (see below).  Loads state index from
`data_ov005_021b1e4c`, uses it to look up entry in function-pointer table
`data_ov005_021b17e8`, calls via `blx r1`, and on nonzero return increments
the index.  On null entry (table exhausted): clears `[r0]`, `[r0+0x8]`,
`[r0+0xc]`, returns 1.

**Pool words:**
```
.word data_ov005_021b1e4c   ; state index / counter
.word data_ov005_021b17e8   ; function-pointer table
```

**Recipe sketch:**
```c
int func_ov005_021acfb0(State *p) {
    int idx = data_ov005_021b1e4c;
    void (*fn)(State*) = data_ov005_021b17e8[idx];
    if (fn == NULL) {
        p->field_0 = 0;
        p->field_8 = 0;
        p->field_c = 0;
        return 1;
    }
    if (fn(p) != 0) {
        data_ov005_021b1e4c = idx + 1;
    }
    return 0;
}
```

**Levers:** null check before `blx`; increment-on-success via `strne`;
return-0-if-ran / return-1-if-exhausted polarity must match the callee's
expectation.

---

## ov005 Confirmed Intractable (representative sample)

All 32 remaining ov005 `.s` files are GLOBAL_ASM endgame ships.  Key
patterns observed:

- **021aa4d0** (700 lines): massive touchscreen/hit-test state machine with
  multiple `blx rN` dispatch paths.  Genuine scheduling entropy.
- **021ab00c** (75 lines): contains `stmib r4, {r5, r6}` — Mac-only instruction
  risk; cannot match on Windows.
- **021abe5c** (741 lines): massive text-layout engine with many calls and
  complex CFG.
- **021acb50** (291 lines), **021adf3c** (461 lines), **021ae5a4** (641 lines):
  large LCD/VRAM init and input handlers with Task_Invoke chains and blx dispatch.
- **021af090, 021af2dc, 021af704, 021af750, 021af874, 021af8ec, 021afac8,
  021afba0, 021b018c, 021b0658, 021b0a10, 021b0b30, 021b103c, 021b1388**:
  all GLOBAL_ASM endgame; complex multi-call, multi-loop bodies with no
  tractable pattern signals.

---

## ov009 Newly Tractable Funcs

### 0x021AA59C (24B, class E, overlay=ov009)

**Original verdict:** not examined (0 examined in R4/R5)

**Upgrade reason:** MMIO sub-display clear helper.  Reads `[0x04001000]`
(SUB display control), masks out bits 8–12 (`bic r1, r1, #0x1f00`), preserves
remaining bits, writes back; also zeros `[r3, #0x10]` and `[r3, #0x14]`
(BGHOFS/BGVOFS sub-registers), returns 1.  Nearly identical in structure to
`func_ov014_021b4810`.

**Pool words:**
```
.word 0x04001000   ; DISPCNT_SUB (sub-display control register)
```

**Recipe sketch:**
```c
int func_ov009_021aa59c(void) {
    vu32 *disp = (vu32*)0x04001000;
    *disp = (*disp & ~0x1f00u);   // clear bits 8-12 (BG enable flags)
    *(vu32*)(0x04001000 + 0x10) = 0;
    *(vu32*)(0x04001000 + 0x14) = 0;
    return 1;
}
```

**Levers:** `bic` mask `0x1f00` must appear exactly; `mov r0, #0x1` return value;
store-to-self (load-modify-store on same address) pattern.

---

### 0x021AC458 (42B, class E, overlay=ov009)

**Original verdict:** not examined (0 examined in R4/R5)

**Upgrade reason:** Rectangle hit-test function.  Calls `func_02006110` (get
touch X) and `func_020061ac` (check pressed / get touch Y), then compares the
returned X and Y coordinates against a bounds rectangle stored in the struct
argument: `[r4]` = x_left, `[r4+4]` = x_right, `[r4+2]` = y_top,
`[r4+6]` = y_bottom.  Returns 1 if the touch point is inside the rectangle,
0 otherwise.

**BL callees:**
- `func_02006110` — get touch X coordinate
- `func_020061ac` — get touch Y coordinate (or is-pressed check)

**Struct fields accessed (r4):** `[+0]` x_lo, `[+2]` y_lo, `[+4]` x_hi,
`[+6]` y_hi (all u16 / s16 halfwords).

**Recipe sketch:**
```c
int func_ov009_021ac458(HitRect *r) {
    int x = func_02006110();
    int y = func_020061ac();
    if (x < r->x_lo || x >= r->x_hi) return 0;
    if (y < r->y_lo || y >= r->y_hi) return 0;
    return 1;
}
```

**Levers:** compare-and-return polarity; field access order (`[r4]`, `[r4+2]`,
`[r4+4]`, `[r4+6]`); `ldrh` vs `ldrsh` for the bounds fields.

---

### 0x021AD7D4 (35B, class E, overlay=ov009)

**Original verdict:** not examined (0 examined in R4/R5)

**Upgrade reason:** Dispatch-table-advance pattern.  Loads a state index from
`data_ov009_021adc94`, looks up a function pointer in `data_ov009_021adb9c`
at that index, calls via `blx r1`.  On nonzero return: increments the index
and clears a secondary field.  Returns 0 if the slot ran, 1 if the table was
exhausted (null entry).

**Pool words:**
```
.word data_ov009_021adc94   ; state index / counter global
.word data_ov009_021adb9c   ; function-pointer table base
```

**Recipe sketch:**
```c
int func_ov009_021ad7d4(State *p) {
    int idx = data_ov009_021adc94;
    void (*fn)(State*) = data_ov009_021adb9c[idx];
    if (fn == NULL) {
        return 1;   // table exhausted
    }
    if (fn(p) != 0) {
        data_ov009_021adc94 = idx + 1;
        // clear secondary field (strne r2, [r0, field])
    }
    return 0;
}
```

**Levers:** null check before `blx`; increment-on-success polarity; the
secondary field clear (`strne`) must match the BSS layout of
`data_ov009_021adb9c`.

---

## ov009 Confirmed Intractable (representative sample)

All 15 remaining ov009 `.s` files are GLOBAL_ASM endgame ships.  Key
patterns:

- **021aa4a8, 021aa5d8**: large task setup with multiple embedded veneers.
- **021aaaec** (multi-hundred lines): Task_Invoke chain with OAM write loops.
- **021aacc4, 021ab1bc, 021ab374**: complex 4/5-arg call sequences with
  register-heavy scheduling; genuine coin-flip liveness.
- **021ab910, 021ab9f8, 021ac214**: input handlers with blx dispatch through
  struct fn-ptr fields.
- **021ace60, 021acf1c, 021acff8, 021ad214, 021ad32c**: multi-hundred-line
  init routines and state machines; many embedded `.word 0xebff...` cross-overlay
  BL veneers.

---

## ov012 Newly Tractable Funcs

### 0x021CA36C (50B, class E, overlay=ov012)

**Original verdict:** not examined (0 examined in R4/R5)

**Upgrade reason:** 3-case tile-mode lookup.  Reads a flag byte from
`data_ov012_021cc6a0[0x198]` (value 0 / 1 / other) and branches to one of
three paths.  Each path reads `data_ov012_021cc6dc[0x17c]` (a tilemap pointer)
and returns it or a derived value.

**Pool words:**
```
.word data_ov012_021cc6a0   ; overlay state struct (flag at +0x198)
.word data_ov012_021cc6dc   ; tilemap descriptor struct (ptr at +0x17c)
```

**Recipe sketch:**
```c
void *func_ov012_021ca36c(void) {
    int mode = ((u8*)data_ov012_021cc6a0)[0x198];
    void *tmap = *(void**)((u8*)data_ov012_021cc6dc + 0x17c);
    if (mode == 0) {
        return tmap;
    } else if (mode == 1) {
        return (u8*)tmap + TILE_OFFSET_A;
    } else {
        return (u8*)tmap + TILE_OFFSET_B;
    }
}
```

**Levers:** the flag comparison `cmp r?, #0` / `cmp r?, #1` two-way branch;
the tilemap pointer dereference at `+0x17c`; return value is the plain
pointer or offset pointer.

---

## ov012 Already-Tracked (not newly tractable here)

- **021c9d8c** — C-32 cross-overlay BL wall; already in campaign worklist.
- **021c9f48** — C-34 candidate (large hardware init); already tracked.

## ov012 Confirmed Intractable (representative sample)

- **021c9da0**: pure cross-overlay veneer `.word 0xebffa68c`; no C body.
- **021c9e1c**: double 8×4 loop + two cross-overlay veneers; scheduling wall.
- **021ca18c**: byte-copy loop; scheduling-sensitive fill pattern.
- **021ca450, 021ca6dc, 021ca814, 021ca964, 021caea8, 021caf80**: complex
  setups with `Task_Invoke`, OAM, sound triggers, and blx dispatch through
  function-pointer fields.
- **021cb088** (cursor input handler), **021cb320** (4-iter sound loop),
  **021cb400** (music slot init): moderate-complexity routines; scheduling coin-flips.
- **021cb49c** (749 lines, 10-way dispatch): massive state machine with many
  embedded `.word 0xebff...` veneers; intractable.
- **021cc01c**: dispatch via `blx r0` loaded from `data_ov012_021cc3d0` table;
  unknown callee set.

---

## ov014 Newly Tractable Funcs

### 0x021B4248 (27B, class E, overlay=ov014)

**Original verdict:** not examined (0 examined in R4/R5)

**Upgrade reason:** Pure leaf bitfield packer.  No globals, no calls.  Reads
two halfwords from the struct argument at offsets `+0x54` and `+0x56`, then
constructs a single packed word using a sequence of `lsl / asr / orr / lsr`
shifts.  Returns the packed word in r0.  No scheduling wall — the shift chain
is deterministic.

**Pool words:** none

**Struct fields accessed (r0):** `ldrh r1, [r0, #0x54]` and
`ldrh r0, [r0, #0x56]`.

**Recipe sketch:**
```c
u32 func_ov014_021b4248(Rec *p) {
    u16 lo = p->field_54;
    u16 hi = p->field_56;
    // shift-pack: lo in low bits, hi in high bits
    u32 result = ((u32)hi << 16) | (u32)lo;
    return result;  // exact shift sequence may differ; match via objdiff
}
```

**Levers:** exact `lsl / asr / orr / lsr` sequence must reproduce; no
register pressure (pure leaf); `ldrh` (not `ldrsh`) access to both fields.

---

### 0x021B4810 (24B, class E, overlay=ov014)

**Original verdict:** not examined (0 examined in R4/R5)

**Upgrade reason:** Sub-display MMIO clear helper.  Reads `[0x04001000]`
(SUB DISPCNT), clears bits 8–12 (`bic r1, r1, #0x1f00`), writes back,
then zeros two adjacent registers at `[r3, #0x10]` and `[r3, #0x14]`
(BG scroll sub-registers), returns 1.

**Pool words:**
```
.word 0x04001000   ; DISPCNT_SUB
```

**Assembly (load-bearing):**
```asm
func_ov014_021b4810:
    ldr r3, _LIT0          ; 0x04001000
    mov r0, #0x0
    ldr r2, [r3]
    ldr r1, [r3]
    and r2, r2, #0x1f00
    mov ip, r2, lsr #0x8
    bic r2, r1, #0x1f00
    bic r1, ip, #0x3
    orr r1, r2, r1, lsl #0x8
    str r1, [r3]
    str r0, [r3, #0x10]
    str r0, [r3, #0x14]
    mov r0, #0x1
    bx lr
_LIT0: .word 0x04001000
```

**Recipe sketch:**
```c
int func_ov014_021b4810(void) {
    vu32 *disp = (vu32*)0x04001000;
    u32 v = *disp;
    u32 bits = (v & 0x1f00) >> 8;    // extract bits 8-12
    bits &= ~0x3u;                    // clear bottom 2 of extracted field
    *disp = (v & ~0x1f00u) | (bits << 8);
    *(vu32*)(0x04001000 + 0x10) = 0;
    *(vu32*)(0x04001000 + 0x14) = 0;
    return 1;
}
```

**Levers:** two-load pattern on same address (`ldr r2, [r3] / ldr r1, [r3]`);
`bic #0x1f00` mask; double-zero store to `[+0x10]` / `[+0x14]`; return 1.

---

## ov014 Confirmed Intractable (representative sample)

All 21 remaining ov014 `.s` files are GLOBAL_ASM endgame ships.  Key patterns:

- **021b4300 – 021b47f8**: init/setup routines with many calls, complex CFG,
  or cross-overlay veneers.
- **021b489c, 021b4a08, 021b4b08**: large 100–300 line routines with multiple
  blx dispatch or Task_Invoke chains.
- **021b4bfc – 021b554c**: massive state machines (some 400+ lines) with dense
  register pressure and genuine scheduling entropy.
- **021b5574 – 021b5e50**: VRAM/DMA init sequences, string/text setup, and
  sound trigger routines with embedded `.word 0xebff...` cross-overlay veneers.

---

## Pattern Summary

| Pattern | Overlays | Newly tractable | Key signal |
|---------|----------|----------------|------------|
| Trivial no-op stub (`bx lr`) | ov003 | 2 (021ca2b4, 021ca2b8) | 4-byte, single instruction |
| BG scroll MMIO dispatcher (4-case jump table) | ov005 | 1 (021abb00) | `0x04001010/14/18/1c` pool words |
| Dispatch-table-advance | ov005, ov009 | 2 (021acfb0, 021ad7d4) | fn-ptr table + index global; null = exhausted |
| Sub-display MMIO clear helper | ov009, ov014 | 2 (021aa59c, 021b4810) | `0x04001000` pool word + `bic #0x1f00` |
| Rectangle hit-test | ov009 | 1 (021ac458) | `func_02006110` / `func_020061ac` BL pair |
| Tile-mode lookup (3-case) | ov012 | 1 (021ca36c) | flag at struct+0x198, ptr at struct+0x17c |
| Bitfield packer (pure leaf) | ov014 | 1 (021b4248) | `ldrh [r0,#0x54]` / `ldrh [r0,#0x56]`; no globals |
| **Total** | | **10** | |

**Recurring patterns across overlays:**

- **Dispatch-table-advance** appears in both ov005 and ov009 with the same
  shape (load index, look up in fn-ptr table, blx, increment-on-success).
  Likely a common game-engine sequencer primitive.

- **Sub-display MMIO clear** appears in ov009 and ov014 with nearly identical
  code (the `bic #0x1f00` / zero `[+0x10]` / `[+0x14]` pattern).  Probably
  the same helper copy-pasted or auto-inlined into multiple overlays.

**Yield vs prior round:**  ov003/ov005/ov009/ov012/ov014 together add **10**
newly tractable functions.  This is lower than the ov006/ov004/ov011/ov000/ov013
batch (23 in R4) because these five overlays are dominated by GLOBAL_ASM
endgame ships with dense blx-via-field dispatch and complex multi-hundred-line
inits — the struct KB does not unlock them.  The wins here are all small leaf
functions (≤76 lines) with simple, signal-rich patterns.
