; func_ov002_0222db50 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a8
        .extern func_ov002_021ae400
        .extern func_ov002_021af9d0
        .extern func_ov002_021afb74
        .extern func_ov002_021afba0
        .extern func_ov002_021b3fd8
        .extern func_ov002_021bac38
        .extern func_ov002_021bd030
        .extern func_ov002_021d8414
        .extern func_ov002_021d90c0
        .extern func_ov002_021df6d4
        .extern func_ov002_021df818
        .extern func_ov002_021e1b24
        .extern func_ov002_021e27c0
        .extern func_ov002_021e286c
        .extern func_ov002_021e30b4
        .extern func_ov002_02211b64
        .extern func_ov002_0225368c
        .extern func_ov002_0226b054
        .global func_ov002_0222db50
        .arm
func_ov002_0222db50:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xc
    mov sl, r0
    ldrh r2, [sl, #0x4]
    mov r2, r2, lsl #0x1d
    movs r2, r2, lsr #0x1f
    addne sp, sp, #0xc
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrh r2, [sl, #0x2]
    mov r3, r2, lsl #0x14
    mov r3, r3, lsr #0x1a
    cmp r3, #0x5
    bne .L_3bc
    mov r0, r2, lsl #0x1f
    mov r4, r0, lsr #0x1f
    mov r0, r2, lsl #0x1a
    mov r5, r0, lsr #0x1b
    mov r0, #0x14
    mul r8, r5, r0
    ldr r1, _LIT0
    and r2, r4, #0x1
    mul r9, r2, r1
    ldr r1, _LIT1
    mov r0, r4
    add r1, r1, r9
    ldr r6, [r8, r1]
    mov r7, #0x1
    bl func_ov002_021bd030
    ldrh r1, [sl, #0x4]
    ldrh r2, [sl, #0x2]
    mov fp, r0
    mov r1, r1, lsl #0x11
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r2, r2, lsl #0x1a
    ldr ip, _LIT2
    ldr lr, _LIT0
    and r3, r0, #0x1
    mla ip, r3, lr, ip
    mov r2, r2, lsr #0x1b
    mov r3, #0x14
    mul r3, r2, r3
    add r2, ip, #0x30
    ldr r3, [r2, r3]
    mov r1, r1, lsr #0x17
    mov r2, r3, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    add r2, r2, r3, lsr #0x1f
    cmp r1, r2
    addne sp, sp, #0xc
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    cmp r6, #0x0
    beq .L_f0
    cmp r6, #0x1
    ldreq r7, _LIT3
    b .L_f4
.L_f0:
    ldr r7, _LIT4
.L_f4:
    ldr r1, _LIT5
    ldr r1, [r1, #0x5a8]
    cmp r1, #0x78
    bgt .L_140
    bge .L_2c4
    cmp r1, #0x64
    bgt .L_118
    beq .L_3a8
    b .L_3d4
.L_118:
    cmp r1, #0x6e
    bgt .L_3d4
    cmp r1, #0x6c
    blt .L_3d4
    beq .L_390
    cmp r1, #0x6d
    beq .L_37c
    cmp r1, #0x6e
    beq .L_364
    b .L_3d4
.L_140:
    cmp r1, #0x7e
    bgt .L_150
    beq .L_1e0
    b .L_3d4
.L_150:
    cmp r1, #0x80
    bgt .L_3d4
    cmp r1, #0x7f
    blt .L_3d4
    beq .L_1c4
    cmp r1, #0x80
    bne .L_3d4
    ldrh r1, [sl]
    mov r2, r7
    bl func_ov002_0225368c
    cmp r0, #0x0
    bne .L_1a0
    ldrh r0, [sl, #0x2]
    mov r1, #0xd
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    add sp, sp, #0xc
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1a0:
    mov r0, r4
    mov r1, #0xf6
    bl func_ov002_021ae400
    ldr r0, _LIT5
    mov r1, #0x1
    str r1, [r0, #0x5ac]
    add sp, sp, #0xc
    mov r0, #0x7f
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1c4:
    ldrh r2, [sl]
    mov r3, r7
    mov r1, #0x6
    bl func_ov002_021af9d0
    add sp, sp, #0xc
    mov r0, #0x7e
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1e0:
    bl func_ov002_021afba0
    cmp r0, #0xb
    beq .L_1f8
    cmp r0, #0xd
    beq .L_29c
    b .L_2b8
.L_1f8:
    bl func_ov002_021afb74
    mov r5, r0
    bl func_ov002_021afb74
    ldr r0, [r0]
    ldr r1, [r5]
    mov r0, r0, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r5, r0, r1, lsr #0x1f
    str fp, [sp]
    mov r1, #0x1
    mov r0, r4
    mov r2, r5
    str r1, [sp, #0x4]
    mov r1, #0x0
    str r1, [sp, #0x8]
    mov r3, r4
    mov r1, #0xb
    bl func_ov002_021d8414
    mov r3, r5
    mov r0, r4
    mov r1, #0xb
    ldr r2, _LIT6
    bl func_ov002_021b3fd8
    cmp r0, #0x0
    beq .L_280
    ldr r1, _LIT6
    mov r0, r4
    bl func_ov002_021df6d4
    mov r0, sl
    mov r1, r4
    mov r2, #0x7d0
    bl func_ov002_021df818
.L_280:
    ldr r0, _LIT5
    ldr r0, [r0, #0x5ac]
    cmp r0, #0x0
    beq .L_2b8
    mov r0, r4
    bl func_ov002_021e286c
    b .L_2b8
.L_29c:
    mov r1, r7, lsl #0x10
    mov r0, r4
    mov r2, fp
    mov r1, r1, lsr #0x10
    bl func_ov002_021e1b24
    mov r0, r4
    bl func_ov002_021e286c
.L_2b8:
    add sp, sp, #0xc
    mov r0, #0x78
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2c4:
    cmp r6, #0x2
    bge .L_2dc
    mov r0, r4
    mov r1, r5
    add r2, r6, #0x1
    bl func_ov002_021d90c0
.L_2dc:
    ldr r1, _LIT4
    mov r0, r4
    bl func_ov002_021bac38
    cmp r0, #0x0
    blt .L_358
    ldr r1, _LIT3
    mov r0, r4
    bl func_ov002_021bac38
    cmp r0, #0x0
    blt .L_358
    ldr r1, _LIT2
    mov r0, r4, lsl #0x1f
    add r1, r1, r9
    add r1, r1, #0x30
    ldr r1, [r1, r8]
    and r3, r0, #-2147483648
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r2, r5, lsl #0x10
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    mov r1, r0, lsl #0x10
    ldrh r4, [sl]
    orr r3, r3, #0x200000
    and r0, r2, #0x1f0000
    orr r0, r3, r0
    orr r0, r4, r0
    mov r1, r1, lsr #0x10
    mov r2, #0x0
    bl func_ov002_021e30b4
.L_358:
    add sp, sp, #0xc
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_364:
    mov r0, r4
    mov r1, #0x1
    bl func_ov002_021e27c0
    add sp, sp, #0xc
    mov r0, #0x6d
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_37c:
    rsb r0, r4, #0x1
    bl func_ov002_0226b054
    add sp, sp, #0xc
    mov r0, #0x6c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_390:
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_021e27c0
    add sp, sp, #0xc
    mov r0, #0x64
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_3a8:
    mov r0, r4
    bl func_ov002_021e286c
    add sp, sp, #0xc
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_3bc:
    ldrh r2, [sl, #0xc]
    cmp r2, #0x0
    beq .L_3d4
    bl func_ov002_02211b64
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_3d4:
    mov r0, #0x0
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf1a8
_LIT2: .word data_ov002_022cf16c
_LIT3: .word 0x000017ad
_LIT4: .word 0x000017ae
_LIT5: .word data_ov002_022ce288
_LIT6: .word 0x00001379
