; func_0205d6bc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0205442c
        .global func_0205d6bc
        .arm
func_0205d6bc:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x20
    ldr r0, [r0]
    mov r4, r2
    str r1, [sp]
    ldr r0, [r0, #0x428]
    add r1, sp, #0x0
    bl func_0205442c
    cmp r4, #0x0
    strne r0, [r4]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    add sp, sp, #0x20
    ldmia sp!, {r4, pc}
