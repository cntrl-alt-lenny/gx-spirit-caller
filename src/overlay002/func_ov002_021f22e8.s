; func_ov002_021f22e8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022ce884
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a2
        .extern data_ov002_022cf1a4
        .extern func_ov002_021c1ef0
        .extern func_ov002_021f09e8
        .extern func_ov002_02257888
        .global func_ov002_021f22e8
        .arm
func_ov002_021f22e8:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r0
    ldrh r3, [r6, #0x6]
    mov r5, r1
    mov r4, r2
    mov r3, r3, lsl #0x10
    movs r3, r3, lsr #0x18
    bne .L_164
    ldr r3, _LIT0
    and r7, r5, #0x1
    mov ip, #0x14
    mul r3, r7, r3
    ldr r7, _LIT1
    mul ip, r4, ip
    add r7, r7, r3
    add r7, r7, ip
    ldr r7, [r7, #0x30]
    mov r7, r7, lsl #0x13
    movs r7, r7, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    cmp r4, #0x5
    movge r0, #0x0
    ldmgeia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r7, _LIT2
    add r7, r7, r3
    ldrh r7, [ip, r7]
    cmp r7, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r7, _LIT3
    add r3, r7, r3
    ldrh r3, [ip, r3]
    cmp r3, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    bl func_ov002_021c1ef0
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r2, _LIT4
    mov r1, #0x0
    ldr ip, [r2, #0x5d4]
    cmp ip, #0x0
    bls .L_16c
    ldr r3, _LIT5
.L_b8:
    ldrb r0, [r2, #0x5dc]
    add r0, r0, #0xf8
    and r0, r0, #0xff
    cmp r0, #0x1
    bhi .L_14c
    ldr r0, [r3]
    mov r7, r0, lsl #0x16
    cmp r5, r7, lsr #0x1f
    moveq r7, r0, lsl #0x12
    cmpeq r4, r7, lsr #0x1c
    bne .L_14c
    ldrh r7, [r6, #0x2]
    mov lr, r0, lsl #0xf
    eor lr, r5, lr, lsr #0x1f
    mov r7, r7, lsl #0x1f
    mov r7, r7, lsr #0x1f
    rsb r7, r7, #0x1
    cmp r7, lr
    bne .L_14c
    mov lr, r0, lsl #0x10
    movs lr, lr, lsr #0x1f
    bne .L_14c
    mov r0, r0, lsl #0x11
    movs r0, r0, lsr #0x1f
    beq .L_14c
    and r1, r5, #0xff
    and r0, r4, #0xff
    orr r0, r1, r0, lsl #0x8
    mov r2, r0, lsl #0x10
    ldr r1, _LIT6
    mov r0, r6
    mov r2, r2, lsr #0x10
    bl func_ov002_02257888
    cmp r0, #0x0
    movgt r0, #0x1
    movle r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_14c:
    add r1, r1, #0x1
    cmp r1, ip
    add r2, r2, #0x1
    add r3, r3, #0x4
    bcc .L_b8
    b .L_16c
.L_164:
    bl func_ov002_021f09e8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_16c:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word data_ov002_022cf1a4
_LIT3: .word data_ov002_022cf1a2
_LIT4: .word data_ov002_022ce288
_LIT5: .word data_ov002_022ce884
_LIT6: .word func_ov002_021f09e8
