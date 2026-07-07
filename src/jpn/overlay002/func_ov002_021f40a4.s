; func_ov002_021f40a4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_021f40a4
        .arm
func_ov002_021f40a4:
    ldrh r2, [r0]
    ldr r1, _LIT0
    cmp r2, r1
    bgt .L_68
    bge .L_b0
    ldr r0, _LIT1
    cmp r2, r0
    bgt .L_28
    beq .L_98
    b .L_b8
.L_28:
    sub r0, r1, #0x1d
    sub r0, r2, r0
    cmp r0, #0xa
    addls pc, pc, r0, lsl #0x2
    b .L_b8
    b .L_a8
    b .L_a8
    b .L_b8
    b .L_b8
    b .L_b8
    b .L_a0
    b .L_b8
    b .L_98
    b .L_b8
    b .L_b8
    b .L_a8
.L_68:
    ldr r0, _LIT2
    cmp r2, r0
    bgt .L_88
    bge .L_a0
    sub r0, r0, #0x3
    cmp r2, r0
    beq .L_a0
    b .L_b8
.L_88:
    add r0, r0, #0x61
    cmp r2, r0
    beq .L_a8
    b .L_b8
.L_98:
    mov r0, #0x1
    bx lr
.L_a0:
    mov r0, #0x2
    bx lr
.L_a8:
    mov r0, #0x3
    bx lr
.L_b0:
    mov r0, #0xa
    bx lr
.L_b8:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x0000162d
_LIT1: .word 0x0000128e
_LIT2: .word 0x00001634
