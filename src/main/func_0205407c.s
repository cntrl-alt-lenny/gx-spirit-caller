; func_0205407c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ffb04
        .extern data_020ffb5c
        .extern func_02053fc4
        .extern func_020a6d54
        .global func_0205407c
        .arm
func_0205407c:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    movs r5, r0
    mov r4, r1
    bne .L_2a8
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0xa0
    bl func_020a6d54
.L_2a8:
    cmp r5, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, pc}
    ldr r2, [r5]
    mov r0, r5
    mov r1, r4
    bl func_02053fc4
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_020ffb5c
_LIT1: .word data_020ffb04
