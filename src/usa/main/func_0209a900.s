; func_0209a900 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a8304
        .extern func_0209acc0
        .extern func_0209b3f0
        .global func_0209a900
        .arm
func_0209a900:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    mov r4, r2
    bl func_0209b3f0
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, lr}
    bxeq lr
    ldr r0, _LIT0
    ldr r1, _LIT1
    and r2, r6, #0xff
    orr r0, r2, r0
    str r5, [r1, #0x4]
    str r4, [r1, #0x8]
    bl func_0209acc0
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
_LIT0: .word 0x03006600
_LIT1: .word data_021a8304
