; func_ov002_02284a2c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd444
        .extern data_ov002_022cd63c
        .extern data_ov002_022cf08c
        .extern func_ov002_021b3dec
        .extern func_ov002_021b9dec
        .extern func_ov002_021baf88
        .extern func_ov002_021bbe70
        .extern func_ov002_021bc14c
        .extern func_ov002_021be1f8
        .extern func_ov002_021c0b04
        .extern func_ov002_0227dbf4
        .extern func_ov002_022813e0
        .extern func_ov002_022837f8
        .extern func_ov002_022847d0
        .extern func_ov002_0229cc60
        .global func_ov002_02284a2c
        .arm
func_ov002_02284a2c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x1dc
    mov r9, r0
    ldr r2, _LIT0
    ldr r3, _LIT1
    and r4, r9, #0x1
    mla r2, r4, r2, r3
    mov r0, #0x0
    str r0, [sp, #0x20]
    str r2, [sp, #0xc]
    ldr r2, [sp, #0x20]
    ldr r0, _LIT2
    str r1, [sp, #0x4]
    str r2, [r0, #0x1fc]
    str r2, [r0, #0x1f8]
    str r2, [r0, #0x210]
    str r2, [r0, #0x214]
    mov r1, r2
    str r2, [r0, #0x208]
    str r1, [r0, #0x20c]
    ldr r0, _LIT3
    ldr r8, [sp, #0xc]
    ldr sl, _LIT4
    str r1, [sp, #0x24]
    mov r7, r2
    add r4, sp, #0x1c8
    sub r6, r0, #0x35c
    mov fp, #0x1
.L_f3c:
    mov r0, r9
    mov r1, r7
    mov r2, fp
    bl func_ov002_021be1f8
    cmp r0, #0x0
    beq .L_1010
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    bge .L_1000
    ldr r0, [r8, #0x40]
    mov r0, r0, lsr #0x16
    tst r0, #0x1
    beq .L_1000
    mov r0, r9
    mov r1, #0xb
    mov r2, r6
    bl func_ov002_021b3dec
    cmp r0, #0x0
    bne .L_1010
    ldr r2, _LIT3
    mov r0, r9
    mov r1, #0xb
    bl func_ov002_021b3dec
    cmp r0, #0x0
    bne .L_1010
    ldr r1, [r8, #0x40]
    ldrh r2, [r8, #0x38]
    mov r0, r1, lsr #0x6
    and r0, r0, #0x1
    mvn r0, r0
    and r0, r2, r0
    mov r2, r1, lsr #0x2
    orr r1, r2, r1, lsr #0x1
    and r1, r1, #0x1
    mvn r1, r1
    tst r0, r1
    beq .L_1000
    mov r0, r9
    mov r1, r7
    bl func_ov002_021b9dec
    mov r5, r0
    bl func_ov002_0227dbf4
    cmp r0, #0x0
    beq .L_1000
    cmp r5, sl
    bne .L_1010
    ldr r0, [r8, #0x3c]
    cmp r0, #0x0
    bne .L_1010
.L_1000:
    ldr r0, [sp, #0x24]
    str r7, [r4, r0, lsl #0x2]
    add r0, r0, #0x1
    str r0, [sp, #0x24]
.L_1010:
    add r8, r8, #0x14
    add r7, r7, #0x1
    cmp r7, #0x5
    blt .L_f3c
    ldr r0, [sp, #0x24]
    cmp r0, #0x0
    addeq sp, sp, #0x1dc
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    sub r0, r0, #0x1
    cmp r0, #0x0
    mov r0, #0x0
    str r0, [sp, #0x8]
    ble .L_1b20
    ldr r4, _LIT2
    mov r0, #0xdc
    mla r0, r9, r0, r4
    rsb fp, r9, #0x1
    ldr r3, _LIT1
    ldr r1, _LIT0
    and r2, fp, #0x1
    str r0, [sp, #0x14]
    mla r0, r2, r1, r3
    str r0, [sp, #0x10]
.L_1070:
    ldr r0, [sp, #0x8]
    str r0, [sp, #0x18]
    mov r4, r0
    mov r1, r0
    ldr r0, [sp, #0x24]
    cmp r1, r0
    mvn r0, #0x0
    str r0, [sp, #0x1c]
    bge .L_1ae0
    add r0, r0, #0x10000
    str r0, [sp, #0x28]
    ldr r0, _LIT5
    sub r0, r0, #0x228
    str r0, [sp, #0x9c]
    ldr r0, _LIT6
    sub r0, r0, #0x8d
    str r0, [sp, #0x15c]
    ldr r0, _LIT6
    sub r0, r0, #0xf6
    str r0, [sp, #0x14c]
    ldr r0, _LIT5
    sub r0, r0, #0x290
    str r0, [sp, #0x88]
    ldr r0, _LIT7
    sub r0, r0, #0x81
    str r0, [sp, #0x98]
    ldr r0, _LIT7
    add r0, r0, #0x3f
    str r0, [sp, #0xa8]
    ldr r0, _LIT7
    add r0, r0, #0x65
    str r0, [sp, #0x94]
    ldr r0, _LIT7
    add r0, r0, #0x3f
    str r0, [sp, #0xa4]
    ldr r0, _LIT7
    add r0, r0, #0x85
    str r0, [sp, #0xc0]
    ldr r0, _LIT7
    add r0, r0, #0x85
    str r0, [sp, #0xbc]
    ldr r0, _LIT7
    add r0, r0, #0xcd
    str r0, [sp, #0xd0]
    ldr r0, _LIT7
    add r0, r0, #0xcd
    str r0, [sp, #0xcc]
    ldr r0, _LIT5
    sub r0, r0, #0x89
    str r0, [sp, #0xf0]
    ldr r0, _LIT5
    sub r0, r0, #0x9a
    str r0, [sp, #0xf4]
    ldr r0, _LIT5
    add r0, r0, #0x138
    str r0, [sp, #0x150]
    ldr r0, _LIT5
    add r0, r0, #0x138
    str r0, [sp, #0x154]
    ldr r0, _LIT5
    add r0, r0, #0x168
    str r0, [sp, #0x16c]
    ldr r0, _LIT6
    sub r0, r0, #0x2b
    str r0, [sp, #0x164]
    ldr r0, _LIT5
    add r0, r0, #0x168
    str r0, [sp, #0x168]
    ldr r0, _LIT6
    add r0, r0, #0x45
    str r0, [sp, #0x17c]
    ldr r0, _LIT6
    sub r0, r0, #0x2b
    str r0, [sp, #0x160]
    ldr r0, _LIT6
    add r0, r0, #0x45
    str r0, [sp, #0x178]
    ldr r0, _LIT7
    add r0, r0, #0x3d0
    str r0, [sp, #0x180]
    ldr r0, _LIT5
    add r0, r0, #0x18c
    str r0, [sp, #0x174]
    ldr r0, _LIT6
    sub r0, r0, #0x7b
    str r0, [sp, #0x170]
    ldr r0, _LIT6
    sub r0, r0, #0xc7
    str r0, [sp, #0x158]
    ldr r0, _LIT5
    add r0, r0, #0xd7
    str r0, [sp, #0x130]
    ldr r0, _LIT5
    add r0, r0, #0x42
    str r0, [sp, #0x120]
    ldr r0, _LIT5
    sub r0, r0, #0x9a
    str r0, [sp, #0xf8]
    ldr r0, _LIT5
    sub r0, r0, #0xa5
    str r0, [sp, #0xd8]
    ldr r0, _LIT7
    add r0, r0, #0xcc
    str r0, [sp, #0xd4]
    ldr r0, _LIT7
    add r0, r0, #0x86
    str r0, [sp, #0xc8]
    ldr r0, _LIT7
    add r0, r0, #0x66
    str r0, [sp, #0xc4]
    ldr r0, _LIT7
    add r0, r0, #0x46
    str r0, [sp, #0xb0]
    ldr r0, _LIT7
    add r0, r0, #0x6
    str r0, [sp, #0xac]
    ldr r0, _LIT7
    sub r0, r0, #0x78
    str r0, [sp, #0xa0]
    ldr r0, _LIT7
    sub r0, r0, #0x314
    str r0, [sp, #0x64]
    ldr r0, _LIT8
    sub r0, r0, #0x69
    str r0, [sp, #0x80]
    ldr r0, _LIT8
    sub r0, r0, #0x72
    str r0, [sp, #0x7c]
    ldr r0, _LIT8
    sub r0, r0, #0xbd
    str r0, [sp, #0x68]
    ldr r0, _LIT8
    sub r0, r0, #0x3
    str r0, [sp, #0x70]
    ldr r0, _LIT8
    sub r0, r0, #0x6e
    str r0, [sp, #0x74]
    ldr r0, _LIT8
    sub r0, r0, #0x6e
    str r0, [sp, #0x78]
    ldr r0, _LIT8
    sub r0, r0, #0x3
    str r0, [sp, #0x6c]
    ldr r0, _LIT8
    add r0, r0, #0x4a
    str r0, [sp, #0x84]
    ldr r0, _LIT8
    add r0, r0, #0x198
    str r0, [sp, #0x90]
    ldr r0, _LIT8
    add r0, r0, #0x1c0
    str r0, [sp, #0xb4]
    ldr r0, _LIT8
    add r0, r0, #0x1c0
    str r0, [sp, #0xb8]
    ldr r0, _LIT8
    add r0, r0, #0x294
    str r0, [sp, #0x104]
    ldr r0, _LIT7
    add r0, r0, #0x19c
    str r0, [sp, #0xe8]
    ldr r0, _LIT5
    sub r0, r0, #0x89
    str r0, [sp, #0xec]
    ldr r0, _LIT8
    add r0, r0, #0x294
    str r0, [sp, #0x100]
    ldr r0, _LIT7
    rsb r0, r0, #0x3000
    str r0, [sp, #0x124]
    ldr r0, _LIT7
    rsb r0, r0, #0x3000
    str r0, [sp, #0x128]
    ldr r0, _LIT5
    add r0, r0, #0x87
    str r0, [sp, #0x12c]
    ldr r0, _LIT7
    add r0, r0, #0x164
    str r0, [sp, #0x10c]
    ldr r0, _LIT5
    sub r0, r0, #0x49
    str r0, [sp, #0x108]
    ldr r0, _LIT8
    add r0, r0, #0x4e
    str r0, [sp, #0x8c]
    ldr r0, _LIT8
    add r0, r0, #0x430
    str r0, [sp, #0x134]
    ldr r0, _LIT8
    add r0, r0, #0x430
    str r0, [sp, #0x138]
    ldr r0, _LIT5
    add r0, r0, #0xf7
    str r0, [sp, #0x13c]
    ldr r0, _LIT5
    add r0, r0, #0xf7
    str r0, [sp, #0x140]
    ldr r0, _LIT7
    add r0, r0, #0x290
    str r0, [sp, #0x144]
    ldr r0, _LIT7
    add r0, r0, #0x290
    str r0, [sp, #0x148]
    ldr r0, _LIT7
    sub r0, r0, #0x248
    str r0, [sp, #0x54]
    ldr r0, _LIT8
    sub r0, r0, #0x118
    str r0, [sp, #0x58]
    ldr r0, _LIT8
    sub r0, r0, #0x118
    str r0, [sp, #0x5c]
    ldr r0, _LIT7
    sub r0, r0, #0x248
    str r0, [sp, #0x60]
    ldr r0, _LIT5
    sub r0, r0, #0xa4
    str r0, [sp, #0x34]
    ldr r0, _LIT8
    add r0, r0, #0xaf
    str r0, [sp, #0x38]
    ldr r0, _LIT8
    add r0, r0, #0xaf
    str r0, [sp, #0x3c]
    ldr r0, _LIT8
    sub r0, r0, #0x8d
    str r0, [sp, #0x40]
    ldr r0, _LIT8
    sub r0, r0, #0x8d
    str r0, [sp, #0x44]
    ldr r0, _LIT5
    sub r0, r0, #0xa4
    str r0, [sp, #0x30]
    ldr r0, _LIT9
    sub r0, r0, #0xd3
    str r0, [sp, #0x48]
    ldr r0, _LIT5
    add r0, r0, #0xe3
    str r0, [sp, #0xdc]
    ldr r0, _LIT5
    add r0, r0, #0xe3
    str r0, [sp, #0xe0]
    ldr r0, _LIT7
    add r0, r0, #0x19c
    str r0, [sp, #0xe4]
    ldr r0, _LIT5
    add r0, r0, #0x5c
    str r0, [sp, #0x110]
    ldr r0, _LIT5
    add r0, r0, #0x5c
    str r0, [sp, #0x114]
    ldr r0, _LIT5
    add r0, r0, #0x38
    str r0, [sp, #0x118]
    ldr r0, _LIT5
    add r0, r0, #0x38
    str r0, [sp, #0x11c]
    ldr r0, _LIT9
    sub r0, r0, #0x11
    str r0, [sp, #0x50]
    ldr r0, _LIT9
    sub r0, r0, #0xd3
    str r0, [sp, #0x4c]
    ldr r0, _LIT5
    sub r0, r0, #0x99
    str r0, [sp, #0xfc]
    ldr r0, [sp, #0x1c]
    add r0, r0, #0x10000
    str r0, [sp, #0x184]
    ldr r0, [sp, #0x1c]
    add r0, r0, #0x10000
    str r0, [sp, #0x2c]
.L_14b0:
    add r0, sp, #0x1c8
    ldr r8, [r0, r4, lsl #0x2]
    ldr r0, [sp, #0x14]
    mov r1, #0x2c
    mla r0, r8, r1, r0
    ldr sl, [r0, #0x28]
    ldr r0, [sp, #0x2c]
    mov r1, #0x14
    cmp sl, r0
    ldr r0, [sp, #0xc]
    mov r6, #0xa
    mla r0, r8, r1, r0
    ldr r0, [r0, #0x40]
    ldrge sl, [sp, #0x28]
    mov r0, r0, lsr #0x6
    tst r0, #0x1
    bne .L_1a90
    mov r0, r9
    mov r1, r8
    bl func_ov002_021b9dec
    ldr r1, [sp, #0x30]
    cmp r0, r1
    bgt .L_1774
    ldr r1, [sp, #0x34]
    cmp r0, r1
    bge .L_1a04
    ldr r1, [sp, #0x38]
    cmp r0, r1
    bgt .L_1660
    ldr r1, [sp, #0x3c]
    cmp r0, r1
    bge .L_1a04
    ldr r1, [sp, #0x40]
    cmp r0, r1
    bgt .L_15d8
    ldr r1, [sp, #0x44]
    cmp r0, r1
    bge .L_19fc
    ldr r1, _LIT9
    cmp r0, r1
    bgt .L_1584
    bge .L_1a8c
    ldr r1, [sp, #0x48]
    cmp r0, r1
    bgt .L_1574
    ldr r1, [sp, #0x4c]
    cmp r0, r1
    beq .L_1a8c
    b .L_1a90
.L_1574:
    ldr r1, [sp, #0x50]
    cmp r0, r1
    beq .L_1a8c
    b .L_1a90
.L_1584:
    ldr r1, [sp, #0x54]
    cmp r0, r1
    bgt .L_15c8
    ldr r1, [sp, #0x58]
    cmp r0, r1
    blt .L_15b8
    ldr r1, [sp, #0x5c]
    cmp r0, r1
    beq .L_1a04
    ldr r1, [sp, #0x60]
    cmp r0, r1
    subeq r6, r6, #0x1
    b .L_1a90
.L_15b8:
    ldr r1, [sp, #0x64]
    cmp r0, r1
    beq .L_1a04
    b .L_1a90
.L_15c8:
    ldr r1, [sp, #0x68]
    cmp r0, r1
    beq .L_1a04
    b .L_1a90
.L_15d8:
    ldr r1, [sp, #0x6c]
    cmp r0, r1
    bgt .L_1628
    ldr r1, [sp, #0x70]
    cmp r0, r1
    bge .L_1a04
    ldr r1, [sp, #0x74]
    cmp r0, r1
    bgt .L_1618
    ldr r1, [sp, #0x78]
    cmp r0, r1
    bge .L_1a18
    ldr r1, [sp, #0x7c]
    cmp r0, r1
    beq .L_1a04
    b .L_1a90
.L_1618:
    ldr r1, [sp, #0x80]
    cmp r0, r1
    beq .L_1a04
    b .L_1a90
.L_1628:
    ldr r1, [sp, #0x84]
    cmp r0, r1
    bgt .L_1650
    ldr r1, [sp, #0x88]
    cmp r0, r1
    bge .L_1a04
    ldr r1, _LIT8
    cmp r0, r1
    beq .L_1a04
    b .L_1a90
.L_1650:
    ldr r1, [sp, #0x8c]
    cmp r0, r1
    beq .L_1a18
    b .L_1a90
.L_1660:
    ldr r1, [sp, #0x90]
    cmp r0, r1
    bgt .L_16ec
    ldr r1, [sp, #0x94]
    cmp r0, r1
    bge .L_1a04
    ldr r1, _LIT7
    cmp r0, r1
    bgt .L_16b4
    bge .L_1a04
    ldr r1, [sp, #0x98]
    cmp r0, r1
    bgt .L_16a4
    ldr r1, [sp, #0x9c]
    cmp r0, r1
    beq .L_19fc
    b .L_1a90
.L_16a4:
    ldr r1, [sp, #0xa0]
    cmp r0, r1
    beq .L_1a04
    b .L_1a90
.L_16b4:
    ldr r1, [sp, #0xa4]
    cmp r0, r1
    bgt .L_16dc
    ldr r1, [sp, #0xa8]
    cmp r0, r1
    bge .L_1a04
    ldr r1, [sp, #0xac]
    cmp r0, r1
    beq .L_1a04
    b .L_1a90
.L_16dc:
    ldr r1, [sp, #0xb0]
    cmp r0, r1
    beq .L_1a04
    b .L_1a90
.L_16ec:
    ldr r1, [sp, #0xb4]
    cmp r0, r1
    bgt .L_173c
    ldr r1, [sp, #0xb8]
    cmp r0, r1
    bge .L_1a18
    ldr r1, [sp, #0xbc]
    cmp r0, r1
    bgt .L_172c
    ldr r1, [sp, #0xc0]
    cmp r0, r1
    bge .L_1a04
    ldr r1, [sp, #0xc4]
    cmp r0, r1
    beq .L_1a04
    b .L_1a90
.L_172c:
    ldr r1, [sp, #0xc8]
    cmp r0, r1
    beq .L_1a04
    b .L_1a90
.L_173c:
    ldr r1, [sp, #0xcc]
    cmp r0, r1
    bgt .L_1764
    ldr r1, [sp, #0xd0]
    cmp r0, r1
    bge .L_1a04
    ldr r1, [sp, #0xd4]
    cmp r0, r1
    beq .L_1a04
    b .L_1a90
.L_1764:
    ldr r1, [sp, #0xd8]
    cmp r0, r1
    beq .L_1a04
    b .L_1a90
.L_1774:
    ldr r1, [sp, #0xdc]
    cmp r0, r1
    bgt .L_18e0
    ldr r1, [sp, #0xe0]
    cmp r0, r1
    bge .L_1a04
    ldr r1, [sp, #0xe4]
    cmp r0, r1
    bgt .L_1858
    ldr r1, [sp, #0xe8]
    cmp r0, r1
    bge .L_1a04
    ldr r1, [sp, #0xec]
    cmp r0, r1
    bgt .L_1820
    ldr r1, [sp, #0xf0]
    cmp r0, r1
    bge .L_1a04
    ldr r1, [sp, #0xf4]
    cmp r0, r1
    bgt .L_17d8
    ldr r1, [sp, #0xf8]
    cmp r0, r1
    beq .L_1a04
    b .L_1a90
.L_17d8:
    ldr r1, [sp, #0xfc]
    sub r1, r0, r1
    cmp r1, #0xc
    addls pc, pc, r1, lsl #0x2
    b .L_1a90
    b .L_1a04
    b .L_1a90
    b .L_1a90
    b .L_1a90
    b .L_1a04
    b .L_1a04
    b .L_1a90
    b .L_1a04
    b .L_1a90
    b .L_1a90
    b .L_1a90
    b .L_1a90
    b .L_1a18
.L_1820:
    ldr r1, [sp, #0x100]
    cmp r0, r1
    bgt .L_1848
    ldr r1, [sp, #0x104]
    cmp r0, r1
    bge .L_1a04
    ldr r1, [sp, #0x108]
    cmp r0, r1
    beq .L_1a18
    b .L_1a90
.L_1848:
    ldr r1, [sp, #0x10c]
    cmp r0, r1
    beq .L_1a18
    b .L_1a90
.L_1858:
    ldr r1, [sp, #0x110]
    cmp r0, r1
    bgt .L_18a8
    ldr r1, [sp, #0x114]
    cmp r0, r1
    bge .L_1a04
    ldr r1, [sp, #0x118]
    cmp r0, r1
    bgt .L_1898
    ldr r1, [sp, #0x11c]
    cmp r0, r1
    bge .L_1a8c
    ldr r1, _LIT5
    cmp r0, r1
    beq .L_19fc
    b .L_1a90
.L_1898:
    ldr r1, [sp, #0x120]
    cmp r0, r1
    beq .L_1a04
    b .L_1a90
.L_18a8:
    ldr r1, [sp, #0x124]
    cmp r0, r1
    bgt .L_18d0
    ldr r1, [sp, #0x128]
    cmp r0, r1
    bge .L_1a04
    ldr r1, [sp, #0x12c]
    cmp r0, r1
    beq .L_1a18
    b .L_1a90
.L_18d0:
    ldr r1, [sp, #0x130]
    cmp r0, r1
    beq .L_1a04
    b .L_1a90
.L_18e0:
    ldr r1, [sp, #0x134]
    cmp r0, r1
    bgt .L_1974
    ldr r1, [sp, #0x138]
    cmp r0, r1
    bge .L_1a18
    ldr r1, [sp, #0x13c]
    cmp r0, r1
    bgt .L_193c
    ldr r1, [sp, #0x140]
    cmp r0, r1
    bge .L_1a18
    ldr r1, [sp, #0x144]
    cmp r0, r1
    bgt .L_192c
    ldr r1, [sp, #0x148]
    cmp r0, r1
    beq .L_1a64
    b .L_1a90
.L_192c:
    ldr r1, [sp, #0x14c]
    cmp r0, r1
    beq .L_19fc
    b .L_1a90
.L_193c:
    ldr r1, [sp, #0x150]
    cmp r0, r1
    bgt .L_1964
    ldr r1, [sp, #0x154]
    cmp r0, r1
    bge .L_1a04
    ldr r1, [sp, #0x158]
    cmp r0, r1
    beq .L_1a04
    b .L_1a90
.L_1964:
    ldr r1, [sp, #0x15c]
    cmp r0, r1
    beq .L_19fc
    b .L_1a90
.L_1974:
    ldr r1, [sp, #0x160]
    cmp r0, r1
    bgt .L_19c4
    ldr r1, [sp, #0x164]
    cmp r0, r1
    bge .L_1a04
    ldr r1, [sp, #0x168]
    cmp r0, r1
    bgt .L_19b4
    ldr r1, [sp, #0x16c]
    cmp r0, r1
    bge .L_1a04
    ldr r1, [sp, #0x170]
    cmp r0, r1
    beq .L_1a04
    b .L_1a90
.L_19b4:
    ldr r1, [sp, #0x174]
    cmp r0, r1
    beq .L_1a04
    b .L_1a90
.L_19c4:
    ldr r1, [sp, #0x178]
    cmp r0, r1
    bgt .L_19ec
    ldr r1, [sp, #0x17c]
    cmp r0, r1
    bge .L_1a04
    ldr r1, _LIT6
    cmp r0, r1
    beq .L_19fc
    b .L_1a90
.L_19ec:
    ldr r1, [sp, #0x180]
    cmp r0, r1
    beq .L_1a04
    b .L_1a90
.L_19fc:
    sub r6, r6, #0x5
    b .L_1a90
.L_1a04:
    mov r0, fp
    bl func_ov002_021bbe70
    cmp r0, #0x0
    subne r6, r6, #0x2
    b .L_1a90
.L_1a18:
    ldr r0, [sp, #0x10]
    mov r5, #0x0
    add r7, r0, #0x30
.L_1a24:
    ldr r0, [r7]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_1a50
    mov r0, r9
    mov r1, r8
    mov r2, r5
    bl func_ov002_022837f8
    cmp r0, #0x0
    subne r6, r6, #0x1
    bne .L_1a90
.L_1a50:
    add r7, r7, #0x14
    add r5, r5, #0x1
    cmp r5, #0x5
    blt .L_1a24
    b .L_1a90
.L_1a64:
    mov r0, fp
    bl func_ov002_021bbe70
    cmp r0, #0x2
    bne .L_1a90
    mov r0, fp
    mov r1, #0x0
    bl func_ov002_021bc14c
    cmp r0, #0x0
    subne r6, r6, #0x2
    b .L_1a90
.L_1a8c:
    add r6, r6, #0x1
.L_1a90:
    mov r1, r8
    mov r0, r9
    bl func_ov002_021c0b04
    cmp r0, #0x0
    subne r6, r6, #0x3
    ldrne r0, [sp, #0x184]
    mov r1, r6, lsl #0x10
    subne sl, r0, sl
    mov r1, r1, lsr #0x10
    mov r0, sl, lsl #0x10
    mov r1, r1, lsl #0x10
    orr r1, r1, r0, lsr #0x10
    ldr r0, [sp, #0x1c]
    cmp r1, r0
    strcc r4, [sp, #0x18]
    ldr r0, [sp, #0x24]
    add r4, r4, #0x1
    strcc r1, [sp, #0x1c]
    cmp r4, r0
    blt .L_14b0
.L_1ae0:
    ldr r1, [sp, #0x24]
    add r0, sp, #0x1c8
    sub r2, r1, #0x1
    ldr r1, [sp, #0x8]
    ldr r4, [r0, r1, lsl #0x2]
    ldr r1, [sp, #0x18]
    ldr r3, [r0, r1, lsl #0x2]
    ldr r1, [sp, #0x8]
    str r3, [r0, r1, lsl #0x2]
    add r1, r1, #0x1
    str r1, [sp, #0x8]
    ldr r1, [sp, #0x18]
    str r4, [r0, r1, lsl #0x2]
    ldr r0, [sp, #0x8]
    cmp r0, r2
    blt .L_1070
.L_1b20:
    ldr r0, _LIT10
    bl func_ov002_021baf88
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [sp, #0x20]
    rsb r1, r9, #0x1
    ldr r2, _LIT1
    mov r4, #0x0
    ldr r0, _LIT0
    and r1, r1, #0x1
    mla r8, r1, r0, r2
    mov r5, r4
    mov r6, r4
    mov sl, r4
    add r7, r8, #0x30
.L_1b5c:
    ldr r0, [r7]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_1b8c
    ldrh r1, [r8, #0x36]
    cmp r1, #0x0
    addne r4, r4, #0x1
    bne .L_1b8c
    bl func_ov002_022813e0
    cmp r0, #0x0
    addeq r5, r5, #0x1
    addne r6, r6, #0x1
.L_1b8c:
    add sl, sl, #0x1
    cmp sl, #0x5
    add r7, r7, #0x14
    add r8, r8, #0x14
    blt .L_1b5c
    cmp r4, #0x0
    beq .L_1bb8
    cmp r5, #0x1
    cmpeq r6, #0x0
    moveq r0, #0x1
    streq r0, [sp, #0x20]
.L_1bb8:
    ldr r0, [sp, #0x24]
    mov sl, #0x0
    cmp r0, #0x0
    ble .L_1c50
    ldr fp, _LIT11
    ldr r4, _LIT2
    add r5, sp, #0x1a8
    mov r8, sl
    add r7, sp, #0x1c8
    mov r6, #0x1
.L_1be0:
    ldr r1, [r7, sl, lsl #0x2]
    mov r0, r9
    str r8, [sp]
    mov r2, r6
    mov r3, r5
    bl func_ov002_022847d0
    cmp r0, #0x0
    beq .L_1c40
    ldr r0, [r4, #0x1fc]
    cmp r0, #0x0
    beq .L_1c1c
    ldr r1, [sp, #0x1c4]
    ldr r0, [r4, #0x214]
    cmp r1, r0
    ble .L_1c40
.L_1c1c:
    mov r0, fp
    mov r1, r5
    mov r2, #0x20
    bl func_ov002_0229cc60
    ldr r0, [sp, #0x20]
    cmp r0, #0x0
    addeq sp, sp, #0x1dc
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1c40:
    ldr r0, [sp, #0x24]
    add sl, sl, #0x1
    cmp sl, r0
    blt .L_1be0
.L_1c50:
    ldr r0, [sp, #0x20]
    cmp r0, #0x0
    ldrne r0, _LIT2
    ldrne r0, [r0, #0x1fc]
    cmpne r0, #0x0
    addne sp, sp, #0x1dc
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    ble .L_1cd8
    ldr r0, [sp, #0x24]
    subs r7, r0, #0x1
    bmi .L_1cd8
    mov r6, #0x1
    add r5, sp, #0x1c8
    add r4, sp, #0x188
.L_1c94:
    ldr r1, [r5, r7, lsl #0x2]
    mov r0, r9
    mov r2, r6
    mov r3, r4
    str r6, [sp]
    bl func_ov002_022847d0
    cmp r0, #0x0
    beq .L_1cd0
    ldr r0, _LIT11
    add r1, sp, #0x188
    mov r2, #0x20
    bl func_ov002_0229cc60
    add sp, sp, #0x1dc
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1cd0:
    subs r7, r7, #0x1
    bpl .L_1c94
.L_1cd8:
    mov r0, #0x0
    add sp, sp, #0x1dc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022cd444
_LIT3: .word 0x0000195b
_LIT4: .word 0x00001a79
_LIT5: .word 0x0000186c
_LIT6: .word 0x00001a4e
_LIT7: .word 0x000016c5
_LIT8: .word 0x00001592
_LIT9: .word 0x000012a0
_LIT10: .word 0x00001469
_LIT11: .word data_ov002_022cd63c
