; func_02084fe0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a4820
        .extern data_021a4824
        .extern func_02084fc8
        .extern func_020944ec
        .global func_02084fe0
        .arm
func_02084fe0:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r0, #0x0
    beq .L_1c
    bl func_02084fc8
.L_1c:
    ldr r0, _LIT1
    ldr r0, [r0]
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqfd sp!, {pc}
    ldr r2, [r0]
    cmp r2, #0x0
    addeq sp, sp, #0x4
    ldmeqfd sp!, {pc}
    ldr r1, _LIT2
    add r0, r0, #0x4
    mov r2, r2, lsl #0x2
    bl func_020944ec
    ldr r0, _LIT1
    mov r1, #0x0
    ldr r0, [r0]
    str r1, [r0]
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_021a4824
_LIT1: .word data_021a4820
_LIT2: .word 0x04000400
