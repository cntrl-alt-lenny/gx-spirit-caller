; func_ov004_021d61cc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104e6c
        .extern data_0210586c
        .extern data_021058a9
        .extern data_0210596d
        .extern data_02105a90
        .extern func_02034838
        .extern func_02052dbc
        .extern func_02094688
        .extern func_020aad04
        .global func_ov004_021d61cc
        .arm
func_ov004_021d61cc:
    stmfd sp!, {lr}
    sub sp, sp, #0xac
    strh r0, [sp, #0x54]
    ldr r0, _LIT0
    add r1, sp, #0x0
    bl func_02052dbc
    ldr r1, _LIT1
    ldr r0, _LIT2
    ldrh ip, [r1, #0x52]
    ldrb r2, [r0, #0xa3c]
    ldrh r3, [r1, #0x58]
    add r0, sp, #0x11
    mov r1, r2, lsl #0x1d
    mov r2, r1, lsr #0x1d
    ldr r1, _LIT3
    strh ip, [sp, #0x40]
    strh r3, [sp, #0x42]
    strb r2, [sp, #0x10]
    bl func_020aad04
    ldr r1, _LIT2
    add r0, sp, #0x27
    ldrb r2, [r1, #0xb00]
    ldr r1, _LIT4
    strb r2, [sp, #0x26]
    bl func_020aad04
    mov r3, #0x0
    ldr r0, _LIT2
    mov r2, #0x1
    ldr r0, [r0, #0xa64]
    str r2, [sp, #0x48]
    str r0, [sp, #0x44]
    add r0, sp, #0x0
    add r1, sp, #0x56
    mov r2, #0x54
    strb r3, [sp, #0x51]
    strb r3, [sp, #0x50]
    strb r3, [sp, #0x52]
    str r3, [sp, #0x4c]
    bl func_02094688
    add r1, sp, #0x54
    mov r0, #0x3
    mov r2, #0x56
    bl func_02034838
    mov r0, #0x1
    add sp, sp, #0xac
    ldmfd sp!, {pc}
_LIT0: .word data_02105a90
_LIT1: .word data_0210586c
_LIT2: .word data_02104e6c
_LIT3: .word data_021058a9
_LIT4: .word data_0210596d
