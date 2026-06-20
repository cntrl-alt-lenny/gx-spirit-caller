; func_ov002_0223a118 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd3f4
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern func_ov002_021b4120
        .extern func_ov002_021c4c9c
        .extern func_ov002_021c9dac
        .extern func_ov002_021d59cc
        .extern func_ov002_021d6c98
        .global func_ov002_0223a118
        .arm
func_ov002_0223a118:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x30
    mov r5, r0
    ldrh r4, [r5, #0x2]
    ldrh r2, [r5, #0x4]
    ldr r7, _LIT0
    mov r0, r4, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r1, r0, #0x1
    mov r6, r4, lsl #0x1a
    mul ip, r1, r7
    mov r1, r6, lsr #0x1b
    mov r6, #0x14
    ldr r3, _LIT1
    mul lr, r1, r6
    add r8, r3, ip
    add r8, r8, #0x30
    ldr r9, [r8, lr]
    mov r2, r2, lsl #0x11
    mov r8, r9, lsl #0x2
    mov r8, r8, lsr #0x18
    mov r9, r9, lsl #0x12
    mov r8, r8, lsl #0x1
    mov sl, r2, lsr #0x17
    add r2, r8, r9, lsr #0x1f
    cmp sl, r2
    addne sp, sp, #0x30
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r2, _LIT2
    add ip, r2, ip
    ldrh ip, [lr, ip]
    cmp ip, #0x0
    addeq sp, sp, #0x30
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    mov r4, r4, lsl #0x14
    mov r4, r4, lsr #0x1a
    cmp r4, #0x5
    bne .L_ec
    ldr r2, _LIT3
    bl func_ov002_021b4120
    ldrh r1, [r5, #0x2]
    and r0, r0, #0xff
    mov r1, r1, lsl #0x1f
    cmp r0, r1, lsr #0x1f
    mov r0, r1, lsr #0x1f
    bne .L_1a8
    bl func_ov002_021c9dac
    cmp r0, #0x0
    beq .L_1a8
    ldrh r1, [r5, #0x2]
    mov r0, r5
    mov r3, r1, lsl #0x1f
    mov r2, r1, lsl #0x1a
    mov r1, r3, lsr #0x1f
    mov r2, r2, lsr #0x1b
    bl func_ov002_021d6c98
    b .L_1a8
.L_ec:
    ldr r1, _LIT4
    ldr r0, [r1]
    ldr r1, [r1, #0x1c]
    and r4, r0, #0x1
    mul r7, r4, r7
    mul r4, r1, r6
    add r3, r3, r7
    add r3, r3, r4
    ldr r3, [r3, #0x30]
    mov r3, r3, lsl #0x13
    movs r3, r3, lsr #0x13
    addne r2, r2, r7
    ldrneh r2, [r4, r2]
    cmpne r2, #0x0
    beq .L_1a8
    add r2, sp, #0x4
    bl func_ov002_021c4c9c
    ldr r1, [sp, #0x18]
    ldr r0, _LIT5
    mov r3, #0x3
    cmp r1, r0
    movgt r1, r0
    mov r0, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [sp]
    ldrh r0, [r5, #0x2]
    ldrh r2, [r5]
    mov r1, r0, lsl #0x1a
    mov r4, r0, lsl #0x1f
    mov r0, r4, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021d59cc
    ldr r1, [sp, #0x1c]
    ldr r0, _LIT5
    mov r3, #0x3
    cmp r1, r0
    movgt r1, r0
    mov r0, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [sp]
    ldrh r0, [r5, #0x2]
    ldrh r2, [r5]
    mov r1, r0, lsl #0x1a
    mov r4, r0, lsl #0x1f
    mov r0, r4, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021d59cc
.L_1a8:
    mov r0, #0x0
    add sp, sp, #0x30
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word data_ov002_022cf1a4
_LIT3: .word 0x00001472
_LIT4: .word data_ov002_022cd3f4
_LIT5: .word 0x0000ffff
