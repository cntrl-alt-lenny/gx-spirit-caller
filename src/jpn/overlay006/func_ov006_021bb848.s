; func_ov006_021bb848 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103fcc
        .extern data_ov006_0224f328
        .extern data_ov006_0225ca3c
        .extern data_ov006_0225dd50
        .extern func_020371b8
        .extern func_ov006_021b6c1c
        .extern func_ov006_021bbcb4
        .extern func_ov006_021bbfc0
        .extern func_ov006_021bc350
        .extern func_ov006_021bd7a0
        .extern func_ov006_021bdbd0
        .extern func_ov006_021be3c4
        .extern func_ov006_021be44c
        .extern func_ov006_021be48c
        .extern func_ov006_021be4ac
        .extern func_ov006_021be5e8
        .extern func_ov006_021bf348
        .extern func_ov006_021bf738
        .extern func_ov006_021c0b08
        .extern func_ov006_021c1558
        .extern func_ov006_021c156c
        .extern func_ov006_021c6ab4
        .extern func_ov006_021c6ac8
        .extern func_ov006_021c6adc
        .global func_ov006_021bb848
        .arm
func_ov006_021bb848:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x4
    mov r8, r0
    ldr r3, [r8, #0x50]
    add r2, r8, #0xa0
    mov r1, #0x24
    ldr ip, [r8, #0x54]
    mov r6, #0x0
    mla r5, r3, r1, r2
    mov r7, r6
    cmp ip, #0x1e
    ldr r4, _LIT0
    bgt .L_1644
    cmp ip, #0x1e
    bge .L_17d8
    cmp ip, #0x5
    addls pc, pc, ip, lsl #0x2
    b .L_1840
    b .L_1650
    b .L_1774
    b .L_1794
    b .L_1840
    b .L_1840
    b .L_17b8
.L_1644:
    cmp ip, #0x1f
    beq .L_180c
    b .L_1840
.L_1650:
    ldr r1, [r8, #0x40]
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b .L_1750
    b .L_1670
    b .L_16fc
    b .L_1734
    b .L_1670
.L_1670:
    cmp r3, #0x4
    bne .L_16c4
    mov r0, #0x91
    mov r2, r6
    sub r1, r0, #0x92
    mov r3, #0x1
    bl func_020371b8
    ldr r1, [r8, #0x5c]
    mov r0, r8
    str r1, [r8, #0x50]
    mov r6, #0x1
    bl func_ov006_021bbcb4
    mov r0, r8
    bl func_ov006_021c0b08
    mov r1, r7
    mov r0, r8
    mov r2, r6
    mov r3, r1
    str r1, [sp]
    bl func_ov006_021bc350
    b .L_1a00
.L_16c4:
    bl func_ov006_021be3c4
    cmp r0, #0x0
    mov r3, #0x1
    beq .L_16e8
    mov r0, #0x46
    sub r1, r0, #0x47
    mov r2, r6
    bl func_020371b8
    b .L_1a00
.L_16e8:
    mov r0, #0x43
    sub r1, r0, #0x44
    mov r2, r6
    bl func_020371b8
    b .L_1a00
.L_16fc:
    bl func_ov006_021be44c
    cmp r0, #0x0
    mov r3, #0x1
    beq .L_1720
    mov r0, #0x46
    sub r1, r0, #0x47
    mov r2, r6
    bl func_020371b8
    b .L_1a00
.L_1720:
    mov r0, #0x43
    sub r1, r0, #0x44
    mov r2, r6
    bl func_020371b8
    b .L_1a00
.L_1734:
    bl func_ov006_021be48c
    mov r0, #0x46
    sub r1, r0, #0x47
    mov r2, r6
    mov r3, #0x1
    bl func_020371b8
    b .L_1a00
.L_1750:
    mov r0, #0x42
    sub r1, r0, #0x43
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    mov r0, #0x0
    str r0, [r8, #0x44]
    mov r7, #0x1
    b .L_1a00
.L_1774:
    mov r0, #0x3a
    mov r2, r6
    sub r1, r0, #0x3b
    mov r3, #0x1
    bl func_020371b8
    mov r7, #0x1
    str r7, [r8, #0x44]
    b .L_1a00
.L_1794:
    mov r0, #0x46
    mov r2, r6
    sub r1, r0, #0x47
    mov r3, #0x1
    bl func_020371b8
    mov r0, r8
    bl func_ov006_021bdbd0
    mov r6, #0x1
    b .L_1a00
.L_17b8:
    mov r0, #0x35
    mov r2, r6
    sub r1, r0, #0x36
    mov r3, #0x1
    bl func_020371b8
    ldr r0, _LIT1
    bl func_ov006_021c6adc
    b .L_1a00
.L_17d8:
    mov r0, #0x46
    mov r2, r6
    sub r1, r0, #0x47
    mov r3, #0x1
    bl func_020371b8
    ldr r0, _LIT1
    bl func_ov006_021c6ac8
    cmp r0, #0x0
    moveq r1, #0x1
    ldr r0, _LIT1
    movne r1, r6
    bl func_ov006_021c6ab4
    b .L_1a00
.L_180c:
    mov r0, #0x46
    sub r1, r0, #0x47
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    ldr r0, _LIT2
    bl func_ov006_021c156c
    cmp r0, #0x0
    moveq r1, #0x1
    ldr r0, _LIT2
    movne r1, #0x0
    bl func_ov006_021c1558
    b .L_1a00
.L_1840:
    cmp ip, #0x3
    cmpne ip, #0x4
    beq .L_185c
    cmp ip, #0x7
    blt .L_1884
    cmp ip, #0xd
    bgt .L_1884
.L_185c:
    mov r0, r8
    bl func_ov006_021bd7a0
    cmp r0, #0x0
    beq .L_1a00
    mov r0, #0x46
    sub r1, r0, #0x47
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    b .L_1a00
.L_1884:
    cmp ip, #0x6
    bne .L_18d4
    ldr r0, [r8, #0x78]
    mov r2, #0x0
    cmp r0, #0x0
    mov r3, #0x1
    beq .L_18c4
    mov r0, #0x3a
    sub r1, r0, #0x3b
    bl func_020371b8
    mov r0, #0x5
    str r0, [r8, #0x88]
    sub r0, r0, #0x6
    str r0, [r8, #0x8c]
    str r0, [r8, #0x90]
    b .L_1a00
.L_18c4:
    mov r0, #0x43
    sub r1, r0, #0x44
    bl func_020371b8
    b .L_1a00
.L_18d4:
    cmp ip, #0x16
    blt .L_1930
    cmp ip, #0x19
    bgt .L_1930
    mov r0, #0x46
    sub r1, r0, #0x47
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    ldr r1, [r8, #0x54]
    ldr r0, [r5, #0x20]
    ldr r5, [r5, #0x8]
    sub r2, r1, #0x16
    mov r3, r0, lsl #0x1f
    ldr r1, [r8, #0x50]
    mov r0, r4
    add r2, r5, r2
    mov r3, r3, lsr #0x1f
    bl func_ov006_021b6c1c
    mov r1, #0x2
    str r1, [r8, #0x88]
    str r0, [r8, #0x8c]
    b .L_1a00
.L_1930:
    cmp ip, #0x1a
    blt .L_198c
    cmp ip, #0x1d
    bgt .L_198c
    mov r0, #0x46
    sub r1, r0, #0x47
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    ldr r1, [r8, #0x54]
    ldr r0, [r5, #0x20]
    ldr r5, [r5, #0x8]
    sub r2, r1, #0x1a
    mov r3, r0, lsl #0x1f
    ldr r1, [r8, #0x50]
    mov r0, r4
    add r2, r5, r2
    mov r3, r3, lsr #0x1f
    bl func_ov006_021b6c1c
    mov r1, #0x3
    str r1, [r8, #0x88]
    str r0, [r8, #0x8c]
    b .L_1a00
.L_198c:
    cmp ip, #0xe
    blt .L_1a00
    cmp ip, #0x11
    bgt .L_1a00
    sub r0, ip, #0xe
    str r0, [r8, #0x50]
    cmp r0, r3
    beq .L_1a00
    mov r0, #0x56
    sub r1, r0, #0x57
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    mov r0, r8
    mov r6, #0x1
    bl func_ov006_021bbcb4
    mov r0, r8
    bl func_ov006_021c0b08
    ldr r0, [r8, #0x40]
    cmp r0, #0x5
    bne .L_19e8
    mov r0, r8
    bl func_ov006_021bf348
.L_19e8:
    mov r1, #0x0
    mov r0, r8
    mov r3, r1
    mov r2, #0x1
    str r1, [sp]
    bl func_ov006_021bc350
.L_1a00:
    cmp r6, #0x0
    beq .L_1a34
    mov r0, r8
    bl func_ov006_021be4ac
    mov r0, r8
    bl func_ov006_021be5e8
    mov r0, r8
    bl func_ov006_021bbfc0
    mov r0, r8
    bl func_ov006_021bf738
    ldr r0, _LIT3
    mov r1, #0x1
    str r1, [r0, #0x1c]
.L_1a34:
    mov r0, r7
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov006_0224f328
_LIT1: .word data_ov006_0225dd50
_LIT2: .word data_ov006_0225ca3c
_LIT3: .word data_02103fcc
