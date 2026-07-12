; func_ov000_021aa760 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov000_021c7300
        .global func_ov000_021aa760
        .arm
func_ov000_021aa760:
    ldr r3, _LIT0
    ldr ip, [r3]
    ldr r3, [ip, #0x140]
    mov r3, r3, lsl #0x1c
    mov r3, r3, asr #0x1c
    cmp r3, #0x1
    cmpne r3, #0x2
    cmpne r3, #0x3
    bne .L_40
    rsb r3, r0, #0x0
    add r0, ip, #0x100
    strh r3, [r0, #0x2c]
    rsb r1, r1, #0x0
    strh r1, [r0, #0x2e]
    strh r2, [r0, #0x30]
    bx lr
.L_40:
    add r3, ip, #0x100
    strh r0, [r3, #0x2c]
    strh r1, [r3, #0x2e]
    strh r2, [r3, #0x30]
    bx lr
_LIT0: .word data_ov000_021c7300
