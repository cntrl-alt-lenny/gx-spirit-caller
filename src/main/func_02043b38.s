; func_02043b38 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219da70
        .extern data_0219da74
        .global func_02043b38
        .arm
func_02043b38:
    ldr r3, _LIT0
    and ip, r1, #0xff
    ldr r0, _LIT1
    mov r1, #0x1
    strh ip, [r3]
    str r1, [r0]
    cmp r2, #0x0
    movne r0, #0xff
    strneh r0, [r3]
    ldr r0, _LIT0
    ldrh r0, [r0]
    bx lr
_LIT0: .word data_0219da70
_LIT1: .word data_0219da74
