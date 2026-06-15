; func_0207651c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0207655c
        .extern func_02076764
        .extern func_02076870
        .extern func_02077c08
        .global func_0207651c
        .arm
func_0207651c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r2, [r4, #0x81c]
    bl func_02076870
    mov r0, r4
    bl func_02076764
    mov r1, #0x0
    mov r0, r4
    mov r2, r1
    bl func_02077c08
    mov r0, r4
    bl func_0207655c
    mov r0, #0x5
    strb r0, [r4, #0x455]
    ldmia sp!, {r4, lr}
    bx lr
