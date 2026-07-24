; func_ov016_021b8608 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_InvokeLocked
        .extern data_ov016_021b92ac
        .extern data_ov016_021b92f8
        .extern data_ov016_021b9318
        .extern data_ov016_021b9338
        .extern data_ov016_021b9358
        .extern data_ov016_021bb044
        .extern data_ov016_021bb050
        .extern func_0201e78c
        .extern func_0201ed90
        .extern func_0201eee8
        .extern func_0201ef3c
        .extern OS_SPrintf
        .extern func_ov016_021b87e0
        .extern func_ov016_021b88c4
        .extern func_ov016_021b89a4
        .extern func_ov016_021b8a88
        .extern func_ov016_021b8b6c
        .global func_ov016_021b8608
        .arm
func_ov016_021b8608:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x1c
    mov r4, r1
    ldr r1, [r4, #0x44]
    mov r5, r0
    cmp r1, #0x0
    beq .L_1094
    mov r8, #0x0
    ldr r7, _LIT0
    mov r6, r8
.L_fd0:
    ldr r0, [r7, r8, lsl #0x2]
    cmp r0, #0x0
    beq .L_fe0
    bl Task_InvokeLocked
.L_fe0:
    str r6, [r7, r8, lsl #0x2]
    add r8, r8, #0x1
    cmp r8, #0x5
    blt .L_fd0
    ldr r0, [r4, #0x44]
    add r2, r5, #0x100
    and r0, r0, #0x1f
    strb r0, [r5, #0x1cc]
    ldr r0, [r4, #0x44]
    ldr r1, _LIT1
    and r0, r0, #0x3e0
    mov r0, r0, lsr #0x5
    strb r0, [r5, #0x1cd]
    ldr r3, [r4, #0x44]
    mov r0, r5
    and r3, r3, #0x7c00
    mov r3, r3, lsr #0xa
    strb r3, [r5, #0x1ce]
    ldr r3, [r4, #0x44]
    and r3, r3, #0xf8000
    mov r3, r3, lsr #0xf
    strb r3, [r5, #0x1cf]
    ldr r3, [r4, #0x44]
    and r3, r3, #0x1f00000
    mov r3, r3, lsr #0x14
    strh r3, [r2, #0xd0]
    ldr r2, [r4, #0x44]
    and r2, r2, #0x7e000000
    mov r2, r2, lsr #0x19
    str r2, [r5, #0x1d4]
    bl func_ov016_021b88c4
    ldr r1, _LIT1
    mov r0, r5
    bl func_ov016_021b87e0
    ldr r1, _LIT1
    mov r0, r5
    bl func_ov016_021b89a4
    ldr r1, _LIT1
    mov r0, r5
    bl func_ov016_021b8a88
    ldr r1, _LIT1
    mov r0, r5
    bl func_ov016_021b8b6c
    add sp, sp, #0x1c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_1094:
    ldr r0, _LIT2
    ldr r1, _LIT3
    ldr r0, [r0]
    bl OS_SPrintf
    ldr r0, _LIT2
    ldr r1, _LIT4
    ldr r0, [r0, #0x4]
    bl OS_SPrintf
    ldr r0, _LIT2
    ldr r1, _LIT5
    ldr r0, [r0, #0x8]
    bl OS_SPrintf
    ldr r0, _LIT2
    ldr r1, _LIT6
    ldr r0, [r0, #0xc]
    bl OS_SPrintf
    ldr r0, [r5, #0xb0]
    cmp r0, #0x0
    beq .L_10fc
    ldr r0, [r5, #0x5c]
    add r1, r5, #0x64
    add r2, r5, #0xb0
    bl func_0201eee8
    mov r0, #0x0
    str r0, [r5, #0xb4]
    str r0, [r5, #0xb0]
.L_10fc:
    bl func_0201e78c
    mov r0, #0x200
    str r0, [sp]
    mov r1, #0x1
    ldr r0, _LIT1
    str r1, [sp, #0x4]
    str r0, [sp, #0x8]
    str r1, [sp, #0xc]
    sub r0, r1, #0x2
    str r0, [sp, #0x10]
    add r4, r5, #0xb0
    add r0, r5, #0x5c
    add r1, r5, #0x60
    add r2, r5, #0x64
    mov r3, #0x6000
    str r4, [sp, #0x14]
    bl func_0201ef3c
    ldr r1, _LIT2
    add r0, sp, #0x18
    ldr r1, [r1, #0xc]
    bl func_0201ed90
    ldr r1, _LIT7
    str r0, [r1, #0x10]
    add sp, sp, #0x1c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov016_021bb050
_LIT1: .word data_ov016_021b92ac
_LIT2: .word data_ov016_021b92ac
_LIT3: .word data_ov016_021b92f8
_LIT4: .word data_ov016_021b9318
_LIT5: .word data_ov016_021b9338
_LIT6: .word data_ov016_021b9358
_LIT7: .word data_ov016_021bb044
