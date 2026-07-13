; func_ov003_021cc94c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103fcc
        .extern data_02104acc
        .extern data_02104c0c
        .extern data_ov003_021cf078
        .extern data_ov003_021cf580
        .extern func_02006190
        .extern func_02034734
        .extern func_020371b8
        .extern func_020a9828
        .extern func_ov003_021cee3c
        .extern func_ov003_021ceeb0
        .extern func_ov003_021cef28
        .global func_ov003_021cc94c
        .arm
func_ov003_021cc94c:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr r4, _LIT0
    mov r6, r0
    ldr r0, [r4, #0x50]
    ldr r1, _LIT1
    cmp r0, #0x0
    ldr r0, _LIT2
    movlt r2, #0x1
    ldr r0, [r0, #0xc3c]
    movge r2, #0x0
    eor r0, r0, r2
    ldr r0, [r1, r0, lsl #0x2]
    cmp r0, #0x1
    beq .L_27bc
    cmp r0, #0x2
    beq .L_2854
    b .L_287c
.L_27bc:
    ldr r0, [r6, #0xc]
    ldr r5, [r4, #0x4c]
    add r1, r0, #0x1
    str r1, [r6, #0xc]
    cmp r1, #0x20
    bge .L_27e8
    mov r0, r1, asr #0x2
    add r0, r1, r0, lsr #0x1d
    mov r0, r0, asr #0x3
    and r0, r0, #0x1
    b .L_2804
.L_27e8:
    bl func_020a9828
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x1e
    add r0, r1, r0, ror #0x1e
    cmp r0, #0x0
    movgt r0, #0x1
    movle r0, #0x0
.L_2804:
    str r0, [r4, #0x4c]
    ldr r1, [r4, #0x4c]
    cmp r1, r5
    beq .L_2820
    mov r0, r6
    mov r2, #0x0
    bl func_ov003_021cee3c
.L_2820:
    ldr r0, [r6, #0xc]
    cmp r0, #0x20
    blt .L_2840
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
.L_2840:
    ldr r0, [r6, #0xc]
    cmp r0, #0x20
    movge r0, #0x1
    movlt r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_2854:
    ldr r0, [r4, #0x58]
    cmp r0, #0x0
    beq .L_2874
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
.L_2874:
    ldr r0, [r4, #0x58]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_287c:
    bl func_02034734
    cmp r0, #0x2
    bne .L_28b8
    ldr r0, [r6, #0xc]
    add r0, r0, #0x1
    str r0, [r6, #0xc]
    cmp r0, #0x258
    blt .L_28b8
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_28b8:
    ldr r0, _LIT3
    ldrh r1, [r0, #0x52]
    cmp r1, #0x0
    beq .L_292c
    ldrh r1, [r0, #0x56]
    tst r1, #0xc0
    beq .L_2904
    ldr r1, [r4, #0x4c]
    mov r0, r6
    rsb r1, r1, #0x1
    mov r2, #0x0
    str r1, [r4, #0x4c]
    bl func_ov003_021cee3c
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    b .L_29f4
.L_2904:
    ldrh r0, [r0, #0x54]
    tst r0, #0x1
    beq .L_29f4
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_292c:
    bl func_02006190
    cmp r0, #0x0
    beq .L_29a8
    ldr r7, _LIT4
    mov r8, #0x0
    mov r5, #0x6
.L_2944:
    add r0, r8, #0x3
    mla r1, r0, r5, r7
    mov r0, r6
    bl func_ov003_021ceeb0
    cmp r0, #0x0
    ldrne r0, [r4, #0x4c]
    cmpne r0, r8
    beq .L_2994
    mov r0, r6
    mov r1, r8
    mov r2, #0x0
    str r8, [r4, #0x4c]
    bl func_ov003_021cee3c
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_2994:
    add r8, r8, #0x1
    cmp r8, #0x2
    blt .L_2944
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_29a8:
    ldr r5, _LIT4
    mov r7, #0x0
    mov r4, #0x6
.L_29b4:
    add r0, r7, #0x3
    mla r1, r0, r4, r5
    mov r0, r6
    bl func_ov003_021cef28
    cmp r0, #0x0
    beq .L_29e8
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_29e8:
    add r7, r7, #0x1
    cmp r7, #0x2
    blt .L_29b4
.L_29f4:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov003_021cf580
_LIT1: .word data_02104c0c
_LIT2: .word data_02103fcc
_LIT3: .word data_02104acc
_LIT4: .word data_ov003_021cf078
