; func_ov005_021ab778 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020060f4
        .extern func_02006148
        .extern func_0207eb40
        .extern func_0207f84c
        .extern func_020b377c
        .global func_ov005_021ab778
        .arm
func_ov005_021ab778:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x20
    mov sl, r0
    mov r0, r2
    mov r5, r1
    mov r9, r3
    bl func_0207eb40
    ldr r1, [sl, #0x4c]
    mov r6, r0
    mov r0, #0x0
    cmp r1, #0x0
    str r0, [sp, #0xc]
    ble .L_534
    ldr r0, [sl, #0x54]
    cmp r0, #0x1
    beq .L_4bc
    cmp r0, #0x2
    moveq r4, #0x10
    b .L_4c4
.L_4bc:
    ldr r0, [sp, #0xc]
    sub r4, r0, #0x10
.L_4c4:
    ldr r0, [sl, #0x4c]
    subs r0, r0, r5
    str r0, [sl, #0x4c]
    movmi r0, #0x0
    strmi r0, [sl, #0x4c]
    ldr r1, [sl, #0x50]
    ldr r0, [sl, #0x4c]
    sub r0, r1, r0
    mul r0, r4, r0
    bl func_020b377c
    ldr r1, [sl, #0x58]
    add r0, r1, r0
    str r0, [sl, #0x34]
    ldr r0, [sl, #0x4c]
    cmp r0, #0x0
    bne .L_52c
    mov r0, #0x0
    str r0, [sl, #0x50]
    str r0, [sl, #0x54]
    ldr r0, [sl, #0x58]
    add r0, r0, r4
    str r0, [sl, #0x34]
    ldr r0, [sl, #0x68]
    cmp r0, #0x0
    beq .L_52c
    blx r0
.L_52c:
    mov r0, #0x1
    str r0, [sp, #0xc]
.L_534:
    ldr r0, [sl, #0x28]
    cmp r0, #0x0
    ldrne r0, [sl, #0x64]
    cmpne r0, #0x0
    beq .L_604
    ldr r0, _LIT0
    ldrh r0, [r0]
    and r0, r0, #0x8000
    mov r0, r0, asr #0xf
    cmp r0, #0x1
    bne .L_604
    bl func_02006148
    cmp r0, #0x0
    beq .L_604
    add r0, sp, #0x1c
    add r1, sp, #0x18
    ldr r4, [sl, #0x28]
    bl func_020060f4
    ldrh r0, [sl, #0x16]
    mov r1, #0x0
    mov r2, r0, lsl #0x3
    mov r0, r2, asr #0x3
    add r0, r2, r0, lsr #0x1c
    mov r0, r0, asr #0x4
    add r7, r0, #0x2
    cmp r7, #0x0
    ble .L_604
    ldr r3, [sp, #0x1c]
    ldr r5, [sp, #0x18]
.L_5a8:
    ldr r0, [r4]
    cmp r0, #0x0
    beq .L_5f4
    ldrsh r2, [r4, #0x4]
    cmp r3, r2
    blt .L_5f4
    ldrsh r2, [r4, #0x8]
    cmp r3, r2
    bgt .L_5f4
    ldrsh r2, [r4, #0x6]
    cmp r5, r2
    blt .L_5f4
    ldrsh r2, [r4, #0xa]
    cmp r5, r2
    bgt .L_5f4
    ldr r2, [sl, #0x64]
    add r1, r4, #0x4
    blx r2
    b .L_604
.L_5f4:
    add r1, r1, #0x1
    cmp r1, r7
    add r4, r4, #0xc
    blt .L_5a8
.L_604:
    mov r8, #0x0
    strh r8, [sl, #0x38]
    ldrh r0, [sl, #0x5c]
    mov r0, r0, lsl #0x1a
    movs r2, r0, lsr #0x1e
    beq .L_704
    ldrh r0, [sl, #0x16]
    ldr r7, [sl, #0x3c]
    mov r1, r0, lsl #0x3
    mov r0, r1, asr #0x3
    add r0, r1, r0, lsr #0x1c
    mov r0, r0, asr #0x4
    add r0, r0, #0x2
    mul r0, r2, r0
    cmp r0, #0x0
    ble .L_704
    ldr fp, _LIT1
    add r5, sp, #0x10
    mov r4, r8
.L_650:
    ldrh r0, [r7]
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x12
    cmp r0, fp
    beq .L_6cc
    ldrsh r1, [r7, #0x2]
    mov r0, r6, lsl #0x10
    mov r3, r4
    mov r1, r1, lsl #0xc
    str r1, [sp, #0x10]
    ldrsh r2, [r7, #0x4]
    mov r1, r0, lsr #0x10
    mov r0, r2, lsl #0xc
    str r0, [sp, #0x14]
    str r5, [sp]
    str r4, [sp, #0x4]
    str r4, [sp, #0x8]
    ldrh ip, [r7]
    ldr r2, [sl, #0x40]
    ldr r0, [r9]
    mov ip, ip, lsl #0x12
    mov ip, ip, lsr #0x12
    ldr r2, [r2, ip, lsl #0x2]
    bl func_0207f84c
    ldr r1, [r9]
    sub r6, r6, r0
    add r1, r1, r0, lsl #0x3
    str r1, [r9]
    ldrh r1, [sl, #0x38]
    add r0, r1, r0
    strh r0, [sl, #0x38]
.L_6cc:
    ldrh r0, [sl, #0x16]
    ldrh r2, [sl, #0x5c]
    add r8, r8, #0x1
    mov r1, r0, lsl #0x3
    mov r0, r1, asr #0x3
    add r0, r1, r0, lsr #0x1c
    mov r1, r2, lsl #0x1a
    mov r0, r0, asr #0x4
    mov r1, r1, lsr #0x1e
    add r0, r0, #0x2
    mul r0, r1, r0
    cmp r8, r0
    add r7, r7, #0x60
    blt .L_650
.L_704:
    ldr r0, [sp, #0xc]
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x04000304
_LIT1: .word 0x00003fff
