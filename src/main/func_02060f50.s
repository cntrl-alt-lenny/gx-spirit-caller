; func_02060f50 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101354
        .extern data_0219e510
        .extern data_0219e514
        .extern data_0219e524
        .extern func_020453b4
        .extern func_02054e54
        .extern func_02054e70
        .extern func_02060520
        .global func_02060f50
        .arm
func_02060f50:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    mvn r1, #0x0
    ldr r0, [r0]
    cmp r0, r1
    beq .L_30
    mov r1, #0x2
    bl func_02054e54
    ldr r0, _LIT0
    ldr r0, [r0]
    bl func_02054e70
.L_30:
    ldr r0, _LIT0
    mvn r1, #0x0
    str r1, [r0]
    bl func_02060520
    ldr r0, _LIT1
    ldr r0, [r0]
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqfd sp!, {pc}
    bl func_020453b4
    ldr r2, _LIT1
    mov r3, #0x0
    ldr r1, _LIT2
    ldr r0, _LIT3
    str r3, [r2]
    str r3, [r1]
    str r3, [r0]
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_02101354
_LIT1: .word data_0219e514
_LIT2: .word data_0219e524
_LIT3: .word data_0219e510
