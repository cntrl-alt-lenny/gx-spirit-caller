; func_ov014_021b3b20 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov014_021b4d34
        .extern data_ov014_021b4d54
        .extern data_ov014_021b4d74
        .extern data_ov014_021b4d94
        .extern data_ov014_021b4db4
        .extern data_ov014_021b4dd4
        .extern data_ov014_021b4df4
        .extern data_ov014_021b4e14
        .extern data_ov014_021b4e34
        .extern data_ov014_021b4e54
        .extern data_ov014_021b4e74
        .extern data_ov014_021b4e94
        .extern data_ov014_021b4eb4
        .extern data_ov014_021b4ed4
        .extern data_ov014_021b4ef4
        .extern data_ov014_021b4f14
        .extern data_ov014_02234fe0
        .extern data_ov014_02234ff4
        .extern func_020057e4
        .extern func_0201e78c
        .extern func_0201ef3c
        .extern OS_SPrintf
        .extern func_02094410
        .extern func_ov014_021b3a9c
        .global func_ov014_021b3b20
        .arm
func_ov014_021b3b20:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x128
    ldr r1, _LIT0
    mov r4, r0
    mov r0, #0x0
    str r0, [r1, #0x4]
    str r0, [r1]
    ldr r1, [r4]
    cmp r1, #0x0
    bne .L_74
    ldr r1, _LIT1
    mov r2, #0x5c
    bl func_02094410
    ldrh r0, [r4, #0x54]
    bic r0, r0, #0xff
    orr r0, r0, #0x1
    strh r0, [r4, #0x54]
    ldrh r0, [r4, #0x54]
    bic r0, r0, #0xff00
    orr r0, r0, #0x100
    strh r0, [r4, #0x54]
    ldrh r0, [r4, #0x56]
    bic r0, r0, #0xff
    orr r0, r0, #0x1
    strh r0, [r4, #0x56]
    ldrh r0, [r4, #0x56]
    bic r0, r0, #0xff00
    orr r0, r0, #0x100
    strh r0, [r4, #0x56]
.L_74:
    mov r0, #0x1
    str r0, [r4]
    ldrh r2, [r4, #0x54]
    ldr r1, _LIT2
    add r0, sp, #0x28
    mov r2, r2, lsl #0x18
    mov r2, r2, lsr #0x18
    bl OS_SPrintf
    ldrh r2, [r4, #0x54]
    ldr r1, _LIT3
    add r0, sp, #0x68
    mov r2, r2, lsl #0x18
    mov r2, r2, lsr #0x18
    bl OS_SPrintf
    ldrh r2, [r4, #0x54]
    ldr r1, _LIT4
    add r0, sp, #0xa8
    mov r2, r2, lsl #0x18
    mov r2, r2, lsr #0x18
    bl OS_SPrintf
    ldrh r2, [r4, #0x54]
    ldr r1, _LIT5
    add r0, sp, #0xe8
    mov r2, r2, lsl #0x18
    mov r2, r2, lsr #0x18
    bl OS_SPrintf
    add r2, sp, #0x28
    mov r1, #0x0
    add r0, sp, #0x18
.L_e8:
    str r2, [r0, r1, lsl #0x2]
    add r1, r1, #0x1
    cmp r1, #0x4
    add r2, r2, #0x40
    blt .L_e8
    bl func_0201e78c
    mov r3, #0x0
    str r3, [sp]
    mov r1, #0x1
    add r0, sp, #0x18
    str r1, [sp, #0x4]
    str r0, [sp, #0x8]
    str r1, [sp, #0xc]
    mov r0, #0x200
    str r0, [sp, #0x10]
    add r0, r4, #0x10
    str r0, [sp, #0x14]
    add r0, r4, #0x4
    add r1, r4, #0x8
    add r2, r4, #0xc
    bl func_0201ef3c
    ldrh r2, [r4, #0x54]
    ldr r1, _LIT6
    add r0, sp, #0x28
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x18
    bl OS_SPrintf
    ldrh r2, [r4, #0x54]
    ldr r1, _LIT7
    add r0, sp, #0x68
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x18
    bl OS_SPrintf
    ldrh r2, [r4, #0x54]
    ldr r1, _LIT8
    add r0, sp, #0xa8
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x18
    bl OS_SPrintf
    ldrh r2, [r4, #0x54]
    ldr r1, _LIT9
    add r0, sp, #0xe8
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x18
    bl OS_SPrintf
    mov r1, #0x0
    add r2, sp, #0x28
    add r0, sp, #0x18
.L_1a8:
    str r2, [r0, r1, lsl #0x2]
    add r1, r1, #0x1
    cmp r1, #0x4
    add r2, r2, #0x40
    blt .L_1a8
    bl func_0201e78c
    mov r2, #0x200
    str r2, [sp]
    mov r1, #0x1
    add r0, sp, #0x18
    str r1, [sp, #0x4]
    str r0, [sp, #0x8]
    str r1, [sp, #0xc]
    str r2, [sp, #0x10]
    add ip, r4, #0x24
    add r0, r4, #0x18
    add r1, r4, #0x1c
    add r2, r4, #0x20
    mov r3, #0x6000
    str ip, [sp, #0x14]
    bl func_0201ef3c
    ldr r1, _LIT10
    add r0, sp, #0x28
    bl OS_SPrintf
    ldr r1, _LIT11
    add r0, sp, #0x68
    bl OS_SPrintf
    ldr r1, _LIT12
    add r0, sp, #0xa8
    bl OS_SPrintf
    ldr r1, _LIT13
    add r0, sp, #0xe8
    bl OS_SPrintf
    ldrh r0, [r4, #0x56]
    mov r1, #0x0
    add r2, sp, #0x28
    bic r0, r0, #0xff
    orr r0, r0, #0x1
    strh r0, [r4, #0x56]
    add r0, sp, #0x18
.L_248:
    str r2, [r0, r1, lsl #0x2]
    add r1, r1, #0x1
    cmp r1, #0x4
    add r2, r2, #0x40
    blt .L_248
    bl func_0201e78c
    mov r0, #0x400
    str r0, [sp]
    mov r1, #0x1
    add r0, sp, #0x18
    str r1, [sp, #0x4]
    str r0, [sp, #0x8]
    str r1, [sp, #0xc]
    mov r0, #0x200
    str r0, [sp, #0x10]
    add ip, r4, #0x38
    add r0, r4, #0x2c
    add r1, r4, #0x30
    add r2, r4, #0x34
    mov r3, #0xa000
    str ip, [sp, #0x14]
    bl func_0201ef3c
    ldr r1, _LIT14
    add r0, sp, #0x28
    bl OS_SPrintf
    ldr r1, _LIT15
    add r0, sp, #0x68
    bl OS_SPrintf
    ldr r1, _LIT16
    add r0, sp, #0xa8
    bl OS_SPrintf
    ldr r1, _LIT17
    add r0, sp, #0xe8
    bl OS_SPrintf
    ldrh r0, [r4, #0x56]
    mov r1, #0x0
    add r2, sp, #0x28
    bic r0, r0, #0xff00
    orr r0, r0, #0x100
    strh r0, [r4, #0x56]
    add r0, sp, #0x18
.L_2ec:
    str r2, [r0, r1, lsl #0x2]
    add r1, r1, #0x1
    cmp r1, #0x4
    add r2, r2, #0x40
    blt .L_2ec
    bl func_0201e78c
    mov r0, #0x600
    str r0, [sp]
    mov r1, #0x1
    add r0, sp, #0x18
    str r1, [sp, #0x4]
    str r0, [sp, #0x8]
    str r1, [sp, #0xc]
    mov r0, #0x200
    str r0, [sp, #0x10]
    add ip, r4, #0x4c
    add r0, r4, #0x40
    add r1, r4, #0x44
    add r2, r4, #0x48
    mov r3, #0x12000
    str ip, [sp, #0x14]
    bl func_0201ef3c
    ldr r0, _LIT18
    bl func_020057e4
    mov r0, #0x1
    add sp, sp, #0x128
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov014_02234fe0
_LIT1: .word data_ov014_02234ff4
_LIT2: .word data_ov014_021b4d34
_LIT3: .word data_ov014_021b4d54
_LIT4: .word data_ov014_021b4d74
_LIT5: .word data_ov014_021b4d94
_LIT6: .word data_ov014_021b4db4
_LIT7: .word data_ov014_021b4dd4
_LIT8: .word data_ov014_021b4df4
_LIT9: .word data_ov014_021b4e14
_LIT10: .word data_ov014_021b4e34
_LIT11: .word data_ov014_021b4e54
_LIT12: .word data_ov014_021b4e74
_LIT13: .word data_ov014_021b4e94
_LIT14: .word data_ov014_021b4eb4
_LIT15: .word data_ov014_021b4ed4
_LIT16: .word data_ov014_021b4ef4
_LIT17: .word data_ov014_021b4f14
_LIT18: .word func_ov014_021b3a9c
