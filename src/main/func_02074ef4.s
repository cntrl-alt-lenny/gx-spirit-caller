; func_02074ef4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02075928
        .global func_02074ef4
        .arm
func_02074ef4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02075928
    cmp r0, #0x7
    movne r0, #0x1
    ldmneia sp!, {r4, lr}
    bxne lr
    mov r0, r4
    bl func_02075928
    cmp r0, #0x6
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, lr}
    bx lr
