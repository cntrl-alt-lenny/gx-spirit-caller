; func_0205c928 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02055128
        .extern func_02055170
        .extern func_020551b8
        .extern func_02055204
        .global func_0205c928
        .arm
func_0205c928:
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r1, #0x4000
    bl func_02055204
    mov r0, r4
    mov r1, #0x8000
    bl func_02055204
    mov r0, r4
    mov r1, #0x10000
    bl func_02055204
    mov r0, r4
    mov r1, #0x20000
    bl func_02055204
    mov r0, r4
    mov r1, #0x40000
    bl func_02055204
    mov r0, r4
    mov r1, #0x4000
    bl func_020551b8
    mov r0, r4
    mov r1, #0x8000
    bl func_020551b8
    mov r0, r4
    mov r1, #0x10000
    bl func_020551b8
    mov r0, r4
    bl func_02055170
    mov r0, r4
    bl func_02055128
    ldmia sp!, {r4, pc}
