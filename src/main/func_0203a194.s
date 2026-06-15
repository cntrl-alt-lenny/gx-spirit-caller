; func_0203a194 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219b314
        .extern data_0219b328
        .extern data_0219b384
        .extern data_0219c480
        .extern func_02038f3c
        .extern func_0203a5d4
        .extern func_0203a8dc
        .extern func_0203a950
        .extern func_02089024
        .extern func_02089260
        .extern func_020892c4
        .extern func_0208938c
        .extern func_02092748
        .extern func_020927b8
        .global func_0203a194
        .arm
func_0203a194:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    movs sl, r0
    mov r6, r1
    mov r5, r2
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT0
    ldrh r0, [r0, #0x4]
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r4, [sl, #0x4]
    ldr r1, _LIT1
    mov r0, r4, lsl #0x10
    ldr r2, [r1]
    mov r1, r0, lsr #0x10
    mov r0, #0xc
    mla r7, r1, r0, r2
    ldrh r0, [r7, #0x2]
    bl func_0208938c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrh r7, [r7, #0x4]
    mov r0, r7
    bl func_020892c4
    movs fp, r0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, [fp]
    bl func_02089024
    cmp r5, #0x0
    beq .L_166c
    ldr r1, _LIT2
    mov r2, #0x1
    ldr r0, _LIT3
    str r2, [r1]
    bl func_020927b8
    mov r0, sl
    bl func_0203a950
    mov r7, #0x0
.L_15a0:
    add r0, fp, r7, lsl #0x1
    ldrh r0, [r0, #0x4]
    ldr r1, _LIT4
    cmp r0, r1
    beq .L_1644
    bl func_02089260
    movs r8, r0
    bne .L_15d8
    ldr r0, _LIT3
    bl func_02092748
    ldr r1, _LIT2
    mov r0, #0x0
    str r0, [r1]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_15d8:
    mov r9, #0x0
    ldr r4, _LIT4
    mov r6, #0x1
    mov r5, r9
.L_15e8:
    add r1, sl, r9, lsl #0x2
    ldr r2, [r1, #0x14]
    cmp r2, r4
    beq .L_1644
    ldr r0, [r8]
    mov r0, r0, lsl #0x8
    cmp r2, r0, lsr #0x8
    bne .L_163c
    ldr r0, [r1, #0x34]
    cmp r0, #0x0
    beq .L_163c
    ldrh r2, [sl, #0x54]
    orr r2, r2, r6, lsl r9
    strh r2, [sl, #0x54]
    str r5, [r1, #0x34]
    ldrb r1, [r0, #0x1c]
    sub r1, r1, #0x1
    strb r1, [r0, #0x1c]
    tst r1, #0xff
    bne .L_163c
    bl func_0203a8dc
.L_163c:
    add r9, r9, #0x1
    b .L_15e8
.L_1644:
    add r7, r7, #0x1
    cmp r7, #0x4
    bcc .L_15a0
    ldr r0, _LIT3
    bl func_02092748
    ldr r0, _LIT2
    mov r1, #0x0
    str r1, [r0]
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_166c:
    ldrh r0, [sl, #0x54]
    mov r1, #0x0
.L_1674:
    tst r0, #0x1
    beq .L_16ac
    mov r0, sl
    mov r2, r4
    bl func_02038f3c
    mov r0, sl
    mov r1, r7
    mov r2, r6
    bl func_0203a5d4
    cmp r0, #0x0
    mov r0, #0x0
    strneh r0, [sl, #0x54]
    movne r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_16ac:
    add r1, r1, #0x1
    cmp r1, #0x8
    mov r0, r0, lsr #0x1
    bcc .L_1674
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_0219c480
_LIT1: .word data_0219b314
_LIT2: .word data_0219b328
_LIT3: .word data_0219b384
_LIT4: .word 0x0000ffff
