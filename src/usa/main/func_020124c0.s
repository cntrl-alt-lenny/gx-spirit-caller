; func_020124c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103fcc
        .extern func_02011ab8
        .global func_020124c0
        .arm
func_020124c0:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r3, _LIT0
    mov r5, r1
    mov r1, #0x0
    str r1, [r3, #0xba0]
    str r1, [r3, #0xbbc]
    str r0, [r3, #0xbc0]
    mov r4, r2
    str r1, [r3, #0xbc4]
    bl func_02011ab8
    ldr r1, _LIT0
    mov r2, #0x0
    str r0, [r1, #0xbc8]
    str r2, [r1, #0xbb0]
    sub r0, r2, #0x1
    str r0, [r1, #0xbb4]
    str r2, [r1, #0xc3c]
    mov r0, #0x2
    str r0, [r1, #0xc48]
    str r2, [r1, #0xc40]
    mov r0, #0x1
    str r0, [r1, #0xc44]
    str r2, [r1, #0xc38]
    str r5, [r1, #0xb88]
    str r4, [r1, #0xb84]
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_02103fcc
