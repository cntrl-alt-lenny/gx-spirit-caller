; func_0205c7bc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02054b28
        .extern func_02054cf4
        .extern func_02054dfc
        .extern func_02054f8c
        .extern func_020551dc
        .extern func_0205c6d4
        .extern func_0205c8b4
        .extern func_0205c92c
        .extern func_0205caa0
        .global func_0205c7bc
        .arm
func_0205c7bc:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r4, r0
    ldr r7, [r4]
    mvn r1, #0x0
    ldr r0, [r7, #0x204]
    cmp r0, r1
    beq .L_8c
    bl func_02054f8c
    cmp r0, #0x0
    beq .L_8c
    mov r1, #0x0
    ldr r0, [r7, #0x204]
    mov r2, r1
    bl func_02054cf4
    mov r6, r0
    mvn r1, #0x0
    cmp r6, r1
    beq .L_8c
    mov r0, r4
    mov r2, #0x0
    bl func_0205c6d4
    movs r5, r0
    beq .L_84
    mov r0, #0x68
    str r0, [r5]
    mov r0, r6
    str r6, [r5, #0x8]
    mov r1, #0x0
    bl func_020551dc
    ldr r0, [r5, #0x8]
    bl func_0205c8b4
    b .L_8c
.L_84:
    mov r0, r6
    bl func_02054dfc
.L_8c:
    ldr r6, [r7, #0x434]
    cmp r6, #0x0
    beq .L_ec
    mov r5, #0x0
.L_9c:
    mov r0, r4
    mov r1, r6
    ldr r7, [r6, #0x3c]
    bl func_0205caa0
    ldr r1, [r6]
    cmp r1, #0x6a
    beq .L_d4
    cmp r0, #0x0
    bne .L_d4
    mov r0, r5
    bl func_02054b28
    ldr r1, [r6, #0x10]
    cmp r0, r1
    ble .L_e0
.L_d4:
    mov r0, r4
    mov r1, r6
    bl func_0205c92c
.L_e0:
    mov r6, r7
    cmp r7, #0x0
    bne .L_9c
.L_ec:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
