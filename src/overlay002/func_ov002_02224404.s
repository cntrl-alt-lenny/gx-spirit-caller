; func_ov002_02224404 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd3f4
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf178
        .extern data_ov002_022d0e6c
        .extern func_0202b878
        .extern func_0202e234
        .extern func_ov002_021ae430
        .extern func_ov002_021de910
        .extern func_ov002_021e278c
        .extern func_ov002_021f4260
        .extern func_ov002_0226af78
        .extern func_ov002_0226b0b0
        .global func_ov002_02224404
        .arm
func_ov002_02224404:
    stmdb sp!, {r4, lr}
    ldr r3, _LIT0
    mov r4, r0
    ldr r0, [r3, #0x5a8]
    sub r0, r0, #0x7d
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_1b4
    b .L_c4
    b .L_98
    b .L_6c
    b .L_30
.L_30:
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
    ldmeqia sp!, {r4, pc}
    mov r1, #0x0
    bl func_ov002_0226af78
    mov r0, #0x7f
    ldmia sp!, {r4, pc}
.L_6c:
    ldr r0, _LIT3
    ldrh r2, [r0, #0xb0]
    str r2, [r3, #0x5ac]
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226b0b0
    mov r0, #0x7e
    ldmia sp!, {r4, pc}
.L_98:
    ldr r1, _LIT3
    ldrh r0, [r4]
    ldrh r1, [r1, #0xb0]
    bl func_ov002_021f4260
    ldrh r2, [r4, #0x2]
    mov r1, r0
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae430
    mov r0, #0x7d
    ldmia sp!, {r4, pc}
.L_c4:
    ldrh r0, [r4, #0x2]
    ldr ip, _LIT4
    ldr r1, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r2, r0, #0x1
    mla ip, r2, r1, ip
    ldr r1, [r3, #0x5ac]
    add r2, ip, #0x120
    ldr r2, [r2, r1, lsl #0x2]
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    bl func_ov002_021e278c
    ldrh r1, [r4, #0x2]
    ldr r0, _LIT1
    ldr r3, _LIT4
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    and ip, r1, #0x1
    ldr r2, _LIT0
    ldr r1, _LIT3
    mla r3, ip, r0, r3
    ldr r0, [r2, #0x5ac]
    ldrh r1, [r1, #0xb0]
    add r0, r3, r0, lsl #0x2
    ldr r0, [r0, #0x120]
    cmp r1, #0x0
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    mov r2, #0x0
    beq .L_160
    cmp r1, #0x1
    beq .L_16c
    cmp r1, #0x2
    beq .L_180
    b .L_190
.L_160:
    bl func_0202e234
    mov r2, r0
    b .L_190
.L_16c:
    bl func_0202b878
    cmp r0, #0x16
    moveq r2, #0x1
    movne r2, #0x0
    b .L_190
.L_180:
    bl func_0202b878
    cmp r0, #0x17
    moveq r2, #0x1
    movne r2, #0x0
.L_190:
    cmp r2, #0x0
    bne .L_1ac
    ldr r2, _LIT5
    mov r0, r4
    ldr r1, [r2]
    ldr r2, [r2, #0x1c]
    bl func_ov002_021de910
.L_1ac:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_1b4:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf178
_LIT3: .word data_ov002_022d0e6c
_LIT4: .word data_ov002_022cf16c
_LIT5: .word data_ov002_022cd3f4
