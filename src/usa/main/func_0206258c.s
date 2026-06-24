; func_0206258c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020552b0
        .extern func_02062318
        .extern func_020623f4
        .extern func_02062734
        .extern func_0206471c
        .extern func_02064d88
        .global func_0206258c
        .arm
func_0206258c:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x10
    mov r6, r0
    mov r5, r1
    mov r0, r2
    add r1, sp, #0x8
    add r2, sp, #0x0
    mov r4, r3
    bl func_02064d88
    cmp r0, #0x0
    beq .L_44
    ldr r2, [sp, #0x8]
    cmp r2, #0x0
    beq .L_44
    ldrh r3, [sp]
    cmp r3, #0x0
    bne .L_50
.L_44:
    add sp, sp, #0x10
    mov r0, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_50:
    mov r1, r2, lsr #0x18
    mov r0, r2, lsr #0x8
    mov r7, r2, lsl #0x8
    and r1, r1, #0xff
    and r0, r0, #0xff00
    mov ip, r2, lsl #0x18
    orr r0, r1, r0
    and r7, r7, #0xff0000
    and r1, ip, #-16777216
    orr r0, r7, r0
    orr r0, r1, r0
    and r0, r0, #-536870912
    cmp r0, #-536870912
    addeq sp, sp, #0x10
    moveq r0, #0x4
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    add r1, sp, #0x4
    mov r0, r6
    bl func_020623f4
    cmp r0, #0x0
    addne sp, sp, #0x10
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r1, [sp, #0x2c]
    ldr r0, [sp, #0x4]
    ldr r2, [sp, #0x28]
    str r1, [r0, #0x20]
    ldr r0, [sp, #0x4]
    ldr r3, [sp, #0x30]
    mov r1, r4
    bl func_02062318
    movs r4, r0
    beq .L_e4
    ldr r0, [sp, #0x4]
    bl func_0206471c
    add sp, sp, #0x10
    mov r0, r4
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_e4:
    ldr r0, [sp, #0x34]
    cmp r0, #0x0
    bne .L_108
    cmp r5, #0x0
    ldrne r0, [sp, #0x4]
    add sp, sp, #0x10
    strne r0, [r5]
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_108:
    ldr r1, [sp, #0x4]
    ldr r0, [r1, #0x24]
    add r0, r0, #0x1
    str r0, [r1, #0x24]
    mov r4, #0x0
    mov r7, #0x1
.L_120:
    mov r0, r6
    bl func_02062734
    ldr r0, [sp, #0x4]
    ldr r0, [r0, #0xc]
    cmp r0, #0x5
    movge r8, r7
    movlt r8, r4
    cmp r8, #0x0
    bne .L_14c
    mov r0, r7
    bl func_020552b0
.L_14c:
    cmp r8, #0x0
    beq .L_120
    ldr r1, [sp, #0x4]
    ldr r0, [r1, #0x24]
    sub r0, r0, #0x1
    str r0, [r1, #0x24]
    ldr r1, [sp, #0x4]
    ldr r0, [r1, #0xc]
    cmp r0, #0x5
    streq r1, [r5]
    ldr r0, [sp, #0x4]
    ldr r0, [r0, #0x18]
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
