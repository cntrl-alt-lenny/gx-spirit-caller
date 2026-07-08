; func_ov002_0222387c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_ov002_021ae320
        .extern func_ov002_021d58dc
        .extern func_ov002_021d7b2c
        .extern func_ov002_021dec2c
        .extern func_ov002_021e267c
        .extern func_ov002_02257564
        .extern func_ov002_022576f4
        .extern func_ov002_02259274
        .extern func_ov002_0225930c
        .global func_ov002_0222387c
        .arm
func_ov002_0222387c:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r4, r0
    ldrh r3, [r4, #0x2]
    mov r1, r3, lsl #0x12
    movs r1, r1, lsr #0x1e
    bne .L_1e8
    ldr r2, _LIT0
    ldr r1, [r2, #0x5a8]
    sub r1, r1, #0x7b
    cmp r1, #0x5
    addls pc, pc, r1, lsl #0x2
    b .L_1e8
    b .L_1c0
    b .L_164
    b .L_128
    b .L_f0
    b .L_b8
    b .L_4c
.L_4c:
    ldr r1, _LIT1
    ldr r1, [r1, #0xd0]
    tst r1, #0x1
    addne sp, sp, #0x4
    movne r0, #0x0
    ldmneia sp!, {r3, r4, pc}
    mov r1, #0x10
    str r1, [r2, #0x5ac]
    bl func_ov002_022576f4
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x7d
    ldmeqia sp!, {r3, r4, pc}
    ldrh r0, [r4, #0x2]
    mov r1, #0x7c
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    ldr r2, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_02259274
    add sp, sp, #0x4
    mov r0, #0x7f
    ldmia sp!, {r3, r4, pc}
.L_b8:
    bl func_ov002_0225930c
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x80
    ldmeqia sp!, {r3, r4, pc}
    ldr r0, _LIT1
    ldr r1, _LIT0
    ldr r3, [r0, #0xd74]
    ldr r2, [r0, #0xd78]
    add sp, sp, #0x4
    add r2, r3, r2
    str r2, [r1, #0x5ac]
    mov r0, #0x7e
    ldmia sp!, {r3, r4, pc}
.L_f0:
    ldr r1, [r2, #0x5ac]
    cmp r1, #0x4
    bgt .L_11c
    mov r0, #0x0
    str r0, [sp]
    ldrh r0, [r4, #0x2]
    ldrh r2, [r4]
    mov r3, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021d58dc
.L_11c:
    add sp, sp, #0x4
    mov r0, #0x7d
    ldmia sp!, {r3, r4, pc}
.L_128:
    ldr r2, [r2, #0x5ac]
    mvn r1, #0x0
    cmp r2, #0x10
    beq .L_150
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    add r0, r2, r0, lsl #0x4
    mov r2, #0x1
    mvn r0, r2, lsl r0
    and r1, r1, r0
.L_150:
    mov r0, r4
    bl func_ov002_021dec2c
    add sp, sp, #0x4
    mov r0, #0x7c
    ldmia sp!, {r3, r4, pc}
.L_164:
    ldr r0, _LIT1
    ldr r3, _LIT3
    ldr lr, [r0, #0xcec]
    ldr r1, _LIT4
    mov ip, #0x0
.L_178:
    eor r0, lr, ip
    and r2, r0, #0x1
    mla r4, r2, r1, r3
    ldr r2, [r4, #0xc]
    cmp r2, #0x0
    beq .L_1a8
    add r1, r4, #0x120
    mov r2, #0x0
    bl func_ov002_021d7b2c
    add sp, sp, #0x4
    mov r0, #0x7c
    ldmia sp!, {r3, r4, pc}
.L_1a8:
    add ip, ip, #0x1
    cmp ip, #0x2
    blt .L_178
    add sp, sp, #0x4
    mov r0, #0x7b
    ldmia sp!, {r3, r4, pc}
.L_1c0:
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldrh r1, [r4]
    rsb r0, r0, #0x1
    mov r2, #0x1
    mov r3, #0x0
    bl func_ov002_021e267c
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, pc}
.L_1e8:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022d008c
_LIT2: .word func_ov002_02257564
_LIT3: .word data_ov002_022cf08c
_LIT4: .word 0x00000868
