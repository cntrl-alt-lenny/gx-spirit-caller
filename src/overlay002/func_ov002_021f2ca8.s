; func_ov002_021f2ca8 — MISTAGGED (cm-parked-reaudit-2 batch B,
; 2026-07-25): this is NOT a genuine C-34 duplicate-pool-slot case —
; data_ov002_022cf16c has exactly ONE pool word (`.L_021f2d34` below);
; `.L_021f2d30`'s `0x868` is an unrelated stride literal, not a second
; reference to the same symbol. Nothing for mwasmarm to dedup or fail to
; dedup. Not attempted further: the real content is a 3-way bitfield
; comparison (a 13-bit id-style field plus two OTHER bitfields packed
; around it in the same word, compared against a third bitfield sliced
; out of a caller halfword) that would need careful from-scratch bit-
; layout derivation to get byte-exact, unlike the mechanical pool-split
; lever this doc's C-34 entry covers. m2c's raw read (informational
; only, NOT verified against the toolchain) for a future session:
;
;   s32 func_ov002_021f2ca8(void *arg0, s32 arg1, s32 arg2) {
;       s32 temp_ip;
;       if (((u32)(arg0->unk2 << 0x1F) >> 0x1F) != arg1) return 0;
;       temp_ip = *(int*)((arg1 & 1) * 0x868 + (s32)&data_ov002_022cf16c
;                         + 0x30 + arg2 * 0x14);
;       if (((u32)(temp_ip << 0x13) >> 0x13) == 0) return 0;
;       if ((((u32)(temp_ip * 4) >> 0x18) * 2
;            + ((u32)(temp_ip << 0x12) >> 0x1F))
;           == ((u32)(arg0->unk4 << 0x11) >> 0x17)) return 0;
;       return func_ov002_021c1e44() == 0 ? 1 : 0;
;   }
;
; The `(x & 1) * 0x868 + &data_ov002_022cf16c` shape matches the
; established per-side-table idiom already used by ~20 shipped sibling
; functions in this overlay (e.g. func_ov002_021ff2c8.c); the low-13-bit
; extraction matches the `struct Ov002Item { unsigned int id : 13; }`
; type already used for the unrelated data_ov002_022cacc0 array in
; func_ov002_022476e8.c / func_ov002_02247ad8.c, but the OTHER two
; bitfields here (an 8-bit + a 1-bit slice combined, vs. a 9-bit slice
; of arg0->unk4) don't match any type already established in this
; codebase and would need independent verification.

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021c1e44
        .global func_ov002_021f2ca8
        .arm
func_ov002_021f2ca8:
    stmdb sp!, {r3, lr}
    ldrh r3, [r0, #0x2]
    mov r3, r3, lsl #0x1f
    mov r3, r3, lsr #0x1f
    cmp r3, r1
    movne r0, #0x0
    ldmneia sp!, {r3, pc}
    ldr r3, .L_021f2d30
    ldr ip, .L_021f2d34
    and lr, r1, #0x1
    mla ip, lr, r3, ip
    mov r3, #0x14
    mul lr, r2, r3
    add r3, ip, #0x30
    ldr ip, [r3, lr]
    mov r3, ip, lsl #0x13
    movs r3, r3, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    mov r3, ip, lsl #0x2
    ldrh lr, [r0, #0x4]
    mov r3, r3, lsr #0x18
    mov ip, ip, lsl #0x12
    mov r3, r3, lsl #0x1
    mov lr, lr, lsl #0x11
    add r3, r3, ip, lsr #0x1f
    cmp r3, lr, lsr #0x17
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    bl func_ov002_021c1e44
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, pc}
.L_021f2d30:
        .word   0x868
.L_021f2d34:
        .word   data_ov002_022cf16c
