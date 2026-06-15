; func_ov004_021d4ba8 - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern data_02104f4c
        .extern data_02105989
        .extern data_ov004_0220b500
        .extern func_0203268c
        .extern func_02033654
        .extern func_02049684
        .extern func_020aadf8
        .extern func_ov004_021c9d8c
        .extern func_ov004_021c9d9c
        .extern func_ov004_021d7c00
        .extern func_ov004_021d7c54
        .global func_ov004_021d4ba8
        .arm
func_ov004_021d4ba8:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x1c
    mov r5, r0
    ldr r0, [r5, #0x38]
    cmp r0, #0x0
    mov r0, #0x0
    strne r0, [r5, #0x38]
    movne r0, #0x1
    cmp r0, #0x0
    beq .L_1b8
    ldr r1, _LIT0
    add r0, sp, #0x1
    ldrb r2, [r1, #0xa3c]
    ldr r1, _LIT1
    mov r2, r2, lsl #0x1d
    mov r2, r2, lsr #0x1d
    strb r2, [sp]
    bl func_020aadf8
    ldr r1, _LIT0
    add r0, sp, #0x0
    ldr r2, [r1, #0xa64]
    mov r1, #0x1c
    str r2, [sp, #0x18]
    bl func_02049684
    ldr r0, _LIT2
    ldr r0, [r0, #0x48]
    cmp r0, #0x0
    bne .L_154
    mov r0, #0x1d
    str r0, [r5, #0x30]
    mov r0, #0x1
    str r0, [r5, #0x38]
    mov r0, #0x0
    add sp, sp, #0x1c
    str r0, [r5, #0x3c]
    ldmia sp!, {r4, r5, pc}
.L_154:
    bl func_ov004_021c9d9c
    cmp r0, #0x0
    beq .L_180
    mov r0, #0x21
    str r0, [r5, #0x30]
    mov r0, #0x1
    str r0, [r5, #0x38]
    mov r0, #0x0
    add sp, sp, #0x1c
    str r0, [r5, #0x3c]
    ldmia sp!, {r4, r5, pc}
.L_180:
    ldr r0, _LIT3
    ldr r0, [r0, #0xbac]
    cmp r0, #0x0
    blt .L_1b0
    mov r0, #0x20
    str r0, [r5, #0x30]
    mov r0, #0x1
    str r0, [r5, #0x38]
    mov r0, #0x0
    add sp, sp, #0x1c
    str r0, [r5, #0x3c]
    ldmia sp!, {r4, r5, pc}
.L_1b0:
    mov r0, #0x1
    bl func_ov004_021d7c00
.L_1b8:
    bl func_ov004_021d7c54
    cmp r0, #0x0
    addeq sp, sp, #0x1c
    ldmeqia sp!, {r4, r5, pc}
    ldr r4, _LIT2
    ldr r0, [r4, #0x88]
    cmp r0, #0x1
    bne .L_1f0
    mov r0, #0x1b
    str r0, [r5, #0x30]
    mov r0, #0x1
    str r0, [r5, #0x38]
    mov r0, #0x0
    str r0, [r5, #0x3c]
.L_1f0:
    ldr r0, [r4, #0x88]
    cmp r0, #0x2
    bne .L_248
    bl func_0203268c
    bl func_02033654
    cmp r0, #0x0
    ble .L_22c
    mov r0, #0x1d
    str r0, [r5, #0x30]
    mov r0, #0x1
    str r0, [r5, #0x38]
    mov r0, #0x0
    str r0, [r5, #0x3c]
    bl func_ov004_021c9d8c
    b .L_268
.L_22c:
    mov r0, #0x19
    str r0, [r5, #0x30]
    mov r0, #0x1
    str r0, [r5, #0x38]
    mov r0, #0x0
    str r0, [r5, #0x3c]
    b .L_268
.L_248:
    cmp r0, #0x3
    bne .L_268
    mov r0, #0x25
    str r0, [r5, #0x30]
    mov r0, #0x1
    str r0, [r5, #0x38]
    mov r0, #0x0
    str r0, [r5, #0x3c]
.L_268:
    ldr r0, [r4, #0x88]
    cmp r0, #0x0
    addge sp, sp, #0x1c
    ldmgeia sp!, {r4, r5, pc}
    mov r0, #0x24
    str r0, [r5, #0x30]
    mov r0, #0x1
    str r0, [r5, #0x38]
    mov r0, #0x0
    str r0, [r5, #0x3c]
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_02104f4c
_LIT1: .word data_02105989
_LIT2: .word data_ov004_0220b500
_LIT3: .word data_021040ac
