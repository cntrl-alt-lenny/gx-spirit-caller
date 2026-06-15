; func_02054c30 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02054ea8
        .extern func_0206eb4c
        .global func_02054c30
        .arm
func_02054c30:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r4, r2
    ldr r2, [r4]
    mov r5, r1
    strb r2, [r5]
    bl func_0206eb4c
    ldrb r2, [r5]
    mvn r1, #0x0
    str r2, [r4]
    bl func_02054ea8
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
