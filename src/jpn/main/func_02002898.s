; func_02002898 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02002898
        .arm
func_02002898:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x28
    ldr r4, [sp, #0x50]
    ldr ip, _LIT0
    mov r5, r1, lsl #0x1d
    mul r9, r4, ip
    mov r4, r5, lsr #0x1b
    str r4, [sp, #0x4]
    ldr r4, [sp, #0x54]
    cmp r3, #0x0
    str r4, [sp, #0x54]
    ldr r4, [sp, #0x58]
    str r4, [sp, #0x58]
    ldr r4, [sp, #0x5c]
    str r4, [sp, #0x5c]
    mov r4, #0x0
    str r4, [sp, #0x8]
    addle sp, sp, #0x28
    ldmleia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    sub r4, r3, #0x8
    mov r5, r4, lsl #0x2
    ldr r4, [sp, #0x8]
    ldr fp, _LIT1
    sub r4, r4, #0x1
    str r4, [sp, #0xc]
    rsb r4, r5, #0x20
    str r4, [sp, #0x10]
    ldr r4, [sp, #0x4]
    rsb r4, r4, #0x20
    str r4, [sp]
.L_730:
    mov r4, r0, lsl #0x1e
    mov r7, r4, lsr #0x1b
    bic r4, r0, #0x3
    ldr r5, [r4, #0x4]
    ldr r6, [r4]
    rsb r4, r7, #0x20
    mov r4, r5, lsl r4
    add r5, r0, #0x4
    orr r8, r4, r6, lsr r7
    mov r4, r5, lsl #0x1e
    bic r5, r5, #0x3
    mov r4, r4, lsr #0x1b
    ldr r6, [r5, #0x4]
    ldr r7, [r5]
    rsb r5, r4, #0x20
    mov r5, r6, lsl r5
    orr r6, r5, r7, lsr r4
    ldr r5, [sp, #0xc]
    ldr r4, [sp, #0x10]
    and r4, r6, r5, lsr r4
    str r4, [sp, #0x14]
    ldr r4, [sp, #0x54]
    mov r5, r2, asr #0x3
    mul r5, r4, r5
    ldr r4, [sp, #0x58]
    add r5, r5, r1, asr #0x3
    add r6, r4, r5, lsl #0x6
    mov r4, r2, lsl #0x1d
    mov r4, r4, lsr #0x1c
    str r4, [sp, #0x18]
    add r7, r6, r4, lsl #0x2
    ldr r4, [sp, #0x4]
    add r2, r2, #0x1
    mov r4, r8, lsl r4
    and sl, r4, #0xff00
    and r5, r4, #0xff
    orr lr, r5, sl, lsl #0x8
    ldr r5, _LIT2
    and sl, lr, r5
    and r5, lr, r5, lsr #0x4
    orr r5, r5, sl, lsl #0x4
    and sl, r4, #0xff0000
    and r4, r4, #-16777216
    mov r4, r4, lsr #0x8
    orr lr, r4, sl, lsr #0x10
    ldr r4, _LIT2
    orr r5, r9, r5
    and sl, lr, r4
    and r4, lr, r4, lsr #0x4
    orr r4, r4, sl, lsl #0x4
    ldr sl, _LIT3
    ldr lr, _LIT3
    and sl, r5, sl
    add sl, sl, lr
    orr sl, r5, sl
    and sl, sl, ip, lsr #0x1
    add sl, fp, sl, lsr #0x3
    eor lr, sl, ip, lsl #0x3
    ldr sl, [sp, #0x18]
    orr r4, r9, r4
    ldr sl, [r6, sl, lsl #0x2]
    str sl, [sp, #0x1c]
    mvn sl, lr
    str sl, [sp, #0x20]
    ldr sl, [sp, #0x1c]
    and lr, sl, lr
    ldr sl, [sp, #0x20]
    and r5, r5, sl
    orr sl, lr, r5
    ldr r5, [sp, #0x18]
    str sl, [r6, r5, lsl #0x2]
    ldr r5, _LIT3
    and r6, r4, r5
    add r5, r6, r5
    orr r5, r4, r5
    and r5, r5, ip, lsr #0x1
    add r5, fp, r5, lsr #0x3
    eor sl, r5, ip, lsl #0x3
    ldr r6, [r7, #0x4]
    mvn r5, sl
    and r4, r4, r5
    and r6, r6, sl
    orr r4, r6, r4
    str r4, [r7, #0x4]
    ldr r5, [sp, #0x14]
    ldr r4, [sp, #0x4]
    mov r5, r5, lsl r4
    ldr r4, [sp]
    orr r4, r5, r8, lsr r4
    ldr r6, [sp, #0x14]
    ldr r5, [sp]
    and r8, r4, #0xff00
    mov r5, r6, lsr r5
    and r6, r4, #0xff
    orr r8, r6, r8, lsl #0x8
    ldr r6, _LIT2
    ldr sl, _LIT2
    and r6, r8, r6
    and r8, r8, sl, lsr #0x4
    orr r6, r8, r6, lsl #0x4
    orr lr, r9, r6
    and r6, r4, #0xff0000
    and r4, r4, #-16777216
    mov r4, r4, lsr #0x8
    orr r6, r4, r6, lsr #0x10
    mov r4, sl
    mov r8, sl
    and r4, r6, r4
    and r6, r6, r8, lsr #0x4
    orr r4, r6, r4, lsl #0x4
    orr sl, r9, r4
    ldr r4, _LIT3
    and r6, lr, r4
    add r4, r6, r4
    orr r4, lr, r4
    and r4, r4, ip, lsr #0x1
    add r4, fp, r4, lsr #0x3
    eor r8, r4, ip, lsl #0x3
    mvn r4, r8
    ldr r6, [r7, #0x40]
    str r4, [sp, #0x24]
    and r4, r6, r8
    ldr r6, [sp, #0x24]
    and r6, lr, r6
    orr r4, r4, r6
    str r4, [r7, #0x40]
    ldr r4, _LIT3
    and r6, sl, r4
    add r4, r6, r4
    orr r4, sl, r4
    and r4, r4, ip, lsr #0x1
    add r4, fp, r4, lsr #0x3
    eor r8, r4, ip, lsl #0x3
    ldr r6, [r7, #0x44]
    mvn r4, r8
    and r6, r6, r8
    and r4, sl, r4
    orr r4, r6, r4
    str r4, [r7, #0x44]
    and r6, r5, #0xff00
    and r4, r5, #0xff
    orr r8, r4, r6, lsl #0x8
    ldr r4, _LIT2
    and r6, r8, r4
    and r4, r8, r4, lsr #0x4
    orr r4, r4, r6, lsl #0x4
    orr r6, r9, r4
    and r4, r5, #-16777216
    and r8, r5, #0xff0000
    mov r4, r4, lsr #0x8
    orr r8, r4, r8, lsr #0x10
    ldr r4, _LIT2
    and r5, r8, r4
    and r4, r8, r4, lsr #0x4
    orr r4, r4, r5, lsl #0x4
    ldr r5, _LIT3
    orr r4, r9, r4
    and r8, r6, r5
    add r5, r8, r5
    orr r5, r6, r5
    and r5, r5, ip, lsr #0x1
    add r5, fp, r5, lsr #0x3
    eor sl, r5, ip, lsl #0x3
    ldr r8, [r7, #0x80]
    mvn r5, sl
    and r8, r8, sl
    and r5, r6, r5
    orr r5, r8, r5
    str r5, [r7, #0x80]
    ldr r5, _LIT3
    and r6, r4, r5
    add r5, r6, r5
    orr r5, r4, r5
    and r5, r5, ip, lsr #0x1
    add r5, fp, r5, lsr #0x3
    eor r8, r5, ip, lsl #0x3
    ldr r6, [r7, #0x84]
    mvn r5, r8
    and r6, r6, r8
    and r4, r4, r5
    orr r4, r6, r4
    str r4, [r7, #0x84]
    ldr r4, [sp, #0x5c]
    add r0, r0, r4
    ldr r4, [sp, #0x8]
    add r4, r4, #0x1
    str r4, [sp, #0x8]
    cmp r4, r3
    blt .L_730
    add sp, sp, #0x28
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x10101010
_LIT1: .word 0x7f7f7f7f
_LIT2: .word 0x00f000f0
_LIT3: .word 0x07070707
