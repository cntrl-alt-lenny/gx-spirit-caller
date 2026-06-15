; func_02041978 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020fe78c
        .extern data_0219ef1c
        .extern func_02041520
        .extern func_02041ca8
        .extern func_02041da8
        .extern func_02041dbc
        .extern func_02041e18
        .extern func_0207034c
        .extern func_0207039c
        .extern func_02070430
        .extern func_0207092c
        .extern func_02070a38
        .extern func_02070bac
        .extern func_02070c40
        .extern func_02070d34
        .extern func_02070f24
        .extern func_02070f44
        .extern func_02070f78
        .extern func_02071010
        .extern func_020746ec
        .extern func_02077a88
        .extern func_02092748
        .extern func_020927b8
        .extern func_020930b0
        .extern func_020945f4
        .extern func_02094688
        .extern func_020aaddc
        .extern func_020b3808
        .global func_02041978
        .arm
func_02041978:
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
    bl func_02041dbc
    mov r0, sl
    bl func_02041da8
    movs r4, r0
    addeq r0, sl, #0x1000
    moveq r1, #0x2
    streq r1, [r0, #0x20]
    addeq sp, sp, #0xc
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    bl func_02070f44
    add r0, sl, #0x1000
    ldr r0, [r0, #0x12c]
    cmp r0, #0x1
    bne .L_4fc
    mov r0, r6
    mov r1, #0x0
    mov r2, #0x830
    bl func_020945f4
    ldr r1, _LIT4
    add r0, sl, #0x1000
    str r1, [r6, #0x810]
    ldr r1, [r0, #0x124]
    ldr r0, _LIT5
    str r1, [r6, #0x800]
    mov r1, #0xb
    str r6, [r8, #0xc]
    bl func_02077a88
    mov r0, #0x1
    bl func_020746ec
.L_4fc:
    add r0, sl, #0x1100
    ldrh r1, [r0, #0x30]
    mov r2, r4
    mov r0, #0x0
    bl func_02070f78
    bl func_02070d34
    cmp r0, #0x0
    beq .L_538
    add r0, sl, #0x1000
    mov r1, #0x3
    str r1, [r0, #0x20]
    bl func_02070f24
    bl func_02071010
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_538:
    add r0, sl, #0x1000
    ldr r4, [r0, #0x9f4]
    mov r0, r4
    bl func_020aaddc
    mov r1, r0
    mov r0, r4
    bl func_02070430
    cmp r0, #0x0
    str r0, [sp, #0x8]
    addle r0, sl, #0x1000
    movle r1, #0x5
    strle r1, [r0, #0x20]
    ble .L_740
    bl func_0207034c
    mov r0, sl
    bl func_02041e18
    cmp r0, #0x0
    addeq r0, sl, #0x1000
    moveq r1, #0x7
    streq r1, [r0, #0x20]
    beq .L_740
    ldr r0, [r7]
    str r0, [r7, #0x4]
    ldr r1, [r7]
    ldr r0, [r7, #0xc]
    add r0, r1, r0
    str r0, [r7, #0x8]
    bl func_020930b0
    mov r6, r0
    mov r0, fp, asr #0x1f
    mov r8, r1
    str r0, [sp, #0x4]
    mov r4, #0x0
.L_5bc:
    ldr r0, _LIT6
    ldr r0, [r0]
    cmp r0, #0x0
    addeq r0, sl, #0x1000
    moveq r1, #0x5
    streq r1, [r0, #0x20]
    beq .L_740
    bl func_0207039c
    str r0, [sp, #0x8]
    cmp r0, #0x0
    blt .L_71c
    cmp r0, #0x0
    ble .L_6a0
    bl func_020930b0
    mov r6, r0
    add r0, sp, #0x8
    mov r8, r1
    bl func_02070a38
    cmp r0, #0x0
    beq .L_71c
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
    bne .L_678
    ldr r0, _LIT7
    add r0, sl, r0
    bl func_020927b8
    add r1, sl, #0x1000
    ldr r2, [r1, #0xa30]
    ldr r0, _LIT7
    add r2, r2, r9
    add r0, sl, r0
    str r2, [r1, #0xa30]
    bl func_02092748
    b .L_684
.L_678:
    mov r0, sl
    bl func_02041ca8
    mov r5, r0
.L_684:
    ldr r0, [sp, #0x8]
    cmp r0, r9
    bls .L_698
    bl func_0207092c
    b .L_71c
.L_698:
    mov r0, r9
    bl func_0207092c
.L_6a0:
    add r0, sl, #0x1000
    ldr r1, [r0, #0xa2c]
    cmp r1, #0x0
    blt .L_6bc
    ldr r0, [r0, #0xa30]
    cmp r0, r1
    bge .L_71c
.L_6bc:
    bl func_020930b0
    subs r2, r0, r6
    sbc r0, r1, r8
    mov r1, r0, lsl #0x6
    orr r1, r1, r2, lsr #0x1a
    mov r0, r2, lsl #0x6
    ldr r2, _LIT8
    mov r3, r4
    bl func_020b3808
    ldr r2, [sp, #0x4]
    cmp r1, r2
    cmpeq r0, fp
    addhi r0, sl, #0x1000
    movhi r1, #0x6
    strhi r1, [r0, #0x20]
    bhi .L_740
    mov r0, sl
    bl func_02041e18
    cmp r0, #0x0
    bne .L_5bc
    add r0, sl, #0x1000
    mov r1, #0x7
    str r1, [r0, #0x20]
    b .L_740
.L_71c:
    bl func_02070c40
    bl func_02070bac
    bl func_02070f24
    bl func_02071010
    add r0, sl, #0x1000
    mov r1, #0x8
    str r1, [r0, #0x20]
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_740:
    bl func_02070c40
    bl func_02070bac
    bl func_02070f24
    bl func_02071010
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00001134
_LIT1: .word 0x00001198
_LIT2: .word 0x00001a04
_LIT3: .word 0x0000ea60
_LIT4: .word func_02041520
_LIT5: .word data_020fe78c
_LIT6: .word data_0219ef1c
_LIT7: .word 0x00001a14
_LIT8: .word 0x000082ea
