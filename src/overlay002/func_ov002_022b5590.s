; func_ov002_022b5590 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern data_020e0e70
        .extern data_020e5c60
        .extern data_021040ac
        .extern data_02104f4c
        .extern data_ov002_022cccc0
        .extern data_ov002_022ccd24
        .extern data_ov002_022d1b7c
        .extern func_0201ab44
        .extern func_0201ab80
        .extern func_020211c8
        .extern func_0202147c
        .extern func_02022234
        .extern func_0202227c
        .extern func_ov002_022b9350
        .global func_ov002_022b5590
        .arm
func_ov002_022b5590:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r2, _LIT1
    mov r0, #0x0
    bl Fill32
    mov r0, #0x0
    str r0, [r4]
    str r0, [r4, #0x4]
    str r0, [r4, #0x8]
    str r0, [r4, #0xc]
    str r0, [r4, #0x10]
    mov r2, #0x4000000
    ldr r1, [r2]
    ldr r0, [r2]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0x1
    orr r1, r1, r0, lsl #0x8
    ldr r0, _LIT2
    str r1, [r2]
    bl func_020211c8
    str r0, [r4]
    bl func_0202147c
    ldr r0, _LIT3
    bl func_020211c8
    str r0, [r4, #0x4]
    bl func_0202147c
    ldr r0, _LIT4
    mov r6, #0x0
    ldr r7, [r0, #0xb84]
    ldr r1, _LIT5
    mov r3, r6
    mov r5, #0xc
.L_8c:
    mov r2, r3, lsl #0x2
    ldrsh r0, [r1, r2]
    cmp r7, r0
    ldreq r0, _LIT6
    ldreqsh r5, [r0, r2]
    beq .L_b0
    add r3, r3, #0x1
    cmp r3, #0x41
    blt .L_8c
.L_b0:
    sub r0, r5, #0xc
    cmp r0, #0x8
    addls pc, pc, r0, lsl #0x2
    b .L_f8
    b .L_f0
    b .L_f0
    b .L_f0
    b .L_f8
    b .L_f8
    b .L_f8
    b .L_e4
    b .L_e4
    b .L_e4
.L_e4:
    bl func_0201ab80
    mov r6, r0
    b .L_f8
.L_f0:
    bl func_0201ab44
    mov r6, r0
.L_f8:
    mov r1, r5
    mov r0, #0x6
    bl func_02022234
    mov r1, r6
    mov r0, #0x7
    bl func_02022234
    ldr r1, _LIT7
    mov r0, #0x4
    ldr r1, [r1, #0x4]
    mov r1, r1, lsl #0x1d
    mov r1, r1, lsr #0x1d
    bl func_02022234
    mov r8, #0x0
    add r7, r4, #0x14
    mov r6, r8
    mvn r5, #0x0
.L_138:
    strb r6, [r7]
    str r5, [r7, #0x20]
    mov r0, r8
    mov r1, r7
    str r6, [r7, #0x24]
    bl func_0202227c
    add r8, r8, #0x1
    cmp r8, #0x2e
    add r7, r7, #0x28
    blt .L_138
    mov r9, #0x0
    add r0, r4, #0x344
    add r8, r0, #0x400
    mov r7, r9
    mvn r6, #0x0
    mov r5, r9
.L_178:
    strb r7, [r8]
    str r6, [r8, #0x20]
    mov r1, r8
    add r0, r9, #0x2e
    str r7, [r8, #0x24]
    bl func_0202227c
    add r0, r4, r9, lsl #0x5
    add r9, r9, #0x1
    strb r5, [r0, #0xadc]
    cmp r9, #0xa
    add r8, r8, #0x28
    blt .L_178
    add r0, r4, #0xd4
    add r8, r0, #0x800
    mov r7, #0x0
    mvn r6, #0x0
.L_1b8:
    strb r7, [r8]
    str r6, [r8, #0x20]
    mov r1, r8
    add r0, r5, #0x38
    str r7, [r8, #0x24]
    bl func_0202227c
    add r5, r5, #0x1
    cmp r5, #0x2
    add r8, r8, #0x28
    blt .L_1b8
    add r0, r4, #0x124
    mov r8, #0x0
    add r7, r0, #0x800
    mov r6, r8
    mvn r5, #0x0
.L_1f4:
    strb r6, [r7]
    str r5, [r7, #0x20]
    mov r1, r7
    add r0, r8, #0x3a
    str r6, [r7, #0x24]
    bl func_0202227c
    add r8, r8, #0x1
    cmp r8, #0x6
    add r7, r7, #0x28
    blt .L_1f4
    add r0, r4, #0x214
    mov r8, #0x0
    add r7, r0, #0x800
    mov r6, r8
    mvn r5, #0x0
.L_230:
    strb r6, [r7]
    str r5, [r7, #0x20]
    mov r1, r7
    add r0, r8, #0x40
    str r6, [r7, #0x24]
    bl func_0202227c
    add r8, r8, #0x1
    cmp r8, #0x3
    add r7, r7, #0x28
    blt .L_230
    add r0, r4, #0x28c
    mov r8, #0x0
    add r7, r0, #0x800
    mov r6, r8
    mvn r5, #0x0
.L_26c:
    strb r6, [r7]
    str r5, [r7, #0x20]
    mov r1, r7
    add r0, r8, #0x43
    str r6, [r7, #0x24]
    bl func_0202227c
    add r8, r8, #0x1
    cmp r8, #0x2
    add r7, r7, #0x28
    blt .L_26c
    mov r2, #0x0
    mvn r1, #0x0
.L_29c:
    add r0, r4, r2, lsl #0x2
    str r1, [r0, #0xc1c]
    add r2, r2, #0x1
    str r1, [r0, #0xc28]
    cmp r2, #0x3
    blt .L_29c
    str r1, [r4, #0xc34]
    str r1, [r4, #0xc38]
    mov r2, #0x0
    str r2, [r4, #0xc3c]
    str r2, [r4, #0xc44]
    mov r0, #0x1
    str r0, [r4, #0xc48]
    str r2, [r4, #0xc4c]
    str r2, [r4, #0xc54]
    str r2, [r4, #0xc58]
    str r1, [r4, #0xc5c]
    str r2, [r4, #0xc60]
    str r2, [r4, #0xc64]
    add r3, r4, #0xc00
    ldrh r5, [r3, #0x70]
    add r0, r4, #0x74
    add r1, r4, #0x78
    bic r5, r5, #0x1
    strh r5, [r3, #0x70]
    ldrh r5, [r3, #0x70]
    add r0, r0, #0xc00
    add r1, r1, #0xc00
    bic r5, r5, #0x3e
    orr r5, r5, #0x3e
    strh r5, [r3, #0x70]
.L_318:
    ldrh r5, [r0]
    mov r3, r2, lsl #0x10
    mov r3, r3, lsr #0x10
    bic r6, r5, #0x1
    and r5, r3, #0x1
    orr r3, r6, r5
    strh r3, [r0]
    ldrh r3, [r0]
    add r2, r2, #0x1
    cmp r2, #0x2
    bic r3, r3, #0x3e
    orr r3, r3, #0x3e
    strh r3, [r0], #0x2
    ldrh r3, [r1]
    bic r3, r3, #0x1
    orr r3, r3, r5
    strh r3, [r1]
    ldrh r3, [r1]
    bic r3, r3, #0x3e
    orr r3, r3, #0x3e
    strh r3, [r1], #0x2
    blt .L_318
    mov r2, #0x0
    str r2, [r4, #0xca4]
    str r2, [r4, #0xca8]
    str r2, [r4, #0xcac]
    mov r1, r2
.L_384:
    add r0, r4, r2, lsl #0x2
    add r2, r2, #0x1
    str r1, [r0, #0xcb0]
    cmp r2, #0x5
    blt .L_384
    str r1, [r4, #0xcc4]
    mov r0, r4
    str r1, [r4, #0xd10]
    bl func_ov002_022b9350
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022d1b7c
_LIT1: .word 0x00000d74
_LIT2: .word data_020e0e70
_LIT3: .word data_020e5c60
_LIT4: .word data_021040ac
_LIT5: .word data_ov002_022cccc0+0x62
_LIT6: .word data_ov002_022ccd24
_LIT7: .word data_02104f4c
