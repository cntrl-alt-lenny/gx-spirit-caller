; func_02054db8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02054ea8
        .extern func_0206ee40
        .global func_02054db8
        .arm
func_02054db8:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    add r4, sp, #0x0
    mov lr, #0x4
.L_10:
    ldrb ip, [r1], #0x1
    ldrb r3, [r1], #0x1
    subs lr, lr, #0x1
    strb ip, [r4], #0x1
    strb r3, [r4], #0x1
    bne .L_10
    add r1, sp, #0x0
    strb r2, [sp]
    bl func_0206ee40
    mvn r1, #0x0
    bl func_02054ea8
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
