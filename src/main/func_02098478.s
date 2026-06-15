; func_02098478 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021024b8
        .extern data_021a831c
        .extern data_021a8320
        .extern data_021a8324
        .extern data_021a832c
        .extern data_021a8334
        .extern func_02090868
        .extern func_02097238
        .extern func_020975f0
        .extern func_02097700
        .extern func_02097810
        .extern func_02098618
        .extern func_02098620
        .extern func_02098628
        .extern func_020986b8
        .extern func_020986c0
        .extern func_0209cae4
        .global func_02098478
        .arm
func_02098478:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x14
    ldr r1, _LIT0
    str r0, [r1]
    bl func_02090868
    ldr r3, _LIT1
    ldr r2, _LIT2
    mov ip, #0x0
    ldr r1, _LIT3
    str r0, [r3]
    str ip, [r2]
    str ip, [r2, #0x4]
    str ip, [r1]
    str ip, [r1, #0x4]
    bl func_0209cae4
    ldr r0, _LIT4
    bl func_02097810
    ldr r0, _LIT4
    ldr r1, _LIT5
    mov r2, #0x3
    bl func_02097700
    ldr r0, _LIT6
    ldrh r0, [r0]
    cmp r0, #0x2
    bne .L_c8
    ldr ip, _LIT2
    mvn r2, #0x0
    ldr r3, _LIT3
    mov lr, #0x0
    ldr r0, _LIT4
    ldr r1, _LIT7
    str r2, [ip]
    str lr, [ip, #0x4]
    str r2, [r3]
    str lr, [r3, #0x4]
    bl func_02097238
    mov r1, #0x0
    str r1, [sp]
    ldr r0, _LIT8
    str r1, [sp, #0x4]
    str r0, [sp, #0x8]
    ldr ip, _LIT9
    ldr r0, _LIT4
    mov r2, r1
    mov r3, r1
    str ip, [sp, #0xc]
    bl func_020975f0
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, lr}
    bx lr
.L_c8:
    ldr r5, _LIT10
    ldr r0, _LIT4
    ldr r1, _LIT11
    ldr r2, _LIT12
    ldr r4, _LIT13
    bl func_02097238
    ldr r1, [r5]
    mvn r0, #0x0
    cmp r1, r0
    addeq sp, sp, #0x14
    ldmeqia sp!, {r4, r5, lr}
    bxeq lr
    cmp r1, #0x0
    addeq sp, sp, #0x14
    ldmeqia sp!, {r4, r5, lr}
    bxeq lr
    ldr r2, [r4]
    cmp r2, r0
    addeq sp, sp, #0x14
    ldmeqia sp!, {r4, r5, lr}
    bxeq lr
    cmp r2, #0x0
    addeq sp, sp, #0x14
    ldmeqia sp!, {r4, r5, lr}
    bxeq lr
    str r1, [sp]
    ldr r0, [r5, #0x4]
    ldr r1, _LIT14
    str r0, [sp, #0x4]
    ldr r0, _LIT9
    str r1, [sp, #0x8]
    str r0, [sp, #0xc]
    ldr r3, [r4, #0x4]
    ldr r0, _LIT4
    mov r1, #0x0
    bl func_020975f0
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word data_021a8320
_LIT1: .word data_021a831c
_LIT2: .word data_021a8324
_LIT3: .word data_021a832c
_LIT4: .word data_021a8334
_LIT5: .word data_021024b8
_LIT6: .word 0x027ffc40
_LIT7: .word func_02098618
_LIT8: .word func_02098620
_LIT9: .word func_020986b8
_LIT10: .word 0x027ffe40
_LIT11: .word func_02098628
_LIT12: .word 0x00000602
_LIT13: .word 0x027ffe48
_LIT14: .word func_020986c0
