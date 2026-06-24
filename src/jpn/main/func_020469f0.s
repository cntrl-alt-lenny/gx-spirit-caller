; func_020469f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219da0c
        .extern func_0204f87c
        .extern func_0204f924
        .global func_020469f0
        .arm
func_020469f0:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r2, _LIT0
    ldr r3, [r2]
    cmp r3, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqfd sp!, {pc}
    ldr r1, _LIT1
    add r1, r3, r1
    str r1, [r0]
    ldr r2, [r2]
    ldrb r1, [r2, #0x369]
    cmp r1, #0x2
    beq .L_48
    ldrb r1, [r2, #0x369]
    cmp r1, #0x3
    bne .L_54
.L_48:
    bl func_0204f87c
    add sp, sp, #0x4
    ldmfd sp!, {pc}
.L_54:
    bl func_0204f924
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_0219da0c
_LIT1: .word 0x0000061c
