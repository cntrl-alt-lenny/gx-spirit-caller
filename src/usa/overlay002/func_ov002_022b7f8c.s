; func_ov002_022b7f8c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d1830
        .extern func_02021278
        .extern func_ov002_022b856c
        .global func_ov002_022b7f8c
        .arm
func_ov002_022b7f8c:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0xc
    mov r4, r1
    mov r5, r0
    str r4, [r5, #0xc54]
    str r2, [r5, #0xc58]
    mov r1, #0x0
    str r1, [r5, #0xc60]
    str r1, [r5, #0xc64]
    cmp r4, #0x16
    addls pc, pc, r4, lsl #0x2
    b .L_144
    b .L_144
    b .L_8c
    b .L_8c
    b .L_8c
    b .L_8c
    b .L_cc
    b .L_8c
    b .L_8c
    b .L_8c
    b .L_8c
    b .L_cc
    b .L_8c
    b .L_10c
    b .L_8c
    b .L_cc
    b .L_144
    b .L_144
    b .L_144
    b .L_144
    b .L_144
    b .L_8c
    b .L_8c
    b .L_8c
.L_8c:
    ldr r2, _LIT0
    add r1, r5, #0xc00
    ldrh ip, [r2, #0x90]
    add r2, r5, #0xc80
    strh ip, [r1, #0x68]
    mov r3, ip
    str r2, [sp]
    mov r1, r3, lsl #0x1f
    mov r2, r3, lsl #0x1a
    mov r3, r3, lsl #0x12
    mov r1, r1, lsr #0x1f
    mov r2, r2, lsr #0x1b
    mov r3, r3, lsr #0x18
    strh ip, [sp, #0x8]
    bl func_ov002_022b856c
    b .L_144
.L_cc:
    ldr r2, _LIT0
    add r1, r5, #0xc00
    ldrh ip, [r2, #0x92]
    add r2, r5, #0xc80
    strh ip, [r1, #0x68]
    mov r3, ip
    str r2, [sp]
    mov r1, r3, lsl #0x1f
    mov r2, r3, lsl #0x1a
    mov r3, r3, lsl #0x12
    mov r1, r1, lsr #0x1f
    mov r2, r2, lsr #0x1b
    mov r3, r3, lsr #0x18
    strh ip, [sp, #0x6]
    bl func_ov002_022b856c
    b .L_144
.L_10c:
    add r1, r5, #0xc00
    ldrh ip, [r1, #0x6a]
    add r2, r5, #0xc80
    strh ip, [r1, #0x68]
    mov r3, ip
    str r2, [sp]
    mov r1, r3, lsl #0x1f
    mov r2, r3, lsl #0x1a
    mov r3, r3, lsl #0x12
    mov r1, r1, lsr #0x1f
    mov r2, r2, lsr #0x1b
    mov r3, r3, lsr #0x18
    strh ip, [sp, #0x4]
    bl func_ov002_022b856c
.L_144:
    cmp r4, #0x1
    bne .L_160
    ldr r0, [r5, #0xc58]
    cmp r0, #0x2
    moveq r0, #0x1
    movne r0, #0x0
    str r0, [r5, #0xd30]
.L_160:
    cmp r4, #0x8
    bne .L_1e4
    add r0, r5, #0xc00
    ldrh r3, [r0, #0x68]
    ldrh ip, [r0, #0x74]
    mov r0, #0x1
    mov r1, r3, lsl #0x1f
    mov r1, r1, lsr #0x1f
    mov r2, ip, lsl #0x1f
    cmp r1, r2, lsr #0x1f
    mov lr, #0x0
    bne .L_1a4
    mov r2, r3, lsl #0x1a
    mov r3, r2, lsr #0x1b
    mov r2, ip, lsl #0x1a
    cmp r3, r2, lsr #0x1b
    moveq lr, r0
.L_1a4:
    cmp lr, #0x0
    bne .L_1dc
    add r2, r5, #0xc00
    ldrh r3, [r2, #0x76]
    mov ip, r3, lsl #0x1f
    cmp r1, ip, lsr #0x1f
    bne .L_1d8
    ldrh r2, [r2, #0x68]
    mov r1, r3, lsl #0x1a
    mov r2, r2, lsl #0x1a
    mov r2, r2, lsr #0x1b
    cmp r2, r1, lsr #0x1b
    beq .L_1dc
.L_1d8:
    mov r0, #0x0
.L_1dc:
    str r0, [r5, #0xcf8]
    b .L_1f0
.L_1e4:
    cmp r4, #0x3
    movne r0, #0x0
    strne r0, [r5, #0xcf8]
.L_1f0:
    cmp r4, #0xc
    moveq r0, #0xa
    streq r0, [r5, #0xcd4]
    cmp r4, #0xd
    bne .L_220
    ldr r0, [r5, #0xc58]
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    and r0, r0, #0xff
    str r0, [r5, #0xd0c]
.L_220:
    cmp r4, #0xa
    cmpne r4, #0x9
    cmpne r4, #0x7
    cmpne r4, #0xc
    bne .L_274
    add r0, r5, #0xc00
    ldrh r3, [r0, #0x6a]
    add r0, r5, #0x74
    add r1, r0, #0xc00
    mov r0, r3, lsl #0x1f
    mov ip, r0, lsr #0x1f
    mov r0, ip, lsl #0x1
    ldrh r2, [r1, r0]
    mov r0, r2, lsl #0x1f
    cmp ip, r0, lsr #0x1f
    bne .L_274
    mov r0, r3, lsl #0x1a
    mov r1, r0, lsr #0x1b
    mov r0, r2, lsl #0x1a
    cmp r1, r0, lsr #0x1b
    beq .L_27c
.L_274:
    cmp r4, #0x11
    bne .L_370
.L_27c:
    add r0, r5, #0xc00
    ldrh r0, [r0, #0x6a]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    add r0, r5, r0, lsl #0x2
    ldr r0, [r0, #0xd50]
    cmp r0, #0x0
    beq .L_370
    mvn r1, #0x0
    cmp r0, r1
    beq .L_2c8
    bl func_02021278
    add r0, r5, #0xc00
    ldrh r0, [r0, #0x6a]
    mvn r1, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    add r0, r5, r0, lsl #0x2
    str r1, [r0, #0xd50]
.L_2c8:
    add r3, r5, #0xc00
    ldrh r1, [r3, #0x6a]
    add r0, r5, #0x74
    add r2, r5, #0x78
    mov r1, r1, lsl #0x1f
    mov r4, r1, lsr #0x1f
    add r1, r0, #0xc00
    mov lr, r4, lsl #0x1
    ldrh ip, [r1, lr]
    and r4, r4, #0x1
    add r0, r2, #0xc00
    bic r2, ip, #0x1
    orr r2, r2, r4
    strh r2, [r1, lr]
    ldrh r2, [r3, #0x6a]
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    mov r4, r2, lsl #0x1
    ldrh r2, [r1, r4]
    bic r2, r2, #0x3e
    orr r2, r2, #0x3e
    strh r2, [r1, r4]
    ldrh r1, [r3, #0x6a]
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    mov r4, r1, lsl #0x1
    ldrh r2, [r0, r4]
    and r1, r1, #0x1
    bic r2, r2, #0x1
    orr r1, r2, r1
    strh r1, [r0, r4]
    ldrh r1, [r3, #0x6a]
    mov r2, r1, lsl #0x1f
    mov r2, r2, lsr #0x1f
    mov r3, r2, lsl #0x1
    ldrh r2, [r0, r3]
    mov r1, r1, lsl #0x1a
    mov r1, r1, lsr #0x1b
    bic r2, r2, #0x3e
    mov r1, r1, lsl #0x1b
    orr r1, r2, r1, lsr #0x1a
    strh r1, [r0, r3]
.L_370:
    mov r0, #0x0
    str r0, [r5, #0xd3c]
    mov r0, #0x1
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_ov002_022d1830
