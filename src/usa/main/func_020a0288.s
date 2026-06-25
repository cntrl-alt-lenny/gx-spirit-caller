; func_020a0288 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02094410
        .extern func_0209d5a8
        .extern func_0209d630
        .extern func_0209da94
        .extern func_0209e6fc
        .extern func_0209f1b4
        .extern func_0209faf4
        .extern func_0209fc34
        .extern func_0209fda0
        .extern func_020a66a4
        .global func_020a0288
        .arm
func_020a0288:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xc
    mov sl, r0
    mov r7, r1
    mov r6, r2
    mov r0, #0x2
    mov r1, #0x9
    mov r2, #0xa
    mov r5, r3
    mov r9, #0x1
    bl func_0209da94
    cmp r0, #0x0
    addne sp, sp, #0xc
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bxne lr
    cmp sl, #0x0
    addeq sp, sp, #0xc
    moveq r0, #0x6
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bxeq lr
    cmp r7, #0x10
    addcs sp, sp, #0xc
    movcs r0, #0x6
    ldmcsia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bxcs lr
    cmp r6, #0x0
    addeq sp, sp, #0xc
    moveq r0, #0x6
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bxeq lr
    bl func_0209d630
    movs r4, r0
    bne .L_8c
    bl func_0209d5a8
    mov r9, r0
.L_8c:
    mov r1, sl
    mov r0, #0x0
    mov r2, #0x820
    bl func_02094410
    add r0, sl, #0x800
    mov r2, #0x0
    strh r2, [r0, #0x8]
    strh r2, [r0, #0xa]
    strh r2, [r0, #0xc]
    strh r5, [r0, #0x10]
    strh r7, [r0, #0x16]
    strh r2, [r0, #0xe]
    mov r0, #0x1
    ldr r1, [sp, #0x30]
    orr r0, r6, r0, lsl r4
    cmp r1, #0x0
    mov r0, r0, lsl #0x10
    movne r2, #0x1
    add r1, sl, #0x800
    strh r2, [r1, #0x18]
    mov r0, r0, lsr #0x10
    strh r0, [r1, #0xe]
    bl func_020a66a4
    add r3, sl, #0x800
    mul r1, r5, r0
    strh r0, [r3, #0x12]
    strh r1, [r3, #0x14]
    ldrh r0, [r3, #0x14]
    cmp r0, #0x1fc
    movhi r0, #0x0
    strhih r0, [r3, #0xe]
    addhi sp, sp, #0xc
    movhi r0, #0x6
    ldmhiia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bxhi lr
    add r0, r0, #0x4
    strh r0, [r3, #0x14]
    mov r0, #0x1
    strh r0, [r3, #0x1c]
    cmp r4, #0x0
    bne .L_244
    orr r2, r9, #0x1
    mov r4, #0x0
.L_138:
    ldrh r1, [r3, #0xe]
    mov r0, r4, lsl #0x9
    add r4, r4, #0x1
    and r1, r1, r2
    strh r1, [sl, r0]
    cmp r4, #0x4
    blt .L_138
    ldr r1, _LIT0
    mov r0, r7
    mov r2, sl
    bl func_0209e6fc
    mov r8, sl
    mov r7, #0x0
    mov r4, #0x2
    mov r6, #0x1
    ldr fp, _LIT1
    ldr r5, _LIT2
    b .L_224
.L_180:
    add ip, sl, #0x800
    ldrh r2, [ip, #0x8]
    mov r0, fp
    mov r1, sl
    add r2, r2, #0x1
    and r2, r2, #0x3
    strh r2, [ip, #0x8]
    ldrh r3, [ip, #0xe]
    mov r2, r8
    and r3, r3, r9
    mov r3, r3, lsl #0x10
    mov r3, r3, lsr #0x10
    str r3, [sp]
    ldrh r3, [ip, #0x16]
    str r3, [sp, #0x4]
    str r6, [sp, #0x8]
    ldrh r3, [ip, #0x14]
    bl func_0209f1b4
    cmp r0, #0x7
    bne .L_1f4
    add r0, sl, r7, lsl #0x1
    add r0, r0, #0x800
    strh r5, [r0]
    add r0, sl, #0x800
    ldrh r1, [r0, #0xa]
    add r1, r1, #0x1
    and r1, r1, #0x3
    strh r1, [r0, #0xa]
    b .L_21c
.L_1f4:
    cmp r0, #0x0
    beq .L_21c
    cmp r0, #0x2
    addne r0, sl, #0x800
    movne r1, #0x5
    strneh r1, [r0, #0x1c]
    addne sp, sp, #0xc
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bxne lr
.L_21c:
    add r8, r8, #0x200
    add r7, r7, #0x1
.L_224:
    add r0, sl, #0x800
    ldrh r0, [r0, #0x18]
    cmp r0, #0x1
    movne r0, r6
    moveq r0, r4
    cmp r7, r0
    blt .L_180
    b .L_25c
.L_244:
    ldr r1, _LIT3
    mov r4, #0x3
    mov r0, r7
    mov r2, sl
    strh r4, [r3, #0xa]
    bl func_0209e6fc
.L_25c:
    mov r0, #0x0
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
_LIT0: .word func_0209fc34
_LIT1: .word func_0209fda0
_LIT2: .word 0x0000ffff
_LIT3: .word func_0209faf4
