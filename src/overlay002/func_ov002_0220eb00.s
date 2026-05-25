; func_ov002_0220eb00 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern data_ov002_022cd3f4
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf178
        .extern data_ov002_022cf180
        .extern data_ov002_022cf184
        .extern data_ov002_022cf188
        .extern data_ov002_022d0250
        .extern func_0202b8a8
        .extern func_0202b8f0
        .extern func_0202b920
        .extern func_0202e234
        .extern func_0202e258
        .extern func_0202e2f8
        .extern func_0202eac8
        .extern func_ov002_021b3618
        .extern func_ov002_021b4270
        .extern func_ov002_021bbc58
        .extern func_ov002_021bbd04
        .extern func_ov002_021bbeac
        .extern func_ov002_021bbf50
        .extern func_ov002_021bc000
        .extern func_ov002_021bcf00
        .extern func_ov002_021bd364
        .extern func_ov002_021c32d4
        .extern func_ov002_021c8470
        .global func_ov002_0220eb00
        .arm
func_ov002_0220eb00:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldrh ip, [r6, #0x8]
    ldrh r4, [r6, #0x2]
    mov r5, r1
    mov r0, #0x0
    str r0, [r5, #0x4]
    str r0, [r5, #0x0]
    mov r1, r4, lsl #0x11
    ldrh r2, [r6, #0x0]
    ldr r3, .L_0220ec10
    mov r4, r4, lsl #0x1f
    mov r1, r1, lsr #0x1f
    cmp r2, r3
    eor r4, r1, r4, lsr #0x1f
    and ip, ip, #0x1
    bgt .L_0220f0f0
    cmp r2, r3
    bge .L_0220fb64
    ldr r1, .L_0220ec14
    cmp r2, r1
    bgt .L_0220ee4c
    bge .L_0220f644
    ldr r3, .L_0220ec18
    cmp r2, r3
    bgt .L_0220ed10
    bge .L_0220f73c
    ldr r1, .L_0220ec1c
    cmp r2, r1
    bgt .L_0220ec78
    bge .L_0220f8fc
    sub r3, r1, #0xdf
    cmp r2, r3
    bgt .L_0220ebc4
    mov r0, r3
    cmp r2, r0
    bge .L_0220f8b0
    sub r0, r1, #0x170
    cmp r2, r0
    bgt .L_0220ebb4
    bge .L_0220f638
    ldr r0, .L_0220ec20
    cmp r2, r0
    beq .L_0220f818
    ldmia sp!, {r4, r5, r6, pc}
.L_0220ebb4:
    sub r0, r1, #0x10c
    cmp r2, r0
    beq .L_0220f82c
    ldmia sp!, {r4, r5, r6, pc}
.L_0220ebc4:
    sub r3, r1, #0x32
    cmp r2, r3
    bgt .L_0220ec54
    bge .L_0220f9b4
    sub r1, r1, #0xc4
    sub r1, r2, r1
    cmp r1, #0x9
    addls pc, pc, r1, lsl #0x2
    ldmia sp!, {r4, r5, r6, pc}
.L_0220ebe8: ; jump table
    b .L_0220f5fc ; case 0
    b .L_0220f608 ; case 1
    b .L_0220f614 ; case 2
    b .L_0220f620 ; case 3
    b .L_0220f62c ; case 4
    b .L_0220f940 ; case 5
    b .L_0220f94c ; case 6
    b .L_0220f958 ; case 7
    b .L_0220f964 ; case 8
    b .L_0220f800 ; case 9
.L_0220ec10:
        .word   0x170b
.L_0220ec14:
        .word   0x1455
.L_0220ec18:
        .word   0x1322
.L_0220ec1c:
        .word   0x11bc
.L_0220ec20:
        .word   0xfff
.L_0220ec24:
        .word   0x1190
.L_0220ec28:
        .word   0x1578
.L_0220ec2c:
        .word   0x15ee
.L_0220ec30:
        .word   0x191d
.L_0220ec34:
        .word   0x1ae0
.L_0220ec38:
        .word   func_0202eac8
.L_0220ec3c:
        .word   0xffff
.L_0220ec40:
        .word   0xfffffa24
.L_0220ec44:
        .word   0xbb8
.L_0220ec48:
        .word   0x868
.L_0220ec4c:
        .word   data_ov002_022cf178
.L_0220ec50:
        .word   data_ov002_022cd3f4
.L_0220ec54:
    ldr r0, .L_0220ec24
    cmp r2, r0
    bgt .L_0220ec68
    beq .L_0220faf4
    ldmia sp!, {r4, r5, r6, pc}
.L_0220ec68:
    add r0, r0, #0x16
    cmp r2, r0
    beq .L_0220f8b0
    ldmia sp!, {r4, r5, r6, pc}
.L_0220ec78:
    add r6, r1, #0xe6
    cmp r2, r6
    bgt .L_0220ecc0
    mov r3, r6
    cmp r2, r3
    bge .L_0220f644
    add r3, r1, #0x13
    cmp r2, r3
    bgt .L_0220ecb0
    bge .L_0220f99c
    add r0, r1, #0xd
    cmp r2, r0
    beq .L_0220f9cc
    ldmia sp!, {r4, r5, r6, pc}
.L_0220ecb0:
    add r0, r1, #0xde
    cmp r2, r0
    beq .L_0220fad4
    ldmia sp!, {r4, r5, r6, pc}
.L_0220ecc0:
    sub r6, r3, #0x39
    cmp r2, r6
    bgt .L_0220ecec
    sub r3, r3, #0x39
    cmp r2, r3
    bge .L_0220f9dc
    add r0, r1, #0x12c
    cmp r2, r0
    moveq r0, #0x190
    streq r0, [r5, ip, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220ecec:
    sub r0, r3, #0x21
    cmp r2, r0
    bgt .L_0220ed00
    beq .L_0220f9e8
    ldmia sp!, {r4, r5, r6, pc}
.L_0220ed00:
    sub r0, r3, #0x1b
    cmp r2, r0
    beq .L_0220fa08
    ldmia sp!, {r4, r5, r6, pc}
.L_0220ed10:
    add ip, r3, #0xff
    cmp r2, ip
    bgt .L_0220edb4
    mov r1, ip
    cmp r2, r1
    bge .L_0220fa54
    add r1, r3, #0x59
    cmp r2, r1
    bgt .L_0220ed70
    bge .L_0220f73c
    add r1, r3, #0x4e
    cmp r2, r1
    bgt .L_0220ed60
    mov r0, r1
    cmp r2, r0
    bge .L_0220f6e0
    add r0, r3, #0x33
    cmp r2, r0
    beq .L_0220f8b0
    ldmia sp!, {r4, r5, r6, pc}
.L_0220ed60:
    add r1, r3, #0x58
    cmp r2, r1
    beq .L_0220f65c
    ldmia sp!, {r4, r5, r6, pc}
.L_0220ed70:
    add r0, r3, #0xce
    cmp r2, r0
    bgt .L_0220ed90
    bge .L_0220f970
    add r0, r3, #0x86
    cmp r2, r0
    beq .L_0220f8b0
    ldmia sp!, {r4, r5, r6, pc}
.L_0220ed90:
    add r0, r3, #0xd1
    cmp r2, r0
    bgt .L_0220eda4
    beq .L_0220f970
    ldmia sp!, {r4, r5, r6, pc}
.L_0220eda4:
    add r0, r3, #0xfd
    cmp r2, r0
    beq .L_0220f74c
    ldmia sp!, {r4, r5, r6, pc}
.L_0220edb4:
    add ip, r3, #0x12c
    cmp r2, ip
    bgt .L_0220ee04
    add r3, r3, #0x12c
    cmp r2, r3
    bge .L_0220fb14
    sub r3, r1, #0x20
    cmp r2, r3
    bgt .L_0220edf4
    mov r0, r3
    cmp r2, r0
    bge .L_0220f8b0
    sub r0, r1, #0x29
    cmp r2, r0
    beq .L_0220f638
    ldmia sp!, {r4, r5, r6, pc}
.L_0220edf4:
    sub r1, r1, #0xa
    cmp r2, r1
    beq .L_0220f910
    ldmia sp!, {r4, r5, r6, pc}
.L_0220ee04:
    sub r0, r1, #0x5
    cmp r2, r0
    bgt .L_0220ee24
    bge .L_0220f644
    sub r0, r1, #0x6
    cmp r2, r0
    beq .L_0220fb14
    ldmia sp!, {r4, r5, r6, pc}
.L_0220ee24:
    sub r0, r1, #0x4
    cmp r2, r0
    bgt .L_0220ee38
    beq .L_0220f644
    ldmia sp!, {r4, r5, r6, pc}
.L_0220ee38:
    sub r0, r1, #0x1
    cmp r2, r0
    moveq r0, #0x320
    streq r0, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220ee4c:
    sub ip, r3, #0x170
    cmp r2, ip
    bgt .L_0220ef9c
    sub r3, r3, #0x170
    cmp r2, r3
    bge .L_0220fa70
    add r3, r1, #0xb1
    cmp r2, r3
    bgt .L_0220ef04
    mov r0, r3
    cmp r2, r0
    bge .L_0220f7d8
    add r0, r1, #0x5d
    cmp r2, r0
    bgt .L_0220eec0
    bge .L_0220f8b0
    add r0, r1, #0xb
    cmp r2, r0
    bgt .L_0220eeb0
    bge .L_0220f8fc
    add r0, r1, #0x4
    cmp r2, r0
    moveq r0, #0xc8
    streq r0, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220eeb0:
    add r0, r1, #0x12
    cmp r2, r0
    beq .L_0220f644
    ldmia sp!, {r4, r5, r6, pc}
.L_0220eec0:
    add r0, r1, #0x91
    cmp r2, r0
    bgt .L_0220eee0
    bge .L_0220f760
    add r0, r1, #0x8b
    cmp r2, r0
    beq .L_0220f8e8
    ldmia sp!, {r4, r5, r6, pc}
.L_0220eee0:
    add r0, r1, #0x98
    cmp r2, r0
    bgt .L_0220eef4
    beq .L_0220f7d8
    ldmia sp!, {r4, r5, r6, pc}
.L_0220eef4:
    add r0, r1, #0x9e
    cmp r2, r0
    beq .L_0220f650
    ldmia sp!, {r4, r5, r6, pc}
.L_0220ef04:
    add r3, r1, #0x110
    cmp r2, r3
    bgt .L_0220ef50
    mov r0, r3
    cmp r2, r0
    bge .L_0220f8b0
    add r0, r1, #0xcb
    cmp r2, r0
    bgt .L_0220ef40
    bge .L_0220f8b0
    add r0, r1, #0xc6
    cmp r2, r0
    moveq r0, #0xfa0
    streq r0, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220ef40:
    add r0, r1, #0xd0
    cmp r2, r0
    beq .L_0220f8b0
    ldmia sp!, {r4, r5, r6, pc}
.L_0220ef50:
    ldr r3, .L_0220ec28
    cmp r2, r3
    bgt .L_0220ef70
    bge .L_0220f9a8
    sub r0, r3, #0x4
    cmp r2, r0
    beq .L_0220f88c
    ldmia sp!, {r4, r5, r6, pc}
.L_0220ef70:
    add r1, r3, #0xe
    cmp r2, r1
    bgt .L_0220ef8c
    mov r0, r1
    cmp r2, r0
    beq .L_0220f8b0
    ldmia sp!, {r4, r5, r6, pc}
.L_0220ef8c:
    add r1, r3, #0x14
    cmp r2, r1
    beq .L_0220f8d8
    ldmia sp!, {r4, r5, r6, pc}
.L_0220ef9c:
    sub ip, r3, #0x71
    cmp r2, ip
    bgt .L_0220f048
    bge .L_0220f9c0
    add ip, r1, #0x1c8
    cmp r2, ip
    bgt .L_0220eff4
    add r1, r1, #0x1c8
    cmp r2, r1
    bge .L_0220fa2c
    ldr r1, .L_0220ec2c
    cmp r2, r1
    bgt .L_0220efe4
    bge .L_0220fa88
    sub r1, r1, #0x7
    cmp r2, r1
    beq .L_0220f774
    ldmia sp!, {r4, r5, r6, pc}
.L_0220efe4:
    add r0, r1, #0x6
    cmp r2, r0
    beq .L_0220faa0
    ldmia sp!, {r4, r5, r6, pc}
.L_0220eff4:
    sub ip, r3, #0xd4
    cmp r2, ip
    bgt .L_0220f01c
    mov r1, ip
    cmp r2, r1
    bge .L_0220f8c4
    sub r1, r3, #0xe4
    cmp r2, r1
    beq .L_0220f8a0
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f01c:
    sub ip, r3, #0xcc
    cmp r2, ip
    bgt .L_0220f038
    mov r1, ip
    cmp r2, r1
    beq .L_0220fd84
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f038:
    add r0, r1, #0x1ec
    cmp r2, r0
    beq .L_0220fb34
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f048:
    sub ip, r3, #0x2f
    cmp r2, ip
    bgt .L_0220f0a4
    bge .L_0220fcdc
    add ip, r1, #0x270
    cmp r2, ip
    bgt .L_0220f080
    mov r0, ip
    cmp r2, r0
    bge .L_0220fcbc
    sub r0, r3, #0x6b
    cmp r2, r0
    beq .L_0220f7a8
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f080:
    sub r1, r3, #0x3f
    cmp r2, r1
    bgt .L_0220f094
    beq .L_0220fccc
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f094:
    sub r0, r3, #0x31
    cmp r2, r0
    beq .L_0220f6b0
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f0a4:
    sub ip, r3, #0x11
    cmp r2, ip
    bgt .L_0220f0cc
    mov r0, ip
    cmp r2, r0
    bge .L_0220f8fc
    add r0, r1, #0x2a0
    cmp r2, r0
    beq .L_0220f73c
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f0cc:
    sub r1, r3, #0xd
    cmp r2, r1
    bgt .L_0220f0e0
    beq .L_0220fcec
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f0e0:
    sub r0, r3, #0x9
    cmp r2, r0
    beq .L_0220f8e8
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f0f0:
    ldr r1, .L_0220ec30
    cmp r2, r1
    bgt .L_0220f38c
    bge .L_0220f84c
    add lr, r3, #0xbc
    cmp r2, lr
    bgt .L_0220f260
    mov ip, lr
    cmp r2, ip
    bge .L_0220fbb4
    add ip, r3, #0x57
    cmp r2, ip
    bgt .L_0220f1c8
    bge .L_0220f8b0
    add ip, r3, #0x43
    cmp r2, ip
    bgt .L_0220f170
    mov r1, ip
    cmp r2, r1
    bge .L_0220fe14
    add r1, r3, #0x3f
    cmp r2, r1
    bgt .L_0220f160
    bge .L_0220fc54
    add r1, r3, #0x34
    cmp r2, r1
    beq .L_0220fda4
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f160:
    add r0, r3, #0x40
    cmp r2, r0
    beq .L_0220fc54
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f170:
    add ip, r3, #0x4c
    cmp r2, ip
    bgt .L_0220f198
    mov r0, ip
    cmp r2, r0
    bge .L_0220f680
    add r0, r3, #0x4b
    cmp r2, r0
    beq .L_0220f8b0
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f198:
    add ip, r3, #0x4f
    cmp r2, ip
    bgt .L_0220f1b8
    mov r0, ip
    cmp r2, r0
    ldreqh r0, [r6, #0xc]
    streq r0, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f1b8:
    sub r1, r1, #0x1bc
    cmp r2, r1
    beq .L_0220fd6c
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f1c8:
    add ip, r3, #0x88
    cmp r2, ip
    bgt .L_0220f210
    mov r1, ip
    cmp r2, r1
    bge .L_0220f650
    add r1, r3, #0x65
    cmp r2, r1
    bgt .L_0220f200
    bge .L_0220fe00
    add r0, r3, #0x5c
    cmp r2, r0
    beq .L_0220fddc
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f200:
    add r0, r3, #0x87
    cmp r2, r0
    beq .L_0220fc8c
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f210:
    add r6, r3, #0x90
    cmp r2, r6
    bgt .L_0220f238
    mov r1, r6
    cmp r2, r1
    bge .L_0220f8e8
    add r1, r3, #0x89
    cmp r2, r1
    beq .L_0220fd14
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f238:
    add r0, r3, #0x99
    cmp r2, r0
    bgt .L_0220f24c
    beq .L_0220f644
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f24c:
    sub r0, r1, #0x178
    cmp r2, r0
    moveq r0, #0x2bc
    streq r0, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f260:
    sub lr, r1, #0x92
    cmp r2, lr
    bgt .L_0220f2f4
    bge .L_0220fd48
    add lr, r3, #0xf9
    cmp r2, lr
    bgt .L_0220f2b0
    bge .L_0220fd24
    sub r0, r1, #0x13c
    cmp r2, r0
    bgt .L_0220f2a0
    bge .L_0220f8b0
    add r0, r3, #0xbd
    cmp r2, r0
    beq .L_0220fbec
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f2a0:
    add r0, r3, #0xf7
    cmp r2, r0
    beq .L_0220fe30
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f2b0:
    sub r3, r1, #0xb4
    cmp r2, r3
    bgt .L_0220f2d0
    bge .L_0220fe78
    sub r0, r1, #0xc8
    cmp r2, r0
    beq .L_0220f818
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f2d0:
    sub r0, r1, #0xa6
    cmp r2, r0
    bgt .L_0220f2e4
    beq .L_0220f72c
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f2e4:
    sub r0, r1, #0xa2
    cmp r2, r0
    beq .L_0220f8b0
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f2f4:
    sub r0, r1, #0x4c
    cmp r2, r0
    bgt .L_0220f348
    bge .L_0220fb34
    sub r0, r1, #0x66
    cmp r2, r0
    bgt .L_0220f324
    bge .L_0220f8b0
    sub r0, r1, #0x67
    cmp r2, r0
    beq .L_0220f88c
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f324:
    sub r0, r1, #0x55
    cmp r2, r0
    bgt .L_0220f338
    beq .L_0220fb34
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f338:
    sub r0, r1, #0x4d
    cmp r2, r0
    beq .L_0220fc24
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f348:
    sub r0, r1, #0x43
    cmp r2, r0
    bgt .L_0220f368
    bge .L_0220f818
    sub r0, r1, #0x46
    cmp r2, r0
    beq .L_0220fe14
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f368:
    sub r0, r1, #0x13
    cmp r2, r0
    bgt .L_0220f37c
    beq .L_0220f920
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f37c:
    sub r0, r1, #0x9
    cmp r2, r0
    beq .L_0220fe9c
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f38c:
    cmp r2, #0x1a40
    bgt .L_0220f4c0
    bge .L_0220ff84
    add r3, r1, #0x87
    cmp r2, r3
    bgt .L_0220f434
    bge .L_0220f8fc
    add r3, r1, #0x26
    cmp r2, r3
    bgt .L_0220f3f0
    mov r0, r3
    cmp r2, r0
    bge .L_0220fb34
    add r0, r1, #0xf
    cmp r2, r0
    bgt .L_0220f3e0
    bge .L_0220fed0
    add r0, r1, #0xc
    cmp r2, r0
    beq .L_0220f818
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f3e0:
    add r0, r1, #0x1e
    cmp r2, r0
    beq .L_0220fb34
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f3f0:
    add r3, r1, #0x33
    cmp r2, r3
    bgt .L_0220f410
    bge .L_0220febc
    add r0, r1, #0x2d
    cmp r2, r0
    beq .L_0220fef0
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f410:
    add r0, r1, #0x67
    cmp r2, r0
    bgt .L_0220f424
    beq .L_0220ff3c
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f424:
    add r0, r1, #0x6a
    cmp r2, r0
    beq .L_0220fb64
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f434:
    add r3, r1, #0xb6
    cmp r2, r3
    bgt .L_0220f47c
    bge .L_0220fb34
    add r3, r1, #0xb1
    cmp r2, r3
    bgt .L_0220f46c
    mov r0, r3
    cmp r2, r0
    bge .L_0220f86c
    add r0, r1, #0xb0
    cmp r2, r0
    beq .L_0220f698
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f46c:
    add r1, r1, #0xb2
    cmp r2, r1
    beq .L_0220ff5c
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f47c:
    add r0, r1, #0xd3
    cmp r2, r0
    bgt .L_0220f49c
    bge .L_0220f8fc
    add r0, r1, #0xc3
    cmp r2, r0
    beq .L_0220fb64
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f49c:
    add r0, r1, #0xf7
    cmp r2, r0
    bgt .L_0220f4b0
    beq .L_0220f6c4
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f4b0:
    rsb r0, r1, #0x3340
    cmp r2, r0
    beq .L_0220fb8c
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f4c0:
    ldr r1, .L_0220ec34
    cmp r2, r1
    bgt .L_0220f55c
    bge .L_0220f8b0
    sub r3, r1, #0x40
    cmp r2, r3
    bgt .L_0220f518
    mov r0, r3
    cmp r2, r0
    bge .L_0220f8fc
    sub r0, r1, #0x77
    cmp r2, r0
    bgt .L_0220f508
    bge .L_0220f8b0
    sub r0, r1, #0x8f
    cmp r2, r0
    beq .L_0220f88c
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f508:
    sub r0, r1, #0x6f
    cmp r2, r0
    beq .L_0220ffcc
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f518:
    sub r3, r1, #0x33
    cmp r2, r3
    bgt .L_0220f538
    bge .L_0220fff4
    sub r0, r1, #0x3e
    cmp r2, r0
    beq .L_0220f7ec
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f538:
    sub r0, r1, #0x30
    cmp r2, r0
    bgt .L_0220f54c
    beq .L_0220f88c
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f54c:
    sub r0, r1, #0x26
    cmp r2, r0
    beq .L_0220f8c4
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f55c:
    add r3, r1, #0x38
    cmp r2, r3
    bgt .L_0220f5b0
    bge .L_02210060
    add r3, r1, #0x18
    cmp r2, r3
    bgt .L_0220f58c
    bge .L_02210040
    add r0, r1, #0x17
    cmp r2, r0
    beq .L_0220f818
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f58c:
    add r0, r1, #0x22
    cmp r2, r0
    bgt .L_0220f5a0
    beq .L_0220f638
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f5a0:
    add r0, r1, #0x23
    cmp r2, r0
    beq .L_0220f8b0
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f5b0:
    add r3, r1, #0x4d
    cmp r2, r3
    bgt .L_0220f5d0
    bge .L_02210080
    add r1, r1, #0x39
    cmp r2, r1
    beq .L_02210070
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f5d0:
    add r3, r1, #0x6f
    cmp r2, r3
    bgt .L_0220f5ec
    mov r0, r3
    cmp r2, r0
    beq .L_022100b4
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f5ec:
    add r1, r1, #0x9f
    cmp r2, r1
    beq .L_0220f930
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f5fc:
    mov r0, #0xc8
    str r0, [r5, ip, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f608:
    mov r0, #0x1f4
    str r0, [r5, ip, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f614:
    mov r0, #0x258
    str r0, [r5, ip, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f620:
    mov r0, #0x320
    str r0, [r5, ip, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f62c:
    mov r0, #0x3e8
    str r0, [r5, ip, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f638:
    mov r0, #0x1f4
    str r0, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f644:
    mov r0, #0x3e8
    str r0, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f650:
    mov r0, #0x7d0
    str r0, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f65c:
    bl func_ov002_021bbf50
    mov r6, r0
    mov r0, #0x1
    bl func_ov002_021bbf50
    add r1, r6, r0
    mov r0, #0x12c
    mul r0, r1, r0
    str r0, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f680:
    mov r0, r4
    bl func_ov002_021bbf50
    mov r1, #0x190
    mul r1, r0, r1
    str r1, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f698:
    mov r0, r4
    bl func_ov002_021bbf50
    mov r1, #0x320
    mul r1, r0, r1
    str r1, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f6b0:
    ldr r1, [r6, #0x14]
    mov r0, #0x1f4
    mul r0, r1, r0
    str r0, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f6c4:
    ldr r1, .L_0220ec38
    mov r0, r4
    bl func_ov002_021bc000
    mov r1, #0x3e8
    mul r1, r0, r1
    str r1, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f6e0:
    ldrh r0, [r6, #0x2]
    mov r1, r0, lsl #0x1a
    mov r2, r0, lsl #0x1f
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021b3618
    ldr r1, .L_0220ec3c
    cmp r0, r1
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    and r0, r0, #0xff
    and r1, r1, #0xff
    bl func_ov002_021c8470
    add r0, r0, #0x1
    mov r0, r0, asr #0x1
    str r0, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f72c:
    rsb r0, r4, #0x1
    mov r1, #0x1f4
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f73c:
    rsb r0, r4, #0x1
    mov r1, #0x3e8
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f74c:
    mov r1, #0x3e8
    str r1, [r5, r4, lsl #0x2]
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f760:
    ldrh r1, [r6, #0x8]
    mov r0, #0x3e8
    mul r0, r1, r0
    str r0, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f774:
    ldrh r1, [r6, #0xc]
    cmp r1, #0x1
    beq .L_0220f78c
    cmp r1, #0x2
    beq .L_0220f798
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f78c:
    mov r0, #0x4b0
    str r0, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f798:
    sub r1, r0, #0x320
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f7a8:
    ldrh r0, [r6, #0xa]
    bl func_0202e2f8
    cmp r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    ldrh r0, [r6, #0xa]
    bl func_0202e234
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r0, [r6, #0xa]
    bl func_0202b8f0
    str r0, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f7d8:
    ldr r0, [r6, #0x14]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f7ec:
    ldrh r1, [r6, #0x8]
    mov r0, #0x190
    mul r0, r1, r0
    str r0, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f800:
    sub r2, r0, #0x3e8
    rsb r1, r4, #0x1
    str r2, [r5, r1, lsl #0x2]
    sub r0, r0, #0x1f4
    str r0, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f818:
    ldrh r1, [r6, #0x8]
    rsb r0, r4, #0x1
    rsb r1, r1, #0x0
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f82c:
    rsb r4, r4, #0x1
    mov r0, r4
    bl func_ov002_021bcf00
    mov r1, #0x1f4
    rsb r1, r1, #0x0
    mul r1, r0, r1
    str r1, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f84c:
    rsb r4, r4, #0x1
    mov r0, r4
    bl func_ov002_021bbf50
    mov r1, #0x12c
    rsb r1, r1, #0x0
    mul r1, r0, r1
    str r1, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f86c:
    rsb r4, r4, #0x1
    mov r0, r4
    bl func_ov002_021bbf50
    mov r1, #0x258
    rsb r1, r1, #0x0
    mul r1, r0, r1
    str r1, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f88c:
    mov r1, #0x12c
    rsb r1, r1, #0x0
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f8a0:
    sub r1, r0, #0x190
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f8b0:
    mov r1, #0x1f4
    rsb r1, r1, #0x0
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f8c4:
    mov r1, #0x258
    rsb r1, r1, #0x0
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f8d8:
    sub r1, r0, #0x2bc
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f8e8:
    mov r1, #0x320
    rsb r1, r1, #0x0
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f8fc:
    mov r1, #0x3e8
    rsb r1, r1, #0x0
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f910:
    sub r1, r0, #0x4b0
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f920:
    ldr r1, .L_0220ec40
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f930:
    sub r1, r0, #0x7d0
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f940:
    sub r0, r0, #0xc8
    str r0, [r5, ip, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f94c:
    sub r0, r0, #0x1f4
    str r0, [r5, ip, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f958:
    sub r0, r0, #0x258
    str r0, [r5, ip, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f964:
    sub r0, r0, #0x320
    str r0, [r5, ip, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f970:
    ldrh r0, [r6, #0x2]
    mov r1, r0, lsl #0x1a
    mov r2, r0, lsl #0x1f
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021b3618
    mov r1, #0x1f4
    and r0, r0, #0xff
    rsb r1, r1, #0x0
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f99c:
    sub r0, r0, #0x12c
    str r0, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f9a8:
    sub r0, r0, #0x3e8
    str r0, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f9b4:
    sub r0, r0, #0x7d0
    str r0, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f9c0:
    sub r0, r0, #0x320
    str r0, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f9cc:
    ldr r1, .L_0220ec44
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f9dc:
    sub r0, r0, #0x12c
    str r0, [r5, ip, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220f9e8:
    rsb r4, r4, #0x1
    mov r0, r4
    bl func_ov002_021bbf50
    mov r1, #0x1f4
    rsb r1, r1, #0x0
    mul r1, r0, r1
    str r1, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220fa08:
    ldr r0, .L_0220ec48
    and r1, ip, #0x1
    mul r2, r1, r0
    ldr r1, .L_0220ec4c
    sub r0, r0, #0x930
    ldr r1, [r1, r2]
    mul r0, r1, r0
    str r0, [r5, ip, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220fa2c:
    rsb r4, r4, #0x1
    ldr r1, .L_0220ec48
    and r2, r4, #0x1
    mul r3, r2, r1
    ldr r1, .L_0220ec4c
    sub r0, r0, #0x190
    ldr r1, [r1, r3]
    mul r0, r1, r0
    str r0, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220fa54:
    ldrh r1, [r6, #0x8]
    cmp r1, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    sub r1, r0, #0x1f4
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220fa70:
    ldrh r2, [r6, #0x8]
    sub r0, r0, #0x12c
    rsb r1, r4, #0x1
    mul r0, r2, r0
    str r0, [r5, r1, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220fa88:
    ldrh r2, [r6, #0xa]
    sub r0, r0, #0x3e8
    rsb r1, r4, #0x1
    mul r0, r2, r0
    str r0, [r5, r1, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220faa0:
    rsb r4, r4, #0x1
    mov r0, r4
    bl func_ov002_021bbeac
    ldr r1, .L_0220ec48
    and r2, r4, #0x1
    mul r3, r2, r1
    ldr r2, .L_0220ec4c
    sub r1, r1, #0x930
    ldr r2, [r2, r3]
    add r0, r2, r0
    mul r1, r0, r1
    str r1, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220fad4:
    ldr r1, .L_0220ec50
    ldr r0, [r1, #0x0]
    ldr r1, [r1, #0x1c]
    bl func_ov002_021c8470
    rsb r1, r0, #0x0
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220faf4:
    ldrh r0, [r6, #0xc]
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r1, #0x3e8
    rsb r1, r1, #0x0
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220fb14:
    ldrh r0, [r6, #0xc]
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r1, #0x320
    rsb r1, r1, #0x0
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220fb34:
    ldr r1, [r6, #0x14]
    ldr r0, .L_022100d4
    mov r1, r1, lsl #0x17
    mov r1, r1, lsr #0x15
    ldrh r0, [r0, r1]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b8f0
    rsb r1, r0, #0x0
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220fb64:
    ldr r1, [r6, #0x14]
    ldr r0, .L_022100d4
    mov r1, r1, lsl #0x17
    mov r1, r1, lsr #0x15
    ldrh r0, [r0, r1]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b8f0
    str r0, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220fb8c:
    ldr r1, [r6, #0x14]
    ldr r0, .L_022100d4
    mov r1, r1, lsl #0x17
    mov r1, r1, lsr #0x15
    ldrh r0, [r0, r1]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b920
    str r0, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220fbb4:
    ldr r1, [r6, #0x14]
    ldr r0, .L_022100d4
    mov r1, r1, lsl #0x17
    mov r1, r1, lsr #0x15
    ldrh r0, [r0, r1]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b8f0
    rsb r0, r0, #0x0
    add r0, r0, r0, lsr #0x1f
    mov r1, r0, asr #0x1
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220fbec:
    ldr r1, [r6, #0x14]
    ldr r0, .L_022100d4
    mov r1, r1, lsl #0x17
    mov r1, r1, lsr #0x15
    ldrh r0, [r0, r1]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b920
    rsb r0, r0, #0x0
    add r0, r0, r0, lsr #0x1f
    mov r1, r0, asr #0x1
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220fc24:
    ldr r1, [r6, #0x14]
    ldr r0, .L_022100d4
    mov r1, r1, lsl #0x17
    mov r1, r1, lsr #0x15
    ldrh r0, [r0, r1]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b920
    rsb r1, r0, #0x0
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220fc54:
    ldr r1, [r6, #0x14]
    ldr r0, .L_022100d4
    mov r1, r1, lsl #0x17
    mov r1, r1, lsr #0x15
    ldrh r0, [r0, r1]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b8a8
    mov r1, #0x1f4
    rsb r1, r1, #0x0
    mul r1, r0, r1
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220fc8c:
    ldr r1, [r6, #0x14]
    ldr r0, .L_022100d4
    mov r1, r1, lsl #0x17
    mov r1, r1, lsr #0x15
    ldrh r0, [r0, r1]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b8a8
    mov r1, #0x12c
    mul r1, r0, r1
    str r1, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220fcbc:
    ldr r1, .L_022100d8
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220fccc:
    sub r1, r0, #0x2bc
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220fcdc:
    ldr r1, .L_022100dc
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220fcec:
    ldr r2, [r6, #0x14]
    sub r1, r0, #0x190
    mov r0, r2, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mul r1, r0, r1
    mov r0, r2, lsl #0x10
    mov r0, r0, lsr #0x10
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220fd14:
    sub r1, r0, #0x7d0
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220fd24:
    ldr r1, .L_022100e0
    and r2, ip, #0x1
    mul r3, r2, r1
    ldr r1, .L_022100e4
    sub r0, r0, #0x64
    ldr r1, [r1, r3]
    mul r0, r1, r0
    str r0, [r5, ip, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220fd48:
    ldr r1, .L_022100e0
    and r2, ip, #0x1
    mul r3, r2, r1
    ldr r1, .L_022100e8
    sub r0, r0, #0x12c
    ldr r1, [r1, r3]
    mul r0, r1, r0
    str r0, [r5, ip, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220fd6c:
    sub r1, r0, #0x1f4
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    mov r0, #0x1f4
    str r0, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220fd84:
    ldrh r1, [r6, #0x2]
    mov r1, r1, lsl #0x12
    mov r1, r1, lsr #0x1e
    cmp r1, #0x1
    moveq r0, #0x3e8
    subne r0, r0, #0x7d0
    str r0, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220fda4:
    rsb r6, r4, #0x1
    ldr r1, .L_022100e0
    and r3, r4, #0x1
    mul r4, r3, r1
    and r2, r6, #0x1
    mul r1, r2, r1
    ldr r3, .L_022100ec
    ldr r2, [r3, r4]
    ldr r1, [r3, r1]
    subs r1, r2, r1
    movpl r0, r1
    rsb r0, r0, #0x0
    str r0, [r5, r6, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220fddc:
    mov r0, r4
    mov r1, #0x1
    bl func_ov002_021bbd04
    mov r1, #0x258
    rsb r1, r1, #0x0
    mul r1, r0, r1
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220fe00:
    ldr r1, .L_022100f0
    sub r2, r0, #0x3e8
    ldr r0, [r1, #0x0]
    str r2, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220fe14:
    ldr r0, [r6, #0x14]
    mov r1, #0x3e8
    mov r0, r0, lsl #0xd
    rsb r1, r1, #0x0
    mov r0, r0, lsr #0x1f
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220fe30:
    ldrh r0, [r6, #0x2]
    mov r1, r0, lsl #0x1a
    mov r3, r0, lsl #0x1f
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021b4270
    mov r1, r0, lsl #0x10
    mov r2, r1, lsr #0x10
    mov r1, #0x1f4
    mov r2, r2, asr #0x8
    and r0, r0, #0xff
    rsb r1, r1, #0x0
    mul r3, r0, r1
    and r0, r2, #0xff
    mul r1, r0, r1
    str r3, [r5, #0x0]
    str r1, [r5, #0x4]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220fe78:
    sub r1, r0, #0x3e8
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x16
    streq r1, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220fe9c:
    mov r0, r2
    bl func_0202b8f0
    ldr r1, [r6, #0x14]
    rsb r2, r0, #0x0
    mov r0, r1, lsl #0x16
    mov r0, r0, lsr #0x1f
    str r2, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220febc:
    sub r1, r0, #0x320
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    str r1, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220fed0:
    mov r0, r4
    mov r1, #0x16
    bl func_ov002_021bd364
    mvn r1, #0xc7
    mul r1, r0, r1
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220fef0:
    ldr r0, .L_022100f0
    ldr r1, [r0, #0xa8]
    cmp r1, r4
    bne .L_0220ff14
    rsb r2, r4, #0x1
    ldr r1, [r5, r2, lsl #0x2]
    ldr r0, [r0, #0x9c]
    sub r0, r1, r0
    str r0, [r5, r2, lsl #0x2]
.L_0220ff14:
    ldr r0, .L_022100f0
    ldr r1, [r0, #0xbc]
    cmp r1, r4
    ldmneia sp!, {r4, r5, r6, pc}
    rsb r2, r4, #0x1
    ldr r1, [r5, r2, lsl #0x2]
    ldr r0, [r0, #0xb0]
    sub r0, r1, r0
    str r0, [r5, r2, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220ff3c:
    mov r0, r4
    mov r1, #0x12
    bl func_ov002_021bbc58
    mvn r1, #0xc7
    mul r1, r0, r1
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220ff5c:
    rsb r4, r4, #0x1
    ldr r1, .L_022100e0
    and r2, r4, #0x1
    mul r3, r2, r1
    ldr r1, .L_022100f4
    sub r0, r0, #0x64
    ldr r1, [r1, r3]
    mul r0, r1, r0
    str r0, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220ff84:
    bl func_ov002_021bcf00
    mov r1, #0x1f4
    mul r1, r0, r1
    sub r1, r1, #0x3e8
    str r1, [r5, #0x0]
    cmp r1, #0x0
    movgt r1, #0x0
    mov r0, #0x1
    str r1, [r5, #0x0]
    bl func_ov002_021bcf00
    mov r1, #0x1f4
    mul r1, r0, r1
    sub r0, r1, #0x3e8
    str r0, [r5, #0x4]
    cmp r0, #0x0
    movgt r0, #0x0
    str r0, [r5, #0x4]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220ffcc:
    rsb r1, r4, #0x1
    ldr r0, .L_022100e0
    and r1, r1, #0x1
    mul r2, r1, r0
    ldr r1, .L_022100f8
    mov r0, #0x1f4
    ldr r1, [r1, r2]
    mul r0, r1, r0
    str r0, [r5, r4, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220fff4:
    ldrh r2, [r6, #0x2]
    mov r3, r2, lsl #0x12
    mov r3, r3, lsr #0x1e
    cmp r3, #0x2
    bne .L_02210018
    sub r1, r0, #0x3e8
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_02210018:
    mov r2, r2, lsl #0x14
    mov r2, r2, lsr #0x1a
    cmp r2, #0x5
    subeq r0, r1, #0x1e00
    streq r0, [r5, r4, lsl #0x2]
    ldmeqia sp!, {r4, r5, r6, pc}
    sub r1, r0, #0x12c
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_02210040:
    ldr r1, .L_022100fc
    sub r0, r0, #0x190
    ldr r2, [r1, #0x484]
    rsb r1, r4, #0x1
    add r2, r2, #0x1
    mul r0, r2, r0
    str r0, [r5, r1, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_02210060:
    mov r0, #0x320
    str r0, [r5, #0x4]
    str r0, [r5, #0x0]
    ldmia sp!, {r4, r5, r6, pc}
.L_02210070:
    sub r0, r0, #0x1f4
    str r0, [r5, #0x4]
    str r0, [r5, #0x0]
    ldmia sp!, {r4, r5, r6, pc}
.L_02210080:
    ldrh r1, [r6, #0x2]
    mov r1, r1, lsl #0x12
    mov r1, r1, lsr #0x1e
    cmp r1, #0x2
    bne .L_022100a4
    sub r1, r0, #0x7d0
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_022100a4:
    sub r1, r0, #0x1f4
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_022100b4:
    ldr r1, .L_02210100
    mov r0, r4
    bl func_ov002_021c32d4
    mvn r1, #0xc7
    mul r1, r0, r1
    rsb r0, r4, #0x1
    str r1, [r5, r0, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
.L_022100d4:
        .word   data_ov002_022d0250
.L_022100d8:
        .word   0xfffffa24
.L_022100dc:
        .word   0xfffff448
.L_022100e0:
        .word   0x868
.L_022100e4:
        .word   data_ov002_022cf180
.L_022100e8:
        .word   data_ov002_022cf188
.L_022100ec:
        .word   data_ov002_022cf16c
.L_022100f0:
        .word   data_ov002_022cd3f4
.L_022100f4:
        .word   data_ov002_022cf184
.L_022100f8:
        .word   data_ov002_022cf178
.L_022100fc:
        .word   data_ov002_022ce288
.L_02210100:
        .word   func_0202e258
