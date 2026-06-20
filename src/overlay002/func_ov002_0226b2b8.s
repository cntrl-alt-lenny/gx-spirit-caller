; func_ov002_0226b2b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern data_ov002_022d0e6c
        .extern func_0202b878
        .extern func_0202e234
        .extern func_ov002_021b3fd8
        .extern func_ov002_021ca5bc
        .global func_ov002_0226b2b8
        .arm
func_ov002_0226b2b8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr r3, _LIT0
    mov sl, r0
    ldr r0, [r3, #0xd94]
    mov r9, r2
    cmp sl, r0
    cmpeq r1, #0xb
    bne .L_11c
    ldr r0, _LIT1
    ldr r1, _LIT2
    and r2, sl, #0x1
    mla r1, r2, r0, r1
    ldr r0, _LIT3
    add r4, r1, #0x120
    ldrh r1, [r0, #0xa2]
    ldr r0, [r4, r9, lsl #0x2]
    mov r0, r0, lsl #0x13
    tst r1, #0x1
    and fp, r1, #0x4
    and r5, r1, #0x8
    and r6, r1, #0x10
    and r7, r1, #0x20
    mov r8, r0, lsr #0x13
    beq .L_74
    mov r0, r8
    bl func_0202e234
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_74:
    cmp r5, #0x0
    beq .L_90
    mov r0, r8
    bl func_0202b878
    cmp r0, #0x16
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_90:
    cmp fp, #0x0
    beq .L_ac
    mov r0, r8
    bl func_0202b878
    cmp r0, #0x17
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_ac:
    ldr r1, [r4, r9, lsl #0x2]
    ldr r2, _LIT4
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r3, r1, lsl #0x12
    mov r1, r0, lsl #0x1
    add r3, r1, r3, lsr #0x1f
    mov r0, sl
    mov r1, #0xb
    bl func_ov002_021b3fd8
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    cmp r6, #0x0
    cmpne r7, #0x0
    beq .L_114
    ldr r1, [r4, r9, lsl #0x2]
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    bl func_ov002_021ca5bc
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_114:
    mov r0, #0x800
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_11c:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf16c
_LIT3: .word data_ov002_022d0e6c
_LIT4: .word 0x000012a1
