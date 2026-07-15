; func_ov005_021ac928 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov005_021ac928
        .arm
func_ov005_021ac928:
    ldr r2, [r0, #0x54]
    cmp r2, #0x0
    bxne lr
    ldr r2, [r0, #0x34]
    cmp r2, #0x10
    bxlt lr
    str r1, [r0, #0x4c]
    str r1, [r0, #0x50]
    mov r1, #0x1
    str r1, [r0, #0x54]
    ldr r1, [r0, #0x34]
    str r1, [r0, #0x58]
    bx lr
