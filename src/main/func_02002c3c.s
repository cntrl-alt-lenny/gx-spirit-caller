; func_02002c3c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020b4680
        .extern data_02102c7c
        .global func_02002c3c
        .arm
func_02002c3c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x2c
    ldr r4, [sp, #0x50]
    ldr r5, _LIT0
    str r4, [sp, #0x50]
    ldr r4, [sp, #0x54]
    ldr r6, [r5, #0x10]
    str r4, [sp, #0x54]
    ldr r4, [sp, #0x58]
    cmp r6, #0x0
    str r4, [sp, #0x58]
    ldrne r4, [r5, #0x4]
    strne r4, [sp, #0x28]
    ldreq r4, [r5, #0x8]
    and r5, r1, #0x7
    streq r4, [sp, #0x28]
    add r4, r3, r5
    cmp r4, #0x10
    mov r9, r5, lsl #0x2
    mov r4, #0x0
    ble .L_f40
    cmp r3, #0x0
    str r4, [sp, #0x8]
    addle sp, sp, #0x2c
    ldmleia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r4, [sp, #0x58]
    ldr fp, _LIT1
    rsb r4, r4, #0x2
    mov r4, r4, lsl #0x3
    str r4, [sp, #0xc]
    ldr r4, _LIT2
    rsb sl, r9, #0x20
.L_da4:
    bic r6, r0, #0x3
    mov r5, r0, lsl #0x1e
    mov r5, r5, lsr #0x1b
    ldr r7, [r6, #0x4]
    ldr r8, [r6]
    rsb r6, r5, #0x20
    mov r6, r7, lsl r6
    orr r7, r6, r8, lsr r5
    ldr r6, _LIT3
    ldr r5, [sp, #0xc]
    ldr ip, [sp, #0x50]
    and r5, r7, r6, asr r5
    mov r5, r5, lsl #0x10
    mov r5, r5, lsr #0x10
    and r7, r5, #0xff
    and r6, r7, #0xf0
    mov r6, r6, asr #0x4
    and r6, r6, #0xff
    mov r8, r6, lsl #0x1
    ldr r6, _LIT4
    mov r5, r5, asr #0x8
    and r7, r7, #0xf
    ldrh r6, [r6, r8]
    mov r8, r7, lsl #0x1
    ldr r7, _LIT4
    and r5, r5, #0xff
    ldrh r8, [r7, r8]
    and r7, r5, #0xf0
    mov r7, r7, asr #0x4
    orr r8, r6, r8, lsl #0x10
    ldr r6, [sp, #0x28]
    and r5, r5, #0xf
    mul r8, r6, r8
    and r6, r7, #0xff
    mov r7, r6, lsl #0x1
    ldr r6, _LIT4
    ldrh r7, [r6, r7]
    mov r6, r5, lsl #0x1
    ldr r5, _LIT4
    ldrh r6, [r5, r6]
    mov r5, r2, asr #0x3
    mul r5, ip, r5
    orr r7, r7, r6, lsl #0x10
    ldr r6, [sp, #0x28]
    mul r7, r6, r7
    add r6, r5, r1, asr #0x3
    ldr r5, [sp, #0x54]
    add r5, r5, r6, lsl #0x5
    str r5, [sp, #0x10]
    and r5, r2, #0x7
    ldr r6, [sp, #0x10]
    str r5, [sp, #0x14]
    add r6, r6, r5, lsl #0x2
    and r5, r4, r8, lsl r9
    add r5, r5, r4
    orr r5, r5, r8, lsl r9
    and r5, r5, fp
    add r5, r4, r5, lsr #0x3
    eor lr, r5, fp
    ldr ip, [sp, #0x10]
    ldr r5, [sp, #0x14]
    add r2, r2, #0x1
    ldr ip, [ip, r5, lsl #0x2]
    mov r5, r7, lsl r9
    str r5, [sp, #0x18]
    and r5, ip, lr
    orr r5, r5, r8, lsl r9
    ldr lr, [sp, #0x10]
    ldr ip, [sp, #0x14]
    str r5, [lr, ip, lsl #0x2]
    ldr r5, [sp, #0x18]
    orr ip, r5, r8, lsr sl
    and r5, ip, r4
    add r5, r5, r4
    orr r5, ip, r5
    and r5, r5, fp
    add r5, r4, r5, lsr #0x3
    eor lr, r5, fp
    and r5, r4, r7, lsr sl
    ldr r8, [r6, #0x20]
    str r5, [sp, #0x1c]
    and r5, r8, lr
    orr r5, ip, r5
    str r5, [r6, #0x20]
    ldr r5, [sp, #0x1c]
    add r5, r5, r4
    orr r5, r5, r7, lsr sl
    and r5, r5, fp
    add r5, r4, r5, lsr #0x3
    eor r8, r5, fp
    ldr r5, [sp, #0x58]
    ldr ip, [r6, #0x40]
    add r0, r0, r5
    and r5, ip, r8
    orr r5, r5, r7, lsr sl
    str r5, [r6, #0x40]
    ldr r5, [sp, #0x8]
    add r5, r5, #0x1
    str r5, [sp, #0x8]
    cmp r5, r3
    blt .L_da4
    add sp, sp, #0x2c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_f40:
    cmp r3, #0x0
    str r4, [sp]
    addle sp, sp, #0x2c
    ldmleia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r4, [sp, #0x58]
    ldr fp, _LIT4
    rsb r4, r4, #0x2
    mov r4, r4, lsl #0x3
    str r4, [sp, #0x20]
    rsb r4, r9, #0x20
    str r4, [sp, #0x4]
.L_f6c:
    mov r4, r0, lsl #0x1e
    mov r7, r4, lsr #0x1b
    bic r4, r0, #0x3
    ldr r5, [r4, #0x4]
    ldr r6, [r4]
    rsb r4, r7, #0x20
    mov r4, r5, lsl r4
    orr r6, r4, r6, lsr r7
    ldr r5, _LIT3
    ldr r4, [sp, #0x20]
    and r4, r6, r5, asr r4
    mov r4, r4, lsl #0x10
    mov r4, r4, lsr #0x10
    and r5, r4, #0xff
    mov r4, r4, asr #0x8
    and sl, r4, #0xff
    and r4, r5, #0xf0
    mov r4, r4, asr #0x4
    and r4, r4, #0xff
    and r5, r5, #0xf
    mov r4, r4, lsl #0x1
    mov r5, r5, lsl #0x1
    ldrh r7, [fp, r5]
    ldrh r4, [fp, r4]
    ldr r5, [sp, #0x50]
    mov r6, r2, asr #0x3
    mul r6, r5, r6
    orr r5, r4, r7, lsl #0x10
    ldr r4, [sp, #0x28]
    mul ip, r4, r5
    add r5, r6, r1, asr #0x3
    ldr r4, [sp, #0x54]
    and r6, r2, #0x7
    add r7, r4, r5, lsl #0x5
    ldr r4, _LIT2
    add r8, r7, r6, lsl #0x2
    and r5, r4, ip, lsl r9
    add r4, r5, r4
    orr r5, r4, ip, lsl r9
    ldr r4, _LIT1
    add r2, r2, #0x1
    and r5, r5, r4
    ldr r4, _LIT2
    add r5, r4, r5, lsr #0x3
    ldr r4, _LIT1
    eor lr, r5, r4
    and r4, sl, #0xf0
    ldr r5, [r7, r6, lsl #0x2]
    str r4, [sp, #0x24]
    and r4, r5, lr
    orr r4, r4, ip, lsl r9
    str r4, [r7, r6, lsl #0x2]
    ldr r4, [sp, #0x24]
    ldr r6, [sp, #0x58]
    mov r4, r4, asr #0x4
    and r4, r4, #0xff
    mov r4, r4, lsl #0x1
    ldrh r5, [fp, r4]
    and r4, sl, #0xf
    mov r4, r4, lsl #0x1
    ldrh r7, [fp, r4]
    add r0, r0, r6
    ldr r4, [r8, #0x20]
    orr r6, r5, r7, lsl #0x10
    ldr r5, [sp, #0x28]
    mul r6, r5, r6
    mov r6, r6, lsl r9
    ldr r5, [sp, #0x4]
    orr r5, r6, ip, lsr r5
    ldr r6, _LIT2
    and r7, r5, r6
    add r6, r7, r6
    orr r7, r5, r6
    ldr r6, _LIT1
    and r7, r7, r6
    ldr r6, _LIT2
    add r7, r6, r7, lsr #0x3
    ldr r6, _LIT1
    eor r6, r7, r6
    and r4, r4, r6
    orr r4, r5, r4
    str r4, [r8, #0x20]
    ldr r4, [sp]
    add r4, r4, #0x1
    str r4, [sp]
    cmp r4, r3
    blt .L_f6c
    add sp, sp, #0x2c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_02102c7c
_LIT1: .word 0x88888888
_LIT2: .word 0x77777777
_LIT3: .word 0x0000ffff
_LIT4: .word data_020b4680
