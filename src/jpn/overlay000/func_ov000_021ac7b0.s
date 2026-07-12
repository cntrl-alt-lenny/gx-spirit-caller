; func_ov000_021ac7b0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov000_021ac7b0
        .arm
func_ov000_021ac7b0:
    ldr r0, [r0, #0x9c]
    mov r1, r0, lsl #0x18
    mov r1, r1, lsr #0x18
    mov r0, r0, lsl #0x10
    cmp r1, r0, lsr #0x18
    movne r0, #0x1
    moveq r0, #0x0
    bx lr
