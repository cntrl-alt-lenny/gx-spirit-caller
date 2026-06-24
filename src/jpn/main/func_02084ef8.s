; func_02084ef8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a4740
        .extern data_021a4744
        .extern func_02084ee0
        .extern func_020943f8
        .global func_02084ef8
        .arm
func_02084ef8:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r0, #0x0
    beq .L_1c
    bl func_02084ee0
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
    bl func_020943f8
    ldr r0, _LIT1
    mov r1, #0x0
    ldr r0, [r0]
    str r1, [r0]
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_021a4744
_LIT1: .word data_021a4740
_LIT2: .word 0x04000400
