; func_0206fbf8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101dcc
        .extern data_0219ee3c
        .extern data_0219ee4c
        .extern data_0219ee5c
        .extern func_02094500
        .extern func_02094688
        .global func_0206fbf8
        .arm
func_0206fbf8:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r5, r1
    mov r4, r2
    mov r1, #0x0
    mov r2, #0xec
    mov r6, r0
    bl func_02094500
    ldr r0, _LIT0
    mov r1, #0x6
    strh r0, [r6]
    ldr r0, _LIT1
    strb r1, [r6, #0x2]
    ldr r3, [r0, #0x8]
    ldr r2, [r0]
    ldr r1, [r0, #0x4]
    umull lr, ip, r3, r2
    mla ip, r3, r1, ip
    ldr r1, [r0, #0xc]
    ldr r7, [r0, #0x10]
    mla ip, r1, r2, ip
    adds r3, r7, lr
    ldr r1, [r0, #0x14]
    str r3, [r0]
    adc r1, r1, ip
    str r1, [r0, #0x4]
    mov r0, r1, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r3, r0, lsr #0x10
    cmp r4, #0x0
    mov r2, r3, asr #0x8
    mov r0, r1, lsl #0x10
    strne r1, [r4]
    mov r1, r0, lsr #0x10
    orr r2, r2, r3, lsl #0x8
    mov r0, r1, asr #0x8
    strh r2, [r6, #0x4]
    orr r0, r0, r1, lsl #0x8
    strh r0, [r6, #0x6]
    ldr r2, _LIT2
    ldr r0, _LIT3
    ldr r1, [r2]
    mov r1, r1, lsr #0x10
    mov r1, r1, lsl #0x10
    mov r3, r1, lsr #0x10
    mov r1, r3, asr #0x8
    orr r1, r1, r3, lsl #0x8
    strh r1, [r6, #0xc]
    ldr r2, [r2]
    add r1, r6, #0x1c
    mov r2, r2, lsl #0x10
    mov r3, r2, lsr #0x10
    mov r2, r3, asr #0x8
    orr r3, r2, r3, lsl #0x8
    mov r2, #0x6
    strh r3, [r6, #0xe]
    bl func_02094688
    ldr r0, _LIT4
    ldr r1, _LIT5
    strh r0, [r6, #0xec]
    strh r1, [r6, #0xee]
    ldr r0, _LIT6
    mov r1, #0x7
    strh r0, [r6, #0xf0]
    strb r5, [r6, #0xf2]
    mov r0, #0x3d
    strb r0, [r6, #0xf3]
    strb r1, [r6, #0xf4]
    mov r3, #0x1
    ldr r0, _LIT3
    add r1, r6, #0xf6
    mov r2, #0x6
    strb r3, [r6, #0xf5]
    bl func_02094688
    mov r1, #0xc
    strb r1, [r6, #0xfc]
    mov r2, #0xa
    ldr r0, _LIT7
    add r1, r6, #0xfe
    strb r2, [r6, #0xfd]
    bl func_02094688
    mov r1, #0x37
    strb r1, [r6, #0x108]
    mov r2, #0x3
    ldr r0, _LIT8
    strb r2, [r6, #0x109]
    mov r1, #0x1
    strb r1, [r6, #0x10a]
    strb r2, [r6, #0x10b]
    mov r1, #0x6
    strb r1, [r6, #0x10c]
    add r0, r6, r0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
_LIT0: .word 0x00000101
_LIT1: .word data_0219ee5c
_LIT2: .word data_0219ee3c
_LIT3: .word data_0219ee4c
_LIT4: .word 0x00008263
_LIT5: .word 0x00006353
_LIT6: .word 0x00000135
_LIT7: .word data_02101dcc
_LIT8: .word 0x0000010d
