; func_ov002_021eb2c8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c4
        .extern func_ov002_021c1d64
        .extern func_ov002_021c1e10
        .extern func_ov002_021c8390
        .extern func_ov002_021c83c8
        .global func_ov002_021eb2c8
        .arm
func_ov002_021eb2c8:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldrh r3, [r6, #0x2]
    mov r5, r1
    mov r4, r2
    mov r3, r3, lsl #0x1f
    cmp r5, r3, lsr #0x1f
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r3, _LIT0
    and lr, r5, #0x1
    mov ip, #0x14
    mul r3, lr, r3
    ldr lr, _LIT1
    mul ip, r4, ip
    add lr, lr, r3
    add lr, lr, ip
    ldr lr, [lr, #0x30]
    mov lr, lr, lsl #0x13
    movs lr, lr, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr lr, _LIT2
    add r3, lr, r3
    ldrh r3, [ip, r3]
    cmp r3, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    bl func_ov002_021c1e10
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_ov002_021c1d64
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x14
    mov r0, r0, lsr #0x1a
    add r0, r0, #0xfa
    add r0, r0, #0xff00
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    cmp r0, #0x1
    bhi .L_160
    ldr r0, [r6, #0x14]
    mov r1, r0, lsl #0x16
    cmp r5, r1, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    mov r0, r0, lsl #0x12
    cmp r4, r0, lsr #0x1c
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    ldrh r2, [r6]
    ldr r1, _LIT3
    cmp r2, r1
    beq .L_128
    add r0, r1, #0x1
    cmp r2, r0
    beq .L_144
    add r0, r1, #0x95
    cmp r2, r0
    bne .L_160
    mov r0, r5
    mov r1, r4
    bl func_ov002_021c8390
    cmp r0, #0x3e8
    movge r0, #0x1
    movlt r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_128:
    mov r0, r5
    mov r1, r4
    bl func_ov002_021c83c8
    cmp r0, #0x1f4
    movle r0, #0x1
    movgt r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_144:
    mov r0, r5
    mov r1, r4
    bl func_ov002_021c8390
    cmp r0, #0x1f4
    movle r0, #0x1
    movgt r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_160:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022cf0c4
_LIT3: .word 0x0000124f
