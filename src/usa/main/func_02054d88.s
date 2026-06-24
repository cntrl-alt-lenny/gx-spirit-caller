; func_02054d88 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02054e34
        .extern func_0206ee2c
        .global func_02054d88
        .arm
func_02054d88:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    ldrh r3, [r1, #0x2]
    cmp r3, #0x0
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    add r4, sp, #0x0
    mov lr, #0x4
.L_24:
    ldrb ip, [r1], #0x1
    ldrb r3, [r1], #0x1
    subs lr, lr, #0x1
    strb ip, [r4], #0x1
    strb r3, [r4], #0x1
    bne .L_24
    add r1, sp, #0x0
    strb r2, [sp]
    bl func_0206ee2c
    mvn r1, #0x0
    bl func_02054e34
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
