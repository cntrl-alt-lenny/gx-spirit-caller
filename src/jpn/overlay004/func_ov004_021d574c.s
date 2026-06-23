; func_ov004_021d574c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103fcc
        .extern data_ov004_0220b2a0
        .extern data_ov004_02291388
        .extern func_02032638
        .extern func_02033438
        .extern func_020334f4
        .extern func_020334fc
        .extern func_02033504
        .extern func_020340c4
        .extern func_02034110
        .extern func_ov004_021ce0dc
        .extern func_ov004_021d3a94
        .extern func_ov004_021d8be4
        .global func_ov004_021d574c
        .arm
func_ov004_021d574c:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r5, r0
    ldr r0, [r5, #0x38]
    ldr r4, _LIT0
    cmp r0, #0x0
    mov r0, #0x0
    strne r0, [r5, #0x38]
    movne r0, #0x1
    cmp r0, #0x0
    beq .L_88
    bl func_02032638
    bl func_020334fc
    mov r7, r0
    bl func_02032638
    bl func_020334f4
    mov r6, r0
    mov r0, r7
    mov r1, r6
    bl func_020340c4
    str r0, [r5, #0x48]
    ldr r0, [r4, #0x64]
    cmp r0, #0x0
    beq .L_70
    ldr r0, _LIT1
    bl func_ov004_021d8be4
    mov r0, #0x0
    str r0, [r4, #0x64]
    b .L_88
.L_70:
    mov r2, #0x0
    str r2, [sp]
    ldr r3, [r5, #0x48]
    mov r0, r5
    mov r1, r6
    bl func_ov004_021d3a94
.L_88:
    ldr r0, _LIT1
    ldr r0, [r0]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, [r5, #0x48]
    bl func_02034110
    cmp r0, #0x0
    beq .L_d8
    bl func_02032638
    bl func_02033438
    mov r0, #0x29
    str r0, [r5, #0x30]
    mov r0, #0x1
    str r0, [r5, #0x38]
    mov r0, #0x0
    str r0, [r5, #0x3c]
    b .L_1c0
.L_d8:
    ldr r0, [r4, #0x4c]
    ldr r1, _LIT2
    cmp r0, #0x0
    mvneq r0, #0x0
    streq r0, [r4, #0x88]
    mvn r2, #0x0
    mov r0, #0x0
    str r2, [r1, #0xbac]
    bl func_ov004_021ce0dc
    mov r0, #0x1
    bl func_ov004_021ce0dc
    bl func_02032638
    bl func_020334fc
    cmp r0, #0x7
    addls pc, pc, r0, lsl #0x2
    b .L_1c0
    b .L_138
    b .L_154
    b .L_154
    b .L_170
    b .L_1c0
    b .L_1c0
    b .L_18c
    b .L_1a8
.L_138:
    mov r0, #0x18
    str r0, [r5, #0x30]
    mov r0, #0x1
    str r0, [r5, #0x38]
    mov r0, #0x0
    str r0, [r5, #0x3c]
    b .L_1c0
.L_154:
    mov r0, #0x18
    str r0, [r5, #0x30]
    mov r0, #0x1
    str r0, [r5, #0x38]
    mov r0, #0x0
    str r0, [r5, #0x3c]
    b .L_1c0
.L_170:
    mov r0, #0x22
    str r0, [r5, #0x30]
    mov r0, #0x1
    str r0, [r5, #0x38]
    mov r0, #0x0
    str r0, [r5, #0x3c]
    b .L_1c0
.L_18c:
    mov r0, #0x29
    str r0, [r5, #0x30]
    mov r0, #0x1
    str r0, [r5, #0x38]
    mov r0, #0x0
    str r0, [r5, #0x3c]
    b .L_1c0
.L_1a8:
    mov r0, #0x28
    str r0, [r5, #0x30]
    mov r0, #0x1
    str r0, [r5, #0x38]
    mov r0, #0x0
    str r0, [r5, #0x3c]
.L_1c0:
    bl func_02032638
    bl func_02033504
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov004_0220b2a0
_LIT1: .word data_ov004_02291388
_LIT2: .word data_02103fcc
