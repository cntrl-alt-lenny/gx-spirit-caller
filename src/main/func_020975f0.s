; func_020975f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02097d0c
        .extern func_02097d38
        .global func_020975f0
        .arm
func_020975f0:
    str r1, [r0, #0x28]
    str r3, [r0, #0x30]
    str r2, [r0, #0x3c]
    ldr r1, [r0, #0x3c]
    ldr r2, [sp, #0x4]
    str r1, [r0, #0x2c]
    str r2, [r0, #0x38]
    ldr r1, [sp]
    ldr r2, [sp, #0x8]
    str r1, [r0, #0x40]
    ldr r1, [r0, #0x40]
    cmp r2, #0x0
    str r1, [r0, #0x34]
    ldreq r2, _LIT0
    ldr r1, [sp, #0xc]
    str r2, [r0, #0x48]
    cmp r1, #0x0
    ldreq r1, _LIT1
    str r1, [r0, #0x4c]
    ldr r2, [r0, #0x48]
    mov r1, #0x0
    str r2, [r0, #0x50]
    str r1, [r0, #0x44]
    ldr r1, [r0, #0x1c]
    orr r1, r1, #0x2
    str r1, [r0, #0x1c]
    mov r0, #0x1
    bx lr
_LIT0: .word func_02097d38
_LIT1: .word func_02097d0c
