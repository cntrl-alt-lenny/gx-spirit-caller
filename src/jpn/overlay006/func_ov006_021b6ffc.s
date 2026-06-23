; func_ov006_021b6ffc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02009730
        .extern func_0202b95c
        .extern func_ov006_021b6f10
        .global func_ov006_021b6ffc
        .arm
func_ov006_021b6ffc:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    mov sl, r0
    bl func_02009730
    mov r8, #0x0
    mov fp, r0
    str r8, [sp]
.L_1c:
    ldr r0, [sp]
    cmp r0, #0x0
    cmpne r0, #0x4
    beq .L_124
    cmp r0, #0x1
    beq .L_50
    cmp r0, #0x2
    beq .L_60
    cmp r0, #0x3
    addeq r0, sl, #0xe60
    addeq r0, r0, #0x7000
    streq r0, [sp, #0x4]
    b .L_6c
.L_50:
    add r0, sl, #0xa60
    add r0, r0, #0x7000
    str r0, [sp, #0x4]
    b .L_6c
.L_60:
    add r0, sl, #0xc60
    add r0, r0, #0x7000
    str r0, [sp, #0x4]
.L_6c:
    ldr r0, [sp]
    mov r7, #0x0
    add r0, sl, r0, lsl #0x1
    add r0, r0, #0x8100
    ldrh r6, [r0, #0x60]
    cmp r6, #0x0
    ble .L_124
    ldr r9, [sp, #0x4]
.L_8c:
    ldrh r2, [r9]
    mov r0, sl
    mov r1, #0x3
    mov r3, #0x0
    bl func_ov006_021b6f10
    mov r5, r0
    ldrh r2, [r9]
    mov r0, sl
    mov r1, #0x1
    mov r3, #0x0
    bl func_ov006_021b6f10
    mov r4, r0
    ldrh r2, [r9]
    mov r0, sl
    mov r1, #0x2
    mov r3, #0x0
    bl func_ov006_021b6f10
    add r0, r4, r0
    add r4, r5, r0
    ldrh r0, [r9]
    bl func_0202b95c
    cmp r4, r0
    ble .L_114
    cmp r4, #0x1
    cmpeq r0, #0x0
    bne .L_108
    cmp fp, #0x0
    beq .L_108
    cmp r8, #0x0
    moveq r8, #0x1
    beq .L_114
.L_108:
    add sp, sp, #0x8
    ldrh r0, [r9]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_114:
    add r9, r9, #0x4
    add r7, r7, #0x1
    cmp r7, r6
    blt .L_8c
.L_124:
    ldr r0, [sp]
    add r0, r0, #0x1
    str r0, [sp]
    cmp r0, #0x5
    blt .L_1c
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
