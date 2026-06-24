; func_02068ae0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020544f4
        .extern func_0206b488
        .global func_02068ae0
        .arm
func_02068ae0:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0xc
    mov r5, r0
    mov r4, r2
    mov r0, #0x0
    bl func_0206b488
    str r0, [sp]
    mov r1, r4
    mov r0, #0x0
    bl func_0206b488
    str r0, [sp, #0x4]
    ldr r0, [r5, #0x18]
    add r1, sp, #0x0
    bl func_020544f4
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, pc}
