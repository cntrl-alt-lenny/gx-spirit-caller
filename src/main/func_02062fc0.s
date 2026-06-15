; func_02062fc0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0205407c
        .extern func_02054140
        .extern func_02055330
        .global func_02062fc0
        .arm
func_02062fc0:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x14
    add r4, sp, #0x0
    mov r3, #0x0
    str r3, [r4]
    str r3, [r4, #0x4]
    str r3, [r4, #0x8]
    mov r5, r0
    str r3, [r4, #0xc]
    ldr r0, [r5, #0x58]
    str r0, [sp]
    str r2, [sp, #0x4]
    strh r1, [sp, #0x8]
    bl func_02055330
    str r0, [sp, #0xc]
    ldr r0, [r5, #0x60]
    bl func_02054140
    mov r4, r0
    ldr r0, [r5, #0x60]
    add r1, sp, #0x0
    bl func_0205407c
    ldr r0, [r5, #0x60]
    bl func_02054140
    add r1, r4, #0x1
    cmp r1, r0
    moveq r0, #0x1
    movne r0, #0x0
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, pc}
