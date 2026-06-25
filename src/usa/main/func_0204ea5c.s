; func_0204ea5c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Copy32
        .extern data_020ff888
        .extern data_020ff908
        .extern func_0204987c
        .extern func_0204e8a0
        .extern func_0204e944
        .extern func_0209150c
        .extern func_02092fc8
        .extern func_02094688
        .global func_0204ea5c
        .arm
func_0204ea5c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x224
    mov fp, r0
    str r1, [sp, #0x4]
    str r2, [sp, #0x8]
    str r3, [sp, #0xc]
    ldr sl, [sp, #0x248]
    ldr r9, [sp, #0x24c]
    mov r8, #0x0
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x0
    beq .L_5c
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x3
    beq .L_54
    bl func_0204987c
    ldrb r0, [r0, #0x19e]
    cmp r0, #0x0
    beq .L_7c
.L_54:
    cmp fp, #0x6
    bne .L_7c
.L_5c:
    ldr r1, [sp, #0x8]
    ldr r2, [sp, #0xc]
    mov r0, fp
    mov r3, sl
    str r9, [sp]
    bl func_0204e944
    mov r4, r0
    b .L_11c
.L_7c:
    cmp sl, #0x0
    beq .L_f4
    cmp r9, #0x0
    beq .L_f4
    ldr r3, [sl]
    ldr r2, _LIT0
    add r0, sp, #0x20
    mov r1, #0x200
    bl func_0209150c
    mov r8, r0
    cmp r9, #0x1
    mov r7, #0x1
    ble .L_f4
    add r6, sp, #0x10
    mov r5, #0x10
.L_b8:
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
    blt .L_b8
.L_f4:
    add r0, sp, #0x20
    mov r1, #0x0
    strb r1, [r0, r8]
    bl func_0204987c
    ldr r0, [r0]
    ldr r2, [sp, #0x4]
    add r3, sp, #0x20
    mov r1, fp
    bl func_0204e8a0
    mov r4, r0
.L_11c:
    cmp fp, #0x2
    beq .L_13c
    cmp fp, #0x6
    beq .L_13c
    add r0, fp, #0xf8
    and r0, r0, #0xff
    cmp r0, #0x1
    bhi .L_1ac
.L_13c:
    bl func_0204987c
    strb fp, [r0, #0x3c4]
    bl func_0204987c
    add r1, r0, #0x300
    ldr r0, [sp, #0xc]
    strh r0, [r1, #0xc6]
    bl func_0204987c
    ldr r1, [sp, #0x8]
    str r1, [r0, #0x3c8]
    bl func_0204987c
    ldr r1, [sp, #0x4]
    str r1, [r0, #0x44c]
    bl func_0204987c
    str r9, [r0, #0x450]
    bl func_0204987c
    mov r5, r0
    bl func_02092fc8
    str r0, [r5, #0x454]
    str r1, [r5, #0x458]
    cmp sl, #0x0
    beq .L_1ac
    cmp r9, #0x0
    beq .L_1ac
    bl func_0204987c
    add r1, r0, #0x3cc
    mov r0, sl
    mov r2, r9, lsl #0x2
    bl Copy32
.L_1ac:
    mov r0, r4
    add sp, sp, #0x224
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_020ff888
_LIT1: .word data_020ff908
