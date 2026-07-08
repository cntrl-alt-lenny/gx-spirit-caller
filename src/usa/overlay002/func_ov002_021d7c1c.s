; func_ov002_021d7c1c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern func_0202e274
        .extern func_0202f290
        .extern func_ov002_021babc8
        .extern func_ov002_021c2dcc
        .extern func_ov002_021d46ac
        .extern func_ov002_021e269c
        .extern func_ov002_021e2fc4
        .extern func_ov002_02244efc
        .global func_ov002_021d7c1c
        .arm
func_ov002_021d7c1c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x4
    mov r4, r1
    mov r5, r2
    mov r6, r0
    mov r0, r4
    mov r1, r5
    bl func_ov002_021c2dcc
    cmp r0, #0x0
    blt .L_1bc
    ldrh r0, [r6, #0x2]
    ldr r2, [r5]
    and r9, r4, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r4
    ldr r0, _LIT0
    mov r1, r2, lsl #0x2
    mul r8, r9, r0
    mov r3, r2, lsl #0x13
    mov r1, r1, lsr #0x18
    mov r5, r3, lsr #0x13
    movne sl, #0x1
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r6, r1, r2, lsr #0x1f
    ldr r1, _LIT1
    mov r0, r5
    moveq sl, #0x0
    ldr r7, [r1, r8]
    bl func_0202e274
    cmp r0, #0x0
    movne r0, #0xc
    moveq r0, #0xb
    mov r1, r0, lsl #0x1b
    mov r3, sl, lsl #0x10
    mov r2, r6, lsl #0x16
    orr r0, r9, #0x1c
    orr r0, r0, r2, lsr #0x10
    mov r2, r7, lsl #0x16
    orr r1, r9, r1, lsr #0x1a
    orr r1, r1, r2, lsr #0x10
    mov r2, r1, lsl #0x10
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r3, r3, lsr #0x10
    mov r0, #0x3f
    bl func_ov002_021d46ac
    mov r0, r5
    bl func_0202e274
    cmp r0, #0x0
    bne .L_1b0
    ldr r1, [sp]
    mov r0, #0x200
    bic r2, r1, #0x200
    mov r1, r4, lsl #0x1f
    orr r1, r2, r1, lsr #0x16
    rsb r0, r0, #0x0
    orr r1, r1, #0x400
    and r1, r1, r0
    and r0, r6, r0, lsr #0x17
    orr r2, r1, r0
    mov r0, r4
    mov r1, r6
    str r2, [sp]
    bl func_ov002_021e269c
    mov r0, r5
    bl func_0202f290
    cmp r0, #0x0
    beq .L_1a4
    mov r0, r4, lsl #0x1f
    ldr r1, _LIT2
    and r0, r0, #-2147483648
    add r1, r1, r8
    orr r8, r0, #0x4200000
    ldr r9, [sp]
    ldr r5, _LIT3
    add r7, r1, #0x30
    orr r8, r8, #0x30000000
    mov r6, #0x0
.L_144:
    mov r0, r4
    mov r1, r6
    mov r2, r5
    bl func_ov002_021babc8
    cmp r0, #0x0
    beq .L_194
    ldr r1, [r7]
    mov r2, r6, lsl #0x10
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    and r2, r2, #0x1f0000
    add r0, r0, r1, lsr #0x1f
    orr r3, r8, r2
    mov r1, r0, lsl #0x10
    mov r2, r9
    orr r0, r3, r5
    mov r1, r1, lsr #0x10
    bl func_ov002_021e2fc4
.L_194:
    add r6, r6, #0x1
    cmp r6, #0x4
    add r7, r7, #0x14
    ble .L_144
.L_1a4:
    ldr r1, [sp]
    mov r0, #0x1a
    bl func_ov002_02244efc
.L_1b0:
    add sp, sp, #0x4
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_1bc:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf098
_LIT2: .word data_ov002_022cf08c
_LIT3: .word 0x00001a50
