; func_02021174 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern data_02194260
        .extern func_02021150
        .extern func_020219e8
        .extern func_02021ae4
        .extern func_02023220
        .extern func_02023f28
        .extern func_020243dc
        .extern func_02026f84
        .extern func_02028568
        .extern func_0202a178
        .global func_02021174
        .arm
func_02021174:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r4, _LIT0
    mov r5, r0
    mov r2, r4
    mov r1, #0x0
.L_14:
    ldr r0, [r2, #0x38]
    cmp r0, #0x0
    beq .L_34
    add r0, r2, #0x218
    add r1, r1, #0x1
    cmp r1, #0x8
    add r2, r0, #0x400
    blt .L_14
.L_34:
    ldr r2, _LIT1
    add r0, r4, #0x34
    mla r6, r1, r2, r0
    mov r1, r6
    mov r0, #0x0
    bl Fill32
    str r5, [r6, #0x4]
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    bne .L_b4
    ldr r0, [r4, #0x18]
    bl func_02021ae4
    mov r0, #0x1
    bl func_02021150
    cmp r0, #0x0
    bne .L_8c
    ldr r0, [r4, #0x1c]
    bl func_02023220
    ldr r0, [r4, #0x20]
    bl func_02023f28
    ldr r0, [r4, #0x24]
    bl func_020243dc
.L_8c:
    mov r0, #0x2
    bl func_02021150
    cmp r0, #0x0
    bne .L_ac
    ldr r0, [r4, #0x28]
    bl func_02026f84
    ldr r0, [r4, #0x2c]
    bl func_02028568
.L_ac:
    ldr r0, [r4, #0x30]
    bl func_0202a178
.L_b4:
    ldr r0, [r5]
    movs r0, r0, lsr #0x18
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    cmp r0, #0xf1
    bne .L_e0
    mov r0, r6
    mov r1, r5
    bl func_020219e8
    str r0, [r6, #0x14]
    b .L_e8
.L_e0:
    add r5, r5, #0x4
    b .L_b4
.L_e8:
    ldr r1, [r4, #0x8]
    mov r0, r6
    add r1, r1, #0x1
    str r1, [r4, #0x8]
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_02194260
_LIT1: .word 0x00000618
