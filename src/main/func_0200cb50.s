; func_0200cb50 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02186ae8
        .extern data_02186b30
        .extern data_02186b60
        .extern data_02186bc8
        .extern data_021883c8
        .extern data_02189bc8
        .extern data_0218b3c8
        .extern func_0200bd90
        .extern func_0200cb50
        .extern func_02011100
        .extern func_02011178
        .extern func_020111e4
        .extern func_020115a8
        .extern func_020115e0
        .extern func_02011620
        .extern func_02011688
        .extern func_020116ec
        .extern func_0208e420
        .global func_0200cb50
        .arm
func_0200cb50:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    movs sl, r0
    mov r9, r1
    mov r8, r2
    mov fp, r3
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, #0x68
    mul r7, r9, r0
    ldr r0, [sl, #0x8]
    adds r0, r0, r7
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, #0x30
    mul r6, r9, r0
    ldr r5, _LIT0
    ldr r4, _LIT1
    mov r0, r8
    add r1, r5, r6
    bl func_02011178
    mov r0, fp
    add r1, r4, r6
    bl func_02011178
    ldr r1, _LIT2
    mov r0, r8
    add r1, r1, r6
    bl func_02011178
    mov r0, fp
    ldr fp, _LIT3
    add r1, fp, r6
    bl func_02011178
    ldr r2, [sl, #0x84]
    ldr r8, _LIT4
    mov r2, r2, lsl #0xa
    mov r0, sl
    mov r1, r9
    mov r3, r8
    mov r2, r2, asr #0x10
    bl func_0200bd90
    ldr r0, _LIT5
    ldr r0, [r0, #0xd4]
    cmp r0, #0x0
    ldreq r0, [r8, #0x60]
    cmpeq r0, #0x0
    ldreq r0, [r8, #0x64]
    cmpeq r0, #0x0
    beq .L_3b4
    ldr r1, [r8, #0x5c]
    ldr r2, [r8, #0x60]
    ldr r3, [r8, #0x64]
    ldr r0, _LIT6
    bl func_020115e0
    add r0, r5, r6
    ldr r1, _LIT6
    mov r2, r0
    bl func_020111e4
.L_3b4:
    ldrh r1, [r8, #0x58]
    cmp r1, #0x0
    beq .L_3e8
    ldr r0, _LIT6
    bl func_020116ec
    add r0, r5, r6
    ldr r1, _LIT6
    mov r2, r0
    bl func_020111e4
    add r0, r4, r6
    ldr r1, _LIT6
    mov r2, r0
    bl func_020111e4
.L_3e8:
    ldrh r1, [r8, #0x56]
    cmp r1, #0x0
    beq .L_41c
    ldr r0, _LIT6
    bl func_02011688
    add r0, r5, r6
    ldr r1, _LIT6
    mov r2, r0
    bl func_020111e4
    add r0, r4, r6
    ldr r1, _LIT6
    mov r2, r0
    bl func_020111e4
.L_41c:
    ldrh r1, [r8, #0x54]
    cmp r1, #0x0
    beq .L_450
    ldr r0, _LIT6
    bl func_02011620
    add r0, r5, r6
    ldr r1, _LIT6
    mov r2, r0
    bl func_020111e4
    add r0, r4, r6
    ldr r1, _LIT6
    mov r2, r0
    bl func_020111e4
.L_450:
    ldr r1, [r8, #0x48]
    cmp r1, #0x1000
    ldreq r0, [r8, #0x4c]
    cmpeq r0, #0x1000
    ldreq r0, [r8, #0x50]
    cmpeq r0, #0x1000
    beq .L_48c
    ldr r2, [r8, #0x4c]
    ldr r3, [r8, #0x50]
    ldr r0, _LIT6
    bl func_020115a8
    add r0, r5, r6
    ldr r1, _LIT6
    mov r2, r0
    bl func_020111e4
.L_48c:
    ldr r0, [sl, #0x8]
    adds r7, r0, r7
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrsb r1, [r7, #0x41]
    mvn r0, #0x0
    cmp r1, r0
    beq .L_4b8
    mov r0, sl
    add r2, r5, r6
    add r3, r4, r6
    bl func_0200cb50
.L_4b8:
    ldr r0, [sl, #0x10]
    ldr r2, [sl, #0x20]
    cmp r0, #0x0
    mov r8, #0x0
    bne .L_538
    cmp r2, #0x0
    ble .L_59c
    ldr r1, [sl, #0xc]
.L_4d8:
    ldr r0, [r1, r8, lsl #0x2]
    cmp r9, r0
    bne .L_528
    ldr r1, _LIT7
    mov r2, #0x2
    add r0, r4, r6
    str r2, [r1]
    bl func_0208e420
    ldr r1, _LIT8
    mov r0, #0x1
    str r8, [r1]
    str r0, [r1, #-12]
    ldr r1, [sl, #0x30]
    add r0, r5, r6
    bl func_02011100
    add r0, r5, r6
    bl func_0208e420
    ldr r0, _LIT8
    str r8, [r0]
    b .L_59c
.L_528:
    add r8, r8, #0x1
    cmp r8, r2
    blt .L_4d8
    b .L_59c
.L_538:
    cmp r2, #0x0
    ble .L_59c
    ldr r1, [sl, #0xc]
.L_544:
    ldr r0, [r1, r8, lsl #0x2]
    cmp r9, r0
    bne .L_590
    ldr r1, [sl, #0x30]
    add r0, r5, r6
    bl func_02011100
    ldr r1, [sl, #0x10]
    mov r8, r8, lsl #0x1
    mov r0, #0x30
    mla r1, r8, r0, r1
    add r0, r5, r6
    bl func_02011178
    ldr r1, [sl, #0x10]
    add r2, r8, #0x1
    mov r0, #0x30
    mla r1, r2, r0, r1
    add r0, r4, r6
    bl func_02011178
    b .L_59c
.L_590:
    add r8, r8, #0x1
    cmp r8, r2
    blt .L_544
.L_59c:
    ldrsb r1, [r7, #0x42]
    mvn r0, #0x0
    cmp r1, r0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r2, _LIT2
    mov r0, sl
    add r2, r2, r6
    add r3, fp, r6
    bl func_0200cb50
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_021883c8
_LIT1: .word data_02186bc8
_LIT2: .word data_0218b3c8
_LIT3: .word data_02189bc8
_LIT4: .word data_02186b60
_LIT5: .word data_02186ae8
_LIT6: .word data_02186b30
_LIT7: .word 0x04000440
_LIT8: .word 0x0400044c
