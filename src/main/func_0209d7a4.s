; func_0209d7a4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a8d28
        .extern data_021a8d2c
        .extern data_021a8d78
        .extern data_021a8d8c
        .extern data_021a8d9c
        .extern func_020928cc
        .extern func_020928e8
        .extern func_02093bfc
        .extern func_0209448c
        .extern func_020944a4
        .extern func_020945f4
        .extern func_02094688
        .extern func_0209d788
        .extern func_0209de74
        .global func_0209d7a4
        .arm
func_0209d7a4:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xc
    ldr r0, _LIT0
    cmp r2, #0x0
    ldr r8, [r0]
    mov sl, r1
    addne sp, sp, #0xc
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bxne lr
    ldr r0, [r8, #0x10]
    mov r1, #0x100
    bl func_020928cc
    ldrh r0, [r8, #0x16]
    cmp r0, #0x0
    bne .L_48
    ldr r0, [r8, #0x4]
    mov r1, #0x800
    bl func_020928cc
.L_48:
    ldr r0, [r8, #0x10]
    cmp sl, r0
    beq .L_60
    mov r0, sl
    mov r1, #0x100
    bl func_020928cc
.L_60:
    ldrh r0, [sl]
    cmp r0, #0x2c
    bcc .L_118
    cmp r0, #0x80
    bne .L_9c
    ldrh r0, [sl, #0x2]
    cmp r0, #0x13
    bne .L_84
    bl func_02093bfc
.L_84:
    ldr r1, [r8, #0xc8]
    cmp r1, #0x0
    beq .L_380
    mov r0, sl
    blx r1
    b .L_380
.L_9c:
    cmp r0, #0x82
    bne .L_f0
    ldrh r0, [sl, #0x6]
    add r1, r8, r0, lsl #0x2
    ldr r0, [r1, #0xcc]
    cmp r0, #0x0
    beq .L_380
    ldr r0, [r1, #0x10c]
    str r0, [sl, #0x1c]
    ldr r0, [r8, #0x14c]
    strh r0, [sl, #0x22]
    ldr r1, [r8, #0x4]
    ldr r0, [sl, #0x8]
    ldrh r1, [r1, #0x72]
    bl func_020928cc
    ldrh r1, [sl, #0x6]
    mov r0, sl
    add r1, r8, r1, lsl #0x2
    ldr r1, [r1, #0xcc]
    blx r1
    b .L_380
.L_f0:
    cmp r0, #0x81
    bne .L_380
    mov r0, #0xf
    strh r0, [sl]
    ldr r1, [sl, #0x1c]
    cmp r1, #0x0
    beq .L_380
    mov r0, sl
    blx r1
    b .L_380
.L_118:
    cmp r0, #0xe
    bne .L_158
    ldrh r1, [sl, #0x4]
    ldr r0, _LIT1
    add r0, r1, r0
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    cmp r0, #0x1
    bhi .L_158
    ldrh r0, [sl, #0x2]
    cmp r0, #0x0
    bne .L_158
    ldr r1, [r8, #0x4]
    ldr r0, [sl, #0x8]
    ldrh r1, [r1, #0x72]
    bl func_020928cc
.L_158:
    ldrh r1, [sl]
    cmp r1, #0x2
    bne .L_1a0
    ldrh r0, [sl, #0x2]
    cmp r0, #0x0
    bne .L_1a0
    add r0, r8, r1, lsl #0x2
    ldr r4, [r0, #0x18]
    bl func_0209de74
    cmp r4, #0x0
    addeq sp, sp, #0xc
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bxeq lr
    mov r0, sl
    blx r4
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
.L_1a0:
    add r0, r8, r1, lsl #0x2
    ldr r1, [r0, #0x18]
    cmp r1, #0x0
    beq .L_1d0
    mov r0, sl
    blx r1
    ldr r0, _LIT2
    ldrh r0, [r0]
    cmp r0, #0x0
    addeq sp, sp, #0xc
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bxeq lr
.L_1d0:
    ldrh r0, [sl]
    cmp r0, #0x8
    beq .L_1e4
    cmp r0, #0xc
    bne .L_380
.L_1e4:
    cmp r0, #0x8
    bne .L_218
    add r0, sl, #0xa
    str r0, [sp]
    ldrh r0, [sl, #0x2c]
    add fp, sl, #0x14
    ldrh r7, [sl, #0x8]
    ldrh r6, [sl, #0x10]
    ldrh r4, [sl, #0x12]
    str r0, [sp, #0x4]
    ldrh r9, [sl, #0x2e]
    mov r5, #0x0
    b .L_248
.L_218:
    cmp r0, #0xc
    bne .L_248
    ldrh r0, [sl, #0x16]
    mov r6, #0x0
    ldrh r7, [sl, #0x8]
    str r0, [sp, #0x4]
    add r0, sl, #0x10
    ldrh r5, [sl, #0xa]
    ldrh r4, [sl, #0xc]
    ldrh r9, [sl, #0x18]
    mov fp, r6
    str r0, [sp]
.L_248:
    cmp r7, #0x7
    beq .L_260
    cmp r7, #0x9
    beq .L_260
    cmp r7, #0x1a
    bne .L_380
.L_260:
    cmp r7, #0x7
    ldreq r1, [r8, #0x14c]
    moveq r0, #0x1
    orreq r0, r1, r0, lsl r6
    streq r0, [r8, #0x14c]
    movne r0, #0x1
    mvnne r0, r0, lsl r6
    ldrne r1, [r8, #0x14c]
    add r3, r8, #0x100
    andne r0, r1, r0
    strne r0, [r8, #0x14c]
    ldr r0, _LIT3
    mov r1, #0x0
    mov r2, #0x44
    strh r5, [r3, #0x50]
    bl func_020945f4
    ldr r3, _LIT3
    mov r1, #0x0
    mov r2, #0x82
    strh r2, [r3]
    strh r7, [r3, #0x4]
    strh r6, [r3, #0x12]
    strh r5, [r3, #0x20]
    strh r1, [r3, #0x2]
    str r1, [r3, #0x8]
    str r1, [r3, #0xc]
    strh r1, [r3, #0x10]
    ldr r1, [r8, #0x14c]
    ldr r2, _LIT4
    strh r1, [r3, #0x22]
    strh r2, [r3, #0x1a]
    ldr r0, [sp]
    ldr r1, _LIT5
    mov r2, #0x6
    strh r4, [r3, #0x3c]
    bl func_02094688
    cmp fp, #0x0
    beq .L_30c
    ldr r1, _LIT6
    mov r0, fp
    mov r2, #0x18
    bl func_020944a4
    b .L_31c
.L_30c:
    ldr r1, _LIT6
    mov r0, #0x0
    mov r2, #0x18
    bl func_0209448c
.L_31c:
    cmp r5, #0x0
    ldreq r1, [sp, #0x4]
    ldr r0, _LIT3
    movne r1, r9
    cmp r5, #0x0
    ldrne r9, [sp, #0x4]
    ldr r5, _LIT3
    strh r1, [r0, #0x40]
    mov r4, #0x0
    strh r9, [r5, #0x42]
.L_344:
    strh r4, [r5, #0x6]
    add r2, r8, r4, lsl #0x2
    ldr r0, [r2, #0xcc]
    cmp r0, #0x0
    beq .L_36c
    ldr r1, [r2, #0x10c]
    mov r0, r5
    str r1, [r5, #0x1c]
    ldr r1, [r2, #0xcc]
    blx r1
.L_36c:
    add r0, r4, #0x1
    mov r0, r0, lsl #0x10
    mov r4, r0, lsr #0x10
    cmp r4, #0x10
    bcc .L_344
.L_380:
    ldr r0, [r8, #0x10]
    mov r1, #0x100
    bl func_020928cc
    bl func_0209d788
    ldr r0, [r8, #0x10]
    cmp sl, r0
    addeq sp, sp, #0xc
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bxeq lr
    ldrh r2, [sl]
    mov r0, sl
    mov r1, #0x100
    orr r2, r2, #0x8000
    strh r2, [sl]
    bl func_020928e8
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
_LIT0: .word data_021a8d2c
_LIT1: .word 0x0000fff5
_LIT2: .word data_021a8d28
_LIT3: .word data_021a8d78
_LIT4: .word 0x0000ffff
_LIT5: .word data_021a8d8c
_LIT6: .word data_021a8d9c
