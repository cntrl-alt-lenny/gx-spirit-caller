; func_02078ec8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ee00
        .extern data_0219ee2c
        .extern func_02079100
        .extern func_02079244
        .extern func_02079558
        .extern func_02079920
        .extern func_02079a60
        .extern func_02079d38
        .extern func_02094500
        .global func_02078ec8
        .arm
func_02078ec8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x34
    mov sl, r3
    mov r3, #0x16
    mul r4, sl, r3
    ldr r3, _LIT0
    mov fp, r0
    ldr r3, [r3]
    mov r0, r4
    ldr r9, [sp, #0x58]
    str r1, [sp, #0x14]
    str r2, [sp, #0x18]
    blx r3
    str r0, [sp, #0x1c]
    cmp r0, #0x0
    addeq sp, sp, #0x34
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bxeq lr
    mov r2, r4
    mov r1, #0x0
    bl func_02094500
    ldr r0, [sp, #0x1c]
    mov r1, sl
    add r6, r0, sl, lsl #0x1
    add r0, r6, sl, lsl #0x1
    add r5, r0, sl, lsl #0x1
    add r4, r5, sl, lsl #0x1
    str r0, [sp, #0x20]
    add r0, r4, sl, lsl #0x1
    str r0, [sp, #0x24]
    add r7, r0, sl, lsl #0x1
    mov r0, r9
    bl func_02079d38
    mov r8, r0
    ldr r0, [sp, #0x1c]
    mov r2, #0x1
    mov r1, r8, lsl #0x1
    strh r2, [r0, r1]
    ldr r0, [sp, #0x20]
    ldr r1, [sp, #0x1c]
    str r0, [sp]
    mov r0, r6
    mov r2, r9
    mov r3, sl
    bl func_02079244
    ldr r1, [sp, #0x1c]
    mov r0, r5
    mov r2, r6
    mov r3, sl
    bl func_02079920
    mov r0, r6
    mov r1, r5
    mov r2, #0x1
    mov r3, sl
    bl func_02079a60
    str sl, [sp]
    mov r0, r6
    mov r1, r6
    mov r2, r9
    mov r3, #0x0
    str r7, [sp, #0x4]
    bl func_02079558
    ldr r1, [sp, #0x14]
    ldr r0, [sp, #0x20]
    ldr r2, [sp, #0x1c]
    mov r3, sl
    bl func_02079920
    ldr r1, [sp, #0x20]
    str sl, [sp]
    mov r0, #0x0
    mov r2, r9
    mov r3, r1
    str r7, [sp, #0x4]
    bl func_02079558
    str sl, [sp]
    ldr r1, [sp, #0x1c]
    mov r0, #0x0
    mov r2, r9
    mov r3, fp
    str r7, [sp, #0x4]
    bl func_02079558
    movs r0, r8, lsl #0x4
    mov r7, #0x0
    str r0, [sp, #0x28]
    beq .L_1ec
    mov r0, #0x1
    str r0, [sp, #0x2c]
    mov r0, #0x8000
    str r0, [sp, #0x30]
.L_164:
    str r8, [sp]
    str r9, [sp, #0x4]
    str r6, [sp, #0x8]
    str r5, [sp, #0xc]
    ldr r1, [sp, #0x24]
    ldr r2, [sp, #0x2c]
    mov r0, fp
    mov r3, sl
    str r4, [sp, #0x10]
    bl func_02079100
    ldr r0, [sp, #0x30]
    and r1, r7, #0xf
    mov r0, r0, lsr r1
    sub r1, r8, r7, asr #0x4
    sub r1, r1, #0x1
    mov r2, r1, lsl #0x1
    ldr r1, [sp, #0x18]
    ldrh r1, [r1, r2]
    ands r0, r0, r1
    beq .L_1dc
    str r8, [sp]
    str r9, [sp, #0x4]
    str r6, [sp, #0x8]
    str r5, [sp, #0xc]
    ldr r1, [sp, #0x24]
    ldr r2, [sp, #0x20]
    mov r0, fp
    mov r3, sl
    str r4, [sp, #0x10]
    bl func_02079100
.L_1dc:
    ldr r0, [sp, #0x28]
    add r7, r7, #0x1
    cmp r7, r0
    bcc .L_164
.L_1ec:
    str r8, [sp]
    str r9, [sp, #0x4]
    str r6, [sp, #0x8]
    str r5, [sp, #0xc]
    ldr r1, [sp, #0x24]
    mov r0, fp
    mov r3, sl
    mov r2, #0x0
    str r4, [sp, #0x10]
    bl func_02079100
    ldr r1, _LIT1
    ldr r0, [sp, #0x1c]
    ldr r1, [r1]
    blx r1
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
_LIT0: .word data_0219ee00
_LIT1: .word data_0219ee2c
