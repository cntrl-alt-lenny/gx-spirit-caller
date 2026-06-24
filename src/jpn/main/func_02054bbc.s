; func_02054bbc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02054e34
        .extern func_0206ead8
        .global func_02054bbc
        .arm
func_02054bbc:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r4, r2
    ldr r2, [r4]
    mov r5, r1
    strb r2, [r5]
    bl func_0206ead8
    ldrb r2, [r5]
    mvn r1, #0x0
    str r2, [r4]
    bl func_02054e34
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
