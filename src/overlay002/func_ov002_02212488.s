; func_ov002_02212488 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern func_ov002_021ae400
        .extern func_ov002_021af9d0
        .extern func_ov002_021afb74
        .extern func_ov002_021bc618
        .extern func_ov002_021ca2b8
        .extern func_ov002_0223f6c4
        .extern func_ov002_0225368c
        .extern func_ov002_0227ac64
        .extern func_ov002_0227adb8
        .global func_ov002_02212488
        .arm
func_ov002_02212488:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    mov r4, r0
    ldr r1, [r1, #0x5a8]
    cmp r1, #0x7e
    beq .L_e8
    cmp r1, #0x7f
    beq .L_bc
    cmp r1, #0x80
    bne .L_14c
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca2b8
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, pc}
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc618
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, pc}
    mov r0, r4
    bl func_ov002_0223f6c4
    ldrh r3, [r4, #0x2]
    mov r2, r0
    ldrh r1, [r4]
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0225368c
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, pc}
    ldrh r0, [r4, #0x2]
    mov r1, #0x1a
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    add sp, sp, #0x4
    mov r0, #0x7f
    ldmia sp!, {r3, r4, pc}
.L_bc:
    bl func_ov002_0223f6c4
    ldrh r1, [r4, #0x2]
    mov r3, r0
    ldrh r2, [r4]
    mov r0, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r1, #0x6
    bl func_ov002_021af9d0
    add sp, sp, #0x4
    mov r0, #0x7e
    ldmia sp!, {r3, r4, pc}
.L_e8:
    ldrh r1, [r4]
    ldr r0, _LIT1
    cmp r1, r0
    bne .L_120
    bl func_ov002_021afb74
    mov r3, #0x0
    str r3, [sp]
    ldrh r4, [r4, #0x2]
    mov r1, r0
    mov r2, #0x1
    mov r0, r4, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0227ac64
    b .L_140
.L_120:
    bl func_ov002_021afb74
    ldrh r3, [r4, #0x2]
    mov r1, r0
    mov r2, #0x1
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, #0x0
    bl func_ov002_0227adb8
.L_140:
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, pc}
.L_14c:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x0000114a
