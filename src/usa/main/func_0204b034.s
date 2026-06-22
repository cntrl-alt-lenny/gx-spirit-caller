; func_0204b034 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0204987c
        .extern func_02092fc8
        .global func_0204b034
        .arm
func_0204b034:
    stmdb sp!, {r4, lr}
    bl func_0204987c
    mov r1, #0x0
    strb r1, [r0, #0x1a5]
    bl func_0204987c
    mov r4, r0
    bl func_02092fc8
    str r0, [r4, #0x1f0]
    str r1, [r4, #0x1f4]
    ldmia sp!, {r4, pc}
