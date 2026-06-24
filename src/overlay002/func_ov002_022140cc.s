; func_ov002_022140cc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern func_ov002_021bd030
        .extern func_ov002_021d5d58
        .extern func_ov002_021decac
        .extern func_ov002_021ded54
        .extern func_ov002_021e2d94
        .extern func_ov002_0223df38
        .extern func_ov002_0225764c
        .global func_ov002_022140cc
        .arm
func_ov002_022140cc:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x8
    mov r7, r0
    ldrh r1, [r7, #0x4]
    mov r1, r1, lsl #0x1d
    movs r1, r1, lsr #0x1f
    addne sp, sp, #0x8
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    add r2, sp, #0x4
    mov r1, #0x0
    bl func_ov002_0223df38
    cmp r0, #0x0
    beq .L_1b4
    ldr r2, [sp, #0x4]
    mov r0, r7
    mov r1, r2, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    and r5, r2, #0xff
    and r6, r1, #0xff
    mov r1, r5
    mov r2, r6
    bl func_ov002_0225764c
    cmp r0, #0x0
    beq .L_1b4
    ldrh r0, [r7, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bd030
    ldrh r4, [r7, #0x2]
    ldr r1, _LIT0
    mov r2, #0x14
    mov r3, r4, lsl #0x1f
    mov r3, r3, lsr #0x1f
    mov r4, r4, lsl #0x1a
    and r3, r3, #0x1
    mov r4, r4, lsr #0x1b
    mul r1, r3, r1
    ldr r3, _LIT1
    mul r2, r4, r2
    add r3, r3, r1
    add r3, r3, r2
    ldr r3, [r3, #0x30]
    mov r4, r0
    mov r0, r3, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_1a4
    ldr r0, _LIT2
    add r0, r0, r1
    ldrh r0, [r2, r0]
    cmp r0, #0x0
    beq .L_1a4
    cmp r4, #0x0
    blt .L_1a4
    rsb r8, r5, #0x1
    mov r0, r7
    mov r1, r5
    mov r2, r6
    mov r3, r8
    str r4, [sp]
    bl func_ov002_021ded54
    ldrh r1, [r7]
    ldr r0, _LIT3
    cmp r1, r0
    bne .L_14c
    ldrh r0, [r7, #0x2]
    and r2, r4, #0xff
    mov r3, #0xa
    mov r4, r0, lsl #0x1f
    mov r1, r0, lsl #0x1a
    mov r0, r4, lsr #0x1f
    mov r1, r1, lsr #0x1b
    and r5, r0, #0xff
    and r1, r1, #0xff
    orr r4, r5, r2, lsl #0x8
    orr r2, r5, r1, lsl #0x8
    mov r1, r4, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    bl func_ov002_021d5d58
    b .L_1b4
.L_14c:
    mov r0, r8
    mov r1, r4
    mov r2, #0x9
    mov r3, #0x1
    bl func_ov002_021e2d94
    ldrh r0, [r7, #0x2]
    and r2, r4, #0xff
    mov r3, #0xd
    mov r4, r0, lsl #0x1f
    mov r1, r0, lsl #0x1a
    mov r0, r4, lsr #0x1f
    mov r1, r1, lsr #0x1b
    and r5, r0, #0xff
    and r1, r1, #0xff
    orr r4, r5, r2, lsl #0x8
    orr r2, r5, r1, lsl #0x8
    mov r1, r4, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    bl func_ov002_021d5d58
    b .L_1b4
.L_1a4:
    mov r0, r7
    mov r1, r5
    mov r2, r6
    bl func_ov002_021decac
.L_1b4:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word data_ov002_022cf1a4
_LIT3: .word 0x000015d8
