; func_ov016_021b77cc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020b4728
        .extern data_02102c90
        .extern data_02104f4c
        .extern data_ov016_021b941c
        .extern data_ov016_021b9438
        .extern data_ov016_021b9784
        .extern data_ov016_021bb1b0
        .extern func_02001bc8
        .extern func_02001d0c
        .extern func_02005088
        .extern func_020054a4
        .extern func_02005800
        .extern func_02006c0c
        .extern func_02006e1c
        .extern func_0201d47c
        .extern func_0201e5b8
        .extern func_0202c0c0
        .extern func_0208df0c
        .extern func_0208e1cc
        .extern func_02094504
        .extern func_02094550
        .extern func_ov016_021b7718
        .extern func_ov016_021b83a0
        .extern func_ov016_021b8774
        .global func_ov016_021b77cc
        .arm
func_ov016_021b77cc:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x50
    mov sl, r0
    ldr r1, [sl, #0x1dc]
    mov r0, #0x54
    mul fp, r1, r0
    mov r2, #0x0
    ldr r0, _LIT0
    mov r1, r2
.L_24:
    str r1, [r0, r2, lsl #0x2]
    add r2, r2, #0x1
    cmp r2, #0x5
    blt .L_24
    ldr r2, _LIT1
    str r1, [sl, #0x1f0]
    ldrh r1, [r2]
    add r0, sp, #0x28
    and r1, r1, #0x43
    orr r1, r1, #0x384
    orr r1, r1, #0x4000
    strh r1, [r2]
    bl func_0201d47c
    ldr r0, _LIT2
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    str r0, [sp, #0x28]
    mov r0, #0x1ec0
    ldrh r1, [sp, #0x3c]
    str r0, [sp, #0x34]
    bic r0, r1, #0xf
    orr r0, r0, #0x2
    strh r0, [sp, #0x3c]
    ldr r0, [sp, #0x40]
    ldrh r1, [sp, #0x3c]
    bic r0, r0, #0x1c000
    orr r0, r0, #0x8000
    bic r0, r0, #0x7f
    orr r0, r0, #0xd
    bic r0, r0, #0x3f80
    orr r0, r0, #0x180
    str r0, [sp, #0x40]
    mov r0, #0x600
    orr r1, r1, #0x10
    strh r0, [sp, #0x38]
    add r0, sp, #0x28
    strh r1, [sp, #0x3c]
    bl func_0201e5b8
    ldr r1, [sp, #0x40]
    ldrh r2, [sp, #0x3e]
    bic r1, r1, #0x1c000
    orr r1, r1, #0x1c000
    bic r1, r1, #0x3f80
    orr r1, r1, #0x400
    orr r2, r2, #0x8000
    add r0, sp, #0x28
    str r1, [sp, #0x40]
    strh r2, [sp, #0x3e]
    bl func_0201e5b8
    ldr r1, [sp, #0x40]
    add r0, sp, #0x28
    bic r1, r1, #0x3f80
    orr r1, r1, #0x680
    str r1, [sp, #0x40]
    bl func_0201e5b8
    ldr r0, [sp, #0x28]
    bl func_02006e1c
    add r0, sp, #0x28
    bl func_0201d47c
    ldr r0, _LIT3
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    str r0, [sp, #0x28]
    ldrh r0, [sp, #0x3c]
    ldr r1, [sp, #0x40]
    mov r2, #0x600
    bic r0, r0, #0xf
    bic r1, r1, #0x7f
    orr r0, r0, #0x2
    orr r1, r1, #0x11
    strh r0, [sp, #0x3c]
    mov r0, #0x2b40
    str r0, [sp, #0x34]
    bic r0, r1, #0x1c000
    str r1, [sp, #0x40]
    ldrh r1, [sp, #0x3c]
    orr r0, r0, #0x1c000
    bic r0, r0, #0x3f80
    orr r3, r1, #0x10
    orr r1, r0, #0x900
    add r0, sp, #0x28
    strh r3, [sp, #0x3c]
    strh r2, [sp, #0x38]
    str r1, [sp, #0x40]
    bl func_0201e5b8
    ldr r0, [sp, #0x28]
    bl func_02006e1c
    mov r6, #0x0
.L_18c:
    cmp r6, #0x0
    beq .L_1b0
    cmp r6, #0x1
    beq .L_1c0
    cmp r6, #0x2
    ldreq r7, _LIT4
    moveq r8, #0xc
    moveq r5, #0x1f8
    b .L_1cc
.L_1b0:
    mov r7, #0x6f
    mov r8, #0xa
    mov r5, #0x1e0
    b .L_1cc
.L_1c0:
    ldr r7, _LIT5
    mov r8, #0xb
    mov r5, #0x1ec
.L_1cc:
    bl func_0208e1cc
    add r9, r0, r7, lsl #0x1
    ldr r0, _LIT6
    mov r1, #0x6
    mov r2, #0x2
    bl func_02001d0c
    bl func_0208df0c
    add r1, r0, r5, lsl #0x5
    mov r0, #0x0
    mov r2, #0x180
    bl func_02094504
    add r0, r8, #0xc2
    add r0, r0, #0x600
    bl func_0202c0c0
    mov r4, r0
    bl func_0208df0c
    add r2, r0, r5, lsl #0x5
    mov r0, #0x3
    str r0, [sp]
    mov r0, #0xa
    str r0, [sp, #0x4]
    ldr r0, _LIT6
    mov r1, r4
    mov r3, #0x2
    bl func_02005088
    mov r4, #0x0
    mov r2, r5
    mov r1, r4
.L_23c:
    mov r3, r1
.L_240:
    add ip, r2, #0x1
    mov r0, r3, lsl #0x1
    mov ip, ip, lsl #0x10
    orr r2, r2, #0x1000
    strh r2, [r9, r0]
    add r3, r3, #0x1
    mov r2, ip, lsr #0x10
    cmp r3, #0x6
    blt .L_240
    add r4, r4, #0x1
    cmp r4, #0x2
    add r9, r9, #0x40
    blt .L_23c
    add r6, r6, #0x1
    cmp r6, #0x3
    blt .L_18c
    ldr r0, _LIT7
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1d
    bne .L_344
    bl func_0208e1cc
    add r3, r0, #0xa4
    ldr r0, _LIT6
    mov r1, #0x7
    mov r2, #0x2
    add r4, r3, #0x400
    bl func_02001d0c
    bl func_0208df0c
    add r0, r0, #0xe80
    add r1, r0, #0x4000
    mov r0, #0x0
    mov r2, #0x1c0
    bl func_02094504
    ldr r0, _LIT8
    bl func_0202c0c0
    mov r5, r0
    bl func_0208df0c
    add r0, r0, #0xe80
    mov r3, #0x4
    add r2, r0, #0x4000
    str r3, [sp]
    mov r0, #0xa
    str r0, [sp, #0x4]
    ldr r0, _LIT6
    mov r1, r5
    bl func_02005088
    mov r6, #0x0
    mov r2, #0x274
    mov r3, r6
.L_308:
    mov r5, r3
.L_30c:
    add r0, r2, #0x1
    mov r1, r5, lsl #0x1
    orr r2, r2, #0x1000
    mov r0, r0, lsl #0x10
    add r5, r5, #0x1
    strh r2, [r4, r1]
    cmp r5, #0x7
    mov r2, r0, lsr #0x10
    blt .L_30c
    add r6, r6, #0x1
    cmp r6, #0x2
    add r4, r4, #0x40
    blt .L_308
    b .L_408
.L_344:
    bl func_0208e1cc
    add r3, r0, #0x9a
    ldr r0, _LIT6
    mov r1, #0xd
    mov r2, #0x2
    add r4, r3, #0x400
    bl func_02001d0c
    bl func_0208df0c
    add r0, r0, #0xe80
    add r1, r0, #0x4000
    mov r0, #0x0
    mov r2, #0x340
    bl func_02094504
    ldr r0, _LIT8
    bl func_0202c0c0
    mov r6, r0
    bl func_0208df0c
    mov r5, r0
    ldr r0, _LIT8
    bl func_0202c0c0
    mov r1, #0xa
    bl func_020054a4
    rsb r3, r0, #0x64
    mov r0, #0x4
    str r0, [sp]
    mov r0, #0xa
    add r2, r5, #0xe80
    str r0, [sp, #0x4]
    ldr r0, _LIT6
    mov r1, r6
    add r2, r2, #0x4000
    bl func_02005088
    mov r6, #0x0
    mov r2, #0x274
    mov r3, r6
.L_3d0:
    mov r5, r3
.L_3d4:
    add r0, r2, #0x1
    mov r1, r5, lsl #0x1
    orr r2, r2, #0x1000
    mov r0, r0, lsl #0x10
    add r5, r5, #0x1
    strh r2, [r4, r1]
    cmp r5, #0xd
    mov r2, r0, lsr #0x10
    blt .L_3d4
    add r6, r6, #0x1
    cmp r6, #0x2
    add r4, r4, #0x40
    blt .L_3d0
.L_408:
    bl func_0208e1cc
    add r0, r0, #0xb4
    mov r6, #0x0
    add r3, r0, #0x400
    mov r4, #0x2a8
    mov r2, r6
.L_420:
    mov r5, r2
.L_424:
    add r0, r4, #0x1
    mov r1, r5, lsl #0x1
    add r5, r5, #0x1
    mov r0, r0, lsl #0x10
    strh r4, [r3, r1]
    cmp r5, #0x4
    mov r4, r0, lsr #0x10
    blt .L_424
    add r6, r6, #0x1
    cmp r6, #0x2
    add r3, r3, #0x40
    blt .L_420
    ldr r0, _LIT7
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1d
    bne .L_518
    bl func_0208e1cc
    add r3, r0, #0x124
    ldr r0, _LIT6
    mov r1, #0x7
    mov r2, #0x2
    add r4, r3, #0x400
    bl func_02001d0c
    bl func_0208df0c
    add r0, r0, #0x11c0
    add r1, r0, #0x4000
    mov r0, #0x0
    mov r2, #0x1c0
    bl func_02094504
    ldr r0, _LIT9
    bl func_0202c0c0
    mov r5, r0
    bl func_0208df0c
    add r0, r0, #0x11c0
    mov r3, #0x4
    add r2, r0, #0x4000
    str r3, [sp]
    mov r0, #0xa
    str r0, [sp, #0x4]
    ldr r0, _LIT6
    mov r1, r5
    bl func_02005088
    mov r6, #0x0
    ldr r2, _LIT10
    mov r3, r6
.L_4dc:
    mov r5, r3
.L_4e0:
    add r0, r2, #0x1
    mov r1, r5, lsl #0x1
    orr r2, r2, #0x1000
    mov r0, r0, lsl #0x10
    add r5, r5, #0x1
    strh r2, [r4, r1]
    cmp r5, #0x7
    mov r2, r0, lsr #0x10
    blt .L_4e0
    add r6, r6, #0x1
    cmp r6, #0x2
    add r4, r4, #0x40
    blt .L_4dc
    b .L_5dc
.L_518:
    bl func_0208e1cc
    add r3, r0, #0x1a
    ldr r0, _LIT6
    mov r1, #0xd
    mov r2, #0x2
    add r4, r3, #0x500
    bl func_02001d0c
    bl func_0208df0c
    add r0, r0, #0x11c0
    add r1, r0, #0x4000
    mov r0, #0x0
    mov r2, #0x340
    bl func_02094504
    ldr r0, _LIT9
    bl func_0202c0c0
    mov r6, r0
    bl func_0208df0c
    mov r5, r0
    ldr r0, _LIT9
    bl func_0202c0c0
    mov r1, #0xa
    bl func_020054a4
    rsb r3, r0, #0x64
    mov r0, #0x4
    str r0, [sp]
    mov r0, #0xa
    add r2, r5, #0x11c0
    str r0, [sp, #0x4]
    ldr r0, _LIT6
    mov r1, r6
    add r2, r2, #0x4000
    bl func_02005088
    mov r6, #0x0
    ldr r2, _LIT10
    mov r3, r6
.L_5a4:
    mov r5, r3
.L_5a8:
    add r0, r2, #0x1
    mov r1, r5, lsl #0x1
    orr r2, r2, #0x1000
    mov r0, r0, lsl #0x10
    add r5, r5, #0x1
    strh r2, [r4, r1]
    cmp r5, #0xd
    mov r2, r0, lsr #0x10
    blt .L_5a8
    add r6, r6, #0x1
    cmp r6, #0x2
    add r4, r4, #0x40
    blt .L_5a4
.L_5dc:
    bl func_0208e1cc
    add r0, r0, #0x134
    mov r6, #0x0
    add r3, r0, #0x400
    mov r4, #0x2b0
    mov r2, r6
.L_5f4:
    mov r5, r2
.L_5f8:
    add r0, r4, #0x1
    mov r1, r5, lsl #0x1
    add r5, r5, #0x1
    mov r0, r0, lsl #0x10
    strh r4, [r3, r1]
    cmp r5, #0x4
    mov r4, r0, lsr #0x10
    blt .L_5f8
    add r6, r6, #0x1
    cmp r6, #0x2
    add r3, r3, #0x40
    blt .L_5f4
    ldr r0, _LIT11
    mov r1, #0x5000000
    mov r2, #0x20
    bl func_02094550
    ldr r1, _LIT12
    add r0, sp, #0x8
    mov r2, #0x0
    bl func_02001bc8
    ldr r1, _LIT13
    add r0, sp, #0x8
    mov r2, #0x20
    bl func_02094550
    bl func_0208e1cc
    mov r6, #0x0
    add r3, r0, #0x160
    mov r4, #0x204
    mov r2, r6
.L_66c:
    mov r5, r2
.L_670:
    add r0, r4, #0x1
    mov r1, r5, lsl #0x1
    add r5, r5, #0x1
    mov r0, r0, lsl #0x10
    strh r4, [r3, r1]
    cmp r5, #0x10
    mov r4, r0, lsr #0x10
    blt .L_670
    add r6, r6, #0x1
    cmp r6, #0x2
    add r3, r3, #0x40
    blt .L_66c
    bl func_0208e1cc
    add r0, r0, #0x9a
    mov r6, #0x0
    add r3, r0, #0x200
    mov r4, #0x224
    mov r2, r6
.L_6b8:
    mov r5, r2
.L_6bc:
    add r0, r4, #0x1
    mov r1, r5, lsl #0x1
    add r5, r5, #0x1
    mov r0, r0, lsl #0x10
    strh r4, [r3, r1]
    cmp r5, #0x14
    mov r4, r0, lsr #0x10
    blt .L_6bc
    add r6, r6, #0x1
    cmp r6, #0x2
    add r3, r3, #0x40
    blt .L_6b8
    bl func_0208e1cc
    add r0, r0, #0xda
    mov r6, #0x0
    add r3, r0, #0x300
    mov r4, #0x24c
    mov r2, r6
.L_704:
    mov r5, r2
.L_708:
    add r0, r4, #0x1
    mov r1, r5, lsl #0x1
    add r5, r5, #0x1
    mov r0, r0, lsl #0x10
    strh r4, [r3, r1]
    cmp r5, #0x14
    mov r4, r0, lsr #0x10
    blt .L_708
    add r6, r6, #0x1
    cmp r6, #0x2
    add r3, r3, #0x40
    blt .L_704
    ldr r1, _LIT14
    mov r0, sl
    add r1, r1, fp
    bl func_ov016_021b8774
    ldr r1, _LIT14
    mov r0, sl
    add r1, r1, fp
    bl func_ov016_021b83a0
    mvn r1, #0x9f
    mov r0, #0x60
    str r1, [sl, #0x1e0]
    str r0, [sl, #0x1e4]
    sub r0, r0, #0x138
    str r0, [sl, #0x1e8]
    mov r0, #0x40
    str r0, [sl, #0x1ec]
    mov r2, #0x4000000
    ldr r1, [r2]
    ldr r0, [r2]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0x16
    orr r1, r1, r0, lsl #0x8
    ldr r0, _LIT15
    str r1, [r2]
    bl func_02005800
    mov r0, #0x1
    add sp, sp, #0x50
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov016_021bb1b0
_LIT1: .word 0x0400000c
_LIT2: .word data_ov016_021b941c
_LIT3: .word data_ov016_021b9438
_LIT4: .word 0x000001af
_LIT5: .word 0x0000010f
_LIT6: .word data_02102c90
_LIT7: .word data_02104f4c
_LIT8: .word 0x000006c6
_LIT9: .word 0x000006c7
_LIT10: .word 0x0000028e
_LIT11: .word data_020b4728
_LIT12: .word 0x000003ff
_LIT13: .word 0x05000020
_LIT14: .word data_ov016_021b9784
_LIT15: .word func_ov016_021b7718
