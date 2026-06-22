; func_02033cec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020a69a0
        .global func_02033cec
        .arm
func_02033cec:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r0, #0x1
    mov r4, r2
    str r0, [r5]
    mov r3, #0x0
    strb r3, [r5, #0x4]
    add r0, r5, #0x6
    mov r2, #0xf
    strb r3, [r5, #0x5]
    bl func_020a69a0
    mov r0, #0x0
    strb r0, [r5, #0x15]
    str r4, [r5, #0x18]
    ldmia sp!, {r3, r4, r5, pc}
