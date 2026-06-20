; func_ov002_0229dbc8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104f4c
        .extern data_ov002_022ca390
        .extern data_ov002_022ca398
        .extern data_ov002_022cd73c
        .global func_ov002_0229dbc8
        .arm
func_ov002_0229dbc8:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x8
    ldr r3, _LIT0
    ldr ip, [r1, #0xa0]
    ldr r7, [r3, #0x4]
    mov r5, #0x16
    eor lr, r7, #0x1
    cmp ip, lr
    moveq r3, #0x1
    movne r3, #0x0
    mov r3, r3, lsl #0x1
    rsb r4, r3, #0x1
    ldr r6, [r1, #0xa4]
    mul r3, r4, r5
    cmp r6, #0x0
    moveq r2, #0x8c
    streq r2, [sp]
    beq .L_b4
    cmp r6, #0x8
    bgt .L_7c
    cmp ip, r7
    moveq r5, #0x1
    movne r5, #0x0
    sub r4, r6, #0x1
    mla r5, r4, r3, r5
    add r4, r5, r5, lsr #0x1f
    mov r4, r4, asr #0x1
    rsb r4, r4, #0x8c
    mla r3, r2, r3, r4
    str r3, [sp]
    b .L_b4
.L_7c:
    ldr r6, [r1, #0xa8]
    sub r4, r5, #0x17
    sub r6, r2, r6
    cmp r6, r4
    movlt r6, r4
    cmp ip, lr
    moveq r4, #0x1
    movne r4, #0x0
    ldr r2, _LIT1
    cmp r6, #0x8
    ldr r2, [r2, r4, lsl #0x2]
    movge r6, #0x8
    mla r2, r6, r3, r2
    str r2, [sp]
.L_b4:
    ldr r1, [r1, #0xb4]
    ldr r2, _LIT2
    subs r1, r1, #0x8
    rsbmi r1, r1, #0x0
    rsb r1, r1, #0x8
    add r4, r1, r1, lsl #0x1
    ldr r1, _LIT3
    cmp ip, lr
    ldr r1, [r1, #0x4]
    moveq r3, #0x1
    movne r3, #0x0
    cmp ip, lr
    mov r1, r1, lsl #0x1b
    ldr r2, [r2, r3, lsl #0x2]
    rsbeq r4, r4, #0x0
    mov r3, r1, lsr #0x1e
    tst r3, #0x1
    ldrne r1, [sp]
    add r2, r2, r4
    subne r1, r1, #0x18
    strne r1, [sp]
    str r2, [sp, #0x4]
    tst r3, #0x2
    ldrne r1, [sp, #0x4]
    ldr r2, [sp]
    subne r1, r1, #0x10
    strne r1, [sp, #0x4]
    ldr r1, [sp, #0x4]
    str r2, [r0]
    str r1, [r0, #0x4]
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022cd73c
_LIT1: .word data_ov002_022ca398
_LIT2: .word data_ov002_022ca390
_LIT3: .word data_02104f4c
