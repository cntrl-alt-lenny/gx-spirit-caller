; func_0205314c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02044c10
        .extern func_020536b4
        .global func_0205314c
        .arm
func_0205314c:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x18
    mov r4, r0
    add r0, sp, #0x0
    bl func_02044c10
    ldr r0, [sp, #0x10]
    cmp r0, #0x0
    beq .L_48
    mov r0, r4
    bl func_020536b4
    ldr r2, [sp, #0x4]
    ldr r3, [sp]
    cmp r2, r1
    cmpeq r3, r0
    moveq r0, #0x1
    add sp, sp, #0x18
    movne r0, #0x0
    ldmia sp!, {r4, pc}
.L_48:
    mov r0, r4
    bl func_020536b4
    ldr r2, [sp, #0xc]
    ldr r3, [sp, #0x8]
    cmp r2, r1
    cmpeq r3, r0
    moveq r0, #0x1
    movne r0, #0x0
    add sp, sp, #0x18
    ldmia sp!, {r4, pc}
