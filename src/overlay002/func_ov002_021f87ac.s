; func_ov002_021f87ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd744
        .extern data_ov002_022ce288
        .extern data_ov002_022ce884
        .extern data_ov002_022d016c
        .extern data_ov002_022d0250
        .extern func_0202de9c
        .extern func_ov002_021ae4bc
        .extern func_ov002_021b9aa8
        .extern func_ov002_021df62c
        .extern func_ov002_021e278c
        .extern func_ov002_021e2d94
        .extern func_ov002_02257b48
        .extern func_ov002_0227ddf8
        .global func_ov002_021f87ac
        .arm
func_ov002_021f87ac:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    ldr r2, _LIT0
    mov r8, r0
    ldr r2, [r2, #0x5b4]
    mov r5, r1
    cmp r2, #0x0
    beq .L_30
    cmp r2, #0x1
    beq .L_13c
    cmp r2, #0x2
    beq .L_194
    b .L_1f8
.L_30:
    ldrh r0, [r8, #0x2]
    mov r2, #0x5
    mov r3, #0x0
    mov r1, r0, lsl #0x1a
    mov r4, r0, lsl #0x1f
    mov r0, r4, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021e2d94
    mov r0, r8
    mov r1, r5
    bl func_ov002_02257b48
    cmp r0, #0x0
    mvneq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r6, _LIT0
    mov r5, #0x0
    ldr r0, [r6, #0x5d4]
    cmp r0, #0x0
    bls .L_134
    ldr r7, _LIT1
    ldr r4, _LIT2
    mov r9, r6
.L_88:
    ldrb r0, [r6, #0x5dc]
    cmp r0, #0x19
    bne .L_11c
    ldr r1, [r7]
    ldrh r0, [r8, #0x2]
    mov r2, r1, lsl #0x16
    mov r2, r2, lsr #0x1f
    mov r0, r0, lsl #0x1f
    cmp r2, r0, lsr #0x1f
    bne .L_11c
    mov r0, r1, lsl #0x17
    mov r0, r0, lsr #0x15
    ldrh r0, [r4, r0]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202de9c
    cmp r0, #0x0
    bne .L_11c
    ldrh r1, [r8, #0x2]
    ldr r0, [r7]
    mov r2, r1, lsl #0x1f
    mov r1, r0, lsl #0x17
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x17
    bl func_ov002_021b9aa8
    cmp r0, #0x0
    blt .L_11c
    ldr r0, [r7]
    ldr r1, _LIT0
    mov r0, r0, lsl #0x17
    mov r0, r0, lsr #0x17
    strh r0, [r8, #0x8]
    ldr r2, [r1, #0x5b4]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_11c:
    ldr r0, [r9, #0x5d4]
    add r5, r5, #0x1
    cmp r5, r0
    add r6, r6, #0x1
    add r7, r7, #0x4
    bcc .L_88
.L_134:
    mvn r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_13c:
    ldrh r2, [r8, #0x2]
    ldr r1, _LIT3
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    ldr r1, [r1, r2, lsl #0x2]
    cmp r1, #0x1
    bne .L_168
    bl func_ov002_0227ddf8
    ldr r1, _LIT4
    str r0, [r1, #0xd44]
    b .L_17c
.L_168:
    ldrh r1, [r8, #0x4]
    mov r0, #0xfa
    mov r1, r1, lsl #0x11
    mov r1, r1, lsr #0x17
    bl func_ov002_021ae4bc
.L_17c:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_194:
    ldr r0, _LIT4
    ldr r0, [r0, #0xd44]
    cmp r0, #0x0
    mvneq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldrh r1, [r8, #0x2]
    ldrh r0, [r8, #0x4]
    mov r3, r1, lsl #0x1f
    mov r2, r0, lsl #0x11
    mov r1, r1, lsl #0x1a
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    mov r2, r2, lsr #0x17
    bl func_ov002_021df62c
    ldrh r0, [r8, #0x2]
    ldrh r1, [r8, #0x8]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e278c
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_1f8:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022ce884
_LIT2: .word data_ov002_022d0250
_LIT3: .word data_ov002_022cd744
_LIT4: .word data_ov002_022d016c
