; func_02072f58 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219edec
        .extern data_021a62f0
        .extern func_02073014
        .extern func_02073ec4
        .extern func_02073ee0
        .global func_02072f58
        .arm
func_02072f58:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0xc
    mov r5, r2
    ldr r3, [r5, #0x4c]
    mov r6, r1
    mov r1, #0x8
    ldr r2, _LIT0
    strh r1, [r3, #0x22]
    ldr r2, [r2, #0x4]
    add r4, r3, #0x22
    strh r2, [r4, #0x4]
    mov r2, #0x0
    ldr r3, _LIT1
    strh r2, [r4, #0x2]
    ldrh lr, [r3]
    mov r7, r0
    mov r0, r4
    strh lr, [r5, #0xa]
    ldrh ip, [r3]
    add ip, ip, #0x1
    strh ip, [r3]
    strh lr, [r4, #0x6]
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
    strh r0, [r4, #0x2]
    ldr r1, [r5, #0x1c]
    mov r0, r4
    str r1, [sp]
    mov r1, #0x1
    str r1, [sp, #0x4]
    mov r1, #0x8
    bl func_02073014
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
_LIT0: .word data_021a62f0
_LIT1: .word data_0219edec
