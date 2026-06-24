; func_ov002_021bb444 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd3f4
        .extern data_ov002_022cd420
        .extern data_ov002_022cd4b8
        .extern data_ov002_022cd4cc
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern func_ov002_021b9ecc
        .extern func_ov002_021ba0b0
        .extern func_ov002_021badb0
        .global func_ov002_021bb444
        .arm
func_ov002_021bb444:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    ldr r3, _LIT0
    ldr r0, _LIT1
    and r2, sl, #0x1
    mla r7, r2, r0, r3
    mov r6, #0x0
    ldr fp, _LIT2
    mov r9, r1
    mov r5, r6
    mov r8, sl, lsl #0x4
    mov r4, #0x1
.L_30:
    mov r0, sl
    mov r1, r5
    bl func_ov002_021b9ecc
    cmp r0, r9
    ldreqh r0, [r7, #0x36]
    cmpeq r0, #0x0
    bne .L_88
    ldr r3, [r7, #0x40]
    ldrh r0, [r7, #0x38]
    mov r2, r3, lsr #0x6
    mov r1, r3, lsr #0x2
    and r2, r2, #0x1
    orr r1, r1, r3, lsr #0x1
    mvn r2, r2
    and r1, r1, #0x1
    and r2, r0, r2
    mvn r0, r1
    tst r2, r0
    beq .L_88
    ldr r0, [fp, #0xd4]
    tst r0, r4, lsl r8
    addeq r6, r6, #0x1
.L_88:
    add r5, r5, #0x1
    cmp r5, #0x5
    add r7, r7, #0x14
    add r8, r8, #0x1
    blt .L_30
    ldr r0, _LIT2
    ldr r0, [r0, #0xd0]
    tst r0, #0x1
    beq .L_140
    ldr r0, _LIT3
    ldr r0, [r0]
    cmp sl, r0
    bne .L_f4
    ldr r0, _LIT4
    bl func_ov002_021ba0b0
    cmp r9, r0
    ldreq r0, _LIT3
    ldreqh r1, [r0, #0xca]
    cmpeq r1, #0x0
    bne .L_f4
    ldr r1, [r0]
    ldr r2, _LIT5
    mov r0, #0x38
    mla r0, r1, r0, r2
    bl func_ov002_021badb0
    cmp r0, #0x0
    addne r6, r6, #0x1
.L_f4:
    ldr r0, _LIT3
    ldr r0, [r0, #0x4]
    cmp sl, r0
    bne .L_140
    ldr r0, _LIT6
    bl func_ov002_021ba0b0
    cmp r9, r0
    ldreq r0, _LIT3
    ldreqh r1, [r0, #0xde]
    cmpeq r1, #0x0
    bne .L_140
    ldr r0, [r0]
    ldr r2, _LIT5
    rsb r1, r0, #0x1
    mov r0, #0x38
    mla r0, r1, r0, r2
    bl func_ov002_021badb0
    cmp r0, #0x0
    addne r6, r6, #0x1
.L_140:
    mov r0, r6
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022d016c
_LIT3: .word data_ov002_022cd3f4
_LIT4: .word data_ov002_022cd4b8
_LIT5: .word data_ov002_022cd420
_LIT6: .word data_ov002_022cd4cc
