; func_ov002_0227da20 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_0227da20
        .arm
func_ov002_0227da20:
    stmdb sp!, {r3, lr}
    ldr r3, _LIT0
    cmp r0, r3
    bgt .L_cc
    sub ip, r3, #0x5
    cmp r0, ip
    blt .L_28
    cmpne r0, r3
    beq .L_184
    b .L_1b8
.L_28:
    ldr lr, _LIT1
    cmp r0, lr
    bgt .L_68
    bge .L_1a0
    ldr r3, _LIT2
    cmp r0, r3
    bgt .L_58
    bge .L_184
    sub r3, r3, #0x47
    cmp r0, r3
    beq .L_184
    b .L_1b8
.L_58:
    add r1, r3, #0xe6
    cmp r0, r1
    beq .L_1a0
    b .L_1b8
.L_68:
    sub ip, r3, #0x144
    cmp r0, ip
    bgt .L_a0
    add ip, lr, #0x270
    cmp r0, ip
    blt .L_90
    subne r3, r3, #0x144
    cmpne r0, r3
    beq .L_184
    b .L_1b8
.L_90:
    add r1, lr, #0xc2
    cmp r0, r1
    beq .L_1a0
    b .L_1b8
.L_a0:
    sub ip, r3, #0xa0
    cmp r0, ip
    bgt .L_bc
    mov r1, ip
    cmp r0, r1
    beq .L_1a0
    b .L_1b8
.L_bc:
    add r3, lr, #0x3b0
    cmp r0, r3
    beq .L_184
    b .L_1b8
.L_cc:
    add r2, r3, #0x1d0
    cmp r0, r2
    bgt .L_140
    ldr ip, _LIT3
    cmp r0, ip
    blt .L_f4
    addne r2, ip, #0x1
    cmpne r0, r2
    beq .L_1a8
    b .L_1b8
.L_f4:
    sub r2, ip, #0x22
    cmp r0, r2
    bgt .L_11c
    mov r1, r2
    cmp r0, r1
    bge .L_1a0
    add r1, r3, #0x2c
    cmp r0, r1
    beq .L_1a0
    b .L_1b8
.L_11c:
    sub r2, ip, #0x3
    cmp r0, r2
    bgt .L_130
    beq .L_1a8
    b .L_1b8
.L_130:
    sub r2, ip, #0x2
    cmp r0, r2
    beq .L_1a8
    b .L_1b8
.L_140:
    ldr r2, _LIT4
    cmp r0, r2
    bgt .L_160
    bge .L_1a0
    sub r1, r2, #0x7f
    cmp r0, r1
    beq .L_1a0
    b .L_1b8
.L_160:
    add r1, r2, #0xac
    cmp r0, r1
    bgt .L_174
    beq .L_1a0
    b .L_1b8
.L_174:
    add r1, r2, #0x12c
    cmp r0, r1
    beq .L_1a0
    b .L_1b8
.L_184:
    cmp r1, #0x0
    bne .L_198
    cmp r2, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, pc}
.L_198:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_1a0:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.L_1a8:
    cmp r1, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, pc}
.L_1b8:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word 0x00001799
_LIT1: .word 0x000013e3
_LIT2: .word 0x000011bc
_LIT3: .word 0x00001968
_LIT4: .word 0x000019fe
