; func_ov002_021b9064 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_021b9064
        .arm
func_ov002_021b9064:
    sub r0, r0, #0x28c
    sub r0, r0, #0x1400
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    b .L_78
    b .L_30
    b .L_30
    b .L_54
    b .L_30
    b .L_40
    b .L_40
    b .L_54
.L_30:
    cmp r1, #0x3
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
.L_40:
    cmp r1, #0x2
    cmpne r1, #0x5
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
.L_54:
    sub r2, r1, #0x1
    cmp r2, #0x5
    mov r0, #0x0
    bxhi lr
    mov r1, #0x1
    mov r2, r1, lsl r2
    tst r2, #0x25
    movne r0, r1
    bx lr
.L_78:
    mov r0, #0x0
    bx lr
