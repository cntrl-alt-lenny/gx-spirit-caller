; func_ov002_0220e650 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021b947c
        .extern func_ov002_021bc618
        .extern func_ov002_021c33e4
        .extern func_ov002_021ca0d4
        .extern func_ov002_0223def4
        .extern func_ov002_0227adb8
        .global func_ov002_0220e650
        .arm
func_ov002_0220e650:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r0
    ldrh r1, [r6, #0x2]
    mov r0, r1, lsl #0x11
    mov r1, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    eor r4, r0, r1, lsr #0x1f
    mov r0, r4
    bl func_ov002_021bc618
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldrh r0, [r6, #0x2]
    ldrh r1, [r6]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca0d4
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldrh r0, [r6, #0x6]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x18
    cmp r0, #0x1
    bne .L_ec
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
    and r7, r0, #0xff
    mov r5, r1, lsr #0x10
    bne .L_ec
    mov r0, r4
    mov r1, r7
    mov r2, r5
    bl func_ov002_021c33e4
    cmp r0, #0x0
    beq .L_ec
    ldr r2, _LIT0
    ldr r0, _LIT1
    and r1, r7, #0x1
    mla r0, r1, r0, r2
    ldrh r2, [r6]
    add r0, r0, #0x18
    add r1, r0, #0x400
    mov r3, r2, lsl #0x10
    mov r0, r4
    add r1, r1, r5, lsl #0x2
    mov r2, #0x1
    bl func_ov002_0227adb8
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_ec:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
