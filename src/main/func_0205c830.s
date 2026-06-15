; func_0205c830 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02054b9c
        .extern func_02054d68
        .extern func_02054e70
        .extern func_02055000
        .extern func_02055250
        .extern func_0205c748
        .extern func_0205c928
        .extern func_0205c9a0
        .extern func_0205cb14
        .global func_0205c830
        .arm
func_0205c830:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r4, r0
    ldr r7, [r4]
    mvn r1, #0x0
    ldr r0, [r7, #0x204]
    cmp r0, r1
    beq .L_c8
    bl func_02055000
    cmp r0, #0x0
    beq .L_c8
    mov r1, #0x0
    ldr r0, [r7, #0x204]
    mov r2, r1
    bl func_02054d68
    mov r6, r0
    mvn r1, #0x0
    cmp r6, r1
    beq .L_c8
    mov r0, r4
    mov r2, #0x0
    bl func_0205c748
    movs r5, r0
    beq .L_c0
    mov r0, #0x68
    str r0, [r5]
    mov r0, r6
    str r6, [r5, #0x8]
    mov r1, #0x0
    bl func_02055250
    ldr r0, [r5, #0x8]
    bl func_0205c928
    b .L_c8
.L_c0:
    mov r0, r6
    bl func_02054e70
.L_c8:
    ldr r6, [r7, #0x434]
    cmp r6, #0x0
    beq .L_128
    mov r5, #0x0
.L_d8:
    mov r0, r4
    mov r1, r6
    ldr r7, [r6, #0x3c]
    bl func_0205cb14
    ldr r1, [r6]
    cmp r1, #0x6a
    beq .L_110
    cmp r0, #0x0
    bne .L_110
    mov r0, r5
    bl func_02054b9c
    ldr r1, [r6, #0x10]
    cmp r0, r1
    ble .L_11c
.L_110:
    mov r0, r4
    mov r1, r6
    bl func_0205c9a0
.L_11c:
    mov r6, r7
    cmp r7, #0x0
    bne .L_d8
.L_128:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
