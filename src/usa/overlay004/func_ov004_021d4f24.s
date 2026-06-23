; func_ov004_021d4f24 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov004_0220b2a0
        .extern data_ov004_0220e2a0
        .extern func_02032638
        .extern func_02033720
        .extern func_020337ac
        .extern func_020337b8
        .global func_ov004_021d4f24
        .arm
func_ov004_021d4f24:
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
    bl func_02032638
    mov r1, #0x2
    bl func_02033720
    str r0, [r5, #0x258]
.L_23c:
    ldr r0, _LIT0
    ldr r4, _LIT1
    ldr r0, [r0, #0xc90]
    cmp r0, #0x0
    ldrne r0, [r4, #0x48]
    cmpne r0, #0x1
    bne .L_268
    bl func_02032638
    bl func_020337ac
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
.L_268:
    ldr r0, [r5, #0x258]
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_02032638
    ldr r0, [r0, #0xeac]
    tst r0, #0x1000
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_02032638
    ldr r0, [r0, #0xeac]
    tst r0, #0x2000
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x1
    bne .L_2d4
    bl func_02032638
    mov r1, #0x1
    bl func_020337b8
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
_LIT0: .word data_ov004_0220e2a0
_LIT1: .word data_ov004_0220b2a0
