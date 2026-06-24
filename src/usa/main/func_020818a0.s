; func_020818a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0207e6f0
        .extern func_020817b0
        .extern func_02093b08
        .global func_020818a0
        .arm
func_020818a0:
    stmdb sp!, {r4, r5, r6, lr}
    movs r6, r0
    mov r5, r1
    beq .L_70
    cmp r6, #0x0
    beq .L_2c
    ldr r1, [r6]
    ldr r0, _LIT0
    cmp r1, r0
    moveq r0, #0x1
    beq .L_30
.L_2c:
    mov r0, #0x0
.L_30:
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    beq .L_74
    cmp r6, #0x0
    beq .L_5c
    ldrh r0, [r6, #0x6]
    cmp r0, #0x100
    movcs r0, #0x1
    bcs .L_60
.L_5c:
    mov r0, #0x0
.L_60:
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    b .L_74
.L_70:
    mov r0, #0x0
.L_74:
    cmp r0, #0x0
    movne r4, #0x0
    bne .L_fc
    cmp r6, #0x0
    beq .L_e8
    cmp r6, #0x0
    beq .L_a4
    ldr r1, [r6]
    ldr r0, _LIT0
    cmp r1, r0
    moveq r0, #0x1
    beq .L_a8
.L_a4:
    mov r0, #0x0
.L_a8:
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    beq .L_ec
    cmp r6, #0x0
    beq .L_d4
    ldrh r0, [r6, #0x6]
    cmp r0, #0x1
    movcs r0, #0x1
    bcs .L_d8
.L_d4:
    mov r0, #0x0
.L_d8:
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    b .L_ec
.L_e8:
    mov r0, #0x0
.L_ec:
    cmp r0, #0x0
    movne r4, #0x1
    bne .L_fc
    bl func_02093b08
.L_fc:
    mov r0, r6
    bl func_020817b0
    ldr r1, _LIT1
    mov r0, r6
    bl func_0207e6f0
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [r5]
    ldmeqia sp!, {r4, r5, r6, pc}
    add r0, r0, #0x8
    str r0, [r5]
    cmp r4, #0x0
    beq .L_148
    ldr r2, [r5]
    mov r1, #0x0
    ldrsb r0, [r2, #0x6]
    strb r0, [r2, #0x7]
    ldr r0, [r5]
    strb r1, [r0, #0x6]
.L_148:
    add r0, r4, #0x1
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x4e465452
_LIT1: .word 0x46494e46
