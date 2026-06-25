; func_ov002_021b947c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd3f4
        .extern data_ov002_022cd4b8
        .extern data_ov002_022cf16c
        .global func_ov002_021b947c
        .arm
func_ov002_021b947c:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r3, #0x0
    ldr r1, _LIT0
    ldr r4, _LIT1
    mov r2, r3
.L_14:
    and r5, r3, #0x1
    mla r6, r5, r4, r1
    mov ip, r2
    add lr, r6, #0x30
.L_24:
    ldr r6, [lr]
    mov r5, r6, lsl #0x13
    movs r5, r5, lsr #0x13
    beq .L_68
    mov r5, r6, lsl #0x2
    mov r5, r5, lsr #0x18
    mov r6, r6, lsl #0x12
    mov r5, r5, lsl #0x1
    add r5, r5, r6, lsr #0x1f
    cmp r0, r5
    bne .L_68
    and r1, r3, #0xff
    and r0, ip, #0xff
    orr r0, r1, r0, lsl #0x8
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_68:
    add ip, ip, #0x1
    cmp ip, #0xa
    add lr, lr, #0x14
    ble .L_24
    add r3, r3, #0x1
    cmp r3, #0x2
    blt .L_14
    mov r2, #0x0
.L_88:
    ldr r1, _LIT1
    ldr r3, _LIT0
    and r4, r2, #0x1
    mla r1, r4, r1, r3
    ldr r5, [r1, #0x14]
    mov r7, #0x0
    cmp r5, #0x0
    bls .L_100
    add r3, r1, #0x18
    add r6, r3, #0x400
.L_b0:
    ldr r4, [r6]
    mov r3, r4, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r4, r4, lsl #0x12
    mov r3, r3, lsl #0x1
    add r3, r3, r4, lsr #0x1f
    cmp r0, r3
    bne .L_f0
    and r1, r2, #0xff
    mov r0, r7, lsl #0x10
    orr r2, r1, #0xe00
    mov r1, r0, lsr #0x10
    mov r0, r2, lsl #0x10
    mov r1, r1, lsl #0x10
    orr r0, r1, r0, lsr #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_f0:
    add r7, r7, #0x1
    cmp r7, r5
    add r6, r6, #0x4
    bcc .L_b0
.L_100:
    ldr r5, [r1, #0x1c]
    mov r7, #0x0
    cmp r5, #0x0
    bls .L_164
    add r6, r1, #0x5d0
.L_114:
    ldr r4, [r6]
    mov r3, r4, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r4, r4, lsl #0x12
    mov r3, r3, lsl #0x1
    add r3, r3, r4, lsr #0x1f
    cmp r0, r3
    bne .L_154
    and r1, r2, #0xff
    mov r0, r7, lsl #0x10
    orr r2, r1, #0xf00
    mov r1, r0, lsr #0x10
    mov r0, r2, lsl #0x10
    mov r1, r1, lsl #0x10
    orr r0, r1, r0, lsr #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_154:
    add r7, r7, #0x1
    cmp r7, r5
    add r6, r6, #0x4
    bcc .L_114
.L_164:
    ldr r5, [r1, #0x10]
    mov r7, #0x0
    cmp r5, #0x0
    bls .L_1c8
    add r6, r1, #0x260
.L_178:
    ldr r4, [r6]
    mov r3, r4, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r4, r4, lsl #0x12
    mov r3, r3, lsl #0x1
    add r3, r3, r4, lsr #0x1f
    cmp r0, r3
    bne .L_1b8
    and r1, r2, #0xff
    mov r0, r7, lsl #0x10
    orr r2, r1, #0xd00
    mov r1, r0, lsr #0x10
    mov r0, r2, lsl #0x10
    mov r1, r1, lsl #0x10
    orr r0, r1, r0, lsr #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_1b8:
    add r7, r7, #0x1
    cmp r7, r5
    add r6, r6, #0x4
    bcc .L_178
.L_1c8:
    ldr r4, [r1, #0x18]
    mov r6, #0x0
    cmp r4, #0x0
    bls .L_22c
    add r5, r1, #0x3a0
.L_1dc:
    ldr r3, [r5]
    mov r1, r3, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r3, lsr #0x1f
    cmp r0, r1
    bne .L_21c
    and r1, r2, #0xff
    mov r0, r6, lsl #0x10
    orr r2, r1, #0xc00
    mov r1, r0, lsr #0x10
    mov r0, r2, lsl #0x10
    mov r1, r1, lsl #0x10
    orr r0, r1, r0, lsr #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_21c:
    add r6, r6, #0x1
    cmp r6, r4
    add r5, r5, #0x4
    bcc .L_1dc
.L_22c:
    add r2, r2, #0x1
    cmp r2, #0x2
    blt .L_88
    mov r1, #0x0
    ldr r5, _LIT0
    ldr r3, _LIT1
    mov r6, r1
.L_248:
    and r2, r1, #0x1
    mla r4, r2, r3, r5
    ldr lr, [r4, #0xc]
    mov r2, r6
    cmp lr, #0x0
    bls .L_2b4
    add r7, r4, #0x120
.L_264:
    ldr ip, [r7]
    mov r4, ip, lsl #0x2
    mov r4, r4, lsr #0x18
    mov ip, ip, lsl #0x12
    mov r4, r4, lsl #0x1
    add r4, r4, ip, lsr #0x1f
    cmp r0, r4
    bne .L_2a4
    and r1, r1, #0xff
    mov r0, r2, lsl #0x10
    orr r2, r1, #0xb00
    mov r1, r0, lsr #0x10
    mov r0, r2, lsl #0x10
    mov r1, r1, lsl #0x10
    orr r0, r1, r0, lsr #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_2a4:
    add r2, r2, #0x1
    cmp r2, lr
    add r7, r7, #0x4
    bcc .L_264
.L_2b4:
    add r1, r1, #0x1
    cmp r1, #0x2
    blt .L_248
    ldr r3, _LIT2
    mov r4, #0x0
.L_2c8:
    ldr r2, [r3]
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    cmp r0, r1
    bne .L_330
    cmp r4, #0x0
    ldreq r0, _LIT3
    ldreq r1, [r0]
    ldrne r0, _LIT3
    ldrne r1, [r0, #0x4]
    cmp r4, #0x0
    ldreq r0, _LIT3
    and r1, r1, #0xff
    ldreq r0, [r0, #0x1c]
    ldrne r0, _LIT3
    ldrne r0, [r0, #0x20]
    and r0, r0, #0xff
    orr r0, r1, r0, lsl #0x8
    mov r1, #0x10000
    mov r0, r0, lsl #0x10
    rsb r1, r1, #0x0
    orr r0, r1, r0, lsr #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_330:
    add r4, r4, #0x1
    cmp r4, #0x2
    add r3, r3, #0x14
    blt .L_2c8
    mov r0, #0x1000
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cd4b8
_LIT3: .word data_ov002_022cd3f4
