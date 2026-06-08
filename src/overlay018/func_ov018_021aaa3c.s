; func_ov018_021aaa3c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov018_021ad860
        .extern data_ov018_021ad8a8
        .extern func_ov018_021ad1f4
        .global func_ov018_021aaa3c
        .arm
func_ov018_021aaa3c:
    ldr r2, _LIT0
    mov r1, r0
    ldr r0, [r2, #0x9cc]
    ldr r3, _LIT1
    mov r0, r0, asr #0xc
    tst r0, #0x2
    movne r0, #0xff
    moveq r0, #0x0
    mov r0, r0, lsl #0x10
    mov r2, r0, lsr #0x10
    add r0, r3, #0x66
    mov r2, r2, lsl #0x10
    ldr ip, _LIT2
    add r0, r0, #0x900
    orr r2, r2, #0xc
    bx ip
_LIT0: .word data_ov018_021ad860
_LIT1: .word data_ov018_021ad8a8
_LIT2: .word func_ov018_021ad1f4
