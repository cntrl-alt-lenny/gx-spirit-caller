; func_02043a78 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219da7c
        .extern data_0219da82
        .extern data_0219da88
        .extern func_02094688
        .global func_02043a78
        .arm
func_02043a78:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r4, r0
    ldr r3, [r4, #0x8]
    ldr r2, [r4, #0xc]
    ldr r1, _LIT0
    str r2, [sp, #0x4]
    str r3, [sp]
    mov r2, #0x5
    bl func_02094688
    ldr r1, [sp]
    ldr r2, [r4, #0x4]
    ldr r0, [sp, #0x4]
    mov r2, r2, lsr #0x8
    mov ip, r1, lsr #0x5
    mov r3, r0, lsr #0x5
    orr ip, ip, r0, lsl #0x1b
    and lr, r2, #0x7
    and r0, r1, #0x1f
    orr lr, lr, r0, lsl #0x3
    ldr r2, _LIT0
    ldr r1, _LIT1
    strb lr, [r2, #0x5]
    add r0, sp, #0x0
    str ip, [sp]
    str r3, [sp, #0x4]
    mov r2, #0x4
    bl func_02094688
    ldrh r0, [r4, #0x10]
    ldr r1, [sp, #0x4]
    ldr r3, _LIT0
    and r1, r1, #0x3f
    and r0, r0, #0x3
    orr r0, r1, r0, lsl #0x6
    strb r0, [r3, #0xa]
    ldrh r2, [r4, #0x10]
    add r0, r4, #0x12
    ldr r1, _LIT2
    mov r4, r2, asr #0x2
    mov r2, #0x2
    strb r4, [r3, #0xb]
    bl func_02094688
    ldr r0, _LIT0
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
_LIT0: .word data_0219da7c
_LIT1: .word data_0219da82
_LIT2: .word data_0219da88
