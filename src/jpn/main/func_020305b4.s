; func_020305b4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02030068
        .global func_020305b4
        .arm
func_020305b4:
    stmdb sp!, {r3, lr}
    ldr ip, _LIT0
    cmp r0, ip
    bgt .L_d4
    bge .L_1d0
    ldr r3, _LIT1
    cmp r0, r3
    bgt .L_7c
    bge .L_1d0
    ldr r2, _LIT2
    cmp r0, r2
    bgt .L_44
    bge .L_1d0
    ldr r1, _LIT3
    cmp r0, r1
    beq .L_1d0
    b .L_1d8
.L_44:
    add r1, r2, #0x12c
    cmp r0, r1
    bgt .L_6c
    sub r1, r3, #0x49
    cmp r0, r1
    blt .L_1d8
    addne r1, r2, #0x12c
    cmpne r0, r1
    beq .L_1d0
    b .L_1d8
.L_6c:
    sub r1, r3, #0x1
    cmp r0, r1
    beq .L_1d0
    b .L_1d8
.L_7c:
    add r1, r3, #0x2fc
    cmp r0, r1
    bgt .L_b0
    bge .L_1d0
    add r1, r3, #0x52
    cmp r0, r1
    bgt .L_a0
    beq .L_1d0
    b .L_1d8
.L_a0:
    add r1, r3, #0x20c
    cmp r0, r1
    beq .L_1d0
    b .L_1d8
.L_b0:
    sub r1, ip, #0x5b
    cmp r0, r1
    bgt .L_c4
    beq .L_1d0
    b .L_1d8
.L_c4:
    sub r1, ip, #0x1
    cmp r0, r1
    beq .L_1d0
    b .L_1d8
.L_d4:
    ldr r1, _LIT4
    cmp r0, r1
    bgt .L_16c
    bge .L_1d0
    sub r2, r1, #0xc3
    cmp r0, r2
    bgt .L_140
    bge .L_1d0
    add r2, ip, #0x17
    cmp r0, r2
    bgt .L_110
    mov r1, r2
    cmp r0, r1
    beq .L_1d0
    b .L_1d8
.L_110:
    sub r2, r1, #0xff
    cmp r0, r2
    bgt .L_1d8
    add r2, ip, #0x18
    cmp r0, r2
    blt .L_1d8
    subne r2, r1, #0x100
    cmpne r0, r2
    subne r1, r1, #0xff
    cmpne r0, r1
    beq .L_1d0
    b .L_1d8
.L_140:
    sub r2, r1, #0x76
    cmp r0, r2
    bgt .L_15c
    sub r1, r1, #0x76
    cmp r0, r1
    beq .L_1d0
    b .L_1d8
.L_15c:
    sub r1, r1, #0x75
    cmp r0, r1
    beq .L_1d0
    b .L_1d8
.L_16c:
    add r2, r1, #0xdf
    cmp r0, r2
    bgt .L_1a8
    bge .L_1d0
    add r2, r1, #0x1
    cmp r0, r2
    bgt .L_198
    add r1, r1, #0x1
    cmp r0, r1
    beq .L_1d0
    b .L_1d8
.L_198:
    add r1, r1, #0x2
    cmp r0, r1
    beq .L_1d0
    b .L_1d8
.L_1a8:
    add r2, r1, #0xe0
    cmp r0, r2
    bgt .L_1c4
    add r1, r1, #0xe0
    cmp r0, r1
    beq .L_1d0
    b .L_1d8
.L_1c4:
    add r1, r1, #0xe1
    cmp r0, r1
    bne .L_1d8
.L_1d0:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.L_1d8:
    bl func_02030068
    cmp r0, #0x2
    movle r0, #0x1
    movgt r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word 0x00001954
_LIT1: .word 0x000015fa
_LIT2: .word 0x00001488
_LIT3: .word 0x00001299
_LIT4: .word 0x00001a6d
