; func_ov004_021d4ac8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103fcc
        .extern data_02104e6c
        .extern data_021058a9
        .extern data_ov004_0220b2a0
        .extern func_02032638
        .extern func_02033604
        .extern func_02049610
        .extern func_020aad04
        .extern func_ov004_021c9cac
        .extern func_ov004_021c9cbc
        .extern func_ov004_021d7b14
        .extern func_ov004_021d7b68
        .global func_ov004_021d4ac8
        .arm
func_ov004_021d4ac8:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x1c
    mov r5, r0
    ldr r0, [r5, #0x38]
    cmp r0, #0x0
    mov r0, #0x0
    strne r0, [r5, #0x38]
    movne r0, #0x1
    cmp r0, #0x0
    beq .L_f4
    ldr r1, _LIT0
    add r0, sp, #0x1
    ldrb r2, [r1, #0xa3c]
    ldr r1, _LIT1
    mov r2, r2, lsl #0x1d
    mov r2, r2, lsr #0x1d
    strb r2, [sp]
    bl func_020aad04
    ldr r1, _LIT0
    add r0, sp, #0x0
    ldr r2, [r1, #0xa64]
    mov r1, #0x1c
    str r2, [sp, #0x18]
    bl func_02049610
    ldr r0, _LIT2
    ldr r0, [r0, #0x48]
    cmp r0, #0x0
    bne .L_90
    mov r0, #0x1d
    str r0, [r5, #0x30]
    mov r0, #0x1
    str r0, [r5, #0x38]
    mov r0, #0x0
    add sp, sp, #0x1c
    str r0, [r5, #0x3c]
    ldmia sp!, {r4, r5, pc}
.L_90:
    bl func_ov004_021c9cbc
    cmp r0, #0x0
    beq .L_bc
    mov r0, #0x21
    str r0, [r5, #0x30]
    mov r0, #0x1
    str r0, [r5, #0x38]
    mov r0, #0x0
    add sp, sp, #0x1c
    str r0, [r5, #0x3c]
    ldmia sp!, {r4, r5, pc}
.L_bc:
    ldr r0, _LIT3
    ldr r0, [r0, #0xbac]
    cmp r0, #0x0
    blt .L_ec
    mov r0, #0x20
    str r0, [r5, #0x30]
    mov r0, #0x1
    str r0, [r5, #0x38]
    mov r0, #0x0
    add sp, sp, #0x1c
    str r0, [r5, #0x3c]
    ldmia sp!, {r4, r5, pc}
.L_ec:
    mov r0, #0x1
    bl func_ov004_021d7b14
.L_f4:
    bl func_ov004_021d7b68
    cmp r0, #0x0
    addeq sp, sp, #0x1c
    ldmeqia sp!, {r4, r5, pc}
    ldr r4, _LIT2
    ldr r0, [r4, #0x88]
    cmp r0, #0x1
    bne .L_12c
    mov r0, #0x1b
    str r0, [r5, #0x30]
    mov r0, #0x1
    str r0, [r5, #0x38]
    mov r0, #0x0
    str r0, [r5, #0x3c]
.L_12c:
    ldr r0, [r4, #0x88]
    cmp r0, #0x2
    bne .L_184
    bl func_02032638
    bl func_02033604
    cmp r0, #0x0
    ble .L_168
    mov r0, #0x1d
    str r0, [r5, #0x30]
    mov r0, #0x1
    str r0, [r5, #0x38]
    mov r0, #0x0
    str r0, [r5, #0x3c]
    bl func_ov004_021c9cac
    b .L_1a4
.L_168:
    mov r0, #0x19
    str r0, [r5, #0x30]
    mov r0, #0x1
    str r0, [r5, #0x38]
    mov r0, #0x0
    str r0, [r5, #0x3c]
    b .L_1a4
.L_184:
    cmp r0, #0x3
    bne .L_1a4
    mov r0, #0x25
    str r0, [r5, #0x30]
    mov r0, #0x1
    str r0, [r5, #0x38]
    mov r0, #0x0
    str r0, [r5, #0x3c]
.L_1a4:
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
_LIT0: .word data_02104e6c
_LIT1: .word data_021058a9
_LIT2: .word data_ov004_0220b2a0
_LIT3: .word data_02103fcc
