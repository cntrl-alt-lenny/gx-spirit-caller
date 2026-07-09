; func_ov002_021eefa0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_0202e2ec
        .extern func_ov002_021b3414
        .extern func_ov002_021b9dec
        .extern func_ov002_021c1e10
        .extern func_ov002_021e8928
        .extern func_ov002_021ed514
        .extern func_ov002_0223dda4
        .global func_ov002_021eefa0
        .arm
func_ov002_021eefa0:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x30
    mov r6, r0
    ldrh r3, [r6, #0xc]
    mov r5, r1
    mov r4, r2
    cmp r3, #0x1
    beq .L_34
    cmp r3, #0x2
    beq .L_14c
    cmp r3, #0x3
    beq .L_23c
    b .L_374
.L_34:
    bl func_ov002_021ed514
    cmp r0, #0x0
    beq .L_374
    add r3, sp, #0x18
    mov r2, #0x0
    str r2, [r3]
    ldrh r1, [sp, #0x1a]
    mov r0, r5, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x1
    and r0, r0, #0x1
    orr r0, r1, r0
    strh r0, [sp, #0x1a]
    ldrh r1, [sp, #0x1a]
    mov r0, r4, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x3e
    mov r0, r0, lsl #0x1b
    orr r0, r1, r0, lsr #0x1a
    strh r0, [sp, #0x1a]
    ldrh r6, [sp, #0x1a]
    mov r0, r5
    mov r1, r4
    bic r6, r6, #0x3000
    orr r6, r6, #0x3000
    str r2, [r3, #0x4]
    str r2, [r3, #0x8]
    str r2, [r3, #0xc]
    str r2, [r3, #0x10]
    str r2, [r3, #0x14]
    strh r6, [sp, #0x1a]
    bl func_ov002_021b9dec
    ldr r6, _LIT0
    ldr r1, _LIT1
    and r3, r5, #0x1
    mov r2, #0x14
    mla r6, r3, r1, r6
    mul r1, r4, r2
    add r2, r6, #0x30
    ldr r3, [r2, r1]
    ldrh r6, [sp, #0x1c]
    mov r1, r3, lsl #0x2
    mov r2, r1, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    add r2, r2, r3, lsr #0x1f
    ldr r1, _LIT2
    mov r2, r2, lsl #0x10
    and r3, r6, r1
    mov r2, r2, lsr #0x10
    mov r1, r2, lsl #0x17
    orr r1, r3, r1, lsr #0x11
    strh r0, [sp, #0x18]
    strh r1, [sp, #0x1c]
    mov r7, #0x0
    add r6, sp, #0x18
.L_114:
    cmp r7, r4
    beq .L_13c
    mov r0, r6
    mov r1, r5
    mov r2, r7
    bl func_ov002_021e8928
    cmp r0, #0x0
    addne sp, sp, #0x30
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
.L_13c:
    add r7, r7, #0x1
    cmp r7, #0x4
    ble .L_114
    b .L_374
.L_14c:
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r5
    addne sp, sp, #0x30
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    cmp r4, #0x5
    blt .L_178
    cmp r4, #0xa
    blt .L_184
.L_178:
    add sp, sp, #0x30
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_184:
    ldr r0, _LIT1
    ldr r1, _LIT0
    and r2, r5, #0x1
    mla r1, r2, r0, r1
    mov r0, #0x14
    mla r0, r4, r0, r1
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    addeq sp, sp, #0x30
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    bl func_0202e2ec
    cmp r0, #0x0
    addeq sp, sp, #0x30
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_ov002_021c1e10
    cmp r0, #0x0
    addeq sp, sp, #0x30
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    mov r8, #0x0
    mov r6, r8
.L_1f0:
    mov r7, r6
.L_1f4:
    mov r0, r8
    mov r1, r7
    mov r2, r5
    mov r3, r4
    bl func_ov002_021b3414
    cmp r0, #0xa
    cmpne r0, #0xb
    bne .L_220
    add sp, sp, #0x30
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_220:
    add r7, r7, #0x1
    cmp r7, #0x4
    ble .L_1f4
    add r8, r8, #0x1
    cmp r8, #0x2
    blt .L_1f0
    b .L_374
.L_23c:
    mov r1, #0x0
    bl func_ov002_0223dda4
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    and r6, r0, #0xff
    mov r0, r1, asr #0x8
    cmp r5, r6
    and r7, r0, #0xff
    bne .L_374
    cmp r4, r7
    beq .L_374
    ldr r0, _LIT1
    ldr r1, _LIT0
    and r2, r5, #0x1
    mla r1, r2, r0, r1
    mov r0, #0x14
    mla r0, r4, r0, r1
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_374
    add r3, sp, #0x0
    mov r2, #0x0
    str r2, [r3]
    ldrh r1, [sp, #0x2]
    mov r0, r6, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x1
    and r0, r0, #0x1
    orr r0, r1, r0
    strh r0, [sp, #0x2]
    ldrh r1, [sp, #0x2]
    mov r0, r7, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x3e
    mov r0, r0, lsl #0x1b
    orr r0, r1, r0, lsr #0x1a
    strh r0, [sp, #0x2]
    ldrh ip, [sp, #0x2]
    mov r0, r6
    mov r1, r7
    bic ip, ip, #0x3000
    orr ip, ip, #0x3000
    str r2, [r3, #0x4]
    str r2, [r3, #0x8]
    str r2, [r3, #0xc]
    str r2, [r3, #0x10]
    str r2, [r3, #0x14]
    strh ip, [sp, #0x2]
    bl func_ov002_021b9dec
    ldr ip, _LIT0
    ldr r1, _LIT1
    and r3, r6, #0x1
    mla r1, r3, r1, ip
    mov r2, #0x14
    strh r0, [sp]
    mul r0, r7, r2
    add r1, r1, #0x30
    ldr r2, [r1, r0]
    ldrh r3, [sp, #0x4]
    mov r0, r2, lsl #0x2
    mov r1, r0, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    ldr r0, _LIT2
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    and r2, r3, r0
    mov r0, r1, lsl #0x17
    orr r3, r2, r0, lsr #0x11
    add r0, sp, #0x0
    mov r1, r5
    mov r2, r4
    strh r3, [sp, #0x4]
    bl func_ov002_021e8928
    add sp, sp, #0x30
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_374:
    mov r0, #0x0
    add sp, sp, #0x30
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
_LIT2: .word 0xffff803f
