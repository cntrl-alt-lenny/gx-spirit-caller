; func_ov000_021ac6c8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov000_021ac6c8
        .arm
func_ov000_021ac6c8:
    ldr r0, [r0]
    mov r0, r0, lsl #0x19
    mov r0, r0, lsr #0x1c
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
