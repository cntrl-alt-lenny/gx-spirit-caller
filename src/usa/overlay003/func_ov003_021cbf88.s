; func_ov003_021cbf88 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103fcc
        .extern data_02104b60
        .extern data_ov003_021cf230
        .extern data_ov003_021cf580
        .extern func_02006bf0
        .extern func_02006e00
        .extern func_0201d428
        .extern func_0201e564
        .extern func_02034734
        .extern func_02034838
        .extern func_020371b8
        .extern func_0207fc00
        .extern func_0208c79c
        .extern func_020a9828
        .extern func_ov003_021cc768
        .extern func_ov003_021cc94c
        .extern func_ov003_021cee3c
        .global func_ov003_021cbf88
        .arm
func_ov003_021cbf88:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x30
    mov r5, r0
    ldr r1, [r5, #0x4]
    ldr r4, _LIT0
    cmp r1, #0xf
    addls pc, pc, r1, lsl #0x2
    b .L_2560
    b .L_1e14
    b .L_1efc
    b .L_1fe4
    b .L_200c
    b .L_2040
    b .L_20a4
    b .L_2100
    b .L_2218
    b .L_22c8
    b .L_2320
    b .L_2358
    b .L_23a0
    b .L_23d0
    b .L_2414
    b .L_2490
    b .L_2528
.L_1e14:
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
    blt .L_2560
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
    b .L_2560
.L_1efc:
    ldr r0, _LIT4
    ldr r0, [r0, #0xc48]
    cmp r0, #0x3
    beq .L_1f18
    cmp r0, #0x4
    beq .L_1f2c
    b .L_1f40
.L_1f18:
    mov r0, #0x1
    str r0, [r4, #0x50]
    mov r0, #0xa
    str r0, [r5, #0x4]
    b .L_1f48
.L_1f2c:
    mvn r0, #0x0
    str r0, [r4, #0x50]
    mov r0, #0xa
    str r0, [r5, #0x4]
    b .L_1f48
.L_1f40:
    mov r0, #0x2
    str r0, [r5, #0x4]
.L_1f48:
    add r0, sp, #0x8
    bl func_0201d428
    ldr r0, _LIT5
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
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
    beq .L_1fa4
    ldrh r1, [sp, #0x1c]
    add r0, sp, #0x8
    bic r1, r1, #0xf
    orr r1, r1, #0x6
    strh r1, [sp, #0x1c]
    bl func_0201e564
.L_1fa4:
    ldr r0, _LIT4
    ldr r1, _LIT6
    ldr r0, [r0, #0xc3c]
    rsb r0, r0, #0x1
    ldr r0, [r1, r0, lsl #0x2]
    cmp r0, #0x0
    beq .L_2560
    ldrh r1, [sp, #0x1c]
    add r0, sp, #0x8
    bic r1, r1, #0xf
    orr r1, r1, #0x1
    strh r1, [sp, #0x1c]
    bl func_0201e564
    ldr r0, [sp, #0x8]
    bl func_02006e00
    b .L_2560
.L_1fe4:
    ldr r0, [r5, #0xc]
    add r0, r0, #0x1
    str r0, [r5, #0xc]
    cmp r0, #0x10
    blt .L_2560
    mov r0, #0x3
    str r0, [r5, #0x4]
    mov r0, #0x0
    str r0, [r5, #0xc]
    b .L_2560
.L_200c:
    bl func_ov003_021cc768
    cmp r0, #0x0
    beq .L_2560
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    mov r0, #0x4
    str r0, [r5, #0x4]
    mov r0, #0x0
    str r0, [r5, #0xc]
    b .L_2560
.L_2040:
    ldr r0, [r5, #0xc]
    cmp r0, #0x100
    movlt r1, #0x1
    ldr r0, [r5, #0xc]
    movge r1, #0x0
    add r0, r0, r1, lsl #0x3
    str r0, [r5, #0xc]
    cmp r0, #0x100
    blt .L_2560
    bl func_02034734
    cmp r0, #0x0
    beq .L_2090
    ldr r3, [r4, #0x44]
    mov r0, #0x4
    mov r4, #0x0
    add r1, sp, #0x2
    mov r2, r0
    strh r4, [sp, #0x2]
    strh r3, [sp, #0x4]
    bl func_02034838
.L_2090:
    mov r0, #0x5
    str r0, [r5, #0x4]
    mov r0, #0x0
    str r0, [r5, #0xc]
    b .L_2560
.L_20a4:
    bl func_02034734
    cmp r0, #0x0
    beq .L_20bc
    ldr r0, [r4, #0x54]
    cmp r0, #0x0
    beq .L_2560
.L_20bc:
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
    blt .L_2560
    mov r0, #0x6
    str r0, [r5, #0x4]
    mov r0, #0x0
    str r0, [r5, #0xc]
    str r0, [r5, #0x8]
    b .L_2560
.L_2100:
    ldr r0, [r5, #0xc]
    cmp r0, #0x0
    bne .L_21c4
    bl func_02034734
    cmp r0, #0x0
    beq .L_2128
    ldr r0, [r4, #0x54]
    cmp r0, #0x0
    beq .L_2560
    b .L_2174
.L_2128:
    bl func_020a9828
    ldr r2, _LIT7
    mov r3, #0x3
    smull r1, ip, r2, r0
    add ip, ip, r0, lsr #0x1f
    smull r1, r2, r3, ip
    sub ip, r0, r1
    ldr r0, [r4, #0x44]
    str ip, [r4, #0x48]
    cmp r0, ip
    bne .L_2174
    bl func_020a9828
    ldr r2, _LIT7
    mov r3, #0x3
    smull r1, ip, r2, r0
    add ip, ip, r0, lsr #0x1f
    smull r1, r2, r3, ip
    sub ip, r0, r1
    str ip, [r4, #0x48]
.L_2174:
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
    bl func_0207fc00
.L_21c4:
    ldr r0, [r5, #0xc]
    cmp r0, #0x100
    movlt r1, #0x1
    ldr r0, [r5, #0xc]
    movge r1, #0x0
    add r0, r0, r1, lsl #0x3
    str r0, [r5, #0xc]
    cmp r0, #0x100
    blt .L_2560
    mov r6, #0x0
    str r6, [r4, #0x54]
    mov r0, #0x7
    str r0, [r5, #0x4]
    str r6, [r5, #0xc]
.L_21fc:
    ldr r0, [r5, #0xc0]
    bl func_0207fc00
    add r6, r6, #0x1
    cmp r6, #0x2
    add r5, r5, #0x6c
    blt .L_21fc
    b .L_2560
.L_2218:
    ldr r0, [r5, #0xc]
    cmp r0, #0x0
    bne .L_2244
    ldr r0, [r4, #0x50]
    cmp r0, #0x0
    beq .L_2244
    mov r0, #0x37
    sub r1, r0, #0x38
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
.L_2244:
    ldr r0, [r5, #0xc]
    cmp r0, #0x100
    movlt r1, #0x1
    ldr r0, [r5, #0xc]
    movge r1, #0x0
    add r0, r0, r1, lsl #0x3
    str r0, [r5, #0xc]
    cmp r0, #0x100
    blt .L_2560
    ldr r1, [r4, #0x50]
    mvn r0, #0x0
    cmp r1, r0
    beq .L_22ac
    cmp r1, #0x0
    beq .L_228c
    cmp r1, #0x1
    beq .L_22ac
    b .L_22bc
.L_228c:
    mov r0, #0x8
    str r0, [r5, #0x4]
    ldr r0, [r4, #0x48]
    add r0, r0, #0x7
    add r0, r5, r0, lsl #0x2
    ldr r0, [r0, #0x160]
    bl func_0207fc00
    b .L_22bc
.L_22ac:
    mov r0, #0x9
    str r0, [r5, #0x4]
    mov r0, #0x0
    str r0, [r5, #0x10]
.L_22bc:
    mov r0, #0x0
    str r0, [r5, #0xc]
    b .L_2560
.L_22c8:
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
    blt .L_2560
    ldr r0, [r5, #0x28]
    bl func_0207fc00
    ldr r0, [r5, #0x2c]
    bl func_0207fc00
    mov r0, #0x3
    str r0, [r5, #0x4]
    mov r0, #0x0
    str r0, [r5, #0xc]
    str r0, [r5, #0x8]
    b .L_2560
.L_2320:
    ldr r0, [r5, #0xc]
    cmp r0, #0x10
    movlt r1, #0x1
    ldr r0, [r5, #0xc]
    movge r1, #0x0
    add r0, r0, r1
    str r0, [r5, #0xc]
    cmp r0, #0x10
    blt .L_2560
    mov r0, #0xa
    str r0, [r5, #0x4]
    mov r0, #0x0
    str r0, [r5, #0xc]
    b .L_2560
.L_2358:
    ldr r0, [r5, #0xc]
    cmp r0, #0x10
    movlt r1, #0x1
    ldr r0, [r5, #0xc]
    movge r1, #0x0
    add r0, r0, r1
    str r0, [r5, #0xc]
    cmp r0, #0x10
    blt .L_2560
    ldr r0, [r5, #0x28]
    bl func_0207fc00
    ldr r0, [r5, #0x2c]
    bl func_0207fc00
    mov r0, #0xb
    str r0, [r5, #0x4]
    mov r0, #0x0
    str r0, [r5, #0xc]
    b .L_2560
.L_23a0:
    bl func_ov003_021cc94c
    cmp r0, #0x0
    beq .L_2560
    ldr r1, [r4, #0x4c]
    mov r0, r5
    mov r2, #0x1
    bl func_ov003_021cee3c
    mov r0, #0xc
    str r0, [r5, #0x4]
    mov r0, #0x0
    str r0, [r5, #0xc]
    b .L_2560
.L_23d0:
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
    blt .L_2560
    mov r0, #0xd
    str r0, [r5, #0x4]
    mov r0, #0x0
    str r0, [r5, #0xc]
    str r0, [r5, #0x8]
    b .L_2560
.L_2414:
    ldr r0, [r5, #0xc]
    cmp r0, #0x0
    bne .L_244c
    bl func_02034734
    cmp r0, #0x0
    moveq r0, #0x1
    streq r0, [r4, #0x5c]
    beq .L_244c
    mov r3, #0x3
    add r1, sp, #0x0
    mov r0, #0x4
    mov r2, #0x2
    strh r3, [sp]
    bl func_02034838
.L_244c:
    ldr r0, [r5, #0xc]
    cmp r0, #0x100
    movlt r1, #0x1
    ldr r0, [r5, #0xc]
    movge r1, #0x0
    add r0, r0, r1, lsl #0x2
    str r0, [r5, #0xc]
    cmp r0, #0x100
    blt .L_2560
    ldr r0, [r4, #0x5c]
    cmp r0, #0x0
    beq .L_2560
    mov r0, #0xe
    str r0, [r5, #0x4]
    mov r0, #0x0
    str r0, [r5, #0xc]
    b .L_2560
.L_2490:
    ldr r0, [r5, #0xc]
    cmp r0, #0x0
    bne .L_24b0
    mov r0, #0x90
    sub r1, r0, #0x91
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
.L_24b0:
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
    bl func_0208c79c
    ldr r1, [r5, #0xc]
    ldr r0, _LIT9
    rsb r1, r1, #0x20
    mov r1, r1, asr #0x1
    bl func_0208c79c
    ldr r0, [r5, #0xc]
    cmp r0, #0x20
    blt .L_2560
    ldr r0, _LIT8
    mov r1, #0x0
    bl func_0208c79c
    ldr r0, _LIT9
    mov r1, #0x0
    bl func_0208c79c
    mov r0, #0xf
    str r0, [r5, #0x4]
    mov r0, #0x0
    str r0, [r5, #0xc]
    b .L_2560
.L_2528:
    ldr r0, [r5, #0xc]
    cmp r0, #0x40
    movlt r1, #0x1
    ldr r0, [r5, #0xc]
    movge r1, #0x0
    add r0, r0, r1
    str r0, [r5, #0xc]
    cmp r0, #0x40
    blt .L_2560
    mov r0, #0x0
    str r0, [r5, #0xc]
    add sp, sp, #0x30
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_2560:
    mov r0, #0x0
    add sp, sp, #0x30
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov003_021cf580
_LIT1: .word 0x000001ff
_LIT2: .word 0x04000014
_LIT3: .word 0x04001018
_LIT4: .word data_02103fcc
_LIT5: .word data_ov003_021cf230
_LIT6: .word data_02104b60
_LIT7: .word 0x55555556
_LIT8: .word 0x0400006c
_LIT9: .word 0x0400106c
