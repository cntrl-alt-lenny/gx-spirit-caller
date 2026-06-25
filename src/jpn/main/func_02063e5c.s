; func_02063e5c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020552bc
        .extern func_02060f68
        .extern func_02061ce8
        .extern func_02061f30
        .extern func_02062888
        .extern func_02064364
        .global func_02063e5c
        .arm
func_02063e5c:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    mov r6, r0
    ldr r3, [r6, #0xc]
    mov r5, r1
    mov r4, r2
    cmp r3, #0x3
    beq .L_38
    bl func_02064364
    cmp r0, #0x0
    movne r0, #0x1
    add sp, sp, #0x10
    moveq r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_38:
    cmp r4, #0x20
    bge .L_58
    bl func_02064364
    cmp r0, #0x0
    movne r0, #0x1
    add sp, sp, #0x10
    moveq r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_58:
    mov r0, r5
    add r1, r6, #0x68
    bl func_02060f68
    cmp r0, #0x0
    bne .L_88
    mov r0, r6
    bl func_02064364
    cmp r0, #0x0
    movne r0, #0x1
    add sp, sp, #0x10
    moveq r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_88:
    ldr r0, [r6, #0x8]
    ldr r0, [r0, #0x20]
    cmp r0, #0x0
    bne .L_c4
    mov r0, r6
    bl func_02062888
    cmp r0, #0x0
    addeq sp, sp, #0x10
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r0, r6
    bl func_02061f30
    add sp, sp, #0x10
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_c4:
    mov r0, #0x4
    str r0, [r6, #0xc]
    bl func_020552bc
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
    bl func_02061ce8
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
