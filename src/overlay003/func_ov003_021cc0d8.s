; func_ov003_021cc0d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern data_02104c40
        .extern data_ov003_021cf370
        .extern data_ov003_021cf6c0
        .extern func_02006c0c
        .extern Task_Invoke
        .extern func_0201d47c
        .extern func_0201e5b8
        .extern func_02034784
        .extern func_02034888
        .extern func_02037208
        .extern func_0207fce8
        .extern func_0208c884
        .extern func_020a991c
        .extern func_ov003_021cc8b8
        .extern func_ov003_021cca88
        .extern func_ov003_021cef78
        .global func_ov003_021cc0d8
        .arm
func_ov003_021cc0d8:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x30
    mov r5, r0
    ldr r1, [r5, #0x4]
    ldr r4, _LIT0
    cmp r1, #0xf
    addls pc, pc, r1, lsl #0x2
    b .L_25c8
    b .L_1e7c
    b .L_1f64
    b .L_204c
    b .L_2074
    b .L_20a8
    b .L_210c
    b .L_2168
    b .L_2280
    b .L_2330
    b .L_2388
    b .L_23c0
    b .L_2408
    b .L_2438
    b .L_247c
    b .L_24f8
    b .L_2590
.L_1e7c:
    ldr r0, [r5, #0xc]
    ldr r2, _LIT1
    add r3, r0, #0x1
    sub r0, r3, #0x10
    ldr r1, _LIT2
    str r3, [r5, #0xc]
    and r0, r2, r0, lsl #0x4
    str r0, [r1]
    ldr r0, [r5, #0xc]
    add r3, r1, #0x1000
    sub r0, r0, #0x10
    and r0, r2, r0, lsl #0x4
    str r0, [r1, #0x4]
    ldr r4, [r5, #0xc]
    ldr r0, _LIT3
    sub r4, r4, #0x10
    and r4, r2, r4, lsl #0x4
    str r4, [r3]
    ldr r4, [r5, #0xc]
    mov r3, #0xc0
    sub r4, r4, #0x10
    and r2, r2, r4, lsl #0x4
    str r2, [r0]
    ldr r2, [r5, #0x18]
    add r2, r2, #0x10
    str r2, [r5, #0x18]
    ldr r2, [r5, #0xc]
    mov r2, r2, lsl #0x3
    add r2, r2, #0x80
    and r2, r2, #0xff
    strh r2, [r1, #0x2c]
    strh r3, [r1, #0x30]
    ldr r2, [r5, #0xc]
    mov r2, r2, lsl #0x3
    add r2, r2, #0x80
    and r2, r2, #0xff
    strh r2, [r0, #0x28]
    strh r3, [r0, #0x2c]
    ldr r2, [r5, #0xc]
    cmp r2, #0x10
    blt .L_25c8
    mov ip, #0x0
    str ip, [r5, #0xc]
    mov r2, #0x1
    mov r4, #0x4000000
    str r2, [r5, #0x4]
    ldr r2, [r4]
    add r3, r4, #0x1000
    bic r2, r2, #0xe000
    str r2, [r4]
    ldr r2, [r3]
    bic r2, r2, #0xe000
    str r2, [r3]
    strh ip, [r1, #0x2c]
    strh ip, [r1, #0x30]
    strh ip, [r0, #0x28]
    strh ip, [r0, #0x2c]
    b .L_25c8
.L_1f64:
    ldr r0, _LIT4
    ldr r0, [r0, #0xc48]
    cmp r0, #0x3
    beq .L_1f80
    cmp r0, #0x4
    beq .L_1f94
    b .L_1fa8
.L_1f80:
    mov r0, #0x1
    str r0, [r4, #0x50]
    mov r0, #0xa
    str r0, [r5, #0x4]
    b .L_1fb0
.L_1f94:
    mvn r0, #0x0
    str r0, [r4, #0x50]
    mov r0, #0xa
    str r0, [r5, #0x4]
    b .L_1fb0
.L_1fa8:
    mov r0, #0x2
    str r0, [r5, #0x4]
.L_1fb0:
    add r0, sp, #0x8
    bl func_0201d47c
    ldr r0, _LIT5
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    mov r3, #0x3400
    mov r2, #0x80
    str r0, [sp, #0x8]
    ldr r1, _LIT4
    str r3, [sp, #0x14]
    strh r2, [sp, #0x18]
    ldr r1, [r1, #0xc3c]
    ldr r0, _LIT6
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x0
    beq .L_200c
    ldrh r1, [sp, #0x1c]
    add r0, sp, #0x8
    bic r1, r1, #0xf
    orr r1, r1, #0x6
    strh r1, [sp, #0x1c]
    bl func_0201e5b8
.L_200c:
    ldr r0, _LIT4
    ldr r1, _LIT6
    ldr r0, [r0, #0xc3c]
    rsb r0, r0, #0x1
    ldr r0, [r1, r0, lsl #0x2]
    cmp r0, #0x0
    beq .L_25c8
    ldrh r1, [sp, #0x1c]
    add r0, sp, #0x8
    bic r1, r1, #0xf
    orr r1, r1, #0x1
    strh r1, [sp, #0x1c]
    bl func_0201e5b8
    ldr r0, [sp, #0x8]
    bl Task_Invoke
    b .L_25c8
.L_204c:
    ldr r0, [r5, #0xc]
    add r0, r0, #0x1
    str r0, [r5, #0xc]
    cmp r0, #0x10
    blt .L_25c8
    mov r0, #0x3
    str r0, [r5, #0x4]
    mov r0, #0x0
    str r0, [r5, #0xc]
    b .L_25c8
.L_2074:
    bl func_ov003_021cc8b8
    cmp r0, #0x0
    beq .L_25c8
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    mov r0, #0x4
    str r0, [r5, #0x4]
    mov r0, #0x0
    str r0, [r5, #0xc]
    b .L_25c8
.L_20a8:
    ldr r0, [r5, #0xc]
    cmp r0, #0x100
    movlt r1, #0x1
    ldr r0, [r5, #0xc]
    movge r1, #0x0
    add r0, r0, r1, lsl #0x3
    str r0, [r5, #0xc]
    cmp r0, #0x100
    blt .L_25c8
    bl func_02034784
    cmp r0, #0x0
    beq .L_20f8
    ldr r3, [r4, #0x44]
    mov r0, #0x4
    mov r4, #0x0
    add r1, sp, #0x2
    mov r2, r0
    strh r4, [sp, #0x2]
    strh r3, [sp, #0x4]
    bl func_02034888
.L_20f8:
    mov r0, #0x5
    str r0, [r5, #0x4]
    mov r0, #0x0
    str r0, [r5, #0xc]
    b .L_25c8
.L_210c:
    bl func_02034784
    cmp r0, #0x0
    beq .L_2124
    ldr r0, [r4, #0x54]
    cmp r0, #0x0
    beq .L_25c8
.L_2124:
    ldr r0, [r5, #0xc]
    add r0, r0, #0x1
    cmp r0, #0x10
    str r0, [r5, #0xc]
    cmpne r0, #0x20
    ldreq r0, [r5, #0x8]
    addeq r0, r0, #0x1
    streq r0, [r5, #0x8]
    ldr r0, [r5, #0x8]
    cmp r0, #0x2
    blt .L_25c8
    mov r0, #0x6
    str r0, [r5, #0x4]
    mov r0, #0x0
    str r0, [r5, #0xc]
    str r0, [r5, #0x8]
    b .L_25c8
.L_2168:
    ldr r0, [r5, #0xc]
    cmp r0, #0x0
    bne .L_222c
    bl func_02034784
    cmp r0, #0x0
    beq .L_2190
    ldr r0, [r4, #0x54]
    cmp r0, #0x0
    beq .L_25c8
    b .L_21dc
.L_2190:
    bl func_020a991c
    ldr r2, _LIT7
    mov r3, #0x3
    smull r1, ip, r2, r0
    add ip, ip, r0, lsr #0x1f
    smull r1, r2, r3, ip
    sub ip, r0, r1
    ldr r0, [r4, #0x44]
    str ip, [r4, #0x48]
    cmp r0, ip
    bne .L_21dc
    bl func_020a991c
    ldr r2, _LIT7
    mov r3, #0x3
    smull r1, ip, r2, r0
    add ip, ip, r0, lsr #0x1f
    smull r1, r2, r3, ip
    sub ip, r0, r1
    str ip, [r4, #0x48]
.L_21dc:
    ldr r2, [r4, #0x48]
    ldr r0, [r4, #0x44]
    ldr r1, _LIT7
    sub r0, r2, r0
    add r3, r0, #0x7
    smull r0, ip, r1, r3
    add ip, ip, r3, lsr #0x1f
    mov r2, #0x3
    smull r0, r1, r2, ip
    sub ip, r3, r0
    subs r0, ip, #0x1
    str r0, [r4, #0x50]
    ldr r0, [r4, #0x48]
    movmi r1, #0x1
    movpl r1, #0x0
    add r0, r0, #0x4
    str r1, [r4, #0x4c]
    add r0, r5, r0, lsl #0x2
    ldr r0, [r0, #0x160]
    bl func_0207fce8
.L_222c:
    ldr r0, [r5, #0xc]
    cmp r0, #0x100
    movlt r1, #0x1
    ldr r0, [r5, #0xc]
    movge r1, #0x0
    add r0, r0, r1, lsl #0x3
    str r0, [r5, #0xc]
    cmp r0, #0x100
    blt .L_25c8
    mov r6, #0x0
    str r6, [r4, #0x54]
    mov r0, #0x7
    str r0, [r5, #0x4]
    str r6, [r5, #0xc]
.L_2264:
    ldr r0, [r5, #0xc0]
    bl func_0207fce8
    add r6, r6, #0x1
    cmp r6, #0x2
    add r5, r5, #0x6c
    blt .L_2264
    b .L_25c8
.L_2280:
    ldr r0, [r5, #0xc]
    cmp r0, #0x0
    bne .L_22ac
    ldr r0, [r4, #0x50]
    cmp r0, #0x0
    beq .L_22ac
    mov r0, #0x37
    sub r1, r0, #0x38
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
.L_22ac:
    ldr r0, [r5, #0xc]
    cmp r0, #0x100
    movlt r1, #0x1
    ldr r0, [r5, #0xc]
    movge r1, #0x0
    add r0, r0, r1, lsl #0x3
    str r0, [r5, #0xc]
    cmp r0, #0x100
    blt .L_25c8
    ldr r1, [r4, #0x50]
    mvn r0, #0x0
    cmp r1, r0
    beq .L_2314
    cmp r1, #0x0
    beq .L_22f4
    cmp r1, #0x1
    beq .L_2314
    b .L_2324
.L_22f4:
    mov r0, #0x8
    str r0, [r5, #0x4]
    ldr r0, [r4, #0x48]
    add r0, r0, #0x7
    add r0, r5, r0, lsl #0x2
    ldr r0, [r0, #0x160]
    bl func_0207fce8
    b .L_2324
.L_2314:
    mov r0, #0x9
    str r0, [r5, #0x4]
    mov r0, #0x0
    str r0, [r5, #0x10]
.L_2324:
    mov r0, #0x0
    str r0, [r5, #0xc]
    b .L_25c8
.L_2330:
    ldr r0, [r5, #0xc]
    add r0, r0, #0x1
    cmp r0, #0x10
    cmpne r0, #0x20
    str r0, [r5, #0xc]
    cmpne r0, #0x30
    ldreq r0, [r5, #0x8]
    addeq r0, r0, #0x1
    streq r0, [r5, #0x8]
    ldr r0, [r5, #0x8]
    cmp r0, #0x3
    blt .L_25c8
    ldr r0, [r5, #0x28]
    bl func_0207fce8
    ldr r0, [r5, #0x2c]
    bl func_0207fce8
    mov r0, #0x3
    str r0, [r5, #0x4]
    mov r0, #0x0
    str r0, [r5, #0xc]
    str r0, [r5, #0x8]
    b .L_25c8
.L_2388:
    ldr r0, [r5, #0xc]
    cmp r0, #0x10
    movlt r1, #0x1
    ldr r0, [r5, #0xc]
    movge r1, #0x0
    add r0, r0, r1
    str r0, [r5, #0xc]
    cmp r0, #0x10
    blt .L_25c8
    mov r0, #0xa
    str r0, [r5, #0x4]
    mov r0, #0x0
    str r0, [r5, #0xc]
    b .L_25c8
.L_23c0:
    ldr r0, [r5, #0xc]
    cmp r0, #0x10
    movlt r1, #0x1
    ldr r0, [r5, #0xc]
    movge r1, #0x0
    add r0, r0, r1
    str r0, [r5, #0xc]
    cmp r0, #0x10
    blt .L_25c8
    ldr r0, [r5, #0x28]
    bl func_0207fce8
    ldr r0, [r5, #0x2c]
    bl func_0207fce8
    mov r0, #0xb
    str r0, [r5, #0x4]
    mov r0, #0x0
    str r0, [r5, #0xc]
    b .L_25c8
.L_2408:
    bl func_ov003_021cca88
    cmp r0, #0x0
    beq .L_25c8
    ldr r1, [r4, #0x4c]
    mov r0, r5
    mov r2, #0x1
    bl func_ov003_021cef78
    mov r0, #0xc
    str r0, [r5, #0x4]
    mov r0, #0x0
    str r0, [r5, #0xc]
    b .L_25c8
.L_2438:
    ldr r0, [r5, #0xc]
    add r0, r0, #0x1
    cmp r0, #0x10
    str r0, [r5, #0xc]
    cmpne r0, #0x20
    ldreq r0, [r5, #0x8]
    addeq r0, r0, #0x1
    streq r0, [r5, #0x8]
    ldr r0, [r5, #0x8]
    cmp r0, #0x2
    blt .L_25c8
    mov r0, #0xd
    str r0, [r5, #0x4]
    mov r0, #0x0
    str r0, [r5, #0xc]
    str r0, [r5, #0x8]
    b .L_25c8
.L_247c:
    ldr r0, [r5, #0xc]
    cmp r0, #0x0
    bne .L_24b4
    bl func_02034784
    cmp r0, #0x0
    moveq r0, #0x1
    streq r0, [r4, #0x5c]
    beq .L_24b4
    mov r3, #0x3
    add r1, sp, #0x0
    mov r0, #0x4
    mov r2, #0x2
    strh r3, [sp]
    bl func_02034888
.L_24b4:
    ldr r0, [r5, #0xc]
    cmp r0, #0x100
    movlt r1, #0x1
    ldr r0, [r5, #0xc]
    movge r1, #0x0
    add r0, r0, r1, lsl #0x2
    str r0, [r5, #0xc]
    cmp r0, #0x100
    blt .L_25c8
    ldr r0, [r4, #0x5c]
    cmp r0, #0x0
    beq .L_25c8
    mov r0, #0xe
    str r0, [r5, #0x4]
    mov r0, #0x0
    str r0, [r5, #0xc]
    b .L_25c8
.L_24f8:
    ldr r0, [r5, #0xc]
    cmp r0, #0x0
    bne .L_2518
    mov r0, #0x90
    sub r1, r0, #0x91
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
.L_2518:
    ldr r0, [r5, #0xc]
    ldr r1, [r5, #0xc]
    cmp r0, #0x20
    movlt r2, #0x1
    movge r2, #0x0
    add r2, r1, r2
    rsb r1, r2, #0x20
    ldr r0, _LIT8
    str r2, [r5, #0xc]
    mov r1, r1, asr #0x1
    bl func_0208c884
    ldr r1, [r5, #0xc]
    ldr r0, _LIT9
    rsb r1, r1, #0x20
    mov r1, r1, asr #0x1
    bl func_0208c884
    ldr r0, [r5, #0xc]
    cmp r0, #0x20
    blt .L_25c8
    ldr r0, _LIT8
    mov r1, #0x0
    bl func_0208c884
    ldr r0, _LIT9
    mov r1, #0x0
    bl func_0208c884
    mov r0, #0xf
    str r0, [r5, #0x4]
    mov r0, #0x0
    str r0, [r5, #0xc]
    b .L_25c8
.L_2590:
    ldr r0, [r5, #0xc]
    cmp r0, #0x40
    movlt r1, #0x1
    ldr r0, [r5, #0xc]
    movge r1, #0x0
    add r0, r0, r1
    str r0, [r5, #0xc]
    cmp r0, #0x40
    blt .L_25c8
    mov r0, #0x0
    str r0, [r5, #0xc]
    add sp, sp, #0x30
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_25c8:
    mov r0, #0x0
    add sp, sp, #0x30
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov003_021cf6c0
_LIT1: .word 0x000001ff
_LIT2: .word 0x04000014
_LIT3: .word 0x04001018
_LIT4: .word data_021040ac
_LIT5: .word data_ov003_021cf370
_LIT6: .word data_02104c40
_LIT7: .word 0x55555556
_LIT8: .word 0x0400006c
_LIT9: .word 0x0400106c
