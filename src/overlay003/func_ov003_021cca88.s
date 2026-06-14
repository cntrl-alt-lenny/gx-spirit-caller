; func_ov003_021cca88 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern data_02104bac
        .extern data_02104cec
        .extern data_ov003_021cf1b8
        .extern data_ov003_021cf6c0
        .extern func_020061ac
        .extern func_02034784
        .extern func_02037208
        .extern func_020a991c
        .extern func_ov003_021cef78
        .extern func_ov003_021cefec
        .extern func_ov003_021cf064
        .global func_ov003_021cca88
        .arm
func_ov003_021cca88:
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
    beq .L_2810
    cmp r0, #0x2
    beq .L_28a8
    b .L_28d0
.L_2810:
    ldr r0, [r6, #0xc]
    ldr r5, [r4, #0x4c]
    add r1, r0, #0x1
    str r1, [r6, #0xc]
    cmp r1, #0x20
    bge .L_283c
    mov r0, r1, asr #0x2
    add r0, r1, r0, lsr #0x1d
    mov r0, r0, asr #0x3
    and r0, r0, #0x1
    b .L_2858
.L_283c:
    bl func_020a991c
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x1e
    add r0, r1, r0, ror #0x1e
    cmp r0, #0x0
    movgt r0, #0x1
    movle r0, #0x0
.L_2858:
    str r0, [r4, #0x4c]
    ldr r1, [r4, #0x4c]
    cmp r1, r5
    beq .L_2874
    mov r0, r6
    mov r2, #0x0
    bl func_ov003_021cef78
.L_2874:
    ldr r0, [r6, #0xc]
    cmp r0, #0x20
    blt .L_2894
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
.L_2894:
    ldr r0, [r6, #0xc]
    cmp r0, #0x20
    movge r0, #0x1
    movlt r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_28a8:
    ldr r0, [r4, #0x58]
    cmp r0, #0x0
    beq .L_28c8
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
.L_28c8:
    ldr r0, [r4, #0x58]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_28d0:
    bl func_02034784
    cmp r0, #0x2
    bne .L_290c
    ldr r0, [r6, #0xc]
    add r0, r0, #0x1
    str r0, [r6, #0xc]
    cmp r0, #0x258
    blt .L_290c
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_290c:
    ldr r0, _LIT3
    ldrh r1, [r0, #0x52]
    cmp r1, #0x0
    beq .L_2980
    ldrh r1, [r0, #0x56]
    tst r1, #0xc0
    beq .L_2958
    ldr r1, [r4, #0x4c]
    mov r0, r6
    rsb r1, r1, #0x1
    mov r2, #0x0
    str r1, [r4, #0x4c]
    bl func_ov003_021cef78
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    b .L_2a48
.L_2958:
    ldrh r0, [r0, #0x54]
    tst r0, #0x1
    beq .L_2a48
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_2980:
    bl func_020061ac
    cmp r0, #0x0
    beq .L_29fc
    ldr r7, _LIT4
    mov r8, #0x0
    mov r5, #0x6
.L_2998:
    add r0, r8, #0x3
    mla r1, r0, r5, r7
    mov r0, r6
    bl func_ov003_021cefec
    cmp r0, #0x0
    ldrne r0, [r4, #0x4c]
    cmpne r0, r8
    beq .L_29e8
    mov r0, r6
    mov r1, r8
    mov r2, #0x0
    str r8, [r4, #0x4c]
    bl func_ov003_021cef78
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_29e8:
    add r8, r8, #0x1
    cmp r8, #0x2
    blt .L_2998
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_29fc:
    ldr r5, _LIT4
    mov r7, #0x0
    mov r4, #0x6
.L_2a08:
    add r0, r7, #0x3
    mla r1, r0, r4, r5
    mov r0, r6
    bl func_ov003_021cf064
    cmp r0, #0x0
    beq .L_2a3c
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_2a3c:
    add r7, r7, #0x1
    cmp r7, #0x2
    blt .L_2a08
.L_2a48:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov003_021cf6c0
_LIT1: .word data_02104cec
_LIT2: .word data_021040ac
_LIT3: .word data_02104bac
_LIT4: .word data_ov003_021cf1b8
