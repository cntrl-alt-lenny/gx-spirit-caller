; func_ov002_021e34bc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_021e34bc
        .arm
func_ov002_021e34bc:
    ldrh r1, [r0]
    ldr ip, _LIT0
    cmp r1, ip
    bgt .L_70
    bge .L_b4
    ldr r3, _LIT1
    cmp r1, r3
    bgt .L_34
    bge .L_d0
    ldr r0, _LIT2
    cmp r1, r0
    beq .L_d0
    b .L_f4
.L_34:
    rsb r2, r3, #0x2780
    cmp r1, r2
    bgt .L_48
    beq .L_b4
    b .L_f4
.L_48:
    sub r2, ip, #0x120
    cmp r1, r2
    bgt .L_f4
    ldr r2, _LIT3
    cmp r1, r2
    blt .L_f4
    addne r2, r2, #0x3
    cmpne r1, r2
    beq .L_b4
    b .L_f4
.L_70:
    add r2, ip, #0x91
    cmp r1, r2
    bgt .L_90
    bge .L_b4
    add r2, ip, #0x1e
    cmp r1, r2
    beq .L_b4
    b .L_f4
.L_90:
    add r2, ip, #0x13c
    cmp r1, r2
    bgt .L_a4
    beq .L_b4
    b .L_f4
.L_a4:
    add r2, ip, #0x1a4
    cmp r1, r2
    beq .L_d8
    b .L_f4
.L_b4:
    ldrh r0, [r0, #0x2]
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x1e
    cmp r0, #0x2
    movne r0, #0x1
    moveq r0, #0x0
    bx lr
.L_d0:
    mov r0, #0x0
    bx lr
.L_d8:
    ldrh r0, [r0, #0x2]
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x1e
    cmp r0, #0x2
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
.L_f4:
    mov r0, #0x1
    bx lr
_LIT0: .word 0x000018ec
_LIT1: .word 0x0000133b
_LIT2: .word 0x00001174
_LIT3: .word 0x000017c9
