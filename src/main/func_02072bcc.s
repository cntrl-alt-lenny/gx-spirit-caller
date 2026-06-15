; func_02072bcc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ef1c
        .extern data_0219ef2c
        .extern func_02073d30
        .extern func_02094688
        .global func_02072bcc
        .arm
func_02072bcc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r3, #0x200
    add r0, r4, #0x8
    add r1, r4, #0x12
    mov r2, #0xa
    strh r3, [r4, #0x6]
    bl func_02094688
    ldr r0, _LIT0
    add r1, r4, #0x8
    mov r2, #0x6
    bl func_02094688
    ldr r3, _LIT1
    add r0, r4, #0x12
    ldr r2, [r3]
    sub r1, r4, #0xe
    mov r2, r2, lsr #0x10
    mov r2, r2, lsl #0x10
    mov ip, r2, lsr #0x10
    mov r2, ip, asr #0x8
    orr r2, r2, ip, lsl #0x8
    strh r2, [r4, #0xe]
    ldr r3, [r3]
    mov r2, #0x6
    mov r3, r3, lsl #0x10
    mov ip, r3, lsr #0x10
    mov r3, ip, asr #0x8
    orr r3, r3, ip, lsl #0x8
    strh r3, [r4, #0x10]
    bl func_02094688
    ldr r0, _LIT0
    sub r1, r4, #0x8
    mov r2, #0x6
    bl func_02094688
    sub r0, r4, #0xe
    mov r1, #0x2a
    mov r2, #0x0
    mov r3, r2
    bl func_02073d30
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word data_0219ef2c
_LIT1: .word data_0219ef1c
