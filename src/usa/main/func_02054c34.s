; func_02054c34 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02054e34
        .extern func_0206ec58
        .global func_02054c34
        .arm
func_02054c34:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    ldr r5, [sp, #0x20]
    add r6, sp, #0x4
    mov r4, #0x4
.L_14:
    ldrb lr, [r5], #0x1
    ldrb ip, [r5], #0x1
    subs r4, r4, #0x1
    strb lr, [r6], #0x1
    strb ip, [r6], #0x1
    bne .L_14
    ldr lr, [sp, #0x24]
    add ip, sp, #0x4
    strb lr, [sp, #0x4]
    str ip, [sp]
    bl func_0206ec58
    mvn r1, #0x0
    bl func_02054e34
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
