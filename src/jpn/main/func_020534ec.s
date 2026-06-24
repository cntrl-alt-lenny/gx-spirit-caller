; func_020534ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020a6660
        .extern func_020a67ec
        .global func_020534ec
        .arm
func_020534ec:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x108
    mov r4, r0
    str r1, [sp, #0x4]
    add r0, sp, #0x8
    mov r1, #0x7
    str r4, [sp]
    bl func_020a67ec
    add r0, sp, #0x8
    add r1, sp, #0x0
    mov r2, #0x8
    bl func_020a6660
    and r0, r0, #0x7f
    orr r1, r0, #0x0
    orr r0, r4, #0x0
    add sp, sp, #0x108
    ldmia sp!, {r4, pc}
