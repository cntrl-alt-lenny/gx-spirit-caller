; func_020458d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ff890
        .extern data_020ff8b8
        .extern data_020ff8dc
        .extern func_0204067c
        .global func_020458d8
        .arm
func_020458d8:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    cmp r0, #0x0
    beq .L_364
    cmp r0, #0x1
    beq .L_374
    cmp r0, #0x2
    beq .L_384
    add sp, sp, #0x4
    ldmfd sp!, {pc}
.L_364:
    ldr r0, _LIT0
    bl func_0204067c
    add sp, sp, #0x4
    ldmfd sp!, {pc}
.L_374:
    ldr r0, _LIT1
    bl func_0204067c
    add sp, sp, #0x4
    ldmfd sp!, {pc}
.L_384:
    ldr r0, _LIT2
    bl func_0204067c
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_020ff890
_LIT1: .word data_020ff8b8
_LIT2: .word data_020ff8dc
