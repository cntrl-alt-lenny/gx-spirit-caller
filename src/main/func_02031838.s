; func_02031838 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02031838
        .arm
func_02031838:
    sub r1, r0, #0x4a
    sub r1, r1, #0x1600
    ldr r0, _LIT0
    cmp r1, #0x5
    addls pc, pc, r1, lsl #0x2
    b .L_b8
    b .L_88
    b .L_90
    b .L_98
    b .L_a0
    b .L_a8
    b .L_b0
.L_88:
    add r0, r0, #0x12
    bx lr
.L_90:
    add r0, r0, #0x13
    bx lr
.L_98:
    add r0, r0, #0x14
    bx lr
.L_a0:
    add r0, r0, #0x15
    bx lr
.L_a8:
    add r0, r0, #0x16
    bx lr
.L_b0:
    add r0, r0, #0x17
    bx lr
.L_b8:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x0000164a
