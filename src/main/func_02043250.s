; func_02043250 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219d9f0
        .extern data_0219d9fc
        .extern func_020403d4
        .extern func_02041ea0
        .extern func_02091af4
        .global func_02043250
        .arm
func_02043250:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqfd sp!, {pc}
    ldr r0, _LIT1
    ldr r0, [r0]
    cmp r0, #0x0
    beq .L_74
    bl func_02041ea0
.L_74:
    bl func_020403d4
    ldr r0, _LIT0
    ldr r1, [r0]
    add r0, r1, #0x1000
    ldr r0, [r0, #0x188]
    cmp r0, #0x0
    beq .L_9c
    ldr r0, _LIT2
    add r0, r1, r0
    bl func_02091af4
.L_9c:
    ldr r0, _LIT0
    mvn r1, #0x6
    ldr r0, [r0]
    add r0, r0, #0x1000
    str r1, [r0, #0x4]
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_0219d9f0
_LIT1: .word data_0219d9fc
_LIT2: .word 0x0000111c
