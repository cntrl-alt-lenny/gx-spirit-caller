; func_ov002_02227d1c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf09c
        .extern func_0202e1e0
        .extern func_ov002_021ae320
        .extern func_ov002_021ba500
        .extern func_ov002_021c97ac
        .extern func_ov002_021d8198
        .extern func_ov002_021d86ec
        .extern func_ov002_021df618
        .extern func_ov002_021e1304
        .extern func_ov002_021e2728
        .extern func_ov002_021e277c
        .extern func_ov002_021e2a4c
        .extern func_ov002_021e2b6c
        .extern func_ov002_0226af64
        .global func_ov002_02227d1c
        .arm
func_ov002_02227d1c:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x5a8]
    cmp r0, #0x7c
    bgt .L_44
    bge .L_18c
    cmp r0, #0x64
    bgt .L_1e8
    cmp r0, #0x62
    blt .L_1e8
    beq .L_1d0
    cmp r0, #0x63
    beq .L_1b4
    cmp r0, #0x64
    beq .L_198
    b .L_1e8
.L_44:
    cmp r0, #0x7d
    bgt .L_54
    beq .L_dc
    b .L_1e8
.L_54:
    cmp r0, #0x80
    bgt .L_1e8
    cmp r0, #0x7e
    blt .L_1e8
    beq .L_d0
    cmp r0, #0x80
    bne .L_1e8
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT1
    ldr r2, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r3, r0, #0x1
    mul r1, r3, r1
    ldr r1, [r2, r1]
    cmp r1, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    bl func_ov002_021ba500
    ldrh r3, [r4, #0x2]
    ldr r1, _LIT1
    ldr r2, _LIT2
    mov r3, r3, lsl #0x1f
    mov r3, r3, lsr #0x1f
    and r3, r3, #0x1
    mul r1, r3, r1
    ldr r1, [r2, r1]
    cmp r1, r0
    moveq r0, #0x64
    movne r0, #0x7e
    ldmia sp!, {r4, r5, r6, pc}
.L_d0:
    bl func_ov002_021e2a4c
    mov r0, #0x7d
    ldmia sp!, {r4, r5, r6, pc}
.L_dc:
    ldrh r2, [r4, #0x2]
    ldr r0, _LIT1
    ldr r1, _LIT2
    mov r2, r2, lsl #0x1f
    mov r4, r2, lsr #0x1f
    and r3, r4, #0x1
    mul r2, r3, r0
    ldr r0, [r1, r2]
    cmp r0, #0x0
    beq .L_184
    ldr r1, _LIT3
    mov r0, r4
    add r5, r1, r2
    ldr r1, [r5, #0x260]
    mov r1, r1, lsl #0x13
    mov r6, r1, lsr #0x13
    mov r1, r6
    bl func_ov002_021df618
    mov r0, r4
    mov r1, #0xd
    mov r2, #0x0
    bl func_ov002_021c97ac
    cmp r0, #0x0
    bne .L_144
    mov r0, r4
    bl func_ov002_021e2728
.L_144:
    mov r0, r4
    bl func_ov002_021d86ec
    mov r0, r6
    bl func_0202e1e0
    cmp r0, #0x0
    mov r0, r4
    bne .L_170
    add r1, r5, #0x260
    bl func_ov002_021d8198
    mov r0, #0x7c
    ldmia sp!, {r4, r5, r6, pc}
.L_170:
    mov r1, #0x1
    mov r2, #0x0
    bl func_ov002_021e1304
    mov r0, #0x7d
    ldmia sp!, {r4, r5, r6, pc}
.L_184:
    mov r0, #0x7c
    ldmia sp!, {r4, r5, r6, pc}
.L_18c:
    bl func_ov002_021e2b6c
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_198:
    ldrh r0, [r4, #0x2]
    mov r1, #0xd
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
    mov r0, #0x63
    ldmia sp!, {r4, r5, r6, pc}
.L_1b4:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226af64
    mov r0, #0x62
    ldmia sp!, {r4, r5, r6, pc}
.L_1d0:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e277c
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_1e8:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf09c
_LIT3: .word data_ov002_022cf08c
