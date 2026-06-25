; func_020021e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020021e0
        .arm
func_020021e0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x30
    and r5, r1, #0x7
    add r4, r3, r5
    cmp r4, #0x10
    ldr r4, [sp, #0x58]
    mov r9, r5, lsl #0x2
    str r4, [sp, #0x58]
    ldr r4, [sp, #0x5c]
    str r4, [sp, #0x5c]
    ldr r4, [sp, #0x60]
    str r4, [sp, #0x60]
    mov r4, #0x0
    ble .L_1c8
    cmp r3, #0x0
    str r4, [sp, #0x8]
    addle sp, sp, #0x30
    ldmleia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    sub r4, r3, #0x8
    mov r5, r4, lsl #0x2
    ldr r4, [sp, #0x8]
    ldr lr, _LIT0
    sub r4, r4, #0x1
    str r4, [sp, #0xc]
    rsb r4, r5, #0x20
    str r4, [sp, #0x10]
    ldr r4, _LIT1
    rsb sl, r9, #0x20
.L_70:
    bic r6, r0, #0x3
    mov r5, r0, lsl #0x1e
    mov r5, r5, lsr #0x1b
    ldr r7, [r6, #0x4]
    ldr r8, [r6]
    rsb r6, r5, #0x20
    mov r6, r7, lsl r6
    orr r6, r6, r8, lsr r5
    and r5, r6, r4
    add r5, r5, lr
    orr r5, r6, r5
    and r5, r5, lr, lsl #0x1
    add r7, r0, #0x4
    mov r8, r5, lsr #0x3
    mov r5, r7, lsl #0x1e
    mov r6, r5, lsr #0x1b
    bic r7, r7, #0x3
    ldmia r7, {r5, fp}
    rsb r7, r6, #0x20
    mov r7, fp, lsl r7
    orr r6, r7, r5, lsr r6
    and r5, r6, r4
    add r5, r5, lr
    orr r5, r6, r5
    and r5, r5, lr, lsl #0x1
    mov r7, r5, lsr #0x3
    ldr r6, [sp, #0xc]
    ldr r5, [sp, #0x10]
    and r7, r7, r6, lsr r5
    ldr r5, [sp, #0x58]
    mov r6, r2, asr #0x3
    mul r6, r5, r6
    ldr r5, [sp, #0x5c]
    add r6, r6, r1, asr #0x3
    add fp, r5, r6, lsl #0x5
    and r5, r2, #0x7
    str r5, [sp, #0x14]
    add r6, fp, r5, lsl #0x2
    and r5, r4, r8, lsl r9
    add r5, r5, r4
    orr r5, r5, r8, lsl r9
    and r5, r5, lr, lsl #0x1
    add r5, r4, r5, lsr #0x3
    eor r5, r5, lr, lsl #0x1
    str r5, [sp, #0x28]
    ldr r5, [sp, #0x14]
    add r2, r2, #0x1
    ldr ip, [fp, r5, lsl #0x2]
    mov r5, r7, lsl r9
    str r5, [sp, #0x18]
    ldr r5, [sp, #0x28]
    and r5, ip, r5
    orr r5, r5, r8, lsl r9
    ldr ip, [sp, #0x14]
    str r5, [fp, ip, lsl #0x2]
    ldr r5, [sp, #0x18]
    and ip, r4, r7, lsr sl
    orr fp, r5, r8, lsr sl
    and r5, fp, r4
    add r5, r5, r4
    orr r5, fp, r5
    and r5, r5, lr, lsl #0x1
    add r5, r4, r5, lsr #0x3
    ldr r8, [r6, #0x20]
    eor r5, r5, lr, lsl #0x1
    and r5, r8, r5
    orr r5, fp, r5
    str r5, [r6, #0x20]
    add r5, ip, r4
    orr r5, r5, r7, lsr sl
    and r5, r5, lr, lsl #0x1
    add r5, r4, r5, lsr #0x3
    ldr r8, [r6, #0x40]
    eor r5, r5, lr, lsl #0x1
    and r5, r8, r5
    orr r5, r5, r7, lsr sl
    str r5, [r6, #0x40]
    ldr r5, [sp, #0x60]
    add r0, r0, r5
    ldr r5, [sp, #0x8]
    add r5, r5, #0x1
    str r5, [sp, #0x8]
    cmp r5, r3
    blt .L_70
    add sp, sp, #0x30
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1c8:
    cmp r3, #0x0
    str r4, [sp]
    addle sp, sp, #0x30
    ldmleia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    sub r4, r3, #0x8
    mov r5, r4, lsl #0x2
    ldr r4, [sp]
    sub r4, r4, #0x1
    str r4, [sp, #0x1c]
    rsb r4, r5, #0x20
    str r4, [sp, #0x20]
    rsb r4, r9, #0x20
    str r4, [sp, #0x4]
    ldr r5, _LIT1
    ldr r4, _LIT0
.L_204:
    mov r6, r0, lsl #0x1e
    mov sl, r6, lsr #0x1b
    bic r6, r0, #0x3
    ldr r7, [r6, #0x4]
    ldr r8, [r6]
    rsb r6, sl, #0x20
    mov r6, r7, lsl r6
    orr r7, r6, r8, lsr sl
    and r6, r7, r5
    add r6, r6, r4
    orr r6, r7, r6
    and r6, r6, r4, lsl #0x1
    mov fp, r6, lsr #0x3
    add r7, r0, #0x4
    mov r6, r7, lsl #0x1e
    bic r7, r7, #0x3
    mov r6, r6, lsr #0x1b
    ldr r8, [r7, #0x4]
    ldr sl, [r7]
    rsb r7, r6, #0x20
    mov r7, r8, lsl r7
    orr r7, r7, sl, lsr r6
    and r6, r7, r5
    add r6, r6, r4
    orr r6, r7, r6
    and r6, r6, r4, lsl #0x1
    mov r8, r6, lsr #0x3
    and ip, r5, fp, lsl r9
    add ip, ip, r5
    orr ip, ip, fp, lsl r9
    and ip, ip, r4, lsl #0x1
    add ip, r5, ip, lsr #0x3
    eor ip, ip, r4, lsl #0x1
    ldr r7, [sp, #0x1c]
    ldr r6, [sp, #0x20]
    str ip, [sp, #0x2c]
    and r6, r8, r7, lsr r6
    mov r7, r6, lsl r9
    ldr r6, [sp, #0x4]
    mov r8, r2, asr #0x3
    orr r6, r7, fp, lsr r6
    ldr r7, [sp, #0x58]
    and ip, r6, r5
    mul r8, r7, r8
    str ip, [sp, #0x24]
    ldr r7, [sp, #0x5c]
    add r8, r8, r1, asr #0x3
    add r8, r7, r8, lsl #0x5
    and r7, r2, #0x7
    ldr lr, [r8, r7, lsl #0x2]
    ldr ip, [sp, #0x2c]
    add sl, r8, r7, lsl #0x2
    and ip, lr, ip
    orr fp, ip, fp, lsl r9
    str fp, [r8, r7, lsl #0x2]
    ldr r7, [sp, #0x24]
    ldr fp, [sl, #0x20]
    add r7, r7, r5
    orr r7, r6, r7
    and r7, r7, r4, lsl #0x1
    add r7, r5, r7, lsr #0x3
    eor r8, r7, r4, lsl #0x1
    ldr r7, [sp, #0x60]
    add r2, r2, #0x1
    add r0, r0, r7
    and r7, fp, r8
    orr r6, r6, r7
    str r6, [sl, #0x20]
    ldr r6, [sp]
    add r6, r6, #0x1
    str r6, [sp]
    cmp r6, r3
    blt .L_204
    add sp, sp, #0x30
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x44444444
_LIT1: .word 0x77777777
