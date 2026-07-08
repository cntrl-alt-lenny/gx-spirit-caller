; func_ov002_021ab794 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern data_ov002_022cd340
        .extern data_ov002_022cd3b0
        .extern data_ov002_022cd3b4
        .extern data_ov002_022cd3b8
        .extern data_ov002_022cd3bc
        .extern data_ov002_022cd3c0
        .extern data_ov002_022cf08c
        .extern func_ov002_021b3dec
        .global func_ov002_021ab794
        .arm
func_ov002_021ab794:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    ldr r3, _LIT0
    mov r4, r0
    ldr r0, [r3, #0x9c]
    ldr r5, _LIT1
    cmp r0, #0x0
    movne r3, #0x1
    moveq r3, #0x0
    mov r0, #0x14
    mul r0, r3, r0
    str r2, [r5, r0]
    ldr r3, _LIT2
    ldr r5, [r4]
    ldr r2, _LIT3
    str r5, [r3, r0]
    ldr r3, [r4, #0x4]
    cmp r1, #0x0
    str r3, [r2, r0]
    mov r2, #0x0
    bne .L_84
    ldr r1, [r4]
    ldr r5, _LIT4
    rsb r1, r1, #0x1
    str r1, [r5, r0]
    ldr r3, _LIT5
    mov r1, #0x5
    str r1, [r3, r0]
    add r1, r5, r0
    str r1, [sp, #0x4]
    add r1, r3, r0
    str r1, [sp]
    b .L_ac
.L_84:
    ldr r6, _LIT4
    ldr r3, [r1]
    ldr r5, _LIT5
    str r3, [r6, r0]
    ldr r3, [r1, #0x4]
    add r1, r6, r0
    str r1, [sp, #0x4]
    add r1, r5, r0
    str r3, [r5, r0]
    str r1, [sp]
.L_ac:
    ldr r3, _LIT0
    ldr r1, _LIT6
    ldr r7, _LIT7
    ldr r8, _LIT8
    ldr fp, _LIT9
    mov r5, #0x0
    add ip, r3, r0
    mov r9, #0x5
    mov r6, #0x14
.L_d0:
    cmp r2, #0x0
    ldreq lr, [r3, #0x2c]
    ldreq r0, [ip, #0xa8]
    cmpeq r0, lr
    bne .L_138
    ldr r0, [r3, #0x3c]
    cmp r0, r8
    cmpne r0, r7
    bne .L_138
    and r0, lr, #0x1
    mla sl, r0, fp, r1
    ldr r0, [r3, #0x30]
    mla sl, r0, r6, sl
    ldr r0, [sl, #0x40]
    mov r0, r0, lsr #0x6
    tst r0, #0x1
    bne .L_138
    ldr r0, [r4]
    mov r2, #0x1
    cmp r0, lr
    ldrne r0, [r4, #0x4]
    strne r0, [ip, #0xac]
    streq r9, [ip, #0xac]
    ldr r0, [ip, #0xa8]
    eor r0, r0, #0x1
    str r0, [ip, #0xa8]
.L_138:
    add r3, r3, #0x38
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_d0
    cmp r2, #0x0
    addne sp, sp, #0x8
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, [sp, #0x4]
    ldr r2, _LIT10
    ldr r0, [r0]
    mov r1, #0xb
    bl func_ov002_021b3dec
    cmp r0, #0x0
    addeq sp, sp, #0x8
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, #0x38
    mul r1, r5, r0
    ldr r0, _LIT11
    ldr r2, [r4]
    ldr r0, [r0, r1]
    cmp r2, r0
    ldrne r0, [sp]
    ldrne r1, [r4, #0x4]
    ldreq r0, [sp]
    moveq r1, #0x5
    str r1, [r0]
    ldr r0, [sp, #0x4]
    ldr r0, [r0]
    eor r1, r0, #0x1
    ldr r0, [sp, #0x4]
    str r1, [r0]
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cd314
_LIT1: .word data_ov002_022cd3b0
_LIT2: .word data_ov002_022cd3b4
_LIT3: .word data_ov002_022cd3b8
_LIT4: .word data_ov002_022cd3bc
_LIT5: .word data_ov002_022cd3c0
_LIT6: .word data_ov002_022cf08c
_LIT7: .word 0x00001639
_LIT8: .word 0x000014a4
_LIT9: .word 0x00000868
_LIT10: .word 0x00001930
_LIT11: .word data_ov002_022cd340
