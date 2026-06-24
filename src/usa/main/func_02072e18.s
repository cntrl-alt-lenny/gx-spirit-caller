; func_02072e18 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ee3c
        .extern func_02073014
        .extern func_02073ec4
        .extern func_02073ee0
        .global func_02072e18
        .arm
func_02072e18:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0xc
    ldr r7, _LIT0
    mov r5, r2
    ldr r2, [r7]
    mov r6, r1
    mov r1, r2, lsr #0x10
    mov r1, r1, lsl #0x10
    mov r2, r1, lsr #0x10
    ldr r3, [r5, #0x4c]
    mov r1, r2, asr #0x8
    add r4, r3, #0x22
    orr r1, r1, r2, lsl #0x8
    strh r1, [r4, #-12]
    ldr r1, [r7]
    add r2, r6, #0x8
    mov r1, r1, lsl #0x10
    mov r7, r1, lsr #0x10
    mov r1, r7, asr #0x8
    orr r1, r1, r7, lsl #0x8
    strh r1, [r4, #-10]
    ldr r1, [r5, #0x1c]
    mov r2, r2, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, lsl #0x10
    mov r7, r1, lsr #0x10
    mov r1, r7, asr #0x8
    orr r1, r1, r7, lsl #0x8
    strh r1, [r4, #-8]
    ldr r1, [r5, #0x1c]
    mov r2, r2, lsr #0x10
    mov r1, r1, lsl #0x10
    mov r7, r1, lsr #0x10
    mov r1, r7, asr #0x8
    orr r7, r1, r7, lsl #0x8
    mov r1, r2, asr #0x8
    strh r7, [r4, #-6]
    mov r7, #0x1100
    strh r7, [r4, #-4]
    orr r1, r1, r2, lsl #0x8
    strh r1, [r4, #0x4]
    ldrh r1, [r4, #0x4]
    mov r7, r0
    sub r0, r4, #0xc
    strh r1, [r4, #-2]
    ldrh lr, [r5, #0x18]
    mov r2, #0x0
    mov r1, #0x14
    mov ip, lr, asr #0x8
    orr ip, ip, lr, lsl #0x8
    strh ip, [r4, #0x2]
    ldrh lr, [r5, #0xa]
    mov ip, lr, asr #0x8
    orr ip, ip, lr, lsl #0x8
    strh ip, [r3, #0x22]
    strh r2, [r4, #0x6]
    bl func_02073ee0
    mov r2, r0
    mov r0, r7
    mov r1, r6
    bl func_02073ee0
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bl func_02073ec4
    mov r2, r7
    mov r3, r6
    mov r1, r0, asr #0x8
    orr r0, r1, r0, lsl #0x8
    strh r0, [r4, #0x6]
    ldr r1, [r5, #0x1c]
    mov r0, r4
    str r1, [sp]
    mov r1, #0x11
    str r1, [sp, #0x4]
    mov r1, #0x8
    bl func_02073014
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
_LIT0: .word data_0219ee3c
