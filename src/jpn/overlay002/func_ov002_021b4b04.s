; func_ov002_021b4b04 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_021b4b04
        .extern func_ov002_021c8390
        .extern func_ov002_0223dda4
        .extern func_ov002_022578c0
        .global func_ov002_021b4b04
        .arm
func_ov002_021b4b04:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov r4, r0
    ldrh r3, [r4]
    ldr r2, _LIT0
    cmp r3, r2
    bgt .L_5a8
    bge .L_b24
    ldr r1, _LIT1
    cmp r3, r1
    bgt .L_2ec
    bge .L_b24
    sub r0, r1, #0x15c
    cmp r3, r0
    bgt .L_1c4
    bge .L_b24
    ldr r0, _LIT2
    cmp r3, r0
    bgt .L_11c
    bge .L_b24
    sub r1, r0, #0xb6
    cmp r3, r1
    bgt .L_ac
    sub r0, r0, #0xb6
    cmp r3, r0
    bge .L_b24
    sub r0, r2, #0x5e0
    cmp r3, r0
    bgt .L_9c
    ldr r0, _LIT3
    cmp r3, r0
    blt .L_8c
    addne r0, r0, #0x1
    cmpne r3, r0
    beq .L_b24
    b .L_d80
.L_8c:
    sub r0, r0, #0xd8
    cmp r3, r0
    beq .L_b24
    b .L_d80
.L_9c:
    sub r0, r2, #0x590
    cmp r3, r0
    beq .L_b24
    b .L_d80
.L_ac:
    sub r1, r0, #0x1d
    cmp r3, r1
    bgt .L_cc
    bge .L_b24
    sub r0, r0, #0xb5
    cmp r3, r0
    beq .L_b24
    b .L_d80
.L_cc:
    sub r1, r0, #0x12
    cmp r3, r1
    bgt .L_10c
    sub r0, r0, #0x1a
    subs r0, r3, r0
    addpl pc, pc, r0, lsl #0x2
    b .L_d80
    b .L_b24
    b .L_d80
    b .L_d80
    b .L_d80
    b .L_b24
    b .L_b2c
    b .L_b24
    b .L_b24
    b .L_b24
.L_10c:
    ldr r0, _LIT4
    cmp r3, r0
    beq .L_b24
    b .L_d80
.L_11c:
    add r1, r0, #0x94
    cmp r3, r1
    bgt .L_178
    bge .L_b24
    add r1, r0, #0x61
    cmp r3, r1
    bgt .L_14c
    bge .L_b24
    add r0, r0, #0x4
    cmp r3, r0
    beq .L_b24
    b .L_d80
.L_14c:
    add r1, r0, #0x87
    cmp r3, r1
    bgt .L_168
    add r0, r0, #0x87
    cmp r3, r0
    beq .L_b24
    b .L_d80
.L_168:
    add r0, r0, #0x93
    cmp r3, r0
    beq .L_b24
    b .L_d80
.L_178:
    add r1, r0, #0xa7
    cmp r3, r1
    bgt .L_198
    bge .L_b24
    add r0, r0, #0x97
    cmp r3, r0
    beq .L_b24
    b .L_d80
.L_198:
    add r1, r0, #0xa8
    cmp r3, r1
    bgt .L_1b4
    add r0, r0, #0xa8
    cmp r3, r0
    beq .L_b24
    b .L_d80
.L_1b4:
    add r0, r0, #0xb4
    cmp r3, r0
    beq .L_b24
    b .L_d80
.L_1c4:
    sub r0, r1, #0xd4
    cmp r3, r0
    bgt .L_258
    bge .L_b24
    sub r0, r2, #0x38c
    cmp r3, r0
    bgt .L_214
    bge .L_b24
    sub r0, r1, #0x140
    cmp r3, r0
    bgt .L_204
    bge .L_be4
    sub r0, r2, #0x3c0
    cmp r3, r0
    beq .L_b24
    b .L_d80
.L_204:
    sub r0, r1, #0x130
    cmp r3, r0
    beq .L_b24
    b .L_d80
.L_214:
    sub r0, r1, #0xdb
    cmp r3, r0
    bgt .L_234
    bge .L_b24
    sub r0, r1, #0xfe
    cmp r3, r0
    beq .L_b24
    b .L_d80
.L_234:
    sub r0, r1, #0xda
    cmp r3, r0
    bgt .L_248
    beq .L_b24
    b .L_d80
.L_248:
    sub r0, r1, #0xd9
    cmp r3, r0
    beq .L_bfc
    b .L_d80
.L_258:
    sub r0, r1, #0x31
    cmp r3, r0
    bgt .L_2ac
    bge .L_b24
    sub r0, r1, #0x67
    cmp r3, r0
    bgt .L_288
    bge .L_b24
    sub r0, r1, #0xc9
    cmp r3, r0
    beq .L_b24
    b .L_d80
.L_288:
    sub r0, r1, #0x4e
    cmp r3, r0
    bgt .L_29c
    beq .L_b24
    b .L_d80
.L_29c:
    sub r0, r1, #0x33
    cmp r3, r0
    beq .L_b24
    b .L_d80
.L_2ac:
    sub r0, r1, #0x24
    cmp r3, r0
    bgt .L_2cc
    bge .L_b24
    sub r0, r1, #0x2b
    cmp r3, r0
    beq .L_b24
    b .L_d80
.L_2cc:
    cmp r3, #0x1440
    bgt .L_2dc
    beq .L_b24
    b .L_d80
.L_2dc:
    sub r0, r1, #0x3
    cmp r3, r0
    beq .L_b24
    b .L_d80
.L_2ec:
    ldr r0, _LIT5
    cmp r3, r0
    bgt .L_448
    bge .L_bfc
    sub r2, r0, #0x9d
    cmp r3, r2
    bgt .L_3a0
    bge .L_d4c
    sub r2, r0, #0xef
    cmp r3, r2
    bgt .L_354
    bge .L_b24
    add r2, r1, #0x1e
    cmp r3, r2
    bgt .L_344
    mov r0, r2
    cmp r3, r0
    bge .L_b24
    add r0, r1, #0x14
    cmp r3, r0
    beq .L_b24
    b .L_d80
.L_344:
    sub r0, r0, #0xf1
    cmp r3, r0
    beq .L_bfc
    b .L_d80
.L_354:
    sub r1, r0, #0xd4
    cmp r3, r1
    bgt .L_374
    bge .L_c54
    sub r0, r0, #0xe9
    cmp r3, r0
    beq .L_b24
    b .L_d80
.L_374:
    sub r1, r0, #0xd0
    cmp r3, r1
    bgt .L_390
    sub r0, r0, #0xd0
    cmp r3, r0
    beq .L_b24
    b .L_d80
.L_390:
    sub r0, r0, #0xbf
    cmp r3, r0
    beq .L_b24
    b .L_d80
.L_3a0:
    sub r1, r0, #0x69
    cmp r3, r1
    bgt .L_3fc
    bge .L_b24
    sub r1, r0, #0x8e
    cmp r3, r1
    bgt .L_3d0
    bge .L_c68
    sub r0, r0, #0x9c
    cmp r3, r0
    beq .L_b24
    b .L_d80
.L_3d0:
    sub r1, r0, #0x8a
    cmp r3, r1
    bgt .L_3ec
    sub r0, r0, #0x8a
    cmp r3, r0
    beq .L_c84
    b .L_d80
.L_3ec:
    sub r0, r0, #0x72
    cmp r3, r0
    beq .L_b24
    b .L_d80
.L_3fc:
    sub r1, r0, #0x2a
    cmp r3, r1
    bgt .L_41c
    bge .L_ca0
    sub r0, r0, #0x48
    cmp r3, r0
    beq .L_b24
    b .L_d80
.L_41c:
    sub r1, r0, #0x23
    cmp r3, r1
    bgt .L_438
    sub r0, r0, #0x23
    cmp r3, r0
    beq .L_b24
    b .L_d80
.L_438:
    sub r0, r0, #0xc
    cmp r3, r0
    beq .L_bfc
    b .L_d80
.L_448:
    add r5, r0, #0x97
    cmp r3, r5
    bgt .L_504
    mov r1, r5
    cmp r3, r1
    bge .L_b24
    add r1, r0, #0x5f
    cmp r3, r1
    bgt .L_4b8
    bge .L_b24
    add r1, r0, #0x3f
    cmp r3, r1
    bgt .L_490
    bge .L_b24
    add r0, r0, #0x3b
    cmp r3, r0
    beq .L_be4
    b .L_d80
.L_490:
    add r1, r0, #0x46
    cmp r3, r1
    bgt .L_4ac
    add r0, r0, #0x46
    cmp r3, r0
    beq .L_b24
    b .L_d80
.L_4ac:
    add r0, r0, #0x49
    cmp r3, r0
    b .L_d80
.L_4b8:
    add r1, r0, #0x68
    cmp r3, r1
    bgt .L_4d8
    bge .L_b24
    add r0, r0, #0x61
    cmp r3, r0
    beq .L_cbc
    b .L_d80
.L_4d8:
    add r1, r0, #0x77
    cmp r3, r1
    bgt .L_4f4
    add r0, r0, #0x77
    cmp r3, r0
    beq .L_ca0
    b .L_d80
.L_4f4:
    add r0, r0, #0x79
    cmp r3, r0
    beq .L_be4
    b .L_d80
.L_504:
    add r5, r0, #0xe1
    cmp r3, r5
    bgt .L_568
    mov r1, r5
    cmp r3, r1
    bge .L_b24
    add r1, r0, #0xb9
    cmp r3, r1
    bgt .L_53c
    bge .L_b24
    add r0, r0, #0xb1
    cmp r3, r0
    beq .L_b24
    b .L_d80
.L_53c:
    add r1, r0, #0xbb
    cmp r3, r1
    bgt .L_558
    add r0, r0, #0xbb
    cmp r3, r0
    beq .L_b24
    b .L_d80
.L_558:
    add r0, r0, #0xc8
    cmp r3, r0
    beq .L_bfc
    b .L_d80
.L_568:
    cmp r3, #0x16c0
    bgt .L_584
    bge .L_b24
    add r0, r0, #0xf3
    cmp r3, r0
    beq .L_b24
    b .L_d80
.L_584:
    sub r0, r2, #0x8
    cmp r3, r0
    bgt .L_598
    beq .L_be4
    b .L_d80
.L_598:
    add r0, r1, #0x270
    cmp r3, r0
    beq .L_b24
    b .L_d80
.L_5a8:
    ldr r1, _LIT6
    cmp r3, r1
    bgt .L_868
    bge .L_d80
    ldr r0, _LIT7
    cmp r3, r0
    bgt .L_70c
    bge .L_b24
    sub r1, r0, #0x7f
    cmp r3, r1
    bgt .L_664
    bge .L_b24
    sub r1, r0, #0xda
    cmp r3, r1
    bgt .L_618
    bge .L_b24
    sub r1, r0, #0xea
    cmp r3, r1
    bgt .L_608
    bge .L_bfc
    sub r0, r0, #0xeb
    cmp r3, r0
    beq .L_be4
    b .L_d80
.L_608:
    sub r0, r0, #0xe1
    cmp r3, r0
    beq .L_b24
    b .L_d80
.L_618:
    sub r1, r0, #0x9a
    cmp r3, r1
    bgt .L_638
    bge .L_b24
    sub r0, r0, #0xa5
    cmp r3, r0
    beq .L_b24
    b .L_d80
.L_638:
    sub r1, r0, #0x97
    cmp r3, r1
    bgt .L_654
    sub r0, r0, #0x97
    cmp r3, r0
    beq .L_b24
    b .L_d80
.L_654:
    sub r0, r0, #0x81
    cmp r3, r0
    beq .L_ca0
    b .L_d80
.L_664:
    sub r1, r0, #0x4a
    cmp r3, r1
    bgt .L_6c0
    bge .L_b24
    sub r1, r0, #0x58
    cmp r3, r1
    bgt .L_694
    bge .L_c84
    sub r0, r0, #0x7e
    cmp r3, r0
    beq .L_ca0
    b .L_d80
.L_694:
    sub r1, r0, #0x54
    cmp r3, r1
    bgt .L_6b0
    sub r0, r0, #0x54
    cmp r3, r0
    beq .L_b24
    b .L_d80
.L_6b0:
    sub r0, r0, #0x53
    cmp r3, r0
    beq .L_b24
    b .L_d80
.L_6c0:
    sub r1, r0, #0x18
    cmp r3, r1
    bgt .L_6e0
    bge .L_c68
    sub r0, r0, #0x36
    cmp r3, r0
    beq .L_be4
    b .L_d80
.L_6e0:
    sub r1, r0, #0x17
    cmp r3, r1
    bgt .L_6fc
    sub r0, r0, #0x17
    cmp r3, r0
    beq .L_b24
    b .L_d80
.L_6fc:
    sub r0, r0, #0x8
    cmp r3, r0
    beq .L_b24
    b .L_d80
.L_70c:
    add r2, r0, #0x9b
    cmp r3, r2
    bgt .L_7b0
    mov r1, r2
    cmp r3, r1
    bge .L_be4
    add r1, r0, #0x76
    cmp r3, r1
    bgt .L_764
    bge .L_b24
    add r1, r0, #0x4c
    cmp r3, r1
    bgt .L_754
    bge .L_cd8
    add r0, r0, #0x7
    cmp r3, r0
    beq .L_b24
    b .L_d80
.L_754:
    add r0, r0, #0x6d
    cmp r3, r0
    beq .L_bfc
    b .L_d80
.L_764:
    add r1, r0, #0x79
    cmp r3, r1
    bgt .L_784
    bge .L_b24
    add r0, r0, #0x78
    cmp r3, r0
    beq .L_b24
    b .L_d80
.L_784:
    add r1, r0, #0x98
    cmp r3, r1
    bgt .L_7a0
    add r0, r0, #0x98
    cmp r3, r0
    beq .L_b24
    b .L_d80
.L_7a0:
    add r0, r0, #0x9a
    cmp r3, r0
    beq .L_b2c
    b .L_d80
.L_7b0:
    add r2, r0, #0xea
    cmp r3, r2
    bgt .L_814
    mov r1, r2
    cmp r3, r1
    bge .L_b24
    add r1, r0, #0xcc
    cmp r3, r1
    bgt .L_7e8
    bge .L_b24
    add r0, r0, #0xc9
    cmp r3, r0
    beq .L_c84
    b .L_d80
.L_7e8:
    add r1, r0, #0xd7
    cmp r3, r1
    bgt .L_804
    add r0, r0, #0xd7
    cmp r3, r0
    beq .L_b24
    b .L_d80
.L_804:
    add r0, r0, #0xe4
    cmp r3, r0
    beq .L_b24
    b .L_d80
.L_814:
    add r2, r0, #0x118
    cmp r3, r2
    bgt .L_83c
    mov r1, r2
    cmp r3, r1
    bge .L_bfc
    add r0, r0, #0x114
    cmp r3, r0
    beq .L_b24
    b .L_d80
.L_83c:
    sub r2, r1, #0x12
    cmp r3, r2
    bgt .L_858
    mov r0, r2
    cmp r3, r0
    beq .L_be4
    b .L_d80
.L_858:
    add r0, r0, #0x13c
    cmp r3, r0
    beq .L_b24
    b .L_d80
.L_868:
    add r0, r2, #0x3e4
    cmp r3, r0
    bgt .L_9a4
    bge .L_b24
    add r0, r1, #0xa0
    cmp r3, r0
    bgt .L_90c
    bge .L_be4
    add r0, r1, #0x3b
    cmp r3, r0
    bgt .L_8c8
    bge .L_b24
    add r0, r1, #0x29
    cmp r3, r0
    bgt .L_8b8
    bge .L_b24
    add r0, r1, #0x10
    cmp r3, r0
    beq .L_b24
    b .L_d80
.L_8b8:
    add r0, r1, #0x34
    cmp r3, r0
    beq .L_bfc
    b .L_d80
.L_8c8:
    add r0, r1, #0x56
    cmp r3, r0
    bgt .L_8e8
    bge .L_b24
    add r0, r1, #0x42
    cmp r3, r0
    beq .L_b24
    b .L_d80
.L_8e8:
    add r0, r1, #0x57
    cmp r3, r0
    bgt .L_8fc
    beq .L_b24
    b .L_d80
.L_8fc:
    add r0, r1, #0x74
    cmp r3, r0
    beq .L_b24
    b .L_d80
.L_90c:
    add r0, r1, #0xd9
    cmp r3, r0
    bgt .L_960
    bge .L_b24
    add r0, r1, #0xbf
    cmp r3, r0
    bgt .L_93c
    bge .L_b24
    add r0, r1, #0xa8
    cmp r3, r0
    beq .L_b24
    b .L_d80
.L_93c:
    add r0, r1, #0xd0
    cmp r3, r0
    bgt .L_950
    beq .L_b24
    b .L_d80
.L_950:
    add r0, r1, #0xd4
    cmp r3, r0
    beq .L_b24
    b .L_d80
.L_960:
    add r0, r1, #0xf3
    cmp r3, r0
    bgt .L_980
    bge .L_c84
    add r0, r1, #0xe9
    cmp r3, r0
    beq .L_bfc
    b .L_d80
.L_980:
    add r0, r1, #0x100
    cmp r3, r0
    bgt .L_994
    beq .L_bfc
    b .L_d80
.L_994:
    ldr r0, _LIT8
    cmp r3, r0
    beq .L_be4
    b .L_d80
.L_9a4:
    ldr r0, _LIT9
    cmp r3, r0
    bgt .L_a54
    bge .L_b24
    cmp r3, #0x1b00
    bgt .L_a0c
    bge .L_b24
    sub r1, r0, #0x54
    cmp r3, r1
    bgt .L_9e0
    bge .L_bfc
    sub r0, r0, #0x72
    cmp r3, r0
    beq .L_b24
    b .L_d80
.L_9e0:
    sub r1, r0, #0x4b
    cmp r3, r1
    bgt .L_9fc
    sub r0, r0, #0x4b
    cmp r3, r0
    beq .L_b24
    b .L_d80
.L_9fc:
    sub r0, r0, #0x40
    cmp r3, r0
    beq .L_ce4
    b .L_d80
.L_a0c:
    sub r1, r0, #0x20
    cmp r3, r1
    bgt .L_a2c
    bge .L_b24
    sub r0, r0, #0x38
    cmp r3, r0
    beq .L_b24
    b .L_d80
.L_a2c:
    sub r1, r0, #0x16
    cmp r3, r1
    bgt .L_a48
    sub r0, r0, #0x16
    cmp r3, r0
    beq .L_b24
    b .L_d80
.L_a48:
    sub r0, r0, #0x1
    cmp r3, r0
    b .L_d80
.L_a54:
    add r1, r0, #0x14
    cmp r3, r1
    bgt .L_adc
    add r0, r0, #0xb
    subs r0, r3, r0
    addpl pc, pc, r0, lsl #0x2
    b .L_a98
    b .L_b24
    b .L_b24
    b .L_d80
    b .L_bfc
    b .L_d80
    b .L_d80
    b .L_d80
    b .L_d80
    b .L_d80
    b .L_b24
.L_a98:
    ldr r1, _LIT10
    cmp r3, r1
    bgt .L_ab8
    bge .L_b24
    sub r0, r1, #0x1
    cmp r3, r0
    beq .L_b24
    b .L_d80
.L_ab8:
    add r0, r1, #0x1
    cmp r3, r0
    bgt .L_acc
    beq .L_b24
    b .L_d80
.L_acc:
    add r0, r1, #0x2
    cmp r3, r0
    beq .L_b24
    b .L_d80
.L_adc:
    add r1, r0, #0x25
    cmp r3, r1
    bgt .L_afc
    bge .L_b24
    add r0, r0, #0x22
    cmp r3, r0
    beq .L_b24
    b .L_d80
.L_afc:
    add r1, r0, #0x26
    cmp r3, r1
    bgt .L_b18
    add r0, r0, #0x26
    cmp r3, r0
    beq .L_b24
    b .L_d80
.L_b18:
    add r0, r0, #0x2a
    cmp r3, r0
    bne .L_d80
.L_b24:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_b2c:
    ldr r5, _LIT11
    mov r9, #0x0
    ldr r8, _LIT12
    ldr r6, _LIT13
    ldr fp, _LIT14
    mov sl, r9
    add r7, r5, #0x28c
.L_b48:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    and r1, r0, #0x1
    mla r2, r1, r7, r8
    add r2, r2, sl
    ldr r1, [r2, #0x30]
    mov r1, r1, lsl #0x13
    movs r1, r1, lsr #0x13
    ldrneh r1, [r2, #0x38]
    cmpne r1, #0x0
    beq .L_bd0
    ldrh r1, [r4]
    mov r2, #0x0
    cmp r1, r6
    beq .L_b98
    cmp r1, fp
    beq .L_bb0
    b .L_bc4
.L_b98:
    mov r1, r9
    bl func_ov002_021c8390
    cmp r0, r5
    movge r2, #0x1
    movlt r2, #0x0
    b .L_bc4
.L_bb0:
    mov r1, r9
    bl func_ov002_021c8390
    cmp r0, r5
    movle r2, #0x1
    movgt r2, #0x0
.L_bc4:
    cmp r2, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_bd0:
    add r9, r9, #0x1
    cmp r9, #0x4
    add sl, sl, #0x14
    ble .L_b48
    b .L_d80
.L_be4:
    mov r0, r4
    bl func_ov002_022578c0
    cmp r0, #0x0
    movgt r0, #0x1
    movle r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_bfc:
    ldrh r0, [r4, #0x6]
    mov r5, #0x0
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    cmp r0, #0x0
    ble .L_d80
.L_c14:
    mov r0, r4
    mov r1, r5
    bl func_ov002_0223dda4
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    and r0, r0, #0xff
    cmp r0, #0x4
    movls r0, #0x1
    ldmlsia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrh r0, [r4, #0x6]
    add r5, r5, #0x1
    mov r0, r0, lsl #0x18
    cmp r5, r0, lsr #0x18
    blt .L_c14
    b .L_d80
.L_c54:
    ldrh r0, [r4, #0xc]
    cmp r0, #0x2
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_c68:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x5
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_c84:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x1e
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_ca0:
    ldrh r0, [r4, #-22]
    mov r0, r0, lsl #0x1a
    mov r0, r0, lsr #0x1b
    cmp r0, #0x4
    movls r0, #0x1
    movhi r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_cbc:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x1e
    cmp r0, #0x3
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_cd8:
    sub r0, r4, #0x18
    bl func_ov002_021b4b04
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_ce4:
    ldrh r5, [r4, #0x2]
    ldr r3, _LIT15
    mov r2, #0x5
    mov r4, r5, lsl #0x1a
    mov r1, r4, lsr #0x1b
    mov r0, r1, lsr #0x1f
    mov r6, r5, lsl #0x1f
    smull r1, r5, r3, r1
    add r5, r0, r5, asr #0x1
    mov r3, r6, lsr #0x1f
    smull r0, r1, r2, r5
    rsb r2, r3, #0x1
    rsb r5, r0, r4, lsr #0x1b
    ldr r0, _LIT16
    ldr r1, _LIT12
    and r3, r2, #0x1
    mla r2, r3, r0, r1
    rsb r1, r5, #0x4
    mov r0, #0x14
    mla r0, r1, r0, r2
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_d80
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_d4c:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x21
    beq .L_d78
    ldrh r0, [r4, #-22]
    mov r0, r0, lsl #0x1a
    mov r0, r0, lsr #0x1b
    cmp r0, #0x4
    movls r0, #0x1
    ldmlsia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_d78:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_d80:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x000016d7
_LIT1: .word 0x00001461
_LIT2: .word 0x00001250
_LIT3: .word 0x000010f6
_LIT4: .word 0x0000124f
_LIT5: .word 0x000015b4
_LIT6: .word 0x00001935
_LIT7: .word 0x000017f2
_LIT8: .word 0x00001aa8
_LIT9: .word 0x00001b3e
_LIT10: .word 0x00001b46
_LIT11: .word 0x000005dc
_LIT12: .word data_ov002_022cf08c
_LIT13: .word 0x0000123b
_LIT14: .word 0x0000188c
_LIT15: .word 0x66666667
_LIT16: .word 0x00000868
