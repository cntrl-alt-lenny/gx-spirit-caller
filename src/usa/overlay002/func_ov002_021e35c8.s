; func_ov002_021e35c8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_021e35c8
        .arm
func_ov002_021e35c8:
    ldrh r1, [r0, #0x2]
    mov r1, r1, lsl #0x14
    mov ip, r1, lsr #0x1a
    cmp ip, #0x22
    moveq r0, #0x0
    bxeq lr
    ldrh r1, [r0]
    ldr r3, _LIT0
    cmp r1, r3
    bgt .L_b0
    bge .L_120
    sub r2, r3, #0x8b
    cmp r1, r2
    bgt .L_68
    bge .L_13c
    sub r2, r3, #0x1d0
    cmp r1, r2
    bgt .L_58
    mov r0, r2
    cmp r1, r0
    beq .L_13c
    b .L_148
.L_58:
    ldr r2, _LIT1
    cmp r1, r2
    beq .L_120
    b .L_148
.L_68:
    sub r2, r3, #0x46
    cmp r1, r2
    bgt .L_88
    bge .L_120
    sub r2, r3, #0x5d
    cmp r1, r2
    beq .L_120
    b .L_148
.L_88:
    sub r2, r3, #0x6
    cmp r1, r2
    bgt .L_148
    sub r2, r3, #0x9
    cmp r1, r2
    blt .L_148
    subne r2, r3, #0x6
    cmpne r1, r2
    beq .L_120
    b .L_148
.L_b0:
    ldr r2, _LIT2
    cmp r1, r2
    bgt .L_f0
    bge .L_13c
    add r2, r3, #0x90
    cmp r1, r2
    bgt .L_e0
    bge .L_120
    add r2, r3, #0x5
    cmp r1, r2
    beq .L_120
    b .L_148
.L_e0:
    ldr r2, _LIT3
    cmp r1, r2
    beq .L_120
    b .L_148
.L_f0:
    ldr r2, _LIT4
    cmp r1, r2
    bgt .L_110
    bge .L_120
    sub r2, r2, #0x78
    cmp r1, r2
    beq .L_120
    b .L_148
.L_110:
    add r0, r2, #0x4
    cmp r1, r0
    beq .L_13c
    b .L_148
.L_120:
    ldrh r0, [r0, #0x2]
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x1e
    cmp r0, #0x2
    bne .L_148
    mov r0, #0x0
    bx lr
.L_13c:
    cmp ip, #0x2
    moveq r0, #0x0
    bxeq lr
.L_148:
    mov r0, #0x1
    bx lr
_LIT0: .word 0x00001452
_LIT1: .word 0x00001315
_LIT2: .word 0x0000188f
_LIT3: .word 0x000015b8
_LIT4: .word 0x00001a7a
