; func_02060edc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101274
        .extern data_0219e430
        .extern data_0219e434
        .extern data_0219e444
        .extern func_02045364
        .extern func_02054de0
        .extern func_02054dfc
        .extern func_020604ac
        .global func_02060edc
        .arm
func_02060edc:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    mvn r1, #0x0
    ldr r0, [r0]
    cmp r0, r1
    beq .L_30
    mov r1, #0x2
    bl func_02054de0
    ldr r0, _LIT0
    ldr r0, [r0]
    bl func_02054dfc
.L_30:
    ldr r0, _LIT0
    mvn r1, #0x0
    str r1, [r0]
    bl func_020604ac
    ldr r0, _LIT1
    ldr r0, [r0]
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqfd sp!, {pc}
    bl func_02045364
    ldr r2, _LIT1
    mov r3, #0x0
    ldr r1, _LIT2
    ldr r0, _LIT3
    str r3, [r2]
    str r3, [r1]
    str r3, [r0]
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_02101274
_LIT1: .word data_0219e434
_LIT2: .word data_0219e444
_LIT3: .word data_0219e430
