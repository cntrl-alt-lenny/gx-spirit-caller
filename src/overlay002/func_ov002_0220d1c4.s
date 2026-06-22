; func_ov002_0220d1c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d0250
        .extern func_0202ed90
        .extern func_ov002_021bc618
        .extern func_ov002_021ca2b8
        .extern func_ov002_022536e8
        .global func_ov002_0220d1c4
        .arm
func_ov002_0220d1c4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    mov r1, r0, lsl #0x14
    mov r1, r1, lsr #0x1a
    cmp r1, #0x1b
    bne .L_100
    ldr r1, [r4, #0x14]
    mov r2, r0, lsl #0x1f
    mov r0, r1, lsl #0x16
    mov r0, r0, lsr #0x1f
    cmp r0, r2, lsr #0x1f
    bne .L_100
    mov r0, r1, lsl #0x12
    mov r0, r0, lsr #0x1c
    cmp r0, #0x4
    bhi .L_100
    mov r0, r1, lsl #0xd
    mov r0, r0, lsr #0x1f
    cmp r0, r2, lsr #0x1f
    beq .L_100
    mov r0, r1, lsl #0xf
    movs r0, r0, lsr #0x1f
    bne .L_100
    mov r0, r1, lsl #0x10
    movs r0, r0, lsr #0x1f
    beq .L_100
    mov r0, r1, lsl #0x9
    mov r0, r0, lsr #0x1c
    cmp r0, #0xe
    bne .L_100
    mov r1, r1, lsl #0x17
    ldr r0, _LIT0
    mov r1, r1, lsr #0x15
    ldrh r0, [r0, r1]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202ed90
    cmp r0, #0x0
    beq .L_100
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_022536e8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc618
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca2b8
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, pc}
.L_100:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022d0250
