; func_ov004_021d4584 - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104f4c
        .extern data_02105989
        .extern data_ov004_022915e8
        .extern func_0203268c
        .extern func_020332a4
        .extern func_02033318
        .extern func_02033344
        .extern func_02033354
        .extern func_ov004_021c9d60
        .extern func_ov004_021d8798
        .extern func_ov004_021db874
        .extern func_ov004_021db994
        .global func_ov004_021d4584
        .arm
func_ov004_021d4584:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x2c
    mov r4, r0
    ldr r0, [r4, #0x38]
    cmp r0, #0x0
    mov r0, #0x0
    strne r0, [r4, #0x38]
    movne r0, #0x1
    cmp r0, #0x0
    beq .L_3b8
    mov r0, #0x0
    mov r1, #0x14
    bl func_ov004_021c9d60
    mov r1, r0
    ldr r0, _LIT0
    mov r2, #0x0
    bl func_ov004_021d8798
    ldr r0, _LIT1
    add r1, sp, #0x0
    ldrb r0, [r0, #0xa3c]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1d
    bne .L_370
    ldr r0, _LIT2
    bl func_ov004_021db874
    b .L_378
.L_370:
    ldr r0, _LIT2
    bl func_ov004_021db994
.L_378:
    bl func_0203268c
    add r1, sp, #0x0
    bl func_020332a4
    bl func_0203268c
    mov r1, #0x1
    bl func_02033318
    cmp r0, #0x0
    bge .L_3b8
    mov r0, #0x27
    str r0, [r4, #0x30]
    mov r0, #0x1
    str r0, [r4, #0x38]
    mov r0, #0x0
    add sp, sp, #0x2c
    str r0, [r4, #0x3c]
    ldmia sp!, {r3, r4, pc}
.L_3b8:
    bl func_0203268c
    bl func_02033344
    cmp r0, #0x0
    addeq sp, sp, #0x2c
    ldmeqia sp!, {r3, r4, pc}
    bl func_0203268c
    bl func_02033354
    cmp r0, #0x0
    bge .L_3fc
    mov r0, #0x27
    str r0, [r4, #0x30]
    mov r0, #0x1
    str r0, [r4, #0x38]
    mov r0, #0x0
    add sp, sp, #0x2c
    str r0, [r4, #0x3c]
    ldmia sp!, {r3, r4, pc}
.L_3fc:
    mov r0, #0xf
    str r0, [r4, #0x30]
    mov r0, #0x1
    str r0, [r4, #0x38]
    mov r0, #0x0
    str r0, [r4, #0x3c]
    add sp, sp, #0x2c
    ldmia sp!, {r3, r4, pc}
_LIT0: .word data_ov004_022915e8
_LIT1: .word data_02104f4c
_LIT2: .word data_02105989
