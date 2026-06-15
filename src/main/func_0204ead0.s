; func_0204ead0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Copy32
        .extern data_020ff968
        .extern data_020ff9e8
        .extern func_020498f0
        .extern func_0204e914
        .extern func_0204e9b8
        .extern func_0209150c
        .extern func_020930b0
        .extern func_02094688
        .global func_0204ead0
        .arm
func_0204ead0:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x224
    mov fp, r0
    str r1, [sp, #0x4]
    str r2, [sp, #0x8]
    str r3, [sp, #0xc]
    ldr sl, [sp, #0x248]
    ldr r9, [sp, #0x24c]
    mov r8, #0x0
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x0
    beq .L_16c4
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x3
    beq .L_16bc
    bl func_020498f0
    ldrb r0, [r0, #0x1a6]
    cmp r0, #0x0
    beq .L_16e4
.L_16bc:
    cmp fp, #0x6
    bne .L_16e4
.L_16c4:
    ldr r1, [sp, #0x8]
    ldr r2, [sp, #0xc]
    mov r0, fp
    mov r3, sl
    str r9, [sp]
    bl func_0204e9b8
    mov r4, r0
    b .L_1784
.L_16e4:
    cmp sl, #0x0
    beq .L_175c
    cmp r9, #0x0
    beq .L_175c
    ldr r3, [sl]
    ldr r2, _LIT0
    add r0, sp, #0x20
    mov r1, #0x200
    bl func_0209150c
    mov r8, r0
    cmp r9, #0x1
    mov r7, #0x1
    ble .L_175c
    add r6, sp, #0x10
    mov r5, #0x10
.L_1720:
    ldr r3, [sl, r7, lsl #0x2]
    ldr r2, _LIT1
    mov r0, r6
    mov r1, r5
    bl func_0209150c
    mov r4, r0
    add r1, sp, #0x20
    mov r0, r6
    add r1, r1, r8
    mov r2, r4
    bl func_02094688
    add r7, r7, #0x1
    add r8, r8, r4
    cmp r7, r9
    blt .L_1720
.L_175c:
    add r0, sp, #0x20
    mov r1, #0x0
    strb r1, [r0, r8]
    bl func_020498f0
    ldr r0, [r0]
    ldr r2, [sp, #0x4]
    add r3, sp, #0x20
    mov r1, fp
    bl func_0204e914
    mov r4, r0
.L_1784:
    cmp fp, #0x2
    beq .L_17a4
    cmp fp, #0x6
    beq .L_17a4
    add r0, fp, #0xf8
    and r0, r0, #0xff
    cmp r0, #0x1
    bhi .L_1814
.L_17a4:
    bl func_020498f0
    strb fp, [r0, #0x3cc]
    bl func_020498f0
    add r1, r0, #0x300
    ldr r0, [sp, #0xc]
    strh r0, [r1, #0xce]
    bl func_020498f0
    ldr r1, [sp, #0x8]
    str r1, [r0, #0x3d0]
    bl func_020498f0
    ldr r1, [sp, #0x4]
    str r1, [r0, #0x454]
    bl func_020498f0
    str r9, [r0, #0x458]
    bl func_020498f0
    mov r5, r0
    bl func_020930b0
    str r0, [r5, #0x45c]
    str r1, [r5, #0x460]
    cmp sl, #0x0
    beq .L_1814
    cmp r9, #0x0
    beq .L_1814
    bl func_020498f0
    add r1, r0, #0x3d4
    mov r0, sl
    mov r2, r9, lsl #0x2
    bl Copy32
.L_1814:
    mov r0, r4
    add sp, sp, #0x224
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_020ff968
_LIT1: .word data_020ff9e8
