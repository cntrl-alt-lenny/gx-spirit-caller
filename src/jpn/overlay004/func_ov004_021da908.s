; func_ov004_021da908 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104e6c
        .extern data_021058a9
        .extern data_ov004_0220b2a0
        .extern func_020aad04
        .extern func_ov004_021da764
        .extern func_ov004_021da834
        .global func_ov004_021da908
        .arm
func_ov004_021da908:
    stmdb sp!, {r4, lr}
    ldr r4, _LIT0
    mov r0, #0x0
    str r0, [r4, #0x9c]
    str r0, [r4, #0xa0]
    sub r0, r0, #0x1
    str r0, [r4, #0xb0]
    ldr r0, [r4, #0x8c]
    cmp r0, #0x100
    ldmleia sp!, {r4, pc}
    ldr r0, _LIT1
    mov ip, #0x5
    ldrb r3, [r0, #0xa3c]
    ldr r2, [r0, #0xa64]
    ldr r1, _LIT2
    mov r0, r3, lsl #0x1d
    mov r3, r0, lsr #0x1d
    add r0, r4, #0xc1
    str ip, [r4, #0xb8]
    strb r3, [r4, #0xc0]
    str r2, [r4, #0xbc]
    bl func_020aad04
    mov r2, #0x1
    mov r1, #0x0
.L_60:
    add r0, r4, r2, lsl #0x5
    add r2, r2, #0x1
    str r1, [r0, #0xb8]
    cmp r2, #0x5
    blt .L_60
    ldr r0, [r4, #0x8c]
    str r1, [r4, #0xa4]
    cmp r0, #0x200
    ldmneia sp!, {r4, pc}
    bl func_ov004_021da764
    str r0, [r4, #0x9c]
    bl func_ov004_021da834
    str r0, [r4, #0xa0]
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov004_0220b2a0
_LIT1: .word data_02104e6c
_LIT2: .word data_021058a9
