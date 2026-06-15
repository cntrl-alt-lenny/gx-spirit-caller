; func_0204fe54 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020498dc
        .extern func_020498f0
        .extern func_0204b0d0
        .extern func_0204bb5c
        .extern func_0204c40c
        .global func_0204fe54
        .arm
func_0204fe54:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    mov r4, r2
    cmp r1, #0x2
    beq .L_1bc
    cmp r1, #0x3
    beq .L_268
    cmp r1, #0x4
    beq .L_330
    ldmia sp!, {r4, r5, r6, pc}
.L_1bc:
    bl func_020498f0
    ldr r0, [r0, #0x1a0]
    cmp r0, #0x1
    bne .L_258
    ldrb r0, [r4]
    cmp r0, #0x1
    bne .L_1e4
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x20c]
.L_1e4:
    ldrb r6, [r4, #0x1]
    bl func_020498f0
    ldrb r1, [r4, #0x2]
    add r0, r0, r6
    strb r1, [r0, #0x2d0]
    bl func_020498f0
    mov r4, r0
    bl func_020498f0
    ldr r1, [r0, #0x200]
    add r0, r4, r6, lsl #0x2
    str r1, [r0, #0xf4]
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x0
    beq .L_230
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x1
    bne .L_244
.L_230:
    bl func_020498f0
    mov r4, r0
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    strb r0, [r4, #0x16]
.L_244:
    bl func_020498f0
    mov r1, #0x0
    strb r1, [r0, #0x1ad]
    mov r0, #0x9
    bl func_020498dc
.L_258:
    mov r0, r5
    mov r1, #0x3
    bl func_0204bb5c
    ldmia sp!, {r4, r5, r6, pc}
.L_268:
    bl func_020498f0
    ldr r0, [r0, #0x1a0]
    cmp r0, #0x10
    bne .L_320
    bl func_020498f0
    ldr r2, [r0, #0x1d4]
    mov r1, #0x1
    orr r1, r2, r1, lsl r5
    str r1, [r0, #0x1d4]
    ldrb r1, [r4]
    ldrb r0, [r4, #0x1]
    orr r4, r1, r0, lsl #0x8
    bl func_020498f0
    add r0, r0, #0x100
    ldrh r0, [r0, #0xb0]
    cmp r4, r0
    ble .L_2b8
    bl func_020498f0
    add r0, r0, #0x100
    strh r4, [r0, #0xb0]
.L_2b8:
    mov r0, #0x0
    bl func_0204b0d0
    mov r4, r0
    bl func_020498f0
    ldr r0, [r0, #0x1d4]
    cmp r4, r0
    ldmneia sp!, {r4, r5, r6, pc}
    mov r5, #0x1
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    cmp r0, #0x1
    blt .L_314
    mov r4, #0x4
.L_2ec:
    bl func_020498f0
    add r0, r0, r5
    ldrb r0, [r0, #0x2d0]
    mov r1, r4
    bl func_0204bb5c
    add r5, r5, #0x1
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    cmp r5, r0
    ble .L_2ec
.L_314:
    mov r0, #0x11
    bl func_020498dc
    ldmia sp!, {r4, r5, r6, pc}
.L_320:
    mov r0, r5
    mov r1, #0x4
    bl func_0204bb5c
    ldmia sp!, {r4, r5, r6, pc}
.L_330:
    bl func_020498f0
    ldr r0, [r0, #0x1a0]
    cmp r0, #0x9
    ldmneia sp!, {r4, r5, r6, pc}
    mov r0, #0x4
    bl func_0204c40c
    ldmia sp!, {r4, r5, r6, pc}
