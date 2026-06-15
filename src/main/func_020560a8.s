; func_020560a8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ffd50
        .extern data_020ffe48
        .extern data_020ffe50
        .extern func_02055324
        .extern func_02056264
        .extern func_02058244
        .extern func_020586c8
        .extern func_02058954
        .extern func_0205bd0c
        .extern func_0205bd58
        .extern func_0205bf18
        .extern func_0205c830
        .extern func_0205da48
        .extern func_020a6d54
        .global func_020560a8
        .arm
func_020560a8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x4
    mov sl, r0
    ldr r7, [sl]
    mov r9, r1
    ldr r0, [r7, #0x1d8]
    mov r6, #0x0
    cmp r0, #0x4
    bls .L_78
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r3, _LIT2
    mov r2, r6
    bl func_020a6d54
.L_78:
    ldr r0, [r7, #0x1d8]
    cmp r0, #0x1
    bne .L_114
    mov r4, #0x0
    mov r5, #0x1
    mov fp, #0xa
.L_90:
    mov r0, sl
    bl func_02058954
    movs r6, r0
    bne .L_b8
    cmp r9, #0x0
    beq .L_b8
    ldr r0, [r7, #0x1d8]
    cmp r0, #0x1
    moveq r8, r5
    beq .L_bc
.L_b8:
    mov r8, r4
.L_bc:
    cmp r8, #0x0
    beq .L_cc
    mov r0, fp
    bl func_02055324
.L_cc:
    cmp r8, #0x0
    bne .L_90
    cmp r6, #0x0
    beq .L_114
    add r1, sp, #0x0
    mov r0, sl
    mov r2, #0x1
    bl func_0205bd0c
    cmp r0, #0x0
    ldrne r0, [sp]
    movne r1, #0x4
    strne r1, [r0, #0x1c]
    bne .L_114
    ldr r0, _LIT3
    ldr r1, _LIT1
    ldr r3, _LIT4
    mov r2, #0x0
    bl func_020a6d54
.L_114:
    ldr r0, [r7, #0x1d8]
    sub r0, r0, #0x2
    cmp r0, #0x1
    bhi .L_14c
    cmp r6, #0x0
    bne .L_138
    mov r0, sl
    bl func_02056264
    mov r6, r0
.L_138:
    cmp r6, #0x0
    bne .L_14c
    mov r0, sl
    bl func_0205c830
    mov r6, r0
.L_14c:
    cmp r6, #0x0
    bne .L_160
    mov r0, sl
    bl func_0205da48
    mov r6, r0
.L_160:
    ldr r1, [r7, #0x424]
    str r1, [sp]
    cmp r1, #0x0
    beq .L_1ac
.L_170:
    ldr r0, [r1, #0x1c]
    cmp r0, #0x0
    ldreq r0, [r1, #0x20]
    streq r0, [sp]
    beq .L_1a0
    mov r0, sl
    bl func_0205bf18
    ldr r1, [sp]
    mov r0, sl
    ldr r2, [r1, #0x20]
    str r2, [sp]
    bl func_0205bd58
.L_1a0:
    ldr r1, [sp]
    cmp r1, #0x0
    bne .L_170
.L_1ac:
    mov r0, sl
    mov r1, r9
    bl func_02058244
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, [r7, #0x41c]
    cmp r0, #0x0
    beq .L_1dc
    mov r0, sl
    mov r1, #0x0
    bl func_020586c8
.L_1dc:
    mov r0, r6
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_020ffd50
_LIT1: .word data_020ffe48
_LIT2: .word 0x000001b5
_LIT3: .word data_020ffe50
_LIT4: .word 0x000001db
