; func_ov012_021ca884 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern data_02103fcc
        .extern data_02104e6c
        .extern data_ov012_021cbf8c
        .extern data_ov012_021cbf98
        .extern data_ov012_021cbf9c
        .extern data_ov012_021cbfa0
        .extern data_ov012_021cbfd0
        .extern data_ov012_021cc0a0
        .extern data_ov012_021cc5c0
        .extern data_ov012_021cc5fc
        .extern data_ov012_021cc67c
        .extern data_ov012_021cc680
        .extern data_ov012_021cc684
        .extern data_ov012_021cc6a0
        .extern data_ov012_021cc6a8
        .extern data_ov012_021cc6ac
        .extern data_ov012_021cc6b0
        .extern data_ov012_021cc6b4
        .extern data_ov012_021cc6b8
        .extern data_ov012_021cc6bc
        .extern data_ov012_021cc6c0
        .extern data_ov012_021cc6e8
        .extern data_ov012_021cc6f4
        .extern data_ov012_021cc714
        .extern data_ov012_021cc71c
        .extern data_ov012_021cc724
        .extern func_020018b4
        .extern func_020057e4
        .extern func_0200a39c
        .extern func_0200a3f0
        .extern func_0201e78c
        .extern func_0201ef3c
        .extern func_0202c01c
        .extern func_020371b8
        .extern func_0203737c
        .extern func_0208c858
        .extern func_ov000_021ab440
        .extern func_ov000_021ab4cc
        .extern func_ov000_021ab60c
        .extern func_ov000_021ab7d4
        .extern func_ov000_021ab818
        .extern func_ov000_021ac398
        .extern func_ov000_021ac428
        .extern func_ov000_021ac450
        .extern func_ov000_021ac458
        .extern func_ov000_021ac480
        .extern func_ov000_021acda4
        .extern func_ov000_021acddc
        .extern func_ov000_021ad308
        .extern func_ov000_021ada90
        .extern func_ov000_021adb50
        .extern func_ov000_021aec2c
        .extern func_ov000_021af24c
        .extern func_ov000_021af27c
        .extern func_ov000_021af2e4
        .extern func_ov012_021c9cac
        .extern func_ov012_021c9d3c
        .extern func_ov012_021ca1c0
        .extern func_ov012_021ca370
        .extern func_ov012_021ca734
        .global func_ov012_021ca884
        .arm
func_ov012_021ca884:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x58
    mov r0, #0x0
    mov r1, #0x3f
    ldr r7, _LIT0
    bl func_ov000_021ab440
    mov r0, #0x0
    sub r1, r0, #0x10
    bl func_ov000_021ab4cc
    mov r0, #0x1
    mov r1, #0x3f
    bl func_ov000_021ab440
    mov r0, #0x1
    sub r1, r0, #0x11
    bl func_ov000_021ab4cc
    bl func_ov000_021ab818
    ldr r3, _LIT1
    ldr r0, _LIT2
    ldrh r1, [r3]
    sub r2, r3, #0x2
    and r1, r1, #0x43
    orr r1, r1, #0xe90
    orr r1, r1, #0x3000
    strh r1, [r3]
    ldrh r1, [r2]
    bic r1, r1, #0x3
    orr r1, r1, #0x2
    strh r1, [r2]
    ldrh r1, [r3]
    bic r1, r1, #0x3
    orr r1, r1, #0x3
    strh r1, [r3]
    ldr r0, [r0, #0x198]
    bl func_ov012_021ca734
    ldr r5, _LIT3
    add r4, sp, #0x28
    ldmia r5!, {r0, r1, r2, r3}
    stmia r4!, {r0, r1, r2, r3}
    ldmia r5!, {r0, r1, r2, r3}
    stmia r4!, {r0, r1, r2, r3}
    ldmia r5, {r0, r1, r2, r3}
    stmia r4, {r0, r1, r2, r3}
    bl func_0201e78c
    mov r3, #0x0
    str r3, [sp]
    mov r0, #0x1
    str r0, [sp, #0x4]
    add r1, sp, #0x28
    str r1, [sp, #0x8]
    mov r0, #0x3e
    str r3, [sp, #0xc]
    str r0, [sp, #0x10]
    ldr r1, _LIT4
    ldr r0, _LIT5
    str r1, [sp, #0x14]
    ldr r1, _LIT6
    ldr r2, _LIT7
    bl func_0201ef3c
    bl func_0201e78c
    mov r0, #0x3e
    str r0, [sp]
    mov r0, #0x1
    str r0, [sp, #0x4]
    add r1, sp, #0x38
    str r1, [sp, #0x8]
    mov r0, #0x0
    str r0, [sp, #0xc]
    mov r0, #0x40
    str r0, [sp, #0x10]
    ldr r1, _LIT8
    ldr r0, _LIT9
    str r1, [sp, #0x14]
    ldr r1, _LIT10
    ldr r2, _LIT11
    mov r3, #0x3ac0
    bl func_0201ef3c
    bl func_0201e78c
    mov r0, #0x7e
    str r0, [sp]
    mov r1, #0x1
    str r1, [sp, #0x4]
    add r0, sp, #0x48
    str r0, [sp, #0x8]
    mov r0, #0x0
    str r0, [sp, #0xc]
    mov r0, #0x20
    str r0, [sp, #0x10]
    ldr r4, _LIT12
    ldr r0, _LIT13
    ldr r1, _LIT14
    ldr r2, _LIT15
    ldr r3, _LIT16
    str r4, [sp, #0x14]
    bl func_0201ef3c
    ldr r0, _LIT17
    add r4, sp, #0x18
    ldmia r0, {r0, r1, r2, r3}
    stmia r4, {r0, r1, r2, r3}
    bl func_0201e78c
    mov r0, #0x40
    str r0, [sp]
    mov r0, #0x2
    str r0, [sp, #0x4]
    mov r1, r4
    str r1, [sp, #0x8]
    mov r0, #0x0
    str r0, [sp, #0xc]
    mov r0, #0x20
    str r0, [sp, #0x10]
    ldr r1, _LIT18
    ldr r0, _LIT19
    str r1, [sp, #0x14]
    ldr r1, _LIT20
    ldr r2, _LIT21
    ldr r3, _LIT22
    bl func_0201ef3c
    .word 0xebff99ae
    ldr r0, _LIT23
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_0202c01c
    bl func_ov000_021acddc
    mov r0, #0x1
    bl func_ov000_021acda4
    mov r0, #0x1
    bl func_ov000_021aec2c
    mov r0, #0x1
    bl func_ov000_021af2e4
    bl func_ov000_021ad308
    mov r0, #0x9
    bl func_ov000_021adb50
    bl func_ov000_021ada90
    mov r0, #0xc
    bl func_ov000_021af24c
    mov r0, #0x120
    bl func_ov000_021af27c
    ldr r1, _LIT24
    ldrh r0, [r1]
    bic r0, r0, #0x3
    strh r0, [r1]
    ldrh r0, [r1, #0x2]
    bic r0, r0, #0x3
    orr r0, r0, #0x1
    strh r0, [r1, #0x2]
    bl func_ov012_021ca1c0
    ldr r0, _LIT25
    ldr r0, [r0, #0x3c]
    cmp r0, #0x1
    bne .L_794
    bl GetSystemWork
    ldr r0, [r0, #0x900]
    mov r0, r0, lsl #0x15
    movs r0, r0, lsr #0x1e
    bne .L_794
    mov r0, #0x53
    sub r1, r0, #0x54
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
.L_794:
    ldr r0, _LIT25
    ldr r2, [r7, #0x160]
    ldr r1, [r0, #0x3c]
    bic r2, r2, #0xf
    cmp r1, #0x1
    moveq r1, #0x0
    streq r1, [r0, #0x3c]
    ldr r0, _LIT25
    ldr r1, [r0, #0x3c]
    ldr r0, [r7, #0x16c]
    and r1, r1, #0xf
    bic r0, r0, #0x30000
    orr r1, r2, r1
    orr r0, r0, #0x20000
    str r1, [r7, #0x160]
    str r0, [r7, #0x16c]
    bl func_ov012_021ca370
    mov r0, #0x80
    bl func_020018b4
    ldr r0, [r7, #0x16c]
    bic r0, r0, #0x3fc0000
    orr r0, r0, #0xf00000
    str r0, [r7, #0x16c]
    bl func_0200a39c
    ldr r1, [r7, #0x16c]
    mov r0, r0, lsl #0x1f
    bic r1, r1, #0x4000000
    orr r0, r1, r0, lsr #0x5
    ldr r6, _LIT26
    ldr r5, _LIT27
    ldr r4, _LIT28
    ldr fp, _LIT29
    str r0, [r7, #0x16c]
    add r9, r7, #0x130
    mov r8, #0x0
.L_820:
    add r0, r6, r8, lsl #0x2
    ldrh r1, [r0, #0x2]
    mov r3, r8, lsl #0x2
    add r0, r5, r8, lsl #0x2
    str r1, [sp]
    ldrh r1, [r5, r3]
    ldrh r2, [r0, #0x2]
    ldrh r3, [r6, r3]
    mov r0, r9
    bl func_ov000_021ac398
    ldr r1, [r4, r8, lsl #0x2]
    mov r0, r9
    bl func_ov000_021ac450
    add r1, fp, r8, lsl #0x1
    ldrb sl, [fp, r8, lsl #0x1]
    ldrb r2, [r1, #0x1]
    mov r0, r9
    mov r1, sl
    bl func_ov000_021ac428
    ldr r1, [r9, #0x8]
    and r0, r8, #0xff
    bic r1, r1, #0xff
    orr r0, r1, r0
    str r0, [r9, #0x8]
    add r0, r7, r8, lsl #0x2
    str r9, [r0, #0x144]
    bl func_0200a3f0
    cmp r0, #0x0
    bne .L_8b0
    mov r0, r9
    mov r1, #0x0
    bl func_ov000_021ac458
    mov r0, r9
    mov r1, #0x0
    bl func_ov000_021ac480
    b .L_8d0
.L_8b0:
    ldr r0, [r7, #0x16c]
    mov r0, r0, lsl #0x5
    movs r0, r0, lsr #0x1f
    bne .L_8d0
    mov r0, r9
    mov r1, sl
    mov r2, #0x0
    bl func_ov000_021ac428
.L_8d0:
    add r8, r8, #0x1
    cmp r8, #0x1
    add r9, r9, #0x14
    bcc .L_820
    ldr r0, _LIT30
    bl func_020057e4
    bl func_ov012_021c9d3c
    bl func_0208c858
    ldr r2, _LIT31
    mov r0, #0x1
    ldr r1, [r2]
    orr r1, r1, #0x10000
    str r1, [r2]
    .word 0xebff9eb1
    bl GetSystemWork
    ldr r0, [r0, #0x900]
    mov r0, r0, lsl #0x15
    movs r0, r0, lsr #0x1e
    beq .L_930
    bl GetSystemWork
    ldr r1, [r0, #0x900]
    bic r1, r1, #0x600
    str r1, [r0, #0x900]
    b .L_954
.L_930:
    ldr r4, _LIT25
    mov r2, #0x0
    ldr r0, [r4, #0xb7c]
    sub r3, r2, #0x1
    str r0, [r4, #0xb80]
    mov r0, #0x23
    mov r1, #0x1
    str r0, [r4, #0xb7c]
    bl func_0203737c
.L_954:
    mov r0, #0x0
    bl func_ov000_021ab7d4
    bl GetSystemWork
    ldr r0, [r0, #0x900]
    mov r0, r0, lsl #0x14
    movs r0, r0, lsr #0x1f
    bne .L_998
    ldr r0, _LIT25
    ldr r1, [r0, #0x3c]
    cmp r1, #0x0
    ldrne r0, [r0, #0x40]
    cmpne r0, #0x0
    bne .L_998
    mov r0, #0x0
    mov r1, #0x10
    bl func_ov000_021ab60c
    b .L_9cc
.L_998:
    mov r0, #0x1
    mov r1, #0x3f
    bl func_ov000_021ab440
    mov r0, #0x1
    sub r1, r0, #0x11
    bl func_ov000_021ab4cc
    mov r0, #0x0
    mov r1, #0x3f
    bl func_ov000_021ab440
    mov r0, #0x0
    sub r1, r0, #0x10
    bl func_ov000_021ab4cc
    bl func_ov000_021ab818
.L_9cc:
    mov r0, #0x1
    add sp, sp, #0x58
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov012_021cc5fc
_LIT1: .word 0x0400000a
_LIT2: .word data_ov012_021cc5c0
_LIT3: .word data_ov012_021cc0a0
_LIT4: .word data_ov012_021cc714
_LIT5: .word data_ov012_021cc6a8
_LIT6: .word data_ov012_021cc6b4
_LIT7: .word data_ov012_021cc6c0
_LIT8: .word data_ov012_021cc71c
_LIT9: .word data_ov012_021cc6ac
_LIT10: .word data_ov012_021cc6b8
_LIT11: .word data_ov012_021cc6e8
_LIT12: .word data_ov012_021cc724
_LIT13: .word data_ov012_021cc6b0
_LIT14: .word data_ov012_021cc6bc
_LIT15: .word data_ov012_021cc6f4
_LIT16: .word 0x00005ac0
_LIT17: .word data_ov012_021cbfd0
_LIT18: .word data_ov012_021cc6a0
_LIT19: .word data_ov012_021cc67c
_LIT20: .word data_ov012_021cc680
_LIT21: .word data_ov012_021cc684
_LIT22: .word 0x0001d680
_LIT23: .word data_02104e6c
_LIT24: .word 0x0400000c
_LIT25: .word data_02103fcc
_LIT26: .word data_ov012_021cbfa0
_LIT27: .word data_ov012_021cbf98
_LIT28: .word data_ov012_021cbf9c
_LIT29: .word data_ov012_021cbf8c
_LIT30: .word func_ov012_021c9cac
_LIT31: .word 0x04001000
