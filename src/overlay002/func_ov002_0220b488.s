; func_ov002_0220b488 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202de9c
        .extern func_0202e234
        .extern func_02031794
        .extern func_ov002_021ff020
        .extern func_ov002_021ff320
        .extern func_ov002_0223de94
        .global func_ov002_0220b488
        .arm
func_ov002_0220b488:
    stmdb sp!, {r4, r5, r6, lr}
    movs r5, r1
    mov r6, r0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r0, [r5]
    bl func_02031794
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    mov r0, r6
    mov r1, r5
    bl func_ov002_021ff320
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r0, [r5]
    bl func_0202e234
    cmp r0, #0x0
    beq .L_6c
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1a
    mov r0, r0, lsr #0x1b
    cmp r0, #0x5
    bcc .L_80
    cmp r0, #0xa
    bhi .L_80
.L_6c:
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x12
    movs r0, r0, lsr #0x1e
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
.L_80:
    ldrh r0, [r5]
    bl func_0202de9c
    mov r4, r0
    ldrh r0, [r5]
    bl func_0202e234
    cmp r0, #0x0
    beq .L_b8
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1a
    mov r0, r0, lsr #0x1b
    cmp r0, #0x5
    bcc .L_b8
    cmp r0, #0xa
    movls r4, #0x7
.L_b8:
    ldrh r1, [r6, #0x2]
    ldrh r0, [r6, #0x4]
    mov r3, r4
    mov r2, r1, lsl #0x1f
    mov r1, r0, lsl #0x11
    mov r0, r2, lsr #0x1f
    mov r2, r1, lsr #0x17
    mov r1, #0x1
    bl func_ov002_021ff020
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r0, [r5, #0x6]
    mov r4, #0x0
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    cmp r0, #0x0
    ble .L_150
.L_100:
    mov r0, r5
    mov r1, r4
    bl func_ov002_0223de94
    ldrh r1, [r6, #0x2]
    mov r2, r1, lsl #0x1f
    mov r1, r1, lsl #0x1a
    mov r2, r2, lsr #0x1f
    mov r1, r1, lsr #0x1b
    and r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1, lsl #0x8
    mov r1, r1, lsl #0x10
    cmp r0, r1, lsr #0x10
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r0, [r5, #0x6]
    add r4, r4, #0x1
    mov r0, r0, lsl #0x18
    cmp r4, r0, lsr #0x18
    blt .L_100
.L_150:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
