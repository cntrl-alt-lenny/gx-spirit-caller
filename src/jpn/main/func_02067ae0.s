; func_02067ae0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0206830c
        .global func_02067ae0
        .arm
func_02067ae0:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    add r0, r5, #0x8
    mov r4, r1
    bl func_0206830c
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, pc}
    mov r1, r4
    add r0, r5, #0x14
    bl func_0206830c
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
