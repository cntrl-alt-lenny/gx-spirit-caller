; func_ov002_022174b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021d6808
        .extern func_ov002_021e276c
        .extern func_ov002_021e2d94
        .global func_ov002_022174b8
        .arm
func_ov002_022174b8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    mov sl, r0
    ldrh r0, [sl, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1f
    addne sp, sp, #0x8
    mov r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    str r0, [sp, #0x4]
.L_28:
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    ldrh r0, [sl, #0x2]
    moveq r0, r0, lsl #0x1f
    moveq r9, r0, lsr #0x1f
    beq .L_4c
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r9, r0, #0x1
.L_4c:
    ldr r2, _LIT0
    ldr r0, _LIT1
    and r1, r9, #0x1
    mla r8, r1, r0, r2
    mov r6, #0x0
    mov r5, #0x1
    add r7, r8, #0x30
    mov fp, r6
    mov r4, r5
.L_70:
    ldr r0, [r7]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_d0
    ldrh r0, [r8, #0x36]
    cmp r0, #0x0
    beq .L_9c
    ldrh r0, [r8, #0x38]
    cmp r0, #0x0
    moveq r3, r5
    beq .L_a0
.L_9c:
    mov r3, fp
.L_a0:
    mov r0, sl
    mov r1, r9
    str r4, [sp]
    mov r2, r6
    bl func_ov002_021d6808
    cmp r0, #0x0
    beq .L_d0
    mov r0, r9
    mov r1, r6
    mov r2, #0x15
    mov r3, #0x1
    bl func_ov002_021e2d94
.L_d0:
    add r6, r6, #0x1
    cmp r6, #0x5
    add r7, r7, #0x14
    add r8, r8, #0x14
    blt .L_70
    ldr r0, [sp, #0x4]
    add r0, r0, #0x1
    str r0, [sp, #0x4]
    cmp r0, #0x2
    blt .L_28
    ldrh r0, [sl, #0x2]
    ldrh r1, [sl]
    mov r2, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, #0x0
    bl func_ov002_021e276c
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
