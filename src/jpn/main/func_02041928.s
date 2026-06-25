; func_02041928 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020fe6ac
        .extern data_0219ee3c
        .extern func_020414d0
        .extern func_02041c58
        .extern func_02041d58
        .extern func_02041d6c
        .extern func_02041dc8
        .extern func_02070264
        .extern func_020702b4
        .extern func_02070348
        .extern func_02070844
        .extern func_02070950
        .extern func_02070ac4
        .extern func_02070b58
        .extern func_02070c4c
        .extern func_02070e3c
        .extern func_02070e5c
        .extern func_02070e90
        .extern func_02070f28
        .extern func_02074604
        .extern func_020779a0
        .extern func_02092660
        .extern func_020926d0
        .extern func_02092fc8
        .extern func_02094500
        .extern func_02094688
        .extern func_020aace8
        .extern func_020b3714
        .global func_02041928
        .arm
func_02041928:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xc
    mov sl, r0
    add r0, sl, #0x1000
    ldr fp, [r0, #0x1c]
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r2, _LIT2
    add r8, sl, r0
    cmp fp, #0x0
    mov r0, sl
    add r6, sl, r1
    add r7, sl, r2
    mov r5, #0x0
    ldrle fp, _LIT3
    bl func_02041d6c
    mov r0, sl
    bl func_02041d58
    movs r4, r0
    addeq r0, sl, #0x1000
    moveq r1, #0x2
    streq r1, [r0, #0x20]
    addeq sp, sp, #0xc
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    bl func_02070e5c
    add r0, sl, #0x1000
    ldr r0, [r0, #0x12c]
    cmp r0, #0x1
    bne .L_b0
    mov r0, r6
    mov r1, #0x0
    mov r2, #0x830
    bl func_02094500
    ldr r1, _LIT4
    add r0, sl, #0x1000
    str r1, [r6, #0x810]
    ldr r1, [r0, #0x124]
    ldr r0, _LIT5
    str r1, [r6, #0x800]
    mov r1, #0xb
    str r6, [r8, #0xc]
    bl func_020779a0
    mov r0, #0x1
    bl func_02074604
.L_b0:
    add r0, sl, #0x1100
    ldrh r1, [r0, #0x30]
    mov r2, r4
    mov r0, #0x0
    bl func_02070e90
    bl func_02070c4c
    cmp r0, #0x0
    beq .L_ec
    add r0, sl, #0x1000
    mov r1, #0x3
    str r1, [r0, #0x20]
    bl func_02070e3c
    bl func_02070f28
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_ec:
    add r0, sl, #0x1000
    ldr r4, [r0, #0x9f4]
    mov r0, r4
    bl func_020aace8
    mov r1, r0
    mov r0, r4
    bl func_02070348
    cmp r0, #0x0
    str r0, [sp, #0x8]
    addle r0, sl, #0x1000
    movle r1, #0x5
    strle r1, [r0, #0x20]
    ble .L_2f4
    bl func_02070264
    mov r0, sl
    bl func_02041dc8
    cmp r0, #0x0
    addeq r0, sl, #0x1000
    moveq r1, #0x7
    streq r1, [r0, #0x20]
    beq .L_2f4
    ldr r0, [r7]
    str r0, [r7, #0x4]
    ldr r1, [r7]
    ldr r0, [r7, #0xc]
    add r0, r1, r0
    str r0, [r7, #0x8]
    bl func_02092fc8
    mov r6, r0
    mov r0, fp, asr #0x1f
    mov r8, r1
    str r0, [sp, #0x4]
    mov r4, #0x0
.L_170:
    ldr r0, _LIT6
    ldr r0, [r0]
    cmp r0, #0x0
    addeq r0, sl, #0x1000
    moveq r1, #0x5
    streq r1, [r0, #0x20]
    beq .L_2f4
    bl func_020702b4
    str r0, [sp, #0x8]
    cmp r0, #0x0
    blt .L_2d0
    cmp r0, #0x0
    ble .L_254
    bl func_02092fc8
    mov r6, r0
    add r0, sp, #0x8
    mov r8, r1
    bl func_02070950
    cmp r0, #0x0
    beq .L_2d0
    ldr r2, [r7, #0x8]
    ldr r1, [r7, #0x4]
    sub r2, r2, #0x1
    ldr r9, [sp, #0x8]
    sub r2, r2, r1
    cmp r9, r2
    movge r9, r2
    mov r2, r9
    bl func_02094688
    ldr r0, [r7, #0x4]
    cmp r5, #0x1
    add r0, r0, r9
    str r0, [r7, #0x4]
    ldr r0, [r7, #0x4]
    strb r4, [r0]
    bne .L_22c
    ldr r0, _LIT7
    add r0, sl, r0
    bl func_020926d0
    add r1, sl, #0x1000
    ldr r2, [r1, #0xa30]
    ldr r0, _LIT7
    add r2, r2, r9
    add r0, sl, r0
    str r2, [r1, #0xa30]
    bl func_02092660
    b .L_238
.L_22c:
    mov r0, sl
    bl func_02041c58
    mov r5, r0
.L_238:
    ldr r0, [sp, #0x8]
    cmp r0, r9
    bls .L_24c
    bl func_02070844
    b .L_2d0
.L_24c:
    mov r0, r9
    bl func_02070844
.L_254:
    add r0, sl, #0x1000
    ldr r1, [r0, #0xa2c]
    cmp r1, #0x0
    blt .L_270
    ldr r0, [r0, #0xa30]
    cmp r0, r1
    bge .L_2d0
.L_270:
    bl func_02092fc8
    subs r2, r0, r6
    sbc r0, r1, r8
    mov r1, r0, lsl #0x6
    orr r1, r1, r2, lsr #0x1a
    mov r0, r2, lsl #0x6
    ldr r2, _LIT8
    mov r3, r4
    bl func_020b3714
    ldr r2, [sp, #0x4]
    cmp r1, r2
    cmpeq r0, fp
    addhi r0, sl, #0x1000
    movhi r1, #0x6
    strhi r1, [r0, #0x20]
    bhi .L_2f4
    mov r0, sl
    bl func_02041dc8
    cmp r0, #0x0
    bne .L_170
    add r0, sl, #0x1000
    mov r1, #0x7
    str r1, [r0, #0x20]
    b .L_2f4
.L_2d0:
    bl func_02070b58
    bl func_02070ac4
    bl func_02070e3c
    bl func_02070f28
    add r0, sl, #0x1000
    mov r1, #0x8
    str r1, [r0, #0x20]
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2f4:
    bl func_02070b58
    bl func_02070ac4
    bl func_02070e3c
    bl func_02070f28
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00001134
_LIT1: .word 0x00001198
_LIT2: .word 0x00001a04
_LIT3: .word 0x0000ea60
_LIT4: .word func_020414d0
_LIT5: .word data_020fe6ac
_LIT6: .word data_0219ee3c
_LIT7: .word 0x00001a14
_LIT8: .word 0x000082ea
