; func_0204cc20 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020498dc
        .extern func_020498f0
        .extern func_0204b850
        .extern func_0204bdc4
        .extern func_0204bf00
        .extern func_0204bf44
        .extern func_0204cf7c
        .extern func_02065788
        .extern func_020673dc
        .extern func_020930b0
        .global func_0204cc20
        .arm
func_0204cc20:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    bl func_020498f0
    ldrb r0, [r0, #0x17]
    cmp r0, #0x0
    beq .L_1b88
    bl func_020498f0
    mov r4, r0
    bl func_020498f0
    ldr r1, [r4, #0x20]
    ldr r0, [r0, #0x200]
    cmp r1, r0
    moveq r4, #0x0
    beq .L_1b8c
.L_1b88:
    mov r4, #0x1
.L_1b8c:
    cmp r4, #0x0
    beq .L_1bb8
    bl func_020498f0
    mov r1, #0x0
    strb r1, [r0, #0x17]
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x20]
    bl func_020498f0
    ldr r0, [r0, #0x10]
    bl func_020673dc
.L_1bb8:
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    cmp r0, #0x1f
    bcs .L_1be8
    bl func_020498f0
    mov r6, r0
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    mov r1, #0x0
    add r0, r0, #0x1
    add r0, r6, r0, lsl #0x2
    str r1, [r0, #0xf4]
.L_1be8:
    bl func_020498f0
    mov r1, #0xff
    strb r1, [r0, #0x3cc]
    bl func_020498f0
    ldr r0, [r0, #0x19c]
    cmp r0, #0x0
    beq .L_1c1c
    bl func_020498f0
    ldr r0, [r0, #0x19c]
    bl func_02065788
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x19c]
.L_1c1c:
    bl func_020498f0
    mov r6, r0
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    strb r0, [r6, #0x14]
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x204]
    cmp r4, #0x0
    bne .L_1c5c
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x3
    beq .L_1d64
    bl func_0204bf00
    b .L_1d64
.L_1c5c:
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x0
    bne .L_1c98
    mov r0, #0x3
    bl func_020498dc
    bl func_020498f0
    mov r1, #0x2
    str r1, [r0, #0xe8]
    bl func_020498f0
    mov r4, r0
    bl func_020930b0
    str r0, [r4, #0xec]
    str r1, [r4, #0xf0]
    b .L_1d64
.L_1c98:
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x1
    bne .L_1cc4
    mov r0, #0x4
    bl func_020498dc
    mov r1, #0x0
    mov r2, r1
    mov r0, #0x1
    bl func_0204cf7c
    b .L_1d64
.L_1cc4:
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x2
    bne .L_1d64
    mov r0, #0xe
    bl func_020498dc
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x1d8]
    bl func_020498f0
    add r1, r0, #0x100
    mov r2, #0x0
    mov r0, r5
    strh r2, [r1, #0xb2]
    bl func_0204bdc4
    mov r5, #0x1
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    cmp r0, #0x1
    blt .L_1d4c
    mov r4, #0xd
.L_1d18:
    bl func_020498f0
    add r0, r0, r5, lsl #0x2
    ldr r0, [r0, #0xf4]
    mov r1, r4
    bl func_0204b850
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    add r5, r5, #0x1
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    cmp r5, r0
    ble .L_1d18
.L_1d4c:
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    cmp r0, #0x0
    bne .L_1d64
    mov r0, #0x2
    bl func_0204bf44
.L_1d64:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
