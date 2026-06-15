; func_02046ae0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219daec
        .extern func_0204fa24
        .extern func_0204fa50
        .global func_02046ae0
        .arm
func_02046ae0:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    ldr r1, [r0]
    cmp r1, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqfd sp!, {pc}
    ldrb r0, [r1, #0x369]
    cmp r0, #0x2
    beq .L_38
    ldrb r0, [r1, #0x369]
    cmp r0, #0x3
    bne .L_48
.L_38:
    bl func_0204fa24
    add sp, sp, #0x4
    add r0, r0, #0x1
    ldmfd sp!, {pc}
.L_48:
    bl func_0204fa50
    add r0, r0, #0x1
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_0219daec
