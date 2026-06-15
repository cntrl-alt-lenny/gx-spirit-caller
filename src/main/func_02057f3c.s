; func_02057f3c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021001f4
        .extern data_0210021c
        .extern func_02054bfc
        .extern func_02054cf8
        .extern func_020585d4
        .extern func_0205ffd4
        .extern func_020604a4
        .global func_02057f3c
        .arm
func_02057f3c:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r8, r1
    mov r7, r0
    mov r1, r2
    mov r2, r3
    mov r0, r8
    mov r3, #0x0
    ldr r6, [sp, #0x18]
    ldr r5, [sp, #0x1c]
    ldr r4, [sp, #0x20]
    bl func_02054cf8
    mvn r1, #0x0
    cmp r0, r1
    bne .L_298
    mov r0, r8
    bl func_02054bfc
    mvn r1, #0x5
    cmp r0, r1
    beq .L_288
    mvn r1, #0x19
    cmp r0, r1
    beq .L_288
    mvn r1, #0x4b
    cmp r0, r1
    beq .L_288
    ldrsb r0, [r4]
    cmp r0, #0x50
    bne .L_260
    ldrsb r0, [r4, #0x1]
    cmp r0, #0x52
    moveq r0, #0x3
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
.L_260:
    ldr r2, _LIT0
    mov r0, r7
    mov r1, #0x5
    bl func_0205ffd4
    mov r0, r7
    mov r1, #0x3
    mov r2, #0x0
    bl func_020585d4
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_288:
    mov r0, #0x0
    str r0, [r5]
    str r0, [r6]
    b .L_2cc
.L_298:
    cmp r0, #0x0
    strne r0, [r5]
    movne r0, #0x0
    strne r0, [r6]
    bne .L_2cc
    ldr r1, _LIT1
    mov r0, r7
    mov r2, r4
    bl func_020604a4
    mov r0, #0x0
    str r0, [r5]
    mov r0, #0x1
    str r0, [r6]
.L_2cc:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_021001f4
_LIT1: .word data_0210021c
