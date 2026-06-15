; func_02054ca8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02054ea8
        .extern func_0206eccc
        .global func_02054ca8
        .arm
func_02054ca8:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    ldr r5, [sp, #0x20]
    add r6, sp, #0x4
    mov r4, #0x4
.L_44:
    ldrb lr, [r5], #0x1
    ldrb ip, [r5], #0x1
    subs r4, r4, #0x1
    strb lr, [r6], #0x1
    strb ip, [r6], #0x1
    bne .L_44
    ldr lr, [sp, #0x24]
    add ip, sp, #0x4
    strb lr, [sp, #0x4]
    str ip, [sp]
    bl func_0206eccc
    mvn r1, #0x0
    bl func_02054ea8
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
