; func_ov002_02214764 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c4
        .extern func_ov002_021b99c8
        .extern func_ov002_021bc538
        .extern func_ov002_021bc5e4
        .extern func_ov002_021ca1d8
        .extern func_ov002_021d58dc
        .extern func_ov002_021de9d8
        .extern func_ov002_021df728
        .extern func_ov002_021e2460
        .extern func_ov002_021e267c
        .extern func_ov002_021e277c
        .extern func_ov002_0227ab74
        .global func_ov002_02214764
        .arm
func_ov002_02214764:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldrh r3, [r5, #0x2]
    mov r0, r3, lsl #0x12
    mov r0, r0, lsr #0x1e
    cmp r0, #0x2
    beq .L_d8
    mov r0, r3, lsl #0x1f
    mov r2, r0, lsr #0x1f
    ldr r0, _LIT0
    and r1, r2, #0x1
    mul r0, r1, r0
    mov ip, r3, lsl #0x1a
    ldr r1, _LIT1
    mov ip, ip, lsr #0x1b
    add r4, r1, r0
    mov r1, #0x14
    mul r1, ip, r1
    add r4, r4, #0x30
    ldr ip, [r4, r1]
    ldrh r3, [r5, #0x4]
    mov r4, ip, lsl #0x2
    mov r4, r4, lsr #0x18
    mov r3, r3, lsl #0x11
    mov ip, ip, lsl #0x12
    mov r4, r4, lsl #0x1
    mov r3, r3, lsr #0x17
    add r4, r4, ip, lsr #0x1f
    cmp r3, r4
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r4, _LIT2
    add r0, r4, r0
    ldrh r0, [r1, r0]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r1, [r5]
    rsb r0, r2, #0x1
    mov r2, #0x5
    bl func_ov002_021e267c
    ldrh r1, [r5, #0x2]
    mov r0, r5
    mov r3, r1, lsl #0x1f
    mov r2, r1, lsl #0x1a
    mov r1, r3, lsr #0x1f
    mov r2, r2, lsr #0x1b
    bl func_ov002_021de9d8
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021e277c
    b .L_234
.L_d8:
    ldr r1, _LIT3
    ldr r0, [r1, #0x5a8]
    cmp r0, #0x7e
    beq .L_1f8
    cmp r0, #0x7f
    beq .L_198
    cmp r0, #0x80
    bne .L_234
    ldrh r1, [r5, #0x4]
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsl #0x11
    mov r1, r1, lsr #0x17
    bl func_ov002_021b99c8
    movs r4, r0
    bmi .L_190
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc538
    cmp r0, #0x0
    beq .L_148
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca1d8
    cmp r0, #0x0
    bne .L_180
.L_148:
    ldrh r0, [r5, #0x2]
    ldr r3, _LIT1
    ldr r1, _LIT0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r2, r0, #0x1
    mla r1, r2, r1, r3
    add r2, r1, #0x120
    mov r1, r4
    add r2, r2, r4, lsl #0x2
    mov r3, #0x0
    bl func_ov002_021e2460
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_180:
    ldr r1, _LIT3
    mov r0, #0x7f
    str r4, [r1, #0x5ac]
    ldmia sp!, {r3, r4, r5, pc}
.L_190:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_198:
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc5e4
    ldrh r2, [r5, #0x2]
    ldr r1, _LIT3
    ldr ip, _LIT1
    ldr r4, [r1, #0x5ac]
    mov r2, r2, lsl #0x1f
    mov r3, r2, lsr #0x1f
    str r0, [r1, #0x5b0]
    mov r2, #0x1
    str r2, [sp]
    ldr r0, _LIT0
    and r3, r3, #0x1
    mla r0, r3, r0, ip
    ldrh r1, [r5, #0x2]
    add r5, r0, #0x120
    mov r3, r2
    mov r0, r1, lsl #0x1f
    add r1, r5, r4, lsl #0x2
    mov r0, r0, lsr #0x1f
    bl func_ov002_0227ab74
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, pc}
.L_1f8:
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    str r0, [sp]
    ldrh r2, [r5]
    ldr r1, [r1, #0x5b0]
    mov r3, #0x5
    bl func_ov002_021d58dc
    ldrh r1, [r5, #0x2]
    mov r0, r5
    mov r2, #0x3e8
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_021df728
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_234:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022cf0c4
_LIT3: .word data_ov002_022ce1a8
