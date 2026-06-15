; func_0203fe78 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219d9d4
        .extern func_0203f778
        .extern func_0203fc70
        .extern func_0204014c
        .extern func_020418ac
        .extern func_02091768
        .extern func_02091af4
        .extern func_02092748
        .extern func_020927b8
        .extern func_020930b0
        .extern func_020b3808
        .global func_0203fe78
        .arm
func_0203fe78:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x14
    mov r9, #0x0
    mov r0, #0x1
    ldr r7, _LIT0
    ldr fp, _LIT1
    ldr r5, _LIT2
    ldr r4, _LIT3
    mov r6, r9
    str r9, [sp, #0x8]
    str r9, [sp, #0xc]
    str r0, [sp, #0x4]
.L_7dc:
    ldr r0, [r5]
    add r0, r0, #0x1000
    ldr r1, [r0, #0x314]
    add r0, r1, #0x1000
    ldr r0, [r0, #0xba0]
    cmp r0, #0x0
    beq .L_804
    ldr r0, _LIT4
    add r0, r1, r0
    bl func_02091af4
.L_804:
    ldr r0, [r5]
    add r1, r0, #0x1000
    ldr r0, [r1, #0x314]
    add r0, r0, #0x1000
    ldr r0, [r0, #0x20]
    cmp r0, #0x8
    beq .L_8ac
    ldr r0, _LIT5
    str r0, [r1, #0x8]
    ldr r0, [r5]
    add r0, r0, #0x1000
    ldr r0, [r0, #0x314]
    add r0, r0, #0x1000
    ldr r0, [r0, #0x20]
    cmp r0, #0x7
    bne .L_854
    mov r0, #0x14
    bl func_0203f778
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_854:
    cmp r9, #0x2
    ble .L_89c
    cmp r0, #0x2
    bne .L_874
    mov r0, #0x9
    bl func_0203f778
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_874:
    cmp r0, #0x3
    bne .L_88c
    mov r0, #0xb
    bl func_0203f778
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_88c:
    mov r0, #0xd
    bl func_0203f778
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_89c:
    ldr r0, [sp, #0x4]
    add r9, r9, #0x1
    str r0, [sp]
    b .L_92c
.L_8ac:
    bl func_0203fc70
    cmp r0, #0x10
    beq .L_8d8
    cmp r0, #0x11
    beq .L_900
    cmp r0, #0x15
    bne .L_90c
    mov r0, #0x15
    bl func_0203f778
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_8d8:
    cmp r9, #0x2
    ble .L_8f0
    mov r0, #0x10
    bl func_0203f778
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_8f0:
    ldr r0, [sp, #0x8]
    add r9, r9, #0x1
    str r0, [sp]
    b .L_92c
.L_900:
    bl func_0203f778
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_90c:
    cmp r9, #0x2
    blt .L_920
    bl func_0203f778
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_920:
    ldr r0, [sp, #0x4]
    add r9, r9, #0x1
    str r0, [sp]
.L_92c:
    bl func_020930b0
    mov r8, r0
    mov sl, r1
    bl func_020930b0
    subs r2, r0, r8
    sbc r0, r1, sl
    mov r1, r0, lsl #0x6
    ldr r3, [sp, #0xc]
    orr r1, r1, r2, lsr #0x1a
    mov r0, r2, lsl #0x6
    mov r2, fp
    bl func_020b3808
    cmp r1, #0x0
    cmpeq r0, r7
    bcs .L_9f0
.L_968:
    ldr r0, [r5]
    add r0, r0, r4
    bl func_020927b8
    ldr r2, [r5]
    add r1, r2, #0x1000
    ldr r0, [r1, #0x3f0]
    cmp r0, #0x1
    bne .L_9b0
    ldr r2, _LIT5
    ldr r0, _LIT3
    str r2, [r1, #0x8]
    ldr r1, [r5]
    add r0, r1, r0
    bl func_02092748
    mov r0, #0x14
    bl func_0203f778
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_9b0:
    add r0, r2, r4
    bl func_02092748
    mov r0, r7
    bl func_02091768
    bl func_020930b0
    subs r2, r0, r8
    sbc r0, r1, sl
    mov r1, r0, lsl #0x6
    orr r1, r1, r2, lsr #0x1a
    mov r0, r2, lsl #0x6
    mov r2, fp
    mov r3, r6
    bl func_020b3808
    cmp r1, #0x0
    cmpeq r0, r7
    bcc .L_968
.L_9f0:
    ldr r0, [r5]
    add r0, r0, #0x1000
    ldr r0, [r0, #0x314]
    bl func_020418ac
    ldr r0, [r5]
    add r0, r0, r4
    bl func_020927b8
    ldr r0, [sp]
    bl func_0204014c
    ldr r1, [r5]
    add r1, r1, #0x1000
    str r0, [r1, #0x4]
    ldr r2, [r5]
    add r1, r2, #0x1000
    ldr r0, [r1, #0x4]
    cmp r0, #0x0
    beq .L_a54
    ldr r2, _LIT5
    ldr r0, _LIT3
    str r2, [r1, #0x8]
    ldr r1, [r5]
    add r0, r1, r0
    bl func_02092748
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_a54:
    add r0, r2, r4
    bl func_02092748
    b .L_7dc
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00001388
_LIT1: .word 0x000082ea
_LIT2: .word data_0219d9d4
_LIT3: .word 0x000013d8
_LIT4: .word 0x00001b34
_LIT5: .word 0x00004e84
