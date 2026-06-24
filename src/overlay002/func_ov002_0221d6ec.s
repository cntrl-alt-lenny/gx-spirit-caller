; func_ov002_0221d6ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022d0e6c
        .extern func_0202b878
        .extern func_ov002_021d8904
        .extern func_ov002_021de598
        .extern func_ov002_021ff14c
        .extern func_ov002_0226ada4
        .extern func_ov002_0226b094
        .global func_ov002_0221d6ec
        .arm
func_ov002_0221d6ec:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldrh r0, [r5, #0x4]
    mov r4, r1
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT0
    ldr r0, [r0, #0x5a8]
    cmp r0, #0x7e
    beq .L_530
    cmp r0, #0x7f
    beq .L_4f4
    cmp r0, #0x80
    bne .L_5cc
    mov r1, #0x1
    str r1, [sp]
    ldrh r0, [r5, #0x2]
    mov r2, #0x0
    mov r3, r2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021ff14c
    cmp r0, #0x0
    moveq r0, #0x7e
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r0, [r5, #0x2]
    ldrh r1, [r5]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226b094
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, pc}
.L_4f4:
    ldr r0, _LIT1
    ldrh r0, [r0, #0xb0]
    cmp r0, #0x0
    moveq r0, #0x7e
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r0, [r5, #0x2]
    mov r1, #0x1
    mov r3, r1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    mov r2, #0x7
    bl func_ov002_0226ada4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_530:
    cmp r4, #0x0
    beq .L_5c4
    ldrh r0, [r4]
    bl func_0202b878
    cmp r0, #0x16
    bne .L_5c4
    ldrh r0, [r4, #0x4]
    orr r2, r0, #0x2
    mov r0, r2, lsl #0x1e
    mov r0, r0, lsr #0x1f
    bic r1, r2, #0x4
    mov r0, r0, lsl #0x1f
    orr r0, r1, r0, lsr #0x1d
    strh r0, [r4, #0x4]
    ldrh r1, [r4, #0x4]
    mov r0, r1, lsl #0x1d
    mov r0, r0, lsr #0x1f
    bic r1, r1, #0x8
    mov r0, r0, lsl #0x1f
    orr r0, r1, r0, lsr #0x1c
    strh r0, [r4, #0x4]
    ldrh r1, [r4, #0x2]
    ldrh r0, [r4, #0x4]
    mov r3, r1, lsl #0x1f
    mov r2, r0, lsl #0x11
    mov r1, r1, lsl #0x1a
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    mov r2, r2, lsr #0x17
    bl func_ov002_021d8904
    ldrh r1, [r4, #0x2]
    mov r0, r5
    mov r2, r1, lsl #0x1a
    mov r3, r1, lsl #0x1f
    mov r1, r3, lsr #0x1f
    mov r2, r2, lsr #0x1b
    bl func_ov002_021de598
.L_5c4:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_5cc:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022d0e6c
