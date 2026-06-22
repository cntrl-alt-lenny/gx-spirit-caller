; func_ov002_02231dec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern func_ov002_021d59cc
        .extern func_ov002_0223de94
        .extern func_ov002_0223df38
        .extern func_ov002_0225764c
        .extern func_ov002_0226b11c
        .global func_ov002_02231dec
        .arm
func_ov002_02231dec:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
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
    addne sp, sp, #0x4
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, pc}
    ldr r3, _LIT2
    add r1, r3, r1
    ldrh r1, [r2, r1]
    cmp r1, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, pc}
    mov r1, #0x0
    mov r2, r1
    bl func_ov002_0223df38
    cmp r0, #0x0
    beq .L_4d8
    mov r0, r6
    mov r1, #0x0
    bl func_ov002_0223de94
    mov r1, r0, lsl #0x10
    and r4, r0, #0xff
    mov r0, r1, lsr #0x10
    mov r0, r0, asr #0x8
    and r5, r0, #0xff
    mov r0, r6
    mov r1, r4
    mov r2, r5
    bl func_ov002_0225764c
    cmp r0, #0x0
    beq .L_4d8
    ldrh r2, [r6, #0x2]
    mov r0, r4
    mov r1, r5
    mov r2, r2, lsl #0x1f
    mov r3, r2, lsr #0x1f
    str r3, [sp]
    ldrh r2, [r6, #0x2]
    and r6, r3, #0xff
    mov r3, #0x6
    mov r2, r2, lsl #0x1a
    mov r2, r2, lsr #0x1b
    and r2, r2, #0xff
    orr r2, r6, r2, lsl #0x8
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_ov002_021d59cc
    mov r0, r4
    mov r1, r5
    bl func_ov002_0226b11c
.L_4d8:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word data_ov002_022cf1a4
