; func_ov002_0227539c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd220
        .extern func_0202b83c
        .extern func_ov002_021b9dec
        .extern func_ov002_021bc1a8
        .extern func_ov002_021bc538
        .extern func_ov002_021c22cc
        .extern func_ov002_021c92ec
        .global func_ov002_0227539c
        .arm
func_ov002_0227539c:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    add r6, r1, r2
    mov r7, r0
    cmp r6, #0xa
    movgt r0, #0x0
    ldmgtia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r1, _LIT0
    ldr r1, [r1]
    mov r1, r1, lsl #0x1f
    cmp r7, r1, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    mov r1, r6
    bl func_ov002_021b9dec
    movs r4, r0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r7
    mov r1, r6
    bl func_ov002_021c22cc
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r1, _LIT0
    ldrb r0, [r1, #0x8]
    cmp r0, #0x0
    bne .L_144
    ldr r1, [r1]
    ldr r0, _LIT1
    mov r1, r1, lsl #0x9
    rsb r1, r0, r1, lsr #0x11
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b .L_b4
    b .L_98
    b .L_a0
    b .L_a8
    b .L_b0
.L_98:
    sub r5, r0, #0xac
    b .L_b4
.L_a0:
    mov r5, #0x18c0
    b .L_b4
.L_a8:
    sub r5, r0, #0xaa
    b .L_b4
.L_b0:
    sub r5, r0, #0xa9
.L_b4:
    cmp r4, r5
    bne .L_1d4
    ldr r4, _LIT0
    mov r5, #0x0
.L_c4:
    cmp r5, r6
    beq .L_134
    ldr r0, [r4]
    mov r0, r0, lsl #0x9
    mov r0, r0, lsr #0x11
    bl func_0202b83c
    mov r2, r0
    mov r0, r7
    mov r1, r5
    bl func_ov002_021c92ec
    cmp r0, #0x0
    beq .L_134
    mov r0, r7
    bl func_ov002_021bc538
    cmp r0, #0x0
    bne .L_12c
    mov r0, r7
    mov r1, r6
    bl func_ov002_021bc1a8
    cmp r0, #0x0
    bne .L_12c
    mov r0, r7
    mov r1, r5
    bl func_ov002_021bc1a8
    cmp r0, #0x0
    beq .L_134
.L_12c:
    mov r0, #0x800
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_134:
    add r5, r5, #0x1
    cmp r5, #0x4
    ble .L_c4
    b .L_1d4
.L_144:
    and r2, r7, #0xff
    and r0, r6, #0xff
    orr r0, r2, r0, lsl #0x8
    ldrh r2, [r1, #0x10]
    mov r0, r0, lsl #0x10
    cmp r2, r0, lsr #0x10
    beq .L_1d4
    ldr r0, [r1]
    mov r0, r0, lsl #0x9
    mov r0, r0, lsr #0x11
    bl func_0202b83c
    mov r2, r0
    mov r0, r7
    mov r1, r6
    bl func_ov002_021c92ec
    cmp r0, #0x0
    beq .L_1d4
    mov r0, r7
    bl func_ov002_021bc538
    cmp r0, #0x0
    bne .L_1cc
    mov r0, r7
    mov r1, r6
    bl func_ov002_021bc1a8
    cmp r0, #0x0
    bne .L_1cc
    ldr r1, _LIT0
    mov r0, r7
    ldrh r1, [r1, #0x10]
    mov r1, r1, asr #0x8
    and r1, r1, #0xff
    bl func_ov002_021bc1a8
    cmp r0, #0x0
    beq .L_1d4
.L_1cc:
    mov r0, #0x800
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_1d4:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022cd220
_LIT1: .word 0x0000196b
