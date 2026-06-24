; func_0200973c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104e5c
        .extern data_021058d8
        .global func_0200973c
        .arm
func_0200973c:
    stmdb sp!, {r3, lr}
    mov r1, r0, asr #0x4
    add r1, r0, r1, lsr #0x1b
    mov r2, r0, lsr #0x1f
    rsb r0, r2, r0, lsl #0x1b
    ldr r3, _LIT0
    mov lr, r1, asr #0x5
    ldr r1, [r3, lr, lsl #0x2]
    add r2, r2, r0, ror #0x1b
    mov ip, #0x1
    tst r1, ip, lsl r2
    ldmneia sp!, {r3, pc}
    orr r1, r1, ip, lsl r2
    ldr r0, _LIT1
    str r1, [r3, lr, lsl #0x2]
    str ip, [r0, #0xa88]
    ldmia sp!, {r3, pc}
_LIT0: .word data_021058d8
_LIT1: .word data_02104e5c
