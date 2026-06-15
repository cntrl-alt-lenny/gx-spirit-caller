; func_0207e8b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0207e8a0
        .global func_0207e8b8
        .arm
func_0207e8b8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x1c
    bl func_0207e8a0
    mov r1, #0x0
    str r1, [r4]
    str r1, [r4, #0x4]
    mov r0, #0x1
    str r0, [r4, #0x8]
    str r1, [r4, #0xc]
    mov r0, #0x1000
    str r0, [r4, #0x10]
    str r1, [r4, #0x14]
    str r1, [r4, #0x18]
    ldmia sp!, {r4, pc}
