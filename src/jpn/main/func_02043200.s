; func_02043200 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219d910
        .extern data_0219d91c
        .extern func_02040384
        .extern func_02041e50
        .extern func_02091a0c
        .global func_02043200
        .arm
func_02043200:
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
    beq .L_30
    bl func_02041e50
.L_30:
    bl func_02040384
    ldr r0, _LIT0
    ldr r1, [r0]
    add r0, r1, #0x1000
    ldr r0, [r0, #0x188]
    cmp r0, #0x0
    beq .L_58
    ldr r0, _LIT2
    add r0, r1, r0
    bl func_02091a0c
.L_58:
    ldr r0, _LIT0
    mvn r1, #0x6
    ldr r0, [r0]
    add r0, r0, #0x1000
    str r1, [r0, #0x4]
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_0219d910
_LIT1: .word data_0219d91c
_LIT2: .word 0x0000111c
