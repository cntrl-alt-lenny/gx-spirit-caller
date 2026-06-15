; func_ov002_021b6600 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d016c
        .extern func_0202b878
        .extern func_ov002_021b4120
        .extern func_ov002_021bae7c
        .extern func_ov002_0220eb00
        .extern func_ov002_0223de94
        .global func_ov002_021b6600
        .arm
func_ov002_021b6600:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r5, r0
    ldrh r0, [r5, #0x2]
    mov r4, #0x0
    ldr r1, _LIT0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    sub r2, r4, #0x1
    bl func_ov002_021bae7c
    cmp r0, #0x0
    ldrh r0, [r5, #0x2]
    ldr r1, _LIT0
    mvn r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    orrne r4, r4, #0x2
    bl func_ov002_021bae7c
    cmp r0, #0x0
    ldrh r2, [r5]
    ldr r0, _LIT1
    orrne r4, r4, #0x1
    cmp r2, r0
    bgt .L_271c
    bge .L_30c8
    ldr r3, _LIT2
    cmp r2, r3
    bgt .L_2390
    bge .L_312c
    ldr r1, _LIT3
    cmp r2, r1
    bgt .L_21f8
    bge .L_2eb0
    ldr r0, _LIT4
    cmp r2, r0
    bgt .L_2110
    bge .L_2f14
    sub r1, r0, #0x5b
    cmp r2, r1
    bgt .L_20b8
    bge .L_3138
    sub r1, r3, #0x3a0
    cmp r2, r1
    bgt .L_2060
    bge .L_2eb0
    sub r1, r0, #0x1d0
    cmp r2, r1
    bgt .L_2050
    sub r0, r0, #0x1d0
    cmp r2, r0
    beq .L_2eb0
    b .L_3224
.L_2050:
    ldr r0, _LIT5
    cmp r2, r0
    beq .L_312c
    b .L_3224
.L_2060:
    sub r1, r0, #0xf2
    cmp r2, r1
    bgt .L_207c
    sub r0, r0, #0xf2
    cmp r2, r0
    beq .L_2ebc
    b .L_3224
.L_207c:
    sub r0, r0, #0xd7
    sub r0, r2, r0
    cmp r0, #0x9
    addls pc, pc, r0, lsl #0x2
    b .L_3224
    b .L_30c8
    b .L_312c
    b .L_312c
    b .L_312c
    b .L_312c
    b .L_2eb0
    b .L_2eb0
    b .L_2eb0
    b .L_2eb0
    b .L_3000
.L_20b8:
    ldr r1, _LIT6
    cmp r2, r1
    bgt .L_20ec
    bge .L_2eb0
    sub r0, r1, #0x1c
    cmp r2, r0
    bgt .L_20dc
    beq .L_2fb4
    b .L_3224
.L_20dc:
    sub r0, r1, #0x16
    cmp r2, r0
    beq .L_2eb0
    b .L_3224
.L_20ec:
    add r0, r1, #0x16
    cmp r2, r0
    bgt .L_2100
    beq .L_2eb0
    b .L_3224
.L_2100:
    add r0, r1, #0x23
    cmp r2, r0
    beq .L_31b4
    b .L_3224
.L_2110:
    sub r3, r1, #0x51
    cmp r2, r3
    bgt .L_2190
    bge .L_312c
    add r3, r0, #0xd2
    cmp r2, r3
    bgt .L_2164
    mov r1, r3
    cmp r2, r1
    bge .L_2fc0
    add r1, r0, #0xb3
    cmp r2, r1
    bgt .L_2154
    add r0, r0, #0xb3
    cmp r2, r0
    beq .L_2f14
    b .L_3224
.L_2154:
    add r0, r0, #0xcb
    cmp r2, r0
    beq .L_2eb0
    b .L_3224
.L_2164:
    add r3, r0, #0xd3
    cmp r2, r3
    bgt .L_2180
    add r0, r0, #0xd3
    cmp r2, r0
    beq .L_312c
    b .L_3224
.L_2180:
    sub r0, r1, #0x5d
    cmp r2, r0
    beq .L_3028
    b .L_3224
.L_2190:
    add r3, r0, #0x138
    cmp r2, r3
    bgt .L_21cc
    add r0, r0, #0x138
    cmp r2, r0
    bge .L_2eb0
    sub r0, r1, #0x50
    cmp r2, r0
    bgt .L_21bc
    beq .L_2eb0
    b .L_3224
.L_21bc:
    sub r0, r1, #0x38
    cmp r2, r0
    beq .L_2eb0
    b .L_3224
.L_21cc:
    add r3, r0, #0x150
    cmp r2, r3
    bgt .L_21e8
    add r0, r0, #0x150
    cmp r2, r0
    beq .L_31b4
    b .L_3224
.L_21e8:
    sub r0, r1, #0x17
    cmp r2, r0
    beq .L_31c0
    b .L_3224
.L_21f8:
    add r0, r1, #0x6f
    cmp r2, r0
    bgt .L_22c4
    bge .L_2eb0
    add r0, r1, #0x37
    cmp r2, r0
    bgt .L_2270
    bge .L_3158
    add r0, r1, #0x1c
    cmp r2, r0
    bgt .L_224c
    bge .L_2eb0
    add r0, r1, #0x1
    cmp r2, r0
    bgt .L_223c
    beq .L_312c
    b .L_3224
.L_223c:
    add r0, r1, #0x19
    cmp r2, r0
    beq .L_312c
    b .L_3224
.L_224c:
    add r0, r1, #0x21
    cmp r2, r0
    bgt .L_2260
    beq .L_2eb0
    b .L_3224
.L_2260:
    add r0, r1, #0x23
    cmp r2, r0
    beq .L_2eb0
    b .L_3224
.L_2270:
    cmp r2, #0x1380
    bgt .L_22a0
    bge .L_312c
    add r0, r1, #0x41
    cmp r2, r0
    bgt .L_2290
    beq .L_312c
    b .L_3224
.L_2290:
    add r0, r1, #0x42
    cmp r2, r0
    beq .L_3178
    b .L_3224
.L_22a0:
    add r0, r1, #0x54
    cmp r2, r0
    bgt .L_22b4
    beq .L_3000
    b .L_3224
.L_22b4:
    add r0, r1, #0x56
    cmp r2, r0
    beq .L_312c
    b .L_3224
.L_22c4:
    add r0, r1, #0xe8
    cmp r2, r0
    bgt .L_232c
    bge .L_2f34
    add r0, r1, #0xcb
    cmp r2, r0
    bgt .L_2308
    bge .L_2eb0
    add r0, r1, #0xb7
    cmp r2, r0
    bgt .L_22f8
    beq .L_30c8
    b .L_3224
.L_22f8:
    add r0, r1, #0xba
    cmp r2, r0
    beq .L_30c8
    b .L_3224
.L_2308:
    add r0, r1, #0xcc
    cmp r2, r0
    bgt .L_231c
    beq .L_3178
    b .L_3224
.L_231c:
    add r0, r1, #0xe6
    cmp r2, r0
    beq .L_30c8
    b .L_3224
.L_232c:
    sub r0, r3, #0x12
    cmp r2, r0
    bgt .L_2360
    bge .L_3208
    add r0, r1, #0xf3
    cmp r2, r0
    bgt .L_2350
    beq .L_3178
    b .L_3224
.L_2350:
    add r0, r1, #0xfc
    cmp r2, r0
    beq .L_2eb0
    b .L_3224
.L_2360:
    sub r0, r3, #0x2
    cmp r2, r0
    bgt .L_2380
    bge .L_2eb0
    sub r0, r3, #0x5
    cmp r2, r0
    beq .L_2eb0
    b .L_3224
.L_2380:
    sub r0, r3, #0x1
    cmp r2, r0
    beq .L_2eb0
    b .L_3224
.L_2390:
    add r1, r3, #0x13c
    cmp r2, r1
    bgt .L_2540
    mov r0, r1
    cmp r2, r0
    bge .L_2eb0
    add r0, r3, #0x91
    cmp r2, r0
    bgt .L_2474
    bge .L_3050
    add r0, r3, #0x17
    cmp r2, r0
    bgt .L_2420
    bge .L_3178
    add r0, r3, #0x5
    cmp r2, r0
    bgt .L_23fc
    bge .L_312c
    add r0, r3, #0x1
    cmp r2, r0
    bgt .L_23ec
    beq .L_312c
    b .L_3224
.L_23ec:
    add r0, r3, #0x4
    cmp r2, r0
    beq .L_312c
    b .L_3224
.L_23fc:
    add r0, r3, #0x9
    cmp r2, r0
    bgt .L_2410
    beq .L_312c
    b .L_3224
.L_2410:
    add r0, r3, #0x10
    cmp r2, r0
    beq .L_2eb0
    b .L_3224
.L_2420:
    add r0, r3, #0x62
    cmp r2, r0
    bgt .L_2454
    bge .L_2ebc
    add r0, r3, #0x41
    cmp r2, r0
    bgt .L_2444
    beq .L_2eb0
    b .L_3224
.L_2444:
    add r0, r3, #0x5a
    cmp r2, r0
    beq .L_2eb0
    b .L_3224
.L_2454:
    cmp r2, #0x14c0
    bgt .L_2464
    beq .L_3178
    b .L_3224
.L_2464:
    add r0, r3, #0x90
    cmp r2, r0
    beq .L_2f6c
    b .L_3224
.L_2474:
    add r0, r3, #0xcb
    cmp r2, r0
    bgt .L_24dc
    bge .L_312c
    add r0, r3, #0xa3
    cmp r2, r0
    bgt .L_24b8
    bge .L_312c
    add r0, r3, #0x96
    cmp r2, r0
    bgt .L_24a8
    beq .L_312c
    b .L_3224
.L_24a8:
    add r0, r3, #0x9d
    cmp r2, r0
    beq .L_3178
    b .L_3224
.L_24b8:
    add r0, r3, #0xa5
    cmp r2, r0
    bgt .L_24cc
    beq .L_2eb0
    b .L_3224
.L_24cc:
    add r0, r3, #0xb6
    cmp r2, r0
    beq .L_3194
    b .L_3224
.L_24dc:
    ldr r1, _LIT7
    cmp r2, r1
    bgt .L_2510
    bge .L_2eb0
    sub r0, r1, #0x45
    cmp r2, r0
    bgt .L_2500
    beq .L_2eb0
    b .L_3224
.L_2500:
    sub r0, r1, #0x40
    cmp r2, r0
    beq .L_2eb0
    b .L_3224
.L_2510:
    add r0, r1, #0x13
    cmp r2, r0
    bgt .L_2530
    bge .L_2fb4
    add r0, r1, #0xf
    cmp r2, r0
    beq .L_2ebc
    b .L_3224
.L_2530:
    add r0, r1, #0x21
    cmp r2, r0
    beq .L_2eb0
    b .L_3224
.L_2540:
    sub r1, r0, #0x98
    cmp r2, r1
    bgt .L_2630
    bge .L_30c8
    sub r1, r0, #0xd7
    cmp r2, r1
    bgt .L_25c8
    bge .L_2eb0
    sub r1, r0, #0x110
    cmp r2, r1
    bgt .L_259c
    sub r0, r0, #0x110
    cmp r2, r0
    bge .L_2ebc
    add r0, r3, #0x150
    cmp r2, r0
    bgt .L_258c
    beq .L_300c
    b .L_3224
.L_258c:
    ldr r0, _LIT8
    cmp r2, r0
    beq .L_30c8
    b .L_3224
.L_259c:
    add r1, r3, #0x1a4
    cmp r2, r1
    bgt .L_25b8
    mov r0, r1
    cmp r2, r0
    beq .L_2eb0
    b .L_3224
.L_25b8:
    sub r0, r0, #0xe1
    cmp r2, r0
    beq .L_2eb0
    b .L_3224
.L_25c8:
    sub r1, r0, #0xbf
    cmp r2, r1
    bgt .L_2604
    bge .L_30c8
    sub r1, r0, #0xc9
    cmp r2, r1
    bgt .L_25f4
    sub r0, r0, #0xc9
    cmp r2, r0
    beq .L_312c
    b .L_3224
.L_25f4:
    sub r0, r0, #0xc7
    cmp r2, r0
    beq .L_2eb0
    b .L_3224
.L_2604:
    sub r1, r0, #0xbd
    cmp r2, r1
    bgt .L_2620
    sub r0, r0, #0xbd
    cmp r2, r0
    beq .L_2eb0
    b .L_3224
.L_2620:
    sub r0, r0, #0x99
    cmp r2, r0
    beq .L_312c
    b .L_3224
.L_2630:
    sub r1, r0, #0x27
    cmp r2, r1
    bgt .L_26a8
    bge .L_2eb0
    add r1, r3, #0x250
    cmp r2, r1
    bgt .L_267c
    bge .L_312c
    sub r1, r0, #0x8f
    cmp r2, r1
    bgt .L_266c
    sub r0, r0, #0x8f
    cmp r2, r0
    beq .L_31b4
    b .L_3224
.L_266c:
    sub r0, r0, #0x64
    cmp r2, r0
    beq .L_2fe0
    b .L_3224
.L_267c:
    sub r1, r0, #0x39
    cmp r2, r1
    bgt .L_2698
    sub r0, r0, #0x39
    cmp r2, r0
    beq .L_2eb0
    b .L_3224
.L_2698:
    add r0, r3, #0x27c
    cmp r2, r0
    beq .L_2ebc
    b .L_3224
.L_26a8:
    sub r1, r0, #0x20
    cmp r2, r1
    bgt .L_26e4
    bge .L_307c
    sub r1, r0, #0x24
    cmp r2, r1
    bgt .L_26d4
    sub r0, r0, #0x24
    cmp r2, r0
    beq .L_3178
    b .L_3224
.L_26d4:
    add r0, r3, #0x28c
    cmp r2, r0
    beq .L_2eb0
    b .L_3224
.L_26e4:
    sub r1, r0, #0x9
    cmp r2, r1
    bgt .L_270c
    sub r0, r0, #0x9
    cmp r2, r0
    bge .L_31b4
    add r0, r3, #0x294
    cmp r2, r0
    beq .L_2eb0
    b .L_3224
.L_270c:
    sub r0, r0, #0x4
    cmp r2, r0
    beq .L_2ef4
    b .L_3224
.L_271c:
    ldr r1, _LIT9
    cmp r2, r1
    bgt .L_2ad4
    bge .L_2eb0
    sub r3, r1, #0x164
    cmp r2, r3
    bgt .L_2928
    bge .L_2eb0
    add r3, r0, #0x5c
    cmp r2, r3
    bgt .L_2834
    bge .L_312c
    add r3, r0, #0x41
    cmp r2, r3
    bgt .L_27cc
    bge .L_2eb0
    add r3, r0, #0x11
    cmp r2, r3
    bgt .L_27a0
    mov r1, r3
    cmp r2, r1
    bge .L_312c
    add r1, r0, #0x4
    cmp r2, r1
    bgt .L_2790
    add r0, r0, #0x4
    cmp r2, r0
    beq .L_2eb0
    b .L_3224
.L_2790:
    add r0, r0, #0xd
    cmp r2, r0
    beq .L_312c
    b .L_3224
.L_27a0:
    sub r3, r1, #0x214
    cmp r2, r3
    bgt .L_27bc
    mov r0, r3
    cmp r2, r0
    beq .L_3000
    b .L_3224
.L_27bc:
    add r0, r0, #0x31
    cmp r2, r0
    beq .L_2ebc
    b .L_3224
.L_27cc:
    add r1, r0, #0x50
    cmp r2, r1
    bgt .L_2808
    bge .L_30c8
    add r1, r0, #0x4c
    cmp r2, r1
    bgt .L_27f8
    add r0, r0, #0x4c
    cmp r2, r0
    beq .L_2eb0
    b .L_3224
.L_27f8:
    add r0, r0, #0x4d
    cmp r2, r0
    beq .L_2eb0
    b .L_3224
.L_2808:
    add r1, r0, #0x58
    cmp r2, r1
    bgt .L_2824
    add r0, r0, #0x58
    cmp r2, r0
    beq .L_2eb0
    b .L_3224
.L_2824:
    add r0, r0, #0x59
    cmp r2, r0
    beq .L_312c
    b .L_3224
.L_2834:
    add r3, r0, #0x94
    cmp r2, r3
    bgt .L_28b4
    bge .L_312c
    add r3, r0, #0x69
    cmp r2, r3
    bgt .L_2888
    mov r1, r3
    cmp r2, r1
    bge .L_2eb0
    add r1, r0, #0x63
    cmp r2, r1
    bgt .L_2878
    add r0, r0, #0x63
    cmp r2, r0
    beq .L_30c8
    b .L_3224
.L_2878:
    add r0, r0, #0x64
    cmp r2, r0
    beq .L_2ebc
    b .L_3224
.L_2888:
    add r3, r0, #0x6c
    cmp r2, r3
    bgt .L_28a4
    add r0, r0, #0x6c
    cmp r2, r0
    beq .L_312c
    b .L_3224
.L_28a4:
    sub r0, r1, #0x1bc
    cmp r2, r0
    beq .L_2eb0
    b .L_3224
.L_28b4:
    add r3, r0, #0x9d
    cmp r2, r3
    bgt .L_28f0
    bge .L_2eb0
    add r3, r0, #0x95
    cmp r2, r3
    bgt .L_28e0
    add r0, r0, #0x95
    cmp r2, r0
    beq .L_312c
    b .L_3224
.L_28e0:
    sub r0, r1, #0x198
    cmp r2, r0
    beq .L_2eb0
    b .L_3224
.L_28f0:
    add r3, r0, #0xa7
    cmp r2, r3
    bgt .L_2918
    add r0, r0, #0xa7
    cmp r2, r0
    bge .L_3178
    sub r0, r1, #0x188
    cmp r2, r0
    beq .L_3178
    b .L_3224
.L_2918:
    add r0, r0, #0xc9
    cmp r2, r0
    beq .L_2eb0
    b .L_3224
.L_2928:
    sub r3, r1, #0x64
    cmp r2, r3
    bgt .L_2a08
    bge .L_2eb0
    sub r3, r1, #0xc3
    cmp r2, r3
    bgt .L_29b0
    bge .L_30c8
    add r3, r0, #0x104
    cmp r2, r3
    bgt .L_298c
    mov r1, r3
    cmp r2, r1
    bge .L_30c8
    add r1, r0, #0xe3
    cmp r2, r1
    bgt .L_297c
    add r0, r0, #0xe3
    cmp r2, r0
    beq .L_2eb0
    b .L_3224
.L_297c:
    add r0, r0, #0xf8
    cmp r2, r0
    beq .L_2eb0
    b .L_3224
.L_298c:
    sub r0, r1, #0x128
    cmp r2, r0
    bgt .L_29a0
    beq .L_2eb0
    b .L_3224
.L_29a0:
    sub r0, r1, #0xd7
    cmp r2, r0
    beq .L_2eb0
    b .L_3224
.L_29b0:
    sub r0, r1, #0xa1
    cmp r2, r0
    bgt .L_29e4
    bge .L_2eb0
    sub r0, r1, #0xb5
    cmp r2, r0
    bgt .L_29d4
    beq .L_31dc
    b .L_3224
.L_29d4:
    sub r0, r1, #0xb1
    cmp r2, r0
    beq .L_2ebc
    b .L_3224
.L_29e4:
    sub r0, r1, #0x76
    cmp r2, r0
    bgt .L_29f8
    beq .L_2eb0
    b .L_3224
.L_29f8:
    sub r0, r1, #0x75
    cmp r2, r0
    beq .L_2eb0
    b .L_3224
.L_2a08:
    sub r0, r1, #0x50
    cmp r2, r0
    bgt .L_2a70
    bge .L_2eb0
    sub r0, r1, #0x56
    cmp r2, r0
    bgt .L_2a4c
    bge .L_2eb0
    sub r0, r1, #0x5c
    cmp r2, r0
    bgt .L_2a3c
    beq .L_2ebc
    b .L_3224
.L_2a3c:
    sub r0, r1, #0x5b
    cmp r2, r0
    beq .L_2ebc
    b .L_3224
.L_2a4c:
    sub r0, r1, #0x55
    cmp r2, r0
    bgt .L_2a60
    beq .L_30c8
    b .L_3224
.L_2a60:
    sub r0, r1, #0x52
    cmp r2, r0
    beq .L_2eb0
    b .L_3224
.L_2a70:
    sub r0, r1, #0x18
    cmp r2, r0
    bgt .L_2aa4
    bge .L_30c8
    sub r0, r1, #0x26
    cmp r2, r0
    bgt .L_2a94
    beq .L_2eb0
    b .L_3224
.L_2a94:
    sub r0, r1, #0x22
    cmp r2, r0
    beq .L_2f84
    b .L_3224
.L_2aa4:
    sub r0, r1, #0x6
    cmp r2, r0
    bgt .L_2ac4
    bge .L_2eb0
    sub r0, r1, #0xf
    cmp r2, r0
    beq .L_2eb0
    b .L_3224
.L_2ac4:
    sub r0, r1, #0x3
    cmp r2, r0
    beq .L_2eb0
    b .L_3224
.L_2ad4:
    ldr r0, _LIT10
    cmp r2, r0
    bgt .L_2cb4
    bge .L_2ebc
    sub r3, r0, #0x96
    cmp r2, r3
    bgt .L_2bd4
    bge .L_2eb0
    sub r3, r0, #0xcd
    cmp r2, r3
    bgt .L_2b6c
    bge .L_2ed8
    add r3, r1, #0x1e
    cmp r2, r3
    bgt .L_2b40
    mov r0, r3
    cmp r2, r0
    bge .L_2eb0
    add r0, r1, #0xf
    cmp r2, r0
    bgt .L_2b30
    beq .L_2eb0
    b .L_3224
.L_2b30:
    add r0, r1, #0x17
    cmp r2, r0
    beq .L_2eb0
    b .L_3224
.L_2b40:
    add r3, r1, #0x24
    cmp r2, r3
    bgt .L_2b5c
    mov r0, r3
    cmp r2, r0
    beq .L_3000
    b .L_3224
.L_2b5c:
    sub r0, r0, #0xf3
    cmp r2, r0
    beq .L_3000
    b .L_3224
.L_2b6c:
    sub r1, r0, #0xb3
    cmp r2, r1
    bgt .L_2ba8
    bge .L_3224
    sub r1, r0, #0xca
    cmp r2, r1
    bgt .L_2b98
    sub r0, r0, #0xca
    cmp r2, r0
    beq .L_312c
    b .L_3224
.L_2b98:
    sub r0, r0, #0xc6
    cmp r2, r0
    beq .L_2eb0
    b .L_3224
.L_2ba8:
    sub r1, r0, #0xad
    cmp r2, r1
    bgt .L_2bc4
    sub r0, r0, #0xad
    cmp r2, r0
    beq .L_2eb0
    b .L_3224
.L_2bc4:
    sub r0, r0, #0xa1
    cmp r2, r0
    beq .L_2ebc
    b .L_3224
.L_2bd4:
    sub r1, r0, #0x71
    cmp r2, r1
    bgt .L_2c4c
    bge .L_312c
    sub r1, r0, #0x82
    cmp r2, r1
    bgt .L_2c20
    bge .L_2eb0
    sub r1, r0, #0x84
    cmp r2, r1
    bgt .L_2c10
    sub r0, r0, #0x84
    cmp r2, r0
    beq .L_312c
    b .L_3224
.L_2c10:
    sub r0, r0, #0x83
    cmp r2, r0
    beq .L_2eb0
    b .L_3224
.L_2c20:
    sub r1, r0, #0x7e
    cmp r2, r1
    bgt .L_2c3c
    sub r0, r0, #0x7e
    cmp r2, r0
    beq .L_2f4c
    b .L_3224
.L_2c3c:
    sub r0, r0, #0x73
    cmp r2, r0
    beq .L_2eb0
    b .L_3224
.L_2c4c:
    sub r1, r0, #0x43
    cmp r2, r1
    bgt .L_2c88
    bge .L_2eb0
    sub r1, r0, #0x61
    cmp r2, r1
    bgt .L_2c78
    sub r0, r0, #0x61
    cmp r2, r0
    beq .L_2eb0
    b .L_3224
.L_2c78:
    sub r0, r0, #0x44
    cmp r2, r0
    beq .L_2eb0
    b .L_3224
.L_2c88:
    sub r1, r0, #0x2e
    cmp r2, r1
    bgt .L_2ca8
    bge .L_312c
    sub r0, r0, #0x3d
    cmp r2, r0
    beq .L_312c
    b .L_3224
.L_2ca8:
    cmp r2, #0x1a40
    beq .L_3000
    b .L_3224
.L_2cb4:
    add r1, r0, #0xa7
    cmp r2, r1
    bgt .L_2da4
    bge .L_2eb0
    add r1, r0, #0x5f
    cmp r2, r1
    bgt .L_2d3c
    bge .L_2f4c
    add r1, r0, #0x4f
    cmp r2, r1
    bgt .L_2d10
    bge .L_2eb0
    add r1, r0, #0x18
    cmp r2, r1
    bgt .L_2d00
    add r0, r0, #0x18
    cmp r2, r0
    beq .L_2ebc
    b .L_3224
.L_2d00:
    add r0, r0, #0x20
    cmp r2, r0
    beq .L_312c
    b .L_3224
.L_2d10:
    add r1, r0, #0x51
    cmp r2, r1
    bgt .L_2d2c
    add r0, r0, #0x51
    cmp r2, r0
    beq .L_312c
    b .L_3224
.L_2d2c:
    add r0, r0, #0x5c
    cmp r2, r0
    beq .L_30c8
    b .L_3224
.L_2d3c:
    add r1, r0, #0x7b
    cmp r2, r1
    bgt .L_2d78
    bge .L_2eb0
    add r1, r0, #0x69
    cmp r2, r1
    bgt .L_2d68
    add r0, r0, #0x69
    cmp r2, r0
    beq .L_2ebc
    b .L_3224
.L_2d68:
    add r0, r0, #0x6a
    cmp r2, r0
    beq .L_2eb0
    b .L_3224
.L_2d78:
    add r1, r0, #0x8f
    cmp r2, r1
    bgt .L_2d94
    add r0, r0, #0x8f
    cmp r2, r0
    beq .L_2eb0
    b .L_3224
.L_2d94:
    add r0, r0, #0xa6
    cmp r2, r0
    beq .L_2eb0
    b .L_3224
.L_2da4:
    add r1, r0, #0xc8
    cmp r2, r1
    bgt .L_2e18
    bge .L_3000
    add r1, r0, #0xc3
    cmp r2, r1
    bgt .L_2df0
    bge .L_3224
    add r1, r0, #0xb1
    cmp r2, r1
    bgt .L_2de0
    add r0, r0, #0xb1
    cmp r2, r0
    beq .L_312c
    b .L_3224
.L_2de0:
    add r0, r0, #0xb2
    cmp r2, r0
    beq .L_2eb0
    b .L_3224
.L_2df0:
    add r1, r0, #0xc4
    cmp r2, r1
    bgt .L_2e08
    add r0, r0, #0xc4
    cmp r2, r0
    b .L_3224
.L_2e08:
    add r0, r0, #0xc7
    cmp r2, r0
    beq .L_31fc
    b .L_3224
.L_2e18:
    add r1, r0, #0xfe
    cmp r2, r1
    bgt .L_2e54
    bge .L_2eb0
    add r1, r0, #0xcd
    cmp r2, r1
    bgt .L_2e44
    add r0, r0, #0xcd
    cmp r2, r0
    beq .L_2eb0
    b .L_3224
.L_2e44:
    add r0, r0, #0xdc
    cmp r2, r0
    beq .L_2eb0
    b .L_3224
.L_2e54:
    add r1, r0, #0x10c
    cmp r2, r1
    bgt .L_2ea4
    bge .L_2eb0
    add r0, r0, #0x100
    cmp r2, r0
    beq .L_2f4c
    b .L_3224
_LIT0: .word 0x00001256
_LIT1: .word 0x000016fe
_LIT2: .word 0x00001450
_LIT3: .word 0x00001339
_LIT4: .word 0x000011cf
_LIT5: .word 0x0000104c
_LIT6: .word 0x000011a6
_LIT7: .word 0x00001565
_LIT8: .word 0x000015e7
_LIT9: .word 0x0000192c
_LIT10: .word 0x00001a51
_LIT11: .word 0x00001b7f
.L_2ea4:
    ldr r0, _LIT11
    cmp r2, r0
    bne .L_3224
.L_2eb0:
    add sp, sp, #0x8
    mov r0, #0x2
    ldmia sp!, {r4, r5, r6, pc}
.L_2ebc:
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x12
    movs r0, r0, lsr #0x1e
    beq .L_3224
    add sp, sp, #0x8
    mov r0, #0x2
    ldmia sp!, {r4, r5, r6, pc}
.L_2ed8:
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x12
    movs r0, r0, lsr #0x1e
    bne .L_3224
    add sp, sp, #0x8
    mov r0, #0x2
    ldmia sp!, {r4, r5, r6, pc}
.L_2ef4:
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x1e
    cmp r0, #0x1
    bne .L_3224
    add sp, sp, #0x8
    mov r0, #0x2
    ldmia sp!, {r4, r5, r6, pc}
.L_2f14:
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x2
    bne .L_3224
    add sp, sp, #0x8
    mov r0, #0x2
    ldmia sp!, {r4, r5, r6, pc}
.L_2f34:
    ldrh r0, [r5, #0x8]
    cmp r0, #0x0
    beq .L_3224
    add sp, sp, #0x8
    mov r0, #0x2
    ldmia sp!, {r4, r5, r6, pc}
.L_2f4c:
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x16
    bne .L_3224
    add sp, sp, #0x8
    mov r0, #0x2
    ldmia sp!, {r4, r5, r6, pc}
.L_2f6c:
    ldrh r0, [r5, #0xc]
    cmp r0, #0x1
    bne .L_3224
    add sp, sp, #0x8
    mov r0, #0x2
    ldmia sp!, {r4, r5, r6, pc}
.L_2f84:
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x1e
    cmp r0, #0x2
    beq .L_3224
    ldr r0, [r5, #0x14]
    bl func_0202b878
    cmp r0, #0x16
    bne .L_3224
    add sp, sp, #0x8
    mov r0, #0x2
    ldmia sp!, {r4, r5, r6, pc}
.L_2fb4:
    add sp, sp, #0x8
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_2fc0:
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x1e
    cmp r0, #0x1
    beq .L_3224
    add sp, sp, #0x8
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_2fe0:
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x1e
    cmp r0, #0x1
    bne .L_3224
    add sp, sp, #0x8
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_3000:
    add sp, sp, #0x8
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, pc}
.L_300c:
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x12
    movs r0, r0, lsr #0x1e
    beq .L_3224
    add sp, sp, #0x8
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, pc}
.L_3028:
    ldrh r1, [r5, #0x2]
    ldr r0, _LIT12
    add sp, sp, #0x8
    mov r1, r1, lsl #0x1f
    ldr r0, [r0, #0xcec]
    mov r1, r1, lsr #0x1f
    cmp r1, r0
    movne r0, #0x1
    moveq r0, #0x2
    ldmia sp!, {r4, r5, r6, pc}
.L_3050:
    mov r0, r5
    mov r1, #0x0
    bl func_ov002_0223de94
    ldrh r1, [r5, #0x2]
    and r0, r0, #0xff
    add sp, sp, #0x8
    mov r1, r1, lsl #0x1f
    cmp r0, r1, lsr #0x1f
    moveq r0, #0x1
    movne r0, #0x2
    ldmia sp!, {r4, r5, r6, pc}
.L_307c:
    ldrh r0, [r5, #0x2]
    mov r1, r0, lsl #0x1a
    mov r3, r0, lsl #0x1f
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021b4120
    ldrh r1, [r5, #0x2]
    mov r1, r1, lsl #0x1f
    cmp r0, r1, lsr #0x1f
    addeq sp, sp, #0x8
    mov r1, r1, lsr #0x1f
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, pc}
    rsb r0, r0, #0x1
    cmp r1, r0
    bne .L_3224
    add sp, sp, #0x8
    mov r0, #0x2
    ldmia sp!, {r4, r5, r6, pc}
.L_30c8:
    add r1, sp, #0x0
    mov r0, r5
    mov r6, #0x0
    bl func_ov002_0220eb00
    ldrh r1, [r5, #0x2]
    add r0, sp, #0x0
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r2, [r0, r1, lsl #0x2]
    add r0, sp, #0x0
    rsb r1, r1, #0x1
    cmp r2, #0x0
    ldr r1, [r0, r1, lsl #0x2]
    orrlt r6, r6, #0x1
    cmp r1, #0x0
    orrlt r6, r6, #0x2
    cmp r2, #0x0
    andgt r0, r4, #0x1
    orrgt r6, r6, r0
    cmp r1, #0x0
    andgt r0, r4, #0x2
    orrgt r6, r6, r0
    add sp, sp, #0x8
    mov r0, r6
    ldmia sp!, {r4, r5, r6, pc}
.L_312c:
    add sp, sp, #0x8
    and r0, r4, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_3138:
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x1e
    cmp r0, #0x1
    bne .L_3224
    add sp, sp, #0x8
    and r0, r4, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_3158:
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x2
    bne .L_3224
    add sp, sp, #0x8
    and r0, r4, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_3178:
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x12
    movs r0, r0, lsr #0x1e
    beq .L_3224
    add sp, sp, #0x8
    and r0, r4, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_3194:
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x5
    beq .L_3224
    add sp, sp, #0x8
    and r0, r4, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_31b4:
    add sp, sp, #0x8
    and r0, r4, #0x2
    ldmia sp!, {r4, r5, r6, pc}
.L_31c0:
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x12
    movs r0, r0, lsr #0x1e
    beq .L_3224
    add sp, sp, #0x8
    and r0, r4, #0x2
    ldmia sp!, {r4, r5, r6, pc}
.L_31dc:
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x2
    bne .L_3224
    add sp, sp, #0x8
    and r0, r4, #0x2
    ldmia sp!, {r4, r5, r6, pc}
.L_31fc:
    add sp, sp, #0x8
    mov r0, r4
    ldmia sp!, {r4, r5, r6, pc}
.L_3208:
    ldrh r0, [r5, #0x2]
    add sp, sp, #0x8
    mov r0, r0, lsl #0x12
    movs r0, r0, lsr #0x1e
    andeq r0, r4, #0x3
    movne r0, #0x2
    ldmia sp!, {r4, r5, r6, pc}
.L_3224:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
_LIT12: .word data_ov002_022d016c
