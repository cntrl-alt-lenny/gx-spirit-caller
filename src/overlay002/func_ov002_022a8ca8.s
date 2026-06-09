; func_ov002_022a8ca8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_0229d258
        .extern func_ov002_022a8cf0
        .extern func_ov002_022a8e40
        .extern func_ov002_022a9144
        .extern func_ov002_022a96a8
        .extern func_ov002_022a9b6c
        .extern func_ov002_022a9cac
        .extern func_ov002_022a9d9c
        .global func_ov002_022a8ca8
        .arm
func_ov002_022a8ca8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov002_0229d258
    mov r0, r4
    bl func_ov002_022a8cf0
    mov r0, r4
    bl func_ov002_022a96a8
    mov r0, r4
    bl func_ov002_022a8e40
    mov r0, r4
    bl func_ov002_022a9144
    mov r0, r4
    bl func_ov002_022a9b6c
    mov r0, r4
    bl func_ov002_022a9cac
    mov r0, r4
    bl func_ov002_022a9d9c
    ldmia sp!, {r4, pc}
