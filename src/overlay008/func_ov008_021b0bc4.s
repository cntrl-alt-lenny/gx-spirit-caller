; func_ov008_021b0bc4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104bac
        .extern data_ov008_021b2780
        .extern data_ov008_021b27bc
        .extern data_ov008_021b2de4
        .extern func_0200617c
        .extern func_02006194
        .extern func_02022234
        .extern func_0202224c
        .extern func_02037208
        .extern func_ov008_021aedfc
        .extern func_ov008_021aee54
        .extern func_ov008_021aeeac
        .extern func_ov008_021aef18
        .extern func_ov008_021af154
        .extern func_ov008_021afa34
        .extern func_ov008_021afbac
        .extern func_ov008_021b04c0
        .global func_ov008_021b0bc4
        .arm
func_ov008_021b0bc4:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r0, _LIT0
    ldrh r0, [r0, #0xaa]
    cmp r0, #0x0
    ldreq r0, _LIT1
    ldreqh r0, [r0, #0x4]
    cmpeq r0, #0x0
    bne .L_f38
    bl func_0200617c
    cmp r0, #0x0
    beq .L_8b8
    ldr r4, _LIT1
    ldr r0, [r4, #0x55c]
    cmp r0, #0x0
    beq .L_878
    ldr r0, _LIT0
    ldr r0, [r0, #0xac]
    cmp r0, #0x0
    bne .L_878
    mov r0, #0x42
    mov r2, #0x0
    sub r1, r0, #0x43
    mov r3, #0x1
    str r2, [r4, #0x55c]
    bl func_02037208
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_878:
    ldr r4, _LIT0
    ldr r0, [r4, #0xb8]
    cmp r0, #0x0
    beq .L_f38
    ldr r0, [r4, #0xb4]
    cmp r0, #0x0
    ldreq r0, [r4, #0xac]
    cmpeq r0, #0x0
    bne .L_f38
    mov r0, #0x3a
    mov r3, #0x1
    sub r1, r0, #0x3b
    mov r2, #0x0
    str r3, [r4, #0xac]
    bl func_02037208
    b .L_f38
.L_8b8:
    bl func_02006194
    cmp r0, #0x0
    beq .L_8cc
    bl func_ov008_021b04c0
    b .L_f38
.L_8cc:
    ldr r0, _LIT2
    ldrh r1, [r0, #0x56]
    tst r1, #0x80
    beq .L_9e0
    ldr r0, _LIT0
    ldr r4, _LIT0
    ldrh r0, [r0, #0xa8]
    ldrh r1, [r4, #0x2]
    cmp r0, #0x3
    movhi r2, #0x2
    subls r2, r0, #0x1
    cmp r1, r2
    bge .L_920
    mov r0, #0x38
    add r5, r1, #0x1
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    strh r5, [r4, #0x2]
    bl func_02037208
    b .L_958
.L_920:
    ldrh r1, [r4]
    sub r0, r0, #0x3
    cmp r1, r0
    bge .L_958
    mov r0, #0x1
    add r2, r1, #0x1
    mov r1, r0
    strh r2, [r4]
    bl func_ov008_021af154
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
.L_958:
    ldr r0, _LIT0
    ldrh r1, [r0]
    ldrh r0, [r0, #0x2]
    add r0, r1, r0
    bl func_ov008_021aee54
    ldr r1, _LIT0
    mov r5, r0
    ldrh r2, [r1]
    ldrh r0, [r1, #0x2]
    add r0, r2, r0
    bl func_ov008_021aedfc
    ldr r1, _LIT0
    mov r4, r0
    ldrh r2, [r1]
    ldrh r0, [r1, #0x2]
    add r0, r2, r0
    bl func_ov008_021aee54
    mov r1, r0, asr #0x4
    add r3, r0, r1, lsr #0x1b
    mov r1, r5, lsr #0x1f
    rsb r0, r1, r5, lsl #0x1b
    ldr r5, _LIT3
    mov r2, #0x34
    mla r2, r4, r2, r5
    mov r3, r3, asr #0x5
    ldr r2, [r2, r3, lsl #0x2]
    add r0, r1, r0, ror #0x1b
    mov r1, #0x1
    tst r2, r1, lsl r0
    bne .L_f38
    ldr r0, _LIT0
    mov r1, #0x0
    strh r1, [r0, #0x4]
    b .L_f38
.L_9e0:
    tst r1, #0x40
    beq .L_ad4
    ldr r4, _LIT0
    ldrh r1, [r4, #0x2]
    cmp r1, #0x0
    beq .L_a18
    mov r0, #0x38
    sub r5, r1, #0x1
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    strh r5, [r4, #0x2]
    bl func_02037208
    b .L_a4c
.L_a18:
    ldrh r0, [r4]
    cmp r0, #0x0
    beq .L_a4c
    sub r2, r0, #0x1
    mov r0, #0x1
    mov r1, #0x0
    strh r2, [r4]
    bl func_ov008_021af154
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
.L_a4c:
    ldr r0, _LIT0
    ldrh r1, [r0]
    ldrh r0, [r0, #0x2]
    add r0, r1, r0
    bl func_ov008_021aee54
    ldr r1, _LIT0
    mov r5, r0
    ldrh r2, [r1]
    ldrh r0, [r1, #0x2]
    add r0, r2, r0
    bl func_ov008_021aedfc
    ldr r1, _LIT0
    mov r4, r0
    ldrh r2, [r1]
    ldrh r0, [r1, #0x2]
    add r0, r2, r0
    bl func_ov008_021aee54
    mov r1, r0, asr #0x4
    add r3, r0, r1, lsr #0x1b
    mov r1, r5, lsr #0x1f
    rsb r0, r1, r5, lsl #0x1b
    ldr r5, _LIT3
    mov r2, #0x34
    mla r2, r4, r2, r5
    mov r3, r3, asr #0x5
    ldr r2, [r2, r3, lsl #0x2]
    add r0, r1, r0, ror #0x1b
    mov r1, #0x1
    tst r2, r1, lsl r0
    bne .L_f38
    ldr r0, _LIT0
    mov r1, #0x0
    strh r1, [r0, #0x4]
    b .L_f38
.L_ad4:
    tst r1, #0x10
    beq .L_b84
    ldr r0, _LIT0
    ldrh r1, [r0]
    ldrh r0, [r0, #0x2]
    add r0, r1, r0
    bl func_ov008_021aee54
    ldr r1, _LIT0
    mov r5, r0
    ldrh r2, [r1]
    ldrh r0, [r1, #0x2]
    add r0, r2, r0
    bl func_ov008_021aedfc
    ldr r1, _LIT0
    mov r4, r0
    ldrh r2, [r1]
    ldrh r0, [r1, #0x2]
    add r0, r2, r0
    bl func_ov008_021aee54
    mov r1, r0, asr #0x4
    add r3, r0, r1, lsr #0x1b
    mov r1, r5, lsr #0x1f
    rsb r0, r1, r5, lsl #0x1b
    ldr r5, _LIT3
    mov r2, #0x34
    mla r2, r4, r2, r5
    mov r3, r3, asr #0x5
    ldr r2, [r2, r3, lsl #0x2]
    add r0, r1, r0, ror #0x1b
    mov r1, #0x1
    tst r2, r1, lsl r0
    beq .L_f38
    ldr r0, _LIT0
    mov r2, #0x0
    ldrh r1, [r0, #0x4]
    mov r3, #0x1
    cmp r1, #0x5
    moveq r1, #0x0
    addne r1, r1, #0x1
    strh r1, [r0, #0x4]
    mov r0, #0x38
    sub r1, r0, #0x39
    bl func_02037208
    b .L_f38
.L_b84:
    tst r1, #0x20
    beq .L_c34
    ldr r0, _LIT0
    ldrh r1, [r0]
    ldrh r0, [r0, #0x2]
    add r0, r1, r0
    bl func_ov008_021aee54
    ldr r1, _LIT0
    mov r5, r0
    ldrh r2, [r1]
    ldrh r0, [r1, #0x2]
    add r0, r2, r0
    bl func_ov008_021aedfc
    ldr r1, _LIT0
    mov r4, r0
    ldrh r2, [r1]
    ldrh r0, [r1, #0x2]
    add r0, r2, r0
    bl func_ov008_021aee54
    mov r1, r0, asr #0x4
    add r3, r0, r1, lsr #0x1b
    mov r1, r5, lsr #0x1f
    rsb r0, r1, r5, lsl #0x1b
    ldr r5, _LIT3
    mov r2, #0x34
    mla r2, r4, r2, r5
    mov r3, r3, asr #0x5
    ldr r2, [r2, r3, lsl #0x2]
    add r0, r1, r0, ror #0x1b
    mov r1, #0x1
    tst r2, r1, lsl r0
    beq .L_f38
    ldr r0, _LIT0
    mov r2, #0x0
    ldrh r1, [r0, #0x4]
    mov r3, #0x1
    cmp r1, #0x0
    moveq r1, #0x5
    subne r1, r1, #0x1
    strh r1, [r0, #0x4]
    mov r0, #0x38
    sub r1, r0, #0x39
    bl func_02037208
    b .L_f38
.L_c34:
    tst r1, #0x1
    beq .L_cfc
    ldr r0, _LIT0
    ldrh r1, [r0, #0x4]
    cmp r1, #0x0
    bne .L_f38
    ldrh r1, [r0]
    ldrh r0, [r0, #0x2]
    add r0, r1, r0
    bl func_ov008_021aee54
    ldr r1, _LIT0
    mov r5, r0
    ldrh r2, [r1]
    ldrh r0, [r1, #0x2]
    add r0, r2, r0
    bl func_ov008_021aedfc
    ldr r1, _LIT0
    mov r4, r0
    ldrh r2, [r1]
    ldrh r0, [r1, #0x2]
    add r0, r2, r0
    bl func_ov008_021aee54
    mov r1, r0, asr #0x4
    add r3, r0, r1, lsr #0x1b
    mov r1, r5, lsr #0x1f
    rsb r0, r1, r5, lsl #0x1b
    add r0, r1, r0, ror #0x1b
    ldr r5, _LIT3
    mov r2, #0x34
    mla r2, r4, r2, r5
    mov r3, r3, asr #0x5
    ldr r2, [r2, r3, lsl #0x2]
    mov r1, #0x1
    tst r2, r1, lsl r0
    ldreq r0, _LIT0
    ldreq r0, [r0, #0xac]
    cmpeq r0, #0x0
    bne .L_f38
    bl func_ov008_021aeeac
    ldr r0, _LIT0
    ldrh r1, [r0]
    ldrh r0, [r0, #0x2]
    add r0, r1, r0
    bl func_ov008_021afa34
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    b .L_f38
.L_cfc:
    tst r1, #0x2
    beq .L_d30
    ldr r0, _LIT0
    ldr r0, [r0, #0xb4]
    cmp r0, #0x0
    beq .L_f38
    mov r0, #0x42
    sub r1, r0, #0x43
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_d30:
    tst r1, #0x400
    beq .L_d70
    ldr r4, _LIT0
    ldr r0, [r4, #0xb4]
    cmp r0, #0x0
    ldreq r0, [r4, #0xac]
    cmpeq r0, #0x0
    bne .L_f38
    mov r3, #0x1
    mov r0, #0x3a
    str r3, [r4, #0xb8]
    sub r1, r0, #0x3b
    mov r2, #0x0
    str r3, [r4, #0xac]
    bl func_02037208
    b .L_f38
.L_d70:
    tst r1, #0x100
    beq .L_e50
    ldr r0, _LIT0
    ldrh r1, [r0, #0xa8]
    ldrh r0, [r0]
    sub r1, r1, #0x3
    cmp r0, r1
    bge .L_dc8
    ldr r2, _LIT0
    sub r0, r1, r0
    ldrh r3, [r2]
    cmp r0, #0x3
    movgt r0, #0x3
    add r3, r3, r0
    mov r1, #0x1
    strh r3, [r2]
    bl func_ov008_021af154
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
.L_dc8:
    ldr r0, _LIT0
    ldrh r1, [r0]
    ldrh r0, [r0, #0x2]
    add r0, r1, r0
    bl func_ov008_021aee54
    ldr r1, _LIT0
    mov r5, r0
    ldrh r2, [r1]
    ldrh r0, [r1, #0x2]
    add r0, r2, r0
    bl func_ov008_021aedfc
    ldr r1, _LIT0
    mov r4, r0
    ldrh r2, [r1]
    ldrh r0, [r1, #0x2]
    add r0, r2, r0
    bl func_ov008_021aee54
    mov r1, r0, asr #0x4
    add r3, r0, r1, lsr #0x1b
    mov r1, r5, lsr #0x1f
    rsb r0, r1, r5, lsl #0x1b
    ldr r5, _LIT3
    mov r2, #0x34
    mla r2, r4, r2, r5
    mov r3, r3, asr #0x5
    ldr r2, [r2, r3, lsl #0x2]
    add r0, r1, r0, ror #0x1b
    mov r1, #0x1
    tst r2, r1, lsl r0
    bne .L_f38
    ldr r0, _LIT0
    mov r1, #0x0
    strh r1, [r0, #0x4]
    b .L_f38
.L_e50:
    tst r1, #0x200
    beq .L_f24
    ldr r0, _LIT0
    ldrh r0, [r0]
    cmp r0, #0x0
    beq .L_e9c
    ldr r2, _LIT0
    cmp r0, #0x3
    ldrh r3, [r2]
    movgt r0, #0x3
    mov r1, #0x0
    sub r3, r3, r0
    strh r3, [r2]
    bl func_ov008_021af154
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
.L_e9c:
    ldr r0, _LIT0
    ldrh r1, [r0]
    ldrh r0, [r0, #0x2]
    add r0, r1, r0
    bl func_ov008_021aee54
    ldr r1, _LIT0
    mov r5, r0
    ldrh r2, [r1]
    ldrh r0, [r1, #0x2]
    add r0, r2, r0
    bl func_ov008_021aedfc
    ldr r1, _LIT0
    mov r4, r0
    ldrh r2, [r1]
    ldrh r0, [r1, #0x2]
    add r0, r2, r0
    bl func_ov008_021aee54
    mov r1, r0, asr #0x4
    add r3, r0, r1, lsr #0x1b
    mov r1, r5, lsr #0x1f
    rsb r0, r1, r5, lsl #0x1b
    ldr r5, _LIT3
    mov r2, #0x34
    mla r2, r4, r2, r5
    mov r3, r3, asr #0x5
    ldr r2, [r2, r3, lsl #0x2]
    add r0, r1, r0, ror #0x1b
    mov r1, #0x1
    tst r2, r1, lsl r0
    bne .L_f38
    ldr r0, _LIT0
    mov r1, #0x0
    strh r1, [r0, #0x4]
    b .L_f38
.L_f24:
    ldrh r0, [r0, #0x54]
    tst r0, #0x800
    ldrne r0, _LIT0
    movne r1, #0x1
    strne r1, [r0, #0xbc]
.L_f38:
    ldr r0, _LIT0
    ldr r1, [r0, #0xac]
    cmp r1, #0x0
    beq .L_1034
    ldrh r1, [r0, #0xa8]
    ldr r6, [r0, #0xb0]
    cmp r6, r1
    movge r1, #0x0
    strge r1, [r0, #0xac]
    bge .L_1034
    mov r0, r6
    bl func_ov008_021aee54
    ldr r1, _LIT0
    mov r5, r0
    ldr r0, [r1, #0xb0]
    bl func_ov008_021aedfc
    mov r4, r0
    mov r0, r6
    bl func_ov008_021aee54
    mov r1, r0, asr #0x4
    add r3, r0, r1, lsr #0x1b
    mov r1, r5, lsr #0x1f
    rsb r0, r1, r5, lsl #0x1b
    ldr r5, _LIT3
    mov r2, #0x34
    mla r2, r4, r2, r5
    mov r3, r3, asr #0x5
    ldr r2, [r2, r3, lsl #0x2]
    add r0, r1, r0, ror #0x1b
    mov r1, #0x1
    tst r2, r1, lsl r0
    bne .L_1024
    ldr r0, _LIT0
    ldr r0, [r0, #0xb0]
    bl func_ov008_021afa34
    ldr r0, _LIT0
    ldr r0, [r0, #0xb0]
    bl func_ov008_021aedfc
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0xb0]
    bl func_ov008_021aee54
    ldr r1, _LIT0
    mov r5, r0
    ldr r0, [r1, #0xb0]
    bl func_ov008_021aee54
    mov r1, r5, asr #0x4
    add r1, r5, r1, lsr #0x1b
    mov r3, r0, lsr #0x1f
    rsb r2, r3, r0, lsl #0x1b
    ldr r5, _LIT3
    mov r0, #0x34
    mla ip, r4, r0, r5
    mov r5, r1, asr #0x5
    ldr r4, [ip, r5, lsl #0x2]
    add r0, r3, r2, ror #0x1b
    mov r1, #0x1
    orr r0, r4, r1, lsl r0
    str r0, [ip, r5, lsl #0x2]
.L_1024:
    ldr r0, _LIT0
    ldr r1, [r0, #0xb0]
    add r1, r1, #0x1
    str r1, [r0, #0xb0]
.L_1034:
    ldr r0, _LIT0
    ldrh r1, [r0, #0xaa]
    cmp r1, #0x0
    beq .L_1318
    sub r1, r1, #0x1
    strh r1, [r0, #0xaa]
    ldrh r1, [r0, #0x6]
    cmp r1, #0x1
    beq .L_106c
    cmp r1, #0x2
    beq .L_10c8
    cmp r1, #0x3
    beq .L_1124
    b .L_1180
.L_106c:
    ldrh r1, [r0, #0xaa]
    ldr r0, _LIT4
    cmp r1, r0
    cmpne r1, #0x12c
    cmpne r1, #0xf8
    cmpne r1, #0xc4
    cmpne r1, #0x90
    bne .L_10a0
    mov r0, #0x35
    sub r1, r0, #0x36
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
.L_10a0:
    ldr r0, _LIT0
    ldrh r0, [r0, #0xaa]
    cmp r0, #0x72
    bne .L_11b4
    mov r0, #0x4a
    sub r1, r0, #0x4b
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    b .L_11b4
.L_10c8:
    ldrh r1, [r0, #0xaa]
    ldr r0, _LIT5
    cmp r1, r0
    cmpne r1, #0x168
    cmpne r1, #0x134
    cmpne r1, #0x100
    cmpne r1, #0xcc
    bne .L_10fc
    mov r0, #0x35
    sub r1, r0, #0x36
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
.L_10fc:
    ldr r0, _LIT0
    ldrh r0, [r0, #0xaa]
    cmp r0, #0xae
    bne .L_11b4
    mov r0, #0x3e
    sub r1, r0, #0x3f
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    b .L_11b4
.L_1124:
    ldrh r1, [r0, #0xaa]
    ldr r0, _LIT5
    cmp r1, r0
    cmpne r1, #0x168
    cmpne r1, #0x134
    cmpne r1, #0x100
    cmpne r1, #0xcc
    bne .L_1158
    mov r0, #0x35
    sub r1, r0, #0x36
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
.L_1158:
    ldr r0, _LIT0
    ldrh r0, [r0, #0xaa]
    cmp r0, #0xae
    bne .L_11b4
    mov r0, #0x57
    sub r1, r0, #0x58
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    b .L_11b4
.L_1180:
    ldrh r1, [r0, #0xaa]
    ldr r0, _LIT5
    cmp r1, r0
    cmpne r1, #0x168
    cmpne r1, #0x134
    cmpne r1, #0x100
    cmpne r1, #0xcc
    bne .L_11b4
    mov r0, #0x35
    sub r1, r0, #0x36
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
.L_11b4:
    ldr r1, _LIT0
    ldrh r2, [r1, #0xaa]
    cmp r2, #0x2d
    bgt .L_11d4
    bge .L_1258
    cmp r2, #0x0
    beq .L_12ec
    b .L_12f0
.L_11d4:
    ldr r0, _LIT6
    cmp r2, r0
    bgt .L_11e8
    beq .L_1220
    b .L_12f0
.L_11e8:
    add r0, r0, #0x3c
    cmp r2, r0
    bne .L_12f0
    mov r0, #0x0
    bl func_0202224c
    orr r1, r0, #0x2
    mov r0, #0x0
    bl func_02022234
    mov r0, #0x33
    sub r1, r0, #0x34
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    b .L_12f0
.L_1220:
    ldrh r0, [r1, #0x6]
    cmp r0, #0x1
    bne .L_12f0
    mov r0, #0x0
    bl func_0202224c
    orr r1, r0, #0x2
    mov r0, #0x0
    bl func_02022234
    mov r0, #0x33
    sub r1, r0, #0x34
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    b .L_12f0
.L_1258:
    ldrh r2, [r1]
    ldrh r0, [r1, #0x2]
    add r0, r2, r0
    bl func_ov008_021aedfc
    ldr r1, _LIT0
    mov r5, r0
    ldrh r2, [r1]
    ldrh r0, [r1, #0x2]
    add r0, r2, r0
    bl func_ov008_021aee54
    ldr r1, _LIT0
    mov r4, r0
    ldrh r2, [r1]
    ldrh r0, [r1, #0x2]
    add r0, r2, r0
    bl func_ov008_021aee54
    ldr r2, _LIT3
    mov r1, #0x34
    mla ip, r5, r1, r2
    mov r1, r4, asr #0x4
    add r1, r4, r1, lsr #0x1b
    mov r4, r1, asr #0x5
    ldr r2, [ip, r4, lsl #0x2]
    mov r3, #0x1
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x1b
    add r0, r1, r0, ror #0x1b
    orr r0, r2, r3, lsl r0
    str r0, [ip, r4, lsl #0x2]
    mov r0, #0x33
    sub r1, r0, #0x34
    mov r2, #0x0
    bl func_02037208
    ldr r0, _LIT0
    mov r1, #0x1
    strh r1, [r0, #0x4]
    b .L_12f0
.L_12ec:
    bl func_ov008_021aef18
.L_12f0:
    ldr r0, _LIT2
    ldrh r0, [r0, #0x54]
    tst r0, #0x2
    beq .L_1318
    bl func_ov008_021aef18
    mov r0, #0x43
    sub r1, r0, #0x44
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
.L_1318:
    bl func_ov008_021afbac
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov008_021b2de4
_LIT1: .word data_ov008_021b2780
_LIT2: .word data_02104bac
_LIT3: .word data_ov008_021b27bc
_LIT4: .word 0x0000015f
_LIT5: .word 0x0000019b
_LIT6: .word 0x0000019e
