; func_ov002_021b4be4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021b4be4
        .extern func_ov002_021c8470
        .extern func_ov002_0223de94
        .extern func_ov002_022579a8
        .global func_ov002_021b4be4
        .arm
func_ov002_021b4be4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov r4, r0
    ldrh r3, [r4]
    ldr r2, _LIT0
    cmp r3, r2
    bgt .L_b08
    bge .L_1084
    ldr r1, _LIT1
    cmp r3, r1
    bgt .L_84c
    bge .L_1084
    sub r0, r1, #0x15c
    cmp r3, r0
    bgt .L_724
    bge .L_1084
    ldr r0, _LIT2
    cmp r3, r0
    bgt .L_67c
    bge .L_1084
    sub r1, r0, #0xb6
    cmp r3, r1
    bgt .L_60c
    sub r0, r0, #0xb6
    cmp r3, r0
    bge .L_1084
    sub r0, r2, #0x5e0
    cmp r3, r0
    bgt .L_5fc
    ldr r0, _LIT3
    cmp r3, r0
    blt .L_5ec
    addne r0, r0, #0x1
    cmpne r3, r0
    beq .L_1084
    b .L_12e0
.L_5ec:
    sub r0, r0, #0xd8
    cmp r3, r0
    beq .L_1084
    b .L_12e0
.L_5fc:
    sub r0, r2, #0x590
    cmp r3, r0
    beq .L_1084
    b .L_12e0
.L_60c:
    sub r1, r0, #0x1d
    cmp r3, r1
    bgt .L_62c
    bge .L_1084
    sub r0, r0, #0xb5
    cmp r3, r0
    beq .L_1084
    b .L_12e0
.L_62c:
    sub r1, r0, #0x12
    cmp r3, r1
    bgt .L_66c
    sub r0, r0, #0x1a
    subs r0, r3, r0
    addpl pc, pc, r0, lsl #0x2
    b .L_12e0
    b .L_1084
    b .L_12e0
    b .L_12e0
    b .L_12e0
    b .L_1084
    b .L_108c
    b .L_1084
    b .L_1084
    b .L_1084
.L_66c:
    ldr r0, _LIT4
    cmp r3, r0
    beq .L_1084
    b .L_12e0
.L_67c:
    add r1, r0, #0x94
    cmp r3, r1
    bgt .L_6d8
    bge .L_1084
    add r1, r0, #0x61
    cmp r3, r1
    bgt .L_6ac
    bge .L_1084
    add r0, r0, #0x4
    cmp r3, r0
    beq .L_1084
    b .L_12e0
.L_6ac:
    add r1, r0, #0x87
    cmp r3, r1
    bgt .L_6c8
    add r0, r0, #0x87
    cmp r3, r0
    beq .L_1084
    b .L_12e0
.L_6c8:
    add r0, r0, #0x93
    cmp r3, r0
    beq .L_1084
    b .L_12e0
.L_6d8:
    add r1, r0, #0xa7
    cmp r3, r1
    bgt .L_6f8
    bge .L_1084
    add r0, r0, #0x97
    cmp r3, r0
    beq .L_1084
    b .L_12e0
.L_6f8:
    add r1, r0, #0xa8
    cmp r3, r1
    bgt .L_714
    add r0, r0, #0xa8
    cmp r3, r0
    beq .L_1084
    b .L_12e0
.L_714:
    add r0, r0, #0xb4
    cmp r3, r0
    beq .L_1084
    b .L_12e0
.L_724:
    sub r0, r1, #0xd4
    cmp r3, r0
    bgt .L_7b8
    bge .L_1084
    sub r0, r2, #0x38c
    cmp r3, r0
    bgt .L_774
    bge .L_1084
    sub r0, r1, #0x140
    cmp r3, r0
    bgt .L_764
    bge .L_1144
    sub r0, r2, #0x3c0
    cmp r3, r0
    beq .L_1084
    b .L_12e0
.L_764:
    sub r0, r1, #0x130
    cmp r3, r0
    beq .L_1084
    b .L_12e0
.L_774:
    sub r0, r1, #0xdb
    cmp r3, r0
    bgt .L_794
    bge .L_1084
    sub r0, r1, #0xfe
    cmp r3, r0
    beq .L_1084
    b .L_12e0
.L_794:
    sub r0, r1, #0xda
    cmp r3, r0
    bgt .L_7a8
    beq .L_1084
    b .L_12e0
.L_7a8:
    sub r0, r1, #0xd9
    cmp r3, r0
    beq .L_115c
    b .L_12e0
.L_7b8:
    sub r0, r1, #0x31
    cmp r3, r0
    bgt .L_80c
    bge .L_1084
    sub r0, r1, #0x67
    cmp r3, r0
    bgt .L_7e8
    bge .L_1084
    sub r0, r1, #0xc9
    cmp r3, r0
    beq .L_1084
    b .L_12e0
.L_7e8:
    sub r0, r1, #0x4e
    cmp r3, r0
    bgt .L_7fc
    beq .L_1084
    b .L_12e0
.L_7fc:
    sub r0, r1, #0x33
    cmp r3, r0
    beq .L_1084
    b .L_12e0
.L_80c:
    sub r0, r1, #0x24
    cmp r3, r0
    bgt .L_82c
    bge .L_1084
    sub r0, r1, #0x2b
    cmp r3, r0
    beq .L_1084
    b .L_12e0
.L_82c:
    cmp r3, #0x1440
    bgt .L_83c
    beq .L_1084
    b .L_12e0
.L_83c:
    sub r0, r1, #0x3
    cmp r3, r0
    beq .L_1084
    b .L_12e0
.L_84c:
    ldr r0, _LIT5
    cmp r3, r0
    bgt .L_9a8
    bge .L_115c
    sub r2, r0, #0x9d
    cmp r3, r2
    bgt .L_900
    bge .L_12ac
    sub r2, r0, #0xef
    cmp r3, r2
    bgt .L_8b4
    bge .L_1084
    add r2, r1, #0x1e
    cmp r3, r2
    bgt .L_8a4
    mov r0, r2
    cmp r3, r0
    bge .L_1084
    add r0, r1, #0x14
    cmp r3, r0
    beq .L_1084
    b .L_12e0
.L_8a4:
    sub r0, r0, #0xf1
    cmp r3, r0
    beq .L_115c
    b .L_12e0
.L_8b4:
    sub r1, r0, #0xd4
    cmp r3, r1
    bgt .L_8d4
    bge .L_11b4
    sub r0, r0, #0xe9
    cmp r3, r0
    beq .L_1084
    b .L_12e0
.L_8d4:
    sub r1, r0, #0xd0
    cmp r3, r1
    bgt .L_8f0
    sub r0, r0, #0xd0
    cmp r3, r0
    beq .L_1084
    b .L_12e0
.L_8f0:
    sub r0, r0, #0xbf
    cmp r3, r0
    beq .L_1084
    b .L_12e0
.L_900:
    sub r1, r0, #0x69
    cmp r3, r1
    bgt .L_95c
    bge .L_1084
    sub r1, r0, #0x8e
    cmp r3, r1
    bgt .L_930
    bge .L_11c8
    sub r0, r0, #0x9c
    cmp r3, r0
    beq .L_1084
    b .L_12e0
.L_930:
    sub r1, r0, #0x8a
    cmp r3, r1
    bgt .L_94c
    sub r0, r0, #0x8a
    cmp r3, r0
    beq .L_11e4
    b .L_12e0
.L_94c:
    sub r0, r0, #0x72
    cmp r3, r0
    beq .L_1084
    b .L_12e0
.L_95c:
    sub r1, r0, #0x2a
    cmp r3, r1
    bgt .L_97c
    bge .L_1200
    sub r0, r0, #0x48
    cmp r3, r0
    beq .L_1084
    b .L_12e0
.L_97c:
    sub r1, r0, #0x23
    cmp r3, r1
    bgt .L_998
    sub r0, r0, #0x23
    cmp r3, r0
    beq .L_1084
    b .L_12e0
.L_998:
    sub r0, r0, #0xc
    cmp r3, r0
    beq .L_115c
    b .L_12e0
.L_9a8:
    add r5, r0, #0x97
    cmp r3, r5
    bgt .L_a64
    mov r1, r5
    cmp r3, r1
    bge .L_1084
    add r1, r0, #0x5f
    cmp r3, r1
    bgt .L_a18
    bge .L_1084
    add r1, r0, #0x3f
    cmp r3, r1
    bgt .L_9f0
    bge .L_1084
    add r0, r0, #0x3b
    cmp r3, r0
    beq .L_1144
    b .L_12e0
.L_9f0:
    add r1, r0, #0x46
    cmp r3, r1
    bgt .L_a0c
    add r0, r0, #0x46
    cmp r3, r0
    beq .L_1084
    b .L_12e0
.L_a0c:
    add r0, r0, #0x49
    cmp r3, r0
    b .L_12e0
.L_a18:
    add r1, r0, #0x68
    cmp r3, r1
    bgt .L_a38
    bge .L_1084
    add r0, r0, #0x61
    cmp r3, r0
    beq .L_121c
    b .L_12e0
.L_a38:
    add r1, r0, #0x77
    cmp r3, r1
    bgt .L_a54
    add r0, r0, #0x77
    cmp r3, r0
    beq .L_1200
    b .L_12e0
.L_a54:
    add r0, r0, #0x79
    cmp r3, r0
    beq .L_1144
    b .L_12e0
.L_a64:
    add r5, r0, #0xe1
    cmp r3, r5
    bgt .L_ac8
    mov r1, r5
    cmp r3, r1
    bge .L_1084
    add r1, r0, #0xb9
    cmp r3, r1
    bgt .L_a9c
    bge .L_1084
    add r0, r0, #0xb1
    cmp r3, r0
    beq .L_1084
    b .L_12e0
.L_a9c:
    add r1, r0, #0xbb
    cmp r3, r1
    bgt .L_ab8
    add r0, r0, #0xbb
    cmp r3, r0
    beq .L_1084
    b .L_12e0
.L_ab8:
    add r0, r0, #0xc8
    cmp r3, r0
    beq .L_115c
    b .L_12e0
.L_ac8:
    cmp r3, #0x16c0
    bgt .L_ae4
    bge .L_1084
    add r0, r0, #0xf3
    cmp r3, r0
    beq .L_1084
    b .L_12e0
.L_ae4:
    sub r0, r2, #0x8
    cmp r3, r0
    bgt .L_af8
    beq .L_1144
    b .L_12e0
.L_af8:
    add r0, r1, #0x270
    cmp r3, r0
    beq .L_1084
    b .L_12e0
.L_b08:
    ldr r1, _LIT6
    cmp r3, r1
    bgt .L_dc8
    bge .L_12e0
    ldr r0, _LIT7
    cmp r3, r0
    bgt .L_c6c
    bge .L_1084
    sub r1, r0, #0x7f
    cmp r3, r1
    bgt .L_bc4
    bge .L_1084
    sub r1, r0, #0xda
    cmp r3, r1
    bgt .L_b78
    bge .L_1084
    sub r1, r0, #0xea
    cmp r3, r1
    bgt .L_b68
    bge .L_115c
    sub r0, r0, #0xeb
    cmp r3, r0
    beq .L_1144
    b .L_12e0
.L_b68:
    sub r0, r0, #0xe1
    cmp r3, r0
    beq .L_1084
    b .L_12e0
.L_b78:
    sub r1, r0, #0x9a
    cmp r3, r1
    bgt .L_b98
    bge .L_1084
    sub r0, r0, #0xa5
    cmp r3, r0
    beq .L_1084
    b .L_12e0
.L_b98:
    sub r1, r0, #0x97
    cmp r3, r1
    bgt .L_bb4
    sub r0, r0, #0x97
    cmp r3, r0
    beq .L_1084
    b .L_12e0
.L_bb4:
    sub r0, r0, #0x81
    cmp r3, r0
    beq .L_1200
    b .L_12e0
.L_bc4:
    sub r1, r0, #0x4a
    cmp r3, r1
    bgt .L_c20
    bge .L_1084
    sub r1, r0, #0x58
    cmp r3, r1
    bgt .L_bf4
    bge .L_11e4
    sub r0, r0, #0x7e
    cmp r3, r0
    beq .L_1200
    b .L_12e0
.L_bf4:
    sub r1, r0, #0x54
    cmp r3, r1
    bgt .L_c10
    sub r0, r0, #0x54
    cmp r3, r0
    beq .L_1084
    b .L_12e0
.L_c10:
    sub r0, r0, #0x53
    cmp r3, r0
    beq .L_1084
    b .L_12e0
.L_c20:
    sub r1, r0, #0x18
    cmp r3, r1
    bgt .L_c40
    bge .L_11c8
    sub r0, r0, #0x36
    cmp r3, r0
    beq .L_1144
    b .L_12e0
.L_c40:
    sub r1, r0, #0x17
    cmp r3, r1
    bgt .L_c5c
    sub r0, r0, #0x17
    cmp r3, r0
    beq .L_1084
    b .L_12e0
.L_c5c:
    sub r0, r0, #0x8
    cmp r3, r0
    beq .L_1084
    b .L_12e0
.L_c6c:
    add r2, r0, #0x9b
    cmp r3, r2
    bgt .L_d10
    mov r1, r2
    cmp r3, r1
    bge .L_1144
    add r1, r0, #0x76
    cmp r3, r1
    bgt .L_cc4
    bge .L_1084
    add r1, r0, #0x4c
    cmp r3, r1
    bgt .L_cb4
    bge .L_1238
    add r0, r0, #0x7
    cmp r3, r0
    beq .L_1084
    b .L_12e0
.L_cb4:
    add r0, r0, #0x6d
    cmp r3, r0
    beq .L_115c
    b .L_12e0
.L_cc4:
    add r1, r0, #0x79
    cmp r3, r1
    bgt .L_ce4
    bge .L_1084
    add r0, r0, #0x78
    cmp r3, r0
    beq .L_1084
    b .L_12e0
.L_ce4:
    add r1, r0, #0x98
    cmp r3, r1
    bgt .L_d00
    add r0, r0, #0x98
    cmp r3, r0
    beq .L_1084
    b .L_12e0
.L_d00:
    add r0, r0, #0x9a
    cmp r3, r0
    beq .L_108c
    b .L_12e0
.L_d10:
    add r2, r0, #0xea
    cmp r3, r2
    bgt .L_d74
    mov r1, r2
    cmp r3, r1
    bge .L_1084
    add r1, r0, #0xcc
    cmp r3, r1
    bgt .L_d48
    bge .L_1084
    add r0, r0, #0xc9
    cmp r3, r0
    beq .L_11e4
    b .L_12e0
.L_d48:
    add r1, r0, #0xd7
    cmp r3, r1
    bgt .L_d64
    add r0, r0, #0xd7
    cmp r3, r0
    beq .L_1084
    b .L_12e0
.L_d64:
    add r0, r0, #0xe4
    cmp r3, r0
    beq .L_1084
    b .L_12e0
.L_d74:
    add r2, r0, #0x118
    cmp r3, r2
    bgt .L_d9c
    mov r1, r2
    cmp r3, r1
    bge .L_115c
    add r0, r0, #0x114
    cmp r3, r0
    beq .L_1084
    b .L_12e0
.L_d9c:
    sub r2, r1, #0x12
    cmp r3, r2
    bgt .L_db8
    mov r0, r2
    cmp r3, r0
    beq .L_1144
    b .L_12e0
.L_db8:
    add r0, r0, #0x13c
    cmp r3, r0
    beq .L_1084
    b .L_12e0
.L_dc8:
    add r0, r2, #0x3e4
    cmp r3, r0
    bgt .L_f04
    bge .L_1084
    add r0, r1, #0xa0
    cmp r3, r0
    bgt .L_e6c
    bge .L_1144
    add r0, r1, #0x3b
    cmp r3, r0
    bgt .L_e28
    bge .L_1084
    add r0, r1, #0x29
    cmp r3, r0
    bgt .L_e18
    bge .L_1084
    add r0, r1, #0x10
    cmp r3, r0
    beq .L_1084
    b .L_12e0
.L_e18:
    add r0, r1, #0x34
    cmp r3, r0
    beq .L_115c
    b .L_12e0
.L_e28:
    add r0, r1, #0x56
    cmp r3, r0
    bgt .L_e48
    bge .L_1084
    add r0, r1, #0x42
    cmp r3, r0
    beq .L_1084
    b .L_12e0
.L_e48:
    add r0, r1, #0x57
    cmp r3, r0
    bgt .L_e5c
    beq .L_1084
    b .L_12e0
.L_e5c:
    add r0, r1, #0x74
    cmp r3, r0
    beq .L_1084
    b .L_12e0
.L_e6c:
    add r0, r1, #0xd9
    cmp r3, r0
    bgt .L_ec0
    bge .L_1084
    add r0, r1, #0xbf
    cmp r3, r0
    bgt .L_e9c
    bge .L_1084
    add r0, r1, #0xa8
    cmp r3, r0
    beq .L_1084
    b .L_12e0
.L_e9c:
    add r0, r1, #0xd0
    cmp r3, r0
    bgt .L_eb0
    beq .L_1084
    b .L_12e0
.L_eb0:
    add r0, r1, #0xd4
    cmp r3, r0
    beq .L_1084
    b .L_12e0
.L_ec0:
    add r0, r1, #0xf3
    cmp r3, r0
    bgt .L_ee0
    bge .L_11e4
    add r0, r1, #0xe9
    cmp r3, r0
    beq .L_115c
    b .L_12e0
.L_ee0:
    add r0, r1, #0x100
    cmp r3, r0
    bgt .L_ef4
    beq .L_115c
    b .L_12e0
.L_ef4:
    ldr r0, _LIT8
    cmp r3, r0
    beq .L_1144
    b .L_12e0
.L_f04:
    ldr r0, _LIT9
    cmp r3, r0
    bgt .L_fb4
    bge .L_1084
    cmp r3, #0x1b00
    bgt .L_f6c
    bge .L_1084
    sub r1, r0, #0x54
    cmp r3, r1
    bgt .L_f40
    bge .L_115c
    sub r0, r0, #0x72
    cmp r3, r0
    beq .L_1084
    b .L_12e0
.L_f40:
    sub r1, r0, #0x4b
    cmp r3, r1
    bgt .L_f5c
    sub r0, r0, #0x4b
    cmp r3, r0
    beq .L_1084
    b .L_12e0
.L_f5c:
    sub r0, r0, #0x40
    cmp r3, r0
    beq .L_1244
    b .L_12e0
.L_f6c:
    sub r1, r0, #0x20
    cmp r3, r1
    bgt .L_f8c
    bge .L_1084
    sub r0, r0, #0x38
    cmp r3, r0
    beq .L_1084
    b .L_12e0
.L_f8c:
    sub r1, r0, #0x16
    cmp r3, r1
    bgt .L_fa8
    sub r0, r0, #0x16
    cmp r3, r0
    beq .L_1084
    b .L_12e0
.L_fa8:
    sub r0, r0, #0x1
    cmp r3, r0
    b .L_12e0
.L_fb4:
    add r1, r0, #0x14
    cmp r3, r1
    bgt .L_103c
    add r0, r0, #0xb
    subs r0, r3, r0
    addpl pc, pc, r0, lsl #0x2
    b .L_ff8
    b .L_1084
    b .L_1084
    b .L_12e0
    b .L_115c
    b .L_12e0
    b .L_12e0
    b .L_12e0
    b .L_12e0
    b .L_12e0
    b .L_1084
.L_ff8:
    ldr r1, _LIT10
    cmp r3, r1
    bgt .L_1018
    bge .L_1084
    sub r0, r1, #0x1
    cmp r3, r0
    beq .L_1084
    b .L_12e0
.L_1018:
    add r0, r1, #0x1
    cmp r3, r0
    bgt .L_102c
    beq .L_1084
    b .L_12e0
.L_102c:
    add r0, r1, #0x2
    cmp r3, r0
    beq .L_1084
    b .L_12e0
.L_103c:
    add r1, r0, #0x25
    cmp r3, r1
    bgt .L_105c
    bge .L_1084
    add r0, r0, #0x22
    cmp r3, r0
    beq .L_1084
    b .L_12e0
.L_105c:
    add r1, r0, #0x26
    cmp r3, r1
    bgt .L_1078
    add r0, r0, #0x26
    cmp r3, r0
    beq .L_1084
    b .L_12e0
.L_1078:
    add r0, r0, #0x2a
    cmp r3, r0
    bne .L_12e0
.L_1084:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_108c:
    ldr r5, _LIT11
    mov r9, #0x0
    ldr r8, _LIT12
    ldr r6, _LIT13
    ldr fp, _LIT14
    mov sl, r9
    add r7, r5, #0x28c
.L_10a8:
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
    beq .L_1130
    ldrh r1, [r4]
    mov r2, #0x0
    cmp r1, r6
    beq .L_10f8
    cmp r1, fp
    beq .L_1110
    b .L_1124
.L_10f8:
    mov r1, r9
    bl func_ov002_021c8470
    cmp r0, r5
    movge r2, #0x1
    movlt r2, #0x0
    b .L_1124
.L_1110:
    mov r1, r9
    bl func_ov002_021c8470
    cmp r0, r5
    movle r2, #0x1
    movgt r2, #0x0
.L_1124:
    cmp r2, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1130:
    add r9, r9, #0x1
    cmp r9, #0x4
    add sl, sl, #0x14
    ble .L_10a8
    b .L_12e0
.L_1144:
    mov r0, r4
    bl func_ov002_022579a8
    cmp r0, #0x0
    movgt r0, #0x1
    movle r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_115c:
    ldrh r0, [r4, #0x6]
    mov r5, #0x0
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    cmp r0, #0x0
    ble .L_12e0
.L_1174:
    mov r0, r4
    mov r1, r5
    bl func_ov002_0223de94
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
    blt .L_1174
    b .L_12e0
.L_11b4:
    ldrh r0, [r4, #0xc]
    cmp r0, #0x2
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_11c8:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x5
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_11e4:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x1e
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1200:
    ldrh r0, [r4, #-22]
    mov r0, r0, lsl #0x1a
    mov r0, r0, lsr #0x1b
    cmp r0, #0x4
    movls r0, #0x1
    movhi r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_121c:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x1e
    cmp r0, #0x3
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1238:
    sub r0, r4, #0x18
    bl func_ov002_021b4be4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1244:
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
    beq .L_12e0
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_12ac:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x21
    beq .L_12d8
    ldrh r0, [r4, #-22]
    mov r0, r0, lsl #0x1a
    mov r0, r0, lsr #0x1b
    cmp r0, #0x4
    movls r0, #0x1
    ldmlsia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_12d8:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_12e0:
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
_LIT12: .word data_ov002_022cf16c
_LIT13: .word 0x0000123b
_LIT14: .word 0x0000188c
_LIT15: .word 0x66666667
_LIT16: .word 0x00000868
