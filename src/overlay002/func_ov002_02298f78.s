; func_ov002_02298f78 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf178
        .extern data_ov002_022d016c
        .extern func_ov002_021bbd14
        .extern func_ov002_021bbf50
        .extern func_ov002_021bcb10
        .extern func_ov002_021bcd80
        .extern func_ov002_021bcf00
        .extern func_ov002_021c9e14
        .extern func_ov002_022536e8
        .extern func_ov002_0226eb48
        .extern func_ov002_02271a78
        .extern func_ov002_02281994
        .global func_ov002_02298f78
        .arm
func_ov002_02298f78:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x3c
    mov sl, r0
    bl func_ov002_021c9e14
    cmp r0, #0x0
    addeq sp, sp, #0x3c
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT0
    and r2, sl, #0x1
    mul r1, r2, r0
    ldr r0, _LIT1
    mov r5, #0x0
    ldr r0, [r0, r1]
    cmp r0, #0x0
    bls .L_3e4
    ldr r0, _LIT2
    ldr r4, _LIT3
    add r9, r0, r1
    sub r0, r4, #0x184
    str r0, [sp, #0x28]
    ldr r0, _LIT4
    sub fp, r4, #0x13
    add r0, r0, #0x1
    str r0, [sp, #0x38]
    ldr r0, _LIT5
    rsb r8, sl, #0x1
    add r0, r0, #0xa3
    str r0, [sp, #0x20]
    ldr r0, _LIT5
    add r7, r9, #0x120
    add r0, r0, #0xa2
    str r0, [sp, #0x1c]
    ldr r0, _LIT5
    add r0, r0, #0xa1
    str r0, [sp, #0x18]
    mvn r0, #0x0
    str r0, [sp]
    ldr r0, _LIT6
    sub r0, r0, #0xd0
    str r0, [sp, #0x8]
    ldr r0, _LIT6
    sub r0, r0, #0xd0
    str r0, [sp, #0xc]
    ldr r0, _LIT5
    add r0, r0, #0xa3
    str r0, [sp, #0x10]
    ldr r0, _LIT6
    rsb r0, r0, #0x2900
    str r0, [sp, #0x24]
    ldr r0, _LIT5
    add r0, r0, #0x620
    str r0, [sp, #0x34]
    add r0, r4, #0x14c
    str r0, [sp, #0x2c]
    str r0, [sp, #0x30]
    mov r0, fp
    str r0, [sp, #0x4]
    ldr r0, _LIT5
    add r0, r0, #0xa1
    str r0, [sp, #0x14]
.L_f4:
    ldr r1, [r7]
    mov r0, sl
    mov r2, r1, lsl #0x13
    mov r6, r2, lsr #0x13
    mov r2, r1, lsl #0x12
    mov r1, r1, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    bl func_ov002_0226eb48
    tst r0, #0x10
    beq .L_3d0
    cmp r6, fp
    mov r0, #0x0
    bgt .L_1c0
    ldr r1, [sp, #0x4]
    cmp r6, r1
    bge .L_34c
    ldr r1, [sp, #0x8]
    cmp r6, r1
    bgt .L_19c
    ldr r1, [sp, #0xc]
    cmp r6, r1
    bge .L_220
    ldr r1, [sp, #0x10]
    cmp r6, r1
    bgt .L_18c
    ldr r1, [sp, #0x14]
    cmp r6, r1
    blt .L_380
    ldr r1, [sp, #0x18]
    cmp r6, r1
    ldrne r1, [sp, #0x1c]
    cmpne r6, r1
    ldrne r1, [sp, #0x20]
    cmpne r6, r1
    beq .L_218
    b .L_380
.L_18c:
    ldr r1, [sp, #0x24]
    cmp r6, r1
    beq .L_264
    b .L_380
.L_19c:
    ldr r1, _LIT6
    cmp r6, r1
    bgt .L_1b0
    beq .L_230
    b .L_380
.L_1b0:
    ldr r1, [sp, #0x28]
    cmp r6, r1
    beq .L_218
    b .L_380
.L_1c0:
    ldr r1, [sp, #0x2c]
    cmp r6, r1
    bgt .L_1f8
    ldr r1, [sp, #0x30]
    cmp r6, r1
    bge .L_2b4
    cmp r6, r4
    bgt .L_1e8
    beq .L_314
    b .L_380
.L_1e8:
    ldr r1, [sp, #0x34]
    cmp r6, r1
    beq .L_298
    b .L_380
.L_1f8:
    ldr r1, _LIT4
    cmp r6, r1
    bgt .L_20c
    beq .L_218
    b .L_380
.L_20c:
    ldr r1, [sp, #0x38]
    cmp r6, r1
    bne .L_380
.L_218:
    mov r0, #0x1
    b .L_380
.L_220:
    ldr r1, [r9, #0xc]
    cmp r1, #0x1
    moveq r0, #0x1
    b .L_380
.L_230:
    mov r0, r8
    bl func_ov002_021bbf50
    cmp r0, #0x0
    beq .L_25c
    mov r1, r6
    mov r0, sl
    mov r2, #0x1
    bl func_ov002_021bcb10
    cmp r0, #0x3
    movge r0, #0x1
    bge .L_380
.L_25c:
    mov r0, #0x0
    b .L_380
.L_264:
    mov r0, r8
    bl func_ov002_021bcf00
    cmp r0, #0x0
    beq .L_290
    mov r1, r6
    mov r0, sl
    mov r2, #0x1
    bl func_ov002_021bcb10
    cmp r0, #0x3
    movge r0, #0x1
    bge .L_380
.L_290:
    mov r0, #0x0
    b .L_380
.L_298:
    mov r1, r6
    mov r0, sl
    bl func_ov002_021bbd14
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    b .L_380
.L_2b4:
    mov r0, sl
    mov r1, r4
    bl func_ov002_021bbd14
    cmp r0, #0x0
    bne .L_304
    mov r0, sl
    add r1, r4, #0x86
    bl func_ov002_02281994
    cmp r0, #0x0
    beq .L_30c
    ldr r1, _LIT5
    mov r0, sl
    bl func_ov002_02281994
    cmp r0, #0x0
    bne .L_304
    mov r0, sl
    add r1, r4, #0x8e
    bl func_ov002_02281994
    cmp r0, #0x0
    beq .L_30c
.L_304:
    mov r0, #0x1
    b .L_380
.L_30c:
    mov r0, #0x0
    b .L_380
.L_314:
    mov r0, sl
    mov r1, r4
    bl func_ov002_021bbd14
    cmp r0, #0x0
    bne .L_33c
    mov r0, sl
    add r1, r4, #0x86
    bl func_ov002_021bbd14
    cmp r0, #0x0
    beq .L_344
.L_33c:
    mov r0, #0x1
    b .L_380
.L_344:
    mov r0, #0x0
    b .L_380
.L_34c:
    ldr r1, [sp]
    mov r0, sl
    bl func_ov002_021bcd80
    cmp r0, #0x0
    beq .L_37c
    mov r1, r6
    mov r0, sl
    mov r2, #0x0
    bl func_ov002_022536e8
    cmp r0, #0x0
    movne r0, #0x1
    bne .L_380
.L_37c:
    mov r0, #0x0
.L_380:
    cmp r0, #0x0
    beq .L_3d0
    ldr r3, _LIT7
    mov r0, #0x1
    str sl, [r3, #0xd6c]
    str sl, [r3, #0xd70]
    add r1, r9, #0x120
    ldr r4, [r1, r5, lsl #0x2]
    mov r2, r0
    mov r1, r4, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r4, r4, lsl #0x12
    mov r1, r1, lsl #0x1
    add r4, r1, r4, lsr #0x1f
    mov r1, #0x0
    str r4, [r3, #0xd60]
    bl func_ov002_02271a78
    add sp, sp, #0x3c
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_3d0:
    add r7, r7, #0x4
    add r5, r5, #0x1
    ldr r0, [r9, #0xc]
    cmp r5, r0
    bcc .L_f4
.L_3e4:
    mov r0, #0x0
    add sp, sp, #0x3c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf178
_LIT2: .word data_ov002_022cf16c
_LIT3: .word 0x00001870
_LIT4: .word 0x00001b2e
_LIT5: .word 0x000012e5
_LIT6: .word 0x0000154b
_LIT7: .word data_ov002_022d016c
