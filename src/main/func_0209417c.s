; func_0209417c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a6710
        .extern func_01ff8770
        .extern func_020906dc
        .extern func_02093c20
        .extern func_02093c90
        .extern func_02093dc8
        .extern func_0209413c
        .global func_0209417c
        .arm
func_0209417c:
    stmdb sp!, {r4, r5, r6, lr}
    movs r4, r2
    mov r6, r0
    mov r5, r1
    bne .L_374
    cmp r3, #0x0
    ldmeqia sp!, {r4, r5, r6, lr}
    bxeq lr
    ldr r0, [sp, #0x10]
    blx r3
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_374:
    ldr r2, _LIT0
    ldr r0, [r2]
    cmp r0, #0x0
    bne .L_374
    ldr ip, [sp, #0x10]
    mov lr, #0x1
    mov r0, r6
    mov r1, #0x38000000
    str lr, [r2]
    str r6, [r2, #0x4]
    str r3, [r2, #0x10]
    str ip, [r2, #0x14]
    bl func_02093c90
    mov r0, r6
    mov r1, r5
    mov r2, r4
    mov r3, #0x0
    bl func_02093c20
    mov r0, r6
    bl func_02093dc8
    mov r0, r6
    ldr r1, _LIT1
    mov r2, #0x0
    bl func_020906dc
    mov r0, r6
    mov r1, r5
    ldr r2, _LIT2
    mov r3, #0x3c00000
    rsb r3, r3, #0x0
    orr r3, r3, r4, lsr #0x2
    bl func_01ff8770
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
_LIT0: .word data_021a6710
_LIT1: .word func_0209413c
_LIT2: .word 0x04000400
