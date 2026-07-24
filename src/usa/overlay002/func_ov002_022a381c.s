; func_ov002_022a381c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103fcc
        .extern data_ov002_022cbd80
        .extern data_ov002_022cbd98
        .extern data_ov002_022cbdb0
        .extern data_ov002_022cbdc8
        .extern data_ov002_022d0ed4
        .extern data_ov002_022d0ee4
        .extern func_02006bf0
        .extern func_02006e00
        .extern func_0201d428
        .extern func_0201e564
        .extern func_0208b008
        .extern func_0208c7e4
        .extern func_0208ce5c
        .extern func_0208ce70
        .extern func_0208d944
        .extern func_0208df2c
        .extern func_0208e038
        .extern G2x_SetBGyAffine_
        .extern OS_SPrintf
        .extern func_02094410
        .extern func_ov002_022a567c
        .global func_ov002_022a381c
        .arm
func_ov002_022a381c:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x60
    ldr r1, _LIT0
    mov r2, #0x0
    ldr r1, [r1, #0xb88]
    cmp r1, #0x2
    bne .L_44
    ldr r0, _LIT1
    mov r1, #0x4
    bl func_02006bf0
    mov r4, r0
    ldr r0, _LIT2
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
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
    bl func_02006bf0
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
    bl func_02006bf0
    mov r5, r0
    b .L_ac
.L_9c:
    mov r1, #0x2
    bl func_ov002_022a567c
    add sp, sp, #0x60
    ldmia sp!, {r3, r4, r5, pc}
.L_ac:
    bl func_0208ce70
    bl func_0208ce5c
    mov r0, #0x60
    bl func_0208d944
    mov r0, #0x1
    mov r2, r0
    mov r1, #0x5
    bl func_0208c7e4
    ldr r1, _LIT5
    ldrh r0, [r1]
    bic r0, r0, #0x3
    orr r0, r0, #0x1
    strh r0, [r1]
    ldrh r0, [r1]
    and r0, r0, #0x43
    orr r0, r0, #0x4700
    strh r0, [r1]
    bl func_0208e038
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x800
    bl func_02094410
    ldr r1, _LIT6
    ldrh r0, [r1]
    bic r0, r0, #0x3
    strh r0, [r1]
    ldrh r0, [r1]
    and r0, r0, #0x43
    orr r0, r0, #0x304
    orr r0, r0, #0x4c00
    strh r0, [r1]
    bl func_0208df2c
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x800
    bl func_02094410
    add r0, sp, #0x18
    bl func_0201d428
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
    bl func_0201e564
    add r0, sp, #0x18
    bl func_0201d428
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
    bl func_0201e564
    mov r0, r4
    bl func_02006e00
    mov r0, r5
    bl func_02006e00
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
    bl func_0208b008
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
_LIT0: .word data_02103fcc
_LIT1: .word data_ov002_022cbd80
_LIT2: .word data_ov002_022cbd98
_LIT3: .word data_ov002_022cbdb0
_LIT4: .word data_ov002_022cbdc8
_LIT5: .word 0x0400000c
_LIT6: .word 0x0400000e
_LIT7: .word data_ov002_022d0ed4
_LIT8: .word data_ov002_022d0ee4
