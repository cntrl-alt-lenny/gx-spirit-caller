; func_ov002_022460f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cabbc
        .extern data_ov002_022cd314
        .extern data_ov002_022cd65c
        .extern data_ov002_022ce1a8
        .extern data_ov002_022d008c
        .extern func_ov002_0229cc78
        .extern func_ov002_0229cca8
        .global func_ov002_022460f0
        .arm
func_ov002_022460f0:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r4, r0
    mov r1, #0x0
    ldr r2, _LIT0
    strh r1, [r4]
    ldr r3, [r2, #0x5d4]
    cmp r3, #0x0
    beq .L_684
    ldrb r3, [r2, #0x5dc]
    ldr r2, [r2, #0x5fc]
    str r2, [sp]
    cmp r3, #0x21
    addls pc, pc, r3, lsl #0x2
    b .L_66c
    b .L_66c
    b .L_384
    b .L_390
    b .L_39c
    b .L_39c
    b .L_3cc
    b .L_3fc
    b .L_3fc
    b .L_3fc
    b .L_3fc
    b .L_3fc
    b .L_570
    b .L_57c
    b .L_524
    b .L_530
    b .L_53c
    b .L_588
    b .L_66c
    b .L_4cc
    b .L_50c
    b .L_518
    b .L_66c
    b .L_564
    b .L_3a8
    b .L_5b0
    b .L_5bc
    b .L_66c
    b .L_5e4
    b .L_630
    b .L_63c
    b .L_664
    b .L_3fc
    b .L_3fc
    b .L_3fc
.L_384:
    mov r1, #0x3e
    bl func_ov002_0229cc78
    b .L_66c
.L_390:
    mov r1, #0x3f
    bl func_ov002_0229cc78
    b .L_66c
.L_39c:
    mov r1, #0x40
    bl func_ov002_0229cc78
    b .L_66c
.L_3a8:
    ldr r2, _LIT1
    ldr r1, _LIT2
    ldr r2, [r2, #0xcec]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    beq .L_66c
    mov r1, #0x110
    bl func_ov002_0229cc78
    b .L_66c
.L_3cc:
    ldr r2, _LIT1
    ldr r1, _LIT2
    ldr r2, [r2, #0xcec]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    beq .L_3f0
    mov r1, #0xfb
    bl func_ov002_0229cc78
    b .L_66c
.L_3f0:
    mov r1, #0x43
    bl func_ov002_0229cc78
    b .L_66c
.L_3fc:
    cmp r3, #0x1f
    add r0, sp, #0x0
    bgt .L_448
    cmp r3, #0x1f
    bge .L_48c
    cmp r3, #0xa
    addls pc, pc, r3, lsl #0x2
    b .L_490
    b .L_490
    b .L_490
    b .L_490
    b .L_490
    b .L_490
    b .L_490
    b .L_464
    b .L_46c
    b .L_474
    b .L_47c
    b .L_484
.L_448:
    cmp r3, #0x20
    bgt .L_458
    moveq r1, #0xab
    b .L_490
.L_458:
    cmp r3, #0x21
    moveq r1, #0xad
    b .L_490
.L_464:
    mov r1, #0xfc
    b .L_490
.L_46c:
    mov r1, #0xfe
    b .L_490
.L_474:
    mov r1, #0x100
    b .L_490
.L_47c:
    mov r1, #0xaf
    b .L_490
.L_484:
    mov r1, #0x9f
    b .L_490
.L_48c:
    mov r1, #0xa9
.L_490:
    ldr r3, [r0]
    ldr r0, _LIT2
    mov r2, r3, lsl #0xf
    ldr ip, [r0, #0x4]
    mov r0, r2, lsr #0x1f
    mov r3, r3, lsl #0x16
    eor r2, ip, #0x1
    eor r0, r0, r3, lsr #0x1f
    cmp r2, r0
    moveq r2, #0x1
    movne r2, #0x0
    mov r0, r4
    add r1, r1, r2
    bl func_ov002_0229cc78
    b .L_66c
.L_4cc:
    cmp r2, #0x0
    beq .L_500
    ldr r0, _LIT2
    ldr r2, _LIT3
    ldr r0, [r0, #0x4]
    ldr r2, [r2]
    eor r0, r0, #0x1
    cmp r2, r0
    moveq r1, #0x1
    mov r0, r4
    add r1, r1, #0xb6
    bl func_ov002_0229cc78
    b .L_66c
.L_500:
    mov r1, #0x9a
    bl func_ov002_0229cc78
    b .L_66c
.L_50c:
    mov r1, #0xb5
    bl func_ov002_0229cc78
    b .L_66c
.L_518:
    mov r1, #0xb1
    bl func_ov002_0229cc78
    b .L_66c
.L_524:
    ldr r1, _LIT4
    bl func_ov002_0229cc78
    b .L_66c
.L_530:
    ldr r1, _LIT5
    bl func_ov002_0229cc78
    b .L_66c
.L_53c:
    ldr r0, _LIT2
    mov r2, r2, lsl #0xa
    ldr r0, [r0, #0x4]
    eor r0, r0, #0x1
    cmp r0, r2, lsr #0x1f
    moveq r1, #0x1
    mov r0, r4
    add r1, r1, #0xb9
    bl func_ov002_0229cc78
    b .L_66c
.L_564:
    mov r1, #0xb8
    bl func_ov002_0229cc78
    b .L_66c
.L_570:
    mov r1, #0xb2
    bl func_ov002_0229cc78
    b .L_66c
.L_57c:
    mov r1, #0xb3
    bl func_ov002_0229cc78
    b .L_66c
.L_588:
    ldr r0, _LIT2
    mov r2, r2, lsl #0xf
    ldr r0, [r0, #0x4]
    eor r0, r0, #0x1
    cmp r0, r2, lsr #0x1f
    moveq r1, #0x1
    mov r0, r4
    add r1, r1, #0xbd
    bl func_ov002_0229cc78
    b .L_66c
.L_5b0:
    mov r1, #0xc4
    bl func_ov002_0229cc78
    b .L_66c
.L_5bc:
    ldr r0, _LIT2
    mov r2, r2, lsl #0x16
    ldr r0, [r0, #0x4]
    eor r0, r0, #0x1
    cmp r0, r2, lsr #0x1f
    moveq r1, #0x1
    mov r0, r4
    add r1, r1, #0xc5
    bl func_ov002_0229cc78
    b .L_66c
.L_5e4:
    mov r1, r2, lsl #0x10
    movs r1, r1, lsr #0x1f
    beq .L_5fc
    ldr r1, _LIT6
    bl func_ov002_0229cc78
    b .L_66c
.L_5fc:
    mov r1, r2, lsl #0x9
    mov r1, r1, lsr #0x1c
    cmp r1, #0xb
    beq .L_618
    cmp r1, #0xe
    beq .L_624
    b .L_66c
.L_618:
    mov r1, #0xc7
    bl func_ov002_0229cc78
    b .L_66c
.L_624:
    mov r1, #0x10c
    bl func_ov002_0229cc78
    b .L_66c
.L_630:
    mov r1, #0xc8
    bl func_ov002_0229cc78
    b .L_66c
.L_63c:
    ldr r0, _LIT2
    mov r2, r2, lsl #0x16
    ldr r0, [r0, #0x4]
    eor r0, r0, #0x1
    cmp r0, r2, lsr #0x1f
    moveq r1, #0x1
    mov r0, r4
    add r1, r1, #0xc9
    bl func_ov002_0229cc78
    b .L_66c
.L_664:
    mov r1, #0xcb
    bl func_ov002_0229cc78
.L_66c:
    ldrh r0, [r4]
    cmp r0, #0x0
    beq .L_684
    ldr r1, _LIT7
    mov r0, r4
    bl func_ov002_0229cca8
.L_684:
    ldr r1, _LIT8
    mov r0, r4
    bl func_ov002_0229cca8
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022d008c
_LIT2: .word data_ov002_022cd65c
_LIT3: .word data_ov002_022cd314
_LIT4: .word 0x0000010a
_LIT5: .word 0x00000105
_LIT6: .word 0x0000010b
_LIT7: .word data_ov002_022cabbc
_LIT8: .word 0x0000010d
