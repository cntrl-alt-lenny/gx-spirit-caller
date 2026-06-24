; func_02088ca4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a5124
        .extern data_021a512c
        .extern data_021a5260
        .extern func_02091a0c
        .extern func_02092484
        .global func_02088ca4
        .arm
func_02088ca4:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r3, _LIT0
    ldr r0, [r3]
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqfd sp!, {pc}
    ldr r0, _LIT1
    mov r1, #0x0
    mov r2, #0x1
    str r1, [r3]
    bl func_02092484
    ldr r0, _LIT2
    bl func_02091a0c
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_021a5124
_LIT1: .word data_021a512c
_LIT2: .word data_021a5260
