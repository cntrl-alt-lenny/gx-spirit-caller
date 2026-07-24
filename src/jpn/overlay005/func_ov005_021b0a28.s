; func_ov005_021b0a28 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102bb0
        .extern data_ov005_021b1bf0
        .extern data_ov005_021b1c10
        .extern data_ov005_021b214c
        .extern func_02001cec
        .extern func_0200506c
        .extern func_02005488
        .extern func_02005ec4
        .extern func_02006bf0
        .extern func_02006e00
        .extern func_0201d428
        .extern func_0201e564
        .extern func_0202c06c
        .extern func_0208de58
        .extern func_0208e0c4
        .extern func_0208e118
        .extern OS_SPrintf
        .extern func_02094410
        .global func_ov005_021b0a28
        .arm
func_ov005_021b0a28:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x98
    mov r6, r1
    str r0, [sp, #0x8]
    mov r5, r2
    ldr r1, _LIT0
    mov r0, #0x0
    mov r2, #0x20
    bl func_02094410
    bl func_0208e118
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x400
    bl func_02094410
    bl func_0208e0c4
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x400
    bl func_02094410
    bl func_0208de58
    add r4, r0, #0x640
    mov r0, #0x0
    add r1, r4, #0x4000
    mov r2, #0x1c00
    bl func_02094410
    ldr r0, _LIT1
    mov r1, #0x1c
    mov r2, #0x8
    bl func_02001cec
    mov r3, #0x2
    str r3, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r0, _LIT1
    mov r1, r5
    add r2, r4, #0x4000
    bl func_0200506c
    ldr r0, [sp, #0x8]
    mov r5, #0x1
    tst r6, #0x10
    str r6, [r0, #0x18]
    addne r5, r5, #0x1
    ldr r1, _LIT2
    add r0, sp, #0x30
    mov r2, r5
    bl OS_SPrintf
    ldr r1, _LIT3
    add r0, sp, #0x10
    mov r2, r5
    bl OS_SPrintf
    add r0, sp, #0x50
    bl func_0201d428
    add r0, sp, #0x30
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    str r0, [sp, #0x50]
    mov r0, #0x4500
    ldrh r1, [sp, #0x64]
    str r0, [sp, #0x5c]
    bic r0, r1, #0xf
    orr r0, r0, #0x6
    strh r0, [sp, #0x64]
    ldrh r1, [sp, #0x64]
    mov r0, #0x20
    strh r0, [sp, #0x60]
    sub r0, r0, #0x21
    bic r1, r1, #0x10
    str r0, [sp, #0x58]
    add r0, sp, #0x50
    strh r1, [sp, #0x64]
    bl func_0201e564
    ldr r0, [sp, #0x50]
    bl func_02006e00
    add r0, sp, #0x50
    bl func_0201d428
    add r0, sp, #0x10
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    str r0, [sp, #0x50]
    mov r0, #0xf80
    ldrh r1, [sp, #0x64]
    str r0, [sp, #0x5c]
    bic r0, r1, #0xf
    orr r0, r0, #0x9
    strh r0, [sp, #0x64]
    mov r0, #0xc0
    ldrh r1, [sp, #0x64]
    strh r0, [sp, #0x60]
    bic r0, r1, #0x10
    strh r0, [sp, #0x64]
    add r0, sp, #0x50
    bl func_0201e564
    ldr r0, [sp, #0x50]
    bl func_02006e00
    ldr r0, _LIT1
    ldr r0, [r0, #0xc]
    add r1, r0, #0xc
    ldr r0, [sp, #0x8]
    str r1, [r0, #0xc]
    ldr r0, [r0, #0x18]
    and r0, r0, #0xf
    cmp r0, #0x1
    beq .L_1b0
    cmp r0, #0x2
    beq .L_238
    b .L_300
.L_1b0:
    ldr r0, [sp, #0x8]
    ldr r1, [r0, #0xc]
    mov r0, #0x1f
    add r2, r1, #0x8
    ldr r1, [sp, #0x8]
    str r2, [r1, #0xc]
    str r2, [r1, #0x10]
    bl func_0202c06c
    mov r1, r0
    add r0, sp, #0x78
    bl OS_SPrintf
    mov r0, #0x1f
    bl func_0202c06c
    mov r1, #0xc
    bl func_02005488
    rsb r0, r0, #0xe0
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    add r3, r0, #0x2
    ldr r0, [sp, #0x8]
    add r2, r4, #0x4000
    ldr r1, [r0, #0xc]
    mov r0, #0xc
    str r1, [sp]
    str r0, [sp, #0x4]
    ldr r0, _LIT1
    add r1, sp, #0x78
    bl func_0200506c
    ldr r0, [sp, #0x8]
    ldr r0, [r0, #0xc]
    add r1, r0, #0xc
    ldr r0, [sp, #0x8]
    str r1, [r0, #0xc]
    b .L_300
.L_238:
    ldr r0, [sp, #0x8]
    ldr r1, [r0, #0xc]
    mov r0, #0x1d
    add r2, r1, #0x8
    ldr r1, [sp, #0x8]
    str r2, [r1, #0xc]
    str r2, [r1, #0x10]
    bl func_0202c06c
    mov r5, r0
    mov r0, #0x1d
    bl func_0202c06c
    mov r1, #0xc
    bl func_02005488
    rsb r0, r0, #0x70
    add r0, r0, r0, lsr #0x1f
    mov r3, r0, asr #0x1
    ldr r0, [sp, #0x8]
    mov r1, r5
    ldr r2, [r0, #0xc]
    mov r0, #0xc
    str r2, [sp]
    str r0, [sp, #0x4]
    ldr r0, _LIT1
    add r2, r4, #0x4000
    bl func_0200506c
    mov r0, #0x1e
    bl func_0202c06c
    mov r5, r0
    mov r0, #0x1e
    bl func_0202c06c
    mov r1, #0xc
    bl func_02005488
    rsb r0, r0, #0x70
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    add r3, r0, #0x70
    ldr r0, [sp, #0x8]
    add r2, r4, #0x4000
    ldr r4, [r0, #0xc]
    mov r0, #0xc
    str r4, [sp]
    str r0, [sp, #0x4]
    ldr r0, _LIT1
    mov r1, r5
    bl func_0200506c
    ldr r0, [sp, #0x8]
    ldr r0, [r0, #0xc]
    add r1, r0, #0xc
    ldr r0, [sp, #0x8]
    str r1, [r0, #0xc]
.L_300:
    bl func_0208e118
    ldr r1, [sp, #0x8]
    add r3, r0, #0x44
    ldr r1, [r1, #0xc]
    ldr r5, _LIT4
    mov r0, r1, asr #0x2
    add r0, r1, r0, lsr #0x1d
    mov r2, r1, lsr #0x1f
    rsb r1, r2, r1, lsl #0x1d
    mov r4, r0, asr #0x3
    adds r0, r2, r1, ror #0x1d
    addne r4, r4, #0x1
    cmp r4, #0x0
    mov r6, #0x0
    ble .L_374
    mov r2, r6
.L_340:
    mov r7, r2
.L_344:
    add r0, r5, #0x1
    mov r1, r7, lsl #0x1
    add r7, r7, #0x1
    mov r0, r0, lsl #0x10
    strh r5, [r3, r1]
    cmp r7, #0x1c
    mov r5, r0, lsr #0x10
    blt .L_344
    add r6, r6, #0x1
    cmp r6, r4
    add r3, r3, #0x40
    blt .L_340
.L_374:
    bl func_0208e0c4
    add r1, r4, #0x2
    str r1, [sp, #0xc]
    cmp r1, #0x0
    add sl, r0, #0x2
    mov r8, #0x0
    ble .L_448
    ldr r2, _LIT5
    add r6, r4, #0x1
    sub r3, r2, #0x6
    sub ip, r2, #0x2
    sub lr, r2, #0x5
    sub r4, r2, #0x1
    sub r5, r2, #0x4
    mov fp, #0x230
    mov r7, #0x228
.L_3b4:
    mov r9, #0x0
.L_3b8:
    cmp r9, #0x0
    beq .L_3cc
    cmp r9, #0x1d
    beq .L_3e8
    b .L_404
.L_3cc:
    cmp r8, #0x0
    moveq r0, r7
    beq .L_41c
    cmp r8, r6
    movlt r0, r5
    movge r0, r4
    b .L_41c
.L_3e8:
    cmp r8, #0x0
    moveq r0, lr
    beq .L_41c
    cmp r8, r6
    movlt r0, ip
    movge r0, fp
    b .L_41c
.L_404:
    cmp r8, #0x0
    moveq r0, r3
    beq .L_41c
    cmp r8, r6
    movlt r0, #0x22c
    movge r0, r2
.L_41c:
    orr r1, r0, #0x1000
    mov r0, r9, lsl #0x1
    strh r1, [sl, r0]
    add r9, r9, #0x1
    cmp r9, #0x1e
    blt .L_3b8
    ldr r0, [sp, #0xc]
    add r8, r8, #0x1
    add sl, sl, #0x40
    cmp r8, r0
    blt .L_3b4
.L_448:
    ldr r0, [sp, #0x8]
    ldr r1, _LIT6
    ldr r0, [r0, #0xc]
    ldr r3, _LIT7
    add r2, r0, #0x10
    ldr r0, [sp, #0x8]
    str r2, [r0, #0xc]
    and r0, r1, r2, lsl #0x10
    str r0, [r3]
    ldr r0, [sp, #0x8]
    sub r2, r3, #0x10
    ldr r0, [r0, #0xc]
    and r0, r1, r0, lsl #0x10
    str r0, [r3, #0x4]
    ldr r1, [r2]
    ldr r0, [r2]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0x3
    orr r0, r1, r0, lsl #0x8
    str r0, [r2]
    bl func_02005ec4
    mov r0, #0x1
    add sp, sp, #0x98
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov005_021b214c
_LIT1: .word data_02102bb0
_LIT2: .word data_ov005_021b1bf0
_LIT3: .word data_ov005_021b1c10
_LIT4: .word 0x00000232
_LIT5: .word 0x0000022f
_LIT6: .word 0x01ff0000
_LIT7: .word 0x04001010
