; func_02064228 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02053de4
        .extern func_0205405c
        .extern func_020540cc
        .extern func_020612c8
        .extern func_0206440c
        .global func_02064228
        .arm
func_02064228:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r4, r0
    ldr r0, [r4, #0x60]
    mov r7, r1
    bl func_020540cc
    movs r6, r0
    addeq sp, sp, #0x4
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    cmp r6, #0x0
    mov r5, #0x0
    ble .L_60
.L_34:
    ldr r0, [r4, #0x60]
    mov r1, r5
    bl func_0205405c
    ldrh r0, [r0, #0x8]
    mov r1, r7
    bl func_0206440c
    cmp r0, #0x0
    bge .L_60
    add r5, r5, #0x1
    cmp r5, r6
    blt .L_34
.L_60:
    cmp r5, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    cmp r5, #0x0
    sub r5, r5, #0x1
    beq .L_94
.L_7c:
    ldr r0, [r4, #0x60]
    mov r1, r5
    bl func_02053de4
    cmp r5, #0x0
    sub r5, r5, #0x1
    bne .L_7c
.L_94:
    ldr r0, [r4, #0x60]
    bl func_020540cc
    movs r6, r0
    moveq r0, #0x0
    streq r0, [r4, #0x58]
    addeq sp, sp, #0x4
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    ldr r0, [r4, #0x60]
    mov r1, #0x0
    bl func_0205405c
    cmp r6, #0x0
    ldr r7, [r0]
    mov r5, #0x0
    ble .L_f4
.L_d0:
    ldr r0, [r4, #0x60]
    mov r1, r5
    bl func_0205405c
    ldr r1, [r0]
    add r5, r5, #0x1
    sub r1, r1, r7
    str r1, [r0]
    cmp r5, r6
    blt .L_d0
.L_f4:
    mov r2, r7
    add r0, r4, #0x50
    mov r1, #0x0
    bl func_020612c8
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
