; func_0206450c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02061fe8
        .extern func_0206471c
        .global func_0206450c
        .arm
func_0206450c:
    stmdb sp!, {r4, lr}
    ldr r4, [r0]
    ldr r1, [r1]
    ldr r0, [r4, #0xc]
    cmp r0, #0x7
    beq .L_2c
    mov r0, r4
    bl func_02061fe8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
.L_2c:
    ldr r0, [r4, #0xc]
    cmp r0, #0x7
    bne .L_58
    ldr r0, [r4, #0x14]
    cmp r0, #0x0
    bne .L_58
    ldr r0, [r4, #0x24]
    cmp r0, #0x0
    bne .L_58
    mov r0, r4
    bl func_0206471c
.L_58:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
