; func_02012180 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02009730
        .extern func_0202b998
        .extern func_020b377c
        .global func_02012180
        .arm
func_02012180:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov r5, r0
    ldr r0, [r5, #0x8]
    ldmia r5, {r1, fp}
    add r0, r1, r0
    str r0, [sp]
    add r4, fp, r0
    bl func_02009730
    ldr r0, [r5]
    mov r6, #0x0
    cmp r0, #0x0
    bls .L_644
.L_578:
    add r0, r5, r6, lsl #0x1
    ldrh r7, [r0, #0xc]
    cmp r7, #0x0
    beq .L_634
    mov r0, r7
    bl func_0202b998
    cmp r0, #0x1
    mov r1, #0x1
    bge .L_5ac
    add r2, r5, r6, lsl #0x1
    mov r3, #0x0
    strh r3, [r2, #0xc]
    sub r4, r4, #0x1
.L_5ac:
    ldr r2, [r5]
    add r9, r6, #0x1
    cmp r9, r2
    bcs .L_5f0
    mov r3, #0x0
.L_5c0:
    add r8, r5, r9, lsl #0x1
    ldrh r2, [r8, #0xc]
    cmp r7, r2
    bne .L_5e0
    add r1, r1, #0x1
    cmp r1, r0
    strgth r3, [r8, #0xc]
    subgt r4, r4, #0x1
.L_5e0:
    ldr r2, [r5]
    add r9, r9, #0x1
    cmp r9, r2
    bcc .L_5c0
.L_5f0:
    ldr r2, [r5, #0x4]
    mov r9, #0x0
    cmp r2, #0x0
    bls .L_634
    mov r3, r9
.L_604:
    add r8, r5, r9, lsl #0x1
    ldrh r2, [r8, #0xac]
    cmp r7, r2
    bne .L_624
    add r1, r1, #0x1
    cmp r1, r0
    strgth r3, [r8, #0xac]
    subgt r4, r4, #0x1
.L_624:
    ldr r2, [r5, #0x4]
    add r9, r9, #0x1
    cmp r9, r2
    bcc .L_604
.L_634:
    ldr r0, [r5]
    add r6, r6, #0x1
    cmp r6, r0
    bcc .L_578
.L_644:
    ldr r3, [r5, #0x4]
    mov sl, #0x0
    cmp r3, #0x0
    bls .L_6d8
    mov r6, sl
    mov r7, sl
    mov r8, #0x1
.L_660:
    add r0, r5, sl, lsl #0x1
    ldrh r9, [r0, #0xac]
    cmp r9, #0x0
    beq .L_6cc
    mov r0, r9
    bl func_0202b998
    cmp r0, #0x1
    addlt r2, r5, sl, lsl #0x1
    strlth r7, [r2, #0xac]
    ldr r3, [r5, #0x4]
    add r2, sl, #0x1
    sublt r4, r4, #0x1
    mov r1, r8
    cmp r2, r3
    bcs .L_6cc
.L_69c:
    add ip, r5, r2, lsl #0x1
    ldrh r3, [ip, #0xac]
    cmp r9, r3
    bne .L_6bc
    add r1, r1, #0x1
    cmp r1, r0
    strgth r6, [ip, #0xac]
    subgt r4, r4, #0x1
.L_6bc:
    ldr r3, [r5, #0x4]
    add r2, r2, #0x1
    cmp r2, r3
    bcc .L_69c
.L_6cc:
    add sl, sl, #0x1
    cmp sl, r3
    bcc .L_660
.L_6d8:
    ldr r3, [r5, #0x8]
    mov sl, #0x0
    cmp r3, #0x0
    bls .L_76c
    mov r6, sl
    mov r7, sl
    mov r8, #0x1
.L_6f4:
    add r0, r5, sl, lsl #0x1
    ldrh r9, [r0, #0xca]
    cmp r9, #0x0
    beq .L_760
    mov r0, r9
    bl func_0202b998
    cmp r0, #0x1
    addlt r2, r5, sl, lsl #0x1
    strlth r7, [r2, #0xca]
    ldr r3, [r5, #0x8]
    add r2, sl, #0x1
    sublt r4, r4, #0x1
    mov r1, r8
    cmp r2, r3
    bcs .L_760
.L_730:
    add ip, r5, r2, lsl #0x1
    ldrh r3, [ip, #0xca]
    cmp r9, r3
    bne .L_750
    add r1, r1, #0x1
    cmp r1, r0
    strgth r6, [ip, #0xca]
    subgt r4, r4, #0x1
.L_750:
    ldr r3, [r5, #0x8]
    add r2, r2, #0x1
    cmp r2, r3
    bcc .L_730
.L_760:
    add sl, sl, #0x1
    cmp sl, r3
    bcc .L_6f4
.L_76c:
    cmp r4, #0x0
    beq .L_794
    mov r0, #0x64
    mul r0, r4, r0
    ldr r1, [sp]
    add r1, fp, r1
    bl func_020b377c
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_794:
    mov r0, #0x64
    mul r0, r4, r0
    ldr r1, [sp]
    add r1, fp, r1
    bl func_020b377c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
