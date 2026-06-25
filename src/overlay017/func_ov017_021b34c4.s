; func_ov017_021b34c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020b4728
        .extern data_02102c90
        .extern data_02104f4c
        .extern data_0210594c
        .extern data_ov017_021b7e8c
        .extern data_ov017_021b814c
        .extern data_ov017_021b8994
        .extern data_ov017_021b8a9c
        .extern func_02001bc8
        .extern func_02001d0c
        .extern func_02005088
        .extern func_02006c0c
        .extern Task_Invoke
        .extern func_020117ac
        .extern func_0201d47c
        .extern func_0201e5b8
        .extern func_0202b100
        .extern func_0202c0c0
        .extern Vram_GetBankBaseE
        .extern func_0208e1ac
        .extern func_0208e318
        .extern func_02091554
        .extern func_02094504
        .extern func_02094550
        .extern func_020aadf8
        .extern func_ov017_021b7740
        .global func_ov017_021b34c4
        .arm
func_ov017_021b34c4:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0xb4
    ldr r0, _LIT0
    ldr r0, [r0, #0xa78]
    cmp r0, #0x0
    beq .L_7c
    ldr r3, _LIT1
    ldr r0, _LIT2
    ldrh r1, [r3]
    sub r2, r3, #0x2
    and r1, r1, #0x43
    orr r1, r1, #0x9c00
    strh r1, [r3]
    ldrh r1, [r2]
    and r1, r1, #0x43
    orr r1, r1, #0x9a00
    strh r1, [r2]
    ldrh r1, [r3]
    bic r1, r1, #0x3
    orr r1, r1, #0x2
    strh r1, [r3]
    ldrh r1, [r2]
    bic r1, r1, #0x3
    strh r1, [r2]
    bl func_0202c0c0
    mov r2, r0
    ldr r0, _LIT3
    mov r1, #0x1
    bl func_ov017_021b7740
    add sp, sp, #0xb4
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_7c:
    ldr r4, _LIT4
    ldr r0, _LIT5
    ldrh r2, [r4]
    sub r1, r0, #0x100
    sub r3, r4, #0x2
    and r0, r2, #0x43
    orr r0, r0, #0x208
    orr r0, r0, #0x1c00
    strh r0, [r4]
    ldrh r2, [r3]
    add r0, sp, #0x48
    and r2, r2, #0x43
    orr r1, r2, r1
    strh r1, [r3]
    ldrh r1, [r3]
    bic r1, r1, #0x3
    orr r1, r1, #0x1
    strh r1, [r3]
    bl func_0201d47c
    ldr r0, _LIT6
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    mov r4, #0x40
    ldrh r2, [sp, #0x5c]
    str r0, [sp, #0x48]
    ldr r1, [sp, #0x60]
    bic r0, r2, #0xf
    orr r0, r0, #0x7
    strh r0, [sp, #0x5c]
    ldrh r2, [sp, #0x5c]
    bic r0, r1, #0x7f
    orr r1, r0, #0x2
    bic r3, r2, #0x10
    mov r2, #0x0
    add r0, sp, #0x48
    str r4, [sp, #0x54]
    strh r3, [sp, #0x5c]
    strh r2, [sp, #0x58]
    str r1, [sp, #0x60]
    bl func_0201e5b8
    ldr r0, [sp, #0x48]
    bl Task_Invoke
    mov r1, #0x4
    ldr r0, _LIT7
    mov r2, #0x8
    mov r3, #0xf
    str r1, [sp]
    bl func_0208e318
    bl func_0208e1ac
    add r4, r0, #0x46
    mov r5, #0xb0
    bl Vram_GetBankBaseE
    add r1, r0, #0x1600
    mov r0, #0x0
    mov r2, #0x8c0
    bl func_02094504
    ldr r0, _LIT8
    mov r1, #0xa
    mov r2, #0x7
    bl func_02001d0c
    mov ip, #0x0
    mov r3, ip
.L_178:
    mov lr, r3
.L_17c:
    add r0, r5, #0x1
    mov r1, lr, lsl #0x1
    orr r2, r5, #0x2000
    mov r0, r0, lsl #0x10
    add lr, lr, #0x1
    strh r2, [r4, r1]
    cmp lr, #0xa
    mov r5, r0, lsr #0x10
    blt .L_17c
    add ip, ip, #0x1
    cmp ip, #0x7
    add r4, r4, #0x40
    blt .L_178
    ldr r0, _LIT9
    bl func_0202c0c0
    mov r4, r0
    bl Vram_GetBankBaseE
    mov r2, r0
    mov r3, #0x2
    mov r1, r4
    ldr r0, _LIT8
    str r3, [sp]
    mov r4, #0xc
    add r2, r2, #0x1600
    str r4, [sp, #0x4]
    bl func_02005088
    ldr r0, _LIT10
    bl func_0202c0c0
    mov r4, r0
    bl Vram_GetBankBaseE
    add r2, r0, #0x1600
    mov r0, #0x1a
    str r0, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r0, _LIT8
    mov r1, r4
    mov r3, #0x2
    bl func_02005088
    bl func_0208e1ac
    add r0, r0, #0x6
    add r4, r0, #0x200
    mov r6, #0xf6
    bl Vram_GetBankBaseE
    add r1, r0, #0x1ec0
    mov r0, #0x0
    mov r2, #0x1200
    bl func_02094504
    ldr r0, _LIT8
    mov r1, #0xa
    mov r2, #0x9
    bl func_02001d0c
    mov r5, #0x0
    mov r3, r5
.L_254:
    mov ip, r3
.L_258:
    add r0, r6, #0x1
    mov r1, ip, lsl #0x1
    orr r2, r6, #0x2000
    mov r0, r0, lsl #0x10
    add ip, ip, #0x1
    strh r2, [r4, r1]
    cmp ip, #0xa
    mov r6, r0, lsr #0x10
    blt .L_258
    add r5, r5, #0x1
    cmp r5, #0x9
    add r4, r4, #0x40
    blt .L_254
    ldr r0, _LIT11
    bl func_0202c0c0
    mov r4, r0
    bl Vram_GetBankBaseE
    mov r2, r0
    mov r3, #0x2
    mov r1, r4
    ldr r0, _LIT8
    str r3, [sp]
    mov r4, #0xc
    add r2, r2, #0x1ec0
    str r4, [sp, #0x4]
    bl func_02005088
    ldr r0, _LIT12
    bl func_0202c0c0
    mov r4, r0
    bl Vram_GetBankBaseE
    add r2, r0, #0x1ec0
    mov r0, #0x12
    str r0, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r0, _LIT8
    mov r1, r4
    mov r3, #0x2
    bl func_02005088
    ldr r0, _LIT13
    bl func_0202c0c0
    mov r4, r0
    bl Vram_GetBankBaseE
    add r2, r0, #0x1ec0
    mov r0, #0x2a
    str r0, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r0, _LIT8
    mov r1, r4
    mov r3, #0x2
    bl func_02005088
    ldr r0, _LIT12
    bl func_0202c0c0
    mov r4, r0
    bl Vram_GetBankBaseE
    add r2, r0, #0x1ec0
    mov r0, #0x3a
    str r0, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r0, _LIT8
    mov r1, r4
    mov r3, #0x2
    bl func_02005088
    bl func_0208e1ac
    add r4, r0, #0x5a
    ldr r6, _LIT14
    bl Vram_GetBankBaseE
    add r1, r0, #0x30c0
    mov r0, #0x0
    mov r2, #0xee0
    bl func_02094504
    ldr r0, _LIT8
    mov r1, #0x11
    mov r2, #0x7
    bl func_02001d0c
    mov r5, #0x0
    mov r3, r5
.L_394:
    mov ip, r3
.L_398:
    add r0, r6, #0x1
    mov r1, ip, lsl #0x1
    orr r2, r6, #0x1000
    mov r0, r0, lsl #0x10
    add ip, ip, #0x1
    strh r2, [r4, r1]
    cmp ip, #0x11
    mov r6, r0, lsr #0x10
    blt .L_398
    add r5, r5, #0x1
    cmp r5, #0x7
    add r4, r4, #0x40
    blt .L_394
    ldr ip, _LIT15
    add r5, sp, #0x70
    mov r4, #0x4
.L_3d8:
    ldmia ip!, {r0, r1, r2, r3}
    stmia r5!, {r0, r1, r2, r3}
    subs r4, r4, #0x1
    bne .L_3d8
    ldr r1, [ip]
    ldr r0, _LIT16
    str r1, [r5]
    ldrh r2, [r0, #0xd0]
    cmp r2, #0x0
    bne .L_410
    ldr r0, _LIT17
    bl func_0202c0c0
    mov r4, r0
    b .L_4b4
.L_410:
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    cmp r0, #0x2
    beq .L_444
    cmp r0, #0x3
    bne .L_4a4
    add r1, sp, #0x70
    ldr r0, _LIT18
    ldr r1, [r1, r2, lsl #0x2]
    cmp r1, r0
    bne .L_4a4
.L_444:
    add r0, sp, #0x70
    ldr r0, [r0, r2, lsl #0x2]
    mov r4, #0x0
    bl func_0202b100
    mov r1, r0
    add r0, sp, #0x28
    bl func_020aadf8
    ldrsb r0, [sp, #0x28]
    cmp r0, #0x0
    beq .L_49c
    add r3, sp, #0x28
    mov r1, #0x1
    mov r2, #0xa
.L_478:
    ldrsb r0, [r3]
    cmp r0, #0x20
    bne .L_490
    cmp r4, #0x0
    strneb r2, [r3]
    moveq r4, r1
.L_490:
    ldrsb r0, [r3, #0x1]!
    cmp r0, #0x0
    bne .L_478
.L_49c:
    add r4, sp, #0x28
    b .L_4b4
.L_4a4:
    add r0, sp, #0x70
    ldr r0, [r0, r2, lsl #0x2]
    bl func_0202b100
    mov r4, r0
.L_4b4:
    bl Vram_GetBankBaseE
    mov r3, r0
    mov r2, #0x1a
    mov r1, r4
    str r2, [sp]
    mov r4, #0xc
    add r2, r3, #0x30c0
    ldr r0, _LIT8
    mov r3, #0x1
    str r4, [sp, #0x4]
    bl func_02005088
    ldr r0, _LIT19
    bl func_0202c0c0
    ldr r2, _LIT0
    mov r1, r0
    ldr r2, [r2, #0xa60]
    add r0, sp, #0x28
    bl func_02091554
    bl Vram_GetBankBaseE
    mov r3, #0x2
    add r2, r0, #0x30c0
    str r3, [sp]
    mov r0, r4
    str r0, [sp, #0x4]
    ldr r0, _LIT8
    add r1, sp, #0x28
    bl func_02005088
    ldr r5, _LIT20
    bl Vram_GetBankBaseE
    add r0, r0, #0xfa0
    add r1, r0, #0x3000
    mov r0, #0x0
    mov r2, #0x1200
    bl func_02094504
    bl func_0208e1ac
    add r0, r0, #0x1a
    add r4, r0, #0x200
    ldr r0, _LIT8
    mov r1, #0x10
    mov r2, #0x9
    bl func_02001d0c
    mov ip, #0x0
    mov r3, ip
.L_560:
    mov lr, r3
.L_564:
    add r0, r5, #0x1
    mov r1, lr, lsl #0x1
    orr r2, r5, #0x1000
    mov r0, r0, lsl #0x10
    add lr, lr, #0x1
    strh r2, [r4, r1]
    cmp lr, #0x10
    mov r5, r0, lsr #0x10
    blt .L_564
    add ip, ip, #0x1
    cmp ip, #0x9
    add r4, r4, #0x40
    blt .L_560
    ldr r0, _LIT21
    bl func_0202c0c0
    ldr r2, _LIT22
    mov r1, r0
    ldrh r2, [r2, #0x52]
    add r0, sp, #0x28
    bl func_02091554
    bl Vram_GetBankBaseE
    add r0, r0, #0xfa0
    mov r3, #0x2
    add r2, r0, #0x3000
    str r3, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r0, _LIT8
    add r1, sp, #0x28
    bl func_02005088
    ldr r0, _LIT22
    ldrh r0, [r0, #0x52]
    cmp r0, #0x63
    movcs r4, #0x0
    bcs .L_600
    bl func_020117ac
    ldr r1, _LIT0
    ldr r1, [r1, #0xa54]
    sub r4, r0, r1
.L_600:
    ldr r0, _LIT23
    bl func_0202c0c0
    mov r1, r0
    add r0, sp, #0x28
    mov r2, r4
    bl func_02091554
    bl Vram_GetBankBaseE
    add r1, r0, #0xfa0
    mov r0, #0x12
    str r0, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    add r2, r1, #0x3000
    ldr r0, _LIT8
    add r1, sp, #0x28
    mov r3, #0x2
    bl func_02005088
    ldr r0, _LIT21
    bl func_0202c0c0
    ldr r2, _LIT22
    mov r1, r0
    ldrh r2, [r2, #0x58]
    add r0, sp, #0x28
    bl func_02091554
    bl Vram_GetBankBaseE
    add r0, r0, #0xfa0
    add r2, r0, #0x3000
    mov r0, #0x2a
    str r0, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r0, _LIT8
    add r1, sp, #0x28
    mov r3, #0x2
    bl func_02005088
    ldr r0, _LIT22
    ldrh r0, [r0, #0x58]
    cmp r0, #0x63
    movcs r4, #0x0
    bcs .L_6b0
    bl func_020117ac
    ldr r1, _LIT0
    ldr r1, [r1, #0xa5c]
    sub r4, r0, r1
.L_6b0:
    ldr r0, _LIT23
    bl func_0202c0c0
    mov r1, r0
    add r0, sp, #0x28
    mov r2, r4
    bl func_02091554
    bl Vram_GetBankBaseE
    add r1, r0, #0xfa0
    mov r0, #0x3a
    str r0, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    add r2, r1, #0x3000
    ldr r0, _LIT8
    add r1, sp, #0x28
    mov r3, #0x2
    bl func_02005088
    ldr r0, _LIT24
    ldr r1, _LIT25
    mov r2, #0x20
    bl func_02094550
    ldr r1, _LIT26
    add r0, sp, #0x8
    mov r2, #0x0
    bl func_02001bc8
    ldr r1, _LIT27
    add r0, sp, #0x8
    mov r2, #0x20
    bl func_02094550
    ldr r1, _LIT28
    add r0, sp, #0x8
    mov r2, #0x20
    bl func_02094550
    ldr r1, _LIT1
    ldrh r0, [r1]
    sub r2, r1, #0xa
    bic r0, r0, #0x3
    strh r0, [r1]
    ldr r1, [r2]
    ldr r0, [r2]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0x6
    orr r0, r1, r0, lsl #0x8
    str r0, [r2]
    add sp, sp, #0xb4
    ldmia sp!, {r3, r4, r5, r6, pc}
_LIT0: .word data_02104f4c
_LIT1: .word 0x0400100a
_LIT2: .word 0x000006d1
_LIT3: .word data_ov017_021b8a9c
_LIT4: .word 0x0400100c
_LIT5: .word 0x00001e08
_LIT6: .word data_ov017_021b814c
_LIT7: .word 0x04001050
_LIT8: .word data_02102c90
_LIT9: .word 0x000006c4
_LIT10: .word 0x000006c5
_LIT11: .word 0x000006c6
_LIT12: .word 0x000006c8
_LIT13: .word 0x000006c7
_LIT14: .word 0x00000186
_LIT15: .word data_ov017_021b7e8c
_LIT16: .word data_ov017_021b8994
_LIT17: .word 0x0000079f
_LIT18: .word 0x00001757
_LIT19: .word 0x000006c9
_LIT20: .word 0x000001fd
_LIT21: .word 0x000006ca
_LIT22: .word data_0210594c
_LIT23: .word 0x000006cb
_LIT24: .word data_020b4728
_LIT25: .word 0x05000420
_LIT26: .word 0x000003ff
_LIT27: .word 0x05000440
_LIT28: .word 0x05000640
