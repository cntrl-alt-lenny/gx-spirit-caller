; func_0209a968 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a83e4
        .extern func_0209adb4
        .extern func_0209b4e4
        .global func_0209a968
        .arm
func_0209a968:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    mov r4, r2
    bl func_0209b4e4
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, lr}
    bxeq lr
    ldr r1, _LIT0
    ldr r0, _LIT1
    str r5, [r1, #0x4]
    str r4, [r1, #0x8]
    str r6, [r1, #0xc]
    bl func_0209adb4
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
_LIT0: .word data_021a83e4
_LIT1: .word 0x03006700
