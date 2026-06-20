; func_ov002_022447f4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd744
        .extern data_ov002_022ce288
        .extern data_ov002_022d016c
        .extern func_ov002_021ae484
        .extern func_ov002_0223dcc0
        .extern func_ov002_0223fd74
        .extern func_ov002_022577dc
        .extern func_ov002_0225935c
        .extern func_ov002_022593f4
        .global func_ov002_022447f4
        .arm
func_ov002_022447f4:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r1, [r1, #0x5b8]
    cmp r1, #0x5
    addls pc, pc, r1, lsl #0x2
    b .L_1d0
    b .L_34
    b .L_bc
    b .L_100
    b .L_184
    b .L_bc
    b .L_100
.L_34:
    ldrh r2, [r4, #0x2]
    ldr r1, [r4, #0x14]
    mov r2, r2, lsl #0x1f
    mov r3, r2, lsr #0x1f
    mov r2, r1, lsl #0x14
    cmp r3, r2, lsr #0x1f
    beq .L_b4
    mov r1, r1, lsl #0x16
    cmp r3, r1, lsr #0x1f
    bne .L_b4
    bl func_ov002_022577dc
    cmp r0, #0x0
    beq .L_b4
    ldrh r1, [r4, #0x2]
    ldr r0, _LIT1
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x1
    bne .L_94
    ldr r0, _LIT2
    mov r1, #0x1
    str r1, [r0, #0xd44]
    b .L_9c
.L_94:
    ldr r0, _LIT3
    bl func_ov002_021ae484
.L_9c:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r4, pc}
.L_b4:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_bc:
    ldr r0, _LIT2
    ldr r0, [r0, #0xd44]
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    ldr r2, _LIT4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0225935c
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r4, pc}
.L_100:
    bl func_ov002_022593f4
    cmp r0, #0x0
    beq .L_16c
    ldr r1, _LIT2
    mov r0, r4
    ldr r3, [r1, #0xd74]
    ldr r2, [r1, #0xd78]
    ldr r1, [r1, #0xd70]
    add r2, r3, r2
    bl func_ov002_0223dcc0
    mov r0, r4
    bl func_ov002_022577dc
    cmp r0, #0x2
    blt .L_164
    ldrh r0, [r4, #0x6]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x18
    cmp r0, #0x2
    bcs .L_164
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r4, pc}
.L_164:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_16c:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    sub r2, r2, #0x2
    str r2, [r1, #0x5b8]
    ldmia sp!, {r4, pc}
.L_184:
    ldrh r1, [r4, #0x2]
    ldr r0, _LIT1
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x1
    bne .L_1b0
    ldr r0, _LIT2
    mov r1, #0x1
    str r1, [r0, #0xd44]
    b .L_1b8
.L_1b0:
    ldr r0, _LIT5
    bl func_ov002_021ae484
.L_1b8:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r4, pc}
.L_1d0:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022cd744
_LIT2: .word data_ov002_022d016c
_LIT3: .word 0x0000013a
_LIT4: .word func_ov002_0223fd74
_LIT5: .word 0x0000013b
