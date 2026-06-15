; func_020a37e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0209f2a8
        .extern func_020a35dc
        .global func_020a37e0
        .arm
func_020a37e0:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    ldrh r4, [sp, #0x18]
    mov r3, r2
    mov r2, r1
    str r4, [sp]
    mov r4, #0x1
    str r4, [sp, #0x4]
    mov r4, #0x3
    mov r1, #0x0
    str r4, [sp, #0x8]
    bl func_0209f2a8
    mov r4, r0
    mov r1, r4
    mov r0, #0xf
    bl func_020a35dc
    mov r0, r4
    add sp, sp, #0x10
    ldmia sp!, {r4, lr}
    bx lr
