; func_ov011_021d2428 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Copy32
        .extern Fill32
        .extern Task_InvokeLocked
        .extern Task_PostLocked
        .extern data_ov011_021d480c
        .extern func_ov011_021d20e8
        .extern func_ov011_021d2118
        .global func_ov011_021d2428
        .arm
func_ov011_021d2428:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x88
    ldr r6, _LIT0
    mov r5, r1
    mov r4, r2
    add r1, sp, #0x24
    add r2, sp, #0x20
    mov r0, r6
    bl func_ov011_021d2118
    ldr r0, [r4]
    cmp r0, #0x0
    beq .L_1d4
    bl Task_InvokeLocked
    mov r0, #0x0
    str r0, [r4]
.L_1d4:
    mov r0, #0x60
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    str r0, [r4]
    mov r0, #0x8
    str r0, [r4, #0x8]
    mov r0, #0x0
    str r0, [r4, #0x4]
    ldr r1, [r4]
    cmp r1, #0x0
    beq .L_21c
    ldr r3, [r4, #0x8]
    mov r2, #0xc
    mul r2, r3, r2
    bl Fill32
    mov r0, #0x0
    str r0, [r4, #0x4]
.L_21c:
    ldr r0, [sp, #0x24]
    ldrsh r1, [r5]
    sub r0, r0, #0x1
    cmp r1, r0
    bge .L_500
    ldrsh r2, [r5, #0x2]
    mov r0, r6
    add r1, r1, #0x1
    bl func_ov011_021d20e8
    cmp r0, #0x0
    bne .L_310
    ldrsh r3, [r5]
    ldrsh r2, [r5, #0x2]
    ldmib r4, {r0, r1}
    add r3, r3, #0x1
    strh r3, [sp, #0x7c]
    strh r2, [sp, #0x7e]
    cmp r0, r1
    blt .L_2c0
    mov r7, r1, lsl #0x1
    mov r0, #0xc
    mul r9, r7, r0
    ldr r8, [r4]
    mov r0, r9
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    str r0, [r4]
    mov r1, r0
    mov r2, r9
    mov r0, #0x0
    bl Fill32
    ldr r1, [r4, #0x8]
    mov r0, #0xc
    mul r2, r1, r0
    ldr r1, [r4]
    mov r0, r8
    bl Copy32
    mov r0, r8
    bl Task_InvokeLocked
    str r7, [r4, #0x8]
.L_2c0:
    ldr r3, [r4, #0x4]
    ldrh r2, [sp, #0x7c]
    mov r0, #0xc
    ldrh r1, [sp, #0x7e]
    strh r2, [sp, #0x1c]
    mul r2, r3, r0
    strh r1, [sp, #0x1e]
    ldr r3, [r4]
    ldrsh r1, [sp, #0x1c]
    ldrsh r0, [sp, #0x1e]
    add r7, r3, r2
    strh r1, [r3, r2]
    ldr r1, [sp, #0x80]
    strh r0, [r7, #0x2]
    ldr r0, [sp, #0x84]
    str r1, [r7, #0x4]
    str r0, [r7, #0x8]
    ldr r0, [r4, #0x4]
    add r0, r0, #0x1
    str r0, [r4, #0x4]
.L_310:
    ldrsh r2, [r5, #0x2]
    cmp r2, #0x0
    ble .L_404
    ldrsh r1, [r5]
    mov r0, r6
    sub r2, r2, #0x1
    add r1, r1, #0x1
    bl func_ov011_021d20e8
    cmp r0, #0x0
    bne .L_404
    ldrsh r3, [r5]
    ldrsh r2, [r5, #0x2]
    ldmib r4, {r0, r1}
    add r3, r3, #0x1
    sub r2, r2, #0x1
    strh r3, [sp, #0x70]
    strh r2, [sp, #0x72]
    cmp r0, r1
    blt .L_3b4
    mov r7, r1, lsl #0x1
    mov r0, #0xc
    mul r9, r7, r0
    ldr r8, [r4]
    mov r0, r9
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    str r0, [r4]
    mov r1, r0
    mov r2, r9
    mov r0, #0x0
    bl Fill32
    ldr r1, [r4, #0x8]
    mov r0, #0xc
    mul r2, r1, r0
    ldr r1, [r4]
    mov r0, r8
    bl Copy32
    mov r0, r8
    bl Task_InvokeLocked
    str r7, [r4, #0x8]
.L_3b4:
    ldr r3, [r4, #0x4]
    ldrh r2, [sp, #0x70]
    mov r0, #0xc
    ldrh r1, [sp, #0x72]
    strh r2, [sp, #0x18]
    mul r2, r3, r0
    strh r1, [sp, #0x1a]
    ldr r3, [r4]
    ldrsh r1, [sp, #0x18]
    ldrsh r0, [sp, #0x1a]
    add r7, r3, r2
    strh r1, [r3, r2]
    ldr r1, [sp, #0x74]
    strh r0, [r7, #0x2]
    ldr r0, [sp, #0x78]
    str r1, [r7, #0x4]
    str r0, [r7, #0x8]
    ldr r0, [r4, #0x4]
    add r0, r0, #0x1
    str r0, [r4, #0x4]
.L_404:
    ldr r0, [sp, #0x20]
    ldrsh r2, [r5, #0x2]
    sub r0, r0, #0x1
    cmp r2, r0
    bge .L_500
    ldrsh r1, [r5]
    mov r0, r6
    add r2, r2, #0x1
    add r1, r1, #0x1
    bl func_ov011_021d20e8
    cmp r0, #0x0
    bne .L_500
    ldrsh r3, [r5]
    ldrsh r2, [r5, #0x2]
    ldmib r4, {r0, r1}
    add r3, r3, #0x1
    add r2, r2, #0x1
    strh r3, [sp, #0x64]
    strh r2, [sp, #0x66]
    cmp r0, r1
    blt .L_4b0
    mov r7, r1, lsl #0x1
    mov r0, #0xc
    mul r9, r7, r0
    ldr r8, [r4]
    mov r0, r9
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    str r0, [r4]
    mov r1, r0
    mov r2, r9
    mov r0, #0x0
    bl Fill32
    ldr r1, [r4, #0x8]
    mov r0, #0xc
    mul r2, r1, r0
    ldr r1, [r4]
    mov r0, r8
    bl Copy32
    mov r0, r8
    bl Task_InvokeLocked
    str r7, [r4, #0x8]
.L_4b0:
    ldr r3, [r4, #0x4]
    ldrh r2, [sp, #0x64]
    mov r0, #0xc
    ldrh r1, [sp, #0x66]
    strh r2, [sp, #0x14]
    mul r2, r3, r0
    strh r1, [sp, #0x16]
    ldr r3, [r4]
    ldrsh r1, [sp, #0x14]
    ldrsh r0, [sp, #0x16]
    add r7, r3, r2
    strh r1, [r3, r2]
    ldr r1, [sp, #0x68]
    strh r0, [r7, #0x2]
    ldr r0, [sp, #0x6c]
    str r1, [r7, #0x4]
    str r0, [r7, #0x8]
    ldr r0, [r4, #0x4]
    add r0, r0, #0x1
    str r0, [r4, #0x4]
.L_500:
    ldrsh r1, [r5]
    cmp r1, #0x0
    ble .L_7dc
    ldrsh r2, [r5, #0x2]
    mov r0, r6
    sub r1, r1, #0x1
    bl func_ov011_021d20e8
    cmp r0, #0x0
    bne .L_5ec
    ldrsh r3, [r5]
    ldrsh r2, [r5, #0x2]
    ldmib r4, {r0, r1}
    sub r3, r3, #0x1
    strh r3, [sp, #0x58]
    strh r2, [sp, #0x5a]
    cmp r0, r1
    blt .L_59c
    mov r7, r1, lsl #0x1
    mov r0, #0xc
    mul r9, r7, r0
    ldr r8, [r4]
    mov r0, r9
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    str r0, [r4]
    mov r1, r0
    mov r2, r9
    mov r0, #0x0
    bl Fill32
    ldr r1, [r4, #0x8]
    mov r0, #0xc
    mul r2, r1, r0
    ldr r1, [r4]
    mov r0, r8
    bl Copy32
    mov r0, r8
    bl Task_InvokeLocked
    str r7, [r4, #0x8]
.L_59c:
    ldr r3, [r4, #0x4]
    ldrh r2, [sp, #0x58]
    mov r0, #0xc
    ldrh r1, [sp, #0x5a]
    strh r2, [sp, #0x10]
    mul r2, r3, r0
    strh r1, [sp, #0x12]
    ldr r3, [r4]
    ldrsh r1, [sp, #0x10]
    ldrsh r0, [sp, #0x12]
    add r7, r3, r2
    strh r1, [r3, r2]
    ldr r1, [sp, #0x5c]
    strh r0, [r7, #0x2]
    ldr r0, [sp, #0x60]
    str r1, [r7, #0x4]
    str r0, [r7, #0x8]
    ldr r0, [r4, #0x4]
    add r0, r0, #0x1
    str r0, [r4, #0x4]
.L_5ec:
    ldrsh r2, [r5, #0x2]
    cmp r2, #0x0
    ble .L_6e0
    ldrsh r1, [r5]
    mov r0, r6
    sub r2, r2, #0x1
    sub r1, r1, #0x1
    bl func_ov011_021d20e8
    cmp r0, #0x0
    bne .L_6e0
    ldrsh r3, [r5]
    ldrsh r2, [r5, #0x2]
    ldmib r4, {r0, r1}
    sub r3, r3, #0x1
    sub r2, r2, #0x1
    strh r3, [sp, #0x4c]
    strh r2, [sp, #0x4e]
    cmp r0, r1
    blt .L_690
    mov r7, r1, lsl #0x1
    mov r0, #0xc
    mul r9, r7, r0
    ldr r8, [r4]
    mov r0, r9
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    str r0, [r4]
    mov r1, r0
    mov r2, r9
    mov r0, #0x0
    bl Fill32
    ldr r1, [r4, #0x8]
    mov r0, #0xc
    mul r2, r1, r0
    ldr r1, [r4]
    mov r0, r8
    bl Copy32
    mov r0, r8
    bl Task_InvokeLocked
    str r7, [r4, #0x8]
.L_690:
    ldr r3, [r4, #0x4]
    ldrh r2, [sp, #0x4c]
    mov r0, #0xc
    ldrh r1, [sp, #0x4e]
    strh r2, [sp, #0xc]
    mul r2, r3, r0
    strh r1, [sp, #0xe]
    ldr r3, [r4]
    ldrsh r1, [sp, #0xc]
    ldrsh r0, [sp, #0xe]
    add r7, r3, r2
    strh r1, [r3, r2]
    ldr r1, [sp, #0x50]
    strh r0, [r7, #0x2]
    ldr r0, [sp, #0x54]
    str r1, [r7, #0x4]
    str r0, [r7, #0x8]
    ldr r0, [r4, #0x4]
    add r0, r0, #0x1
    str r0, [r4, #0x4]
.L_6e0:
    ldr r0, [sp, #0x20]
    ldrsh r2, [r5, #0x2]
    sub r0, r0, #0x1
    cmp r2, r0
    bge .L_7dc
    ldrsh r1, [r5]
    mov r0, r6
    add r2, r2, #0x1
    sub r1, r1, #0x1
    bl func_ov011_021d20e8
    cmp r0, #0x0
    bne .L_7dc
    ldrsh r3, [r5]
    ldrsh r2, [r5, #0x2]
    ldmib r4, {r0, r1}
    sub r3, r3, #0x1
    add r2, r2, #0x1
    strh r3, [sp, #0x40]
    strh r2, [sp, #0x42]
    cmp r0, r1
    blt .L_78c
    mov r7, r1, lsl #0x1
    mov r0, #0xc
    mul r9, r7, r0
    ldr r8, [r4]
    mov r0, r9
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    str r0, [r4]
    mov r1, r0
    mov r2, r9
    mov r0, #0x0
    bl Fill32
    ldr r1, [r4, #0x8]
    mov r0, #0xc
    mul r2, r1, r0
    ldr r1, [r4]
    mov r0, r8
    bl Copy32
    mov r0, r8
    bl Task_InvokeLocked
    str r7, [r4, #0x8]
.L_78c:
    ldr r3, [r4, #0x4]
    ldrh r2, [sp, #0x40]
    mov r0, #0xc
    ldrh r1, [sp, #0x42]
    strh r2, [sp, #0x8]
    mul r2, r3, r0
    strh r1, [sp, #0xa]
    ldr r3, [r4]
    ldrsh r1, [sp, #0x8]
    ldrsh r0, [sp, #0xa]
    add r7, r3, r2
    strh r1, [r3, r2]
    ldr r1, [sp, #0x44]
    strh r0, [r7, #0x2]
    ldr r0, [sp, #0x48]
    str r1, [r7, #0x4]
    str r0, [r7, #0x8]
    ldr r0, [r4, #0x4]
    add r0, r0, #0x1
    str r0, [r4, #0x4]
.L_7dc:
    ldrsh r2, [r5, #0x2]
    cmp r2, #0x0
    ble .L_8c8
    ldrsh r1, [r5]
    mov r0, r6
    sub r2, r2, #0x1
    bl func_ov011_021d20e8
    cmp r0, #0x0
    bne .L_8c8
    ldrsh r2, [r5, #0x2]
    ldrsh r3, [r5]
    ldmib r4, {r0, r1}
    sub r2, r2, #0x1
    strh r3, [sp, #0x34]
    strh r2, [sp, #0x36]
    cmp r0, r1
    blt .L_878
    mov r7, r1, lsl #0x1
    mov r0, #0xc
    mul r9, r7, r0
    ldr r8, [r4]
    mov r0, r9
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    str r0, [r4]
    mov r1, r0
    mov r2, r9
    mov r0, #0x0
    bl Fill32
    ldr r1, [r4, #0x8]
    mov r0, #0xc
    mul r2, r1, r0
    ldr r1, [r4]
    mov r0, r8
    bl Copy32
    mov r0, r8
    bl Task_InvokeLocked
    str r7, [r4, #0x8]
.L_878:
    ldr r3, [r4, #0x4]
    ldrh r2, [sp, #0x34]
    mov r0, #0xc
    ldrh r1, [sp, #0x36]
    strh r2, [sp, #0x4]
    mul r2, r3, r0
    strh r1, [sp, #0x6]
    ldr r3, [r4]
    ldrsh r1, [sp, #0x4]
    ldrsh r0, [sp, #0x6]
    add r7, r3, r2
    strh r1, [r3, r2]
    ldr r1, [sp, #0x38]
    strh r0, [r7, #0x2]
    ldr r0, [sp, #0x3c]
    str r1, [r7, #0x4]
    str r0, [r7, #0x8]
    ldr r0, [r4, #0x4]
    add r0, r0, #0x1
    str r0, [r4, #0x4]
.L_8c8:
    ldr r0, [sp, #0x20]
    ldrsh r2, [r5, #0x2]
    sub r0, r0, #0x1
    cmp r2, r0
    bge .L_9bc
    ldrsh r1, [r5]
    mov r0, r6
    add r2, r2, #0x1
    bl func_ov011_021d20e8
    cmp r0, #0x0
    bne .L_9bc
    ldrsh r2, [r5, #0x2]
    ldrsh r3, [r5]
    ldmib r4, {r0, r1}
    add r2, r2, #0x1
    strh r3, [sp, #0x28]
    strh r2, [sp, #0x2a]
    cmp r0, r1
    blt .L_96c
    mov r6, r1, lsl #0x1
    mov r0, #0xc
    mul r7, r6, r0
    ldr r5, [r4]
    mov r0, r7
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    str r0, [r4]
    mov r1, r0
    mov r2, r7
    mov r0, #0x0
    bl Fill32
    ldr r1, [r4, #0x8]
    mov r0, #0xc
    mul r2, r1, r0
    ldr r1, [r4]
    mov r0, r5
    bl Copy32
    mov r0, r5
    bl Task_InvokeLocked
    str r6, [r4, #0x8]
.L_96c:
    ldr r3, [r4, #0x4]
    ldrh r2, [sp, #0x28]
    mov r0, #0xc
    ldrh r1, [sp, #0x2a]
    strh r2, [sp]
    mul r2, r3, r0
    strh r1, [sp, #0x2]
    ldr r3, [r4]
    ldrsh r1, [sp]
    ldrsh r0, [sp, #0x2]
    add r5, r3, r2
    strh r1, [r3, r2]
    ldr r1, [sp, #0x2c]
    strh r0, [r5, #0x2]
    ldr r0, [sp, #0x30]
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x4]
    add r0, r0, #0x1
    str r0, [r4, #0x4]
.L_9bc:
    mov r0, #0x1
    add sp, sp, #0x88
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov011_021d480c
