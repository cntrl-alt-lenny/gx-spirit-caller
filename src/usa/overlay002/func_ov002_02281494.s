; func_ov002_02281494 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_022812e8
        .extern func_ov002_022813e0
        .global func_ov002_02281494
        .arm
func_ov002_02281494:
    stmdb sp!, {r4, lr}
    ldr r3, _LIT0
    mov r4, r0
    cmp r4, r3
    bgt .L_c8
    bge .L_170
    ldr r2, _LIT1
    cmp r4, r2
    bgt .L_6c
    bge .L_170
    sub r0, r2, #0xcc
    cmp r4, r0
    bgt .L_48
    bge .L_170
    ldr r0, _LIT2
    cmp r4, r0
    beq .L_170
    b .L_178
.L_48:
    sub r0, r2, #0x20
    cmp r4, r0
    bgt .L_5c
    beq .L_170
    b .L_178
.L_5c:
    sub r0, r2, #0x16
    cmp r4, r0
    beq .L_170
    b .L_178
.L_6c:
    add r0, r2, #0xec
    cmp r4, r0
    bgt .L_8c
    bge .L_170
    add r0, r2, #0x28
    cmp r4, r0
    beq .L_170
    b .L_178
.L_8c:
    sub r0, r3, #0xa3
    cmp r4, r0
    bgt .L_b8
    add r0, r2, #0x144
    cmp r4, r0
    blt .L_178
    beq .L_160
    sub r0, r3, #0xa3
    cmp r4, r0
    beq .L_170
    b .L_178
.L_b8:
    add r0, r2, #0x1e8
    cmp r4, r0
    beq .L_170
    b .L_178
.L_c8:
    ldr r2, _LIT3
    cmp r4, r2
    bgt .L_11c
    bge .L_170
    sub r0, r2, #0x7e
    cmp r4, r0
    bgt .L_f8
    bge .L_170
    add r0, r3, #0x17
    cmp r4, r0
    beq .L_160
    b .L_178
.L_f8:
    sub r0, r2, #0x36
    cmp r4, r0
    bgt .L_10c
    beq .L_170
    b .L_178
.L_10c:
    sub r0, r2, #0x27
    cmp r4, r0
    beq .L_160
    b .L_178
.L_11c:
    add r0, r2, #0x1f0
    cmp r4, r0
    bgt .L_13c
    bge .L_160
    ldr r0, _LIT4
    cmp r4, r0
    beq .L_170
    b .L_178
.L_13c:
    ldr r0, _LIT5
    cmp r4, r0
    bgt .L_150
    beq .L_170
    b .L_178
.L_150:
    add r0, r0, #0xec
    cmp r4, r0
    beq .L_170
    b .L_178
.L_160:
    cmp r1, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, pc}
.L_170:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_178:
    mov r0, r4
    bl func_ov002_022812e8
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, pc}
    mov r0, r4
    bl func_ov002_022813e0
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word 0x0000150b
_LIT1: .word 0x00001322
_LIT2: .word 0x000010f4
_LIT3: .word 0x0000166c
_LIT4: .word 0x000017a6
_LIT5: .word 0x00001992
