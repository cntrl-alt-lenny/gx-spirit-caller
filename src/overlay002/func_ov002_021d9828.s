; func_ov002_021d9828 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern data_ov002_022cd3f4
        .extern data_ov002_022cd444
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf178
        .extern data_ov002_022cf180
        .extern data_ov002_022cf1a8
        .extern data_ov002_022cf1ac
        .extern data_ov002_022d016c
        .extern data_ov002_022d0650
        .extern func_0202b878
        .extern func_0202b8c0
        .extern func_0202e234
        .extern func_0202e2c8
        .extern func_0202e2f8
        .extern func_0202e328
        .extern func_0202e42c
        .extern func_0202ed90
        .extern func_0202f2e4
        .extern func_ov002_021b3618
        .extern func_ov002_021b36bc
        .extern func_ov002_021b3e28
        .extern func_ov002_021b3ecc
        .extern func_ov002_021b3fd8
        .extern func_ov002_021b4204
        .extern func_ov002_021b4354
        .extern func_ov002_021b9ecc
        .extern func_ov002_021ba294
        .extern func_ov002_021baca8
        .extern func_ov002_021bae7c
        .extern func_ov002_021bb90c
        .extern func_ov002_021bd85c
        .extern func_ov002_021c8940
        .extern func_ov002_021d59cc
        .extern func_ov002_021d9778
        .extern func_ov002_021df62c
        .extern func_ov002_021df938
        .extern func_ov002_021e276c
        .extern func_ov002_021e2d94
        .extern func_ov002_021e30b4
        .extern func_ov002_02253928
        .extern func_ov002_02253af8
        .extern func_ov002_02253b6c
        .global func_ov002_021d9828
        .arm
func_ov002_021d9828:
    stmdb sp!, {r0, r1, r2, r3}
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x4c
    str r1, [sp, #0x4]
    ldr r0, [sp, #0x4]
    ldr r1, [sp, #0x70]
    ldr r0, [r0, #0x0]
    mov r5, r1, lsl #0xd
    mov r7, r0, lsl #0x12
    mov r6, r0, lsl #0x2
    mov r11, r7, lsr #0x1f
    mov r4, r1, lsl #0x16
    mov r5, r5, lsr #0x1f
    cmp r5, r4, lsr #0x1f
    mov r0, r0, lsl #0x13
    mov r7, r6, lsr #0x18
    mov r6, r0, lsr #0x13
    add r0, r11, r7, lsl #0x1
    str r0, [sp, #0x3c]
    movne r0, #0x1
    strne r0, [sp, #0x24]
    moveq r0, #0x0
    streq r0, [sp, #0x24]
    ldr r0, [sp, #0x70]
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x8
    movs r0, r0, lsr #0x1f
    moveq r0, #0x1
    streq r0, [sp, #0x20]
    movne r0, #0x0
    strne r0, [sp, #0x20]
    ldr r0, [sp, #0x70]
    mov r1, r1, lsr #0x1c
    mov r0, r0, lsl #0x9
    mov r0, r0, lsr #0x1c
    cmp r0, #0xe
    moveq r0, #0x1
    streq r0, [sp, #0x1c]
    movne r0, #0x0
    str r1, [sp, #0x40]
    str r3, [sp, #0xc]
    strne r0, [sp, #0x1c]
    ldr r0, [sp, #0xc]
    ldr r1, [sp, #0x70]
    tst r0, #0x80000
    mov r0, r1, lsl #0x10
    mov r0, r0, lsr #0x1f
    mov r5, r4, lsr #0x1f
    movne r4, #0x1
    mov r1, r1, lsl #0xf
    str r0, [sp, #0x38]
    mov r0, r1, lsr #0x1f
    str r0, [sp, #0x28]
    ldr r0, [sp, #0xc]
    moveq r4, #0x0
    tst r0, #0x100000
    movne r7, #0x1
    ldr r0, [sp, #0xc]
    moveq r7, #0x0
    tst r0, #0x200000
    movne r8, #0x1
    ldr r0, [sp, #0xc]
    moveq r8, #0x0
    tst r0, #0x400000
    movne r9, #0x1
    ldr r0, [sp, #0x28]
    moveq r9, #0x0
    cmp r0, #0x0
    mov r0, #0x0
    str r0, [sp, #0x10]
    movne r0, #0x16
    strne r0, [sp, #0x18]
    moveq r0, #0x1b
    streq r0, [sp, #0x18]
    ldr r0, [sp, #0x28]
    str r2, [sp, #0x8]
    cmp r0, #0x0
    beq .L_021d9990
    ldr r0, .L_021da8c8
    ldr r1, [r0, #0x70]
    ldr r0, [sp, #0x3c]
    cmp r1, r0
    moveq r2, #0x1
    movne r2, #0x0
    mov r0, #0x38
    mul r1, r2, r0
    ldr r0, .L_021da8cc
    ldr r0, [r0, r1]
    str r0, [sp, #0x14]
    b .L_021d99a0
.L_021d9990:
    ldr r1, [sp, #0x40]
    mov r0, r5
    bl func_ov002_021c8940
    str r0, [sp, #0x14]
.L_021d99a0:
    ldr r1, .L_021da8d0
    cmp r6, r1
    bgt .L_021d9dd0
    bge .L_021da6c8
    ldr r0, .L_021da8d4
    cmp r6, r0
    bgt .L_021d9bdc
    bge .L_021da3cc
    sub r1, r0, #0x178
    cmp r6, r1
    bgt .L_021d9ac8
    sub r0, r0, #0x178
    cmp r6, r0
    bge .L_021da3cc
    ldr r1, .L_021da8d8
    cmp r6, r1
    bgt .L_021d9a60
    bge .L_021da30c
    sub r0, r1, #0xa5
    cmp r6, r0
    bgt .L_021d9a3c
    sub r0, r1, #0xa8
    cmp r6, r0
    blt .L_021d9a18
    subne r0, r1, #0xa6
    cmpne r6, r0
    subne r0, r1, #0xa5
    cmpne r6, r0
    beq .L_021da1a4
    b .L_021daacc
.L_021d9a18:
    ldr r0, .L_021da8dc
    cmp r6, r0
    bgt .L_021d9a2c
    beq .L_021da1a4
    b .L_021daacc
.L_021d9a2c:
    add r0, r0, #0x100
    cmp r6, r0
    beq .L_021da1a4
    b .L_021daacc
.L_021d9a3c:
    sub r0, r1, #0x9e
    cmp r6, r0
    bgt .L_021d9a50
    beq .L_021da1a4
    b .L_021daacc
.L_021d9a50:
    sub r0, r1, #0x11
    cmp r6, r0
    beq .L_021da28c
    b .L_021daacc
.L_021d9a60:
    ldr r1, .L_021da8e0
    cmp r6, r1
    bgt .L_021d9a98
    bge .L_021da30c
    sub r0, r1, #0xbe
    cmp r6, r0
    bgt .L_021d9a84
    beq .L_021da1a4
    b .L_021daacc
.L_021d9a84:
    sub r0, r1, #0xe
    cmp r6, r0
    ldreq r0, [sp, #0x38]
    streq r0, [sp, #0x10]
    b .L_021daacc
.L_021d9a98:
    add r0, r1, #0x67
    cmp r6, r0
    bgt .L_021d9ab8
    bge .L_021da30c
    add r0, r1, #0x2
    cmp r6, r0
    beq .L_021da1c8
    b .L_021daacc
.L_021d9ab8:
    add r0, r1, #0x69
    cmp r6, r0
    beq .L_021da3cc
    b .L_021daacc
.L_021d9ac8:
    sub r1, r0, #0xfb
    cmp r6, r1
    bgt .L_021d9b70
    sub r0, r0, #0xfb
    cmp r6, r0
    bge .L_021da3f8
    ldr r1, .L_021da8e4
    cmp r6, r1
    bgt .L_021d9b40
    bge .L_021da3cc
    sub r0, r1, #0x68
    cmp r6, r0
    bgt .L_021d9b04
    beq .L_021da3cc
    b .L_021daacc
.L_021d9b04:
    sub r0, r1, #0x64
    sub r0, r6, r0
    cmp r0, #0x9
    addls pc, pc, r0, lsl #0x2
    b .L_021daacc
.L_021d9b18: ; jump table
    b .L_021da3cc ; case 0
    b .L_021da3cc ; case 1
    b .L_021da28c ; case 2
    b .L_021da3cc ; case 3
    b .L_021daacc ; case 4
    b .L_021da3cc ; case 5
    b .L_021da3cc ; case 6
    b .L_021daacc ; case 7
    b .L_021daacc ; case 8
    b .L_021da3cc ; case 9
.L_021d9b40:
    ldr r0, .L_021da8e8
    cmp r6, r0
    bgt .L_021d9b60
    bge .L_021daa74
    sub r0, r0, #0x3
    cmp r6, r0
    beq .L_021da3cc
    b .L_021daacc
.L_021d9b60:
    add r0, r0, #0xc
    cmp r6, r0
    beq .L_021da3f8
    b .L_021daacc
.L_021d9b70:
    sub r1, r0, #0xc8
    cmp r6, r1
    bgt .L_021d9bac
    bge .L_021da30c
    sub r1, r0, #0xf7
    cmp r6, r1
    bgt .L_021d9b9c
    sub r0, r0, #0xf7
    cmp r6, r0
    beq .L_021da3f8
    b .L_021daacc
.L_021d9b9c:
    sub r0, r0, #0xe4
    cmp r6, r0
    beq .L_021da3cc
    b .L_021daacc
.L_021d9bac:
    sub r1, r0, #0x76
    cmp r6, r1
    bgt .L_021d9bcc
    bge .L_021da528
    sub r0, r0, #0xc2
    cmp r6, r0
    beq .L_021da1a4
    b .L_021daacc
.L_021d9bcc:
    sub r0, r0, #0x44
    cmp r6, r0
    beq .L_021da1a4
    b .L_021daacc
.L_021d9bdc:
    ldr r0, .L_021da8ec
    cmp r6, r0
    bgt .L_021d9cd0
    bge .L_021da1a4
    sub r1, r0, #0xa5
    cmp r6, r1
    bgt .L_021d9c64
    bge .L_021da65c
    sub r1, r0, #0xd0
    cmp r6, r1
    bgt .L_021d9c38
    bge .L_021da36c
    sub r1, r0, #0xdc
    cmp r6, r1
    bgt .L_021d9c28
    sub r0, r0, #0xdc
    cmp r6, r0
    beq .L_021da3cc
    b .L_021daacc
.L_021d9c28:
    sub r0, r0, #0xd2
    cmp r6, r0
    beq .L_021da3cc
    b .L_021daacc
.L_021d9c38:
    sub r1, r0, #0xc3
    cmp r6, r1
    bgt .L_021d9c54
    sub r0, r0, #0xc3
    cmp r6, r0
    beq .L_021da3cc
    b .L_021daacc
.L_021d9c54:
    sub r0, r0, #0xac
    cmp r6, r0
    beq .L_021da600
    b .L_021daacc
.L_021d9c64:
    sub r1, r0, #0x75
    cmp r6, r1
    bgt .L_021d9ca0
    bge .L_021da528
    sub r1, r0, #0x8a
    cmp r6, r1
    bgt .L_021d9c90
    sub r0, r0, #0x8a
    cmp r6, r0
    beq .L_021da3cc
    b .L_021daacc
.L_021d9c90:
    sub r0, r0, #0x76
    cmp r6, r0
    beq .L_021da528
    b .L_021daacc
.L_021d9ca0:
    sub r1, r0, #0x4c
    cmp r6, r1
    bgt .L_021d9cc0
    bge .L_021da3cc
    sub r0, r0, #0x4d
    cmp r6, r0
    beq .L_021da3cc
    b .L_021daacc
.L_021d9cc0:
    sub r0, r0, #0x28
    cmp r6, r0
    beq .L_021da3cc
    b .L_021daacc
.L_021d9cd0:
    add r2, r0, #0xaf
    cmp r6, r2
    bgt .L_021d9d54
    mov r1, r2
    cmp r6, r1
    bge .L_021da9c0
    add r1, r0, #0x86
    cmp r6, r1
    bgt .L_021d9d24
    bge .L_021da36c
    add r1, r0, #0x59
    cmp r6, r1
    bgt .L_021d9d14
    add r0, r0, #0x59
    cmp r6, r0
    beq .L_021da3f8
    b .L_021daacc
.L_021d9d14:
    add r0, r0, #0x5d
    cmp r6, r0
    beq .L_021da3cc
    b .L_021daacc
.L_021d9d24:
    add r1, r0, #0x96
    cmp r6, r1
    bgt .L_021d9d44
    bge .L_021da918
    add r0, r0, #0x89
    cmp r6, r0
    beq .L_021da3cc
    b .L_021daacc
.L_021d9d44:
    add r0, r0, #0xa3
    cmp r6, r0
    beq .L_021da318
    b .L_021daacc
.L_021d9d54:
    sub r2, r1, #0x36
    cmp r6, r2
    bgt .L_021d9d98
    sub r1, r1, #0x36
    cmp r6, r1
    bge .L_021da3cc
    add r1, r0, #0xce
    cmp r6, r1
    bgt .L_021d9d88
    add r0, r0, #0xce
    cmp r6, r0
    beq .L_021da30c
    b .L_021daacc
.L_021d9d88:
    rsb r0, r0, #0x2c80
    cmp r6, r0
    beq .L_021da3cc
    b .L_021daacc
.L_021d9d98:
    add r2, r0, #0x13c
    cmp r6, r2
    bgt .L_021d9dc0
    add r0, r0, #0x13c
    cmp r6, r0
    bge .L_021da30c
    sub r0, r1, #0x32
    cmp r6, r0
    beq .L_021da1a4
    b .L_021daacc
.L_021d9dc0:
    sub r0, r1, #0x8
    cmp r6, r0
    beq .L_021da4a8
    b .L_021daacc
.L_021d9dd0:
    add r0, r1, #0x24c
    cmp r6, r0
    bgt .L_021d9fbc
    bge .L_021da3c4
    ldr r0, .L_021da8f0
    cmp r6, r0
    bgt .L_021d9ed4
    bge .L_021da3cc
    sub r2, r0, #0xa2
    cmp r6, r2
    bgt .L_021d9e68
    bge .L_021da30c
    sub r2, r0, #0xd1
    cmp r6, r2
    bgt .L_021d9e3c
    bge .L_021da1a4
    sub r2, r0, #0x138
    cmp r6, r2
    bgt .L_021d9e2c
    sub r0, r0, #0x138
    cmp r6, r0
    beq .L_021da3f8
    b .L_021daacc
.L_021d9e2c:
    add r0, r1, #0x50
    cmp r6, r0
    beq .L_021da41c
    b .L_021daacc
.L_021d9e3c:
    sub r1, r0, #0xc2
    cmp r6, r1
    bgt .L_021d9e58
    sub r0, r0, #0xc2
    cmp r6, r0
    beq .L_021da1a4
    b .L_021daacc
.L_021d9e58:
    sub r0, r0, #0xa4
    cmp r6, r0
    beq .L_021da3cc
    b .L_021daacc
.L_021d9e68:
    sub r1, r0, #0x81
    cmp r6, r1
    bgt .L_021d9ea4
    bge .L_021da3cc
    sub r1, r0, #0x91
    cmp r6, r1
    bgt .L_021d9e94
    sub r0, r0, #0x91
    cmp r6, r0
    beq .L_021da3cc
    b .L_021daacc
.L_021d9e94:
    sub r0, r0, #0x82
    cmp r6, r0
    beq .L_021da3cc
    b .L_021daacc
.L_021d9ea4:
    sub r1, r0, #0x26
    cmp r6, r1
    bgt .L_021d9ec4
    bge .L_021da77c
    sub r0, r0, #0x2a
    cmp r6, r0
    beq .L_021da754
    b .L_021daacc
.L_021d9ec4:
    sub r0, r0, #0x25
    cmp r6, r0
    beq .L_021da7b4
    b .L_021daacc
.L_021d9ed4:
    add r1, r0, #0x8d
    cmp r6, r1
    bgt .L_021d9f50
    bge .L_021da3cc
    add r1, r0, #0x43
    cmp r6, r1
    bgt .L_021d9f20
    bge .L_021da4a8
    add r1, r0, #0x2
    cmp r6, r1
    bgt .L_021d9f10
    add r0, r0, #0x2
    cmp r6, r0
    beq .L_021da4a8
    b .L_021daacc
.L_021d9f10:
    add r0, r0, #0x28
    cmp r6, r0
    beq .L_021da3cc
    b .L_021daacc
.L_021d9f20:
    add r1, r0, #0x5e
    cmp r6, r1
    bgt .L_021d9f40
    bge .L_021da3cc
    add r0, r0, #0x50
    cmp r6, r0
    beq .L_021da3cc
    b .L_021daacc
.L_021d9f40:
    add r0, r0, #0x70
    cmp r6, r0
    beq .L_021da5b0
    b .L_021daacc
.L_021d9f50:
    add r1, r0, #0xb2
    cmp r6, r1
    bgt .L_021d9f8c
    bge .L_021da3c4
    add r1, r0, #0x90
    cmp r6, r1
    bgt .L_021d9f7c
    add r0, r0, #0x90
    cmp r6, r0
    beq .L_021da3cc
    b .L_021daacc
.L_021d9f7c:
    add r0, r0, #0xad
    cmp r6, r0
    beq .L_021da454
    b .L_021daacc
.L_021d9f8c:
    add r1, r0, #0xd2
    cmp r6, r1
    bgt .L_021d9fac
    bge .L_021da3cc
    add r0, r0, #0xb3
    cmp r6, r0
    beq .L_021da22c
    b .L_021daacc
.L_021d9fac:
    add r0, r0, #0xdf
    cmp r6, r0
    beq .L_021da1a4
    b .L_021daacc
.L_021d9fbc:
    ldr r0, .L_021da8f4
    cmp r6, r0
    bgt .L_021da0bc
    bge .L_021da280
    sub r2, r0, #0x92
    cmp r6, r2
    bgt .L_021da050
    bge .L_021da30c
    add r2, r1, #0x26c
    cmp r6, r2
    bgt .L_021da020
    add r1, r1, #0x26c
    cmp r6, r1
    bge .L_021da3cc
    sub r1, r0, #0x140
    cmp r6, r1
    bgt .L_021da010
    sub r0, r0, #0x140
    cmp r6, r0
    beq .L_021da3cc
    b .L_021daacc
.L_021da010:
    ldr r0, .L_021da8f8
    cmp r6, r0
    beq .L_021da4a8
    b .L_021daacc
.L_021da020:
    sub r1, r0, #0xcb
    cmp r6, r1
    bgt .L_021da040
    bge .L_021da3cc
    sub r0, r0, #0xe0
    cmp r6, r0
    beq .L_021da7d4
    b .L_021daacc
.L_021da040:
    sub r0, r0, #0xbe
    cmp r6, r0
    beq .L_021da4d4
    b .L_021daacc
.L_021da050:
    sub r1, r0, #0x33
    cmp r6, r1
    bgt .L_021da08c
    bge .L_021da528
    sub r1, r0, #0x89
    cmp r6, r1
    bgt .L_021da07c
    sub r0, r0, #0x89
    cmp r6, r0
    beq .L_021da41c
    b .L_021daacc
.L_021da07c:
    sub r0, r0, #0x84
    cmp r6, r0
    beq .L_021da800
    b .L_021daacc
.L_021da08c:
    sub r1, r0, #0x2
    cmp r6, r1
    bgt .L_021da0ac
    bge .L_021da1f8
    sub r0, r0, #0x13
    cmp r6, r0
    beq .L_021da560
    b .L_021daacc
.L_021da0ac:
    sub r0, r0, #0x1
    cmp r6, r0
    beq .L_021da390
    b .L_021daacc
.L_021da0bc:
    add r1, r0, #0x9d
    cmp r6, r1
    bgt .L_021da138
    bge .L_021da87c
    add r1, r0, #0x1d
    cmp r6, r1
    bgt .L_021da108
    bge .L_021da87c
    add r1, r0, #0x4
    cmp r6, r1
    bgt .L_021da0f8
    add r0, r0, #0x4
    cmp r6, r0
    beq .L_021da3cc
    b .L_021daacc
.L_021da0f8:
    add r0, r0, #0x19
    cmp r6, r0
    beq .L_021da850
    b .L_021daacc
.L_021da108:
    add r1, r0, #0x88
    cmp r6, r1
    bgt .L_021da128
    bge .L_021da3cc
    add r0, r0, #0x2a
    cmp r6, r0
    beq .L_021da36c
    b .L_021daacc
.L_021da128:
    add r0, r0, #0x89
    cmp r6, r0
    beq .L_021da3cc
    b .L_021daacc
.L_021da138:
    add r1, r0, #0xb7
    cmp r6, r1
    bgt .L_021da174
    bge .L_021da3cc
    add r1, r0, #0xb5
    cmp r6, r1
    bgt .L_021da164
    add r0, r0, #0xb5
    cmp r6, r0
    beq .L_021da3cc
    b .L_021daacc
.L_021da164:
    add r0, r0, #0xb6
    cmp r6, r0
    beq .L_021da3cc
    b .L_021daacc
.L_021da174:
    add r1, r0, #0xb9
    cmp r6, r1
    bgt .L_021da194
    bge .L_021da3cc
    add r0, r0, #0xb8
    cmp r6, r0
    beq .L_021da3cc
    b .L_021daacc
.L_021da194:
    add r0, r0, #0xba
    cmp r6, r0
    beq .L_021da3cc
    b .L_021daacc
.L_021da1a4:
    ldr r0, [sp, #0x20]
    cmp r0, #0x0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    movne r0, #0x1
    strne r0, [sp, #0x10]
    moveq r0, #0x0
    streq r0, [sp, #0x10]
    b .L_021daacc
.L_021da1c8:
    ldr r0, [sp, #0x20]
    cmp r0, #0x0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    beq .L_021da1ec
    cmp r11, r5
    moveq r0, #0x1
    streq r0, [sp, #0x10]
    beq .L_021daacc
.L_021da1ec:
    mov r0, #0x0
    str r0, [sp, #0x10]
    b .L_021daacc
.L_021da1f8:
    ldr r0, [sp, #0x20]
    cmp r0, #0x0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    beq .L_021da220
    ldr r0, [sp, #0x28]
    cmp r0, #0x0
    moveq r0, #0x1
    streq r0, [sp, #0x10]
    beq .L_021daacc
.L_021da220:
    mov r0, #0x0
    str r0, [sp, #0x10]
    b .L_021daacc
.L_021da22c:
    ldr r0, [sp, #0x4]
    ldrh r0, [r0, #0x8]
    cmp r0, #0x0
    ldrne r0, [sp, #0x20]
    cmpne r0, #0x0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    beq .L_021da274
    ldr r0, [sp, #0x28]
    cmp r0, #0x0
    beq .L_021da268
    ldr r0, .L_021da8c8
    ldr r0, [r0, #0x24]
    cmp r0, r6
    beq .L_021da274
.L_021da268:
    mov r0, #0x1
    str r0, [sp, #0x10]
    b .L_021daacc
.L_021da274:
    mov r0, #0x0
    str r0, [sp, #0x10]
    b .L_021daacc
.L_021da280:
    ldr r0, [sp, #0x28]
    cmp r0, #0x0
    beq .L_021daacc
.L_021da28c:
    ldr r0, [sp, #0x20]
    cmp r0, #0x0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    beq .L_021daacc
    ldr r0, [sp, #0x28]
    cmp r0, #0x0
    beq .L_021da2bc
    ldr r0, .L_021da8c8
    ldr r0, [r0, #0x24]
    cmp r0, r6
    beq .L_021da2d0
.L_021da2bc:
    ldr r0, [sp, #0x4]
    ldr r0, [r0, #0x10]
    mov r0, r0, lsr #0x5
    tst r0, #0x1
    beq .L_021da2dc
.L_021da2d0:
    mov r0, #0x1
    str r0, [sp, #0x10]
    b .L_021daacc
.L_021da2dc:
    ldr r1, [sp, #0x40]
    ldr r2, .L_021da8fc
    mov r0, r5
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    beq .L_021daacc
    mov r0, #0x1
    str r0, [sp, #0x10]
    ldr r0, [sp, #0x70]
    orr r0, r0, #0x800000
    str r0, [sp, #0x70]
    b .L_021daacc
.L_021da30c:
    ldr r0, [sp, #0x1c]
    str r0, [sp, #0x10]
    b .L_021daacc
.L_021da318:
    cmp r4, #0x0
    ldrne r0, [sp, #0x38]
    cmpne r0, #0x0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    beq .L_021da360
    ldr r1, [sp, #0x40]
    mov r0, r5
    bl func_ov002_021b3618
    ldr r1, .L_021da900
    cmp r0, r1
    beq .L_021da360
    ldr r0, .L_021da904
    ldr r0, [r0, #0xd0]
    tst r0, #0x1
    moveq r0, #0x1
    streq r0, [sp, #0x10]
    beq .L_021daacc
.L_021da360:
    mov r0, #0x0
    str r0, [sp, #0x10]
    b .L_021daacc
.L_021da36c:
    ldr r0, [sp, #0x38]
    cmp r0, #0x0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    movne r0, #0x1
    strne r0, [sp, #0x10]
    moveq r0, #0x0
    streq r0, [sp, #0x10]
    b .L_021daacc
.L_021da390:
    ldr r0, [sp, #0x38]
    cmp r0, #0x0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    beq .L_021da3b8
    ldr r0, [sp, #0x28]
    cmp r0, #0x0
    moveq r0, #0x1
    streq r0, [sp, #0x10]
    beq .L_021daacc
.L_021da3b8:
    mov r0, #0x0
    str r0, [sp, #0x10]
    b .L_021daacc
.L_021da3c4:
    cmp r11, r5
    bne .L_021daacc
.L_021da3cc:
    ldr r0, [sp, #0x28]
    cmp r0, #0x0
    ldrne r0, [sp, #0x38]
    cmpne r0, #0x0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    movne r0, #0x1
    strne r0, [sp, #0x10]
    moveq r0, #0x0
    streq r0, [sp, #0x10]
    b .L_021daacc
.L_021da3f8:
    ldr r0, [sp, #0x28]
    cmp r0, #0x0
    ldrne r0, [sp, #0x38]
    cmpne r0, #0x0
    movne r0, #0x1
    strne r0, [sp, #0x10]
    moveq r0, #0x0
    streq r0, [sp, #0x10]
    b .L_021daacc
.L_021da41c:
    ldr r0, [sp, #0x28]
    cmp r0, #0x0
    ldrne r0, [sp, #0x38]
    cmpne r0, #0x0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    ldrne r0, .L_021da8c8
    ldrne r0, [r0, #0x24]
    cmpne r0, r6
    movne r0, #0x1
    strne r0, [sp, #0x10]
    moveq r0, #0x0
    streq r0, [sp, #0x10]
    b .L_021daacc
.L_021da454:
    ldr r0, [sp, #0x38]
    cmp r0, #0x0
    ldrne r0, [sp, #0x4]
    ldrneh r0, [r0, #0x8]
    cmpne r0, #0x0
    ldrne r0, [sp, #0x20]
    cmpne r0, #0x0
    beq .L_021da49c
    ldr r0, [sp, #0x28]
    cmp r0, #0x0
    beq .L_021da490
    ldr r0, .L_021da8c8
    ldr r0, [r0, #0x24]
    cmp r0, r6
    beq .L_021da49c
.L_021da490:
    mov r0, #0x1
    str r0, [sp, #0x10]
    b .L_021daacc
.L_021da49c:
    mov r0, #0x0
    str r0, [sp, #0x10]
    b .L_021daacc
.L_021da4a8:
    ldr r0, [sp, #0x20]
    cmp r0, #0x0
    ldrne r0, [sp, #0x38]
    cmpne r0, #0x0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    movne r0, #0x1
    strne r0, [sp, #0x10]
    moveq r0, #0x0
    streq r0, [sp, #0x10]
    b .L_021daacc
.L_021da4d4:
    ldr r0, [sp, #0x4]
    ldrh r0, [r0, #0x8]
    cmp r0, #0x0
    bne .L_021da51c
    ldr r0, [sp, #0x4]
    ldrh r0, [r0, #0x6]
    cmp r0, #0x0
    ldrne r0, [sp, #0x38]
    cmpne r0, #0x0
    beq .L_021da51c
    ldr r0, [sp, #0x28]
    cmp r0, #0x0
    bne .L_021da51c
    ldr r0, [sp, #0x1c]
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [sp, #0x10]
    bne .L_021daacc
.L_021da51c:
    mov r0, #0x0
    str r0, [sp, #0x10]
    b .L_021daacc
.L_021da528:
    ldr r0, [sp, #0x4]
    ldrh r0, [r0, #0x8]
    cmp r0, #0x0
    bne .L_021da554
    ldr r0, [sp, #0x38]
    cmp r0, #0x0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    movne r0, #0x1
    strne r0, [sp, #0x10]
    bne .L_021daacc
.L_021da554:
    mov r0, #0x0
    str r0, [sp, #0x10]
    b .L_021daacc
.L_021da560:
    ldr r0, [sp, #0x4]
    ldrh r0, [r0, #0x8]
    cmp r0, #0x0
    bne .L_021da5a4
    ldr r0, [sp, #0x38]
    cmp r0, #0x0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    ldrne r0, [sp, #0x24]
    cmpne r0, #0x0
    beq .L_021da5a4
    ldr r0, [sp, #0x8]
    bl func_0202e234
    cmp r0, #0x0
    moveq r0, #0x1
    streq r0, [sp, #0x10]
    beq .L_021daacc
.L_021da5a4:
    mov r0, #0x0
    str r0, [sp, #0x10]
    b .L_021daacc
.L_021da5b0:
    ldr r0, [sp, #0x4]
    ldrh r0, [r0, #0x8]
    cmp r0, #0x0
    bne .L_021daacc
    ldr r0, [sp, #0x38]
    cmp r0, #0x0
    beq .L_021daacc
    ldr r0, .L_021da908
    ldr r2, .L_021da90c
    and r3, r5, #0x1
    mla r2, r3, r0, r2
    ldr r0, [sp, #0x40]
    mov r1, #0x14
    mul r1, r0, r1
    ldr r0, [r1, r2]
    mov r0, r0, lsr #0x6
    tst r0, #0x1
    moveq r0, #0x3
    streq r0, [sp, #0x10]
    b .L_021daacc
.L_021da600:
    cmp r4, #0x0
    ldrne r0, [sp, #0x38]
    cmpne r0, #0x0
    beq .L_021daacc
    ldr r1, [sp, #0x40]
    mov r0, r5
    bl func_ov002_021b3618
    ldr r1, .L_021da900
    cmp r0, r1
    beq .L_021daacc
    ldr r0, .L_021da908
    ldr r2, .L_021da90c
    and r3, r5, #0x1
    mla r2, r3, r0, r2
    ldr r0, [sp, #0x40]
    mov r1, #0x14
    mul r1, r0, r1
    ldr r0, [r1, r2]
    mov r0, r0, lsr #0x6
    tst r0, #0x1
    moveq r0, #0x3
    streq r0, [sp, #0x10]
    b .L_021daacc
.L_021da65c:
    cmp r4, #0x0
    ldrne r0, [sp, #0x38]
    cmpne r0, #0x0
    beq .L_021daacc
    ldr r1, [sp, #0x40]
    mov r0, r5
    bl func_ov002_021b3618
    ldr r1, .L_021da900
    cmp r0, r1
    beq .L_021daacc
    ldr r0, .L_021da904
    ldr r0, [r0, #0xd0]
    tst r0, #0x1
    bne .L_021daacc
    ldr r0, .L_021da908
    ldr r2, .L_021da90c
    and r3, r5, #0x1
    mla r2, r3, r0, r2
    ldr r0, [sp, #0x40]
    mov r1, #0x14
    mul r1, r0, r1
    ldr r0, [r1, r2]
    mov r0, r0, lsr #0x6
    tst r0, #0x1
    moveq r0, #0x3
    streq r0, [sp, #0x10]
    b .L_021daacc
.L_021da6c8:
    ldr r0, [sp, #0x4]
    ldrh r0, [r0, #0x8]
    cmp r0, #0x0
    beq .L_021da6f8
    ldr r0, [sp, #0x28]
    cmp r0, #0x0
    bne .L_021da6f8
    ldr r0, [sp, #0x38]
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [sp, #0x10]
    bne .L_021da700
.L_021da6f8:
    mov r0, #0x0
    str r0, [sp, #0x10]
.L_021da700:
    ldr r0, [sp, #0x10]
    cmp r0, #0x0
    beq .L_021daacc
    ldr r0, [sp, #0x24]
    ldr r3, .L_021da910
    eor r0, r5, r0
    mov r1, r0, lsl #0x10
    ldr r0, .L_021da908
    and r4, r5, #0x1
    mla r3, r4, r0, r3
    ldr r0, [sp, #0x40]
    mov r2, #0x14
    mul r2, r0, r2
    ldr r0, [r2, r3]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x10
    orr r0, r0, r1, lsr #0x10
    str r0, [sp, #0x48]
    str r0, [sp, #0x70]
    b .L_021daacc
.L_021da754:
    ldr r0, [sp, #0x4]
    ldrh r0, [r0, #0x8]
    cmp r0, #0x0
    ldrne r0, [sp, #0x20]
    cmpne r0, #0x0
    movne r0, #0x1
    strne r0, [sp, #0x10]
    moveq r0, #0x0
    streq r0, [sp, #0x10]
    b .L_021daacc
.L_021da77c:
    cmp r8, #0x0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    beq .L_021daacc
    cmp r5, r11
    bne .L_021daacc
    ldr r1, [sp, #0x40]
    mov r0, r5
    bl func_ov002_021b36bc
    and r0, r0, #0xff
    cmp r5, r0
    moveq r0, #0x1
    streq r0, [sp, #0x10]
    b .L_021daacc
.L_021da7b4:
    cmp r7, #0x0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    movne r0, #0x1
    strne r0, [sp, #0x10]
    moveq r0, #0x0
    streq r0, [sp, #0x10]
    b .L_021daacc
.L_021da7d4:
    cmp r7, #0x0
    beq .L_021da7f4
    cmp r8, #0x0
    bne .L_021da7f4
    cmp r9, #0x0
    movne r0, #0x1
    strne r0, [sp, #0x10]
    bne .L_021daacc
.L_021da7f4:
    mov r0, #0x0
    str r0, [sp, #0x10]
    b .L_021daacc
.L_021da800:
    ldr r0, [sp, #0x38]
    cmp r0, #0x0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    beq .L_021da844
    ldr r0, .L_021da908
    ldr r2, .L_021da910
    and r3, r5, #0x1
    mla r2, r3, r0, r2
    ldr r0, [sp, #0x40]
    mov r1, #0x14
    mul r1, r0, r1
    ldr r0, [r1, r2]
    cmp r0, #0x4
    movhs r0, #0x1
    strhs r0, [sp, #0x10]
    bhs .L_021daacc
.L_021da844:
    mov r0, #0x0
    str r0, [sp, #0x10]
    b .L_021daacc
.L_021da850:
    ldr r0, [sp, #0x38]
    cmp r0, #0x0
    beq .L_021da870
    ldr r0, [sp, #0x8]
    cmp r0, r6
    moveq r0, #0x1
    streq r0, [sp, #0x10]
    beq .L_021daacc
.L_021da870:
    mov r0, #0x0
    str r0, [sp, #0x10]
    b .L_021daacc
.L_021da87c:
    ldr r0, [sp, #0x38]
    cmp r0, #0x0
    beq .L_021da8bc
    ldr r0, [sp, #0x28]
    cmp r0, #0x0
    bne .L_021da8bc
    ldr r0, [sp, #0x24]
    cmp r0, #0x0
    beq .L_021da8bc
    cmp r5, r11
    bne .L_021da8bc
    ldr r0, [sp, #0x1c]
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [sp, #0x10]
    bne .L_021daacc
.L_021da8bc:
    mov r0, #0x0
    str r0, [sp, #0x10]
    b .L_021daacc
.L_021da8c8:
        .word   data_ov002_022cd3f4
.L_021da8cc:
        .word   data_ov002_022cd444
.L_021da8d0:
        .word   0x16fe
.L_021da8d4:
        .word   0x14ab
.L_021da8d8:
        .word   0x1185
.L_021da8dc:
        .word   0xfd6
.L_021da8e0:
        .word   0x12a2
.L_021da8e4:
        .word   0x139d
.L_021da8e8:
        .word   0x13a1
.L_021da8ec:
        .word   0x15b9
.L_021da8f0:
        .word   0x1867
.L_021da8f4:
        .word   0x1a90
.L_021da8f8:
        .word   0x1951
.L_021da8fc:
        .word   0x1174
.L_021da900:
        .word   0xffff
.L_021da904:
        .word   data_ov002_022d016c
.L_021da908:
        .word   0x868
.L_021da90c:
        .word   data_ov002_022cf1ac
.L_021da910:
        .word   data_ov002_022cf1a8
.L_021da914:
        .word   data_ov002_022d0650
.L_021da918:
    ldr r1, [sp, #0x20]
    cmp r1, #0x0
    ldrne r1, [sp, #0x38]
    cmpne r1, #0x0
    ldrne r1, [sp, #0x1c]
    cmpne r1, #0x0
    ldrne r1, [sp, #0x4]
    ldrneh r4, [r1, #0xa]
    cmpne r4, #0x0
    beq .L_021daacc
    ldr r2, .L_021da914
    add r0, r0, #0x96
.L_021da948:
    mov r1, r4, lsl #0x3
    ldrh r1, [r2, r1]
    add r3, r2, r4, lsl #0x3
    ldrh r4, [r3, #0x6]
    cmp r1, r0
    bne .L_021da9b4
    ldrh r2, [r3, #0x4]
    ldr r3, [sp, #0x70]
    mov r0, r11, lsl #0x1f
    mov r3, r3, lsl #0x9
    mov r3, r3, lsr #0x1c
    mov r3, r3, lsl #0x10
    and r4, r3, #0x1f0000
    and r3, r0, #0x80000000
    ldr r0, [sp, #0x18]
    mov r1, r6, lsl #0x10
    mov r0, r0, lsl #0x19
    and r0, r0, #0x7e000000
    orr r0, r3, r0
    orr r0, r0, #0x400000
    orr r0, r4, r0
    orr r0, r0, r1, lsr #0x10
    ldr r1, [sp, #0x3c]
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021e30b4
    b .L_021daacc
.L_021da9b4:
    cmp r4, #0x0
    bne .L_021da948
    b .L_021daacc
.L_021da9c0:
    ldr r1, [sp, #0x20]
    cmp r1, #0x0
    ldrne r1, [sp, #0x38]
    cmpne r1, #0x0
    ldrne r1, [sp, #0x1c]
    cmpne r1, #0x0
    beq .L_021daacc
    ldr r1, [sp, #0x4]
    mov r2, #0x0
    ldrh r7, [r1, #0xa]
    cmp r7, #0x0
    beq .L_021daa1c
    ldr r3, .L_021da914
    add r0, r0, #0xaf
.L_021da9f8:
    mov r1, r7, lsl #0x3
    ldrh r1, [r3, r1]
    add r4, r3, r7, lsl #0x3
    ldrh r7, [r4, #0x6]
    cmp r1, r0
    ldreqh r1, [r4, #0x4]
    orreq r2, r1, r2, lsl #0x10
    cmp r7, #0x0
    bne .L_021da9f8
.L_021daa1c:
    cmp r2, #0x0
    beq .L_021daacc
    ldr r3, [sp, #0x70]
    mov r0, r11, lsl #0x1f
    mov r3, r3, lsl #0x9
    mov r3, r3, lsr #0x1c
    mov r3, r3, lsl #0x10
    and r4, r3, #0x1f0000
    and r3, r0, #0x80000000
    ldr r0, [sp, #0x18]
    mov r1, r6, lsl #0x10
    mov r0, r0, lsl #0x19
    and r0, r0, #0x7e000000
    orr r0, r3, r0
    orr r0, r0, #0x400000
    orr r0, r4, r0
    orr r0, r0, r1, lsr #0x10
    ldr r1, [sp, #0x3c]
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021e30b4
    b .L_021daacc
.L_021daa74:
    ldr r0, [sp, #0x4]
    ldrh r0, [r0, #0x8]
    cmp r0, #0x0
    beq .L_021daacc
    ldr r2, [sp, #0x70]
    mov r0, r2, lsl #0x9
    mov r0, r0, lsr #0x1c
    cmp r0, #0xd
    bne .L_021daacc
    mov r0, r11, lsl #0x1f
    and r3, r0, #0x80000000
    ldr r0, [sp, #0x18]
    mov r1, r6, lsl #0x10
    mov r0, r0, lsl #0x19
    and r0, r0, #0x7e000000
    orr r0, r3, r0
    orr r0, r0, #0x4d0000
    orr r0, r0, r1, lsr #0x10
    ldr r1, [sp, #0x3c]
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021e30b4
.L_021daacc:
    ldr r1, [sp, #0x40]
    ldr r2, .L_021db8b0
    mov r0, r5
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [sp, #0x10]
    ldr r0, [sp, #0x28]
    cmp r0, #0x0
    bne .L_021dabd0
    ldr r0, [sp, #0x38]
    cmp r0, #0x0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    beq .L_021dabd0
    ldr r0, [sp, #0x40]
    cmp r0, #0x5
    bge .L_021dabd0
    mov r0, r6
    bl func_0202e234
    cmp r0, #0x0
    beq .L_021dabd0
    mov r0, r6
    bl func_0202e42c
    cmp r0, #0x0
    beq .L_021dabd0
    ldr r0, [sp, #0x18]
    ldr r7, .L_021db8b4
    mov r0, r0, lsl #0x19
    and r9, r0, #0x7e000000
    ldr r0, .L_021db8b8
    ldr r10, .L_021da908
    mov r8, #0x0
    add r4, r0, #0x2a0000
.L_021dab54:
    ldr r2, .L_021db8b8
    mov r0, r8
    mov r1, #0xa
    bl func_ov002_021baca8
    cmp r0, #0x0
    beq .L_021dabc4
    and r0, r8, #0x1
    mla r1, r0, r10, r7
    cmp r11, r8
    movne r0, #0x1
    moveq r0, #0x0
    ldr r2, [r1, #0xf8]
    mov r1, r8, lsl #0x1f
    mov r0, r0, lsl #0x18
    and r1, r1, #0x80000000
    and r0, r0, #0x1000000
    orr r1, r1, r9
    orr r0, r1, r0
    mov r1, r2, lsl #0x12
    mov r2, r2, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r2, r2, lsl #0x1
    add r1, r2, r1, lsr #0x1f
    mov r1, r1, lsl #0x10
    ldr r2, [sp, #0x70]
    orr r0, r0, r4
    mov r1, r1, lsr #0x10
    bl func_ov002_021e30b4
.L_021dabc4:
    add r8, r8, #0x1
    cmp r8, #0x2
    blt .L_021dab54
.L_021dabd0:
    ldr r0, [sp, #0x38]
    cmp r0, #0x0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    beq .L_021dad74
    ldr r0, [sp, #0x40]
    cmp r0, #0x5
    bge .L_021dad74
    mov r0, r6
    bl func_0202e2c8
    cmp r0, #0x0
    beq .L_021dad74
    ldr r0, [sp, #0x28]
    cmp r0, #0x0
    bne .L_021daca8
    ldr r0, [sp, #0x18]
    ldr r7, .L_021db8b4
    mov r0, r0, lsl #0x19
    and r9, r0, #0x7e000000
    ldr r0, .L_021db8bc
    ldr r10, .L_021da908
    mov r8, #0x0
    add r4, r0, #0x2a0000
.L_021dac2c:
    ldr r2, .L_021db8bc
    mov r0, r8
    mov r1, #0xa
    bl func_ov002_021baca8
    cmp r0, #0x0
    beq .L_021dac9c
    and r0, r8, #0x1
    mla r1, r0, r10, r7
    cmp r11, r8
    movne r0, #0x1
    moveq r0, #0x0
    ldr r2, [r1, #0xf8]
    mov r1, r8, lsl #0x1f
    mov r0, r0, lsl #0x18
    and r1, r1, #0x80000000
    and r0, r0, #0x1000000
    orr r1, r1, r9
    orr r0, r1, r0
    mov r1, r2, lsl #0x12
    mov r2, r2, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r2, r2, lsl #0x1
    add r1, r2, r1, lsr #0x1f
    mov r1, r1, lsl #0x10
    ldr r2, [sp, #0x70]
    orr r0, r0, r4
    mov r1, r1, lsr #0x10
    bl func_ov002_021e30b4
.L_021dac9c:
    add r8, r8, #0x1
    cmp r8, #0x2
    blt .L_021dac2c
.L_021daca8:
    mov r0, #0x0
    str r0, [sp, #0x34]
    ldr r0, [sp, #0x18]
    mov r0, r0, lsl #0x19
    and r0, r0, #0x7e000000
    str r0, [sp, #0x2c]
.L_021dacc0:
    ldr r0, .L_021da904
    ldr r3, .L_021db8b4
    ldr r1, [r0, #0xcec]
    ldr r0, [sp, #0x34]
    ldr r4, .L_021db8c0
    eor r10, r1, r0
    ldr r0, .L_021da908
    and r2, r10, #0x1
    mla r0, r2, r0, r3
    mov r1, r10, lsl #0x1f
    add r8, r0, #0x94
    ldr r0, [sp, #0x2c]
    and r1, r1, #0x80000000
    orr r0, r1, r0
    mov r7, #0x5
    orr r9, r0, #0x200000
.L_021dad00:
    mov r0, r10
    mov r1, r7
    mov r2, r4
    bl func_ov002_021baca8
    cmp r0, #0x0
    beq .L_021dad50
    mov r0, r7, lsl #0x10
    and r0, r0, #0x1f0000
    orr r0, r0, r9
    orr r0, r0, r4
    ldr r3, [r8, #0x0]
    ldr r2, [sp, #0x70]
    mov r1, r3, lsl #0x12
    mov r3, r3, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r3, r3, lsl #0x1
    add r1, r3, r1, lsr #0x1f
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021e30b4
.L_021dad50:
    add r8, r8, #0x14
    add r7, r7, #0x1
    cmp r7, #0xa
    blt .L_021dad00
    ldr r0, [sp, #0x34]
    add r0, r0, #0x1
    str r0, [sp, #0x34]
    cmp r0, #0x2
    blt .L_021dacc0
.L_021dad74:
    ldr r0, [sp, #0x28]
    cmp r0, #0x0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    beq .L_021dadb0
    rsb r0, r5, #0x1
    ldr r1, .L_021db8c4
    mvn r2, #0x0
    bl func_ov002_021bae7c
    cmp r0, #0x0
    beq .L_021dadb0
    ldr r0, [sp, #0x4]
    ldr r1, .L_021db8c8
    add r2, sp, #0x70
    bl func_ov002_021b4354
.L_021dadb0:
    ldr r0, [sp, #0x28]
    cmp r0, #0x0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    beq .L_021dae6c
    mov r0, r6
    bl func_0202f2e4
    cmp r0, #0x0
    beq .L_021dae6c
    ldr r3, .L_021db8b4
    ldr r0, .L_021da908
    and r2, r5, #0x1
    mla r0, r2, r0, r3
    add r8, r0, #0x30
    ldr r0, [sp, #0x18]
    mov r1, r5, lsl #0x1f
    mov r0, r0, lsl #0x19
    and r1, r1, #0x80000000
    and r0, r0, #0x7e000000
    orr r0, r1, r0
    ldr r4, .L_021db8cc
    mov r7, #0x0
    orr r9, r0, #0x200000
.L_021dae0c:
    mov r0, r5
    mov r1, r7
    mov r2, r4
    bl func_ov002_021baca8
    cmp r0, #0x0
    beq .L_021dae5c
    mov r0, r7, lsl #0x10
    and r0, r0, #0x1f0000
    orr r0, r0, r9
    orr r0, r0, r4
    ldr r3, [r8, #0x0]
    ldr r2, [sp, #0x70]
    mov r1, r3, lsl #0x12
    mov r3, r3, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r3, r3, lsl #0x1
    add r1, r3, r1, lsr #0x1f
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021e30b4
.L_021dae5c:
    add r8, r8, #0x14
    add r7, r7, #0x1
    cmp r7, #0x4
    ble .L_021dae0c
.L_021dae6c:
    ldr r0, [sp, #0x28]
    cmp r0, #0x0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    beq .L_021daf1c
    ldr r1, .L_021da908
    ldr r3, .L_021db8b4
    and r2, r5, #0x1
    mla r3, r2, r1, r3
    mov r0, r5, lsl #0x1f
    and r2, r0, #0x80000000
    ldr r0, [sp, #0x18]
    rsb r10, r1, #0x22c0
    mov r0, r0, lsl #0x19
    and r0, r0, #0x7e000000
    orr r0, r2, r0
    mov r7, #0x0
    add r8, r3, #0x30
    orr r9, r0, #0x200000
    mov r4, r10
.L_021daebc:
    mov r0, r5
    mov r1, r7
    mov r2, r10
    bl func_ov002_021baca8
    cmp r0, #0x0
    beq .L_021daf0c
    mov r0, r7, lsl #0x10
    and r0, r0, #0x1f0000
    orr r0, r0, r9
    orr r0, r0, r4
    ldr r3, [r8, #0x0]
    ldr r2, [sp, #0x70]
    mov r1, r3, lsl #0x12
    mov r3, r3, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r3, r3, lsl #0x1
    add r1, r3, r1, lsr #0x1f
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021e30b4
.L_021daf0c:
    add r8, r8, #0x14
    add r7, r7, #0x1
    cmp r7, #0x4
    ble .L_021daebc
.L_021daf1c:
    ldr r0, .L_021db8d0
    cmp r6, r0
    bne .L_021daf74
    ldr r0, [sp, #0x38]
    cmp r0, #0x0
    beq .L_021daf74
    mov r0, r5
    ldr r1, .L_021db8d4
    bl func_ov002_021ba294
    cmp r0, #0x0
    blt .L_021daf74
    mov r0, r5, lsl #0x1f
    and r1, r0, #0x80000000
    ldr r0, [sp, #0x18]
    mov r0, r0, lsl #0x19
    and r0, r0, #0x7e000000
    orr r2, r1, r0
    ldr r0, .L_021db8d8
    mov r1, #0x0
    orr r0, r2, r0
    ldr r2, [sp, #0x70]
    bl func_ov002_021e30b4
.L_021daf74:
    mov r0, r6
    bl func_0202b878
    cmp r0, #0xb
    bne .L_021db0c4
    ldr r0, [sp, #0x38]
    cmp r0, #0x0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    beq .L_021db0c4
    and r2, r5, #0x1
    ldr r0, .L_021da908
    ldr r1, .L_021db8dc
    mul r10, r2, r0
    ldr r0, [r1, r10]
    subs r7, r0, #0x1
    bmi .L_021db03c
    ldr r0, .L_021db8b4
    mov r1, r5, lsl #0x1f
    add r0, r0, r10
    add r0, r0, #0x18
    add r0, r0, #0x400
    add r8, r0, r7, lsl #0x2
    ldr r0, [sp, #0x18]
    and r1, r1, #0x80000000
    mov r0, r0, lsl #0x19
    and r0, r0, #0x7e000000
    orr r1, r1, r0
    ldr r0, .L_021db8e0
    orr r9, r1, r0
    sub r4, r0, #0x4e0000
.L_021dafec:
    ldr r1, [r8, #0x0]
    mov r0, r1, lsl #0x13
    cmp r4, r0, lsr #0x13
    bne .L_021db030
    mov r0, r1, lsl #0xa
    movs r0, r0, lsr #0x1f
    bne .L_021db030
    mov r0, r9
    mov r2, r1, lsl #0x12
    mov r1, r1, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    ldr r2, [sp, #0x70]
    bl func_ov002_021e30b4
.L_021db030:
    sub r8, r8, #0x4
    subs r7, r7, #0x1
    bpl .L_021dafec
.L_021db03c:
    ldr r0, .L_021db8e4
    ldr r0, [r0, r10]
    subs r4, r0, #0x1
    bmi .L_021db0c4
    ldr r1, .L_021db8b4
    mov r0, r5, lsl #0x1f
    add r1, r1, r10
    add r1, r1, #0x120
    add r8, r1, r4, lsl #0x2
    and r1, r0, #0x80000000
    ldr r0, [sp, #0x18]
    mov r0, r0, lsl #0x19
    and r0, r0, #0x7e000000
    orr r1, r1, r0
    ldr r0, .L_021db8e8
    orr r9, r1, r0
    sub r7, r0, #0x500000
.L_021db080:
    ldr r1, [r8, #0x0]
    mov r0, r1, lsl #0x13
    cmp r7, r0, lsr #0x13
    bne .L_021db0b8
    mov r0, r9
    mov r2, r1, lsl #0x12
    mov r1, r1, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    ldr r2, [sp, #0x70]
    bl func_ov002_021e30b4
.L_021db0b8:
    sub r8, r8, #0x4
    subs r4, r4, #0x1
    bpl .L_021db080
.L_021db0c4:
    ldr r0, [sp, #0x28]
    cmp r0, #0x0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    beq .L_021db198
    ldr r0, [sp, #0x4]
    ldr r0, [r0, #0x10]
    mov r0, r0, lsr #0x19
    tst r0, #0x1
    beq .L_021db198
    mov r0, r5
    mov r1, #0xb
    ldr r2, .L_021db8ec
    bl func_ov002_021b3e28
    cmp r0, #0x1
    bne .L_021db198
    and r2, r5, #0x1
    ldr r0, .L_021da908
    ldr r1, .L_021db8e4
    mul r3, r2, r0
    ldr r0, [r1, r3]
    subs r7, r0, #0x1
    bmi .L_021db198
    ldr r1, .L_021db8b4
    mov r0, r5, lsl #0x1f
    add r1, r1, r3
    add r1, r1, #0x120
    add r8, r1, r7, lsl #0x2
    and r1, r0, #0x80000000
    ldr r0, [sp, #0x18]
    mov r0, r0, lsl #0x19
    and r0, r0, #0x7e000000
    orr r1, r1, r0
    ldr r0, .L_021db8f0
    orr r9, r1, r0
    sub r4, r0, #0x500000
.L_021db154:
    ldr r1, [r8, #0x0]
    mov r0, r1, lsl #0x13
    cmp r4, r0, lsr #0x13
    bne .L_021db18c
    mov r0, r9
    mov r2, r1, lsl #0x12
    mov r1, r1, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    ldr r2, [sp, #0x70]
    bl func_ov002_021e30b4
.L_021db18c:
    sub r8, r8, #0x4
    subs r7, r7, #0x1
    bpl .L_021db154
.L_021db198:
    mov r0, r6
    bl func_0202b878
    cmp r0, #0x9
    bne .L_021db1fc
    ldr r0, [sp, #0x1c]
    cmp r0, #0x0
    beq .L_021db1fc
    ldr r8, .L_021db8f4
    mov r9, #0x0
    mov r7, #0x5
    mov r4, #0x1
.L_021db1c4:
    mov r0, r11
    mov r1, r9
    mov r2, r8
    bl func_ov002_021baca8
    cmp r0, #0x0
    beq .L_021db1f0
    mov r0, r11
    mov r1, r9
    mov r2, r7
    mov r3, r4
    bl func_ov002_021e2d94
.L_021db1f0:
    add r9, r9, #0x1
    cmp r9, #0x4
    ble .L_021db1c4
.L_021db1fc:
    ldr r1, [sp, #0x3c]
    mov r0, r6
    bl func_ov002_021bd85c
    cmp r0, #0x0
    ldr r0, .L_021da904
    moveq r4, #0x1
    ldr r0, [r0, #0xcec]
    ldr r2, .L_021db8f8
    ldr r3, [sp, #0x3c]
    mov r1, #0xb
    movne r4, #0x0
    bl func_ov002_021b3fd8
    cmp r0, #0x0
    ldr r2, .L_021db8fc
    movne r4, #0x0
    cmp r6, r2
    bgt .L_021db2e8
    bge .L_021db444
    ldr r0, .L_021db900
    cmp r6, r0
    bgt .L_021db284
    bge .L_021db558
    sub r1, r0, #0xbc
    cmp r6, r1
    bgt .L_021db274
    bge .L_021db4ec
    sub r0, r0, #0x17c
    cmp r6, r0
    beq .L_021db478
    b .L_021db998
.L_021db274:
    sub r0, r0, #0x7d
    cmp r6, r0
    beq .L_021db36c
    b .L_021db998
.L_021db284:
    add r1, r0, #0x4f
    cmp r6, r1
    bgt .L_021db2a4
    bge .L_021db3c4
    add r0, r0, #0x49
    cmp r6, r0
    beq .L_021db548
    b .L_021db998
.L_021db2a4:
    add r1, r0, #0x9b
    cmp r6, r1
    bgt .L_021db2b8
    beq .L_021db3f0
    b .L_021db998
.L_021db2b8:
    add r1, r0, #0x150
    cmp r6, r1
    bgt .L_021db998
    sub r1, r2, #0x89
    cmp r6, r1
    blt .L_021db998
    subne r1, r2, #0x88
    cmpne r6, r1
    addne r0, r0, #0x150
    cmpne r6, r0
    beq .L_021db420
    b .L_021db998
.L_021db2e8:
    ldr r1, .L_021db904
    cmp r6, r1
    bgt .L_021db328
    bge .L_021db79c
    ldr r0, .L_021db908
    cmp r6, r0
    bgt .L_021db318
    bge .L_021db694
    sub r0, r0, #0x7e
    cmp r6, r0
    beq .L_021db5fc
    b .L_021db998
.L_021db318:
    add r0, r0, #0x60
    cmp r6, r0
    beq .L_021db728
    b .L_021db998
.L_021db328:
    add r0, r1, #0x6b
    cmp r6, r0
    bgt .L_021db348
    bge .L_021db7e0
    add r0, r1, #0x1
    cmp r6, r0
    beq .L_021db79c
    b .L_021db998
.L_021db348:
    add r0, r1, #0x6d
    cmp r6, r0
    bgt .L_021db35c
    beq .L_021db844
    b .L_021db998
.L_021db35c:
    add r0, r1, #0xa8
    cmp r6, r0
    beq .L_021db928
    b .L_021db998
.L_021db36c:
    cmp r4, #0x0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    beq .L_021db998
    ldr r0, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r0, r0, lsl #0xa
    movs r0, r0, lsr #0x1f
    bne .L_021db998
    ldr r2, [sp, #0x3c]
    mov r0, r11
    mov r1, #0xe
    bl func_ov002_021df62c
    ldr r3, [sp, #0x3c]
    mov r1, r6, lsl #0x10
    mov r3, r3, lsl #0x10
    mov r0, r11
    mov r1, r1, lsr #0x10
    mov r2, #0x1
    mov r3, r3, lsr #0x10
    bl func_ov002_021e276c
    b .L_021db998
.L_021db3c4:
    cmp r4, #0x0
    bne .L_021db998
    ldr r3, [sp, #0x3c]
    mov r1, r6, lsl #0x10
    mov r3, r3, lsl #0x10
    mov r0, r11
    mov r1, r1, lsr #0x10
    mov r2, #0x5
    mov r3, r3, lsr #0x10
    bl func_ov002_021e276c
    b .L_021db998
.L_021db3f0:
    ldr r1, [sp, #0x28]
    cmp r1, #0x0
    ldrne r1, [sp, #0x38]
    cmpne r1, #0x0
    beq .L_021db998
    add r3, r0, #0x73
    ldr r0, [sp, #0x4]
    mov r1, #0x1f4
    ldr r0, [r0, #0xc]
    mov r2, #0x1
    bl func_ov002_021df938
    b .L_021db998
.L_021db420:
    ldr r0, [sp, #0x38]
    cmp r0, #0x0
    beq .L_021db998
    mov r0, r5
    mov r1, #0x12c
    mov r2, #0x0
    ldr r3, .L_021db90c
    bl func_ov002_021df938
    b .L_021db998
.L_021db444:
    cmp r4, #0x0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    beq .L_021db998
    ldr r3, [sp, #0x3c]
    mov r1, r6, lsl #0x10
    mov r3, r3, lsl #0x10
    mov r0, r11
    mov r1, r1, lsr #0x10
    mov r2, #0x1
    mov r3, r3, lsr #0x10
    bl func_ov002_021e276c
    b .L_021db998
.L_021db478:
    cmp r4, #0x0
    ldrne r0, [sp, #0x20]
    cmpne r0, #0x0
    ldrne r0, [sp, #0x38]
    cmpne r0, #0x0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    beq .L_021db998
    ldr r1, [sp, #0x4]
    ldr r0, [sp, #0x3c]
    ldr r1, [r1, #0x0]
    mov r1, r1, lsl #0x13
    mov r1, r1, lsr #0x13
    bl func_ov002_021b4204
    cmp r0, #0x0
    bne .L_021db998
    ldr r1, [sp, #0x4]
    ldr r3, [sp, #0x3c]
    ldr r1, [r1, #0x0]
    mov r3, r3, lsl #0x10
    mov r1, r1, lsl #0x13
    mov r1, r1, lsr #0x13
    mov r1, r1, lsl #0x10
    mov r0, r11
    mov r2, #0x1
    mov r1, r1, lsr #0x10
    mov r3, r3, lsr #0x10
    bl func_ov002_021e276c
    b .L_021db998
.L_021db4ec:
    cmp r4, #0x0
    beq .L_021db998
    cmp r5, r11
    bne .L_021db998
    ldr r0, [sp, #0x40]
    cmp r0, #0x5
    bge .L_021db998
    ldr r0, [sp, #0x38]
    cmp r0, #0x0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    ldrne r0, [sp, #0x24]
    cmpne r0, #0x0
    beq .L_021db998
    ldr r3, [sp, #0x3c]
    mov r1, r6, lsl #0x10
    mov r3, r3, lsl #0x10
    mov r0, r5
    mov r1, r1, lsr #0x10
    mov r2, #0x1
    mov r3, r3, lsr #0x10
    bl func_ov002_021e276c
    b .L_021db998
.L_021db548:
    ldr r0, [sp, #0x4]
    ldrh r0, [r0, #0x8]
    cmp r0, #0x0
    beq .L_021db998
.L_021db558:
    cmp r4, #0x0
    beq .L_021db998
    cmp r5, r11
    bne .L_021db998
    ldr r0, [sp, #0x40]
    cmp r0, #0x5
    bge .L_021db998
    ldr r0, [sp, #0x28]
    cmp r0, #0x0
    bne .L_021db998
    ldr r0, [sp, #0x38]
    cmp r0, #0x0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    ldrne r0, [sp, #0x24]
    cmpne r0, #0x0
    beq .L_021db998
    ldr r0, .L_021da904
    ldr r1, [r0, #0xcec]
    cmp r11, r1
    bne .L_021db5c4
    ldr r0, [r0, #0xcf8]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    mov r0, r0, lsl #0x1
    b .L_021db5c8
.L_021db5c4:
    mov r0, #0x1
.L_021db5c8:
    and r0, r0, #0xf
    mov r0, r0, lsl #0x4
    ldr r3, [sp, #0x3c]
    orr r0, r0, #0x1
    mov r0, r0, lsl #0x10
    mov r1, r6, lsl #0x10
    mov r3, r3, lsl #0x10
    mov r2, r0, lsr #0x10
    mov r0, r11
    mov r1, r1, lsr #0x10
    mov r3, r3, lsr #0x10
    bl func_ov002_021e276c
    b .L_021db998
.L_021db5fc:
    cmp r4, #0x0
    ldrne r0, [sp, #0x20]
    cmpne r0, #0x0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    beq .L_021db998
    ldr r0, [sp, #0x8]
    bl func_0202b878
    cmp r0, #0x16
    bne .L_021db998
    ldr r0, [sp, #0x8]
    bl func_0202b8c0
    cmp r0, #0x4
    bne .L_021db998
    ldr r0, .L_021da904
    ldr r1, [r0, #0xcec]
    cmp r11, r1
    bne .L_021db65c
    ldr r0, [r0, #0xcf8]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    mov r0, r0, lsl #0x1
    b .L_021db660
.L_021db65c:
    mov r0, #0x1
.L_021db660:
    and r0, r0, #0xf
    mov r0, r0, lsl #0x4
    ldr r3, [sp, #0x3c]
    orr r0, r0, #0x1
    mov r0, r0, lsl #0x10
    mov r1, r6, lsl #0x10
    mov r3, r3, lsl #0x10
    mov r2, r0, lsr #0x10
    mov r0, r11
    mov r1, r1, lsr #0x10
    mov r3, r3, lsr #0x10
    bl func_ov002_021e276c
    b .L_021db998
.L_021db694:
    cmp r4, #0x0
    beq .L_021db998
    ldr r0, [sp, #0x40]
    cmp r0, #0x5
    bge .L_021db998
    ldr r0, [sp, #0x28]
    cmp r0, #0x0
    bne .L_021db998
    ldr r0, [sp, #0x38]
    cmp r0, #0x0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    beq .L_021db998
    ldr r0, .L_021da904
    ldr r1, [r0, #0xcec]
    cmp r11, r1
    bne .L_021db6f0
    ldr r0, [r0, #0xcf8]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    mov r0, r0, lsl #0x1
    b .L_021db6f4
.L_021db6f0:
    mov r0, #0x1
.L_021db6f4:
    and r0, r0, #0xf
    mov r0, r0, lsl #0x4
    ldr r3, [sp, #0x3c]
    orr r0, r0, #0x1
    mov r0, r0, lsl #0x10
    mov r1, r6, lsl #0x10
    mov r3, r3, lsl #0x10
    mov r2, r0, lsr #0x10
    mov r0, r11
    mov r1, r1, lsr #0x10
    mov r3, r3, lsr #0x10
    bl func_ov002_021e276c
    b .L_021db998
.L_021db728:
    cmp r4, #0x0
    ldrne r0, [sp, #0x20]
    cmpne r0, #0x0
    beq .L_021db998
    ldr r0, [sp, #0x70]
    mov r0, r0, lsl #0x9
    mov r0, r0, lsr #0x1c
    cmp r0, #0xf
    bne .L_021db998
    ldr r0, [sp, #0x4]
    ldrh r0, [r0, #0x8]
    cmp r0, #0x0
    beq .L_021db998
    ldr r0, [sp, #0x28]
    cmp r0, #0x0
    beq .L_021db778
    ldr r0, .L_021da8c8
    ldr r0, [r0, #0x24]
    cmp r0, r6
    beq .L_021db998
.L_021db778:
    ldr r3, [sp, #0x3c]
    mov r1, r6, lsl #0x10
    mov r3, r3, lsl #0x10
    mov r0, r5
    mov r1, r1, lsr #0x10
    mov r2, #0x1
    mov r3, r3, lsr #0x10
    bl func_ov002_021e276c
    b .L_021db998
.L_021db79c:
    cmp r4, #0x0
    ldrne r0, [sp, #0x28]
    cmpne r0, #0x0
    ldrne r0, [sp, #0x38]
    cmpne r0, #0x0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    beq .L_021db998
    ldr r3, [sp, #0x3c]
    mov r1, r6, lsl #0x10
    mov r3, r3, lsl #0x10
    mov r0, r11
    mov r1, r1, lsr #0x10
    mov r2, #0x1
    mov r3, r3, lsr #0x10
    bl func_ov002_021e276c
    b .L_021db998
.L_021db7e0:
    cmp r4, #0x0
    ldrne r0, [sp, #0x38]
    cmpne r0, #0x0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    beq .L_021db998
    ldr r0, .L_021da904
    ldr r3, [sp, #0x3c]
    ldr r0, [r0, #0xcec]
    mov r1, r6, lsl #0x10
    cmp r11, r0
    moveq r0, #0x1
    movne r0, #0x0
    add r0, r0, #0x1
    and r0, r0, #0xff
    mov r0, r0, lsl #0x4
    orr r0, r0, #0x1
    mov r0, r0, lsl #0x10
    mov r3, r3, lsl #0x10
    mov r2, r0, lsr #0x10
    mov r0, r11
    mov r1, r1, lsr #0x10
    mov r3, r3, lsr #0x10
    bl func_ov002_021e276c
    b .L_021db998
.L_021db844:
    cmp r4, #0x0
    ldrne r0, [sp, #0x28]
    cmpne r0, #0x0
    ldrne r0, [sp, #0x38]
    cmpne r0, #0x0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    beq .L_021db998
    ldr r0, .L_021db910
    ldr r3, [sp, #0x3c]
    ldr r0, [r0, #0xcec]
    mov r1, r6, lsl #0x10
    cmp r11, r0
    moveq r0, #0x1
    movne r0, #0x0
    add r0, r0, #0x1
    and r0, r0, #0xff
    mov r0, r0, lsl #0x4
    orr r0, r0, #0x1
    mov r0, r0, lsl #0x10
    mov r3, r3, lsl #0x10
    mov r2, r0, lsr #0x10
    mov r0, r11
    mov r1, r1, lsr #0x10
    mov r3, r3, lsr #0x10
    bl func_ov002_021e276c
    b .L_021db998
.L_021db8b0:
        .word   0x19ae
.L_021db8b4:
        .word   data_ov002_022cf16c
.L_021db8b8:
        .word   0x169f
.L_021db8bc:
        .word   0x187f
.L_021db8c0:
        .word   0x1971
.L_021db8c4:
        .word   0x18d1
.L_021db8c8:
        .word   func_ov002_021d9778
.L_021db8cc:
        .word   0x1a59
.L_021db8d0:
        .word   0x18aa
.L_021db8d4:
        .word   0x1445
.L_021db8d8:
        .word   0x501445
.L_021db8dc:
        .word   data_ov002_022cf180
.L_021db8e0:
        .word   0x4e18ec
.L_021db8e4:
        .word   data_ov002_022cf178
.L_021db8e8:
        .word   0x5018ec
.L_021db8ec:
        .word   0x197d
.L_021db8f0:
        .word   0x50197d
.L_021db8f4:
        .word   0x1a8d
.L_021db8f8:
        .word   0x15ff
.L_021db8fc:
        .word   0x16f9
.L_021db900:
        .word   0x1522
.L_021db904:
        .word   0x19f7
.L_021db908:
        .word   0x185c
.L_021db90c:
        .word   0x166a
.L_021db910:
        .word   data_ov002_022d016c
.L_021db914:
        .word   0x1782
.L_021db918:
        .word   0x868
.L_021db91c:
        .word   0x1843
.L_021db920:
        .word   0x1862
.L_021db924:
        .word   0x1875
.L_021db928:
    cmp r11, r5
    bne .L_021db998
    ldr r0, [sp, #0x40]
    cmp r0, #0x5
    blt .L_021db998
    ldr r0, [sp, #0x4]
    ldrh r0, [r0, #0x8]
    cmp r0, #0x0
    bne .L_021db998
    ldr r0, [sp, #0x24]
    cmp r0, #0x0
    ldrne r0, [sp, #0x38]
    cmpne r0, #0x0
    beq .L_021db998
    ldr r0, [sp, #0x28]
    cmp r0, #0x0
    bne .L_021db998
    ldr r0, [sp, #0x1c]
    cmp r0, #0x0
    beq .L_021db998
    ldr r3, [sp, #0x3c]
    mov r1, r6, lsl #0x10
    mov r3, r3, lsl #0x10
    mov r0, r11
    mov r1, r1, lsr #0x10
    mov r2, #0x1
    mov r3, r3, lsr #0x10
    bl func_ov002_021e276c
.L_021db998:
    ldr r0, [sp, #0x20]
    cmp r0, #0x0
    beq .L_021dbb2c
    ldr r0, [sp, #0x38]
    cmp r0, #0x0
    beq .L_021dbabc
    ldr r0, [sp, #0x14]
    cmp r0, #0x11
    bne .L_021dbabc
    ldr r1, .L_021db914
    mov r0, r5
    bl func_ov002_021bb90c
    cmp r0, #0x0
    beq .L_021dbabc
    ldr r0, .L_021db918
    and r1, r5, #0x1
    mul r0, r1, r0
    str r0, [sp, #0x44]
    and r0, r5, #0xff
    str r0, [sp, #0x30]
    ldr r0, .L_021db91c
    mov r10, #0x5
    sub r4, r0, #0xc1
.L_021db9f4:
    ldr r2, .L_021db91c
    mov r0, r5
    mov r1, r10
    bl func_ov002_021baca8
    cmp r0, #0x0
    beq .L_021dbab0
    mov r0, #0x0
    str r0, [sp, #0x0]
    ldr r2, .L_021db91c
    mov r0, r5
    mov r1, r10
    mov r3, #0x2
    bl func_ov002_021d59cc
    ldr r1, .L_021db8b4
    ldr r0, [sp, #0x44]
    mov r8, #0x0
    add r9, r1, r0
    ldr r0, [sp, #0x30]
    and r1, r10, #0xff
    orr r0, r0, r1, lsl #0x8
    mov r0, r0, lsl #0x10
    mov r7, r0, lsr #0x10
.L_021dba4c:
    mov r0, r5
    mov r1, r8
    bl func_ov002_021b9ecc
    cmp r0, r4
    bne .L_021dbaa0
    ldrh r0, [r9, #0x38]
    cmp r0, #0x0
    beq .L_021dbaa0
    ldr r0, .L_021db910
    add r1, r8, r5, lsl #0x4
    ldr r2, [r0, #0xd4]
    mov r0, #0x1
    tst r2, r0, lsl r1
    bne .L_021dbaa0
    mov r0, #0x0
    str r0, [sp, #0x0]
    mov r0, r5
    mov r1, r8
    mov r2, r7
    mov r3, #0x8
    bl func_ov002_021d59cc
.L_021dbaa0:
    add r9, r9, #0x14
    add r8, r8, #0x1
    cmp r8, #0x4
    ble .L_021dba4c
.L_021dbab0:
    add r10, r10, #0x1
    cmp r10, #0xa
    ble .L_021db9f4
.L_021dbabc:
    ldr r0, [sp, #0x38]
    cmp r0, #0x0
    ldrne r0, [sp, #0x4]
    ldrneh r0, [r0, #0x8]
    cmpne r0, #0x0
    beq .L_021dbb00
    ldr r0, [sp, #0x14]
    cmp r0, #0xb
    bne .L_021dbae8
    ldr r0, .L_021db920
    bl func_ov002_02253b6c
.L_021dbae8:
    ldr r0, [sp, #0x14]
    cmp r0, #0x10
    bne .L_021dbb00
    ldr r1, .L_021db924
    mov r0, r5
    bl func_ov002_02253af8
.L_021dbb00:
    ldr r0, [sp, #0x14]
    cmp r0, #0x1
    bne .L_021dbb2c
    ldr r0, [sp, #0xc]
    tst r0, #0x1000
    beq .L_021dbb2c
    ldr r1, .L_021dbd34
    mov r0, r5
    mov r2, #0x2
    mov r3, #0x0
    bl func_ov002_021e276c
.L_021dbb2c:
    ldr r0, [sp, #0x28]
    cmp r0, #0x0
    ldrne r0, [sp, #0x1c]
    cmpne r0, #0x0
    beq .L_021dbbd4
    mov r0, r6
    bl func_0202ed90
    cmp r0, #0x0
    beq .L_021dbbd4
    ldr r0, [sp, #0x3c]
    ldr r8, .L_021dbd38
    mov r0, r0, lsl #0x10
    ldr r4, .L_021db910
    mov r9, #0x0
    mov r7, r0, lsr #0x10
    mov r10, #0x2
.L_021dbb6c:
    ldr r0, [sp, #0x40]
    cmp r9, r0
    beq .L_021dbbc8
    mov r0, r5
    mov r1, r9
    mov r2, r8
    bl func_ov002_021baca8
    cmp r0, #0x0
    beq .L_021dbbc8
    ldr r0, [r4, #0xcec]
    mov r1, r9
    cmp r11, r0
    moveq r0, r10
    movne r0, #0x1
    and r0, r0, #0xf
    mov r0, r0, lsl #0x4
    orr r0, r0, #0x2
    mov r0, r0, lsl #0x10
    mov r3, r0, lsr #0x10
    mov r0, r5
    mov r2, r8
    str r7, [sp, #0x0]
    bl func_ov002_021d59cc
.L_021dbbc8:
    add r9, r9, #0x1
    cmp r9, #0x4
    ble .L_021dbb6c
.L_021dbbd4:
    ldr r0, [sp, #0x70]
    mov r0, r0, lsl #0x9
    mov r0, r0, lsr #0x1c
    cmp r0, #0xb
    bne .L_021dbc48
    ldr r0, [sp, #0x40]
    cmp r0, #0x5
    bge .L_021dbc48
    mov r0, r6
    bl func_0202e2f8
    cmp r0, #0x0
    bne .L_021dbc48
    ldr r0, .L_021dbd3c
    bl func_ov002_02253b6c
    ldr r0, [sp, #0x70]
    mov r0, r0, lsl #0xe
    movs r0, r0, lsr #0x1f
    beq .L_021dbc34
    mov r0, r6
    bl func_0202e328
    cmp r0, #0x0
    beq .L_021dbc34
    ldr r0, .L_021dbd40
    bl func_ov002_02253b6c
.L_021dbc34:
    mov r0, r11, lsl #0x3
    mov r1, #0x1
    mov r1, r1, lsl r0
    ldr r0, .L_021dbd44
    bl func_ov002_02253928
.L_021dbc48:
    ldr r0, [sp, #0x10]
    cmp r0, #0x1
    beq .L_021dbc80
    cmp r0, #0x2
    addeq sp, sp, #0x4c
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    addeq sp, sp, #0x10
    bxeq lr
    cmp r0, #0x3
    beq .L_021dbcdc
    add sp, sp, #0x4c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    add sp, sp, #0x10
    bx lr
.L_021dbc80:
    ldr r2, [sp, #0x70]
    ldr r0, [sp, #0x18]
    mov r1, r2, lsl #0x9
    mov r3, r0, lsl #0x19
    mov r0, r1, lsr #0x1c
    mov r5, r0, lsl #0x10
    ldr r0, [sp, #0x3c]
    mov r4, r11, lsl #0x1f
    mov r1, r0, lsl #0x10
    and r4, r4, #0x80000000
    and r0, r3, #0x7e000000
    orr r0, r4, r0
    orr r3, r0, #0x400000
    and r4, r5, #0x1f0000
    mov r0, r6, lsl #0x10
    orr r3, r4, r3
    orr r0, r3, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021e30b4
    add sp, sp, #0x4c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    add sp, sp, #0x10
    bx lr
.L_021dbcdc:
    ldr r0, [sp, #0x18]
    mov r2, r5, lsl #0x1f
    mov r1, r0, lsl #0x19
    ldr r0, [sp, #0x40]
    and r2, r2, #0x80000000
    mov r3, r0, lsl #0x10
    and r0, r1, #0x7e000000
    orr r2, r2, r0
    ldr r0, [sp, #0x3c]
    and r3, r3, #0x1f0000
    mov r1, r0, lsl #0x10
    orr r2, r2, #0x200000
    orr r3, r3, r2
    mov r0, r6, lsl #0x10
    ldr r2, [sp, #0x70]
    orr r0, r3, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021e30b4
    add sp, sp, #0x4c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    add sp, sp, #0x10
    bx lr
.L_021dbd34:
        .word   0x14e2
.L_021dbd38:
        .word   0x1a03
.L_021dbd3c:
        .word   0x142c
.L_021dbd40:
        .word   0x151a
.L_021dbd44:
        .word   0x18b2
