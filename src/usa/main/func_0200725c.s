; func_0200725c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c3eac
        .extern data_020c3eb0
        .extern data_02104e5c
        .extern data_021058a9
        .extern func_020938b0
        .extern func_020aadcc
        .global func_0200725c
        .arm
func_0200725c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x158
    add r0, sp, #0x108
    add r4, sp, #0xe8
    bl func_020938b0
    ldr r0, _LIT0
    ldr r0, [r0, #0x14]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1d
    add r0, sp, #0xe8
    ldrh r7, [r0, #0x38]
    bne .L_a30
    mov r8, #0x0
    cmp r7, #0x0
    ble .L_b28
    ldr r6, _LIT1
    ldr r1, _LIT2
    sub r0, r6, #0x6
    str r0, [sp, #0x14]
    sub r0, r6, #0x7
    str r0, [sp, #0x10]
    sub r0, r6, #0x1
    str r0, [sp, #0xc]
    sub r0, r6, #0x2
    str r0, [sp, #0x8]
    sub r0, r6, #0x4
    str r0, [sp, #0x4]
    sub r0, r6, #0x5
    str r0, [sp]
    ldr r0, _LIT3
    sub lr, r1, #0x38
    add r0, r0, #0x1
    str r0, [sp, #0x9c]
    ldr r0, _LIT4
    ldr r1, _LIT3
    add r0, r0, #0x1f
    str r0, [sp, #0xd4]
    ldr r0, _LIT4
    add r1, r1, #0x11
    sub r0, r0, #0x1e
    str r0, [sp, #0xb8]
    ldr r0, _LIT3
    str r1, [sp, #0x78]
    add r0, r0, #0xfb
    str r0, [sp, #0xbc]
    ldr r0, _LIT4
    ldr r1, _LIT3
    sub r0, r0, #0x1e
    str r0, [sp, #0xb4]
    ldr r0, _LIT4
    add r1, r1, #0x11
    sub r0, r0, #0x10
    str r0, [sp, #0xc0]
    ldr r0, _LIT4
    str r1, [sp, #0x7c]
    sub r0, r0, #0x10
    str r0, [sp, #0xc4]
    ldr r0, _LIT4
    ldr r1, _LIT2
    add r0, r0, #0x1d
    str r0, [sp, #0xb0]
    ldr r0, _LIT4
    add r1, r1, #0x67
    add r0, r0, #0x3f
    str r0, [sp, #0xe4]
    ldr r0, _LIT4
    str r1, [sp, #0x80]
    add r0, r0, #0x3d
    str r0, [sp, #0xcc]
    ldr r0, _LIT4
    ldr r1, _LIT2
    add r0, r0, #0x1f
    str r0, [sp, #0xd0]
    ldr r0, _LIT4
    add r1, r1, #0x67
    add r0, r0, #0x3c
    str r0, [sp, #0xd8]
    ldr r0, _LIT4
    str r1, [sp, #0x84]
    add r0, r0, #0x1d
    str r0, [sp, #0xac]
    ldr r0, _LIT4
    ldr r1, _LIT2
    add r0, r0, #0x3d
    str r0, [sp, #0xc8]
    ldr r0, _LIT4
    sub r1, r1, #0x1
    add r0, r0, #0x3e
    str r0, [sp, #0xdc]
    ldr r0, _LIT4
    str r1, [sp, #0x88]
    add r0, r0, #0x3e
    str r0, [sp, #0xe0]
    ldr r0, _LIT3
    ldr r1, _LIT2
    add r0, r0, #0xb
    str r0, [sp, #0xa4]
    ldr r0, _LIT3
    add r1, r1, #0x64
    add r0, r0, #0x1
    str r0, [sp, #0x98]
    ldr r0, _LIT3
    str r1, [sp, #0x94]
    add r0, r0, #0xb
    str r0, [sp, #0xa0]
    ldr r0, _LIT3
    ldr r1, _LIT5
    add r0, r0, #0xc
    str r0, [sp, #0xa8]
    ldr r0, _LIT2
    sub r5, r6, #0x8
    sub r0, r0, #0x3b
    str r0, [sp, #0x74]
    ldr r0, _LIT2
    add r1, r1, #0x60
    sub r0, r0, #0x1
    str r0, [sp, #0x8c]
    ldr r0, _LIT2
    sub r0, r0, #0x37
    str r0, [sp, #0x90]
    ldr r0, _LIT2
    sub r0, r0, #0x3f
    str r0, [sp, #0x6c]
    ldr r0, _LIT2
    sub r0, r0, #0x3f
    str r0, [sp, #0x70]
    ldr r0, _LIT2
    sub r0, r0, #0x65
    str r0, [sp, #0x50]
    ldr r0, _LIT2
    sub r0, r0, #0x66
    str r0, [sp, #0x48]
    ldr r0, _LIT2
    sub r0, r0, #0x53
    str r0, [sp, #0x40]
    ldr r0, _LIT2
    sub r0, r0, #0x66
    str r0, [sp, #0x44]
    ldr r0, _LIT2
    sub r0, r0, #0x65
    str r0, [sp, #0x4c]
    ldr r0, _LIT2
    sub r0, r0, #0x54
    str r0, [sp, #0x54]
    ldr r0, _LIT2
    sub r0, r0, #0x49
    str r0, [sp, #0x68]
    ldr r0, _LIT2
    sub r0, r0, #0x53
    str r0, [sp, #0x3c]
    ldr r0, _LIT2
    sub r0, r0, #0x40
    str r0, [sp, #0x58]
    ldr r0, _LIT2
    sub r0, r0, #0x40
    str r0, [sp, #0x5c]
    ldr r0, _LIT2
    sub r0, r0, #0x4a
    str r0, [sp, #0x60]
    ldr r0, _LIT2
    sub r0, r0, #0x4a
    str r0, [sp, #0x64]
    ldr r0, _LIT6
    sub r0, r0, #0xa2
    str r0, [sp, #0x34]
    ldr r0, _LIT6
    sub r0, r0, #0xa4
    str r0, [sp, #0x2c]
    ldr r0, _LIT6
    sub r0, r0, #0xa3
    str r0, [sp, #0x28]
    ldr r0, _LIT2
    sub r0, r0, #0x38
    str r0, [sp, #0x18]
    ldr r0, _LIT2
    sub r0, r0, #0x3e8
    str r0, [sp, #0x1c]
    ldr r0, _LIT2
    sub r0, r0, #0x3e8
    str r0, [sp, #0x20]
    ldr r0, _LIT6
    sub r0, r0, #0xa3
    str r0, [sp, #0x24]
    ldr r0, _LIT6
    sub r0, r0, #0xa2
    str r0, [sp, #0x30]
    ldr r0, _LIT7
    add r0, r0, #0x158
    str r0, [sp, #0x38]
    ldr r0, _LIT3
    add r2, r0, #0x92
    add r3, r0, #0x40
    ldr r0, _LIT2
    add ip, r0, #0xaf0
    ldr r0, _LIT3
    add r0, r0, #0xa0
.L_310:
    add r9, sp, #0x108
    add r9, r9, r8, lsl #0x1
    ldrh sl, [r9, #0x4]
    cmp sl, #0x30
    bcc .L_354
    cmp sl, #0x39
    bhi .L_354
    sub r9, sl, #0x30
    add r9, r9, #0x4f
    add r9, r9, #0x8200
    mov sl, r9, lsl #0x10
    mov sl, sl, lsr #0x10
    mov sl, sl, asr #0x8
    strb sl, [r4]
    strb r9, [r4, #0x1]
    add r4, r4, #0x2
    b .L_a20
.L_354:
    cmp sl, #0x41
    bcc .L_38c
    cmp sl, #0x5a
    bhi .L_38c
    sub r9, sl, #0x41
    add r9, r9, #0x260
    add r9, r9, #0x8000
    mov sl, r9, lsl #0x10
    mov sl, sl, lsr #0x10
    mov sl, sl, asr #0x8
    strb sl, [r4]
    strb r9, [r4, #0x1]
    add r4, r4, #0x2
    b .L_a20
.L_38c:
    cmp sl, #0x61
    bcc .L_3c4
    cmp sl, #0x7a
    bhi .L_3c4
    sub r9, sl, #0x61
    add r9, r9, #0x81
    add r9, r9, #0x8200
    mov sl, r9, lsl #0x10
    mov sl, sl, lsr #0x10
    mov sl, sl, asr #0x8
    strb sl, [r4]
    strb r9, [r4, #0x1]
    add r4, r4, #0x2
    b .L_a20
.L_3c4:
    cmp sl, r3
    bcc .L_3fc
    cmp sl, r2
    bhi .L_3fc
    add r9, sl, r1
    add r9, r9, #0x9f
    add r9, r9, #0x8200
    mov sl, r9, lsl #0x10
    mov sl, sl, lsr #0x10
    mov sl, sl, asr #0x8
    strb sl, [r4]
    strb r9, [r4, #0x1]
    add r4, r4, #0x2
    b .L_a20
.L_3fc:
    cmp sl, r0
    bcc .L_44c
    cmp sl, ip
    bhi .L_44c
    ldr r9, _LIT5
    add r9, sl, r9
    add r9, r9, #0x340
    add sl, r9, #0x8000
    ldr r9, _LIT8
    cmp sl, r9
    movgt r9, #0x1
    movle r9, #0x0
    add r9, sl, r9
    mov sl, r9, lsl #0x10
    mov sl, sl, lsr #0x10
    mov sl, sl, asr #0x8
    strb sl, [r4]
    strb r9, [r4, #0x1]
    add r4, r4, #0x2
    b .L_a20
.L_44c:
    cmp sl, lr
    mov r9, r6
    bgt .L_704
    ldr fp, [sp, #0x18]
    cmp sl, fp
    bge .L_9d4
    ldr fp, [sp, #0x1c]
    cmp sl, fp
    bgt .L_628
    ldr fp, [sp, #0x20]
    cmp sl, fp
    bge .L_9c4
    cmp sl, #0xf7
    bgt .L_5c0
    bge .L_9bc
    cmp sl, #0x7b
    bgt .L_5a4
    bge .L_994
    sub fp, sl, #0x20
    cmp fp, #0x3f
    addls pc, pc, fp, lsl #0x2
    b .L_a08
    b .L_8bc
    b .L_8c4
    b .L_8cc
    b .L_8d4
    b .L_8dc
    b .L_8e4
    b .L_8ec
    b .L_8f4
    b .L_8fc
    b .L_904
    b .L_90c
    b .L_914
    b .L_91c
    b .L_924
    b .L_92c
    b .L_934
    b .L_a08
    b .L_a08
    b .L_a08
    b .L_a08
    b .L_a08
    b .L_a08
    b .L_a08
    b .L_a08
    b .L_a08
    b .L_a08
    b .L_93c
    b .L_944
    b .L_94c
    b .L_954
    b .L_95c
    b .L_960
    b .L_964
    b .L_a08
    b .L_a08
    b .L_a08
    b .L_a08
    b .L_a08
    b .L_a08
    b .L_a08
    b .L_a08
    b .L_a08
    b .L_a08
    b .L_a08
    b .L_a08
    b .L_a08
    b .L_a08
    b .L_a08
    b .L_a08
    b .L_a08
    b .L_a08
    b .L_a08
    b .L_a08
    b .L_a08
    b .L_a08
    b .L_a08
    b .L_a08
    b .L_a08
    b .L_a08
    b .L_96c
    b .L_974
    b .L_97c
    b .L_984
    b .L_98c
.L_5a4:
    cmp sl, #0x7d
    bgt .L_5b4
    addeq r9, r6, #0x28
    b .L_a08
.L_5b4:
    cmp sl, #0xd7
    addeq r9, r6, #0x36
    b .L_a08
.L_5c0:
    ldr fp, [sp, #0x24]
    cmp sl, fp
    bgt .L_5fc
    ldr fp, [sp, #0x28]
    cmp sl, fp
    bge .L_9fc
    ldr fp, _LIT7
    cmp sl, fp
    bgt .L_5ec
    addeq r9, r6, #0x5e
    b .L_a08
.L_5ec:
    ldr fp, [sp, #0x2c]
    cmp sl, fp
    addeq r9, r6, #0x61
    b .L_a08
.L_5fc:
    ldr fp, [sp, #0x30]
    cmp sl, fp
    bgt .L_618
    ldr fp, [sp, #0x34]
    cmp sl, fp
    addeq r9, r6, #0x60
    b .L_a08
.L_618:
    ldr fp, [sp, #0x38]
    cmp sl, fp
    addeq r9, r6, #0x63
    b .L_a08
.L_628:
    ldr fp, [sp, #0x3c]
    cmp sl, fp
    bgt .L_694
    ldr fp, [sp, #0x40]
    cmp sl, fp
    bge .L_9ec
    ldr fp, [sp, #0x44]
    cmp sl, fp
    bgt .L_668
    ldr fp, [sp, #0x48]
    cmp sl, fp
    bge .L_9e4
    ldr fp, _LIT6
    cmp sl, fp
    addeq r9, r6, #0x40
    b .L_a08
.L_668:
    ldr fp, [sp, #0x4c]
    cmp sl, fp
    bgt .L_684
    ldr fp, [sp, #0x50]
    cmp sl, fp
    addeq r9, r6, #0x58
    b .L_a08
.L_684:
    ldr fp, [sp, #0x54]
    cmp sl, fp
    addeq r9, r6, #0x5b
    b .L_a08
.L_694:
    ldr fp, [sp, #0x58]
    cmp sl, fp
    bgt .L_6d8
    ldr fp, [sp, #0x5c]
    cmp sl, fp
    bge .L_9dc
    ldr fp, [sp, #0x60]
    cmp sl, fp
    bgt .L_6c8
    ldr fp, [sp, #0x64]
    cmp sl, fp
    addeq r9, r6, #0x5d
    b .L_a08
.L_6c8:
    ldr fp, [sp, #0x68]
    cmp sl, fp
    addeq r9, r6, #0x5c
    b .L_a08
.L_6d8:
    ldr fp, [sp, #0x6c]
    cmp sl, fp
    bgt .L_6f4
    ldr fp, [sp, #0x70]
    cmp sl, fp
    addeq r9, r6, #0x56
    b .L_a08
.L_6f4:
    ldr fp, [sp, #0x74]
    cmp sl, fp
    addeq r9, r6, #0x53
    b .L_a08
.L_704:
    ldr fp, [sp, #0x78]
    cmp sl, fp
    bgt .L_7e4
    ldr fp, [sp, #0x7c]
    cmp sl, fp
    bge .L_9f4
    ldr fp, [sp, #0x80]
    cmp sl, fp
    bgt .L_780
    ldr fp, [sp, #0x84]
    cmp sl, fp
    bge .L_a04
    ldr fp, [sp, #0x88]
    cmp sl, fp
    bgt .L_75c
    ldr fp, [sp, #0x8c]
    cmp sl, fp
    bge .L_9cc
    ldr fp, [sp, #0x90]
    cmp sl, fp
    addeq r9, r6, #0x54
    b .L_a08
.L_75c:
    ldr fp, _LIT2
    cmp sl, fp
    bgt .L_770
    addeq r9, r6, #0x51
    b .L_a08
.L_770:
    ldr fp, [sp, #0x94]
    cmp sl, fp
    addeq r9, r6, #0xac
    b .L_a08
.L_780:
    ldr fp, [sp, #0x98]
    cmp sl, fp
    bgt .L_7b8
    ldr fp, [sp, #0x9c]
    cmp sl, fp
    bge .L_99c
    cmp sl, #0x3000
    bgt .L_7a8
    moveq r9, r5
    b .L_a08
.L_7a8:
    ldr fp, _LIT3
    cmp sl, fp
    ldreq r9, [sp, #0x10]
    b .L_a08
.L_7b8:
    ldr fp, [sp, #0xa0]
    cmp sl, fp
    bgt .L_7d4
    ldr fp, [sp, #0xa4]
    cmp sl, fp
    addeq r9, r6, #0x2d
    b .L_a08
.L_7d4:
    ldr fp, [sp, #0xa8]
    cmp sl, fp
    addeq r9, r6, #0x2e
    b .L_a08
.L_7e4:
    ldr fp, [sp, #0xac]
    cmp sl, fp
    bgt .L_84c
    ldr fp, [sp, #0xb0]
    cmp sl, fp
    bge .L_9ac
    ldr fp, [sp, #0xb4]
    cmp sl, fp
    bgt .L_824
    ldr fp, [sp, #0xb8]
    cmp sl, fp
    bge .L_9a4
    ldr fp, [sp, #0xbc]
    cmp sl, fp
    addeq r9, r6, #0x13
    b .L_a08
.L_824:
    ldr fp, [sp, #0xc0]
    cmp sl, fp
    bgt .L_840
    ldr fp, [sp, #0xc4]
    cmp sl, fp
    addeq r9, r6, #0x16
    b .L_a08
.L_840:
    ldr fp, _LIT4
    cmp sl, fp
    b .L_a08
.L_84c:
    ldr fp, [sp, #0xc8]
    cmp sl, fp
    bgt .L_890
    ldr fp, [sp, #0xcc]
    cmp sl, fp
    bge .L_9b4
    ldr fp, [sp, #0xd0]
    cmp sl, fp
    bgt .L_880
    ldr fp, [sp, #0xd4]
    cmp sl, fp
    addeq r9, r6, #0x7
    b .L_a08
.L_880:
    ldr fp, [sp, #0xd8]
    cmp sl, fp
    addeq r9, r6, #0x27
    b .L_a08
.L_890:
    ldr fp, [sp, #0xdc]
    cmp sl, fp
    bgt .L_8ac
    ldr fp, [sp, #0xe0]
    cmp sl, fp
    addeq r9, r6, #0x28
    b .L_a08
.L_8ac:
    ldr fp, [sp, #0xe4]
    cmp sl, fp
    addeq r9, r6, #0x18
    b .L_a08
.L_8bc:
    mov r9, r5
    b .L_a08
.L_8c4:
    add r9, r6, #0x1
    b .L_a08
.L_8cc:
    add r9, r6, #0x20
    b .L_a08
.L_8d4:
    add r9, r6, #0x4c
    b .L_a08
.L_8dc:
    add r9, r6, #0x48
    b .L_a08
.L_8e4:
    add r9, r6, #0x4b
    b .L_a08
.L_8ec:
    add r9, r6, #0x4d
    b .L_a08
.L_8f4:
    add r9, r6, #0x1e
    b .L_a08
.L_8fc:
    add r9, r6, #0x21
    b .L_a08
.L_904:
    add r9, r6, #0x22
    b .L_a08
.L_90c:
    add r9, r6, #0x4e
    b .L_a08
.L_914:
    add r9, r6, #0x33
    b .L_a08
.L_91c:
    ldr r9, [sp]
    b .L_a08
.L_924:
    add r9, r6, #0x34
    b .L_a08
.L_92c:
    ldr r9, [sp, #0x4]
    b .L_a08
.L_934:
    add r9, r6, #0x16
    b .L_a08
.L_93c:
    ldr r9, [sp, #0x8]
    b .L_a08
.L_944:
    ldr r9, [sp, #0xc]
    b .L_a08
.L_94c:
    add r9, r6, #0x3b
    b .L_a08
.L_954:
    add r9, r6, #0x39
    b .L_a08
.L_95c:
    add r9, r6, #0x3c
.L_960:
    b .L_a08
.L_964:
    add r9, r6, #0x4f
    b .L_a08
.L_96c:
    add r9, r6, #0x25
    b .L_a08
.L_974:
    add r9, r6, #0x17
    b .L_a08
.L_97c:
    add r9, r6, #0x26
    b .L_a08
.L_984:
    add r9, r6, #0x7
    b .L_a08
.L_98c:
    add r9, r6, #0x9
    b .L_a08
.L_994:
    add r9, r6, #0x27
    b .L_a08
.L_99c:
    ldr r9, [sp, #0x14]
    b .L_a08
.L_9a4:
    add r9, r6, #0x1
    b .L_a08
.L_9ac:
    add r9, r6, #0x17
    b .L_a08
.L_9b4:
    add r9, r6, #0x1a
    b .L_a08
.L_9bc:
    add r9, r6, #0x38
    b .L_a08
.L_9c4:
    add r9, r6, #0x3f
    b .L_a08
.L_9cc:
    add r9, r6, #0x52
    b .L_a08
.L_9d4:
    add r9, r6, #0x55
    b .L_a08
.L_9dc:
    add r9, r6, #0x57
    b .L_a08
.L_9e4:
    add r9, r6, #0x59
    b .L_a08
.L_9ec:
    add r9, r6, #0x5a
    b .L_a08
.L_9f4:
    add r9, r6, #0x5f
    b .L_a08
.L_9fc:
    add r9, r6, #0x62
    b .L_a08
.L_a04:
    add r9, r6, #0xab
.L_a08:
    mov sl, r9, lsl #0x10
    mov sl, sl, lsr #0x10
    mov sl, sl, asr #0x8
    strb sl, [r4]
    strb r9, [r4, #0x1]
    add r4, r4, #0x2
.L_a20:
    add r8, r8, #0x1
    cmp r8, r7
    blt .L_310
    b .L_b28
.L_a30:
    mov sl, #0x0
    cmp r7, #0x0
    ble .L_b28
    ldr r1, _LIT9
    ldr lr, _LIT10
    sub r5, r1, #0x8f
    sub r3, lr, #0x1
    sub r2, r1, #0x90
    mov r6, r5
    add r0, r1, #0x76
    mov ip, r3
    add fp, sp, #0x108
.L_a60:
    add r8, fp, sl, lsl #0x1
    ldrh r9, [r8, #0x4]
    cmp r9, #0x20
    bcc .L_a98
    cmp r9, #0x7e
    bhi .L_a98
    cmp r9, #0x40
    cmpne r9, #0x60
    bne .L_a90
    mov r8, #0x3f
    strb r8, [r4], #0x1
    b .L_b1c
.L_a90:
    strb r9, [r4], #0x1
    b .L_b1c
.L_a98:
    cmp r9, #0xa0
    bcc .L_aac
    cmp r9, #0xfc
    strlsb r9, [r4], #0x1
    bls .L_b1c
.L_aac:
    cmp r9, r6
    mov r8, #0x3f
    bgt .L_af0
    cmp r9, r5
    bge .L_b14
    cmp r9, lr
    bgt .L_ae4
    cmp r9, ip
    blt .L_b18
    cmp r9, r3
    beq .L_b0c
    cmp r9, lr
    moveq r8, #0x9c
    b .L_b18
.L_ae4:
    cmp r9, r2
    moveq r8, #0x93
    b .L_b18
.L_af0:
    cmp r9, r1
    bgt .L_b00
    moveq r8, #0x80
    b .L_b18
.L_b00:
    cmp r9, r0
    moveq r8, #0x99
    b .L_b18
.L_b0c:
    mov r8, #0x8c
    b .L_b18
.L_b14:
    mov r8, #0x94
.L_b18:
    strb r8, [r4], #0x1
.L_b1c:
    add sl, sl, #0x1
    cmp sl, r7
    blt .L_a60
.L_b28:
    mov r0, #0x0
    strb r0, [r4]
    ldrsb r0, [sp, #0xe8]
    cmp r0, #0x0
    bne .L_b90
    ldr r0, _LIT0
    ldr r0, [r0, #0x14]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1d
    bne .L_b74
    ldr r0, _LIT11
    ldr r3, _LIT12
    ldrb r2, [r0]
    ldrb r1, [r0, #0x1]
    ldrb r0, [r0, #0x2]
    strb r2, [r3]
    strb r1, [r3, #0x1]
    strb r0, [r3, #0x2]
    b .L_bac
.L_b74:
    ldr r0, _LIT13
    ldr r2, _LIT12
    ldrb r1, [r0]
    ldrb r0, [r0, #0x1]
    strb r1, [r2]
    strb r0, [r2, #0x1]
    b .L_bac
.L_b90:
    ldr r0, _LIT12
    add r1, sp, #0xe8
    mov r2, #0x14
    bl func_020aadcc
    ldr r0, _LIT0
    mov r1, #0x0
    strb r1, [r0, #0xa61]
.L_bac:
    ldr r0, _LIT0
    ldr r1, [r0, #0x14]
    ldrb r2, [r0, #0xa4c]
    mov r1, r1, lsl #0x1d
    mov r1, r1, lsr #0x1d
    and r1, r1, #0xff
    bic r2, r2, #0x7
    and r1, r1, #0x7
    orr r1, r2, r1
    strb r1, [r0, #0xa4c]
    add sp, sp, #0x158
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_02104e5c
_LIT1: .word 0x00008148
_LIT2: .word 0x00002606
_LIT3: .word 0x00003001
_LIT4: .word 0x0000ff1f
_LIT5: .word 0xffffcf5f
_LIT6: .word 0x00002234
_LIT7: .word 0x0000203b
_LIT8: .word 0x0000837e
_LIT9: .word 0x000020ac
_LIT10: .word 0x00000153
_LIT11: .word data_020c3eac
_LIT12: .word data_021058a9
_LIT13: .word data_020c3eb0
