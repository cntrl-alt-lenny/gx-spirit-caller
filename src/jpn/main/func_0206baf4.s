; func_0206baf4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101d84
        .extern data_0219ebf8
        .extern data_0219ebfc
        .extern data_0219ec00
        .extern data_0219ec04
        .extern data_0219ec0c
        .extern data_0219ee3c
        .extern func_0206ba3c
        .extern func_0206ba60
        .extern func_0206ba78
        .extern func_0206db48
        .extern func_02073974
        .extern func_02073fa0
        .extern func_0207403c
        .extern func_020740ac
        .extern func_0207cad4
        .extern func_02094500
        .global func_0206baf4
        .arm
func_0206baf4:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    ldr r5, _LIT1
    ldr r4, [r0]
    mov r0, r5
    mov r1, #0x0
    mov r2, #0x30
    bl func_02094500
    ldr r0, _LIT2
    ldr r2, [r4, #0x18]
    mov r1, r5
    str r2, [r1, #0x4]
    ldr ip, [r4, #0x1c]
    mov r2, #0x0
    ldr r3, _LIT3
    ldr r0, [r0]
    str ip, [r1, #0x8]
    str r3, [r1, #0x10]
    str r2, [r1, #0x14]
    str r2, [r1, #0x18]
    str r0, [r1, #0x2c]
    ldr r0, [r4, #0x24]
    cmp r0, #0x0
    strne r0, [r5, #0x20]
    moveq r0, #0x4000
    streq r0, [r5, #0x20]
    ldr r0, [r4, #0x28]
    cmp r0, #0x0
    strne r0, [r5, #0x1c]
    bne .L_94
    ldr r1, _LIT0
    ldr r0, [r5, #0x20]
    ldr r1, [r1]
    ldr r1, [r1, #0x18]
    blx r1
    str r0, [r5, #0x1c]
.L_94:
    ldr r0, [r4, #0x30]
    ldr ip, [r4, #0x34]
    cmp r0, #0x0
    moveq r0, #0x240
    cmp ip, #0x0
    sub r2, r0, #0x28
    moveq ip, #0x10c0
    add r0, ip, ip, lsr #0x1f
    str r2, [r5, #0x24]
    ldr r1, _LIT4
    mov r3, r0, asr #0x1
    ldr r0, _LIT5
    mov r2, #0x0
    strh ip, [r1, #0x2]
    strh r3, [r1, #0x4]
    str r2, [r0]
    ldr r0, [r4]
    cmp r0, #0x0
    beq .L_108
    ldr r0, _LIT6
    mov r1, #0x1
    str r1, [r0]
    ldr r1, _LIT7
    str r2, [r5]
    ldr r0, _LIT8
    str r1, [r5, #0xc]
    ldr r0, [r0]
    str r0, [r5, #0x28]
    b .L_120
.L_108:
    ldr r0, _LIT6
    mov r1, #0x1
    str r2, [r0]
    ldr r0, _LIT9
    str r1, [r5]
    str r0, [r5, #0xc]
.L_120:
    ldr r0, [r4, #0x2c]
    cmp r0, #0x0
    moveq r0, #0xb
    bl func_02073fa0
    ldr r0, _LIT10
    bl func_0207cad4
    ldr r0, _LIT11
    bl func_0207403c
    mov r0, r5
    bl func_020740ac
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word data_0219ebf8
_LIT1: .word data_0219ec0c
_LIT2: .word data_0219ebfc
_LIT3: .word func_0206ba3c
_LIT4: .word data_02101d84
_LIT5: .word data_0219ee3c
_LIT6: .word data_0219ec04
_LIT7: .word func_0206ba60
_LIT8: .word data_0219ec00
_LIT9: .word func_0206ba78
_LIT10: .word func_02073974
_LIT11: .word func_0206db48
