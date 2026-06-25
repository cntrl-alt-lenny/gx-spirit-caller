; func_0206d2ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02094688
        .global func_0206d2ec
        .arm
func_0206d2ec:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r6, r2
    ldr r5, [r6, #0x14]
    ldr r4, [r6, #0x1c]
    cmp r5, r1
    mov r7, r0
    movgt r5, r1
    movgt r4, #0x0
    bgt .L_24c
    sub r0, r1, r5
    cmp r4, r0
    movgt r4, r0
.L_24c:
    cmp r5, #0x0
    ble .L_27c
    ldr r0, [r6, #0x10]
    mov r1, r7
    mov r2, r5
    bl func_02094688
    ldr r0, [r6, #0x10]
    add r0, r0, r5
    str r0, [r6, #0x10]
    ldr r0, [r6, #0x14]
    sub r0, r0, r5
    str r0, [r6, #0x14]
.L_27c:
    cmp r4, #0x0
    ble .L_2ac
    ldr r0, [r6, #0x18]
    mov r2, r4
    add r1, r7, r5
    bl func_02094688
    ldr r0, [r6, #0x18]
    add r0, r0, r4
    str r0, [r6, #0x18]
    ldr r0, [r6, #0x1c]
    sub r0, r0, r4
    str r0, [r6, #0x1c]
.L_2ac:
    add r0, r5, r4
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
