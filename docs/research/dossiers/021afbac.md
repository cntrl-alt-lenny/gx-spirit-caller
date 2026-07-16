# 021afbac — func_ov008_021afbac (ov008, class C, 128B)

## Recipe + Risk

**Recipe:** guard branch; row=base+(x+y)*10, read row[sel-1] as ldrh[-2]
**Risk:** orig forms the pointer with separate adds (+row, +ip*2, ldrh[#-2]); mwcc may fold sel*2-2 into one scaled addr or pick a different base reg. reshape-able (index expr / [row](sel-1) form)

## Prep draft

```c
/* CAMPAIGN-PREP candidate for func_021afbac (ov008, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     guard branch; row=base+(x+y)*10, read row[sel-1] as ldrh[-2]; v held in r4 across call
 *   risk:       orig forms the pointer with separate adds (+row, +ip*2, ldrh[#-2]); mwcc may fold sel*2-2 into one scaled addr or pick a different base reg. reshape-able (index expr / (row)[sel-1] form)
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov008_021afbac (ov008, class C, MED) — built-free.
 * UNVERIFIED + ITERATION-EXPECTED. Branch + index arith + call sequencing.
 *
 * data_021b2de4: u16@+4 = a selector count; if 0 -> default path. Else index a
 * 10-byte-stride row table (ptr@+0xc0) by (u16@+0 + u16@+2), step 2 bytes per
 * unit, and read row[sel-1] (the ldrh [r1,#-2] after adding ip*2). Both arms
 * then commit via 021b2200 with the cleared handle word @+0xbc.
 */
extern void func_ov008_021b22e4(int a0);
extern void func_ov008_021b2268(int a0, int a1);
extern void func_ov008_021b2200(int a0);

extern char data_ov008_021b2de4[];

void func_ov008_021afbac(void) {
    int sel = *(unsigned short *)(data_ov008_021b2de4 + 0x4);

    if (sel == 0) {
        func_ov008_021b22e4(0);
        *(int *)(data_ov008_021b2de4 + 0xbc) = 0;
    } else {
        char *row = *(char **)(data_ov008_021b2de4 + 0xc0) +
                    (*(unsigned short *)(data_ov008_021b2de4) +
                     *(unsigned short *)(data_ov008_021b2de4 + 2)) * 5 * 2;
        int v = *(unsigned short *)(row + sel * 2 - 2);
        func_ov008_021b22e4(1);
        func_ov008_021b2268(v, 0);
    }

    func_ov008_021b2200(*(int *)(data_ov008_021b2de4 + 0xbc));
    *(int *)(data_ov008_021b2de4 + 0xbc) = 0;
}
```

## Struct context

`data_ov008_021b2de4` is the ov008 main state block:

| field | offset | type | purpose |
|-------|--------|------|---------|
| x | +0x00 | u16 | row table X index component |
| y | +0x02 | u16 | row table Y index component |
| sel | +0x04 | u16 | selector count (guard: 0 = default arm) |
| … | … | … | |
| row_ptr | +0xc0 | char* | base pointer to u16 row table (10-byte stride) |
| handle | +0xbc | int | commit handle, cleared after commit |

The address arithmetic: `row_ptr + (x + y) * 10` positions at the correct row (10 = 5 u16s per row). Then `row[sel-1]` = `*(u16*)(row + (sel-1)*2)` = `*(u16*)(row + sel*2 - 2)` which the asm emits as `ldrh [r1, #-2]` after computing `row + sel*2`. Keep the `sel*2-2` form in the draft.

## Closest matched example

**Path:** src/overlay008/func_ov008_021af0a8.c (this batch)
**Why similar:** identical access to `data_ov008_021b2de4` at +0x00, +0x02, +0xc0; same `*(char**)(data+0xc0)` double-deref row-base pattern; same 10-byte (5*2) stride.
**Key lesson from that file:** the `+0xc0` field is a pointer stored in the state block; it must be double-dereferenced as `*(char**)(data+0xc0)`, not cast as an array. The `x+y` sum uses two separate `ldrh` loads (not a u32 load) — keep the two `*(unsigned short *)` accesses separate in the expression.

## Try this

1. Try `int v = ((unsigned short *)(row))[sel - 1]` as an alternative to the pointer arithmetic form `*(unsigned short *)(row + sel*2 - 2)` — the array-index form may produce the cleaner `add ip,r1,r3,lsl#1` / `ldrh [ip,#-2]` sequence. If the current form already produces `ldrh[#-2]`, keep it.
2. If the `(x+y)*5*2` multiply folds to `(x+y)*10` in one `mul` vs `lsl+add`, try writing `* 10` directly instead of `* 5 * 2`. Check objdiff for whether the multiply instruction changes.
3. If the `func_ov008_021b2268` call's register assignment diverges (v must be in r4 across the `021b22e4(1)` call), try binding: `int v = ...;` before `func_ov008_021b22e4(1);` so v gets a callee-saved register. If still not matching, escalate to permuter.

## GROUND TRUTH (from .s)

**Pool words (literal pool, in order):**

| label | value | type |
|-------|-------|------|
| `_LIT0` | `data_ov008_021b2de4` | raw |

**BL/BLX callees (in call order, unique):**

| instr | target | notes |
|-------|--------|-------|
| `bl` | `func_ov008_021b22e4` | overlay call (ov008) |
| `bl` | `func_ov008_021b2268` | overlay call (ov008) |
| `bl` | `func_ov008_021b2200` | overlay call (ov008) |

> **Mode-C reminder:** never emit `static const` arrays or struct literals — they generate a `.rodata` section that breaks the link silently. Use `extern data_XXXX` references instead.

