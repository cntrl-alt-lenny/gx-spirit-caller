; func_ov000_021ad7fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_InvokeLocked
        .extern data_020b4654
        .extern data_ov000_021b54f0
        .extern data_ov000_021b54f4
        .extern data_ov000_021b54f8
        .extern data_ov000_021b551c
        .extern data_ov000_021b5538
        .extern data_ov000_021b5544
        .extern data_ov000_021b5588
        .extern data_ov000_021c74ac
        .extern data_ov000_021c74e4
        .extern data_ov000_021c74e8
        .extern data_ov000_021c752c
        .extern data_ov000_021c755c
        .extern data_ov000_021c7638
        .extern func_02006bf0
        .extern func_0201d428
        .extern func_0201d460
        .extern func_0201e564
        .extern func_0201e78c
        .extern func_0201ef3c
        .extern func_0208fe34
        .extern func_02094410
        .extern func_ov000_021ac398
        .extern func_ov000_021ac428
        .extern func_ov000_021ac450
        .extern func_ov000_021b3228_unk
        .extern func_ov000_021b330c_unk
        .global func_ov000_021ad7fc
        .arm
func_ov000_021ad7fc:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x5c
    ldr r1, _LIT0
    add r3, sp, #0x28
    mov r4, r0
    ldmia r1, {r0, r1, r2}
    stmia r3, {r0, r1, r2}
    ldr r3, _LIT1
    mov r0, #0x2
    ldrh r1, [r3]
    sub r2, r3, #0x4
    and r1, r1, #0x43
    orr r1, r1, #0x700
    strh r1, [r3]
    ldrh r1, [r2]
    and r1, r1, #0x43
    orr r1, r1, #0x2600
    strh r1, [r2]
    bl func_0201d460
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x800
    bl func_02094410
    ldr r0, _LIT2
    mov r1, #0x0
    str r1, [r0]
    str r1, [r0, #-8]
    add r0, sp, #0x34
    bl func_0201d428
    add r0, sp, #0x28
    ldr r0, [r0, r4, lsl #0x2]
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    str r0, [sp, #0x34]
    mov r0, #0x0
    ldrh r2, [sp, #0x48]
    str r0, [sp, #0x3c]
    ldr r1, [sp, #0x4c]
    bic r0, r2, #0xf
    strh r0, [sp, #0x48]
    bic r0, r1, #0x7f
    bic r0, r0, #0x3f80
    str r0, [sp, #0x4c]
    mov r0, #0x20
    str r0, [sp, #0x40]
    str r0, [sp, #0x54]
    mov r0, #0x180
    strh r0, [sp, #0x44]
    add r0, sp, #0x34
    bl func_0201e564
    ldr r0, [sp, #0x34]
    bl Task_InvokeLocked
    ldr r0, _LIT3
    mov r2, r4, lsl #0x1e
    ldr r3, [r0, #0x2a4]
    mov r1, #0x1
    bic r3, r3, #0x600000
    orr r2, r3, r2, lsr #0x9
    str r2, [r0, #0x2a4]
    str r1, [sp]
    mov r0, #0x0
    str r0, [sp, #0x4]
    mov r0, #0x10
    str r0, [sp, #0x8]
    mov r0, #0xe
    str r0, [sp, #0xc]
    mov r0, #0xa
    str r0, [sp, #0x10]
    mov r0, #0x5
    ldr r4, _LIT4
    str r0, [sp, #0x14]
    mov r0, r4
    mov r1, #0x20
    mov r2, #0x2
    mov r3, #0x1d400
    bl func_ov000_021b3228_unk
    ldr r1, _LIT5
    mov r0, r4
    ldmia r1, {r1, r2, r3}
    bl func_ov000_021b330c_unk
    ldr r0, _LIT6
    mov r1, #0x1c0
    mov r2, #0x20
    bl func_0208fe34
    ldr r0, _LIT7
    add r4, sp, #0x18
    ldmia r0, {r0, r1, r2, r3}
    stmia r4, {r0, r1, r2, r3}
    bl func_0201e78c
    mov r0, #0x1e0
    str r0, [sp]
    mov r0, #0x1
    str r0, [sp, #0x4]
    mov r1, r4
    str r1, [sp, #0x8]
    mov r0, #0x0
    str r0, [sp, #0xc]
    mov r0, #0x20
    str r0, [sp, #0x10]
    ldr r1, _LIT3
    ldr r0, _LIT8
    ldr r2, [r1, #0x60]
    ldr r1, _LIT9
    str r2, [sp, #0x14]
    ldr r2, _LIT10
    mov r3, #0x1dc00
    bl func_0201ef3c
    ldr r9, _LIT11
    ldr r7, _LIT12
    ldr r6, _LIT13
    ldr r5, _LIT14
    ldr r4, _LIT15
    mov r8, #0x0
.L_444:
    add r0, r7, r8, lsl #0x2
    ldrh r1, [r0, #0x2]
    mov r3, r8, lsl #0x2
    add r0, r6, r8, lsl #0x2
    str r1, [sp]
    ldrh r1, [r6, r3]
    ldrh r2, [r0, #0x2]
    ldrh r3, [r7, r3]
    mov r0, r9
    bl func_ov000_021ac398
    ldr r1, [r5, r8, lsl #0x2]
    mov r0, r9
    bl func_ov000_021ac450
    add r0, r4, r8, lsl #0x1
    ldrb r2, [r0, #0x1]
    ldrb r1, [r4, r8, lsl #0x1]
    mov r0, r9
    bl func_ov000_021ac428
    ldr r1, [r9, #0x8]
    and r0, r8, #0xff
    bic r1, r1, #0xff
    orr r0, r1, r0
    add r8, r8, #0x1
    str r0, [r9, #0x8]
    cmp r8, #0x1
    add r9, r9, #0x14
    bcc .L_444
    add sp, sp, #0x5c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov000_021b5538
_LIT1: .word 0x0400000c
_LIT2: .word 0x04000018
_LIT3: .word data_ov000_021c74ac
_LIT4: .word data_ov000_021c755c
_LIT5: .word data_ov000_021b5544
_LIT6: .word data_020b4654
_LIT7: .word data_ov000_021b5588
_LIT8: .word data_ov000_021c74e4
_LIT9: .word data_ov000_021c74e8
_LIT10: .word data_ov000_021c752c
_LIT11: .word data_ov000_021c7638
_LIT12: .word data_ov000_021b551c
_LIT13: .word data_ov000_021b54f8
_LIT14: .word data_ov000_021b54f4
_LIT15: .word data_ov000_021b54f0
