; func_0202e3d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0202e3d8
        .arm
func_0202e3d8:
    ldr r3, _LIT0
    cmp r0, r3
    bgt .L_94
    bge .L_15c
    ldr r2, _LIT1
    cmp r0, r2
    bgt .L_50
    bge .L_15c
    sub r1, r2, #0x3b
    cmp r0, r1
    bgt .L_40
    bge .L_15c
    sub r1, r2, #0xef
    cmp r0, r1
    beq .L_15c
    b .L_164
.L_40:
    sub r1, r2, #0x2c
    cmp r0, r1
    beq .L_15c
    b .L_164
.L_50:
    add r1, r2, #0x1d4
    cmp r0, r1
    bgt .L_70
    bge .L_15c
    add r1, r2, #0x2b
    cmp r0, r1
    beq .L_15c
    b .L_164
.L_70:
    sub r1, r3, #0x18c
    cmp r0, r1
    bgt .L_84
    beq .L_15c
    b .L_164
.L_84:
    add r1, r2, #0x338
    cmp r0, r1
    beq .L_15c
    b .L_164
.L_94:
    ldr r2, _LIT2
    cmp r0, r2
    bgt .L_d4
    bge .L_15c
    add r1, r3, #0x8c
    cmp r0, r1
    bgt .L_c4
    bge .L_15c
    add r1, r3, #0x76
    cmp r0, r1
    beq .L_15c
    b .L_164
.L_c4:
    sub r1, r2, #0x180
    cmp r0, r1
    beq .L_15c
    b .L_164
.L_d4:
    add r1, r2, #0x43
    cmp r0, r1
    bgt .L_13c
    bge .L_15c
    add r1, r2, #0x28
    sub r1, r0, r1
    cmp r1, #0x10
    addls pc, pc, r1, lsl #0x2
    b .L_164
    b .L_15c
    b .L_164
    b .L_164
    b .L_164
    b .L_164
    b .L_164
    b .L_164
    b .L_164
    b .L_164
    b .L_164
    b .L_15c
    b .L_15c
    b .L_15c
    b .L_15c
    b .L_15c
    b .L_15c
    b .L_15c
.L_13c:
    ldr r1, _LIT3
    cmp r0, r1
    bgt .L_150
    beq .L_15c
    b .L_164
.L_150:
    ldr r1, _LIT4
    cmp r0, r1
    bne .L_164
.L_15c:
    mov r0, #0x1
    bx lr
.L_164:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x00001441
_LIT1: .word 0x000010ab
_LIT2: .word 0x0000165a
_LIT3: .word 0x000016a4
_LIT4: .word 0x00001911
