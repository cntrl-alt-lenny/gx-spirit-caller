; func_ov006_021bb954 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern data_ov006_0224f448
        .extern data_ov006_0225cb5c
        .extern data_ov006_0225de70
        .extern func_02037208
        .extern func_ov006_021b6d1c
        .extern func_ov006_021bbdc0
        .extern func_ov006_021bc0cc
        .extern func_ov006_021bc45c
        .extern func_ov006_021bd8ac
        .extern func_ov006_021bdcdc
        .extern func_ov006_021be4d0
        .extern func_ov006_021be558
        .extern func_ov006_021be598
        .extern func_ov006_021be5b8
        .extern func_ov006_021be6f4
        .extern func_ov006_021bf454
        .extern func_ov006_021bf844
        .extern func_ov006_021c0c14
        .extern func_ov006_021c1664
        .extern func_ov006_021c1678
        .extern func_ov006_021c6bc0
        .extern func_ov006_021c6bd4
        .extern func_ov006_021c6be8
        .global func_ov006_021bb954
        .arm
func_ov006_021bb954:
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
    bgt .L_17bc
    cmp ip, #0x1e
    bge .L_1950
    cmp ip, #0x5
    addls pc, pc, ip, lsl #0x2
    b .L_19b8
    b .L_17c8
    b .L_18ec
    b .L_190c
    b .L_19b8
    b .L_19b8
    b .L_1930
.L_17bc:
    cmp ip, #0x1f
    beq .L_1984
    b .L_19b8
.L_17c8:
    ldr r1, [r8, #0x40]
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b .L_18c8
    b .L_17e8
    b .L_1874
    b .L_18ac
    b .L_17e8
.L_17e8:
    cmp r3, #0x4
    bne .L_183c
    mov r0, #0x91
    mov r2, r6
    sub r1, r0, #0x92
    mov r3, #0x1
    bl func_02037208
    ldr r1, [r8, #0x5c]
    mov r0, r8
    str r1, [r8, #0x50]
    mov r6, #0x1
    bl func_ov006_021bbdc0
    mov r0, r8
    bl func_ov006_021c0c14
    mov r1, r7
    mov r0, r8
    mov r2, r6
    mov r3, r1
    str r1, [sp]
    bl func_ov006_021bc45c
    b .L_1b78
.L_183c:
    bl func_ov006_021be4d0
    cmp r0, #0x0
    mov r3, #0x1
    beq .L_1860
    mov r0, #0x46
    sub r1, r0, #0x47
    mov r2, r6
    bl func_02037208
    b .L_1b78
.L_1860:
    mov r0, #0x43
    sub r1, r0, #0x44
    mov r2, r6
    bl func_02037208
    b .L_1b78
.L_1874:
    bl func_ov006_021be558
    cmp r0, #0x0
    mov r3, #0x1
    beq .L_1898
    mov r0, #0x46
    sub r1, r0, #0x47
    mov r2, r6
    bl func_02037208
    b .L_1b78
.L_1898:
    mov r0, #0x43
    sub r1, r0, #0x44
    mov r2, r6
    bl func_02037208
    b .L_1b78
.L_18ac:
    bl func_ov006_021be598
    mov r0, #0x46
    sub r1, r0, #0x47
    mov r2, r6
    mov r3, #0x1
    bl func_02037208
    b .L_1b78
.L_18c8:
    mov r0, #0x42
    sub r1, r0, #0x43
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    mov r0, #0x0
    str r0, [r8, #0x44]
    mov r7, #0x1
    b .L_1b78
.L_18ec:
    mov r0, #0x3a
    mov r2, r6
    sub r1, r0, #0x3b
    mov r3, #0x1
    bl func_02037208
    mov r7, #0x1
    str r7, [r8, #0x44]
    b .L_1b78
.L_190c:
    mov r0, #0x46
    mov r2, r6
    sub r1, r0, #0x47
    mov r3, #0x1
    bl func_02037208
    mov r0, r8
    bl func_ov006_021bdcdc
    mov r6, #0x1
    b .L_1b78
.L_1930:
    mov r0, #0x35
    mov r2, r6
    sub r1, r0, #0x36
    mov r3, #0x1
    bl func_02037208
    ldr r0, _LIT1
    bl func_ov006_021c6be8
    b .L_1b78
.L_1950:
    mov r0, #0x46
    mov r2, r6
    sub r1, r0, #0x47
    mov r3, #0x1
    bl func_02037208
    ldr r0, _LIT1
    bl func_ov006_021c6bd4
    cmp r0, #0x0
    moveq r1, #0x1
    ldr r0, _LIT1
    movne r1, r6
    bl func_ov006_021c6bc0
    b .L_1b78
.L_1984:
    mov r0, #0x46
    sub r1, r0, #0x47
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    ldr r0, _LIT2
    bl func_ov006_021c1678
    cmp r0, #0x0
    moveq r1, #0x1
    ldr r0, _LIT2
    movne r1, #0x0
    bl func_ov006_021c1664
    b .L_1b78
.L_19b8:
    cmp ip, #0x3
    cmpne ip, #0x4
    beq .L_19d4
    cmp ip, #0x7
    blt .L_19fc
    cmp ip, #0xd
    bgt .L_19fc
.L_19d4:
    mov r0, r8
    bl func_ov006_021bd8ac
    cmp r0, #0x0
    beq .L_1b78
    mov r0, #0x46
    sub r1, r0, #0x47
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    b .L_1b78
.L_19fc:
    cmp ip, #0x6
    bne .L_1a4c
    ldr r0, [r8, #0x78]
    mov r2, #0x0
    cmp r0, #0x0
    mov r3, #0x1
    beq .L_1a3c
    mov r0, #0x3a
    sub r1, r0, #0x3b
    bl func_02037208
    mov r0, #0x5
    str r0, [r8, #0x88]
    sub r0, r0, #0x6
    str r0, [r8, #0x8c]
    str r0, [r8, #0x90]
    b .L_1b78
.L_1a3c:
    mov r0, #0x43
    sub r1, r0, #0x44
    bl func_02037208
    b .L_1b78
.L_1a4c:
    cmp ip, #0x16
    blt .L_1aa8
    cmp ip, #0x19
    bgt .L_1aa8
    mov r0, #0x46
    sub r1, r0, #0x47
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    ldr r1, [r8, #0x54]
    ldr r0, [r5, #0x20]
    ldr r5, [r5, #0x8]
    sub r2, r1, #0x16
    mov r3, r0, lsl #0x1f
    ldr r1, [r8, #0x50]
    mov r0, r4
    add r2, r5, r2
    mov r3, r3, lsr #0x1f
    bl func_ov006_021b6d1c
    mov r1, #0x2
    str r1, [r8, #0x88]
    str r0, [r8, #0x8c]
    b .L_1b78
.L_1aa8:
    cmp ip, #0x1a
    blt .L_1b04
    cmp ip, #0x1d
    bgt .L_1b04
    mov r0, #0x46
    sub r1, r0, #0x47
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    ldr r1, [r8, #0x54]
    ldr r0, [r5, #0x20]
    ldr r5, [r5, #0x8]
    sub r2, r1, #0x1a
    mov r3, r0, lsl #0x1f
    ldr r1, [r8, #0x50]
    mov r0, r4
    add r2, r5, r2
    mov r3, r3, lsr #0x1f
    bl func_ov006_021b6d1c
    mov r1, #0x3
    str r1, [r8, #0x88]
    str r0, [r8, #0x8c]
    b .L_1b78
.L_1b04:
    cmp ip, #0xe
    blt .L_1b78
    cmp ip, #0x11
    bgt .L_1b78
    sub r0, ip, #0xe
    str r0, [r8, #0x50]
    cmp r0, r3
    beq .L_1b78
    mov r0, #0x56
    sub r1, r0, #0x57
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    mov r0, r8
    mov r6, #0x1
    bl func_ov006_021bbdc0
    mov r0, r8
    bl func_ov006_021c0c14
    ldr r0, [r8, #0x40]
    cmp r0, #0x5
    bne .L_1b60
    mov r0, r8
    bl func_ov006_021bf454
.L_1b60:
    mov r1, #0x0
    mov r0, r8
    mov r3, r1
    mov r2, #0x1
    str r1, [sp]
    bl func_ov006_021bc45c
.L_1b78:
    cmp r6, #0x0
    beq .L_1bac
    mov r0, r8
    bl func_ov006_021be5b8
    mov r0, r8
    bl func_ov006_021be6f4
    mov r0, r8
    bl func_ov006_021bc0cc
    mov r0, r8
    bl func_ov006_021bf844
    ldr r0, _LIT3
    mov r1, #0x1
    str r1, [r0, #0x1c]
.L_1bac:
    mov r0, r7
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov006_0224f448
_LIT1: .word data_ov006_0225de70
_LIT2: .word data_ov006_0225cb5c
_LIT3: .word data_021040ac
