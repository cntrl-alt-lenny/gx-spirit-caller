; func_0207db44 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0207db44
        .arm
func_0207db44:
    add r2, r0, #0x24
    ldr r3, [r2, #0x8]
    cmp r3, #0x0
    beq .L_68
.L_54:
    ldr r1, [r0, #0x1c]
    str r1, [r3, #0x8]
    ldr r3, [r3, #0xc]
    cmp r3, #0x0
    bne .L_54
.L_68:
    ldr r0, [r0, #0x1c]
    str r0, [r2, #0x4]
    bx lr
