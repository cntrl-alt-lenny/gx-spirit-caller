; func_02054d14 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02054ea8
        .extern func_0206ed7c
        .global func_02054d14
        .arm
func_02054d14:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    ldr r4, [sp, #0x14]
    ldr r5, [sp, #0x10]
    ldr ip, [r4]
    strb ip, [r5]
    str r5, [sp]
    bl func_0206ed7c
    ldrb r2, [r5]
    mvn r1, #0x0
    str r2, [r4]
    bl func_02054ea8
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
