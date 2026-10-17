; func_020125ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern func_02011aec
        .global func_020125ac
        .arm
func_020125ac:
    stmdb sp!, {r3, lr}
    ldr r2, _LIT0
    mov r1, #0x0
    str r1, [r2, #0xba0]
    mov r3, #0x1
    mov r0, #0x26
    str r3, [r2, #0xbbc]
    str r0, [r2, #0xbc0]
    sub r3, r0, #0x27
    str r3, [r2, #0xbc4]
    bl func_02011aec
    ldr r1, _LIT0
    mov r2, #0x0
    str r0, [r1, #0xbc8]
    str r2, [r1, #0xbb0]
    sub r0, r2, #0x1
    str r0, [r1, #0xbb4]
    str r2, [r1, #0xc38]
    str r2, [r1, #0xc3c]
    mov r0, #0x2
    str r0, [r1, #0xc48]
    mov r0, #0x1
    str r0, [r1, #0xc40]
    str r0, [r1, #0xc44]
    str r2, [r1, #0xb88]
    str r0, [r1, #0xb84]
    ldmia sp!, {r3, pc}
_LIT0: .word data_021040ac
