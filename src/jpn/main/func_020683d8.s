; func_020683d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020683d8
        .arm
func_020683d8:
    ldr r2, [r0, #0x4]
    cmp r2, #0x0
    strne r1, [r2, #0x20]
    str r1, [r0, #0x4]
    mov r2, #0x0
    str r2, [r1, #0x20]
    ldr r2, [r0]
    cmp r2, #0x0
    streq r1, [r0]
    ldr r1, [r0, #0x8]
    add r1, r1, #0x1
    str r1, [r0, #0x8]
    bx lr
