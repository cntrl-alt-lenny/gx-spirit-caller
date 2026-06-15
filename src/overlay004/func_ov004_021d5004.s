; func_ov004_021d5004 - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov004_0220b500
        .extern data_ov004_0220e500
        .extern func_0203268c
        .extern func_02033770
        .extern func_020337fc
        .extern func_02033808
        .global func_ov004_021d5004
        .arm
func_ov004_021d5004:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x38]
    cmp r0, #0x0
    mov r0, #0x0
    strne r0, [r5, #0x38]
    movne r0, #0x1
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r5, #0x258]
    ldr r0, [r5, #0x258]
    cmp r0, #0x0
    bne .L_23c
    bl func_0203268c
    mov r1, #0x2
    bl func_02033770
    str r0, [r5, #0x258]
.L_23c:
    ldr r0, _LIT0
    ldr r4, _LIT1
    ldr r0, [r0, #0xc90]
    cmp r0, #0x0
    ldrne r0, [r4, #0x48]
    cmpne r0, #0x1
    bne .L_268
    bl func_0203268c
    bl func_020337fc
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
.L_268:
    ldr r0, [r5, #0x258]
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_0203268c
    ldr r0, [r0, #0xeb4]
    tst r0, #0x1000
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_0203268c
    ldr r0, [r0, #0xeb4]
    tst r0, #0x2000
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x1
    bne .L_2d4
    bl func_0203268c
    mov r1, #0x1
    bl func_02033808
    mov r0, #0x20
    str r0, [r5, #0x30]
    mov r0, #0x1
    str r0, [r5, #0x38]
    mov r0, #0x0
    str r0, [r5, #0x3c]
    ldmia sp!, {r3, r4, r5, pc}
.L_2d4:
    ldr r0, [r4, #0x48]
    cmp r0, #0x1
    bne .L_2fc
    mov r0, #0x18
    str r0, [r5, #0x30]
    mov r0, #0x1
    str r0, [r5, #0x38]
    mov r0, #0x0
    str r0, [r5, #0x3c]
    ldmia sp!, {r3, r4, r5, pc}
.L_2fc:
    mov r0, #0x1d
    str r0, [r5, #0x30]
    mov r0, #0x1
    str r0, [r5, #0x38]
    mov r0, #0x0
    str r0, [r5, #0x3c]
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov004_0220e500
_LIT1: .word data_ov004_0220b500
