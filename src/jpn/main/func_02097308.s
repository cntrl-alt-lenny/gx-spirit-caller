; func_02097308 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02094500
        .extern func_02097bf4
        .extern func_02097e1c
        .extern func_02097efc
        .extern func_02098010
        .extern func_02098294
        .global func_02097308
        .arm
func_02097308:
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
    bhi .L_118
    add r1, r6, #0x1f
    add r0, sp, #0x4
    bic r4, r1, #0x1f
    bl func_02098294
    ldr r2, [r7, #0x2c]
    mvn r0, #0x0
    str r0, [sp]
    ldr r3, [r7, #0x30]
    add r0, sp, #0x4
    mov r1, r7
    add r3, r2, r3
    bl func_02098010
    cmp r0, #0x0
    beq .L_98
    ldr r2, [r7, #0x30]
    add r0, sp, #0x4
    mov r1, r4
    bl func_02097e1c
    cmp r0, #0x0
    bge .L_90
    ldr r2, [r7, #0x30]
    mov r0, r4
    mov r1, #0x0
    bl func_02094500
.L_90:
    add r0, sp, #0x4
    bl func_02097efc
.L_98:
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
    bl func_02098010
    cmp r0, #0x0
    beq .L_fc
    ldr r2, [r7, #0x38]
    add r0, sp, #0x4
    mov r1, r4
    bl func_02097e1c
    cmp r0, #0x0
    bge .L_f4
    ldr r2, [r7, #0x38]
    mov r0, r4
    mov r1, #0x0
    bl func_02094500
.L_f4:
    add r0, sp, #0x4
    bl func_02097efc
.L_fc:
    str r4, [r7, #0x34]
    ldr r0, _LIT0
    str r6, [r7, #0x44]
    str r0, [r7, #0x50]
    ldr r0, [r7, #0x1c]
    orr r0, r0, #0x4
    str r0, [r7, #0x1c]
.L_118:
    mov r0, r5
    add sp, sp, #0x4c
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
_LIT0: .word func_02097bf4
