; func_0202aba0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202abdc
        .extern func_0202acec
        .global func_0202aba0
        .arm
func_0202aba0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r1, #0x0
    str r1, [r4, #0xd8]
    ldrh r1, [r4, #0xea]
    bic r1, r1, #0x2
    strh r1, [r4, #0xea]
    bl func_0202abdc
    mov r1, #0x0
    strh r1, [r4, #0xde]
    mov r0, r4
    strh r1, [r4, #0xe0]
    bl func_0202acec
    mov r0, #0x1
    ldmia sp!, {r4, pc}
