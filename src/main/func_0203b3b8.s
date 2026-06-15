; func_0203b3b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_01ff8098
        .extern func_0203aeec
        .extern func_0203af44
        .extern func_0203b2f4
        .extern func_020945f4
        .global func_0203b3b8
        .arm
func_0203b3b8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x1c
    mov sl, r0
    ldr r3, [sl, #0x78]
    mov r9, r2
    ldr r0, [r3, r9, lsl #0x5]
    ldr r4, _LIT0
    str r0, [sp, #0x8]
    mov r5, r0, lsr #0x1f
    smull r2, r0, r4, r0
    str r0, [sp, #0x14]
    ldr r4, [sp, #0x8]
    ldr r2, [sp, #0x14]
    str r1, [sp, #0x4]
    add r2, r4, r2
    add r2, r5, r2, asr #0x9
    mov r4, #0x3f8
    add r1, r3, r9, lsl #0x5
    str r1, [sp, #0x18]
    mul r5, r2, r4
    ldr r0, [sl, #0x74]
    ldr r1, [sp, #0x8]
    str r2, [sp, #0x14]
    sub r7, r1, r5
    ldr r1, [r0, #0x34]
    ldr r4, [r0, #0x2c]
    add r2, r2, #0x1
    cmp r2, r4
    str r1, [sp, #0x10]
    ldrcs r0, [r0, #0x3c]
    ldr r1, [sl, #0x70]
    strcs r0, [sp, #0x10]
    ldr r0, [sp, #0x8]
    mov r4, #0x0
    sub r0, r1, r0
    str r0, [sp, #0xc]
    cmp r0, #0x100
    movgt r0, #0x100
    strgt r0, [sp, #0xc]
    ldr r0, [sp, #0x18]
    mov r5, r4
    ldrh r1, [r0, #0x6]
    ldr r0, [sp, #0xc]
    add r0, r1, r0
    cmp r0, #0x100
    rsbgt r0, r1, #0x100
    strgt r0, [sp, #0xc]
    ldr r0, [sp, #0xc]
    ldr r1, [sp, #0x8]
    add r0, r7, r0
    cmp r0, #0x3f8
    rsbhi r0, r7, #0x3f8
    strhi r0, [sp, #0xc]
    ldr r0, [sp, #0x18]
    add r6, r0, #0x8
    ldr r0, [sp, #0xc]
    add r8, r1, r0
.L_544:
    ldr r0, [sl, #0x84]
    cmp r7, #0x0
    add r0, r0, r5
    add r0, r0, r9, lsl #0x9
    add fp, r0, r7, lsr #0x1
    bne .L_570
    ldrh r1, [fp]
    ldrh r0, [fp, #0x2]
    strh r1, [r6]
    strh r0, [r6, #0x2]
    b .L_5b8
.L_570:
    cmp r9, #0x0
    bne .L_584
    ldrb r0, [r6, #0x3]
    cmp r0, #0xff
    bne .L_5b8
.L_584:
    ldr r2, [sp, #0x8]
    mov r0, sl
    mov r1, r6
    mov r3, r4
    bl func_0203aeec
    cmp r0, #0x0
    bne .L_5b8
    mov r0, r6
    ldr r1, [sl, #0x84]
    mov r2, r7
    add r1, r1, r5
    add r1, r1, r9, lsl #0x9
    bl func_0203b2f4
.L_5b8:
    strb r4, [r6, #0x3]
    ldr r1, [sp, #0x4]
    str r6, [sp]
    add r0, fp, #0x4
    ldr fp, [r1, r4, lsl #0x2]
    ldr r1, [sp, #0x18]
    ldr r2, [sp, #0xc]
    ldrh r1, [r1, #0x6]
    mov r3, r7
    add r1, fp, r1, lsl #0x1
    bl func_01ff8098
    ldr fp, [sl, #0x78]
    ldrb r2, [r6, #0x3]
    add r1, fp, #0x40
    mov r3, #0x0
.L_5f4:
    ldr r0, [r1]
    cmp r0, r8
    ldreqb r0, [r1, #0x7]
    cmpeq r0, r2
    beq .L_63c
    add r3, r3, #0x1
    cmp r3, #0x10
    add r1, r1, #0x8
    blt .L_5f4
    add r0, fp, #0x40
    ldrh r1, [sl, #0xb4]
    and r1, r1, #0xf
    str r8, [r0, r1, lsl #0x3]
    add r2, r0, r1, lsl #0x3
    add r0, r1, #0x1
    ldr r1, [r6]
    str r1, [r2, #0x4]
    strh r0, [sl, #0xb4]
.L_63c:
    ldrh r0, [sl, #0xb8]
    add r5, r5, #0x400
    add r6, r6, #0xc
    add r4, r4, #0x1
    cmp r4, r0
    blt .L_544
    ldr r0, [sp, #0x18]
    ldr r2, [r0]
    ldr r0, [sp, #0xc]
    add r1, r7, r0
    add r2, r2, r0
    ldr r0, [sp, #0x18]
    str r2, [r0]
    ldrh r2, [r0, #0x6]
    ldr r0, [sp, #0x10]
    cmp r1, r0
    ldr r0, [sp, #0xc]
    add r1, r2, r0
    ldr r0, [sp, #0x18]
    strh r1, [r0, #0x6]
    bcc .L_718
    ldr r0, [sp, #0x14]
    ldr r2, [sl, #0x74]
    add r1, r0, #0x1
    ldr r0, [r2, #0x2c]
    cmp r1, r0
    bcc .L_718
    ldr r1, [r2, #0x20]
    ldr r0, [sp, #0x18]
    str r1, [r0]
    ldr r1, [sl, #0x74]
    ldrb r0, [r1, #0x19]
    cmp r0, #0x0
    bne .L_718
    ldr r1, [r1, #0x24]
    ldr r0, [sp, #0x18]
    str r1, [r0]
    ldrh r0, [r0, #0x6]
    rsbs r0, r0, #0x100
    beq .L_728
    mov r6, #0x0
    mov r5, r0, lsl #0x1
    rsb r4, r0, #0x100
    mov r7, r6
.L_6ec:
    ldr r0, [sp, #0x4]
    mov r1, r7
    ldr r0, [r0, r6, lsl #0x2]
    mov r2, r5
    add r0, r0, r4, lsl #0x1
    bl func_020945f4
    ldrh r0, [sl, #0xb8]
    add r6, r6, #0x1
    cmp r6, r0
    blt .L_6ec
    b .L_728
.L_718:
    ldr r0, [sp, #0x18]
    ldrh r0, [r0, #0x6]
    cmp r0, #0x100
    bcc .L_74c
.L_728:
    ldr r0, [sp, #0x18]
    ldrsh r1, [r0, #0x4]
    add r2, r1, #0x1
    mov r1, r0
    strh r2, [r1, #0x4]
    bl func_0203af44
    add sp, sp, #0x1c
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_74c:
    mov r0, #0x0
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x81020409
