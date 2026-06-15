; func_02002ffc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020b4680
        .extern data_02102c7c
        .global func_02002ffc
        .arm
func_02002ffc:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x2c
    ldr r5, _LIT0
    ldr r4, [sp, #0x50]
    ldr r6, [r5, #0x10]
    str r4, [sp, #0x50]
    ldr r4, [sp, #0x54]
    cmp r6, #0x0
    ldrne sl, [r5, #0x4]
    str r4, [sp, #0x54]
    ldr r4, [sp, #0x58]
    ldreq sl, [r5, #0x8]
    and r5, r1, #0x7
    str r4, [sp, #0x58]
    add r4, r3, r5
    cmp r4, #0x10
    mov r8, r5, lsl #0x2
    mov r4, #0x0
    blt .L_1324
    cmp r3, #0x0
    str r4, [sp, #0x8]
    addle sp, sp, #0x2c
    ldmleia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r4, [sp, #0x58]
    ldr fp, _LIT1
    rsb r4, r4, #0x2
    mov r4, r4, lsl #0x3
    str r4, [sp, #0xc]
    rsb r9, r8, #0x20
.L_1158:
    bic r5, r0, #0x3
    mov r4, r0, lsl #0x1e
    mov r4, r4, lsr #0x1b
    ldr r6, [r5, #0x4]
    ldr r7, [r5]
    rsb r5, r4, #0x20
    mov r5, r6, lsl r5
    orr r6, r5, r7, lsr r4
    ldr r5, _LIT2
    ldr r4, [sp, #0xc]
    and r4, r6, r5, asr r4
    mov r4, r4, lsl #0x10
    mov r4, r4, lsr #0x10
    and r6, r4, #0xff
    mov r4, r4, asr #0x8
    and r5, r4, #0xff
    and r4, r6, #0xf0
    mov r4, r4, asr #0x4
    and r4, r4, #0xff
    mov r7, r4, lsl #0x1
    ldr r4, _LIT3
    and r6, r6, #0xf
    ldrh r4, [r4, r7]
    mov r7, r6, lsl #0x1
    ldr r6, _LIT3
    ldrh r7, [r6, r7]
    and r6, r5, #0xf0
    mov r6, r6, asr #0x4
    orr r4, r4, r7, lsl #0x10
    mul r7, sl, r4
    and r4, r6, #0xff
    mov r6, r4, lsl #0x1
    ldr r4, _LIT3
    and r5, r5, #0xf
    ldrh r4, [r4, r6]
    mov r6, r5, lsl #0x1
    ldr r5, _LIT3
    ldrh r6, [r5, r6]
    mov r5, r7, lsl #0x4
    orr r5, r5, r7, lsl #0x8
    orr r4, r4, r6, lsl #0x10
    mul r4, sl, r4
    orr r6, r7, r5
    mov r5, r4, lsl #0x4
    orr r5, r5, r4, lsl #0x8
    orr r4, r4, r5
    orr r4, r4, r7, lsr #0x1c
    orr r7, r4, r7, lsr #0x18
    ldr r4, [sp, #0x50]
    mov r5, r2, asr #0x3
    mul r5, r4, r5
    ldr r4, [sp, #0x54]
    add r5, r5, r1, asr #0x3
    add r4, r4, r5, lsl #0x5
    str r4, [sp, #0x10]
    and r4, r2, #0x7
    ldr r5, [sp, #0x10]
    str r4, [sp, #0x14]
    add r5, r5, r4, lsl #0x2
    and r4, fp, r6, lsl r8
    add r4, r4, fp
    orr ip, r4, r6, lsl r8
    ldr r4, _LIT4
    add r2, r2, #0x1
    and r4, ip, r4
    add ip, fp, r4, lsr #0x3
    ldr r4, _LIT4
    eor lr, ip, r4
    ldr ip, [sp, #0x10]
    ldr r4, [sp, #0x14]
    ldr ip, [ip, r4, lsl #0x2]
    mov r4, r7, lsl r8
    str r4, [sp, #0x18]
    and r4, ip, lr
    orr r4, r4, r6, lsl r8
    ldr lr, [sp, #0x10]
    ldr ip, [sp, #0x14]
    str r4, [lr, ip, lsl #0x2]
    ldr r4, [sp, #0x18]
    orr ip, r4, r6, lsr r9
    and r4, ip, fp
    add r4, r4, fp
    orr r6, ip, r4
    ldr r4, _LIT4
    and r4, r6, r4
    add r6, fp, r4, lsr #0x3
    ldr r4, _LIT4
    eor lr, r6, r4
    and r4, fp, r7, lsr r9
    ldr r6, [r5, #0x20]
    str r4, [sp, #0x1c]
    and r4, r6, lr
    orr r4, ip, r4
    str r4, [r5, #0x20]
    ldr r4, [sp, #0x1c]
    ldr ip, [r5, #0x40]
    add r4, r4, fp
    orr r6, r4, r7, lsr r9
    ldr r4, _LIT4
    and r4, r6, r4
    add r6, fp, r4, lsr #0x3
    ldr r4, _LIT4
    eor r6, r6, r4
    ldr r4, [sp, #0x58]
    add r0, r0, r4
    and r4, ip, r6
    orr r4, r4, r7, lsr r9
    str r4, [r5, #0x40]
    ldr r4, [sp, #0x8]
    add r4, r4, #0x1
    str r4, [sp, #0x8]
    cmp r4, r3
    blt .L_1158
    add sp, sp, #0x2c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1324:
    cmp r3, #0x0
    str r4, [sp]
    addle sp, sp, #0x2c
    ldmleia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r4, [sp, #0x58]
    ldr lr, _LIT1
    rsb r4, r4, #0x2
    mov r4, r4, lsl #0x3
    str r4, [sp, #0x20]
    rsb r4, r8, #0x20
    str r4, [sp, #0x4]
.L_1350:
    mov r4, r0, lsl #0x1e
    mov r7, r4, lsr #0x1b
    bic r4, r0, #0x3
    ldr r5, [r4, #0x4]
    ldr r6, [r4]
    rsb r4, r7, #0x20
    mov r4, r5, lsl r4
    orr r6, r4, r6, lsr r7
    ldr r5, _LIT2
    ldr r4, [sp, #0x20]
    and r4, r6, r5, asr r4
    mov r4, r4, lsl #0x10
    mov r4, r4, lsr #0x10
    and r6, r4, #0xff
    mov r4, r4, asr #0x8
    and r5, r4, #0xff
    and r4, r6, #0xf0
    mov r4, r4, asr #0x4
    and r4, r4, #0xff
    mov r7, r4, lsl #0x1
    ldr r4, _LIT3
    and r6, r6, #0xf
    ldrh r4, [r4, r7]
    mov r7, r6, lsl #0x1
    ldr r6, _LIT3
    ldrh r9, [r6, r7]
    and r6, r5, #0xf0
    mov r7, r6, asr #0x4
    orr r4, r4, r9, lsl #0x10
    mul r6, sl, r4
    and r4, r7, #0xff
    mov r7, r4, lsl #0x1
    ldr r4, _LIT3
    and r5, r5, #0xf
    ldrh r4, [r4, r7]
    mov r7, r5, lsl #0x1
    ldr r5, _LIT3
    ldrh r7, [r5, r7]
    mov r5, r6, lsl #0x4
    orr r5, r5, r6, lsl #0x8
    orr r4, r4, r7, lsl #0x10
    mul r9, sl, r4
    mov r4, r9, lsl #0x4
    orr r4, r4, r9, lsl #0x8
    orr r4, r9, r4
    orr r4, r4, r6, lsr #0x1c
    orr r7, r6, r5
    orr r4, r4, r6, lsr #0x18
    mov r5, r4, lsl r8
    ldr r4, [sp, #0x4]
    and r9, lr, r7, lsl r8
    orr fp, r5, r7, lsr r4
    add r9, r9, lr
    orr ip, r9, r7, lsl r8
    ldr r9, _LIT4
    ldr r4, [sp, #0x50]
    mov r5, r2, asr #0x3
    mul r5, r4, r5
    and r9, ip, r9
    add ip, lr, r9, lsr #0x3
    ldr r9, _LIT4
    ldr r4, [sp, #0x54]
    add r5, r5, r1, asr #0x3
    eor r9, ip, r9
    add r5, r4, r5, lsl #0x5
    and r4, r2, #0x7
    str r9, [sp, #0x28]
    and r9, fp, lr
    str r9, [sp, #0x24]
    ldr ip, [r5, r4, lsl #0x2]
    ldr r9, [sp, #0x28]
    add r6, r5, r4, lsl #0x2
    and r9, ip, r9
    orr r7, r9, r7, lsl r8
    str r7, [r5, r4, lsl #0x2]
    ldr r4, [sp, #0x24]
    ldr r7, [r6, #0x20]
    add r4, r4, lr
    orr r5, fp, r4
    ldr r4, _LIT4
    add r2, r2, #0x1
    and r4, r5, r4
    add r5, lr, r4, lsr #0x3
    ldr r4, _LIT4
    eor r5, r5, r4
    ldr r4, [sp, #0x58]
    add r0, r0, r4
    and r4, r7, r5
    orr r4, fp, r4
    str r4, [r6, #0x20]
    ldr r4, [sp]
    add r4, r4, #0x1
    str r4, [sp]
    cmp r4, r3
    blt .L_1350
    add sp, sp, #0x2c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_02102c7c
_LIT1: .word 0x77777777
_LIT2: .word 0x0000ffff
_LIT3: .word data_020b4680
_LIT4: .word 0x88888888
