; func_020637e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0206392c
        .extern func_02063954
        .extern func_02063a6c
        .extern func_02063c30
        .extern func_02064228
        .extern func_02064338
        .extern func_02064364
        .extern func_0206440c
        .extern func_02064430
        .global func_020637e0
        .arm
func_020637e0:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x10
    mov r6, r3
    mov r4, r0
    mov r8, r1
    mov r7, r2
    cmp r6, #0x7
    bge .L_38
    bl func_02064364
    cmp r0, #0x0
    movne r0, #0x1
    add sp, sp, #0x10
    moveq r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_38:
    mov r0, r7
    mov r1, #0x3
    bl func_02064430
    mov r5, r0
    mov r0, r7
    mov r1, #0x5
    bl func_02064430
    mov r1, r0
    mov r0, r4
    bl func_02064228
    cmp r0, #0x0
    addeq sp, sp, #0x10
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldrh r1, [r4, #0x66]
    cmp r5, r1
    bne .L_c4
    mov r0, r4
    bl func_0206392c
    mov r0, r4
    mov r1, r8
    add r2, r7, #0x7
    sub r3, r6, #0x7
    bl func_02063c30
    cmp r0, #0x0
    addeq sp, sp, #0x10
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    mov r0, r4
    bl func_02063954
    cmp r0, #0x0
    movne r0, #0x1
    add sp, sp, #0x10
    moveq r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_c4:
    mov r0, r5
    bl func_0206440c
    cmp r0, #0x0
    bge .L_e8
    mov r0, r4
    bl func_0206392c
    add sp, sp, #0x10
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_e8:
    sub r0, r6, #0x7
    str r0, [sp]
    add ip, sp, #0x8
    mov r0, r4
    mov r1, r8
    mov r2, r5
    add r3, r7, #0x7
    str ip, [sp, #0x4]
    bl func_02063a6c
    cmp r0, #0x0
    addeq sp, sp, #0x10
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r0, [sp, #0x8]
    cmp r0, #0x0
    beq .L_140
    mov r0, r4
    bl func_02064338
    cmp r0, #0x0
    addeq sp, sp, #0x10
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
.L_140:
    mov r0, #0x1
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
