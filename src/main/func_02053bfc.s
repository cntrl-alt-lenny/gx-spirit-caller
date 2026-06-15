; func_02053bfc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02053e58
        .extern func_02054140
        .global func_02053bfc
        .arm
func_02053bfc:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    bl func_02054140
    subs r4, r0, #0x1
    addmi sp, sp, #0x4
    ldmmiia sp!, {r4, r5, pc}
.L_4a4:
    mov r0, r5
    mov r1, r4
    bl func_02053e58
    subs r4, r4, #0x1
    bpl .L_4a4
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
