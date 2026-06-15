; func_0204bc4c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02046b3c
        .extern func_020498f0
        .extern func_0204b134
        .extern func_0204d438
        .extern func_0204ead0
        .global func_0204bc4c
        .arm
func_0204bc4c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x108
    mov r9, #0x0
    mov sl, r0
    mov r8, r9
    mov r7, #0x1
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    cmp r0, #0x1
    blt .L_c08
    add r4, sp, #0x8
    add r5, sp, #0x88
    mov r6, r7
.L_bb0:
    bl func_020498f0
    add r0, r0, r7
    ldrb r0, [r0, #0x2d0]
    mov r0, r6, lsl r0
    ands r0, sl, r0
    beq .L_be0
    bl func_020498f0
    add r0, r0, r7, lsl #0x2
    ldr r0, [r0, #0xf4]
    str r0, [r5, r8, lsl #0x2]
    add r8, r8, #0x1
    b .L_bf4
.L_be0:
    bl func_020498f0
    add r0, r0, r7, lsl #0x2
    ldr r0, [r0, #0xf4]
    str r0, [r4, r9, lsl #0x2]
    add r9, r9, #0x1
.L_bf4:
    add r7, r7, #0x1
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    cmp r7, r0
    ble .L_bb0
.L_c08:
    cmp r8, #0x0
    mov sl, #0x0
    ble .L_c60
    add r7, sp, #0x8
    add r5, sp, #0x88
    mov r4, sl
    mov r6, #0x10
.L_c24:
    str r7, [sp]
    str r9, [sp, #0x4]
    ldr r1, [r5, sl, lsl #0x2]
    mov r0, r6
    mov r2, r4
    mov r3, r4
    bl func_0204ead0
    bl func_0204d438
    cmp r0, #0x0
    addne sp, sp, #0x108
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    add sl, sl, #0x1
    cmp sl, r8
    blt .L_c24
.L_c60:
    bl func_020498f0
    mov r1, #0x2
    strb r1, [r0, #0x1a8]
    cmp r9, #0x0
    mov r6, #0x0
    ble .L_ca4
    add r5, sp, #0x8
    mov r4, r6
.L_c80:
    ldr r0, [r5, r6, lsl #0x2]
    mov r1, r4
    bl func_0204b134
    cmp r0, #0xff
    beq .L_c98
    bl func_02046b3c
.L_c98:
    add r6, r6, #0x1
    cmp r6, r9
    blt .L_c80
.L_ca4:
    bl func_020498f0
    mov r1, #0x0
    strb r1, [r0, #0x1a8]
    mov r0, #0x1
    add sp, sp, #0x108
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
