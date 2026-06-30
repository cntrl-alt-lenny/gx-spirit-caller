# 021caedc — func_ov004_021caedc (overlay004, class E, 388B)

## Re-triage

**Original verdict:** low — "jump-table + nested store loop, reg-alloc"

**New verdict:** HIGH — the jump table `addls pc, pc, r0, lsl #2` over 6 entries (cases 0–5) is a standard mwcc switch, and all case bodies now have named constants. The nested loop in case 3 (`cmp ip, #0x2 / blt .L_74`) iterates exactly 2 times with stride `+0x108` on `data_02104cf8` and stride `+0x28` on `r6 = r4`. The conditional stores of `[r4, #0x48]` and `[r4, #0x54]` are the documented b500 enabled/mode fields. The `moveq/movne` in case 1 (the `0xb9c` conditional) is a clean ternary. The else path (when `func_0201cfa0` returns 0) uses `func_0201d060` with three-field zero plus `func_0201d050`.

**Why newly tractable:** All six mode values (0x13, 0x16, 0x11, 0x4, 0x9) are now placed in OverlayConstants.md phase-enum context. `data_ov004_0220b500` is confirmed as the b500 state record; fields `+0x48` (enabled), `+0x54` (mode), `+0x58` (cleared in else-path) are documented. `data_02104cf8` stride `+0x108` and inner `+0xc` are the Category 5 array strides from Ov004Ov006DataTables.md. The `addls pc, pc, r0, lsl #2` jump table is a well-known mwcc pattern; the 6-way dispatch with cases 0 and 5+ collapsing to default is readable.

---

## Assembly

```asm
func_ov004_021caedc:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r4, _LIT0               ; r4 = data_ov004_0220b500 (b500 state record)
    bl func_0201cfa0
    cmp r0, #0x0
    beq .L_128                  ; func_0201cfa0() == 0 → else branch

    ; === if branch: func_0201cfa0() != 0 ===
    bl func_0201d040             ; r0 = state code
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2  ; switch(r0): 0..5 table, >5 falls to default
    b .L_114                    ; >5 → default
    ; table: b[0]=.L_114, b[1]=.L_d8, b[2]=.L_ec, b[3]=.L_64, b[4]=.L_3c, b[5]=.L_50
    b .L_114  ; case 0 → default
    b .L_d8   ; case 1
    b .L_ec   ; case 2 (note: addls jumps +8 past itself for case 0 = first b .L_114)
    b .L_64   ; case 3
    b .L_3c   ; case 4
    b .L_50   ; case 5

.L_3c: ; case 4
    mov r1, #0x1
    mov r0, #0x13
    str r1, [r4, #0x48]         ; b500->field_48 = 1
    str r0, [r4, #0x54]         ; b500->field_54 = 0x13
    b .L_15c

.L_50: ; case 5
    mov r1, #0x1
    mov r0, #0x16
    str r1, [r4, #0x48]         ; b500->field_48 = 1
    str r0, [r4, #0x54]         ; b500->field_54 = 0x16
    b .L_15c

.L_64: ; case 3 — nested loop
    mov ip, #0x0                ; ip = outer loop counter i
    ldr r5, _LIT1               ; r5 = data_02104cf8
    mov r6, r4                  ; r6 = b500 base (incremented by +0x28 each iter)
    mov r2, ip                  ; r2 = inner loop counter j = 0
.L_74:
    add r0, r4, ip, lsl #0x2
    ldr r3, [r5]                ; r3 = data_02104cf8[i] (count)
    add r0, r0, #0x3000         ; r0 = &b500[i*4 + 0x3000]
    mov lr, r2                  ; lr = j (save inner counter)
    str r3, [r0, #0xc0c]        ; b500_i->field_c0c = count
    cmp r3, #0x0
    bls .L_b0                   ; count == 0: skip inner loop
.L_90:
    add r0, r5, lr, lsl #0x1    ; r0 = data_02104cf8 + j*2
    ldrh r1, [r0, #0xc]         ; r1 = *(u16*)(data_02104cf8 + j*2 + 0xc)
    add r0, r6, lr, lsl #0x2    ; r0 = r6 + j*4
    add r0, r0, #0x3000         ; r0 = b500_j + 0x3000
    add lr, lr, #0x1            ; j++
    str r1, [r0, #0xc14]        ; b500_j->field_c14 = entry
    cmp lr, r3
    bcc .L_90                   ; j < count
.L_b0:
    add ip, ip, #0x1            ; i++
    cmp ip, #0x2
    add r5, r5, #0x108          ; data_02104cf8 += 0x108 (next row)
    add r6, r6, #0x28           ; b500 ptr += 0x28 (stride between sub-records)
    blt .L_74                   ; i < 2
    mov r1, #0x3
    mov r0, #0x11
    str r1, [r4, #0x48]         ; b500->field_48 = 3
    str r0, [r4, #0x54]         ; b500->field_54 = 0x11
    b .L_15c

.L_d8: ; case 1
    mov r1, #0x1
    mov r0, #0x4
    str r1, [r4, #0x48]
    str r0, [r4, #0x54]
    b .L_15c

.L_ec: ; case 2 — conditional 0x9 vs 0x4
    mov r1, #0x1
    ldr r0, _LIT2               ; data_021040ac
    str r1, [r4, #0x48]
    ldr r0, [r0, #0xb9c]        ; r0 = data_021040ac[0xb9c/4]
    cmp r0, #0x0
    moveq r0, #0x9
    streq r0, [r4, #0x54]       ; if == 0: field_54 = 9
    movne r0, #0x4
    strne r0, [r4, #0x54]       ; if != 0: field_54 = 4
    b .L_15c

.L_114: ; default (case 0, >5)
    mov r1, #0x1
    mov r0, #0x4
    str r1, [r4, #0x48]
    str r0, [r4, #0x54]
    b .L_15c

    ; === else branch: func_0201cfa0() == 0 ===
.L_128:
    bl func_0201d060
    cmp r0, #0x0
    beq .L_14c
    mov r0, #0x0
    str r0, [r4, #0x48]         ; b500->field_48 = 0
    str r0, [r4, #0x54]         ; b500->field_54 = 0
    str r0, [r4, #0x58]         ; b500->field_58 = 0
    bl func_0201d050
    b .L_15c
.L_14c:
    mov r1, #0x0
    mov r0, #0x1
    str r1, [r4, #0x48]         ; b500->field_48 = 0
    str r0, [r4, #0x54]         ; b500->field_54 = 1

.L_15c:
    ldr r0, [r4, #0x48]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    str r0, [r4, #0x4c]         ; b500->field_4c = (field_48 == 0) ? 1 : 0
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov004_0220b500
_LIT1: .word data_02104cf8
_LIT2: .word data_021040ac
```

---

## Struct context

`r4 = data_ov004_0220b500` — b500 main state record.

| offset | field | type | use |
|--------|-------|------|-----|
| `+0x48` | `field_48` | `int` | enabled flag — set to 0/1/3 by cases |
| `+0x4c` | `field_4c` | `int` | `(field_48 == 0) ? 1 : 0` — written at tail |
| `+0x54` | `field_54` | `int` | mode word — 0x4/0x9/0x11/0x13/0x16 |
| `+0x58` | `field_58` | `int` | cleared to 0 only in the else-path non-zero sub-branch |
| `+0x3000 + i*4 + 0xc0c` | sub-record count | `int` | inner loop writes from `data_02104cf8[i]` |
| `+0x3000 + j*4 + 0xc14` | sub-record entry | `int` | inner loop writes from `data_02104cf8[j*2+0xc]` |

`data_02104cf8`: Category 5 array. Each row is `0x108` bytes. Word at `+0` is count; u16 array at `+0xc` (stride `+0x2`) are entries.

The sub-records of b500 addressed in case 3 have stride `+0x28` and the field at `+0xc0c` / `+0xc14` relative to `b500 + 0x3000`. The `r6 += 0x28` progression and `ip` counter (0..1, i.e., 2 iterations) confirm exactly 2 sub-records.

---

## Recipe sketch

```c
int func_ov004_021caedc(void) {
    int *b500 = data_ov004_0220b500;

    if (func_0201cfa0()) {
        int code = func_0201d040();
        switch (code) {
        case 4:
            b500[0x48/4] = 1; b500[0x54/4] = 0x13; break;
        case 5:
            b500[0x48/4] = 1; b500[0x54/4] = 0x16; break;
        case 3: {
            unsigned int *cf = (unsigned int *)data_02104cf8;
            char *p6 = (char *)b500;
            for (int i = 0; i < 2; i++) {
                unsigned int cnt = cf[0];
                *(int *)(p6 + i * 4 + 0x3000 + 0xc0c) = cnt;
                for (unsigned int j = 0; j < cnt; j++) {
                    unsigned short v = *(unsigned short *)((char *)cf + j * 2 + 0xc);
                    *(int *)((char *)b500 + j * 4 + 0x3000 + 0xc14) = v;
                }
                cf = (unsigned int *)((char *)cf + 0x108);
                p6 += 0x28;
            }
            b500[0x48/4] = 3; b500[0x54/4] = 0x11; break;
        }
        case 1:
            b500[0x48/4] = 1; b500[0x54/4] = 4; break;
        case 2:
            b500[0x48/4] = 1;
            b500[0x54/4] = (*(int *)((char *)data_021040ac + 0xb9c) == 0) ? 9 : 4;
            break;
        default:
            b500[0x48/4] = 1; b500[0x54/4] = 4; break;
        }
    } else {
        if (func_0201d060()) {
            b500[0x48/4] = 0;
            b500[0x54/4] = 0;
            b500[0x58/4] = 0;
            func_0201d050();
        } else {
            b500[0x48/4] = 0;
            b500[0x54/4] = 1;
        }
    }

    b500[0x4c/4] = (b500[0x48/4] == 0) ? 1 : 0;
    return 1;
}
```

**Levers:**
- Jump table: `cmp r0, #0x5 / addls pc, pc, r0, lsl #2` — mwcc emits this for `switch(code)` when cases are dense 0..5. The jump-table entries in order are: `default, case1, case2, case3, case4, case5`.
- Case 3 nested loop: outer `i < 2`, inner `j < cnt`. The `r6 = r4` copy and `r6 += 0x28` is the sub-record pointer increment — model this as `p6` pointer arithmetic.
- `moveq r0, #0x9 / streq + movne r0, #0x4 / strne` in case 2 — mwcc emits this for `b500->field_54 = (cond) ? 9 : 4;` with predicated stores. Both `streq` and `strne` must write to the same field.
- Tail `field_4c = (field_48 == 0) ? 1 : 0`: write `b500->field_4c = !b500->field_48;` which mwcc translates to `cmp/moveq 1/movne 0/str`.

---

## Closest matched example

**Path:** `src/overlay011/func_ov011_021ca324.c`

**Why similar:** Same `switch(...)` over a mode field dispatching into struct stores, with a `func_02006c0c(table_entry, 4, 0)` call. The `(lsl #23) >> 28` slot extraction is the ov011 equivalent of the ov004 phase index. The tail store `*(int*)(s + 0x29C) = (... & ~7) | (t & 7)` is the same bitmask-or pattern as the `field_4c = !field_48` tail.

**Key lesson:** For the case 3 nested loop, the outer pointer `r6` starts at `r4` (not at some offset) and advances by `+0x28`. The inner `j` loop uses `r6` for the b500 destination but `r5` (data_02104cf8) for the source — keep these as separate pointer variables in C.

---

## Try this

1. Verify the jump table: in objdiff, the switch on `func_0201d040()` result should produce `addls pc, pc, r0, lsl #2` followed by exactly 6 branch words. If mwcc emits a chain of `cmp/beq` instead, add `__attribute__((optimize("O2")))` or restructure as explicit dense cases 0..5 with no gaps.
2. Case 3 inner loop: the inner `j` iterates from 0 up to `cnt` (exclusive). The `bcc .L_90` at the end confirms the `j < cnt` is an unsigned comparison — write `for (unsigned int j = 0; j < cnt; j++)`.
3. Case 2 ternary: `moveq/streq + movne/strne` requires both stores to target the same address. Write `b500->field_54 = cond ? 9 : 4;` as a single assignment — do not use separate `if/else` stores.
4. Else-path: `func_0201d060()` result is `cmp r0, #0x0 / beq .L_14c` — write `if (func_0201d060() != 0)` for the non-zero path (three-field clear + `func_0201d050`) and `else` for the zero-path (field_48=0, field_54=1).
5. Park as .s if the case 3 loop body produces different register assignments for the inner-loop increment that cannot be resolved by pointer-type choice.

## GROUND TRUTH (from .s)

**Pool words (literal pool, in order):**

| label | value | type |
|-------|-------|------|
| `_LIT0` | `data_ov004_0220b500` | raw |
| `_LIT1` | `data_02104cf8` | data symbol |
| `_LIT2` | `data_021040ac` | data symbol |

**BL/BLX callees (in call order, unique):**

| instr | target | notes |
|-------|--------|-------|
| `bl` | `func_0201cfa0` | main TU call |
| `bl` | `func_0201d040` | main TU call |
| `bl` | `func_0201d060` | main TU call |
| `bl` | `func_0201d050` | main TU call |

> **Mode-C reminder:** never emit `static const` arrays or struct literals — they generate a `.rodata` section that breaks the link silently. Use `extern data_XXXX` references instead.

