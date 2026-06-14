; func_ov006_021c2280 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020fb5c0
        .extern data_020fb980
        .extern data_020fc160
        .extern data_ov006_021cde2c
        .extern data_ov006_0224f448
        .extern data_ov006_0225cb7c
        .extern data_ov006_0225cb88
        .extern data_ov006_0225cbb8
        .extern func_020211c8
        .extern func_020212cc
        .extern func_0202147c
        .extern func_0202227c
        .extern func_ov006_021b5f60
        .extern func_ov006_021b6bac
        .extern func_ov006_021b6be0
        .extern func_ov006_021c31d0
        .extern func_ov006_021c3714
        .extern func_ov006_021c3c78
        .extern func_ov006_021c426c
        .extern func_ov006_021c48e0
        .extern func_ov006_021c4b20
        .extern func_ov006_021c4bd4
        .extern func_ov006_021c4cc4
        .extern func_ov006_021c4ec4
        .global func_ov006_021c2280
        .arm
func_ov006_021c2280:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    mov r0, #0x0
    str r0, [sl, #0x68]
    str r0, [sl, #0x74]
    str r0, [sl, #0x78]
    str r0, [sl, #0x4c]
    ldr r1, [sl, #0x70]
    cmp r1, #0x0
    beq .L_64c
    ldr r1, _LIT0
    ldr r6, _LIT1
    ldr r2, [r1, #0xc]
    ldr r4, _LIT2
    str r2, [r1, #0x94]
    ldr r2, [r1, #0x18]
    str r2, [r1, #0xa0]
    ldr r2, [r1, #0x10]
    str r2, [r1, #0x98]
    ldr r2, [r1, #0x14]
    str r2, [r1, #0x9c]
.L_614:
    add r5, r6, r0, lsl #0x4
    ldr r2, [r5, #0x10]
    add r3, r4, r0, lsl #0x4
    ldr r1, [r5, #0x14]
    str r2, [r3, #0x9c]
    add r0, r0, #0x1
    ldr r2, [r5, #0x18]
    str r1, [r3, #0xa0]
    ldr r1, [r5, #0x1c]
    str r2, [r3, #0xa4]
    str r1, [r3, #0xa8]
    cmp r0, #0x2
    blt .L_614
    b .L_700
.L_64c:
    str r0, [sl, #0x64]
    ldr r1, [sl, #0x58]
    ldr r0, _LIT3
    mov r1, r1, lsl #0x2
    ldrsh r0, [r0, r1]
    mov r7, #0x0
    cmp r0, #0x2
    moveq r9, #0x2
    movne r9, #0x1
    cmp r9, #0x0
    ble .L_700
    ldr fp, _LIT4
    add r8, sl, #0x9c
    mov r5, #0x1
    mov r4, #0x32
    mov r6, r7
.L_68c:
    add r0, sl, r7, lsl #0x4
    str r6, [r0, #0x9c]
    str r6, [r0, #0xa0]
    cmp r7, #0x0
    movne r0, r5
    moveq r0, r6
    cmp r0, #0x0
    addeq r0, sl, r7, lsl #0x4
    streq r4, [r0, #0xa4]
    beq .L_6c8
    mov r0, fp
    mov r1, #0x1
    bl func_ov006_021b6bac
    add r1, sl, r7, lsl #0x4
    str r0, [r1, #0xa4]
.L_6c8:
    add r0, sl, r7, lsl #0x4
    ldr r0, [r0, #0xa4]
    add r7, r7, #0x1
    cmp r0, #0x6
    movgt r2, #0x1
    ldr r0, [r8, #0xc]
    movle r2, #0x0
    bic r1, r0, #0x1
    and r0, r2, #0x1
    orr r0, r1, r0
    str r0, [r8, #0xc]
    cmp r7, r9
    add r8, r8, #0x10
    blt .L_68c
.L_700:
    ldr r0, [sl, #0x8]
    cmp r0, #0x0
    bne .L_71c
    ldr r0, _LIT5
    bl func_020211c8
    str r0, [sl, #0x8]
    bl func_0202147c
.L_71c:
    ldr r0, [sl]
    cmp r0, #0x0
    beq .L_734
    bl func_020212cc
    mov r0, #0x0
    str r0, [sl]
.L_734:
    ldr r0, [sl, #0x4]
    cmp r0, #0x0
    bne .L_750
    ldr r0, _LIT6
    bl func_020211c8
    str r0, [sl, #0x4]
    bl func_0202147c
.L_750:
    ldr r0, [sl, #0xc]
    cmp r0, #0x0
    bne .L_76c
    ldr r0, _LIT7
    bl func_020211c8
    str r0, [sl, #0xc]
    bl func_0202147c
.L_76c:
    mov r6, #0x0
    add r5, sl, #0xbc
    mov r4, r6
.L_778:
    mov r1, r5
    mov r0, r6
    strb r4, [r5], #0x20
    bl func_0202227c
    add r6, r6, #0x1
    cmp r6, #0x7d
    blt .L_778
    ldr r4, _LIT4
    mov r0, r4
    bl func_ov006_021b5f60
    mov r0, sl
    bl func_ov006_021c31d0
    mov r1, #0x1
    mov r0, sl
    mov r2, r1
    mov r3, r1
    bl func_ov006_021c3714
    mov r0, sl
    mov r1, #0x1
    bl func_ov006_021c3c78
    mov r0, sl
    bl func_ov006_021c426c
    mov r0, sl
    bl func_ov006_021c48e0
    mov r0, sl
    bl func_ov006_021c4b20
    mov r0, sl
    bl func_ov006_021c4bd4
    mov r0, sl
    bl func_ov006_021c4cc4
    mov r0, sl
    bl func_ov006_021c4ec4
    ldr r0, [sl, #0x58]
    cmp r0, #0x6
    bne .L_828
    mov r1, #0x7
    mov r0, r4
    str r1, [sl, #0x7c]
    mov r3, #0xc
    mov r1, #0x3
    mov r2, #0x0
    str r3, [sl, #0x80]
    bl func_ov006_021b6be0
    str r0, [sl, #0x84]
.L_828:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov006_0225cb7c
_LIT1: .word data_ov006_0225cb88
_LIT2: .word data_ov006_0225cbb8
_LIT3: .word data_ov006_021cde2c
_LIT4: .word data_ov006_0224f448
_LIT5: .word data_020fb5c0
_LIT6: .word data_020fb980
_LIT7: .word data_020fc160
