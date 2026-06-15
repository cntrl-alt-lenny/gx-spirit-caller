; func_02063ed0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02055330
        .extern func_02060fdc
        .extern func_02061d5c
        .extern func_02061fa4
        .extern func_020628fc
        .extern func_020643d8
        .global func_02063ed0
        .arm
func_02063ed0:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    mov r6, r0
    ldr r3, [r6, #0xc]
    mov r5, r1
    mov r4, r2
    cmp r3, #0x3
    beq .L_264
    bl func_020643d8
    cmp r0, #0x0
    movne r0, #0x1
    add sp, sp, #0x10
    moveq r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_264:
    cmp r4, #0x20
    bge .L_284
    bl func_020643d8
    cmp r0, #0x0
    movne r0, #0x1
    add sp, sp, #0x10
    moveq r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_284:
    mov r0, r5
    add r1, r6, #0x68
    bl func_02060fdc
    cmp r0, #0x0
    bne .L_2b4
    mov r0, r6
    bl func_020643d8
    cmp r0, #0x0
    movne r0, #0x1
    add sp, sp, #0x10
    moveq r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_2b4:
    ldr r0, [r6, #0x8]
    ldr r0, [r0, #0x20]
    cmp r0, #0x0
    bne .L_2f0
    mov r0, r6
    bl func_020628fc
    cmp r0, #0x0
    addeq sp, sp, #0x10
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r0, r6
    bl func_02061fa4
    add sp, sp, #0x10
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_2f0:
    mov r0, #0x4
    str r0, [r6, #0xc]
    bl func_02055330
    ldr r2, [r6, #0x8c]
    add r1, r5, #0x20
    sub r0, r0, r2
    str r0, [sp]
    str r1, [sp, #0x4]
    sub r0, r4, #0x20
    str r0, [sp, #0x8]
    ldrh r3, [r6, #0x4]
    ldr r0, [r6, #0x8]
    ldr r2, [r6]
    mov r1, r6
    bl func_02061d5c
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
