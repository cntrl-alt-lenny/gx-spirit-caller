; func_0209595c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a666c
        .extern data_021a6670
        .extern data_021a6674
        .extern data_021a6678
        .extern data_021a667c
        .extern data_021a6680
        .extern data_021a6684
        .extern data_021a6688
        .extern data_021a668c
        .extern data_021a66c0
        .extern data_021a6940
        .extern data_021a7940
        .extern data_021a8128
        .extern data_021a81a0
        .extern func_02095324
        .extern func_02095584
        .extern func_02095744
        .extern func_0209578c
        .extern func_02095b54
        .global func_0209595c
        .arm
func_0209595c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x4
    bl func_02095324
    ldr r3, _LIT0
    ldr r0, _LIT1
    mov r4, #0x0
    str r3, [r0]
    mov r1, r3
    mov r0, #0x18
.L_158:
    add r4, r4, #0x1
    mla r2, r4, r0, r1
    cmp r4, #0xff
    str r2, [r3], #0x18
    blt .L_158
    ldr r7, _LIT2
    mov sl, #0x0
    ldr r5, _LIT3
    ldr r4, _LIT4
    ldr lr, _LIT5
    ldr ip, _LIT6
    ldr r3, _LIT7
    ldr r1, _LIT8
    ldr r9, _LIT9
    ldr r6, _LIT10
    ldr r2, _LIT11
    mov r8, #0x1
    ldr r0, _LIT12
    ldr fp, _LIT13
    str r9, [r6]
    str sl, [r7, #0x7e8]
    str sl, [r5]
    str sl, [r4]
    str sl, [lr]
    str sl, [ip]
    str sl, [r3]
    str r8, [r2]
    str sl, [r1]
    str r0, [fp]
    bl func_02095b54
    mov r0, r8
    bl func_0209578c
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bxeq lr
    mov r2, #0x1d
    mov r1, fp
    str r2, [r0, #0x4]
    ldr r1, [r1]
    str r1, [r0, #0x8]
    bl func_02095744
    mov r0, r8
    bl func_02095584
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
_LIT0: .word data_021a6940
_LIT1: .word data_021a666c
_LIT2: .word data_021a7940
_LIT3: .word data_021a6674
_LIT4: .word data_021a6678
_LIT5: .word data_021a6688
_LIT6: .word data_021a6680
_LIT7: .word data_021a6684
_LIT8: .word data_021a6670
_LIT9: .word data_021a8128
_LIT10: .word data_021a667c
_LIT11: .word data_021a668c
_LIT12: .word data_021a66c0
_LIT13: .word data_021a81a0
