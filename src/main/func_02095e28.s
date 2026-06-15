; func_02095e28 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020928e8
        .extern func_020952d0
        .extern func_020952e4
        .global func_02095e28
        .arm
func_02095e28:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    mov r4, r2
    bl func_020952e4
    add r0, r6, #0x3c
    add r2, r6, r5, lsl #0x2
    add r0, r0, r5, lsl #0x2
    mov r1, #0x4
    str r4, [r2, #0x3c]
    bl func_020928e8
    bl func_020952d0
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
