; func_020960ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020928e8
        .extern func_020952d0
        .extern func_020952e4
        .global func_020960ac
        .arm
func_020960ac:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r7, r0
    bl func_020952e4
    add r5, r7, #0x18
    mov r6, #0x0
    mov r8, #0x8
    mov r4, #0x3c
.L_68:
    add r1, r7, r6, lsl #0x3
    ldr r0, [r1, #0x18]
    cmp r0, #0x0
    beq .L_d0
    ldr r3, [r0, #0x18]
    cmp r5, r3
    bne .L_98
    ldr r2, [r1, #0x1c]
    mov r1, r4
    str r2, [r0, #0x18]
    bl func_020928e8
    b .L_d0
.L_98:
    cmp r3, #0x0
    beq .L_b8
.L_a0:
    ldr r0, [r3, #0x4]
    cmp r5, r0
    beq .L_b8
    mov r3, r0
    cmp r0, #0x0
    bne .L_a0
.L_b8:
    add r0, r7, r6, lsl #0x3
    ldr r2, [r0, #0x1c]
    mov r0, r3
    mov r1, r8
    str r2, [r3, #0x4]
    bl func_020928e8
.L_d0:
    add r6, r6, #0x1
    cmp r6, #0x4
    add r5, r5, #0x8
    blt .L_68
    bl func_020952d0
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
