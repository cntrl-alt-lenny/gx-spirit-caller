; func_ov002_02236d58 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd744
        .extern data_ov002_022ce288
        .extern data_ov002_022d016c
        .extern func_ov002_021ae400
        .extern func_ov002_021ae638
        .extern func_ov002_021af9d0
        .extern func_ov002_021afb74
        .extern func_ov002_021bc618
        .extern func_ov002_021ca2b8
        .extern func_ov002_0220e518
        .extern func_ov002_0225368c
        .extern func_ov002_0227ac64
        .global func_ov002_02236d58
        .arm
func_ov002_02236d58:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    mov r4, r0
    ldr r1, [r1, #0x5a8]
    sub r1, r1, #0x7c
    cmp r1, #0x4
    addls pc, pc, r1, lsl #0x2
    b .L_1a8
    b .L_170
    b .L_104
    b .L_dc
    b .L_50
    b .L_38
.L_38:
    bl func_ov002_0220e518
    cmp r0, #0x0
    movne r0, #0x7f
    add sp, sp, #0x4
    moveq r0, #0x0
    ldmia sp!, {r3, r4, pc}
.L_50:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021bc618
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, pc}
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca2b8
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, pc}
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0225368c
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, pc}
    ldrh r0, [r4, #0x2]
    mov r1, #0xf0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    add sp, sp, #0x4
    mov r0, #0x7e
    ldmia sp!, {r3, r4, pc}
.L_dc:
    ldrh r0, [r4, #0x2]
    ldrh r2, [r4]
    mov r1, #0x6
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, #0x0
    bl func_ov002_021af9d0
    add sp, sp, #0x4
    mov r0, #0x7d
    ldmia sp!, {r3, r4, pc}
.L_104:
    ldrh r1, [r4, #0x2]
    ldr r0, _LIT1
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x1
    bne .L_130
    ldr r0, _LIT2
    mov r1, #0x0
    str r1, [r0, #0xd44]
    b .L_164
.L_130:
    bl func_ov002_021afb74
    mov r4, r0
    bl func_ov002_021afb74
    ldr r0, [r0]
    ldr r1, [r4]
    mov r0, r0, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r1, r0, r1, lsr #0x1f
    mov r0, #0xf7
    mov r2, #0x1
    bl func_ov002_021ae638
.L_164:
    add sp, sp, #0x4
    mov r0, #0x7c
    ldmia sp!, {r3, r4, pc}
.L_170:
    bl func_ov002_021afb74
    ldrh r3, [r4]
    ldr r2, _LIT2
    mov r1, r0
    mov r0, r3, lsl #0x10
    orr r0, r0, #0x10
    str r0, [sp]
    ldrh r0, [r4, #0x2]
    ldr r3, [r2, #0xd44]
    mov r2, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0227ac64
.L_1a8:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022cd744
_LIT2: .word data_ov002_022d016c
