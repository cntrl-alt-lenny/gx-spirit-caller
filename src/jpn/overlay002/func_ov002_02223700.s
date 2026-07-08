; func_ov002_02223700 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd664
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0a0
        .extern data_ov002_022d008c
        .extern data_ov002_022d0d8c
        .extern func_ov002_021ae584
        .extern func_ov002_021afff0
        .extern func_ov002_021d8038
        .extern func_ov002_021e1304
        .extern func_ov002_021e2a4c
        .extern func_ov002_021e2b6c
        .extern func_ov002_02257a60
        .extern func_ov002_0226b13c
        .global func_ov002_02223700
        .arm
func_ov002_02223700:
    stmdb sp!, {r4, lr}
    ldr r2, _LIT0
    mov r4, r0
    ldr r2, [r2, #0x5a8]
    sub r2, r2, #0x7c
    cmp r2, #0x4
    addls pc, pc, r2, lsl #0x2
    b .L_158
    b .L_14c
    b .L_bc
    b .L_b0
    b .L_84
    b .L_34
.L_34:
    bl func_ov002_02257a60
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r1, [r4, #0x2]
    ldr r0, _LIT1
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x1
    bne .L_74
    mov r0, #0x2
    bl func_ov002_021afff0
    ldr r1, _LIT2
    str r0, [r1, #0xd44]
    b .L_7c
.L_74:
    mov r0, #0x38
    bl func_ov002_021ae584
.L_7c:
    mov r0, #0x7f
    ldmia sp!, {r4, pc}
.L_84:
    ldrh r1, [r4, #0x2]
    ldr r0, _LIT2
    mov r2, #0x1
    mov ip, r1, lsl #0x1f
    mov r1, r1, lsl #0x1a
    ldr r3, [r0, #0xd44]
    mov r0, ip, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_0226b13c
    mov r0, #0x7e
    ldmia sp!, {r4, pc}
.L_b0:
    bl func_ov002_021e2a4c
    mov r0, #0x7d
    ldmia sp!, {r4, pc}
.L_bc:
    ldr r0, _LIT3
    ldr r1, _LIT4
    ldrh r0, [r0, #0xb2]
    cmp r0, #0x0
    ldrh r0, [r4, #0x2]
    beq .L_120
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    and r3, r0, #0x1
    mul ip, r3, r1
    ldr r2, _LIT5
    ldr r2, [r2, ip]
    cmp r2, #0x0
    beq .L_144
    ldr r1, _LIT6
    sub r2, r2, #0x1
    add r1, r1, ip
    add r1, r1, #0x18
    add r1, r1, #0x400
    add r1, r1, r2, lsl #0x2
    mov r2, #0x1
    bl func_ov002_021d8038
    mov r0, #0x7d
    ldmia sp!, {r4, pc}
.L_120:
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r3, r0, #0x1
    and r3, r3, #0x1
    mul r1, r3, r1
    ldr r2, _LIT5
    ldr r1, [r2, r1]
    mov r2, #0x0
    bl func_ov002_021e1304
.L_144:
    mov r0, #0x7c
    ldmia sp!, {r4, pc}
.L_14c:
    bl func_ov002_021e2b6c
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_158:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022cd664
_LIT2: .word data_ov002_022d008c
_LIT3: .word data_ov002_022d0d8c
_LIT4: .word 0x00000868
_LIT5: .word data_ov002_022cf0a0
_LIT6: .word data_ov002_022cf08c
