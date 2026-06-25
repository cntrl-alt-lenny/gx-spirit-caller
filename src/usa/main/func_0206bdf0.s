; func_0206bdf0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0206be80
        .extern func_020923d8
        .extern func_0209252c
        .global func_0206bdf0
        .arm
func_0206bdf0:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x2c
    mov r4, r1
    ldrsb r2, [r4, #0xd]
    mov r5, r0
    cmp r2, #0x1
    bne .L_54
    add r0, sp, #0x8
    add r1, sp, #0x4
    mov r2, #0x1
    bl func_0209252c
    add r2, sp, #0x8
    mov r0, r5
    mov r1, r4
    str r2, [r4, #0x8]
    bl func_0206be80
    add r0, sp, #0x8
    add r1, sp, #0x0
    mov r2, #0x1
    bl func_020923d8
    b .L_64
.L_54:
    mov r2, #0x0
    str r2, [r4, #0x8]
    bl func_0206be80
    str r0, [sp]
.L_64:
    ldr r0, [sp]
    add sp, sp, #0x2c
    ldmia sp!, {r4, r5, lr}
    bx lr
