; func_ov010_021b3898 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov010_021b3898
        .arm
func_ov010_021b3898:
    ldr r1, [r0, #0x5c]
    cmp r1, #0x0
    moveq r0, #0x0
    bxeq lr
    mov r1, #0x2
    str r1, [r0, #0x68]
    mov r1, #0x5000
    str r1, [r0, #0x70]
    mov r0, #0x1
    bx lr
