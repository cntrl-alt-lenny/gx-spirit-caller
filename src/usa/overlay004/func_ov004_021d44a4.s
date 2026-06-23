; func_ov004_021d44a4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104e6c
        .extern data_021058a9
        .extern data_ov004_02291388
        .extern func_02032638
        .extern func_02033250
        .extern func_020332c4
        .extern func_020332f4
        .extern func_02033304
        .extern func_ov004_021c9c80
        .extern func_ov004_021d86ac
        .extern func_ov004_021db660
        .extern func_ov004_021db780
        .global func_ov004_021d44a4
        .arm
func_ov004_021d44a4:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x2c
    mov r4, r0
    ldr r0, [r4, #0x38]
    cmp r0, #0x0
    mov r0, #0x0
    strne r0, [r4, #0x38]
    movne r0, #0x1
    cmp r0, #0x0
    beq .L_b0
    mov r0, #0x0
    mov r1, #0x14
    bl func_ov004_021c9c80
    mov r1, r0
    ldr r0, _LIT0
    mov r2, #0x0
    bl func_ov004_021d86ac
    ldr r0, _LIT1
    add r1, sp, #0x0
    ldrb r0, [r0, #0xa3c]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1d
    bne .L_68
    ldr r0, _LIT2
    bl func_ov004_021db660
    b .L_70
.L_68:
    ldr r0, _LIT2
    bl func_ov004_021db780
.L_70:
    bl func_02032638
    add r1, sp, #0x0
    bl func_02033250
    bl func_02032638
    mov r1, #0x1
    bl func_020332c4
    cmp r0, #0x0
    bge .L_b0
    mov r0, #0x27
    str r0, [r4, #0x30]
    mov r0, #0x1
    str r0, [r4, #0x38]
    mov r0, #0x0
    add sp, sp, #0x2c
    str r0, [r4, #0x3c]
    ldmia sp!, {r3, r4, pc}
.L_b0:
    bl func_02032638
    bl func_020332f4
    cmp r0, #0x0
    addeq sp, sp, #0x2c
    ldmeqia sp!, {r3, r4, pc}
    bl func_02032638
    bl func_02033304
    cmp r0, #0x0
    bge .L_f4
    mov r0, #0x27
    str r0, [r4, #0x30]
    mov r0, #0x1
    str r0, [r4, #0x38]
    mov r0, #0x0
    add sp, sp, #0x2c
    str r0, [r4, #0x3c]
    ldmia sp!, {r3, r4, pc}
.L_f4:
    mov r0, #0xf
    str r0, [r4, #0x30]
    mov r0, #0x1
    str r0, [r4, #0x38]
    mov r0, #0x0
    str r0, [r4, #0x3c]
    add sp, sp, #0x2c
    ldmia sp!, {r3, r4, pc}
_LIT0: .word data_ov004_02291388
_LIT1: .word data_02104e6c
_LIT2: .word data_021058a9
