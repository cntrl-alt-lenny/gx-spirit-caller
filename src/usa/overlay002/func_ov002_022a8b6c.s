; func_ov002_022a8b6c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_0229d148
        .extern func_ov002_022a8bb4
        .extern func_ov002_022a8d04
        .extern func_ov002_022a9008
        .extern func_ov002_022a956c
        .extern func_ov002_022a9a30
        .extern func_ov002_022a9b70
        .extern func_ov002_022a9c60
        .global func_ov002_022a8b6c
        .arm
func_ov002_022a8b6c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov002_0229d148
    mov r0, r4
    bl func_ov002_022a8bb4
    mov r0, r4
    bl func_ov002_022a956c
    mov r0, r4
    bl func_ov002_022a8d04
    mov r0, r4
    bl func_ov002_022a9008
    mov r0, r4
    bl func_ov002_022a9a30
    mov r0, r4
    bl func_ov002_022a9b70
    mov r0, r4
    bl func_ov002_022a9c60
    ldmia sp!, {r4, pc}
