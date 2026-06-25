; func_02093b2c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02093b08
        .global func_02093b2c
        .arm
func_02093b2c:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmnefd sp!, {lr}
    bxne lr
    cmp r3, #0x0
    and r0, r1, #-16777216
    beq .L_30
    cmp r3, #0x800000
    subeq r1, r1, r2
    b .L_34
.L_30:
    add r1, r1, r2
.L_34:
    cmp r0, #0x4000000
    beq .L_60
    cmp r0, #0x8000000
    bcs .L_60
    and r0, r1, #-16777216
    cmp r0, #0x4000000
    beq .L_60
    cmp r0, #0x8000000
    addcc sp, sp, #0x4
    ldmccfd sp!, {lr}
    bxcc lr
.L_60:
    bl func_02093b08
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
