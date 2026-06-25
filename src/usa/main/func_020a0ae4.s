; func_020a0ae4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a981c
        .extern func_02093b08
        .extern func_020a08d4
        .extern func_020a0da8
        .extern func_020a1f38
        .extern func_020a2bc8
        .extern func_020a5448
        .extern func_020a55c8
        .extern func_020a5758
        .extern func_020a5b8c
        .global func_020a0ae4
        .arm
func_020a0ae4:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x1c
    ldr r5, _LIT0
    ldr r0, [r5]
    add r0, r0, #0x1000
    ldrb r0, [r0, #0x524]
    cmp r0, #0x0
    addeq sp, sp, #0x1c
    moveq r0, #0x15
    ldmeqia sp!, {r4, r5, r6, r7, lr}
    bxeq lr
    ldr r4, _LIT1
    mov r1, #0x0
.L_34:
    ldr r0, [r5]
    add r3, r0, #0x1000
    ldrb r0, [r3, #0x525]
    add r0, r0, #0x1
    mov r2, r0, lsr #0x1f
    rsb r0, r2, r0, lsl #0x1c
    add r0, r2, r0, ror #0x1c
    strb r0, [r3, #0x525]
    ldr r2, [r5]
    add r0, r2, #0x1000
    ldrb r0, [r0, #0x525]
    mla r3, r0, r4, r2
    add r2, r3, #0x1000
    ldrb r2, [r2, #0xd52]
    cmp r2, #0x0
    beq .L_84
    add r2, r3, #0x1d00
    ldrh r2, [r2, #0x4c]
    cmp r2, #0x0
    bne .L_94
.L_84:
    add r1, r1, #0x1
    and r1, r1, #0xff
    cmp r1, #0x10
    bcc .L_34
.L_94:
    cmp r1, #0x10
    addeq sp, sp, #0x1c
    moveq r0, #0x15
    ldmeqia sp!, {r4, r5, r6, r7, lr}
    bxeq lr
    bl func_020a08d4
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r6, [r0]
    ldr r2, _LIT2
    add r0, r6, #0x1000
    ldrb r0, [r0, #0x525]
    ldr r3, _LIT3
    add r4, r6, r2
    mul r5, r0, r1
    add r0, r6, r5
    add r0, r0, #0x1d00
    ldrh r2, [r0, #0x48]
    add r3, r6, r3
    add r0, sp, #0x8
    add r1, r4, r5
    add r3, r3, r5
    bl func_020a1f38
    cmp r0, #0x0
    addeq sp, sp, #0x1c
    moveq r0, #0x15
    ldmeqia sp!, {r4, r5, r6, r7, lr}
    bxeq lr
    ldr r0, _LIT0
    mov r2, #0x4
    ldr r1, [r0]
    strb r2, [sp]
    add r2, r1, #0x1000
    ldrb r4, [r2, #0x525]
    ldr r3, _LIT1
    add r0, sp, #0x0
    strh r4, [sp, #0x2]
    ldrb r4, [r2, #0x525]
    mla r2, r4, r3, r1
    add r2, r2, #0x1d00
    ldrh r2, [r2, #0x48]
    strh r2, [sp, #0x4]
    bl func_020a5b8c
    ldr r1, _LIT0
    ldr r4, _LIT1
    ldr r5, [r1]
    ldrb r1, [sp, #0x14]
    add r2, r5, #0x1000
    ldrb r2, [r2, #0x525]
    ldr r6, [sp, #0x10]
    ldr r3, [sp, #0xc]
    mla r5, r2, r4, r5
    add r2, r5, r1, lsl #0x2
    add r4, r5, #0x1000
    add r2, r2, #0x1000
    ldr r5, [r4, #0xd58]
    ldr r2, [r2, #0xd2c]
    ldr r1, [r5, r1, lsl #0x2]
    sub r2, r6, r2
    add r7, r2, r1
    ldr r6, [r4, #0xd54]
    mov r2, r0
    mov r0, r6
    mov r1, r7
    bl func_020a5448
    cmp r0, #0x0
    bne .L_274
    ldr r1, _LIT0
    ldr r0, _LIT4
    ldr r1, [r1]
    add r5, r1, r0
    mov r0, r5
    bl func_020a5758
    cmp r0, #0x0
    bne .L_264
    ldr r0, [r6]
    cmp r0, #0x0
    subne r0, r0, #0x1
    strne r0, [r6]
    bne .L_264
    add lr, r6, #0x30
    mov r4, #0x0
    mov ip, r4
    mov r3, lr
.L_1e4:
    add r0, lr, ip, lsl #0x4
    ldr r0, [r0, #0xc]
    mov r2, ip, lsl #0x4
    cmp r0, #0x2
    bne .L_214
    cmp r4, #0x0
    beq .L_210
    ldr r1, [r4]
    ldr r0, [lr, r2]
    cmp r1, r0
    bls .L_214
.L_210:
    mov r4, r3
.L_214:
    add ip, ip, #0x1
    cmp ip, #0x4
    add r3, r3, #0x10
    blt .L_1e4
    cmp r4, #0x0
    bne .L_230
    bl func_02093b08
.L_230:
    mov r0, #0x2
    str r0, [r6]
    mov r0, #0x1
    str r0, [r4, #0xc]
    bic r0, r7, #0x1f
    str r0, [r4]
    str r4, [r5, #0x10]
    ldr r1, _LIT5
    mov r0, r5
    mov r2, #0x0
    mov r3, #0x4
    str r6, [r5, #0x14]
    bl func_020a55c8
.L_264:
    add sp, sp, #0x1c
    mov r0, #0x15
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_274:
    ldr r0, _LIT0
    ldr r4, [sp, #0xc]
    ldr r2, [r0]
    ldr r1, _LIT1
    add r0, r2, #0x1000
    ldrb r3, [r0, #0x525]
    add r0, r4, #0x6
    mla r1, r3, r1, r2
    add r1, r1, #0x1d00
    ldrh r1, [r1, #0x4c]
    bl func_020a2bc8
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
_LIT0: .word data_021a981c
_LIT1: .word 0x000005d4
_LIT2: .word 0x00001d2c
_LIT3: .word 0x00001788
_LIT4: .word 0x00007ce0
_LIT5: .word func_020a0da8
