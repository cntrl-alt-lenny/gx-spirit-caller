; func_ov002_02232508 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_021b98d4
        .extern func_ov002_021b99c8
        .extern func_ov002_021ca310
        .extern func_ov002_021ff2cc
        .extern func_ov002_0227acc8
        .global func_ov002_02232508
        .arm
func_ov002_02232508:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov002_021ff2cc
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca310
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    mov r1, r0, lsl #0x1a
    mov r1, r1, lsr #0x1b
    cmp r1, #0xe
    ldrh r1, [r4, #0x4]
    mov r0, r0, lsl #0x1f
    bne .L_a8
    mov r1, r1, lsl #0x11
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x17
    bl func_ov002_021b98d4
    movs ip, r0
    bmi .L_f4
    ldrh r0, [r4, #0x2]
    ldrh r2, [r4]
    ldr r4, _LIT0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, _LIT1
    and r3, r0, #0x1
    mla r1, r3, r1, r4
    add r1, r1, #0x18
    add r1, r1, #0x400
    add r1, r1, ip, lsl #0x2
    mov r3, r2, lsl #0x10
    mov r2, #0x1
    bl func_ov002_0227acc8
    b .L_f4
.L_a8:
    mov r1, r1, lsl #0x11
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x17
    bl func_ov002_021b99c8
    movs ip, r0
    bmi .L_f4
    ldrh r0, [r4, #0x2]
    ldrh r2, [r4]
    ldr r4, _LIT0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, _LIT1
    and r3, r0, #0x1
    mla r1, r3, r1, r4
    add r1, r1, #0x120
    add r1, r1, ip, lsl #0x2
    mov r3, r2, lsl #0x10
    mov r2, #0x1
    bl func_ov002_0227acc8
.L_f4:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
