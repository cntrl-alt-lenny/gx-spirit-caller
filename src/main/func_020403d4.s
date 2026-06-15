; func_020403d4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219d9d4
        .extern func_02041ea0
        .extern func_02091af4
        .extern func_02092748
        .extern func_020927b8
        .global func_020403d4
        .arm
func_020403d4:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    ldr r1, [r0]
    cmp r1, #0x0
    addeq sp, sp, #0x4
    ldmeqfd sp!, {pc}
    ldr r0, _LIT1
    add r0, r1, r0
    bl func_020927b8
    ldr r2, _LIT0
    mov r3, #0x1
    ldr r0, [r2]
    ldr r1, _LIT1
    add r0, r0, #0x1000
    str r3, [r0, #0x3f0]
    ldr r0, [r2]
    add r0, r0, r1
    bl func_02092748
    ldr r0, _LIT0
    ldr r0, [r0]
    add r0, r0, #0x1000
    ldr r0, [r0, #0x314]
    cmp r0, #0x0
    beq .L_d70
    bl func_02041ea0
.L_d70:
    ldr r0, _LIT0
    ldr r1, [r0]
    add r0, r1, #0x1000
    ldr r0, [r0, #0x384]
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqfd sp!, {pc}
    ldr r0, _LIT2
    add r0, r1, r0
    bl func_02091af4
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_0219d9d4
_LIT1: .word 0x000013d8
_LIT2: .word 0x00001318
