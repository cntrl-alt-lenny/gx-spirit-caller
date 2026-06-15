; func_0206803c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02068194
        .extern func_02068424
        .extern func_0206844c
        .global func_0206803c
        .arm
func_0206803c:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldrb ip, [r1, #0x14]
    add lr, r1, #0x14
    cmp r3, #0x0
    and ip, ip, #0xc3
    strb ip, [r1, #0x14]
    ldreqb r3, [lr]
    orreq r3, r3, #0x4
    streqb r3, [lr]
    beq .L_1f4
    cmp r3, #0x1
    ldreqb r3, [lr]
    orreq r3, r3, #0x8
    streqb r3, [lr]
    beq .L_1f4
    cmp r3, #0x2
    addeq sp, sp, #0x4
    ldmeqfd sp!, {pc}
.L_1f4:
    ldr ip, [r0, #0x10]
    ldr r3, [r0, #0x4]
    cmp ip, r3
    bge .L_210
    bl func_02068194
    add sp, sp, #0x4
    ldmfd sp!, {pc}
.L_210:
    cmp r2, #0x0
    beq .L_228
    add r0, r0, #0x14
    bl func_02068424
    add sp, sp, #0x4
    ldmfd sp!, {pc}
.L_228:
    add r0, r0, #0x14
    bl func_0206844c
    add sp, sp, #0x4
    ldmfd sp!, {pc}
