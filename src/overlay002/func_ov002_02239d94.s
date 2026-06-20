; func_ov002_02239d94 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern func_ov002_021b99b4
        .extern func_ov002_021bd030
        .extern func_ov002_021d5d58
        .extern func_ov002_021d8414
        .extern func_ov002_0223def4
        .global func_ov002_02239d94
        .arm
func_ov002_02239d94:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0xc
    mov r6, r0
    ldrh r4, [r6, #0x2]
    ldr r1, _LIT0
    ldrh r3, [r6, #0x4]
    mov r2, r4, lsl #0x1f
    mov r2, r2, lsr #0x1f
    and r2, r2, #0x1
    mov r5, r4, lsl #0x1a
    mul r1, r2, r1
    ldr r4, _LIT1
    mov r5, r5, lsr #0x1b
    mov r2, #0x14
    mul r2, r5, r2
    add r4, r4, r1
    add r4, r4, #0x30
    mov r5, r3, lsl #0x11
    ldr r4, [r4, r2]
    mov r5, r5, lsr #0x17
    mov r3, r4, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r4, r4, lsl #0x12
    mov r3, r3, lsl #0x1
    add r3, r3, r4, lsr #0x1f
    cmp r5, r3
    addne sp, sp, #0xc
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, pc}
    ldr r3, _LIT2
    add r1, r3, r1
    ldrh r1, [r2, r1]
    cmp r1, #0x0
    addeq sp, sp, #0xc
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    ldrh r1, [r6, #0x6]
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x18
    beq .L_164
    mov r1, #0x0
    bl func_ov002_0223def4
    mov r5, r0
    ldrh r2, [r6, #0x2]
    mov r1, r5
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021b99b4
    ldrh r1, [r6, #0x2]
    mov r7, r0
    mov r0, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bd030
    movs r4, r0
    addmi sp, sp, #0xc
    movmi r0, #0x0
    ldmmiia sp!, {r4, r5, r6, r7, pc}
    cmp r7, #0x0
    addlt sp, sp, #0xc
    movlt r0, #0x0
    ldmltia sp!, {r4, r5, r6, r7, pc}
    ldrh r2, [r6, #0x2]
    mov r0, #0x1
    mov r1, #0x0
    str r4, [sp]
    mov r2, r2, lsl #0x1f
    str r0, [sp, #0x4]
    mov r0, r2, lsr #0x1f
    mov r2, r5
    mov r3, r0
    str r1, [sp, #0x8]
    mov r1, #0xe
    bl func_ov002_021d8414
    ldrh r0, [r6, #0x2]
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
.L_164:
    mov r0, #0x0
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word data_ov002_022cf1a4
