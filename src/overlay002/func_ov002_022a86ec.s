; func_ov002_022a86ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd73c
        .extern data_ov002_022d016c
        .extern data_ov002_022d0f2c
        .extern data_ov002_022d11bc
        .extern data_ov002_022d1910
        .extern data_ov002_022d1a48
        .extern data_ov002_022d1a9c
        .extern data_ov002_022d1b64
        .extern func_02006110
        .extern func_02006164
        .extern func_0200617c
        .extern func_02006194
        .extern func_02006228
        .extern func_02037208
        .extern func_ov002_021ca6f8
        .extern func_ov002_0229a414
        .extern func_ov002_0229d32c
        .extern func_ov002_0229e194
        .extern func_ov002_0229e844
        .extern func_ov002_022a16fc
        .extern func_ov002_022a6324
        .extern func_ov002_022a7054
        .extern func_ov002_022a74e0
        .extern func_ov002_022a8454
        .extern func_ov002_022a8530
        .extern func_ov002_022a8694
        .extern func_ov002_022ae9c0
        .extern func_ov002_022aea30
        .extern func_ov002_022aead0
        .extern func_ov002_022aec44
        .extern func_ov002_022b52e4
        .global func_ov002_022a86ec
        .arm
func_ov002_022a86ec:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x14
    mov r5, r0
    mov r1, #0x0
    ldr r0, _LIT0
    str r1, [r5, #0x57c]
    ldr r0, [r0, #0x4]
    eor r0, r0, #0x1
    bl func_ov002_021ca6f8
    cmp r0, #0x0
    ldr r0, [r5, #0x584]
    beq .L_58
    add r0, r0, #0x1
    str r0, [r5, #0x584]
    cmp r0, #0x1e
    bne .L_b0
    ldr r0, _LIT1
    mov r1, #0x1
    bl func_ov002_022ae9c0
    mov r0, r5
    bl func_ov002_022a8530
    b .L_b0
.L_58:
    cmp r0, #0x0
    beq .L_a8
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    bl func_ov002_021ca6f8
    cmp r0, #0x0
    bne .L_a8
    ldr r0, _LIT1
    ldrh r0, [r0]
    cmp r0, #0x0
    beq .L_a8
    ldr r0, _LIT2
    ldr r0, [r0, #0xc8]
    cmp r0, #0x0
    beq .L_9c
    mov r0, #0x0
    bl func_ov002_0229a414
.L_9c:
    ldr r0, _LIT1
    mov r1, #0x0
    bl func_ov002_022ae9c0
.L_a8:
    mov r0, #0x0
    str r0, [r5, #0x584]
.L_b0:
    ldr r0, _LIT2
    ldr r0, [r0, #0xd4]
    cmp r0, #0x0
    movgt r0, #0x1
    movle r0, #0x0
    cmp r0, #0x0
    bne .L_330
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    bl func_ov002_021ca6f8
    cmp r0, #0x0
    bne .L_ec
    ldr r0, [r5, #0x584]
    cmp r0, #0xf
    blt .L_330
.L_ec:
    ldr r0, _LIT3
    bl func_ov002_022a16fc
    cmp r0, #0x0
    bne .L_330
    bl func_02006194
    cmp r0, #0x0
    beq .L_26c
    mov r0, r5
    bl func_ov002_022a8694
    cmp r0, #0x0
    ldreq r0, _LIT3
    ldreq r0, [r0]
    cmpeq r0, #0x0
    beq .L_330
    ldr r0, _LIT2
    ldr r2, _LIT2
    ldr r0, [r0, #0xd0]
    mov r3, #0x0
    cmp r0, #0x0
    movne r6, #0x1
    add r0, sp, #0x10
    add r1, sp, #0xc
    moveq r6, #0x0
    str r3, [r2, #0xd0]
    bl func_02006110
    add r0, r5, #0x500
    ldrh r3, [r0, #0x90]
    ldr r1, [sp, #0x10]
    ldr r2, [sp, #0xc]
    mov r0, r5
    strh r3, [sp, #0x2]
    bl func_ov002_022a7054
    mov r4, r0
    cmp r6, #0x0
    bne .L_1c0
    add r0, r5, #0x500
    ldrh r3, [sp, #0x2]
    ldrh r2, [r0, #0x90]
    mov r0, r3, lsl #0x1f
    mov r1, r0, lsr #0x1f
    mov r0, r2, lsl #0x1f
    cmp r1, r0, lsr #0x1f
    bne .L_1c0
    mov r0, r3, lsl #0x1a
    mov r1, r0, lsr #0x1b
    mov r0, r2, lsl #0x1a
    cmp r1, r0, lsr #0x1b
    bne .L_1c0
    mov r0, r3, lsl #0x12
    mov r1, r0, lsr #0x18
    mov r0, r2, lsl #0x12
    cmp r1, r0, lsr #0x18
    beq .L_1f8
.L_1c0:
    ldr r1, _LIT4
    mov r2, #0x1
    ldr r0, _LIT5
    str r2, [r1, #0x20]
    rsb r1, r2, #0x10000
    strh r1, [r0, #0xec]
    bl func_02006164
    cmp r0, #0x0
    beq .L_1f8
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x3
    bl func_02037208
.L_1f8:
    cmp r4, #0x0
    moveq r0, #0x1
    streq r0, [r5, #0x57c]
    bl func_02006164
    cmp r0, #0x0
    cmpne r4, #0x0
    beq .L_330
    add r0, r5, #0x500
    ldrh r1, [r0, #0x94]
    ldrh r0, [r0, #0x90]
    cmp r1, r0
    bne .L_25c
    mov r0, #0x1
    str r0, [r5, #0x598]
    bl func_02006228
    cmp r0, #0x0
    beq .L_25c
    ldr r0, _LIT1
    ldr r0, [r0, #0x1c]
    cmp r0, #0x0
    cmpne r0, #0x1
    bne .L_25c
    ldr r0, _LIT1
    mov r1, #0x0
    bl func_ov002_022aec44
.L_25c:
    add r0, r5, #0x500
    ldrh r1, [r0, #0x90]
    strh r1, [r0, #0x94]
    b .L_330
.L_26c:
    bl func_0200617c
    cmp r0, #0x0
    beq .L_318
    mov r0, r5
    bl func_ov002_022a8694
    cmp r0, #0x0
    beq .L_300
    add r0, sp, #0x8
    add r1, sp, #0x4
    bl func_02006110
    ldr r1, [sp, #0x8]
    ldr r2, [sp, #0x4]
    mov r0, r5
    bl func_ov002_022a7054
    cmp r0, #0x0
    ldrne r0, _LIT1
    ldrneh r0, [r0]
    cmpne r0, #0x0
    beq .L_300
    add r0, r5, #0x500
    ldrh r1, [r0, #0x94]
    ldrh r0, [r0, #0x90]
    cmp r1, r0
    bne .L_300
    mov r0, r5
    bl func_ov002_022a8454
    cmp r0, #0x0
    beq .L_2e8
    ldr r0, _LIT1
    bl func_ov002_022aead0
    b .L_300
.L_2e8:
    ldr r0, [r5, #0x598]
    cmp r0, #0x0
    beq .L_300
    ldr r0, _LIT1
    mov r1, #0x0
    bl func_ov002_022aea30
.L_300:
    add r0, r5, #0x500
    ldrh r2, [r0, #0x90]
    mov r1, #0x0
    strh r2, [r0, #0x94]
    str r1, [r5, #0x598]
    b .L_330
.L_318:
    ldr r0, _LIT2
    ldr r0, [r0, #0xd0]
    cmp r0, #0x0
    bne .L_330
    mov r0, r5
    bl func_ov002_022a74e0
.L_330:
    add r6, r5, #0x3e0
    mov r4, #0x0
.L_338:
    mov r0, r6
    bl func_ov002_0229e194
    add r4, r4, #0x1
    cmp r4, #0x2
    add r6, r6, #0xcc
    blt .L_338
    mov r4, #0x0
    mov r9, r5
    add r8, r5, #0x1b8
    mov fp, r4
    mov r6, r4
.L_364:
    mov r7, r6
    mov sl, r8
.L_36c:
    mov r0, sl
    bl func_ov002_0229d32c
    add r7, r7, #0x1
    cmp r7, #0x5
    add sl, sl, #0x14
    blt .L_36c
    mov sl, fp
    mov r7, r9
.L_38c:
    mov r0, r7
    bl func_ov002_0229d32c
    add sl, sl, #0x1
    cmp sl, #0xa
    add r7, r7, #0x14
    ble .L_38c
    add r4, r4, #0x1
    cmp r4, #0x2
    add r8, r8, #0x64
    add r9, r9, #0xdc
    blt .L_364
    mov r8, #0x0
    add r6, r5, #0x280
    mov r4, r8
.L_3c4:
    mov r9, r4
    mov r7, r6
.L_3cc:
    mov r0, r7
    bl func_ov002_0229e844
    add r9, r9, #0x1
    cmp r9, #0x4
    add r7, r7, #0x2c
    blt .L_3cc
    add r8, r8, #0x1
    cmp r8, #0x2
    add r6, r6, #0xb0
    blt .L_3c4
    ldr r0, [r5, #0x578]
    cmp r0, #0x0
    beq .L_424
    subs r0, r0, #0x1
    str r0, [r5, #0x578]
    bne .L_424
    ldr r0, _LIT2
    ldr r0, [r0, #0xc8]
    cmp r0, #0x0
    beq .L_424
    mov r0, #0x0
    bl func_ov002_0229a414
.L_424:
    ldr r0, [r5, #0x580]
    add r0, r0, #0x1
    str r0, [r5, #0x580]
    ldr r0, [r5, #0x5c0]
    cmp r0, #0x0
    subne r0, r0, #0x1
    strne r0, [r5, #0x5c0]
    ldr r0, [r5, #0x5e8]
    cmp r0, #0x0
    subgt r0, r0, #0x1
    strgt r0, [r5, #0x5e8]
    ldr r0, [r5, #0x5e8]
    cmp r0, #0x0
    addlt r0, r0, #0x1
    strlt r0, [r5, #0x5e8]
    ldr r0, [r5, #0x620]
    cmp r0, #0x3
    bne .L_47c
    ldr r0, [r5, #0x624]
    cmp r0, #0x80
    addlt r0, r0, #0x10
    strlt r0, [r5, #0x624]
.L_47c:
    ldr r0, [r5, #0x620]
    cmp r0, #0x4
    bne .L_498
    ldr r0, [r5, #0x624]
    cmp r0, #0x100
    addlt r0, r0, #0x10
    strlt r0, [r5, #0x624]
.L_498:
    ldr r0, _LIT2
    ldr r0, [r0, #0xd0]
    cmp r0, #0x2
    bne .L_4c8
    ldr r0, _LIT3
    ldr r1, [r0, #0x10]
    cmp r1, #0x0
    beq .L_4c8
    ldr r0, _LIT6
    bl func_ov002_022b52e4
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_4c8:
    add r0, r5, #0x500
    ldrh r1, [r0, #0x90]
    mov r0, r5
    mov r2, r1, lsl #0x1a
    mov r3, r1, lsl #0x12
    mov r4, r1, lsl #0x1f
    mov r1, r4, lsr #0x1f
    mov r2, r2, lsr #0x1b
    mov r3, r3, lsr #0x18
    bl func_ov002_022a6324
    cmp r0, #0x0
    ldrnesb r1, [r0]
    cmpne r1, #0x0
    beq .L_570
    ldrh r3, [r0, #0xa]
    mov r1, r3, lsl #0x11
    strh r3, [sp]
    movs r1, r1, lsr #0x1f
    bne .L_548
    ldr r1, _LIT0
    mov r2, r3, lsl #0x1f
    ldr r1, [r1, #0x4]
    cmp r1, r2, lsr #0x1f
    bne .L_538
    mov r1, r3, lsl #0x1a
    mov r1, r1, lsr #0x1b
    cmp r1, #0xd
    bne .L_548
.L_538:
    ldr r1, _LIT7
    ldr r1, [r1, #0xd04]
    cmp r1, #0x3
    bne .L_55c
.L_548:
    ldr r1, [r0, #0xc]
    ldr r0, _LIT6
    bl func_ov002_022b52e4
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_55c:
    ldr r0, _LIT6
    mov r1, #0x0
    bl func_ov002_022b52e4
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_570:
    ldr r0, _LIT6
    mvn r1, #0x0
    bl func_ov002_022b52e4
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cd73c
_LIT1: .word data_ov002_022d1a9c
_LIT2: .word data_ov002_022d0f2c
_LIT3: .word data_ov002_022d11bc
_LIT4: .word data_ov002_022d1a48
_LIT5: .word data_ov002_022d1910
_LIT6: .word data_ov002_022d1b64
_LIT7: .word data_ov002_022d016c
