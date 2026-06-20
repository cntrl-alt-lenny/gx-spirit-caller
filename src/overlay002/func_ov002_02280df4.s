; func_ov002_02280df4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_0202b878
        .extern func_ov002_021b30ac
        .extern func_ov002_021b9ecc
        .extern func_ov002_021be4a0
        .extern func_ov002_021c10e8
        .extern func_ov002_021c1a2c
        .extern func_ov002_021c1e44
        .extern func_ov002_021c8470
        .extern func_ov002_021e8a18
        .global func_ov002_02280df4
        .arm
func_ov002_02280df4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x88
    mov r9, r1
    ldr r1, _LIT0
    ldr r4, _LIT1
    and r5, r9, #0x1
    mla r8, r5, r1, r4
    mvn r4, #0x0
    mov sl, r0
    mov r0, r4
    str r4, [sp, #0x8]
    str r0, [sp, #0x4]
    ldr r0, [sp, #0x8]
    mov fp, r2
    str r0, [sp, #0x18]
    str r0, [sp, #0x14]
    str r0, [sp, #0x10]
    str r0, [sp, #0xc]
    str r0, [sp, #0x1c]
    str r0, [sp, #0x24]
    str r0, [sp, #0x20]
    str r0, [sp, #0x28]
    add r0, r1, #0x790
    str r0, [sp, #0x64]
    str r0, [sp, #0x68]
    ldr r0, _LIT2
    str r3, [sp]
    add r0, r0, #0x66
    str r0, [sp, #0x60]
    ldr r0, _LIT3
    mov r7, r8
    add r0, r0, #0x20c
    str r0, [sp, #0x78]
    ldr r0, _LIT3
    add r6, r8, #0x30
    sub r0, r0, #0x14c
    str r0, [sp, #0x84]
    ldr r0, _LIT2
    mov r4, #0x0
    add r0, r0, #0x530
    str r0, [sp, #0x48]
    ldr r0, _LIT3
    add r0, r0, #0x1
    str r0, [sp, #0x4c]
    ldr r0, _LIT4
    sub r0, r0, #0xab
    str r0, [sp, #0x38]
    ldr r0, _LIT3
    add r0, r0, #0x1
    str r0, [sp, #0x40]
    ldr r0, _LIT5
    sub r0, r0, #0x2a
    str r0, [sp, #0x50]
    ldr r0, _LIT4
    sub r0, r0, #0xab
    str r0, [sp, #0x34]
    ldr r0, _LIT4
    sub r0, r0, #0xa1
    str r0, [sp, #0x3c]
    ldr r0, _LIT4
    add r0, r0, #0x77
    str r0, [sp, #0x2c]
    ldr r0, _LIT4
    add r0, r0, #0x77
    str r0, [sp, #0x30]
    ldr r0, _LIT4
    add r0, r0, #0x76
    str r0, [sp, #0x58]
    sub r0, r1, #0x28c
    str r0, [sp, #0x54]
    add r0, r1, #0x9d0
    str r0, [sp, #0x7c]
    ldr r0, _LIT2
    add r0, r0, #0x530
    str r0, [sp, #0x44]
    ldr r0, _LIT4
    sub r0, r0, #0x230
    str r0, [sp, #0x5c]
    ldr r0, _LIT3
    sub r0, r0, #0xca
    str r0, [sp, #0x6c]
    ldr r0, _LIT3
    sub r0, r0, #0xca
    str r0, [sp, #0x70]
    ldr r0, _LIT3
    sub r0, r0, #0x154
    str r0, [sp, #0x80]
    ldr r0, _LIT5
    add r0, r0, #0x1
    str r0, [sp, #0x74]
.L_168:
    cmp r4, fp
    beq .L_408
    ldr r0, [r6]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    ldrneh r0, [r7, #0x38]
    cmpne r0, #0x0
    beq .L_408
    mov r0, sl
    mov r1, r9
    mov r2, r4
    bl func_ov002_021e8a18
    cmp r0, #0x0
    beq .L_408
    mov r0, r9
    mov r1, r4
    bl func_ov002_021c8470
    mov r5, r0
    mov r0, r9
    mov r1, r4
    mov r2, #0x1
    bl func_ov002_021c10e8
    cmp r9, r0
    bne .L_408
    mov r0, r9
    mov r1, r4
    mov r2, #0x1
    bl func_ov002_021be4a0
    cmp r0, #0x0
    beq .L_408
    ldrh r2, [sl]
    ldr r0, [sp, #0x2c]
    cmp r2, r0
    bgt .L_228
    ldr r0, [sp, #0x30]
    cmp r2, r0
    bge .L_2a8
    ldr r0, [sp, #0x34]
    cmp r2, r0
    bgt .L_218
    ldr r0, [sp, #0x38]
    cmp r2, r0
    beq .L_27c
    b .L_2c4
.L_218:
    ldr r0, [sp, #0x3c]
    cmp r2, r0
    beq .L_290
    b .L_2c4
.L_228:
    ldr r0, [sp, #0x40]
    cmp r2, r0
    bgt .L_25c
    ldr r0, [sp, #0x44]
    cmp r2, r0
    blt .L_2c4
    ldr r0, [sp, #0x48]
    cmp r2, r0
    beq .L_26c
    ldr r0, [sp, #0x4c]
    cmp r2, r0
    beq .L_27c
    b .L_2c4
.L_25c:
    ldr r0, [sp, #0x50]
    cmp r2, r0
    rsbeq r5, r5, #0x10000
    b .L_2c4
.L_26c:
    sub r5, r5, #0x3e8
    cmp r5, #0x3e8
    ldrlt r5, [sp, #0xc]
    b .L_2c4
.L_27c:
    ldr r0, [sp, #0x54]
    sub r5, r5, #0x1f4
    cmp r5, r0
    ldrlt r5, [sp, #0x10]
    b .L_2c4
.L_290:
    mov r0, r9
    mov r1, r4
    bl func_ov002_021c1a2c
    cmp r0, #0x0
    ldreq r5, [sp, #0x14]
    b .L_2c4
.L_2a8:
    mov r0, r9
    mov r1, r4
    bl func_ov002_021b9ecc
    ldr r1, [sp, #0x58]
    cmp r0, r1
    ldrne r5, [sp, #0x18]
    add r5, r5, #0x3e8
.L_2c4:
    mov r0, sl
    mov r1, r9
    mov r2, r4
    bl func_ov002_021c1e44
    cmp r0, #0x0
    mov r0, r9
    mov r1, r4
    ldrne r5, [sp, #0x1c]
    bl func_ov002_021b9ecc
    ldr r1, [sp, #0x5c]
    cmp r0, r1
    bgt .L_32c
    ldr r1, [sp, #0x60]
    cmp r0, r1
    bge .L_398
    ldr r1, [sp, #0x64]
    cmp r0, r1
    bgt .L_31c
    ldr r1, [sp, #0x68]
    cmp r0, r1
    beq .L_37c
    b .L_3d0
.L_31c:
    ldr r1, _LIT2
    cmp r0, r1
    beq .L_37c
    b .L_3d0
.L_32c:
    ldr r1, [sp, #0x6c]
    cmp r0, r1
    bgt .L_354
    ldr r1, [sp, #0x70]
    cmp r0, r1
    bge .L_3cc
    ldr r1, _LIT4
    cmp r0, r1
    beq .L_3a0
    b .L_3d0
.L_354:
    ldr r1, [sp, #0x74]
    cmp r0, r1
    bgt .L_3d0
    ldr r1, _LIT5
    cmp r0, r1
    blt .L_3d0
    ldrne r1, [sp, #0x78]
    cmpne r0, r1
    beq .L_398
    b .L_3d0
.L_37c:
    ldrh r1, [sl]
    ldr r0, [sp, #0x7c]
    cmp r1, r0
    bne .L_3d0
    add sp, sp, #0x88
    mov r0, r4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_398:
    add r5, r5, #0x1f4
    b .L_3d0
.L_3a0:
    ldrh r1, [sl]
    ldr r0, [sp, #0x80]
    cmp r1, r0
    beq .L_3d0
    ldr r0, [sp, #0x84]
    cmp r1, r0
    bne .L_3c4
    add r5, r5, #0x1f4
    b .L_3d0
.L_3c4:
    ldr r5, [sp, #0x20]
    b .L_3d0
.L_3cc:
    ldr r5, [sp, #0x24]
.L_3d0:
    ldrh r0, [sl]
    bl func_0202b878
    cmp r0, #0x17
    beq .L_3f8
    ldr r2, _LIT3
    mov r0, r9
    mov r1, r4
    bl func_ov002_021b30ac
    cmp r0, #0x0
    ldrne r5, [sp, #0x28]
.L_3f8:
    ldr r0, [sp, #0x4]
    cmp r0, r5
    strlt r5, [sp, #0x4]
    strlt r4, [sp, #0x8]
.L_408:
    add r6, r6, #0x14
    add r7, r7, #0x14
    add r4, r4, #0x1
    cmp r4, #0x5
    blt .L_168
    ldr r0, [sp]
    cmp r0, #0x0
    beq .L_494
    ldr r0, [sp, #0x8]
    mvn r1, #0x0
    cmp r0, r1
    bne .L_494
    add r4, r8, #0x30
    mov r5, #0x0
.L_440:
    cmp r5, fp
    beq .L_480
    ldr r0, [r4]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    ldrneh r0, [r8, #0x38]
    cmpne r0, #0x0
    beq .L_480
    mov r0, sl
    mov r1, r9
    mov r2, r5
    bl func_ov002_021e8a18
    cmp r0, #0x0
    addne sp, sp, #0x88
    movne r0, r5
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_480:
    add r5, r5, #0x1
    cmp r5, #0x5
    add r4, r4, #0x14
    add r8, r8, #0x14
    blt .L_440
.L_494:
    ldr r0, [sp, #0x8]
    add sp, sp, #0x88
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word 0x0000112d
_LIT3: .word 0x00001660
_LIT4: .word 0x000013c3
_LIT5: .word 0x0000186b
