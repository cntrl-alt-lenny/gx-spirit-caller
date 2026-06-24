; func_0202e304 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0202e304
        .arm
func_0202e304:
    ldr r2, _LIT0
    cmp r0, r2
    bgt .L_60
    bge .L_b8
    sub r1, r2, #0x3f
    cmp r0, r1
    bgt .L_50
    sub r1, r2, #0x41
    cmp r0, r1
    blt .L_40
    subne r1, r2, #0x40
    cmpne r0, r1
    subne r1, r2, #0x3f
    cmpne r0, r1
    beq .L_b8
    b .L_c0
.L_40:
    ldr r1, _LIT1
    cmp r0, r1
    beq .L_b8
    b .L_c0
.L_50:
    sub r1, r2, #0x19
    cmp r0, r1
    beq .L_b8
    b .L_c0
.L_60:
    ldr r2, _LIT2
    cmp r0, r2
    bgt .L_80
    bge .L_b8
    sub r1, r2, #0x17
    cmp r0, r1
    beq .L_b8
    b .L_c0
.L_80:
    add r1, r2, #0x1
    cmp r0, r1
    bgt .L_94
    beq .L_b8
    b .L_c0
.L_94:
    add r1, r2, #0x2
    sub r0, r0, r1
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_c0
    b .L_b8
    b .L_b8
    b .L_b8
    b .L_b8
.L_b8:
    mov r0, #0x1
    bx lr
.L_c0:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x000012be
_LIT1: .word 0x00001123
_LIT2: .word 0x00001561
