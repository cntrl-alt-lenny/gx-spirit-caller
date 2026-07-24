; func_02049990 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ff968
        .extern func_020498dc
        .extern func_020498f0
        .extern func_02049910
        .extern func_0204a8bc
        .extern func_0204a960
        .extern func_0204a9b0
        .extern func_0204cb54
        .extern func_0204cc20
        .extern func_0204ec90
        .extern func_02062600
        .extern func_02064f84
        .extern OS_SNPrintf
        .extern func_020930b0
        .global func_02049990
        .arm
func_02049990:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x20
    mov r5, r0
    mov r6, r2
    mov r4, r3
    bl func_020498f0
    ldr r0, [r0, #0x1a0]
    cmp r0, #0x6
    beq .L_b8
    bl func_020498f0
    ldr r0, [r0, #0x1a0]
    cmp r0, #0xb
    addne sp, sp, #0x20
    ldmneia sp!, {r4, r5, r6, pc}
.L_b8:
    cmp r4, #0x0
    addeq sp, sp, #0x20
    ldmeqia sp!, {r4, r5, r6, pc}
    cmp r5, #0x0
    bne .L_2b4
    mov r0, #0x0
    str r0, [r4, #0x8]
    bl func_020498f0
    ldrb r1, [r0, #0x14]
    add r1, r1, #0x1
    strb r1, [r0, #0x14]
    bl func_020498f0
    ldrb r1, [r4]
    ldrb r5, [r0, #0x14]
    cmp r1, #0x0
    beq .L_24c
    bl func_020498f0
    ldr r1, [r6, #0x4]
    add r0, r0, r5, lsl #0x2
    str r1, [r0, #0x210]
    ldrh r4, [r6, #0x2]
    bl func_020498f0
    mov r2, r4, asr #0x8
    mov r1, r4, lsl #0x8
    add r0, r0, r5, lsl #0x1
    and r2, r2, #0xff
    and r1, r1, #0xff00
    orr r1, r2, r1
    add r0, r0, #0x200
    strh r1, [r0, #0x90]
    bl func_020498f0
    mov r1, #0x0
    strb r1, [r0, #0x17c]
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x180]
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x184]
    str r1, [r0, #0x188]
    bl func_020498f0
    ldr r0, [r0, #0x1a0]
    cmp r0, #0xb
    bne .L_174
    mov r0, #0xc
    bl func_020498dc
    b .L_17c
.L_174:
    mov r0, #0x7
    bl func_020498dc
.L_17c:
    bl func_020498f0
    mov r1, #0x0
    strb r1, [r0, #0xc]
    bl func_020498f0
    ldr r3, [r0, #0x200]
    ldr r2, _LIT0
    add r0, sp, #0x10
    mov r1, #0xc
    bl OS_SNPrintf
    bl func_020498f0
    mov r4, r0
    bl func_020498f0
    mov r6, r0
    bl func_020498f0
    add r1, r6, r5, lsl #0x2
    mov r2, r0
    ldr r0, [r1, #0x210]
    add r1, r2, r5, lsl #0x1
    add r1, r1, #0x200
    ldrh r1, [r1, #0x90]
    mov r2, #0x0
    bl func_02064f84
    mov r6, r0
    bl func_020498f0
    mvn r1, #0x0
    str r1, [sp]
    ldr r3, _LIT1
    mov r1, #0x0
    str r3, [sp, #0x4]
    ldr r0, [r0, #0x8]
    mov r2, r6
    str r0, [sp, #0x8]
    str r1, [sp, #0xc]
    ldr r0, [r4, #0x4]
    add r3, sp, #0x10
    ldr r0, [r0]
    bl func_02062600
    cmp r0, #0x1
    bne .L_224
    bl func_0204a8bc
    add sp, sp, #0x20
    ldmia sp!, {r4, r5, r6, pc}
.L_224:
    cmp r0, #0x0
    addeq sp, sp, #0x20
    ldmeqia sp!, {r4, r5, r6, pc}
    bl func_020498f0
    add r0, r0, r5, lsl #0x2
    ldr r0, [r0, #0xf4]
    bl func_0204cc20
    add sp, sp, #0x20
    cmp r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_24c:
    cmp r6, #0x0
    beq .L_290
    sub r4, r5, #0x1
    bl func_020498f0
    ldr r1, [r6, #0x4]
    add r0, r0, r4, lsl #0x2
    str r1, [r0, #0x210]
    ldrh r5, [r6, #0x2]
    bl func_020498f0
    mov r2, r5, asr #0x8
    mov r1, r5, lsl #0x8
    add r0, r0, r4, lsl #0x1
    and r2, r2, #0xff
    and r1, r1, #0xff00
    orr r1, r2, r1
    add r0, r0, #0x200
    strh r1, [r0, #0x90]
.L_290:
    bl func_020498f0
    mov r4, r0
    bl func_020930b0
    str r0, [r4, #0x18c]
    mov r0, #0x7
    str r1, [r4, #0x190]
    bl func_020498dc
    add sp, sp, #0x20
    ldmia sp!, {r4, r5, r6, pc}
.L_2b4:
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    addeq sp, sp, #0x20
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r0, r5
    bl func_0204a960
    mov r6, r0
    cmp r6, #0x2
    beq .L_2e4
    cmp r6, #0x1
    addne sp, sp, #0x20
    ldmneia sp!, {r4, r5, r6, pc}
.L_2e4:
    ldrb r0, [r4]
    cmp r0, #0x0
    bne .L_370
    cmp r6, #0x1
    beq .L_30c
    cmp r6, #0x2
    bne .L_34c
    ldrb r0, [r4, #0x1]
    cmp r0, #0x1
    bcc .L_34c
.L_30c:
    mov r0, #0x0
    str r0, [r4, #0x8]
    bl func_02049910
    cmp r0, #0x0
    addeq sp, sp, #0x20
    ldmeqia sp!, {r4, r5, r6, pc}
    bl func_020498f0
    mov r4, r0
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    add r0, r4, r0, lsl #0x2
    ldr r0, [r0, #0xf4]
    bl func_0204cb54
    add sp, sp, #0x20
    cmp r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_34c:
    ldrb r1, [r4, #0x1]
    mov r0, r4
    add r1, r1, #0x1
    strb r1, [r4, #0x1]
    bl func_0204ec90
    bl func_0204a9b0
    add sp, sp, #0x20
    cmp r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_370:
    bl func_020498f0
    mov r5, r0
    bl func_020930b0
    str r0, [r5, #0x184]
    str r1, [r5, #0x188]
    cmp r6, #0x1
    beq .L_3ac
    cmp r6, #0x2
    addne sp, sp, #0x20
    ldmneia sp!, {r4, r5, r6, pc}
    bl func_020498f0
    ldrb r0, [r0, #0x17c]
    cmp r0, #0x1
    addcc sp, sp, #0x20
    ldmccia sp!, {r4, r5, r6, pc}
.L_3ac:
    mov r0, #0x0
    str r0, [r4, #0x8]
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x3
    beq .L_3d4
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x2
    bne .L_3ec
.L_3d4:
    mov r0, #0x1
    bl func_02049910
    cmp r0, #0x0
    bne .L_400
    add sp, sp, #0x20
    ldmia sp!, {r4, r5, r6, pc}
.L_3ec:
    mov r0, #0x0
    bl func_02049910
    cmp r0, #0x0
    addeq sp, sp, #0x20
    ldmeqia sp!, {r4, r5, r6, pc}
.L_400:
    bl func_020498f0
    mov r1, #0x0
    strb r1, [r0, #0x17c]
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x180]
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x184]
    str r1, [r0, #0x188]
    bl func_020498f0
    mov r4, r0
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    add r0, r0, #0x1
    add r0, r4, r0, lsl #0x2
    ldr r0, [r0, #0xf4]
    bl func_0204cc20
    cmp r0, #0x0
    add sp, sp, #0x20
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_020ff968
_LIT1: .word 0x00001388
