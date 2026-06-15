; func_02056b38 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02056c34
        .extern func_0205c3c0
        .extern func_0205c54c
        .extern func_0205c6e4
        .extern func_0205c748
        .extern func_0205c7f4
        .extern func_0205d6bc
        .global func_02056b38
        .arm
func_02056b38:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x8
    mov r7, r0
    mov r6, r1
    mov r5, r2
    mov r4, r3
    bl func_0205c7f4
    movs r8, r0
    bne .L_1b8
    add r2, sp, #0x0
    mov r0, r7
    mov r1, r6
    bl func_0205d6bc
    cmp r0, #0x0
    beq .L_138
    ldr r0, [sp]
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    beq .L_138
    ldr r0, [r0, #0x14]
    cmp r0, #0x0
    bne .L_154
.L_138:
    mov r0, r7
    mov r1, r6
    mov r2, r5
    mov r3, r4
    bl func_02056c34
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_154:
    mov r0, r7
    mov r1, r6
    mov r2, #0x1
    bl func_0205c748
    movs r8, r0
    addeq sp, sp, #0x8
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r0, [sp]
    ldr r0, [r0, #0x18]
    cmp r0, #0x0
    bne .L_1a0
    mov r0, r7
    mov r1, r8
    bl func_0205c6e4
    cmp r0, #0x0
    beq .L_1b8
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_1a0:
    mov r0, r7
    mov r1, r8
    bl func_0205c54c
    cmp r0, #0x0
    addne sp, sp, #0x8
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
.L_1b8:
    mov r0, r7
    mov r1, r8
    mov r2, r5
    mov r3, r4
    bl func_0205c3c0
    cmp r0, #0x0
    moveq r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
