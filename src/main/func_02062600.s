; func_02062600 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02055324
        .extern func_0206238c
        .extern func_02062468
        .extern func_020627a8
        .extern func_02064790
        .extern func_02064dfc
        .global func_02062600
        .arm
func_02062600:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x10
    mov r6, r0
    mov r5, r1
    mov r0, r2
    add r1, sp, #0x8
    add r2, sp, #0x0
    mov r4, r3
    bl func_02064dfc
    cmp r0, #0x0
    beq .L_d8
    ldr r2, [sp, #0x8]
    cmp r2, #0x0
    beq .L_d8
    ldrh r3, [sp]
    cmp r3, #0x0
    bne .L_e4
.L_d8:
    add sp, sp, #0x10
    mov r0, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_e4:
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
    bl func_02062468
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
    bl func_0206238c
    movs r4, r0
    beq .L_178
    ldr r0, [sp, #0x4]
    bl func_02064790
    add sp, sp, #0x10
    mov r0, r4
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_178:
    ldr r0, [sp, #0x34]
    cmp r0, #0x0
    bne .L_19c
    cmp r5, #0x0
    ldrne r0, [sp, #0x4]
    add sp, sp, #0x10
    strne r0, [r5]
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_19c:
    ldr r1, [sp, #0x4]
    ldr r0, [r1, #0x24]
    add r0, r0, #0x1
    str r0, [r1, #0x24]
    mov r4, #0x0
    mov r7, #0x1
.L_1b4:
    mov r0, r6
    bl func_020627a8
    ldr r0, [sp, #0x4]
    ldr r0, [r0, #0xc]
    cmp r0, #0x5
    movge r8, r7
    movlt r8, r4
    cmp r8, #0x0
    bne .L_1e0
    mov r0, r7
    bl func_02055324
.L_1e0:
    cmp r8, #0x0
    beq .L_1b4
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
