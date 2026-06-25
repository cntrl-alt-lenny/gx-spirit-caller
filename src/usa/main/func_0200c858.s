; func_0200c858 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02186a50
        .extern data_02186ae8
        .extern data_021882e8
        .extern data_02189ae8
        .extern data_0218b2e8
        .extern func_0200c858
        .extern func_020110e4
        .extern func_0201115c
        .extern func_020111c8
        .extern func_0201158c
        .extern func_020115c4
        .extern func_02011604
        .extern func_0201166c
        .extern func_020116d0
        .extern func_0208e338
        .global func_0200c858
        .arm
func_0200c858:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    movs sl, r0
    mov r9, r1
    mov fp, r2
    str r3, [sp]
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, #0x68
    mul r8, r9, r0
    ldr r0, [sl, #0x8]
    adds r6, r0, r8
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, #0x30
    mul r7, r9, r0
    ldr r5, _LIT0
    ldr r4, _LIT1
    mov r0, fp
    add r1, r5, r7
    bl func_0201115c
    ldr r0, [sp]
    add r1, r4, r7
    bl func_0201115c
    ldr r1, _LIT2
    mov r0, fp
    add r1, r1, r7
    bl func_0201115c
    ldr fp, _LIT3
    ldr r0, [sp]
    add r1, fp, r7
    bl func_0201115c
    ldr r1, [r6, #0x5c]
    cmp r1, #0x0
    ldreq r0, [r6, #0x60]
    cmpeq r0, #0x0
    ldreq r0, [r6, #0x64]
    cmpeq r0, #0x0
    beq .L_b0
    ldr r2, [r6, #0x60]
    ldr r3, [r6, #0x64]
    ldr r0, _LIT4
    bl func_020115c4
    add r0, r5, r7
    ldr r1, _LIT4
    mov r2, r0
    bl func_020111c8
.L_b0:
    ldrh r1, [r6, #0x58]
    cmp r1, #0x0
    beq .L_e4
    ldr r0, _LIT4
    bl func_020116d0
    add r0, r5, r7
    ldr r1, _LIT4
    mov r2, r0
    bl func_020111c8
    add r0, r4, r7
    ldr r1, _LIT4
    mov r2, r0
    bl func_020111c8
.L_e4:
    ldrh r1, [r6, #0x56]
    cmp r1, #0x0
    beq .L_118
    ldr r0, _LIT4
    bl func_0201166c
    add r0, r5, r7
    ldr r1, _LIT4
    mov r2, r0
    bl func_020111c8
    add r0, r4, r7
    ldr r1, _LIT4
    mov r2, r0
    bl func_020111c8
.L_118:
    ldrh r1, [r6, #0x54]
    cmp r1, #0x0
    beq .L_14c
    ldr r0, _LIT4
    bl func_02011604
    add r0, r5, r7
    ldr r1, _LIT4
    mov r2, r0
    bl func_020111c8
    add r0, r4, r7
    ldr r1, _LIT4
    mov r2, r0
    bl func_020111c8
.L_14c:
    ldr r1, [r6, #0x48]
    cmp r1, #0x1000
    ldreq r0, [r6, #0x4c]
    cmpeq r0, #0x1000
    ldreq r0, [r6, #0x50]
    cmpeq r0, #0x1000
    beq .L_188
    ldr r2, [r6, #0x4c]
    ldr r3, [r6, #0x50]
    ldr r0, _LIT4
    bl func_0201158c
    add r0, r5, r7
    ldr r1, _LIT4
    mov r2, r0
    bl func_020111c8
.L_188:
    ldr r0, [sl, #0x8]
    adds r6, r0, r8
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrsb r1, [r6, #0x41]
    mvn r0, #0x0
    cmp r1, r0
    beq .L_1b4
    mov r0, sl
    add r2, r5, r7
    add r3, r4, r7
    bl func_0200c858
.L_1b4:
    ldr r0, [sl, #0x10]
    ldr r2, [sl, #0x20]
    cmp r0, #0x0
    mov r8, #0x0
    bne .L_234
    cmp r2, #0x0
    ble .L_298
    ldr r1, [sl, #0xc]
.L_1d4:
    ldr r0, [r1, r8, lsl #0x2]
    cmp r9, r0
    bne .L_224
    ldr r1, _LIT5
    mov r2, #0x2
    add r0, r4, r7
    str r2, [r1]
    bl func_0208e338
    ldr r1, _LIT6
    mov r0, #0x1
    str r8, [r1]
    str r0, [r1, #-12]
    ldr r1, [sl, #0x30]
    add r0, r5, r7
    bl func_020110e4
    add r0, r5, r7
    bl func_0208e338
    ldr r0, _LIT6
    str r8, [r0]
    b .L_298
.L_224:
    add r8, r8, #0x1
    cmp r8, r2
    blt .L_1d4
    b .L_298
.L_234:
    cmp r2, #0x0
    ble .L_298
    ldr r1, [sl, #0xc]
.L_240:
    ldr r0, [r1, r8, lsl #0x2]
    cmp r9, r0
    bne .L_28c
    ldr r1, [sl, #0x30]
    add r0, r5, r7
    bl func_020110e4
    ldr r1, [sl, #0x10]
    mov r8, r8, lsl #0x1
    mov r0, #0x30
    mla r1, r8, r0, r1
    add r0, r5, r7
    bl func_0201115c
    ldr r1, [sl, #0x10]
    add r2, r8, #0x1
    mov r0, #0x30
    mla r1, r2, r0, r1
    add r0, r4, r7
    bl func_0201115c
    b .L_298
.L_28c:
    add r8, r8, #0x1
    cmp r8, r2
    blt .L_240
.L_298:
    ldrsb r1, [r6, #0x42]
    mvn r0, #0x0
    cmp r1, r0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r2, _LIT2
    mov r0, sl
    add r2, r2, r7
    add r3, fp, r7
    bl func_0200c858
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_021882e8
_LIT1: .word data_02186ae8
_LIT2: .word data_0218b2e8
_LIT3: .word data_02189ae8
_LIT4: .word data_02186a50
_LIT5: .word 0x04000440
_LIT6: .word 0x0400044c
