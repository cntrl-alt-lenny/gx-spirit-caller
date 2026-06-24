; func_0202ab10 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202ab88
        .extern func_0202ac98
        .global func_0202ab10
        .arm
func_0202ab10:
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r1, #0x2
    str r1, [r4, #0xd8]
    ldrh r1, [r4, #0xea]
    orr r1, r1, #0x2
    strh r1, [r4, #0xea]
    bl func_0202ab88
    mov r1, #0x0
    strh r1, [r4, #0xde]
    mov r0, r4
    strh r1, [r4, #0xe0]
    bl func_0202ac98
    mov r0, #0x1
    ldmia sp!, {r4, pc}
