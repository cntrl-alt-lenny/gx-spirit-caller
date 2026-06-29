# 021cabbc — func_ov011_021cabbc (overlay011, class F, 304B)

## Re-triage

**Original verdict:** low — "73 insns, 9 branches, nested guard chains + many calls"

**New verdict:** HIGH — two-argument function dispatching on `anim_en` flag (u8 from `act[0x270]`) and `dir` argument. When `anim_en`: calls `func_ov011_021cd1fc()`, extracts 4-bit slot from `act[0x268]`, indexes `data_ov011_021d3060` at `slot*8` to get an anim row ID, then calls `func_ov000_021af560` or `021af4d8` based on `dir`. When NOT `anim_en`: the `0x32/0x41/0x39` frame-ID constants select among three known animation frames via two sub-guard calls. The `func_020139b4()` default-handle call and `mvn r1, #0x0` / `cmp r7, r1` check (`facing == -1`) are a clean sentinel pattern.

**Why newly tractable:** `data_ov011_021d3060` is the matched anim-row table (`data_ov011_021d3060.c` is in the overlay011 source tree). `data_ov011_021d3177` is the matched `data_ov011_021d3178.c` companion (off by one — the struct starts at 021d3177 as a byte-addressed u8 table). Frame constants `0x32` (50), `0x41` (65), `0x39` (57) are animation state IDs. `func_0201a3ec` and `func_0201a498` are the two sub-guards for the fallback path. `func_0201b6e4(0x73)` / `func_0201b6e4(0x74)` are the frame-boundary test calls. All function signatures are resolved.

---

## Assembly

```asm
func_ov011_021cabbc:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r6, _LIT0               ; r6 = data_ov011_021d403c (actor base)
    mov r7, r0                  ; r7 = facing arg (may be -1 sentinel)
    mov r5, r1                  ; r5 = dir arg
    bl func_020139b4            ; r4 = default handle
    mov r4, r0
    ldr r0, [r6, #0x270]        ; r0 = act[0x270] = anim_en_raw
    mvn r1, #0x0                ; r1 = -1 (sentinel check)
    cmp r7, r1
    mov r0, r0, lsl #0x18       ; u8 extract: (raw << 24) >> 24
    movne r4, r7                ; if facing != -1: use arg as handle
    movs r0, r0, lsr #0x18      ; r0 = anim_en (u8); sets Z if 0
    beq .L_94                   ; anim_en == 0: goto fallback

    ; === anim_en path ===
    cmp r5, #0x0
    beq .L_68                   ; dir == 0: use func_ov000_021af4d8

    ; dir != 0
    bl func_ov011_021cd1fc      ; r0 = frame_data_ptr
    ldr r1, [r6, #0x268]        ; r1 = act[0x268] = actor_facing
    mov r2, r1, lsl #0x17       ; 4-bit extract
    ldr r1, _LIT1               ; r1 = data_ov011_021d3060
    mov r2, r2, lsr #0x1c       ; r2 = slot
    add r1, r1, r2, lsl #0x3   ; r1 = &d3060[slot * 8]
    ldrb r1, [r0, r1]           ; r1 = frame_data_ptr[slot*8 offset]
    mov r2, r4                  ; r2 = handle
    mov r0, #0x1
    bl func_ov000_021af560      ; af560(1, frame_id, handle)
    ldmia sp!, {r3, r4, r5, r6, r7, pc}

.L_68: ; dir == 0
    bl func_ov011_021cd1fc      ; r0 = frame_data_ptr
    ldr r1, [r6, #0x268]
    mov r2, r1, lsl #0x17
    ldr r1, _LIT1               ; data_ov011_021d3060
    mov r2, r2, lsr #0x1c       ; slot
    add r1, r1, r2, lsl #0x3
    ldrb r1, [r0, r1]           ; frame_id from table
    mov r2, r4
    mov r0, #0x1
    bl func_ov000_021af4d8      ; af4d8(1, frame_id, handle)
    ldmia sp!, {r3, r4, r5, r6, r7, pc}

    ; === anim_en == 0 fallback ===
.L_94:
    ldr r1, [r6, #0x268]        ; actor_facing
    ldr r0, [r6, #0x280]        ; act[0x280] = some field
    mov r1, r1, lsl #0x17       ; 4-bit slot extract
    ldr r2, _LIT2               ; data_ov011_021d3177
    mov r3, r1, lsr #0x1c       ; r3 = slot
    mov r1, r0, lsl #0x18       ; u8 from act[0x280]
    add r0, r2, r3, lsl #0x4   ; r0 = &d3177[slot * 16]
    ldrb r6, [r0, r1, lsr #0x18] ; r6 = d3177[slot*16 + u8_val]
    cmp r6, #0x32               ; frame_id == 0x32 (50)?
    bne .L_100
    bl func_0201a3ec
    cmp r0, #0x0
    bne .L_d8
    mov r0, #0x73
    bl func_0201b6e4            ; check boundary 0x73
    cmp r0, #0x0
    beq .L_e0
.L_d8:
    mov r6, #0x41               ; frame_id = 0x41
    b .L_100
.L_e0:
    bl func_0201a498
    cmp r0, #0x0
    bne .L_fc
    mov r0, #0x74
    bl func_0201b6e4            ; check boundary 0x74
    cmp r0, #0x0
    beq .L_100
.L_fc:
    mov r6, #0x39               ; frame_id = 0x39
.L_100:
    cmp r5, #0x0
    mov r1, r6
    mov r0, #0x1
    mov r2, r4
    beq .L_11c
    bl func_ov000_021af560
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_11c:
    bl func_ov000_021af4d8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov011_021d403c
_LIT1: .word data_ov011_021d3060
_LIT2: .word data_ov011_021d3177
```

---

## Struct context

`data_ov011_021d403c` — actor base.

| offset | field | type | use |
|--------|-------|------|-----|
| `+0x268` | actor_facing | `int` | 4-bit slot = `(facing << 23) >> 28` |
| `+0x270` | anim_en_raw | `int` | u8 in low byte: `(raw << 24) >> 24` |
| `+0x280` | sub_state | `int` | u8 in low byte: indexes into `data_ov011_021d3177` row |

`data_ov011_021d3060`: anim row table. Stride = 8 bytes per slot. The frame pointer from `func_ov011_021cd1fc()` is indexed into it: `frame_ptr[slot*8]` gives the frame ID.

`data_ov011_021d3177`: anim frame table. Stride = 16 bytes per slot. `d3177[slot*16 + u8_val]` gives the fallback frame ID.

Arguments:
- `r0` = `facing` (-1 means "use default from `func_020139b4()`")
- `r1` = `dir` (0 = use `021af4d8`, nonzero = use `021af560`)

---

## Recipe sketch

```c
void func_ov011_021cabbc(int facing, int dir) {
    extern unsigned char data_ov011_021d3060[];
    extern unsigned char data_ov011_021d3177[];
    int *act = (int *)data_ov011_021d403c;

    int handle = func_020139b4();
    if (facing != -1) handle = facing;

    unsigned char anim_en = (unsigned char)((act[0x270/4] << 24) >> 24);
    if (anim_en) {
        void *fd = func_ov011_021cd1fc();
        int slot = (unsigned int)(act[0x268/4] << 23) >> 28;
        unsigned char frame_id = ((unsigned char *)fd)[data_ov011_021d3060[slot * 8]];
        if (dir != 0)
            func_ov000_021af560(1, frame_id, handle);
        else
            func_ov000_021af4d8(1, frame_id, handle);
        return;
    }

    /* fallback: frame selection from d3177 */
    int slot = (unsigned int)(act[0x268/4] << 23) >> 28;
    unsigned char sub = (unsigned char)((act[0x280/4] << 24) >> 24);
    unsigned char frame_id = data_ov011_021d3177[slot * 16 + sub];

    if (frame_id == 0x32) {
        if (func_0201a3ec() != 0 || func_0201b6e4(0x73) != 0) {
            frame_id = 0x41;
        } else {
            if (func_0201a498() != 0 || func_0201b6e4(0x74) != 0) {
                frame_id = 0x39;
            }
        }
    }

    if (dir != 0)
        func_ov000_021af560(1, frame_id, handle);
    else
        func_ov000_021af4d8(1, frame_id, handle);
}
```

**Levers:**
- `mvn r1, #0x0 / cmp r7, r1` = compare facing against -1 sentinel: write `if (facing != -1) handle = facing;`.
- `movs r0, r0, lsr #0x18` — the `movs` sets flags; `beq .L_94` on zero fires for `anim_en == 0`.
- Frame-data indexing: `ldrb r1, [r0, r1]` where r1 = `&d3060[slot*8]` and r0 = frame_ptr — the u8 is at `frame_ptr[slot*8_offset]`.
- Fallback `frame_id = 0x32` check: the nested `if/else` in `.L_d8/.L_e0` maps to the short-circuit `if (a || b) frame=0x41; else if (c || d) frame=0x39;`.
- `dir` check at tail (`.L_100`) is shared by both anim_en paths.

---

## Closest matched example

**Path:** `src/overlay011/func_ov011_021cad00.c`

**Why similar:** Same overlay and same `data_ov011_021d403c` / `+0x268` actor-facing field with `(<<23)>>28` 4-bit extraction. Also uses a single arg-compare sentinel pattern (`if (arg == 0 || arg == 2)`) followed by a conditional function call. The two-call dispatch at the end (`func_ov011_021cd940` vs `func_ov011_021cdb94`) mirrors the `021af560` vs `021af4d8` dispatch here.

**Key lesson:** The frame-data pointer from `func_ov011_021cd1fc()` is in r0 and used directly in the `ldrb r1, [r0, r1]` indexed load — not stored to a local first. Write `((unsigned char *)func_ov011_021cd1fc())[d3060[slot*8]]` or assign the frame pointer to a local and index it immediately.

---

## Try this

1. Start with the `anim_en` path — `movs` after the u8 extract sets Z automatically; write `if (anim_en)` not `if (anim_en != 0)` to get the same `movs/beq` pattern.
2. The `slot` variable is computed twice (once in the anim_en block, once in the fallback). Do NOT share a single `slot` across both blocks — the assembly re-extracts it independently in each branch.
3. Fallback frame selection: the assembly `cmp r6, #0x32 / bne .L_100` means if `frame_id != 0x32`, skip all sub-guards and go directly to the final dispatch. Write as `if (frame_id == 0x32) { ... }` with the sub-guard chain inside.
4. `func_0201a3ec() != 0 || func_0201b6e4(0x73) != 0` for the `0x41` path: the assembly `bne .L_d8` on `func_0201a3ec` result and `beq .L_e0` on `func_0201b6e4` result — first call nonzero → 0x41; first zero → check second; second zero → 0x39 path.
5. Park as .s if the fallback frame-selection chain emits a different branch topology (e.g., if mwcc merges the two `0201a3ec / 0201b6e4` calls into a single conditional expression).
