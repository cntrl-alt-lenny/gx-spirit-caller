; func_02076788 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ee00
        .extern data_0219ee2c
        .extern func_020779cc
        .extern func_02077a04
        .extern func_02078e20
        .extern func_02078e68
        .extern func_02078ec8
        .extern func_02079558
        .extern func_02079920
        .extern func_02079ad4
        .extern func_02079b8c
        .extern func_02079c48
        .extern func_02079cf4
        .global func_02076788
        .arm
func_02076788:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x1c
    movs sl, r2
    str r0, [sp, #0x8]
    mov fp, r1
    addeq sp, sp, #0x1c
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bxeq lr
    ldr r0, [sl]
    cmp r0, #0x0
    addeq sp, sp, #0x1c
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bxeq lr
    mov r0, r0, lsl #0x1
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    add r9, r0, #0x1
    mov r0, #0x14
    mul r0, r9, r0
    ldr r1, _LIT0
    ldr r1, [r1]
    blx r1
    movs r8, r0
    addeq sp, sp, #0x1c
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bxeq lr
    add r7, r8, r9, lsl #0x1
    add r6, r7, r9, lsl #0x1
    add r1, r6, r9, lsl #0x1
    str r1, [sp, #0xc]
    add r1, r1, r9, lsl #0x1
    add r5, r1, r9, lsl #0x1
    str r1, [sp, #0x10]
    ldr r2, [sl]
    add r4, r5, r9, lsl #0x1
    mov r1, fp
    mov r3, r9
    add fp, r4, r9, lsl #0x1
    bl func_02078e68
    ldr r1, [sl, #0x1c]
    ldr r2, [sl, #0x18]
    mov r0, r7
    mov r3, r9
    bl func_02078e68
    ldr r1, [sl, #0xc]
    ldr r2, [sl, #0x8]
    mov r0, r5
    mov r3, r9
    bl func_02078e68
    bl func_02077a04
    str r0, [sp, #0x14]
    ldr r0, [sp, #0xc]
    str r5, [sp]
    mov r1, r8
    mov r2, r7
    mov r3, r9
    bl func_02078ec8
    ldr r1, [sl, #0x24]
    ldr r2, [sl, #0x20]
    mov r0, r7
    mov r3, r9
    bl func_02078e68
    ldr r1, [sl, #0x14]
    ldr r2, [sl, #0x10]
    mov r0, r5
    mov r3, r9
    bl func_02078e68
    ldr r0, [sp, #0x10]
    mov r1, r8
    mov r2, r7
    mov r3, r9
    str r5, [sp]
    bl func_02078ec8
    ldr r0, [sp, #0x14]
    bl func_020779cc
    ldr r1, [sp, #0xc]
    ldr r2, [sp, #0x10]
    mov r0, r8
    mov r3, r9
    bl func_02079ad4
    ldr r1, [sl, #0x2c]
    ldr r2, [sl, #0x28]
    mov r0, r7
    mov r3, r9
    bl func_02078e68
    mov r0, r6
    mov r1, r8
    mov r2, r7
    mov r3, r9
    bl func_02079920
    ldr r1, [sl, #0x14]
    ldr r2, [sl, #0x10]
    mov r0, r7
    mov r3, r9
    bl func_02078e68
    mov r0, r8
    mov r1, r6
    mov r2, r7
    mov r3, r9
    bl func_02079920
    ldr r2, [sp, #0x10]
    mov r0, r6
    mov r1, r8
    mov r3, r9
    bl func_02079c48
    ldr r1, [sl, #0x4]
    ldr r2, [sl]
    mov r0, r7
    mov r3, r9
    bl func_02078e68
    mov r0, r6
    mov r1, r9
    bl func_02079cf4
    cmp r0, #0x0
    bge .L_20c
    mov r0, r6
    mov r1, r9
    bl func_02079b8c
    str r9, [sp]
    mov r1, r6
    mov r2, r7
    mov r3, r4
    mov r0, #0x0
    str fp, [sp, #0x4]
    bl func_02079558
    mov r0, r4
    mov r1, r7
    mov r2, r4
    mov r3, r9
    bl func_02079ad4
    b .L_228
.L_20c:
    str r9, [sp]
    mov r1, r6
    mov r2, r7
    mov r3, r4
    mov r0, #0x0
    str fp, [sp, #0x4]
    bl func_02079558
.L_228:
    ldr r0, [sp, #0x8]
    mov r1, r4
    mov r3, r9
    mov r2, #0x30
    bl func_02078e20
    ldr r1, _LIT1
    mov r0, r8
    ldr r1, [r1]
    blx r1
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
_LIT0: .word data_0219ee00
_LIT1: .word data_0219ee2c
