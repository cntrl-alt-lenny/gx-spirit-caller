; func_02068b54 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02054568
        .extern func_0206b4fc
        .global func_02068b54
        .arm
func_02068b54:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0xc
    mov r5, r0
    mov r4, r2
    mov r0, #0x0
    bl func_0206b4fc
    str r0, [sp]
    mov r1, r4
    mov r0, #0x0
    bl func_0206b4fc
    str r0, [sp, #0x4]
    ldr r0, [r5, #0x18]
    add r1, sp, #0x0
    bl func_02054568
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, pc}
