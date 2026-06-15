; func_02064580 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0206205c
        .extern func_02064790
        .global func_02064580
        .arm
func_02064580:
    stmdb sp!, {r4, lr}
    ldr r4, [r0]
    ldr r1, [r1]
    ldr r0, [r4, #0xc]
    cmp r0, #0x7
    beq .L_e8
    mov r0, r4
    bl func_0206205c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
.L_e8:
    ldr r0, [r4, #0xc]
    cmp r0, #0x7
    bne .L_114
    ldr r0, [r4, #0x14]
    cmp r0, #0x0
    bne .L_114
    ldr r0, [r4, #0x24]
    cmp r0, #0x0
    bne .L_114
    mov r0, r4
    bl func_02064790
.L_114:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
