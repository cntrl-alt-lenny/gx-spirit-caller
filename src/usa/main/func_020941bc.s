; func_020941bc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a6630
        .extern func_01ff8770
        .extern func_020904c0
        .extern func_020905f4
        .extern func_02094148
        .global func_020941bc
        .arm
func_020941bc:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    ldr r4, [r0, #0xc]
    cmp r4, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, lr}
    bxeq lr
    ldr r0, _LIT0
    cmp r4, #0x1d8
    ldr r5, [r0, #0x8]
    movcs r4, #0x1d8
    ldr r2, [r0, #0xc]
    add r1, r5, r4
    subs r2, r2, r4
    str r2, [r0, #0xc]
    str r1, [r0, #0x8]
    bne .L_8c
    ldr r0, [r0, #0x4]
    ldr r1, _LIT1
    mov r2, #0x0
    bl func_020905f4
    mov r0, #0x3bc00000
    rsb r3, r0, #0x0
    ldr r1, _LIT0
    ldr r2, _LIT2
    ldr r0, [r1, #0x4]
    mov r1, r5
    orr r3, r3, r4, lsr #0x2
    bl func_01ff8770
    mov r0, #0x200000
    bl func_020904c0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
.L_8c:
    ldr r3, _LIT3
    ldr r0, [r0, #0x4]
    ldr r2, _LIT2
    mov r1, r5
    orr r3, r3, r4, lsr #0x2
    bl func_01ff8770
    mov r0, #0x200000
    bl func_020904c0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word data_021a6630
_LIT1: .word func_02094148
_LIT2: .word 0x04000400
_LIT3: .word 0x84400000
