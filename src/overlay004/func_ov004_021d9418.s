; func_ov004_021d9418 - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102c90
        .extern data_ov004_0220a18c
        .extern data_ov004_0220a1a4
        .extern data_ov004_0220b500
        .extern data_ov004_02211490
        .extern data_ov004_022915e8
        .extern func_02001bc8
        .extern func_02001d0c
        .extern func_02001e94
        .extern func_02004f58
        .extern func_020054a4
        .extern func_02006c0c
        .extern func_02006e1c
        .extern func_0201d47c
        .extern func_0201e5b8
        .extern func_0202c0c0
        .extern func_0208dd9c
        .extern func_0208de4c
        .extern func_0208e0a0
        .extern func_02094504
        .extern func_02094550
        .extern func_ov004_021c9ef0
        .extern func_ov004_021c9fcc
        .extern func_ov004_021cded0
        .extern func_ov004_021d8648
        .extern func_ov004_021d8798
        .global func_ov004_021d9418
        .arm
func_ov004_021d9418:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x50
    mov r0, #0x0
    bl func_ov004_021cded0
    ldr r4, _LIT0
    add r0, sp, #0x30
    ldr r2, [r4]
    ldr r1, [r4]
    and r2, r2, #0x1f00
    mov r3, r2, lsr #0x8
    bic r2, r1, #0x1f00
    bic r1, r3, #0xf
    orr r3, r2, r1, lsl #0x8
    ldr r1, _LIT1
    ldr r2, _LIT2
    str r3, [r4]
    bl func_02001bc8
    ldr r1, _LIT3
    add r0, sp, #0x30
    mov r2, #0x20
    bl func_02094550
    add r2, r4, #0xc
    ldrh r1, [r2]
    mov r0, #0x0
    bic r1, r1, #0x3
    orr r1, r1, #0x1
    strh r1, [r2]
    str r0, [r2, #0xc]
    ldrh r0, [r2]
    and r0, r0, #0x43
    orr r0, r0, #0x8
    orr r0, r0, #0x400
    strh r0, [r2]
    bl func_0208de4c
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x20
    bl func_02094504
    bl func_0208e0a0
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x800
    bl func_02094504
    add r2, r4, #0xe
    ldrh r1, [r2]
    mov r0, #0x0
    bic r1, r1, #0x3
    orr r1, r1, #0x3
    strh r1, [r2]
    str r0, [r2, #0xe]
    ldrh r0, [r2]
    and r0, r0, #0x43
    orr r0, r0, #0x284
    orr r0, r0, #0x400
    strh r0, [r2]
    bl func_0208dd9c
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x40
    bl func_02094504
    ldr r0, _LIT4
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    mov r4, r0
    add r0, sp, #0x8
    bl func_0201d47c
    ldrh r0, [sp, #0x1c]
    mov r3, #0x0
    ldr r1, [sp, #0x20]
    bic r0, r0, #0xf
    orr r0, r0, #0x8
    strh r0, [sp, #0x1c]
    bic r1, r1, #0x1c000
    orr r2, r1, #0xc000
    ldrh r0, [sp, #0x1c]
    mov r5, #0x40
    str r4, [sp, #0x8]
    orr r1, r0, #0x10
    add r0, sp, #0x8
    str r5, [sp, #0x14]
    str r3, [sp, #0x10]
    str r2, [sp, #0x20]
    strh r1, [sp, #0x1c]
    strh r3, [sp, #0x18]
    bl func_0201e5b8
    mov r0, r4
    bl func_02006e1c
    ldr r3, _LIT0
    mov r0, #0x1
    ldr r2, [r3]
    ldr r1, [r3]
    and r2, r2, #0x1f00
    mov r4, r2, lsr #0x8
    bic r2, r1, #0x1f00
    orr r1, r4, #0xc
    orr r1, r2, r1, lsl #0x8
    str r1, [r3]
    str r0, [sp]
    ldr r0, _LIT5
    ldr r1, _LIT6
    mov r2, #0x2
    mov r3, #0xc00
    bl func_ov004_021c9fcc
    ldr r0, _LIT7
    bl func_ov004_021d8648
    ldr r0, _LIT8
    mov r1, #0x14
    mov r2, #0xc
    bl func_02001d0c
    bl func_0208de4c
    add r4, r0, #0xe20
    mov r0, #0x0
    add r1, r4, #0x1000
    mov r2, #0x1e00
    bl func_02094504
    mov r8, #0x0
    mov r5, #0xc
    ldr fp, _LIT8
    mov sl, #0x1d
    mov r6, r8
    mov r7, r5
.L_8e4:
    add r0, r8, #0xe2
    bl func_0202c0c0
    mov r1, r7
    mov r9, r0
    bl func_020054a4
    rsb r0, r0, #0xa0
    add r0, r0, r0, lsr #0x1f
    mov r3, r0, asr #0x1
    cmp r3, #0x0
    movle r3, r6
    str sl, [sp]
    mov r0, fp
    mov r1, r9
    add r2, r4, #0x1000
    add r3, r3, #0x1
    str r5, [sp, #0x4]
    bl func_02004f58
    add r8, r8, #0x1
    cmp r8, #0x2
    add sl, sl, #0x1a
    blt .L_8e4
    bl func_0208e0a0
    mov r1, r0
    ldr r0, _LIT8
    add r1, r1, #0x20c
    mov r2, #0xf1
    mov r3, #0x0
    bl func_02001e94
    ldr r0, _LIT9
    mov r3, #0x0
    ldr r1, [r0, #0x220]
    sub r2, r3, #0x1
    str r3, [r0, #0x238]
    str r3, [r0, #0x230]
    str r3, [r0, #0x22c]
    str r3, [r0, #0x228]
    str r3, [r0, #0x224]
    str r3, [r0, #0x234]
    str r2, [r0, #0x84]
    cmp r1, #0x0
    beq .L_9ac
    mov r0, #0x1
    bl func_ov004_021cded0
    mov r0, #0xe1
    bl func_ov004_021c9ef0
    ldr r0, _LIT9
    mov r1, #0x5
    str r1, [r0, #0x54]
    add sp, sp, #0x50
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_9ac:
    mov r0, #0xe9
    bl func_ov004_021c9ef0
    ldr r1, _LIT9
    mov r2, #0x4
    mov r0, #0xdf
    str r2, [r1, #0x54]
    bl func_0202c0c0
    mov r1, r0
    ldr r0, _LIT7
    mov r2, #0x0
    bl func_ov004_021d8798
    add sp, sp, #0x50
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x04001000
_LIT1: .word 0x00003860
_LIT2: .word 0x0000779b
_LIT3: .word 0x05000400
_LIT4: .word data_ov004_0220a18c
_LIT5: .word data_ov004_02211490
_LIT6: .word data_ov004_0220a1a4
_LIT7: .word data_ov004_022915e8
_LIT8: .word data_02102c90
_LIT9: .word data_ov004_0220b500
