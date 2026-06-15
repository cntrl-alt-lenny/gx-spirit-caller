; func_0209b16c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a83e4
        .extern func_0209adb4
        .extern func_0209b4e4
        .global func_0209b16c
        .arm
func_0209b16c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    mov r6, r1
    mov r5, r2
    bl func_0209b4e4
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, lr}
    bxeq lr
    mov r2, r4, lsr #0x10
    ldr r1, _LIT0
    ldr r0, _LIT1
    and r2, r2, #0xff
    orr r0, r2, r0
    str r6, [r1, #0x4]
    str r5, [r1, #0x8]
    bl func_0209adb4
    ldr r0, _LIT2
    ldr r1, _LIT3
    and r0, r4, r0
    orr r0, r0, r1
    bl func_0209adb4
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
_LIT0: .word data_021a83e4
_LIT1: .word 0x02006300
_LIT2: .word 0x0000ffff
_LIT3: .word 0x01010000
