; func_02022b74 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02197434
        .extern Task_Invoke
        .global func_02022b74
        .arm
func_02022b74:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov r4, r0
    ldrsb r0, [r4, #0x4]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT0
    add r0, r0, #0x3400
    ldrsh lr, [r0, #0x74]
    ldrsh ip, [r0, #0x76]
    cmp ip, lr
    beq .L_790
    mov r3, ip
    cmp ip, lr
    mov r7, #0x0
    beq .L_790
    ldr r0, _LIT0
    mov fp, #0x1
    add r0, r0, #0x2b4
    add r2, r0, #0x1000
    mov r6, #0x3c
.L_688:
    mul r0, r3, r6
    add r5, r2, r0
    ldr r1, [r2, r0]
    cmp r1, #0x0
    beq .L_6ac
    cmp r1, #0x1
    cmpne r1, #0x2
    beq .L_6d8
    b .L_73c
.L_6ac:
    ldr r0, [r4]
    cmp r1, r0
    ldreq r1, [r5, #0x24]
    ldreq r0, [r4, #0x24]
    cmpeq r1, r0
    ldreq r1, [r5, #0x28]
    ldreq r0, [r4, #0x28]
    cmpeq r1, r0
    moveq r7, fp
    movne r7, #0x0
    b .L_73c
.L_6d8:
    ldr r0, [r4]
    cmp r1, r0
    bne .L_738
    ldr r1, [r5, #0x2c]
    ldr sl, [r4, #0x2c]
    ldrh r0, [r1, #0x14]
    ldrh r9, [sl, #0x14]
    mov r7, r0, lsl #0x1c
    mov r8, r7, lsr #0x1c
    mov r7, r9, lsl #0x1c
    cmp r8, r7, lsr #0x1c
    ldreq r8, [r1, #0xc]
    ldreq r7, [sl, #0xc]
    cmpeq r8, r7
    ldreqsh r7, [r1, #0x10]
    ldreqsh r1, [sl, #0x10]
    cmpeq r7, r1
    bne .L_738
    mov r0, r0, lsl #0x1b
    mov r1, r0, lsr #0x1f
    mov r0, r9, lsl #0x1b
    cmp r1, r0, lsr #0x1f
    moveq r7, #0x1
    beq .L_73c
.L_738:
    mov r7, #0x0
.L_73c:
    cmp r7, #0x0
    beq .L_77c
    ldr r0, [r5, #0x38]
    cmp r0, #0x0
    beq .L_754
    bl Task_Invoke
.L_754:
    ldmia r4!, {r0, r1, r2, r3}
    stmia r5!, {r0, r1, r2, r3}
    ldmia r4!, {r0, r1, r2, r3}
    stmia r5!, {r0, r1, r2, r3}
    ldmia r4!, {r0, r1, r2, r3}
    stmia r5!, {r0, r1, r2, r3}
    ldmia r4, {r0, r1, r2}
    stmia r5, {r0, r1, r2}
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_77c:
    add r3, r3, #0x1
    cmp r3, #0x90
    movge r3, #0x0
    cmp r3, lr
    bne .L_688
.L_790:
    sub r0, ip, #0x1
    cmp lr, r0
    beq .L_7a8
    cmp lr, #0x8f
    cmpeq ip, #0x0
    bne .L_7b0
.L_7a8:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_7b0:
    ldr r0, _LIT0
    mov r1, #0x3c
    smlabb r0, lr, r1, r0
    add r0, r0, #0x2b4
    add r5, r0, #0x1000
    ldmia r4!, {r0, r1, r2, r3}
    stmia r5!, {r0, r1, r2, r3}
    ldmia r4!, {r0, r1, r2, r3}
    stmia r5!, {r0, r1, r2, r3}
    ldmia r4!, {r0, r1, r2, r3}
    stmia r5!, {r0, r1, r2, r3}
    ldr r0, _LIT0
    add r3, r0, #0x3400
    ldmia r4, {r0, r1, r2}
    stmia r5, {r0, r1, r2}
    ldrsh r0, [r3, #0x74]
    add r0, r0, #0x1
    strh r0, [r3, #0x74]
    ldrsh r0, [r3, #0x74]
    cmp r0, #0x90
    movge r0, #0x0
    strgeh r0, [r3, #0x74]
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_02197434
