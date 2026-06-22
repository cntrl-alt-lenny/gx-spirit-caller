; func_ov002_022227dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021b947c
        .extern func_ov002_021bc618
        .extern func_ov002_021c33e4
        .extern func_ov002_021ca2b8
        .extern func_ov002_0223def4
        .extern func_ov002_0227ac64
        .global func_ov002_022227dc
        .arm
func_ov002_022227dc:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    mov r6, r0
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc618
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, pc}
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca2b8
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, pc}
    ldrh r0, [r6, #0x6]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x18
    cmp r0, #0x1
    bne .L_26c
    mov r0, r6
    mov r1, #0x0
    bl func_ov002_0223def4
    bl func_ov002_021b947c
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r3, r0, lsr #0x10
    mov r2, r1, asr #0x8
    mov r1, r3, lsl #0x10
    and r2, r2, #0xff
    cmp r2, #0xe
    and r4, r0, #0xff
    mov r5, r1, lsr #0x10
    bne .L_26c
    ldrh r0, [r6, #0x2]
    mov r1, r4
    mov r2, r5
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c33e4
    cmp r0, #0x0
    beq .L_26c
    ldr r2, _LIT0
    ldr r0, _LIT1
    and r1, r4, #0x1
    mla r0, r1, r0, r2
    ldrh r3, [r6]
    add r0, r0, #0x18
    mov r1, r3, lsl #0x10
    str r1, [sp]
    add r1, r0, #0x400
    ldrh r2, [r6, #0x2]
    add r1, r1, r5, lsl #0x2
    mov r0, r2, lsl #0x1f
    mov r2, #0x1
    mov r3, r2
    mov r0, r0, lsr #0x1f
    bl func_ov002_0227ac64
    add sp, sp, #0x4
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_26c:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
