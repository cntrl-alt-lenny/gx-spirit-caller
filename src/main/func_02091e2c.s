; func_02091e2c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a63c8
        .extern data_021a63cc
        .extern data_021a63d0
        .extern data_021a63d4
        .extern data_021a63e0
        .extern data_021a64a0
        .extern data_021a6628
        .extern data_027e0000
        .extern func_02091700
        .extern func_02091714
        .extern func_02091d24
        .global func_02091e2c
        .arm
func_02091e2c:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    ldr r3, _LIT0
    ldr r0, [r3]
    cmp r0, #0x0
    addne sp, sp, #0x8
    ldmneia sp!, {r4, r5, r6, lr}
    bxne lr
    ldr ip, _LIT1
    ldr r1, _LIT2
    mov lr, #0x0
    ldr r0, _LIT3
    mov r6, #0x1
    mov r4, #0x10
    str r1, [r0, #0x8]
    str r1, [r0, #0x4]
    cmp ip, #0x0
    ldrle r0, _LIT4
    str r4, [r1, #0x70]
    suble r4, r0, ip
    str lr, [r1, #0x6c]
    str r6, [r1, #0x64]
    str lr, [r1, #0x68]
    str lr, [r1, #0x74]
    ldrgt r1, _LIT5
    ldrgt r0, _LIT6
    addgt r1, r1, #0x3f80
    subgt r0, r1, r0
    subgt r4, r0, ip
    ldr r1, _LIT5
    ldr r5, _LIT7
    ldr r2, _LIT8
    ldr r0, _LIT6
    str r5, [r2]
    ldr r2, _LIT2
    add r1, r1, #0x3f80
    str r6, [r3]
    sub r3, r1, r0
    mov r0, #0x0
    ldr r1, _LIT9
    str r3, [r2, #0x94]
    str r4, [r2, #0x90]
    str r0, [r2, #0x98]
    str r1, [r3, #-4]
    ldr r3, [r2, #0x90]
    ldr ip, _LIT10
    ldr r1, _LIT3
    str ip, [r3]
    ldr r3, _LIT11
    str r0, [r2, #0xa0]
    str r0, [r2, #0x9c]
    strh r0, [r1]
    strh r0, [r1, #0x2]
    str r1, [r3]
    bl func_02091714
    mov r2, #0xc8
    str r2, [sp]
    mov ip, #0x1f
    ldr r0, _LIT12
    ldr r1, _LIT13
    ldr r3, _LIT14
    mov r2, #0x0
    str ip, [sp, #0x4]
    bl func_02091d24
    ldr r0, _LIT12
    mov r2, #0x20
    mov r1, #0x1
    str r2, [r0, #0x70]
    str r1, [r0, #0x64]
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
_LIT0: .word data_021a63cc
_LIT1: .word 0x00000000
_LIT2: .word data_021a64a0
_LIT3: .word data_021a63d0
_LIT4: .word 0x027e0620
_LIT5: .word data_027e0000
_LIT6: .word 0x00000400
_LIT7: .word data_021a63d4
_LIT8: .word data_021a63c8
_LIT9: .word 0xfddb597d
_LIT10: .word 0x7bf9dd5b
_LIT11: .word 0x027fffa0
_LIT12: .word data_021a63e0
_LIT13: .word func_02091700
_LIT14: .word data_021a6628
