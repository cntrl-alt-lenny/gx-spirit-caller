; func_0204b8d0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020469b4
        .extern func_020498f0
        .extern func_0204bb5c
        .extern func_0204bc4c
        .extern func_0204bd8c
        .extern func_0204bf44
        .extern func_0204c40c
        .extern func_0204cb54
        .extern func_0204cc20
        .extern func_020930b0
        .extern func_020b3808
        .global func_0204b8d0
        .arm
func_0204b8d0:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    bl func_020498f0
    ldr r0, [r0, #0x1a0]
    cmp r0, #0x9
    beq .L_838
    bl func_020498f0
    ldr r0, [r0, #0x1a0]
    cmp r0, #0x10
    beq .L_838
    bl func_020498f0
    ldr r0, [r0, #0x1a0]
    cmp r0, #0x11
    bne .L_87c
.L_838:
    bl func_020930b0
    mov r4, r0
    mov r5, r1
    bl func_020498f0
    ldr r1, [r0, #0x1e0]
    ldr r0, [r0, #0x1e4]
    subs r3, r4, r1
    sbc r0, r5, r0
    mov r1, r0, lsl #0x6
    ldr r2, _LIT0
    orr r1, r1, r3, lsr #0x1a
    mov r0, r3, lsl #0x6
    mov r3, #0x0
    bl func_020b3808
    mov r4, r0
    mov r5, r1
    b .L_888
.L_87c:
    add sp, sp, #0x4
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_888:
    bl func_020498f0
    ldr r0, [r0, #0x1a0]
    cmp r0, #0x9
    beq .L_8ac
    cmp r0, #0x10
    beq .L_91c
    cmp r0, #0x11
    beq .L_a58
    b .L_a78
.L_8ac:
    ldr r0, _LIT1
    cmp r5, #0x0
    cmpeq r4, r0
    bls .L_a78
    bl func_020469b4
    cmp r0, #0x5
    bne .L_8f8
    bl func_020498f0
    ldrb r0, [r0, #0x1ad]
    cmp r0, #0x5
    bcc .L_8f8
    bl func_020498f0
    ldr r0, [r0, #0xf4]
    bl func_0204cb54
    cmp r0, #0x0
    bne .L_a78
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_8f8:
    bl func_020498f0
    ldrb r1, [r0, #0x1ad]
    add r1, r1, #0x1
    strb r1, [r0, #0x1ad]
    bl func_020498f0
    ldrb r0, [r0, #0x2d0]
    mov r1, #0x3
    bl func_0204bb5c
    b .L_a78
.L_91c:
    ldr r0, _LIT1
    cmp r5, #0x0
    cmpeq r4, r0
    bls .L_a78
    bl func_020498f0
    ldrb r1, [r0, #0x1ab]
    add r1, r1, #0x1
    strb r1, [r0, #0x1ab]
    bl func_020498f0
    ldrb r0, [r0, #0x1ab]
    cmp r0, #0x5
    bls .L_9ec
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x0
    beq .L_96c
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x1
    bne .L_97c
.L_96c:
    bl func_0204bd8c
    mov r0, #0x1
    bl func_0204bf44
    b .L_a78
.L_97c:
    bl func_020498f0
    ldr r0, [r0, #0x1d4]
    bl func_0204bc4c
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    cmp r0, #0x0
    beq .L_9cc
    bl func_020498f0
    mov r1, #0x0
    strb r1, [r0, #0x1ab]
    bl func_020498f0
    mov r4, r0
    bl func_020930b0
    str r0, [r4, #0x1e0]
    str r1, [r4, #0x1e4]
    b .L_a78
.L_9cc:
    bl func_020498f0
    ldr r0, [r0, #0x20c]
    bl func_0204cc20
    cmp r0, #0x0
    bne .L_a78
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_9ec:
    mov r4, #0x1
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    cmp r0, #0x1
    blt .L_a78
    mov r5, #0x2
    mov r6, r4
.L_a08:
    bl func_020498f0
    mov r7, r0
    bl func_020498f0
    add r0, r0, r4
    ldrb r0, [r0, #0x2d0]
    ldr r1, [r7, #0x1d4]
    mov r0, r6, lsl r0
    ands r0, r1, r0
    bne .L_a40
    bl func_020498f0
    add r0, r0, r4
    ldrb r0, [r0, #0x2d0]
    mov r1, r5
    bl func_0204bb5c
.L_a40:
    add r4, r4, #0x1
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    cmp r4, r0
    ble .L_a08
    b .L_a78
.L_a58:
    bl func_020498f0
    add r0, r0, #0x100
    ldrh r0, [r0, #0xb0]
    cmp r5, r0, asr #0x1f
    cmpeq r4, r0
    bls .L_a78
    mov r0, #0x4
    bl func_0204c40c
.L_a78:
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word 0x000082ea
_LIT1: .word 0x00001770
