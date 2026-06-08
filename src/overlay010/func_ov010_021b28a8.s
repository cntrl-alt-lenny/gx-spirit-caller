; func_ov010_021b28a8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov010_021b28a8
        .arm
func_ov010_021b28a8:
    ldr r1, [r0, #0x8]
    cmp r1, #0x0
    beq .L_18
    cmp r1, #0x1
    beq .L_2c
    b .L_40
.L_18:
    ldr r0, [r0, #0xc]
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
.L_2c:
    ldr r0, [r0, #0xc]
    cmp r0, #0x0
    moveq r0, #0x0
    movne r0, #0x1
    bx lr
.L_40:
    mov r0, #0x0
    bx lr
