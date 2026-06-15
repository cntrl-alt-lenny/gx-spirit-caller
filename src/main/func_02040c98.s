; func_02040c98 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020409d8
        .extern func_02044610
        .global func_02040c98
        .arm
func_02040c98:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x18
    mov r4, r0
    add r0, sp, #0x0
    bl func_02044610
    add r1, sp, #0x0
    mov r0, r4
    bl func_020409d8
    add sp, sp, #0x18
    ldmia sp!, {r4, pc}
