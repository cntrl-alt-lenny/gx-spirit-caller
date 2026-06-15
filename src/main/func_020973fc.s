; func_020973fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020945f4
        .extern func_02097ce8
        .extern func_02097f10
        .extern func_02097ff0
        .extern func_02098104
        .extern func_02098388
        .global func_020973fc
        .arm
func_020973fc:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4c
    mov r7, r0
    ldr r3, [r7, #0x30]
    ldr r0, [r7, #0x38]
    mov r6, r1
    add r0, r3, r0
    add r0, r0, #0x20
    add r0, r0, #0x1f
    bic r5, r0, #0x1f
    cmp r5, r2
    bhi .L_2bc
    add r1, r6, #0x1f
    add r0, sp, #0x4
    bic r4, r1, #0x1f
    bl func_02098388
    ldr r2, [r7, #0x2c]
    mvn r0, #0x0
    str r0, [sp]
    ldr r3, [r7, #0x30]
    add r0, sp, #0x4
    mov r1, r7
    add r3, r2, r3
    bl func_02098104
    cmp r0, #0x0
    beq .L_23c
    ldr r2, [r7, #0x30]
    add r0, sp, #0x4
    mov r1, r4
    bl func_02097f10
    cmp r0, #0x0
    bge .L_234
    ldr r2, [r7, #0x30]
    mov r0, r4
    mov r1, #0x0
    bl func_020945f4
.L_234:
    add r0, sp, #0x4
    bl func_02097ff0
.L_23c:
    str r4, [r7, #0x2c]
    ldr ip, [r7, #0x30]
    ldr r2, [r7, #0x34]
    mvn r0, #0x0
    str r0, [sp]
    ldr r3, [r7, #0x38]
    add r0, sp, #0x4
    mov r1, r7
    add r3, r2, r3
    add r4, r4, ip
    bl func_02098104
    cmp r0, #0x0
    beq .L_2a0
    ldr r2, [r7, #0x38]
    add r0, sp, #0x4
    mov r1, r4
    bl func_02097f10
    cmp r0, #0x0
    bge .L_298
    ldr r2, [r7, #0x38]
    mov r0, r4
    mov r1, #0x0
    bl func_020945f4
.L_298:
    add r0, sp, #0x4
    bl func_02097ff0
.L_2a0:
    str r4, [r7, #0x34]
    ldr r0, _LIT0
    str r6, [r7, #0x44]
    str r0, [r7, #0x50]
    ldr r0, [r7, #0x1c]
    orr r0, r0, #0x4
    str r0, [r7, #0x1c]
.L_2bc:
    mov r0, r5
    add sp, sp, #0x4c
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
_LIT0: .word func_02097ce8
