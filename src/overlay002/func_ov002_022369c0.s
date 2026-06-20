; func_ov002_022369c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd744
        .extern data_ov002_022ce288
        .extern data_ov002_022d016c
        .extern func_ov002_021ae400
        .extern func_ov002_021ae4bc
        .extern func_ov002_021af9d0
        .extern func_ov002_021afb74
        .extern func_ov002_021ca440
        .extern func_ov002_021d8288
        .extern func_ov002_021e286c
        .extern func_ov002_021ff3bc
        .extern func_ov002_0223f6c4
        .extern func_ov002_0225368c
        .extern func_ov002_0226b054
        .extern func_ov002_0227adb8
        .global func_ov002_022369c0
        .arm
func_ov002_022369c0:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldrh r4, [r5, #0x2]
    ldr r2, _LIT0
    mov r3, r4, lsl #0x11
    ldr r2, [r2, #0x5a8]
    mov r4, r4, lsl #0x1f
    mov r3, r3, lsr #0x1f
    cmp r2, #0x64
    eor r4, r3, r4, lsr #0x1f
    bgt .L_38
    cmp r2, #0x64
    beq .L_1d4
    b .L_1e4
.L_38:
    sub r2, r2, #0x78
    cmp r2, #0x8
    addls pc, pc, r2, lsl #0x2
    b .L_1e4
    b .L_1c4
    b .L_1e4
    b .L_1e4
    b .L_1e4
    b .L_17c
    b .L_cc
    b .L_ac
    b .L_1e4
    b .L_6c
.L_6c:
    bl func_ov002_0223f6c4
    mov r2, r0
    ldrh r1, [r5]
    mov r0, r4
    bl func_ov002_0225368c
    cmp r0, #0x0
    mov r0, r4
    bne .L_9c
    mov r1, #0x15
    bl func_ov002_021ae400
    mov r0, #0x78
    ldmia sp!, {r3, r4, r5, pc}
.L_9c:
    mov r1, #0x5e
    bl func_ov002_021ae400
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, pc}
.L_ac:
    bl func_ov002_0223f6c4
    mov r3, r0
    ldrh r2, [r5]
    mov r0, r4
    mov r1, #0x6
    bl func_ov002_021af9d0
    mov r0, #0x7d
    ldmia sp!, {r3, r4, r5, pc}
.L_cc:
    bl func_ov002_021ff3bc
    cmp r0, #0x0
    beq .L_168
    bl func_ov002_021afb74
    ldr r1, [r0]
    mov r0, r4
    mov r1, r1, lsl #0x13
    mov r1, r1, lsr #0x13
    bl func_ov002_021ca440
    cmp r0, #0x0
    beq .L_168
    ldr r0, _LIT1
    ldr r0, [r0, r4, lsl #0x2]
    cmp r0, #0x1
    bne .L_130
    bl func_ov002_021afb74
    ldr r1, [r0]
    ldr r0, _LIT2
    mov r1, r1, lsl #0x13
    cmp r0, r1, lsr #0x13
    moveq r1, #0x1
    ldr r0, _LIT3
    movne r1, #0x0
    str r1, [r0, #0xd44]
    b .L_160
.L_130:
    bl func_ov002_021afb74
    mov r4, r0
    bl func_ov002_021afb74
    ldr r0, [r0]
    ldr r1, [r4]
    mov r0, r0, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r1, r0, r1, lsr #0x1f
    mov r0, #0x35
    bl func_ov002_021ae4bc
.L_160:
    mov r0, #0x7c
    ldmia sp!, {r3, r4, r5, pc}
.L_168:
    ldr r0, _LIT3
    mov r1, #0x0
    str r1, [r0, #0xd44]
    mov r0, #0x7c
    ldmia sp!, {r3, r4, r5, pc}
.L_17c:
    ldr r0, _LIT3
    ldr r0, [r0, #0xd44]
    cmp r0, #0x0
    beq .L_1ac
    bl func_ov002_021afb74
    ldrh r2, [r5]
    mov r1, r0
    mov r0, r4
    mov r3, r2, lsl #0x10
    mov r2, #0x1
    bl func_ov002_0227adb8
    b .L_1bc
.L_1ac:
    bl func_ov002_021afb74
    mov r1, r0
    mov r0, r4
    bl func_ov002_021d8288
.L_1bc:
    mov r0, #0x64
    ldmia sp!, {r3, r4, r5, pc}
.L_1c4:
    rsb r0, r4, #0x1
    bl func_ov002_0226b054
    mov r0, #0x64
    ldmia sp!, {r3, r4, r5, pc}
.L_1d4:
    mov r0, r4
    bl func_ov002_021e286c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_1e4:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022cd744
_LIT2: .word 0x000018aa
_LIT3: .word data_ov002_022d016c
