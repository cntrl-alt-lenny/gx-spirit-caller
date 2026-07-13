; func_ov015_021b27a8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov015_021b27a8
        .arm
func_ov015_021b27a8:
    ldr r1, [r0, #0x8]
    cmp r1, #0x0
    beq .L_44
    cmp r1, #0x1
    beq .L_58
    b .L_6c
.L_44:
    ldr r0, [r0, #0xc]
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
.L_58:
    ldr r0, [r0, #0xc]
    cmp r0, #0x0
    moveq r0, #0x0
    movne r0, #0x1
    bx lr
.L_6c:
    mov r0, #0x0
    bx lr
