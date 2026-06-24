; func_0206f04c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0206f0fc
        .global func_0206f04c
        .arm
func_0206f04c:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x8
    mov r6, #0x0
    mov r8, r0
    mov r7, r1
    mov r5, r6
    add r4, sp, #0x0
.L_1c:
    mov r0, r8
    mov r1, r4
    mov r6, r6, lsl #0x8
    bl func_0206f0fc
    ldr r2, [sp]
    cmp r8, r2
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, lr}
    bxeq lr
    mov r8, r2
    cmp r0, #0xff
    bhi .L_7c
    cmp r5, #0x3
    beq .L_68
    ldrb r1, [r2]
    add r8, r2, #0x1
    cmp r1, #0x2e
    bne .L_7c
.L_68:
    cmp r5, #0x3
    bne .L_8c
    ldrb r1, [r8]
    cmp r1, #0x0
    beq .L_8c
.L_7c:
    add sp, sp, #0x8
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
.L_8c:
    add r5, r5, #0x1
    cmp r5, #0x4
    orr r6, r6, r0
    blt .L_1c
    str r6, [r7]
    mov r0, #0x1
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
