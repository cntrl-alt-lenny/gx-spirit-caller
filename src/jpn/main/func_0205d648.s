; func_0205d648 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020543b8
        .global func_0205d648
        .arm
func_0205d648:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x20
    ldr r0, [r0]
    mov r4, r2
    str r1, [sp]
    ldr r0, [r0, #0x428]
    add r1, sp, #0x0
    bl func_020543b8
    cmp r4, #0x0
    strne r0, [r4]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    add sp, sp, #0x20
    ldmia sp!, {r4, pc}
