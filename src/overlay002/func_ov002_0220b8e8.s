; func_ov002_0220b8e8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d0250
        .extern func_0202e2c8
        .extern func_02030b84
        .extern func_ov002_021bcd80
        .global func_ov002_0220b8e8
        .arm
func_ov002_0220b8e8:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    mvn r1, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bcd80
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r0, [r4, #0x2]
    mov r1, r0, lsl #0x14
    mov r1, r1, lsr #0x1a
    cmp r1, #0x8
    bne .L_b8
    ldr r3, [r4, #0x14]
    mov r0, r0, lsl #0x1f
    mov r2, r3, lsl #0x17
    ldr r1, _LIT0
    mov r2, r2, lsr #0x15
    ldrh r2, [r1, r2]
    mov r1, r3, lsl #0x16
    mov r0, r0, lsr #0x1f
    mov r2, r2, lsl #0x13
    mov r1, r1, lsr #0x1f
    rsb r0, r0, #0x1
    cmp r1, r0
    mov r5, r2, lsr #0x13
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r5
    bl func_0202e2c8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r5
    bl func_02030b84
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x14]
    mov r0, r0, lsl #0xe
    movs r0, r0, lsr #0x1f
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_b8:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022d0250
