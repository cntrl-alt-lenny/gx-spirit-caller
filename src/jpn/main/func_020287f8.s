; func_020287f8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_InvokeLocked
        .extern Task_PostLocked
        .extern func_02021c84
        .extern func_0202223c
        .extern func_0202246c
        .extern func_020225f0
        .extern func_020228b8
        .extern func_02022d00
        .extern func_02029238
        .extern func_02029404
        .extern func_020295d0
        .extern func_02029678
        .extern func_020298a4
        .extern func_02029970
        .extern func_02029b18
        .extern func_02029bdc
        .extern func_02029c2c
        .extern func_02029cec
        .extern func_02094398
        .global func_020287f8
        .arm
func_020287f8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x7c
    mov r9, r0
    ldr r0, [r9]
    mov fp, #0x0
    str r0, [sp, #0xc]
    add r0, r9, #0x9a
    add r6, r0, #0x100
    add r0, r9, #0x178
    str r0, [sp, #0x14]
    mvn r0, #0x0
    add r7, r9, #0x16c
    add r4, r9, #0x100
    str r0, [sp, #0x10]
    b .L_92c
.L_3c:
    ldr r3, [r9]
    ldr r2, [r3]
    mov r0, r2, lsr #0x18
    cmp r0, #0x4e
    bhi .L_58
    beq .L_6d4
    b .L_918
.L_58:
    sub r0, r0, #0x6b
    cmp r0, #0x25
    addls pc, pc, r0, lsl #0x2
    b .L_918
    b .L_77c
    b .L_788
    b .L_898
    b .L_900
    b .L_918
    b .L_918
    b .L_918
    b .L_918
    b .L_918
    b .L_918
    b .L_918
    b .L_918
    b .L_918
    b .L_918
    b .L_918
    b .L_918
    b .L_918
    b .L_918
    b .L_918
    b .L_918
    b .L_918
    b .L_100
    b .L_144
    b .L_1cc
    b .L_218
    b .L_2a8
    b .L_2fc
    b .L_384
    b .L_3dc
    b .L_408
    b .L_44c
    b .L_4c0
    b .L_4dc
    b .L_538
    b .L_57c
    b .L_5c0
    b .L_648
    b .L_6a8
.L_100:
    mov r0, r9
    mov r1, r2, lsr #0x10
    and r1, r1, #0xff
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_0202246c
    ldr r1, [r9]
    ldr r1, [r1, #0x4]
    add r5, r1, r0, lsl #0x5
    mov r0, r9
    mov r1, r5
    bl func_02029238
    str r5, [r9, #0x88]
    ldr r0, [r9]
    add r0, r0, #0x8
    str r0, [r9]
    b .L_918
.L_144:
    mov r1, r2, lsr #0x10
    mov r2, r2, lsl #0x10
    mov r0, r9
    and r1, r1, #0xff
    mov r2, r2, lsr #0x10
    bl func_0202246c
    ldr r1, [r9]
    add r5, sp, #0x5c
    ldr sl, [r1, #0x8]
    ldr ip, [r1, #0xc]
    ldr r1, [r1, #0x4]
    cmp sl, #-2147483648
    add r8, r1, r0, lsl #0x5
    str r8, [sp, #0x8]
    ldmia r8!, {r0, r1, r2, r3}
    stmia r5!, {r0, r1, r2, r3}
    ldmia r8, {r0, r1, r2, r3}
    stmia r5, {r0, r1, r2, r3}
    ldrne r0, [sp, #0x64]
    add r1, sp, #0x5c
    addne r0, r0, sl
    strne r0, [sp, #0x64]
    cmp ip, #-2147483648
    ldrne r0, [sp, #0x68]
    addne r0, r0, ip
    strne r0, [sp, #0x68]
    mov r0, r9
    bl func_02029238
    ldr r0, [sp, #0x8]
    str r0, [r9, #0x88]
    ldr r0, [r9]
    add r0, r0, #0x10
    str r0, [r9]
    b .L_918
.L_1cc:
    mov r1, r2, lsr #0x10
    mov r2, r2, lsl #0x10
    mov r0, r9
    and r1, r1, #0xff
    mov r2, r2, lsr #0x10
    bl func_0202246c
    ldr r1, [r9]
    ldr r2, [sp, #0x10]
    ldr r3, [r1, #0x4]
    mov r1, #0x2c
    mla r5, r0, r1, r3
    mov r0, r9
    mov r1, r5
    bl func_02029678
    str r5, [r9, #0x94]
    ldr r0, [r9]
    add r0, r0, #0x8
    str r0, [r9]
    b .L_918
.L_218:
    mov r1, r2, lsr #0x10
    mov r2, r2, lsl #0x10
    mov r0, r9
    and r1, r1, #0xff
    mov r2, r2, lsr #0x10
    bl func_0202246c
    ldr r1, [r9]
    add r5, sp, #0x30
    ldmib r1, {r2, sl, ip}
    mov r1, #0x2c
    mla r8, r0, r1, r2
    str r8, [sp, #0x4]
    ldmia r8!, {r0, r1, r2, r3}
    stmia r5!, {r0, r1, r2, r3}
    ldmia r8!, {r0, r1, r2, r3}
    stmia r5!, {r0, r1, r2, r3}
    ldmia r8, {r0, r1, r2}
    stmia r5, {r0, r1, r2}
    cmp sl, #-2147483648
    ldrne r0, [sp, #0x44]
    ldr r2, [sp, #0x10]
    addne r0, r0, sl
    strne r0, [sp, #0x44]
    cmp ip, #-2147483648
    ldrne r0, [sp, #0x48]
    add r1, sp, #0x30
    addne r0, r0, ip
    strne r0, [sp, #0x48]
    mov r0, r9
    bl func_02029678
    ldr r0, [sp, #0x4]
    str r0, [r9, #0x94]
    ldr r0, [r9]
    add r0, r0, #0x10
    str r0, [r9]
    b .L_918
.L_2a8:
    mov r1, r2, lsr #0x10
    mov r2, r2, lsl #0x10
    mov r0, r9
    and r1, r1, #0xff
    mov r2, r2, lsr #0x10
    bl func_0202246c
    ldr r1, [r9]
    ldr r3, [r1, #0x4]
    ldr r2, [r1, #0x8]
    mov r1, #0x2c
    mla r5, r0, r1, r3
    mov r0, r2, lsl #0x10
    mov r2, r0, asr #0x10
    mov r0, r9
    mov r1, r5
    bl func_02029678
    str r5, [r9, #0x94]
    ldr r0, [r9]
    add r0, r0, #0xc
    str r0, [r9]
    b .L_918
.L_2fc:
    ldrh r2, [r4, #0x9a]
    ldmib r3, {r0, r1}
    mov r2, r2, lsl #0x1d
    movs r2, r2, lsr #0x1f
    beq .L_344
    cmp r0, #-2147483648
    beq .L_328
    ldr r2, [r9, #0x88]
    ldr r2, [r2, #0x8]
    add r0, r2, r0
    str r0, [r9, #0x70]
.L_328:
    cmp r1, #-2147483648
    beq .L_374
    ldr r0, [r9, #0x88]
    ldr r0, [r0, #0xc]
    add r0, r0, r1
    str r0, [r9, #0x74]
    b .L_374
.L_344:
    cmp r0, #-2147483648
    beq .L_35c
    ldr r2, [r9, #0x94]
    ldr r2, [r2, #0x14]
    add r0, r2, r0
    str r0, [r9, #0x7c]
.L_35c:
    cmp r1, #-2147483648
    beq .L_374
    ldr r0, [r9, #0x94]
    ldr r0, [r0, #0x18]
    add r0, r0, r1
    str r0, [r9, #0x80]
.L_374:
    ldr r0, [r9]
    add r0, r0, #0xc
    str r0, [r9]
    b .L_918
.L_384:
    ldrh r0, [r4, #0x9a]
    mov r0, r0, lsl #0x19
    movs r0, r0, lsr #0x1f
    beq .L_3ac
    mov r0, #0x0
    str r0, [sp, #0x24]
    str r0, [sp, #0x2c]
    add r0, sp, #0x24
    str r9, [sp, #0x28]
    bl func_02022d00
.L_3ac:
    ldrh r0, [r4, #0x9a]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1f
    mov r0, r9
    beq .L_3c8
    bl func_02029404
    b .L_3cc
.L_3c8:
    bl func_020298a4
.L_3cc:
    ldr r0, [r9]
    add r0, r0, #0x4
    str r0, [r9]
    b .L_918
.L_3dc:
    mov r0, r9
    mov r1, r2, lsr #0x10
    and r1, r1, #0xff
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_0202246c
    strh r0, [r4, #0x8c]
    ldr r0, [r9]
    add r0, r0, #0x4
    str r0, [r9]
    b .L_918
.L_408:
    mov r0, r9
    mov r1, r2, lsr #0x10
    and r1, r1, #0xff
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_0202246c
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x1f
    ldrh r1, [r6]
    bic r1, r1, #0x2
    orr r0, r1, r0, lsr #0x1e
    strh r0, [r6]
    ldr r0, [r9]
    add r0, r0, #0x4
    str r0, [r9]
    b .L_918
.L_44c:
    mov r0, r2, lsr #0x10
    ldr r2, [r3, #0x4]
    and r1, r0, #0xff
    mov r2, r2, lsl #0x10
    mov r0, r9
    mov r2, r2, lsr #0x10
    bl func_0202246c
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0xc
    str r0, [r7]
    ldr r2, [r9]
    mov r0, r9
    ldmia r2, {r1, r2}
    mov r2, r2, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsl #0x10
    and r1, r1, #0xff
    mov r2, r2, lsr #0x10
    bl func_0202246c
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0xc
    str r0, [r7, #0x4]
    ldr r3, [sp, #0x14]
    ldmia r7, {r0, r1, r2}
    stmia r3, {r0, r1, r2}
    ldr r0, [r9]
    add r0, r0, #0xc
    str r0, [r9]
    b .L_918
.L_4c0:
    ldr r1, [sp, #0x14]
    mov r0, r9
    mov r2, r7
    bl func_020225f0
    cmp r0, #0x0
    movne fp, #0x1
    b .L_918
.L_4dc:
    mov r0, r2, lsr #0x10
    ldr r2, [r3, #0x4]
    and r1, r0, #0xff
    mov r2, r2, lsl #0x10
    mov r0, r9
    mov r2, r2, lsr #0x10
    bl func_0202246c
    ldr r2, [r9]
    mov r5, r0
    ldmia r2, {r1, r2}
    mov r2, r2, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsl #0x10
    mov r0, r9
    and r1, r1, #0xff
    mov r2, r2, lsr #0x10
    bl func_0202246c
    strh r5, [r4, #0x8e]
    strh r0, [r4, #0x90]
    ldr r0, [r9]
    add r0, r0, #0x8
    str r0, [r9]
    b .L_918
.L_538:
    mov r0, r9
    mov r1, r2, lsr #0x10
    and r1, r1, #0xff
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_0202246c
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x1f
    ldrh r1, [r6]
    bic r1, r1, #0x8
    orr r0, r1, r0, lsr #0x1c
    strh r0, [r6]
    ldr r0, [r9]
    add r0, r0, #0x4
    str r0, [r9]
    b .L_918
.L_57c:
    mov r0, r9
    mov r1, r2, lsr #0x10
    and r1, r1, #0xff
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_0202246c
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x1f
    ldrh r1, [r6]
    bic r1, r1, #0x20
    orr r0, r1, r0, lsr #0x1a
    strh r0, [r6]
    ldr r0, [r9]
    add r0, r0, #0x4
    str r0, [r9]
    b .L_918
.L_5c0:
    mov r0, r2, lsr #0x14
    and r1, r0, #0xf
    ldr r2, [r3, #0x8]
    mov r0, r9
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_0202246c
    mov r0, r0, lsl #0x10
    mov r5, r0, asr #0x10
    ldr r2, [r9]
    mov r0, r9
    ldr r1, [r2]
    ldr r2, [r2, #0x8]
    mov r1, r1, lsr #0x10
    and r1, r1, #0xf
    mov r2, r2, lsr #0x10
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_0202246c
    mov r3, r5
    ldr r1, [r9]
    ldr r2, [r1, #0x4]
    str r0, [sp]
    mov r0, r9
    mov r1, r2, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_02029b18
    ldr r0, [r9]
    add r0, r0, #0xc
    str r0, [r9]
    b .L_918
.L_648:
    mov r1, r2, lsr #0x14
    mov r2, r2, lsl #0x10
    mov r0, r9
    and r1, r1, #0xf
    mov r2, r2, lsr #0x10
    bl func_0202246c
    ldr r2, [r9]
    mov r0, r0, lsl #0x10
    ldmia r2, {r1, r2}
    mov r1, r1, lsr #0x10
    mov r2, r2, lsl #0x10
    mov r5, r0, asr #0x10
    mov r0, r9
    and r1, r1, #0xf
    mov r2, r2, lsr #0x10
    bl func_0202246c
    mov r2, r0
    mov r1, r5
    mov r0, r9
    bl func_02029bdc
    ldr r0, [r9]
    add r0, r0, #0x8
    str r0, [r9]
    b .L_918
.L_6a8:
    mov r0, r9
    mov r1, r2, lsr #0x10
    and r1, r1, #0xff
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_0202246c
    strh r0, [r9, #0x8c]
    ldr r0, [r9]
    add r0, r0, #0x4
    str r0, [r9]
    b .L_918
.L_6d4:
    mov r0, r2, lsr #0x10
    ands r0, r0, #0xf
    beq .L_6f4
    cmp r0, #0x1
    beq .L_70c
    cmp r0, #0x2
    beq .L_744
    b .L_770
.L_6f4:
    ldr r0, [r3, #0x4]
    str r0, [r9, #0x68]
    ldr r0, [r9]
    add r0, r0, #0x8
    str r0, [r9]
    b .L_770
.L_70c:
    mov r0, r9
    mov r1, r2, lsr #0x14
    and r1, r1, #0xf
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_0202246c
    ldr r1, [r9]
    ldr r1, [r1, #0x4]
    ldr r0, [r1, r0, lsl #0x2]
    str r0, [r9, #0x68]
    ldr r0, [r9]
    add r0, r0, #0x8
    str r0, [r9]
    b .L_770
.L_744:
    mov r0, r9
    mov r1, r2, lsr #0x14
    and r1, r1, #0xf
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_0202246c
    bl func_0202223c
    str r0, [r9, #0x68]
    ldr r0, [r9]
    add r0, r0, #0x4
    str r0, [r9]
.L_770:
    mov r0, r9
    bl func_020295d0
    b .L_918
.L_77c:
    add r0, r3, #0x10
    str r0, [r9]
    b .L_918
.L_788:
    ldrh r0, [r4, #0x9a]
    mov r1, r0, lsl #0x19
    movs r1, r1, lsr #0x1f
    movne fp, #0x1
    bne .L_918
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1f
    mov r0, r2, lsr #0x10
    and r1, r0, #0xff
    ldr r0, [r3, #0x4]
    ldr r2, [r3, #0x8]
    str r0, [sp, #0x18]
    ldr r0, [r3, #0xc]
    ldrne sl, [r9, #0x74]
    mov r0, r0, lsl #0x10
    mov r8, r2, lsl #0x1
    mov r2, r0, lsr #0x10
    mov r0, r9
    ldreq sl, [r9, #0x80]
    bl func_0202246c
    ldr r2, [r9]
    mov r5, r0
    ldr r1, [r2]
    ldr r2, [r2, #0xc]
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r2, r2, lsl #0x10
    mov r0, r9
    and r1, r1, #0xff
    mov r2, r2, lsr #0x10
    bl func_0202246c
    ldr r2, [r9]
    str r0, [sp, #0x1c]
    ldr r1, [r2]
    ldr r2, [r2, #0x10]
    mov r1, r1, lsr #0x10
    mov r2, r2, lsl #0x10
    mov r0, r9
    and r1, r1, #0xff
    mov r2, r2, lsr #0x10
    bl func_0202246c
    str r0, [sp, #0x20]
    mov r0, r8
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    ldr r1, [sp, #0x1c]
    orr r2, r5, r1, lsl #0x5
    ldr r1, [sp, #0x20]
    mov r5, r0
    orr r1, r2, r1, lsl #0xa
    mov r1, r1, lsl #0x10
    mov r0, r1, lsr #0x10
    mov r1, r5
    mov r2, r8
    bl func_02094398
    ldr r0, [sp, #0x18]
    mov r3, r8
    add r2, sl, r0
    mov r0, r9
    mov r1, r5
    bl func_02029c2c
    mov r0, r5
    bl Task_InvokeLocked
    ldr r0, [r9]
    add r0, r0, #0x14
    str r0, [r9]
    b .L_918
.L_898:
    mov r0, r2, lsr #0x14
    ldr r2, [r3, #0x4]
    and r1, r0, #0xf
    mov r2, r2, lsl #0x10
    mov r0, r9
    mov r2, r2, lsr #0x10
    bl func_0202246c
    ldr r2, [r9]
    mov r5, r0
    ldmia r2, {r1, r2}
    mov r2, r2, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsl #0x10
    mov r0, r9
    and r1, r1, #0xf
    mov r2, r2, lsr #0x10
    bl func_0202246c
    mov r0, r0, lsl #0x10
    mov r2, r0, asr #0x10
    mov r1, r5
    mov r0, r9
    bl func_02029cec
    ldr r0, [r9]
    add r0, r0, #0x8
    str r0, [r9]
    b .L_918
.L_900:
    ldrh r0, [r4, #0x9a]
    mov r0, r0, lsl #0x19
    movs r0, r0, lsr #0x1f
    addeq r0, r3, #0x4
    movne fp, #0x1
    streq r0, [r9]
.L_918:
    ldr r1, [r9]
    ldr r0, [sp, #0xc]
    cmp r1, r0
    movne r0, #0x0
    strne r0, [r9, #0x4]
.L_92c:
    cmp fp, #0x0
    bne .L_944
    mov r0, r9
    bl func_02021c84
    cmp r0, #0x0
    beq .L_3c
.L_944:
    add r0, r9, #0x100
    ldrh r0, [r0, #0x9a]
    mov r1, r0, lsl #0x1f
    movs r1, r1, lsr #0x1f
    beq .L_96c
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1f
    bne .L_96c
    mov r0, r9
    bl func_02029970
.L_96c:
    add r0, r9, #0x100
    ldrh r0, [r0, #0x9a]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    beq .L_9a0
    ldrb r0, [r9, #0x187]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    beq .L_9a0
    mov r0, r9
    add r1, r9, #0x178
    add r2, r9, #0x16c
    bl func_020228b8
.L_9a0:
    ldr r1, [r9, #0x4]
    mov r0, #0x1
    add r1, r1, #0x1
    str r1, [r9, #0x4]
    add sp, sp, #0x7c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
