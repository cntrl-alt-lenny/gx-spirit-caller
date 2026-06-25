; func_0200b368 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern Task_PostLocked
        .extern func_0200ae54
        .extern func_0200b178
        .extern func_0200b1a0
        .extern func_0200b1ec
        .extern func_0200b20c
        .extern func_0200b234
        .extern func_0200b2d8
        .extern func_0200b340
        .global func_0200b368
        .arm
func_0200b368:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r0, #0x34
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    movs r4, r0
    beq .L_1f8
    mov r1, r4
    mov r0, #0x0
    mov r2, #0x34
    bl Fill32
    ldr r0, [r5, #0x38]
    mov r1, #0x4
    str r0, [r4, #0x20]
    ldr r0, [r5, #0x48]
    mov r2, #0x0
    str r0, [r4, #0x24]
    ldr r0, [r5, #0x50]
    str r0, [r4, #0x28]
    ldr r0, [r5, #0x58]
    str r0, [r4, #0x2c]
    ldr r0, [r5, #0x5c]
    str r0, [r4, #0x30]
    ldr r0, [r5, #0x38]
    mov r0, r0, lsl #0x2
    bl Task_PostLocked
    str r0, [r4, #0xc]
    cmp r0, #0x0
    beq .L_200
    ldr r1, [r5, #0x3c]
    ldr r2, [r5, #0x38]
    add r1, r5, r1
    bl func_0200b1ec
    ldr r1, [r4, #0x20]
    cmp r1, #0x1f
    ble .L_b4
    mov r0, #0x60
    mul r0, r1, r0
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    str r0, [r4, #0x10]
    cmp r0, #0x0
    beq .L_200
.L_b4:
    ldr r1, [r5, #0x20]
    mov r0, #0x58
    mul r0, r1, r0
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    str r0, [r4]
    cmp r0, #0x0
    beq .L_200
    ldr r1, [r5, #0x24]
    ldr r2, [r5, #0x20]
    add r1, r5, r1
    bl func_0200b178
    ldr r1, [r5, #0x30]
    mov r0, #0x68
    mul r0, r1, r0
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    str r0, [r4, #0x8]
    cmp r0, #0x0
    beq .L_200
    ldr r1, [r5, #0x34]
    ldr r2, [r5, #0x30]
    add r1, r5, r1
    bl func_0200b20c
    ldr r0, [r5, #0x48]
    cmp r0, #0x0
    ble .L_158
    mov r0, r0, lsl #0x5
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    str r0, [r4, #0x18]
    cmp r0, #0x0
    beq .L_200
    ldr r1, [r5, #0x4c]
    ldr r3, [r5, #0x48]
    mov r2, r5
    add r1, r5, r1
    bl func_0200b234
.L_158:
    ldr r1, [r5, #0x50]
    cmp r1, #0x0
    ble .L_198
    mov r0, #0xc
    mul r0, r1, r0
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    str r0, [r4, #0x1c]
    cmp r0, #0x0
    beq .L_200
    ldr r1, [r5, #0x54]
    ldr r3, [r5, #0x50]
    mov r2, r5
    add r1, r5, r1
    bl func_0200b2d8
.L_198:
    ldr r0, [r5, #0x28]
    mov r1, #0x4
    mov r0, r0, lsl #0x3
    mov r2, #0x0
    bl Task_PostLocked
    str r0, [r4, #0x4]
    cmp r0, #0x0
    beq .L_200
    ldr r1, [r5, #0x2c]
    ldr r3, [r5, #0x28]
    mov r2, r5
    add r1, r5, r1
    bl func_0200b1a0
    ldr r0, [r5, #0x40]
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    str r0, [r4, #0x14]
    cmp r0, #0x0
    beq .L_200
    ldr r1, [r5, #0x44]
    ldr r2, [r5, #0x40]
    add r1, r5, r1
    bl func_0200b340
.L_1f8:
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
.L_200:
    cmp r4, #0x0
    beq .L_210
    mov r0, r4
    bl func_0200ae54
.L_210:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
