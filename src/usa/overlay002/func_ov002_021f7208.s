; func_ov002_021f7208 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd664
        .extern data_ov002_022ce1a8
        .extern data_ov002_022d008c
        .extern func_ov002_021ae320
        .extern func_ov002_021dec40
        .extern func_ov002_021e7494
        .extern func_ov002_022574e0
        .extern func_ov002_02257790
        .extern func_ov002_02259274
        .extern func_ov002_0225930c
        .extern func_ov002_0225968c
        .global func_ov002_021f7208
        .arm
func_ov002_021f7208:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r2, _LIT0
    mov r5, r0
    ldr r2, [r2, #0x5b4]
    mov r4, r1
    cmp r2, #0x3
    addls pc, pc, r2, lsl #0x2
    b .L_23c
    b .L_30
    b .L_64
    b .L_128
    b .L_20c
.L_30:
    mov r0, #0x0
    strh r0, [r5, #0xa]
    strh r0, [r5, #0x8]
    strh r0, [r5, #0xc]
    ldrh r0, [r5, #0x2]
    mov r1, #0x3a
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
    ldr r0, _LIT0
    ldr r1, [r0, #0x5b4]
    add r1, r1, #0x1
    str r1, [r0, #0x5b4]
.L_64:
    ldrh r1, [r5, #0x2]
    ldr r0, _LIT1
    mov r1, r1, lsl #0x1f
    mov r2, r1, lsr #0x1f
    ldr r0, [r0, r2, lsl #0x2]
    cmp r0, #0x1
    bne .L_f8
    ldrh r0, [r4, #0x2]
    mov r1, r0, lsl #0x1f
    cmp r2, r1, lsr #0x1f
    mov r1, r1, lsr #0x1f
    bne .L_f8
    mov r2, r0, lsl #0x1a
    mov r0, r5
    mov r2, r2, lsr #0x1b
    bl func_ov002_022574e0
    cmp r0, #0x0
    beq .L_f8
    ldrh r1, [r5, #0x2]
    ldr r0, _LIT2
    mov r2, #0x0
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    str r1, [r0, #0xd6c]
    ldrh r0, [r4, #0x2]
    mov r3, #0xb
    mov r1, r0, lsl #0x1a
    mov r4, r0, lsl #0x1f
    mov r0, r4, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_0225968c
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, pc}
.L_f8:
    ldrh r0, [r5, #0x2]
    ldrh r1, [r5]
    ldr r2, _LIT3
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_02259274
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, pc}
.L_128:
    bl func_ov002_0225930c
    cmp r0, #0x0
    beq .L_1e0
    ldr r0, _LIT2
    ldrh r1, [r5, #0xc]
    ldr r2, [r0, #0xd70]
    ldr ip, [r0, #0xd74]
    ldr r4, [r0, #0xd78]
    add r0, r1, #0x1
    strh r0, [r5, #0xc]
    add r3, r5, #0x8
    mov r2, r2, lsl #0x1
    ldrh r1, [r3, r2]
    add r4, ip, r4
    mov r0, #0x1
    orr r0, r1, r0, lsl r4
    strh r0, [r3, r2]
    ldrh r1, [r5, #0x2]
    ldr r0, _LIT1
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x1
    bne .L_1a0
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, pc}
.L_1a0:
    ldr r1, _LIT3
    mov r0, r5
    bl func_ov002_02257790
    cmp r0, #0x0
    mov r0, #0x0
    bne .L_1cc
    ldr r1, _LIT0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, pc}
.L_1cc:
    ldr r1, _LIT0
    ldr r2, [r1, #0x5b4]
    sub r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, pc}
.L_1e0:
    ldrh r0, [r5, #0xc]
    cmp r0, #0x0
    ldreq r1, _LIT0
    mov r0, #0x0
    streq r0, [r1, #0x5b4]
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, pc}
.L_20c:
    ldrh r2, [r5, #0x8]
    ldrh r1, [r5, #0xa]
    orr r1, r2, r1, lsl #0x10
    bl func_ov002_021dec40
    ldrh r2, [r5, #0xc]
    ldr r1, _LIT0
    mov r0, #0x0
    strh r2, [r5, #0x8]
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, pc}
.L_23c:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022cd664
_LIT2: .word data_ov002_022d008c
_LIT3: .word func_ov002_021e7494
