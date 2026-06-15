; func_020121b4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0200974c
        .extern func_0202b9ec
        .extern func_020b3870
        .global func_020121b4
        .arm
func_020121b4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov r5, r0
    ldr r0, [r5, #0x8]
    ldmia r5, {r1, fp}
    add r0, r1, r0
    str r0, [sp]
    add r4, fp, r0
    bl func_0200974c
    ldr r0, [r5]
    mov r6, #0x0
    cmp r0, #0x0
    bls .L_714
.L_648:
    add r0, r5, r6, lsl #0x1
    ldrh r7, [r0, #0xc]
    cmp r7, #0x0
    beq .L_704
    mov r0, r7
    bl func_0202b9ec
    cmp r0, #0x1
    mov r1, #0x1
    bge .L_67c
    add r2, r5, r6, lsl #0x1
    mov r3, #0x0
    strh r3, [r2, #0xc]
    sub r4, r4, #0x1
.L_67c:
    ldr r2, [r5]
    add r9, r6, #0x1
    cmp r9, r2
    bcs .L_6c0
    mov r3, #0x0
.L_690:
    add r8, r5, r9, lsl #0x1
    ldrh r2, [r8, #0xc]
    cmp r7, r2
    bne .L_6b0
    add r1, r1, #0x1
    cmp r1, r0
    strgth r3, [r8, #0xc]
    subgt r4, r4, #0x1
.L_6b0:
    ldr r2, [r5]
    add r9, r9, #0x1
    cmp r9, r2
    bcc .L_690
.L_6c0:
    ldr r2, [r5, #0x4]
    mov r9, #0x0
    cmp r2, #0x0
    bls .L_704
    mov r3, r9
.L_6d4:
    add r8, r5, r9, lsl #0x1
    ldrh r2, [r8, #0xac]
    cmp r7, r2
    bne .L_6f4
    add r1, r1, #0x1
    cmp r1, r0
    strgth r3, [r8, #0xac]
    subgt r4, r4, #0x1
.L_6f4:
    ldr r2, [r5, #0x4]
    add r9, r9, #0x1
    cmp r9, r2
    bcc .L_6d4
.L_704:
    ldr r0, [r5]
    add r6, r6, #0x1
    cmp r6, r0
    bcc .L_648
.L_714:
    ldr r3, [r5, #0x4]
    mov sl, #0x0
    cmp r3, #0x0
    bls .L_7a8
    mov r6, sl
    mov r7, sl
    mov r8, #0x1
.L_730:
    add r0, r5, sl, lsl #0x1
    ldrh r9, [r0, #0xac]
    cmp r9, #0x0
    beq .L_79c
    mov r0, r9
    bl func_0202b9ec
    cmp r0, #0x1
    addlt r2, r5, sl, lsl #0x1
    strlth r7, [r2, #0xac]
    ldr r3, [r5, #0x4]
    add r2, sl, #0x1
    sublt r4, r4, #0x1
    mov r1, r8
    cmp r2, r3
    bcs .L_79c
.L_76c:
    add ip, r5, r2, lsl #0x1
    ldrh r3, [ip, #0xac]
    cmp r9, r3
    bne .L_78c
    add r1, r1, #0x1
    cmp r1, r0
    strgth r6, [ip, #0xac]
    subgt r4, r4, #0x1
.L_78c:
    ldr r3, [r5, #0x4]
    add r2, r2, #0x1
    cmp r2, r3
    bcc .L_76c
.L_79c:
    add sl, sl, #0x1
    cmp sl, r3
    bcc .L_730
.L_7a8:
    ldr r3, [r5, #0x8]
    mov sl, #0x0
    cmp r3, #0x0
    bls .L_83c
    mov r6, sl
    mov r7, sl
    mov r8, #0x1
.L_7c4:
    add r0, r5, sl, lsl #0x1
    ldrh r9, [r0, #0xca]
    cmp r9, #0x0
    beq .L_830
    mov r0, r9
    bl func_0202b9ec
    cmp r0, #0x1
    addlt r2, r5, sl, lsl #0x1
    strlth r7, [r2, #0xca]
    ldr r3, [r5, #0x8]
    add r2, sl, #0x1
    sublt r4, r4, #0x1
    mov r1, r8
    cmp r2, r3
    bcs .L_830
.L_800:
    add ip, r5, r2, lsl #0x1
    ldrh r3, [ip, #0xca]
    cmp r9, r3
    bne .L_820
    add r1, r1, #0x1
    cmp r1, r0
    strgth r6, [ip, #0xca]
    subgt r4, r4, #0x1
.L_820:
    ldr r3, [r5, #0x8]
    add r2, r2, #0x1
    cmp r2, r3
    bcc .L_800
.L_830:
    add sl, sl, #0x1
    cmp sl, r3
    bcc .L_7c4
.L_83c:
    cmp r4, #0x0
    beq .L_864
    mov r0, #0x64
    mul r0, r4, r0
    ldr r1, [sp]
    add r1, fp, r1
    bl func_020b3870
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_864:
    mov r0, #0x64
    mul r0, r4, r0
    ldr r1, [sp]
    add r1, fp, r1
    bl func_020b3870
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
