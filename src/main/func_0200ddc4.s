; func_0200ddc4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02186ae8
        .extern func_0200dd58
        .extern func_0200f13c
        .extern func_0200f2ac
        .extern func_0200f4b4
        .extern func_0200f684
        .global func_0200ddc4
        .arm
func_0200ddc4:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xc
    ldr r1, _LIT0
    mov r0, #0x0
    str r0, [sp, #0x8]
    ldr r0, [r1, #0xc]
    cmp r0, #0x0
    addle sp, sp, #0xc
    ldmleia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, [sp, #0x8]
    str r0, [sp, #0x4]
.L_e68:
    ldr r0, _LIT0
    ldr r1, [r0, #0x14]
    ldr r0, [sp, #0x4]
    add r4, r1, r0
    ldr r0, [r4, #0x60]
    mov r0, r0, lsl #0x1c
    movs r0, r0, lsr #0x1f
    beq .L_e90
    mov r0, r4
    bl func_0200dd58
.L_e90:
    ldr r0, [r4, #0x27c]
    cmp r0, #0x0
    beq .L_eac
    ldr r0, [r0, #0x60]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    bne .L_19f4
.L_eac:
    ldr r0, [r4, #0x60]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    bne .L_19f4
    mov r2, #0x0
    mov r0, r4
    sub r3, r2, #0x1
    mov r1, #0x7
    bl func_0200f2ac
    mov r2, #0x0
    mov r0, r4
    sub r3, r2, #0x1
    mov r1, #0x7
    bl func_0200f13c
    mov r2, #0x0
    mov r0, r4
    sub r3, r2, #0x1
    mov r1, #0x7
    bl func_0200f4b4
    mov r0, r4
    mov r1, #0x7
    mov r2, #0x0
    sub r3, r2, #0x1
    bl func_0200f684
    ldr r2, [r4, #0x80]
    cmp r2, #0x0
    beq .L_1044
    ldr r3, [r4, #0x84]
    mov r0, r3, lsl #0x1f
    movs r0, r0, asr #0x1f
    beq .L_1044
    mov r1, r3, lsl #0xa
    mov r0, r3, lsl #0x1e
    mov r1, r1, asr #0x10
    movs r0, r0, asr #0x1f
    ldr r0, [r2]
    bne .L_f4c
    mov r2, r3, lsl #0x1c
    movs r2, r2, asr #0x1f
    beq .L_f9c
.L_f4c:
    ldr r5, [r4, #0x84]
    ldr r2, _LIT1
    add r3, r1, #0x1
    and r5, r5, r2
    mov r3, r3, lsl #0x10
    orr r5, r5, r3, lsr #0xa
    mov r3, r5, lsl #0xa
    str r5, [r4, #0x84]
    cmp r0, r3, asr #0x10
    bgt .L_1010
    mov r0, r5, lsl #0x1a
    movs r0, r0, asr #0x1f
    andne r0, r5, r2
    strne r0, [r4, #0x84]
    bne .L_1010
    and r2, r5, r2
    mov r0, r1, lsl #0x10
    orr r0, r2, r0, lsr #0xa
    str r0, [r4, #0x84]
    b .L_1010
.L_f9c:
    mov r2, r3, lsl #0x1d
    movs r2, r2, asr #0x1f
    bne .L_fb4
    mov r2, r3, lsl #0x1b
    movs r2, r2, asr #0x1f
    beq .L_1010
.L_fb4:
    ldr r5, [r4, #0x84]
    ldr r2, _LIT1
    sub r3, r1, #0x1
    and r5, r5, r2
    mov r3, r3, lsl #0x10
    orr r5, r5, r3, lsr #0xa
    mov r3, r5, lsl #0xa
    str r5, [r4, #0x84]
    movs r3, r3, asr #0x10
    bpl .L_1010
    mov r3, r5, lsl #0x1a
    movs r3, r3, asr #0x1f
    beq .L_1000
    sub r0, r0, #0x1
    and r1, r5, r2
    mov r0, r0, lsl #0x10
    orr r0, r1, r0, lsr #0xa
    str r0, [r4, #0x84]
    b .L_1010
.L_1000:
    and r2, r5, r2
    mov r0, r1, lsl #0x10
    orr r0, r2, r0, lsr #0xa
    str r0, [r4, #0x84]
.L_1010:
    ldr r0, [r4, #0x84]
    mov r1, r0, lsl #0x1c
    movs r1, r1, asr #0x1f
    bne .L_102c
    mov r0, r0, lsl #0x1b
    movs r0, r0, asr #0x1f
    beq .L_1044
.L_102c:
    ldr r0, [r4, #0x84]
    bic r0, r0, #0x2
    bic r1, r0, #0x4
    bic r0, r1, #0x8
    bic r0, r0, #0x10
    str r0, [r4, #0x84]
.L_1044:
    ldr r1, [r4, #0x90]
    cmp r1, #0x0
    beq .L_1238
    ldr r0, [r1]
    mov r2, #0x0
    cmp r0, #0x0
    bls .L_1238
    ldr sl, _LIT2
    mov r7, r2
    mov lr, r2
.L_106c:
    ldr r0, [r1, #0x4]
    ldr r1, [r4, #0x94]
    ldr r5, [r0, r2, lsl #0x2]
    add r3, r1, r7
    cmp r5, #0x0
    ldrne r0, [r5]
    cmpne r0, #0x0
    beq .L_1220
    ldr r0, [r3]
    mov r0, r0, lsl #0x19
    movs r0, r0, asr #0x1f
    bne .L_1220
    mov r1, lr
    add r8, r3, #0x4
.L_10a4:
    ldr r6, [r8]
    ldr r0, [r3]
    ldr fp, [r5, #0xc]
    mov r9, r6, lsl #0xc
    ldr r6, [fp, r1, lsl #0x2]
    mov r9, r9, asr #0x16
    mov fp, r0, lsl #0x1e
    movs fp, fp, asr #0x1f
    bne .L_10d4
    mov r0, r0, lsl #0x1c
    movs r0, r0, asr #0x1f
    beq .L_10ec
.L_10d4:
    ldr r0, [r8]
    add fp, r9, #0x1
    and r0, r0, sl
    mov fp, fp, lsl #0x16
    orr r0, r0, fp, lsr #0xc
    str r0, [r8]
.L_10ec:
    ldr r0, [r3]
    mov fp, r0, lsl #0x1d
    movs fp, fp, asr #0x1f
    bne .L_1108
    mov r0, r0, lsl #0x1b
    movs r0, r0, asr #0x1f
    beq .L_1128
.L_1108:
    ldr fp, [r8]
    and r0, fp, sl
    mov fp, fp, lsl #0xc
    mov fp, fp, asr #0x16
    sub fp, fp, #0x1
    mov fp, fp, lsl #0x16
    orr r0, r0, fp, lsr #0xc
    str r0, [r8]
.L_1128:
    ldr r0, [r8]
    mov fp, r0, lsl #0xc
    movs fp, fp, asr #0x16
    bpl .L_117c
    ldr fp, [r3]
    mov fp, fp, lsl #0x1a
    movs fp, fp, asr #0x1f
    beq .L_116c
    and r0, r0, sl
    ldrh ip, [r6]
    ldrh fp, [r6, #0x2]
    mul fp, ip, fp
    sub fp, fp, #0x1
    mov fp, fp, lsl #0x16
    orr r0, r0, fp, lsr #0xc
    str r0, [r8]
    b .L_117c
.L_116c:
    and fp, r0, sl
    mov r0, r9, lsl #0x16
    orr r0, fp, r0, lsr #0xc
    str r0, [r8]
.L_117c:
    ldrh r0, [r6]
    ldrh fp, [r6, #0x2]
    ldr r6, [r8]
    mul fp, r0, fp
    mov r0, r6, lsl #0xc
    cmp fp, r0, asr #0x16
    bgt .L_11c0
    ldr r0, [r3]
    mov r0, r0, lsl #0x1a
    movs r0, r0, asr #0x1f
    andne r0, r6, sl
    strne r0, [r8]
    bne .L_11c0
    and r6, r6, sl
    mov r0, r9, lsl #0x16
    orr r0, r6, r0, lsr #0xc
    str r0, [r8]
.L_11c0:
    add r1, r1, #0x1
    cmp r1, #0xd
    add r8, r8, #0x4
    blt .L_10a4
    ldr r0, [r3]
    orr r1, r0, #0x40
    mov r0, r1, lsl #0x1c
    str r1, [r3]
    movs r0, r0, asr #0x1f
    beq .L_11fc
    bic r0, r1, #0x8
    bic r1, r0, #0x2
    bic r0, r1, #0x10
    bic r0, r0, #0x4
    str r0, [r3]
.L_11fc:
    ldr r0, [r3]
    mov r1, r0, lsl #0x1b
    movs r1, r1, asr #0x1f
    beq .L_1220
    bic r0, r0, #0x8
    bic r1, r0, #0x2
    bic r0, r1, #0x10
    bic r0, r0, #0x4
    str r0, [r3]
.L_1220:
    ldr r1, [r4, #0x90]
    add r2, r2, #0x1
    ldr r0, [r1]
    add r7, r7, #0x38
    cmp r2, r0
    bcc .L_106c
.L_1238:
    ldr r0, [r4, #0x88]
    cmp r0, #0x0
    beq .L_146c
    ldr r8, [r0, #0x4]
    cmp r8, #0x0
    beq .L_19f4
    ldr r1, [r0]
    mov r0, #0x0
    cmp r1, #0x0
    bls .L_146c
    str r0, [sp]
    mov fp, #0x1
    mov r3, r0
    mov ip, r0
.L_1270:
    ldr r2, [r8, r0, lsl #0x2]
    ldr r5, [r4, #0x8c]
    ldr r1, [sp]
    cmp r2, #0x0
    add r9, r5, r1
    ldrne r1, [r2]
    cmpne r1, #0x0
    beq .L_144c
    ldr r1, [r9]
    mov r2, r1, lsl #0x9
    movs r2, r2, asr #0x1f
    bne .L_144c
    mov r1, r1, lsl #0x1f
    movs r1, r1, asr #0x1f
    beq .L_144c
    mov r1, #0x0
.L_12b0:
    ldr r5, [r9]
    mov r2, r5, lsl #0x1e
    movs r2, r2, asr #0x1f
    bne .L_12cc
    mov r2, r5, lsl #0x1c
    movs r2, r2, asr #0x1f
    beq .L_1350
.L_12cc:
    add r7, r9, r1, lsl #0x2
    ldrsh r6, [r7, #0x4]
    ldrsh r5, [r7, #0x6]
    add r2, r6, #0x1
    strh r2, [r7, #0x4]
    ldrsh lr, [r7, #0x4]
    ldr r2, [r8, r0, lsl #0x2]
    ldrsh sl, [r7, #0x6]
    ldr r2, [r2, #0x8]
    ldr r2, [r2, r1, lsl #0x2]
    mov sl, sl, lsl #0x1
    ldr r2, [r2, #0xc]
    ldrh r2, [r2, sl]
    cmp lr, r2
    blt .L_1404
    strh ip, [r7, #0x4]
    ldrsh r2, [r7, #0x6]
    add r2, r2, #0x1
    strh r2, [r7, #0x6]
    ldrsh r2, [r7, #0x6]
    ldr sl, [r8, r0, lsl #0x2]
    ldr sl, [sl, #0x8]
    ldr sl, [sl, r1, lsl #0x2]
    ldr sl, [sl]
    cmp r2, sl
    bcc .L_1404
    ldr r2, [r9]
    mov r2, r2, lsl #0x1a
    movs r2, r2, asr #0x1f
    strneh ip, [r7, #0x6]
    streqh r6, [r7, #0x4]
    streqh r5, [r7, #0x6]
    b .L_1404
.L_1350:
    mov r2, r5, lsl #0x1d
    movs r2, r2, asr #0x1f
    bne .L_1368
    mov r2, r5, lsl #0x1b
    movs r2, r2, asr #0x1f
    beq .L_1404
.L_1368:
    add r2, r9, r1, lsl #0x2
    ldrsh r6, [r2, #0x4]
    mov r5, r3
    ldrsh r7, [r2, #0x6]
    sub sl, r6, #0x1
    strh sl, [r2, #0x4]
    ldrsh sl, [r2, #0x4]
    cmp sl, #0x0
    bge .L_1404
    ldrsh sl, [r2, #0x6]
    sub sl, sl, #0x1
    strh sl, [r2, #0x6]
    ldrsh sl, [r2, #0x6]
    cmp sl, #0x0
    bge .L_13c0
    mov r5, fp
    ldr sl, [r8, r0, lsl #0x2]
    ldr sl, [sl, #0x8]
    ldr sl, [sl, r1, lsl #0x2]
    ldr sl, [sl]
    sub sl, sl, #0x1
    strh sl, [r2, #0x6]
.L_13c0:
    ldr r2, [r8, r0, lsl #0x2]
    add sl, r9, r1, lsl #0x2
    ldr r2, [r2, #0x8]
    ldrsh lr, [sl, #0x6]
    ldr r2, [r2, r1, lsl #0x2]
    ldr r2, [r2, #0xc]
    mov lr, lr, lsl #0x1
    ldrh r2, [r2, lr]
    sub r2, r2, #0x1
    strh r2, [sl, #0x4]
    ldr r2, [r9]
    mov r2, r2, lsl #0x1a
    movs r2, r2, asr #0x1f
    bne .L_1404
    cmp r5, #0x0
    strneh r6, [sl, #0x4]
    strneh r7, [sl, #0x6]
.L_1404:
    add r1, r1, #0x1
    cmp r1, #0x5
    blt .L_12b0
    ldr r1, [r9]
    orr r2, r1, #0x400000
    mov r1, r2, lsl #0x1c
    str r2, [r9]
    movs r1, r1, asr #0x1f
    bne .L_1434
    mov r1, r2, lsl #0x1b
    movs r1, r1, asr #0x1f
    beq .L_144c
.L_1434:
    ldr r1, [r9]
    bic r1, r1, #0x8
    bic r2, r1, #0x10
    bic r1, r2, #0x2
    bic r1, r1, #0x4
    str r1, [r9]
.L_144c:
    ldr r1, [r4, #0x88]
    add r0, r0, #0x1
    ldr r2, [r1]
    ldr r1, [sp]
    cmp r0, r2
    add r1, r1, #0x18
    str r1, [sp]
    bcc .L_1270
.L_146c:
    ldr r8, [r4, #0x98]
    cmp r8, #0x0
    beq .L_1730
    ldr r1, [r8]
    mov r0, #0x0
    cmp r1, #0x0
    bls .L_1730
    ldr r2, _LIT3
    ldr r5, _LIT4
    sub r1, r2, #0x100000
    mov sl, r0
    mov lr, r1
    mov r3, r1
.L_14a0:
    ldr r7, [r4, #0xa0]
    ldr r8, [r8, #0x4]
    ldr r6, [r7, sl]
    ldr r8, [r8, r0, lsl #0x2]
    add r9, r7, sl
    mov r7, r6, lsl #0x1f
    movs r7, r7, asr #0x1f
    beq .L_1718
    mov r7, r6, lsl #0x19
    movs r7, r7, asr #0x1f
    bne .L_1718
    cmp r8, #0x0
    beq .L_16dc
    mov r7, r6, lsl #0x1e
    movs r7, r7, asr #0x1f
    bne .L_14ec
    mov r7, r6, lsl #0x1c
    movs r7, r7, asr #0x1f
    beq .L_15c4
.L_14ec:
    ldr r7, [r9, #0x4]
    and r6, r7, r5
    mov r7, r7, lsl #0x2
    mov r7, r7, asr #0x16
    add r7, r7, #0x1
    mov r7, r7, lsl #0x16
    orr r6, r6, r7, lsr #0x2
    str r6, [r9, #0x4]
    ldrh r7, [r8, #0x4]
    mov r6, r6, lsl #0x16
    mov fp, r6, asr #0x16
    sub r7, r7, #0x1
    cmp r7, r6, asr #0x16
    ldrleh ip, [r8, #0x6]
    ble .L_1534
    ldr r6, [r8, #0x10]
    add r6, r6, fp, lsl #0x1
    ldrh ip, [r6, #0x2]
.L_1534:
    ldr r6, [r9, #0x4]
    mov r7, r6, lsl #0x2
    cmp ip, r7, asr #0x16
    bgt .L_16dc
    add r7, fp, #0x1
    and r6, r6, r5, asr #0x14
    and r7, r7, r2
    orr r6, r6, r7
    and r7, r6, r3
    str r7, [r9, #0x4]
    ldrh r8, [r8, #0x4]
    mov r6, r7, lsl #0x16
    cmp r8, r6, asr #0x16
    bgt .L_16dc
    sub r6, r8, #0x1
    and r7, r7, r5, asr #0x14
    and r6, r6, r2
    orr r6, r7, r6
    str r6, [r9, #0x4]
    ldr r6, [r9]
    mov r6, r6, lsl #0x1a
    movs r6, r6, asr #0x1f
    ldr r6, [r9, #0x4]
    beq .L_15a4
    and r6, r6, r5
    and r6, r6, r5, asr #0x14
    str r6, [r9, #0x4]
    b .L_16dc
.L_15a4:
    mov r7, r6, lsl #0x2
    mov r7, r7, asr #0x16
    sub r7, r7, #0x1
    and r6, r6, r5
    mov r7, r7, lsl #0x16
    orr r6, r6, r7, lsr #0x2
    str r6, [r9, #0x4]
    b .L_16dc
.L_15c4:
    mov r7, r6, lsl #0x1d
    movs r7, r7, asr #0x1f
    bne .L_15dc
    mov r6, r6, lsl #0x1b
    movs r6, r6, asr #0x1f
    beq .L_16dc
.L_15dc:
    ldr r7, [r9, #0x4]
    and r6, r7, r1
    mov r7, r7, lsl #0xc
    mov r7, r7, asr #0x16
    sub r7, r7, #0x1
    mov r7, r7, lsl #0x16
    orr r7, r6, r7, lsr #0xc
    and r6, r7, r5
    mov r7, r7, lsl #0x2
    mov r7, r7, asr #0x16
    sub r7, r7, #0x1
    mov r7, r7, lsl #0x16
    orr r6, r6, r7, lsr #0x2
    str r6, [r9, #0x4]
    mov r6, r6, lsl #0x16
    mov fp, r6, asr #0x16
    cmp fp, #0x0
    movle ip, #0x0
    ble .L_1634
    ldr r7, [r8, #0x10]
    mov r6, fp, lsl #0x1
    ldrh ip, [r7, r6]
.L_1634:
    ldr r6, [r9, #0x4]
    mov r7, r6, lsl #0x2
    cmp ip, r7, asr #0x16
    ble .L_16dc
    sub r7, fp, #0x1
    and r6, r6, r5, asr #0x14
    and r7, r7, r2
    orr r7, r6, r7
    mov r6, r7, lsl #0x16
    str r7, [r9, #0x4]
    movs r6, r6, asr #0x16
    bpl .L_16d0
    and r6, r7, r5, asr #0x14
    str r6, [r9, #0x4]
    ldr r6, [r9]
    mov r6, r6, lsl #0x1a
    movs r6, r6, asr #0x1f
    beq .L_16b0
    ldrh r6, [r8, #0x6]
    ldr r7, [r9, #0x4]
    and r7, r7, r5
    mov r6, r6, lsl #0x16
    orr r6, r7, r6, lsr #0x2
    str r6, [r9, #0x4]
    ldrh r7, [r8, #0x4]
    and r6, r6, r5, asr #0x14
    sub r7, r7, #0x1
    and r7, r7, r2
    orr r6, r6, r7
    str r6, [r9, #0x4]
    b .L_16d0
.L_16b0:
    ldr r6, [r9, #0x4]
    mov r7, r6, lsl #0x2
    and r6, r6, r5
    mov r7, r7, asr #0x16
    add r7, r7, #0x1
    mov r7, r7, lsl #0x16
    orr r6, r6, r7, lsr #0x2
    str r6, [r9, #0x4]
.L_16d0:
    ldr r6, [r9, #0x4]
    and r6, r6, lr
    str r6, [r9, #0x4]
.L_16dc:
    ldr r6, [r9]
    orr r7, r6, #0x40
    mov r6, r7, lsl #0x1c
    str r7, [r9]
    movs r6, r6, asr #0x1f
    bne .L_1700
    mov r6, r7, lsl #0x1b
    movs r6, r6, asr #0x1f
    beq .L_1718
.L_1700:
    ldr r6, [r9]
    bic r6, r6, #0x8
    bic r6, r6, #0x10
    bic r6, r6, #0x2
    bic r6, r6, #0x4
    str r6, [r9]
.L_1718:
    ldr r8, [r4, #0x98]
    add r0, r0, #0x1
    ldr r6, [r8]
    add sl, sl, #0x8
    cmp r0, r6
    bcc .L_14a0
.L_1730:
    ldr r7, [r4, #0xa4]
    cmp r7, #0x0
    beq .L_19f4
    ldr r0, [r7]
    mov r8, #0x0
    cmp r0, #0x0
    bls .L_19f4
    ldr r1, _LIT3
    ldr r3, _LIT4
    sub r0, r1, #0x100000
    mov sl, r8
    mov lr, r0
    mov r2, r0
.L_1764:
    ldr r6, [r4, #0xa8]
    ldr r7, [r7, #0x4]
    ldr r5, [r6, sl]
    ldr r7, [r7, r8, lsl #0x2]
    add r9, r6, sl
    mov r6, r5, lsl #0x1f
    movs r6, r6, asr #0x1f
    beq .L_19dc
    mov r6, r5, lsl #0x19
    movs r6, r6, asr #0x1f
    bne .L_19dc
    cmp r7, #0x0
    beq .L_19a0
    mov r6, r5, lsl #0x1e
    movs r6, r6, asr #0x1f
    bne .L_17b0
    mov r6, r5, lsl #0x1c
    movs r6, r6, asr #0x1f
    beq .L_1888
.L_17b0:
    ldr r6, [r9, #0x4]
    and r5, r6, r3
    mov r6, r6, lsl #0x2
    mov r6, r6, asr #0x16
    add r6, r6, #0x1
    mov r6, r6, lsl #0x16
    orr r5, r5, r6, lsr #0x2
    str r5, [r9, #0x4]
    ldrh r6, [r7, #0x4]
    mov r5, r5, lsl #0x16
    mov fp, r5, asr #0x16
    sub r6, r6, #0x1
    cmp r6, r5, asr #0x16
    ldrleh ip, [r7, #0x6]
    ble .L_17f8
    ldr r5, [r7, #0xc]
    add r5, r5, fp, lsl #0x1
    ldrh ip, [r5, #0x2]
.L_17f8:
    ldr r5, [r9, #0x4]
    mov r6, r5, lsl #0x2
    cmp ip, r6, asr #0x16
    bgt .L_19a0
    add r6, fp, #0x1
    and r5, r5, r3, asr #0x14
    and r6, r6, r1
    orr r5, r5, r6
    and r6, r5, r2
    str r6, [r9, #0x4]
    ldrh r7, [r7, #0x4]
    mov r5, r6, lsl #0x16
    cmp r7, r5, asr #0x16
    bgt .L_19a0
    sub r5, r7, #0x1
    and r6, r6, r3, asr #0x14
    and r5, r5, r1
    orr r5, r6, r5
    str r5, [r9, #0x4]
    ldr r5, [r9]
    mov r5, r5, lsl #0x1a
    movs r5, r5, asr #0x1f
    ldr r5, [r9, #0x4]
    beq .L_1868
    and r5, r5, r3
    and r5, r5, r3, asr #0x14
    str r5, [r9, #0x4]
    b .L_19a0
.L_1868:
    mov r6, r5, lsl #0x2
    mov r6, r6, asr #0x16
    sub r6, r6, #0x1
    and r5, r5, r3
    mov r6, r6, lsl #0x16
    orr r5, r5, r6, lsr #0x2
    str r5, [r9, #0x4]
    b .L_19a0
.L_1888:
    mov r6, r5, lsl #0x1d
    movs r6, r6, asr #0x1f
    bne .L_18a0
    mov r5, r5, lsl #0x1b
    movs r5, r5, asr #0x1f
    beq .L_19a0
.L_18a0:
    ldr r6, [r9, #0x4]
    and r5, r6, r0
    mov r6, r6, lsl #0xc
    mov r6, r6, asr #0x16
    sub r6, r6, #0x1
    mov r6, r6, lsl #0x16
    orr r6, r5, r6, lsr #0xc
    and r5, r6, r3
    mov r6, r6, lsl #0x2
    mov r6, r6, asr #0x16
    sub r6, r6, #0x1
    mov r6, r6, lsl #0x16
    orr r5, r5, r6, lsr #0x2
    str r5, [r9, #0x4]
    mov r5, r5, lsl #0x16
    mov fp, r5, asr #0x16
    cmp fp, #0x0
    movle ip, #0x0
    ble .L_18f8
    ldr r6, [r7, #0xc]
    mov r5, fp, lsl #0x1
    ldrh ip, [r6, r5]
.L_18f8:
    ldr r5, [r9, #0x4]
    mov r6, r5, lsl #0x2
    cmp ip, r6, asr #0x16
    ble .L_19a0
    sub r6, fp, #0x1
    and r5, r5, r3, asr #0x14
    and r6, r6, r1
    orr r6, r5, r6
    mov r5, r6, lsl #0x16
    str r6, [r9, #0x4]
    movs r5, r5, asr #0x16
    bpl .L_1994
    and r5, r6, r3, asr #0x14
    str r5, [r9, #0x4]
    ldr r5, [r9]
    mov r5, r5, lsl #0x1a
    movs r5, r5, asr #0x1f
    beq .L_1974
    ldrh r5, [r7, #0x6]
    ldr r6, [r9, #0x4]
    and r6, r6, r3
    mov r5, r5, lsl #0x16
    orr r5, r6, r5, lsr #0x2
    str r5, [r9, #0x4]
    ldrh r6, [r7, #0x4]
    and r5, r5, r3, asr #0x14
    sub r6, r6, #0x1
    and r6, r6, r1
    orr r5, r5, r6
    str r5, [r9, #0x4]
    b .L_1994
.L_1974:
    ldr r5, [r9, #0x4]
    mov r6, r5, lsl #0x2
    and r5, r5, r3
    mov r6, r6, asr #0x16
    add r6, r6, #0x1
    mov r6, r6, lsl #0x16
    orr r5, r5, r6, lsr #0x2
    str r5, [r9, #0x4]
.L_1994:
    ldr r5, [r9, #0x4]
    and r5, r5, lr
    str r5, [r9, #0x4]
.L_19a0:
    ldr r5, [r9]
    orr r6, r5, #0x40
    mov r5, r6, lsl #0x1c
    str r6, [r9]
    movs r5, r5, asr #0x1f
    bne .L_19c4
    mov r5, r6, lsl #0x1b
    movs r5, r5, asr #0x1f
    beq .L_19dc
.L_19c4:
    ldr r5, [r9]
    bic r5, r5, #0x8
    bic r5, r5, #0x10
    bic r5, r5, #0x2
    bic r5, r5, #0x4
    str r5, [r9]
.L_19dc:
    ldr r7, [r4, #0xa4]
    add r8, r8, #0x1
    ldr r5, [r7]
    add sl, sl, #0x8
    cmp r8, r5
    bcc .L_1764
.L_19f4:
    ldr r0, [sp, #0x8]
    ldr r1, _LIT0
    add r0, r0, #0x1
    str r0, [sp, #0x8]
    ldr r0, [sp, #0x4]
    ldr r1, [r1, #0xc]
    add r0, r0, #0x284
    str r0, [sp, #0x4]
    ldr r0, [sp, #0x8]
    cmp r0, r1
    blt .L_e68
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_02186ae8
_LIT1: .word 0xffc0003f
_LIT2: .word 0xfff003ff
_LIT3: .word 0x000003ff
_LIT4: .word 0xc00fffff
