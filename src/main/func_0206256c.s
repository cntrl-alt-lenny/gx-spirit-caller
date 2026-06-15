; func_0206256c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02054140
        .extern func_020618a8
        .extern func_0206280c
        .extern func_02064db0
        .global func_0206256c
        .arm
func_0206256c:
    stmdb sp!, {r0, r1, r2, r3}
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    ldr r0, [r5, #0xc]
    mov r4, r3
    cmp r0, #0x5
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, lr}
    addne sp, sp, #0x10
    bxne lr
    add r0, sp, #0x14
    add r1, sp, #0x18
    bl func_02064db0
    ldr r0, [r5, #0x98]
    bl func_02054140
    cmp r0, #0x0
    beq .L_70
    str r4, [sp]
    ldr r2, [sp, #0x14]
    ldr r3, [sp, #0x18]
    mov r0, r5
    mov r1, #0x0
    bl func_020618a8
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    add sp, sp, #0x10
    bx lr
.L_70:
    ldr r1, [sp, #0x14]
    ldr r2, [sp, #0x18]
    mov r0, r5
    mov r3, r4
    bl func_0206280c
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    add sp, sp, #0x10
    bx lr
