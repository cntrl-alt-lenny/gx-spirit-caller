; func_ov002_0228300c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022d0254
        .extern func_0202b890
        .extern func_ov002_021b00d0
        .extern func_ov002_02280c40
        .global func_ov002_0228300c
        .arm
func_ov002_0228300c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xf8
    mov r3, r2, lsl #0x10
    mov r4, r3, lsr #0x10
    ldr r3, _LIT0
    mov r4, r4, asr #0x8
    mov sl, r0
    cmp r1, r3
    and r5, r2, #0xff
    and r6, r4, #0xff
    mvn r8, #0x0
    mov r9, #0x0
    bne .L_748
    ldr fp, _LIT1
    mov r7, #0x1
    ldr r0, _LIT2
    ldr r1, _LIT2
    add r0, r0, #0xe
    str r0, [sp, #0x20]
    ldr r0, _LIT3
    sub lr, r1, #0xb0
    add r1, r1, #0xe
    add r0, r0, #0x2
    str r1, [sp, #0x1c]
    ldr r1, _LIT2
    str r0, [sp, #0xc]
    ldr r0, _LIT3
    add r1, r1, #0xba
    sub r0, r0, #0x5
    str r1, [sp, #0x28]
    ldr r1, _LIT2
    str r0, [sp, #0x10]
    ldr r0, _LIT3
    add r1, r1, #0xbb
    add r0, r0, #0x11
    str r1, [sp, #0x30]
    ldr r1, _LIT2
    str r0, [sp, #0x18]
    ldr r0, _LIT3
    add r1, r1, #0x170
    add r0, r0, #0xab
    str r1, [sp, #0x40]
    sub r1, r3, #0x388
    str r0, [sp, #0xf4]
    ldr r0, _LIT3
    str r1, [sp, #0x44]
    sub r1, r3, #0x77
    str r1, [sp, #0x4c]
    ldr r1, _LIT3
    add r0, r0, #0x2
    str r0, [sp, #0x8]
    ldr r0, _LIT3
    rsb r1, r1, #0x2840
    str r1, [sp, #0x38]
    ldr r1, _LIT2
    add r0, r0, #0x11
    str r0, [sp, #0x14]
    ldr r0, _LIT2
    add r1, r1, #0x170
    str r1, [sp, #0x3c]
    sub r1, r3, #0x77
    add r0, r0, #0x7
    str r1, [sp, #0x48]
    sub r1, r3, #0x74
    str r0, [sp, #0x24]
    ldr r0, _LIT2
    str r1, [sp, #0x50]
    add r1, r3, #0xc2
    str r1, [sp, #0x60]
    add r1, r3, #0xce
    add r0, r0, #0xba
    str r1, [sp, #0x58]
    add r1, r3, #0xc2
    str r0, [sp, #0x2c]
    str r1, [sp, #0x5c]
    add r1, r3, #0xc4
    sub r0, r3, #0x394
    add r3, r3, #0x30c
    str r3, [sp, #0xdc]
    ldr r3, _LIT4
    ldr r4, _LIT5
    sub r3, r3, #0xbf
    str r3, [sp, #0x34]
    ldr r3, _LIT4
    sub r4, r4, #0xc2
    sub r3, r3, #0x39
    str r3, [sp, #0x54]
    ldr r3, _LIT4
    str r4, [sp, #0x78]
    add r3, r3, #0x1
    str r3, [sp, #0x74]
    ldr r3, _LIT4
    ldr r4, _LIT5
    add r3, r3, #0x3b
    str r3, [sp, #0x84]
    ldr r3, _LIT4
    sub r4, r4, #0x3c
    add r3, r3, #0x3a
    str r3, [sp, #0x88]
    ldr r3, _LIT4
    str r4, [sp, #0xb8]
    add r3, r3, #0x66
    str r3, [sp, #0x90]
    ldr r3, _LIT4
    ldr r4, _LIT5
    add r3, r3, #0x3b
    str r3, [sp, #0x80]
    ldr r3, _LIT4
    add r4, r4, #0x3
    add r3, r3, #0x66
    str r3, [sp, #0x8c]
    ldr r3, _LIT4
    str r4, [sp, #0xe4]
    add r3, r3, #0x99
    str r3, [sp, #0x94]
    ldr r3, _LIT4
    ldr r4, _LIT5
    add r3, r3, #0x9b
    str r3, [sp, #0xa0]
    ldr r3, _LIT4
    add r4, r4, #0x1
    add r3, r3, #0x9c
    str r3, [sp, #0xa4]
    ldr r3, _LIT6
    str r4, [sp, #0xe8]
    sub r3, r3, #0x66
    str r3, [sp, #0x98]
    ldr r3, _LIT6
    ldr r4, _LIT5
    sub r3, r3, #0x1
    str r3, [sp, #0xa8]
    ldr r3, _LIT6
    sub r4, r4, #0x16c
    add r3, r3, #0x1
    str r3, [sp, #0xb0]
    ldr r3, _LIT6
    str r4, [sp, #0x9c]
    add r3, r3, #0x43
    str r3, [sp, #0x7c]
    ldr r3, _LIT6
    ldr r4, _LIT4
    add r3, r3, #0x1
    str r3, [sp, #0xac]
    ldr r3, _LIT6
    str r1, [sp, #0x6c]
    add r3, r3, #0x2
    str r3, [sp, #0xb4]
    ldr r3, _LIT6
    ldr r1, _LIT2
    add r3, r3, #0x45
    str r3, [sp, #0xc4]
    ldr r3, _LIT6
    sub r4, r4, #0x43
    add r3, r3, #0x44
    str r3, [sp, #0xc8]
    ldr r3, _LIT6
    add r1, r1, #0x5b0
    add r3, r3, #0x46
    str r3, [sp, #0xd0]
    ldr r3, _LIT6
    str r4, [sp, #0x68]
    add r3, r3, #0xc9
    str r3, [sp, #0xbc]
    ldr r3, _LIT6
    ldr r4, _LIT6
    add r3, r3, #0x45
    str r3, [sp, #0xc0]
    ldr r3, _LIT6
    str r1, [sp, #0x70]
    add r3, r3, #0x46
    str r3, [sp, #0xcc]
    ldr r3, _LIT6
    ldr r1, _LIT4
    add r3, r3, #0xc8
    str r3, [sp, #0xd4]
    ldr r3, _LIT5
    sub r4, r4, #0x144
    sub r3, r3, #0x2
    str r3, [sp, #0xd8]
    ldr r3, _LIT5
    add r2, r1, #0x4
    sub r3, r3, #0x1
    str r3, [sp, #0xe0]
    ldr r3, _LIT5
    mov r1, r0
    add r3, r3, #0x1
    str r3, [sp, #0xec]
    ldr r3, _LIT5
    str r4, [sp, #0x64]
    add r3, r3, #0x3
    str r3, [sp, #0xf0]
    ldr r3, _LIT6
    sub r3, r3, #0xfe
.L_304:
    and r4, r7, #0x1
    cmp r4, sl
    bne .L_738
    ldrh r4, [fp]
    mov r4, r4, lsl #0x13
    cmp r3, r4, lsr #0x13
    mov r4, r4, lsr #0x13
    blt .L_514
    cmp r4, r2
    bge .L_72c
    cmp r4, r1
    bgt .L_41c
    cmp r4, r0
    bge .L_720
    cmp r4, lr
    bgt .L_3b4
    ldr ip, [sp, #0xf4]
    cmp r4, ip
    bge .L_72c
    ldr ip, [sp, #0x8]
    cmp r4, ip
    bgt .L_38c
    ldr ip, _LIT3
    cmp r4, ip
    blt .L_37c
    beq .L_6f0
    ldr ip, [sp, #0xc]
    cmp r4, ip
    beq .L_708
    b .L_738
.L_37c:
    ldr ip, [sp, #0x10]
    cmp r4, ip
    beq .L_6fc
    b .L_738
.L_38c:
    ldr ip, [sp, #0x14]
    cmp r4, ip
    bgt .L_3a8
    ldr ip, [sp, #0x18]
    cmp r4, ip
    beq .L_720
    b .L_738
.L_3a8:
    cmp r4, #0x1140
    beq .L_6fc
    b .L_738
.L_3b4:
    ldr ip, [sp, #0x1c]
    cmp r4, ip
    bgt .L_3f0
    ldr ip, [sp, #0x20]
    cmp r4, ip
    bge .L_6f0
    ldr ip, _LIT2
    cmp r4, ip
    bgt .L_3e0
    beq .L_714
    b .L_738
.L_3e0:
    ldr ip, [sp, #0x24]
    cmp r4, ip
    beq .L_6fc
    b .L_738
.L_3f0:
    ldr ip, [sp, #0x28]
    cmp r4, ip
    bgt .L_40c
    ldr ip, [sp, #0x2c]
    cmp r4, ip
    beq .L_714
    b .L_738
.L_40c:
    ldr ip, [sp, #0x30]
    cmp r4, ip
    beq .L_72c
    b .L_738
.L_41c:
    ldr ip, [sp, #0x34]
    cmp r4, ip
    bgt .L_488
    ldr ip, [sp, #0x38]
    cmp r4, ip
    bge .L_6f0
    ldr ip, [sp, #0x3c]
    cmp r4, ip
    bgt .L_45c
    ldr ip, [sp, #0x40]
    cmp r4, ip
    bge .L_6f0
    ldr ip, [sp, #0x44]
    cmp r4, ip
    beq .L_6fc
    b .L_738
.L_45c:
    ldr ip, [sp, #0x48]
    cmp r4, ip
    bgt .L_478
    ldr ip, [sp, #0x4c]
    cmp r4, ip
    beq .L_6f0
    b .L_738
.L_478:
    ldr ip, [sp, #0x50]
    cmp r4, ip
    beq .L_708
    b .L_738
.L_488:
    ldr ip, [sp, #0x54]
    cmp r4, ip
    bgt .L_4f0
    ldr ip, [sp, #0x58]
    cmp r4, ip
    bge .L_6f0
    ldr ip, [sp, #0x5c]
    cmp r4, ip
    bgt .L_4bc
    ldr ip, [sp, #0x60]
    cmp r4, ip
    beq .L_714
    b .L_738
.L_4bc:
    ldr ip, [sp, #0x64]
    cmp r4, ip
    bgt .L_738
    ldr ip, [sp, #0x68]
    cmp r4, ip
    blt .L_738
    ldr ip, [sp, #0x6c]
    cmp r4, ip
    beq .L_714
    ldr ip, [sp, #0x70]
    cmp r4, ip
    beq .L_720
    b .L_738
.L_4f0:
    ldr ip, _LIT4
    cmp r4, ip
    bgt .L_504
    beq .L_72c
    b .L_738
.L_504:
    ldr ip, [sp, #0x74]
    cmp r4, ip
    beq .L_714
    b .L_738
.L_514:
    ldr ip, [sp, #0x78]
    cmp r4, ip
    bgt .L_60c
    ldr ip, [sp, #0x7c]
    cmp r4, ip
    bge .L_720
    cmp r4, #0x18c0
    bgt .L_58c
    bge .L_708
    ldr ip, [sp, #0x80]
    cmp r4, ip
    bgt .L_560
    ldr ip, [sp, #0x84]
    cmp r4, ip
    bge .L_720
    ldr ip, [sp, #0x88]
    cmp r4, ip
    beq .L_714
    b .L_738
.L_560:
    ldr ip, [sp, #0x8c]
    cmp r4, ip
    bgt .L_57c
    ldr ip, [sp, #0x90]
    cmp r4, ip
    beq .L_6fc
    b .L_738
.L_57c:
    ldr ip, [sp, #0x94]
    cmp r4, ip
    beq .L_720
    b .L_738
.L_58c:
    ldr ip, _LIT6
    cmp r4, ip
    bgt .L_5e0
    bge .L_708
    ldr ip, [sp, #0x98]
    cmp r4, ip
    bgt .L_5d0
    ldr ip, [sp, #0x9c]
    cmp r4, ip
    blt .L_738
    ldr ip, [sp, #0xa0]
    cmp r4, ip
    beq .L_714
    ldr ip, [sp, #0xa4]
    cmp r4, ip
    beq .L_72c
    b .L_738
.L_5d0:
    ldr ip, [sp, #0xa8]
    cmp r4, ip
    beq .L_720
    b .L_738
.L_5e0:
    ldr ip, [sp, #0xac]
    cmp r4, ip
    bgt .L_5fc
    ldr ip, [sp, #0xb0]
    cmp r4, ip
    beq .L_714
    b .L_738
.L_5fc:
    ldr ip, [sp, #0xb4]
    cmp r4, ip
    beq .L_72c
    b .L_738
.L_60c:
    ldr ip, [sp, #0xb8]
    cmp r4, ip
    bgt .L_678
    ldr ip, [sp, #0xbc]
    cmp r4, ip
    bge .L_720
    ldr ip, [sp, #0xc0]
    cmp r4, ip
    bgt .L_64c
    ldr ip, [sp, #0xc4]
    cmp r4, ip
    bge .L_714
    ldr ip, [sp, #0xc8]
    cmp r4, ip
    beq .L_708
    b .L_738
.L_64c:
    ldr ip, [sp, #0xcc]
    cmp r4, ip
    bgt .L_668
    ldr ip, [sp, #0xd0]
    cmp r4, ip
    beq .L_72c
    b .L_738
.L_668:
    ldr ip, [sp, #0xd4]
    cmp r4, ip
    beq .L_720
    b .L_738
.L_678:
    ldr ip, _LIT5
    cmp r4, ip
    bgt .L_6b4
    bge .L_714
    ldr ip, [sp, #0xd8]
    cmp r4, ip
    bgt .L_6a4
    ldr ip, [sp, #0xdc]
    cmp r4, ip
    beq .L_720
    b .L_738
.L_6a4:
    ldr ip, [sp, #0xe0]
    cmp r4, ip
    beq .L_708
    b .L_738
.L_6b4:
    ldr ip, [sp, #0xe4]
    cmp r4, ip
    bgt .L_6e4
    ldr ip, [sp, #0xe8]
    cmp r4, ip
    blt .L_738
    ldr ip, [sp, #0xec]
    cmp r4, ip
    ldrne ip, [sp, #0xf0]
    cmpne r4, ip
    beq .L_72c
    b .L_738
.L_6e4:
    cmp r4, #0x1a40
    beq .L_72c
    b .L_738
.L_6f0:
    add sp, sp, #0xf8
    mov r0, #0x2
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_6fc:
    add sp, sp, #0xf8
    mov r0, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_708:
    add sp, sp, #0xf8
    mov r0, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_714:
    add sp, sp, #0xf8
    mov r0, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_720:
    add sp, sp, #0xf8
    mov r0, #0x20
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_72c:
    add sp, sp, #0xf8
    mov r0, #0x40
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_738:
    add fp, fp, #0x4
    add r7, r7, #0x1
    cmp r7, #0x100
    blt .L_304
.L_748:
    rsb r0, sl, #0x1
    str r0, [sp, #0x4]
    ldr r2, _LIT7
    ldr r1, _LIT8
    and r0, r0, #0x1
    mla fp, r0, r1, r2
    mov r7, #0x0
    mov r4, #0x1
.L_768:
    mov r2, #0x0
    str r2, [sp]
    ldr r1, [sp, #0x4]
    mov r0, sl
    mov r2, r8
    mov r3, #0x1
    bl func_ov002_02280c40
    movs r8, r0
    bmi .L_7c8
    mov r0, #0x14
    mla r0, r8, r0, fp
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b890
    cmp r0, #0x0
    ble .L_7c8
    cmp r0, #0x6
    bgt .L_7c8
    tst r6, r4, lsl r0
    cmpne r5, #0x0
    orrne r9, r9, r4, lsl r0
    eorne r6, r6, r4, lsl r0
    subne r5, r5, #0x1
.L_7c8:
    add r7, r7, #0x1
    cmp r7, #0x2
    blt .L_768
    cmp r5, #0x0
    mov sl, #0x0
    ble .L_83c
    mov fp, #0x6
    ldr r7, _LIT9
    mov r8, #0x1
    mov r4, fp
.L_7f0:
    mov r0, fp
    bl func_ov002_021b00d0
    mov r2, #0x0
.L_7fc:
    add r1, r2, r0
    smull r3, ip, r7, r1
    add ip, ip, r1, lsr #0x1f
    smull r3, ip, r4, ip
    sub ip, r1, r3
    add r1, ip, #0x1
    tst r6, r8, lsl r1
    orrne r9, r9, r8, lsl r1
    eorne r6, r6, r8, lsl r1
    bne .L_830
    add r2, r2, #0x1
    cmp r2, #0x6
    blt .L_7fc
.L_830:
    add sl, sl, #0x1
    cmp sl, r5
    blt .L_7f0
.L_83c:
    mov r0, r9
    add sp, sp, #0xf8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x0000171f
_LIT1: .word data_ov002_022d0254
_LIT2: .word 0x00001234
_LIT3: .word 0x000010d9
_LIT4: .word 0x00001826
_LIT5: .word 0x00001a2d
_LIT6: .word 0x00001928
_LIT7: .word data_ov002_022cf16c
_LIT8: .word 0x00000868
_LIT9: .word 0x2aaaaaab
