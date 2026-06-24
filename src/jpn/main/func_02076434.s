; func_02076434 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02076474
        .extern func_0207667c
        .extern func_02076788
        .extern func_02077b20
        .global func_02076434
        .arm
func_02076434:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r2, [r4, #0x81c]
    bl func_02076788
    mov r0, r4
    bl func_0207667c
    mov r1, #0x0
    mov r0, r4
    mov r2, r1
    bl func_02077b20
    mov r0, r4
    bl func_02076474
    mov r0, #0x5
    strb r0, [r4, #0x455]
    ldmia sp!, {r4, lr}
    bx lr
