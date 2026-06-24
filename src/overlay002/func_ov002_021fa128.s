; func_ov002_021fa128 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern func_ov002_021ae400
        .extern func_ov002_021b4618
        .extern func_ov002_021c92fc
        .extern func_ov002_021deb84
        .extern func_ov002_021fa0ec
        .extern func_ov002_0225935c
        .extern func_ov002_022593f4
        .extern func_ov002_0229ade0
        .global func_ov002_021fa128
        .arm
func_ov002_021fa128:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr r1, _LIT0
    mov r7, r0
    ldr r0, [r1, #0x5b4]
    cmp r0, #0x0
    beq .L_2c
    cmp r0, #0x1
    beq .L_6c
    cmp r0, #0x2
    beq .L_9c
    b .L_1cc
.L_2c:
    mov r0, #0x0
    strh r0, [r7, #0x8]
    strh r0, [r7, #0xa]
    strh r0, [r7, #0xe]
    strh r0, [r7, #0xc]
    ldrh r0, [r7, #0x2]
    mov r1, #0x12
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_6c:
    ldrh r0, [r7, #0x2]
    ldrh r1, [r7]
    ldr r2, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0225935c
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_9c:
    bl func_ov002_022593f4
    cmp r0, #0x0
    beq .L_1a8
    ldr r0, _LIT2
    ldr r2, [r0, #0xd74]
    ldr r1, [r0, #0xd78]
    ldr r5, [r0, #0xd70]
    add r6, r2, r1
    mov r0, r5
    mov r1, r6
    bl func_ov002_021c92fc
    add lr, r5, #0x2
    ldr r4, _LIT3
    ldr r1, _LIT4
    and r3, r5, #0x1
    mla ip, r3, r1, r4
    mov r2, #0x14
    mov r4, r0
    mul r1, r6, r2
    add r0, r7, #0x8
    mov r8, lr, lsl #0x1
    ldrh lr, [r0, r8]
    mov r3, #0x1
    add r2, ip, #0x30
    orr r3, lr, r3, lsl r6
    strh r3, [r0, r8]
    ldr r2, [r2, r1]
    mov r1, r5
    mov r0, r2, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r3, r2, lsl #0x12
    mov r0, r0, lsl #0x1
    add r3, r0, r3, lsr #0x1f
    mov r2, r6
    mov r0, #0x28
    bl func_ov002_0229ade0
    mov r0, r4
    bl func_ov002_021b4618
    cmp r0, #0x1
    ldrleh r0, [r7, #0x8]
    orrle r0, r0, r4
    strleh r0, [r7, #0x8]
    ble .L_154
    ldrh r0, [r7, #0xa]
    add r0, r0, #0x1
    strh r0, [r7, #0xa]
.L_154:
    ldrh r0, [r7, #0x8]
    bl func_ov002_021b4618
    ldrh r1, [r7, #0xa]
    add r0, r1, r0
    cmp r0, #0x4
    blt .L_190
    ldrh r0, [r7, #0x2]
    ldrh r2, [r7, #0xc]
    ldrh r1, [r7, #0xe]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    orr r1, r2, r1, lsl #0x10
    bl func_ov002_021deb84
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_190:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    sub r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_1a8:
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    mov r0, #0x29
    bl func_ov002_0229ade0
    ldr r1, _LIT0
    mov r0, #0x0
    str r0, [r1, #0x5b4]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_1cc:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word func_ov002_021fa0ec
_LIT2: .word data_ov002_022d016c
_LIT3: .word data_ov002_022cf16c
_LIT4: .word 0x00000868
