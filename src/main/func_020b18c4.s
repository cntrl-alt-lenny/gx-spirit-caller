; func_020b18c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020b007c
        .extern func_020b0138
        .global func_020b18c4
        .arm
func_020b18c4:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r4, r2
    add r2, sp, #0x0
    bl func_020b007c
    ldr r2, [sp]
    add r2, r2, r4
    str r2, [sp]
    bl func_020b0138
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
