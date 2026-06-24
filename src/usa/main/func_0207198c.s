; func_0207198c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0207214c
        .extern func_02072288
        .extern func_0207229c
        .extern func_020723e0
        .extern func_020918f0
        .global func_0207198c
        .arm
func_0207198c:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r7, r0
    mov r6, r1
    mov r5, r2
    bl func_020723e0
    movs r4, r0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, r6, r7, lr}
    bxeq lr
    ldrb r1, [r4, #0x8]
    cmp r1, #0x4
    beq .L_b8
    cmp r1, #0x7
    beq .L_48
    cmp r1, #0x8
    beq .L_70
    b .L_e0
.L_48:
    ldr r2, [r4, #0x24]
    mov r1, #0x0
    add r2, r2, #0x1
    str r2, [r4, #0x24]
    bl func_0207229c
    mov r0, #0x9
    add sp, sp, #0x4
    strb r0, [r4, #0x8]
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_70:
    ldr r2, [r4, #0x24]
    mov r1, #0x0
    add r2, r2, #0x1
    str r2, [r4, #0x24]
    bl func_0207229c
    mov r1, #0x0
    strb r1, [r4, #0x8]
    ldr r0, [r4, #0x4]
    cmp r0, #0x2
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, r6, r7, lr}
    bxne lr
    str r1, [r4, #0x4]
    ldr r0, [r4]
    bl func_020918f0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_b8:
    ldr r2, [r4, #0x24]
    mov r1, #0x0
    add r2, r2, #0x1
    str r2, [r4, #0x24]
    bl func_02072288
    mov r0, #0x6
    add sp, sp, #0x4
    strb r0, [r4, #0x8]
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_e0:
    mov r0, r7
    mov r1, r6
    mov r2, r5
    mov r3, #0x0
    bl func_0207214c
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
