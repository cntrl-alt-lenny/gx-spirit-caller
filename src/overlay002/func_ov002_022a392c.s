; func_ov002_022a392c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern data_ov002_022cbe74
        .extern data_ov002_022cbe8c
        .extern data_ov002_022cbea4
        .extern data_ov002_022cbebc
        .extern data_ov002_022d0fb4
        .extern data_ov002_022d0fc4
        .extern func_02006c0c
        .extern Task_Invoke
        .extern func_0201d47c
        .extern func_0201e5b8
        .extern func_0208b0f0
        .extern func_0208c8cc
        .extern func_0208cf44
        .extern func_0208cf58
        .extern func_0208da2c
        .extern func_0208e014
        .extern func_0208e120
        .extern G2x_SetBGyAffine_
        .extern OS_SPrintf
        .extern func_02094504
        .extern func_ov002_022a57b8
        .global func_ov002_022a392c
        .arm
func_ov002_022a392c:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x60
    ldr r1, _LIT0
    mov r2, #0x0
    ldr r1, [r1, #0xb88]
    cmp r1, #0x2
    bne .L_44
    ldr r0, _LIT1
    mov r1, #0x4
    bl func_02006c0c
    mov r4, r0
    ldr r0, _LIT2
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    mov r5, r0
    b .L_ac
.L_44:
    cmp r1, #0x1
    cmpne r1, #0x2
    moveq r1, #0x1
    movne r1, #0x0
    cmp r1, #0x0
    beq .L_9c
    ldr r0, _LIT3
    mov r1, #0x4
    bl func_02006c0c
    ldr r1, _LIT0
    mov r4, r0
    ldr r2, [r1, #0xb90]
    ldr r1, _LIT4
    add r0, sp, #0x40
    add r2, r2, #0x1
    bl OS_SPrintf
    add r0, sp, #0x40
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    mov r5, r0
    b .L_ac
.L_9c:
    mov r1, #0x2
    bl func_ov002_022a57b8
    add sp, sp, #0x60
    ldmia sp!, {r3, r4, r5, pc}
.L_ac:
    bl func_0208cf58
    bl func_0208cf44
    mov r0, #0x60
    bl func_0208da2c
    mov r0, #0x1
    mov r2, r0
    mov r1, #0x5
    bl func_0208c8cc
    ldr r1, _LIT5
    ldrh r0, [r1]
    bic r0, r0, #0x3
    orr r0, r0, #0x1
    strh r0, [r1]
    ldrh r0, [r1]
    and r0, r0, #0x43
    orr r0, r0, #0x4700
    strh r0, [r1]
    bl func_0208e120
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x800
    bl func_02094504
    ldr r1, _LIT6
    ldrh r0, [r1]
    bic r0, r0, #0x3
    strh r0, [r1]
    ldrh r0, [r1]
    and r0, r0, #0x43
    orr r0, r0, #0x304
    orr r0, r0, #0x4c00
    strh r0, [r1]
    bl func_0208e014
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x800
    bl func_02094504
    add r0, sp, #0x18
    bl func_0201d47c
    mov r0, #0x0
    ldrh r1, [sp, #0x2c]
    str r0, [sp, #0x20]
    str r0, [sp, #0x24]
    bic r1, r1, #0xf
    orr r1, r1, #0x2
    strh r0, [sp, #0x28]
    add r0, sp, #0x18
    str r4, [sp, #0x18]
    strh r1, [sp, #0x2c]
    bl func_0201e5b8
    add r0, sp, #0x18
    bl func_0201d47c
    mov r0, #0x0
    ldrh r1, [sp, #0x2c]
    str r0, [sp, #0x20]
    str r0, [sp, #0x24]
    bic r1, r1, #0xf
    sub r0, r0, #0x1
    orr r1, r1, #0x3
    strh r0, [sp, #0x28]
    add r0, sp, #0x18
    str r5, [sp, #0x18]
    strh r1, [sp, #0x2c]
    bl func_0201e5b8
    mov r0, r4
    bl Task_Invoke
    mov r0, r5
    bl Task_Invoke
    mov r2, #0x0
    mov r0, #0x5000000
    strh r2, [r0]
    mov r3, #0x4000000
    ldr r2, [r3]
    mov r1, #0x800
    bic r4, r2, #0x1f00
    add r0, sp, #0x8
    mov r2, r1
    str r4, [r3]
    bl func_0208b0f0
    mov r2, #0x0
    ldr r0, _LIT7
    add r1, sp, #0x8
    str r2, [sp]
    sub r4, r2, #0x38
    mov r2, #0x80
    mov r3, #0x14
    str r4, [sp, #0x4]
    bl G2x_SetBGyAffine_
    mov r1, #0x0
    str r1, [sp]
    sub r1, r1, #0x60
    str r1, [sp, #0x4]
    ldr r0, _LIT8
    add r1, sp, #0x8
    mov r2, #0x80
    mov r3, #0x14
    bl G2x_SetBGyAffine_
    add sp, sp, #0x60
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_021040ac
_LIT1: .word data_ov002_022cbe74
_LIT2: .word data_ov002_022cbe8c
_LIT3: .word data_ov002_022cbea4
_LIT4: .word data_ov002_022cbebc
_LIT5: .word 0x0400000c
_LIT6: .word 0x0400000e
_LIT7: .word data_ov002_022d0fb4
_LIT8: .word data_ov002_022d0fc4
