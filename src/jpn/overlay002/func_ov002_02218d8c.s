; func_ov002_02218d8c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_ov002_021b8f20
        .extern func_ov002_021d630c
        .extern func_ov002_021df728
        .extern func_ov002_021e050c
        .extern func_ov002_021eabf4
        .extern func_ov002_02257790
        .global func_ov002_02218d8c
        .arm
func_ov002_02218d8c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr r1, _LIT0
    mov sl, r0
    bl func_ov002_02257790
    mov r7, r0
    mov fp, #0x0
    mov r4, #0x2
.L_524:
    ldr r0, _LIT1
    ldr r1, _LIT2
    ldr r0, [r0, #0xcec]
    mov r6, #0x0
    eor r5, r0, fp
    ldr r0, _LIT3
    and r2, r5, #0x1
    mla r9, r2, r1, r0
    add r8, r9, #0x30
.L_548:
    ldr r0, [r8]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_598
    ldrh r0, [r9, #0x38]
    cmp r0, #0x0
    bne .L_598
    ldrh r0, [r9, #0x36]
    cmp r0, #0x0
    beq .L_598
    mov r0, sl
    mov r1, r5
    mov r2, r6
    mov r3, r4
    bl func_ov002_021d630c
    mov r0, r5
    mov r1, r6
    bl func_ov002_021b8f20
    cmp r0, #0x0
    addne r7, r7, #0x1
.L_598:
    add r6, r6, #0x1
    cmp r6, #0x5
    add r8, r8, #0x14
    add r9, r9, #0x14
    blt .L_548
    add fp, fp, #0x1
    cmp fp, #0x2
    blt .L_524
    ldrh r1, [sl]
    ldr r0, _LIT4
    cmp r1, r0
    beq .L_5d8
    ldr r0, _LIT5
    cmp r1, r0
    beq .L_5fc
    b .L_614
.L_5d8:
    mov r0, #0x1f4
    ldrh r1, [sl, #0x2]
    mul r2, r7, r0
    mov r0, r1, lsl #0x1f
    mov r1, r0, lsr #0x1f
    mov r0, sl
    rsb r1, r1, #0x1
    bl func_ov002_021df728
    b .L_614
.L_5fc:
    mov r0, #0x190
    mul r1, r7, r0
    ldrh r0, [sl, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e050c
.L_614:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word func_ov002_021eabf4
_LIT1: .word data_ov002_022d008c
_LIT2: .word 0x00000868
_LIT3: .word data_ov002_022cf08c
_LIT4: .word 0x0000135c
_LIT5: .word 0x00001635
