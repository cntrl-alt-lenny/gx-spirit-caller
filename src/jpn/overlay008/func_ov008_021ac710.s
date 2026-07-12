; func_ov008_021ac710 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104e6c
        .extern data_ov008_021b2660
        .extern data_ov008_021b2b60
        .extern data_ov008_021b2ca0
        .extern func_02005d90
        .extern func_0207fc40
        .extern func_020943b0
        .extern func_020b377c
        .extern func_ov008_021aa3c0
        .extern func_ov008_021ac4f0
        .extern func_ov008_021ac578
        .extern func_ov008_021ac638
        .global func_ov008_021ac710
        .arm
func_ov008_021ac710:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    ldr r0, _LIT0
    ldrh r7, [r0, #0x5a]
    mov r0, #0xf0
    cmp r7, #0x6
    movhi r7, #0x6
    mov r1, r7, lsl #0x1
    bl func_020b377c
    mov r4, r0
    cmp r7, #0x0
    mov r5, #0x0
    ble .L_1c0
    ldr r0, _LIT1
    ldr sl, _LIT2
    ldr r8, _LIT3
    mov r6, r4, lsl #0x1
    sub fp, r0, #0x800
.L_48:
    ldrh r0, [r8, #0x4]
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x1d
    add r0, r1, r0, ror #0x1d
    add r0, r0, r5
    cmp r0, #0x7
    subgt r0, r0, #0x8
    mov r0, r0, lsl #0x4
    add r0, r0, #0x93
    add r0, r0, #0x200
    orr r0, r0, #0x400
    strh r0, [sp, #0x4]
    sub r0, r4, #0x8
    mov r9, r0, lsl #0x17
    orr r0, fp, r9, lsr #0x7
    str r0, [sp]
    mov r0, #0x2
    mov r1, #0x0
    bl func_02005d90
    mov r1, r0
    add r0, sp, #0x0
    mov r2, #0x8
    bl func_020943b0
    ldrh r0, [r8, #0x4]
    mov r0, r0, lsl #0x18
    add r1, r5, r0, lsr #0x18
    mov r0, #0x34
    mla r0, r1, r0, sl
    ldrh r0, [r0, #0x1c]
    cmp r0, #0x0
    bne .L_fc
    ldr r0, _LIT1
    mov r1, #0x0
    orr r0, r0, r9, lsr #0x7
    str r0, [sp]
    ldr r0, _LIT4
    strh r0, [sp, #0x4]
    mov r0, #0x2
    bl func_02005d90
    mov r1, r0
    add r0, sp, #0x0
    mov r2, #0x8
    bl func_020943b0
.L_fc:
    ldrh r2, [r8, #0x4]
    sub r0, r4, #0x8
    mov r1, #0x15
    mov r2, r2, lsl #0x18
    add r3, r5, r2, lsr #0x18
    mov r2, #0x34
    mla r2, r3, r2, sl
    ldrh r2, [r2, #0x1a]
    bl func_ov008_021ac4f0
    ldrh r0, [r8, #0x4]
    mov r0, r0, lsl #0x18
    add r1, r5, r0, lsr #0x18
    mov r0, #0x34
    mla r0, r1, r0, sl
    ldrh r2, [r0, #0x1c]
    cmp r2, #0xf
    movhi r3, #0x0
    bhi .L_150
    cmp r2, #0x0
    movne r3, #0x1
    moveq r3, #0x2
.L_150:
    sub r0, r4, #0x7
    mov r1, #0x68
    bl func_ov008_021ac638
    ldrh r0, [r8, #0x4]
    mov r0, r0, lsl #0x18
    add r1, r5, r0, lsr #0x18
    mov r0, #0x34
    mla r0, r1, r0, sl
    ldr r0, [r0, #0x20]
    bl func_ov008_021aa3c0
    mov r9, r0
    ldrh r0, [r8, #0x4]
    mov r0, r0, lsl #0x18
    add r1, r5, r0, lsr #0x18
    mov r0, #0x34
    mla r0, r1, r0, sl
    ldr r0, [r0, #0x24]
    bl func_ov008_021aa3c0
    add r2, r9, r0
    cmp r2, #0x0
    ble .L_1b0
    add r0, r4, #0xe
    mov r1, #0x5a
    bl func_ov008_021ac578
.L_1b0:
    add r4, r4, r6
    add r5, r5, #0x1
    cmp r5, r7
    blt .L_48
.L_1c0:
    ldr r0, _LIT5
    mov r6, #0x0
    ldr r0, [r0, #0x4]
    mov r4, #0x1000
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1d
    subne r0, r0, #0x1
    mov r1, r0, lsl #0x1
    ldr r0, _LIT2
    add r5, r0, r1, lsl #0x2
.L_1e8:
    add r0, r5, r6, lsl #0x2
    ldr r0, [r0, #0x5c4]
    mov r1, r4
    bl func_0207fc40
    add r6, r6, #0x1
    cmp r6, #0x2
    blt .L_1e8
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov008_021b2b60
_LIT1: .word 0xc000a824
_LIT2: .word data_ov008_021b2660
_LIT3: .word data_ov008_021b2ca0
_LIT4: .word 0x00000693
_LIT5: .word data_02104e6c
