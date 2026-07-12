; func_ov002_02282efc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022d0174
        .extern func_0202b83c
        .extern func_ov002_021afff0
        .extern func_ov002_02280b30
        .global func_ov002_02282efc
        .arm
func_ov002_02282efc:
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
    bne .L_19dc
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
.L_1598:
    and r4, r7, #0x1
    cmp r4, sl
    bne .L_19cc
    ldrh r4, [fp]
    mov r4, r4, lsl #0x13
    cmp r3, r4, lsr #0x13
    mov r4, r4, lsr #0x13
    blt .L_17a8
    cmp r4, r2
    bge .L_19c0
    cmp r4, r1
    bgt .L_16b0
    cmp r4, r0
    bge .L_19b4
    cmp r4, lr
    bgt .L_1648
    ldr ip, [sp, #0xf4]
    cmp r4, ip
    bge .L_19c0
    ldr ip, [sp, #0x8]
    cmp r4, ip
    bgt .L_1620
    ldr ip, _LIT3
    cmp r4, ip
    blt .L_1610
    beq .L_1984
    ldr ip, [sp, #0xc]
    cmp r4, ip
    beq .L_199c
    b .L_19cc
.L_1610:
    ldr ip, [sp, #0x10]
    cmp r4, ip
    beq .L_1990
    b .L_19cc
.L_1620:
    ldr ip, [sp, #0x14]
    cmp r4, ip
    bgt .L_163c
    ldr ip, [sp, #0x18]
    cmp r4, ip
    beq .L_19b4
    b .L_19cc
.L_163c:
    cmp r4, #0x1140
    beq .L_1990
    b .L_19cc
.L_1648:
    ldr ip, [sp, #0x1c]
    cmp r4, ip
    bgt .L_1684
    ldr ip, [sp, #0x20]
    cmp r4, ip
    bge .L_1984
    ldr ip, _LIT2
    cmp r4, ip
    bgt .L_1674
    beq .L_19a8
    b .L_19cc
.L_1674:
    ldr ip, [sp, #0x24]
    cmp r4, ip
    beq .L_1990
    b .L_19cc
.L_1684:
    ldr ip, [sp, #0x28]
    cmp r4, ip
    bgt .L_16a0
    ldr ip, [sp, #0x2c]
    cmp r4, ip
    beq .L_19a8
    b .L_19cc
.L_16a0:
    ldr ip, [sp, #0x30]
    cmp r4, ip
    beq .L_19c0
    b .L_19cc
.L_16b0:
    ldr ip, [sp, #0x34]
    cmp r4, ip
    bgt .L_171c
    ldr ip, [sp, #0x38]
    cmp r4, ip
    bge .L_1984
    ldr ip, [sp, #0x3c]
    cmp r4, ip
    bgt .L_16f0
    ldr ip, [sp, #0x40]
    cmp r4, ip
    bge .L_1984
    ldr ip, [sp, #0x44]
    cmp r4, ip
    beq .L_1990
    b .L_19cc
.L_16f0:
    ldr ip, [sp, #0x48]
    cmp r4, ip
    bgt .L_170c
    ldr ip, [sp, #0x4c]
    cmp r4, ip
    beq .L_1984
    b .L_19cc
.L_170c:
    ldr ip, [sp, #0x50]
    cmp r4, ip
    beq .L_199c
    b .L_19cc
.L_171c:
    ldr ip, [sp, #0x54]
    cmp r4, ip
    bgt .L_1784
    ldr ip, [sp, #0x58]
    cmp r4, ip
    bge .L_1984
    ldr ip, [sp, #0x5c]
    cmp r4, ip
    bgt .L_1750
    ldr ip, [sp, #0x60]
    cmp r4, ip
    beq .L_19a8
    b .L_19cc
.L_1750:
    ldr ip, [sp, #0x64]
    cmp r4, ip
    bgt .L_19cc
    ldr ip, [sp, #0x68]
    cmp r4, ip
    blt .L_19cc
    ldr ip, [sp, #0x6c]
    cmp r4, ip
    beq .L_19a8
    ldr ip, [sp, #0x70]
    cmp r4, ip
    beq .L_19b4
    b .L_19cc
.L_1784:
    ldr ip, _LIT4
    cmp r4, ip
    bgt .L_1798
    beq .L_19c0
    b .L_19cc
.L_1798:
    ldr ip, [sp, #0x74]
    cmp r4, ip
    beq .L_19a8
    b .L_19cc
.L_17a8:
    ldr ip, [sp, #0x78]
    cmp r4, ip
    bgt .L_18a0
    ldr ip, [sp, #0x7c]
    cmp r4, ip
    bge .L_19b4
    cmp r4, #0x18c0
    bgt .L_1820
    bge .L_199c
    ldr ip, [sp, #0x80]
    cmp r4, ip
    bgt .L_17f4
    ldr ip, [sp, #0x84]
    cmp r4, ip
    bge .L_19b4
    ldr ip, [sp, #0x88]
    cmp r4, ip
    beq .L_19a8
    b .L_19cc
.L_17f4:
    ldr ip, [sp, #0x8c]
    cmp r4, ip
    bgt .L_1810
    ldr ip, [sp, #0x90]
    cmp r4, ip
    beq .L_1990
    b .L_19cc
.L_1810:
    ldr ip, [sp, #0x94]
    cmp r4, ip
    beq .L_19b4
    b .L_19cc
.L_1820:
    ldr ip, _LIT6
    cmp r4, ip
    bgt .L_1874
    bge .L_199c
    ldr ip, [sp, #0x98]
    cmp r4, ip
    bgt .L_1864
    ldr ip, [sp, #0x9c]
    cmp r4, ip
    blt .L_19cc
    ldr ip, [sp, #0xa0]
    cmp r4, ip
    beq .L_19a8
    ldr ip, [sp, #0xa4]
    cmp r4, ip
    beq .L_19c0
    b .L_19cc
.L_1864:
    ldr ip, [sp, #0xa8]
    cmp r4, ip
    beq .L_19b4
    b .L_19cc
.L_1874:
    ldr ip, [sp, #0xac]
    cmp r4, ip
    bgt .L_1890
    ldr ip, [sp, #0xb0]
    cmp r4, ip
    beq .L_19a8
    b .L_19cc
.L_1890:
    ldr ip, [sp, #0xb4]
    cmp r4, ip
    beq .L_19c0
    b .L_19cc
.L_18a0:
    ldr ip, [sp, #0xb8]
    cmp r4, ip
    bgt .L_190c
    ldr ip, [sp, #0xbc]
    cmp r4, ip
    bge .L_19b4
    ldr ip, [sp, #0xc0]
    cmp r4, ip
    bgt .L_18e0
    ldr ip, [sp, #0xc4]
    cmp r4, ip
    bge .L_19a8
    ldr ip, [sp, #0xc8]
    cmp r4, ip
    beq .L_199c
    b .L_19cc
.L_18e0:
    ldr ip, [sp, #0xcc]
    cmp r4, ip
    bgt .L_18fc
    ldr ip, [sp, #0xd0]
    cmp r4, ip
    beq .L_19c0
    b .L_19cc
.L_18fc:
    ldr ip, [sp, #0xd4]
    cmp r4, ip
    beq .L_19b4
    b .L_19cc
.L_190c:
    ldr ip, _LIT5
    cmp r4, ip
    bgt .L_1948
    bge .L_19a8
    ldr ip, [sp, #0xd8]
    cmp r4, ip
    bgt .L_1938
    ldr ip, [sp, #0xdc]
    cmp r4, ip
    beq .L_19b4
    b .L_19cc
.L_1938:
    ldr ip, [sp, #0xe0]
    cmp r4, ip
    beq .L_199c
    b .L_19cc
.L_1948:
    ldr ip, [sp, #0xe4]
    cmp r4, ip
    bgt .L_1978
    ldr ip, [sp, #0xe8]
    cmp r4, ip
    blt .L_19cc
    ldr ip, [sp, #0xec]
    cmp r4, ip
    ldrne ip, [sp, #0xf0]
    cmpne r4, ip
    beq .L_19c0
    b .L_19cc
.L_1978:
    cmp r4, #0x1a40
    beq .L_19c0
    b .L_19cc
.L_1984:
    add sp, sp, #0xf8
    mov r0, #0x2
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1990:
    add sp, sp, #0xf8
    mov r0, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_199c:
    add sp, sp, #0xf8
    mov r0, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_19a8:
    add sp, sp, #0xf8
    mov r0, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_19b4:
    add sp, sp, #0xf8
    mov r0, #0x20
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_19c0:
    add sp, sp, #0xf8
    mov r0, #0x40
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_19cc:
    add fp, fp, #0x4
    add r7, r7, #0x1
    cmp r7, #0x100
    blt .L_1598
.L_19dc:
    rsb r0, sl, #0x1
    str r0, [sp, #0x4]
    ldr r2, _LIT7
    ldr r1, _LIT8
    and r0, r0, #0x1
    mla fp, r0, r1, r2
    mov r7, #0x0
    mov r4, #0x1
.L_19fc:
    mov r2, #0x0
    str r2, [sp]
    ldr r1, [sp, #0x4]
    mov r0, sl
    mov r2, r8
    mov r3, #0x1
    bl func_ov002_02280b30
    movs r8, r0
    bmi .L_1a5c
    mov r0, #0x14
    mla r0, r8, r0, fp
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b83c
    cmp r0, #0x0
    ble .L_1a5c
    cmp r0, #0x6
    bgt .L_1a5c
    tst r6, r4, lsl r0
    cmpne r5, #0x0
    orrne r9, r9, r4, lsl r0
    eorne r6, r6, r4, lsl r0
    subne r5, r5, #0x1
.L_1a5c:
    add r7, r7, #0x1
    cmp r7, #0x2
    blt .L_19fc
    cmp r5, #0x0
    mov sl, #0x0
    ble .L_1ad0
    mov fp, #0x6
    ldr r7, _LIT9
    mov r8, #0x1
    mov r4, fp
.L_1a84:
    mov r0, fp
    bl func_ov002_021afff0
    mov r2, #0x0
.L_1a90:
    add r1, r2, r0
    smull r3, ip, r7, r1
    add ip, ip, r1, lsr #0x1f
    smull r3, ip, r4, ip
    sub ip, r1, r3
    add r1, ip, #0x1
    tst r6, r8, lsl r1
    orrne r9, r9, r8, lsl r1
    eorne r6, r6, r8, lsl r1
    bne .L_1ac4
    add r2, r2, #0x1
    cmp r2, #0x6
    blt .L_1a90
.L_1ac4:
    add sl, sl, #0x1
    cmp sl, r5
    blt .L_1a84
.L_1ad0:
    mov r0, r9
    add sp, sp, #0xf8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x0000171f
_LIT1: .word data_ov002_022d0174
_LIT2: .word 0x00001234
_LIT3: .word 0x000010d9
_LIT4: .word 0x00001826
_LIT5: .word 0x00001a2d
_LIT6: .word 0x00001928
_LIT7: .word data_ov002_022cf08c
_LIT8: .word 0x00000868
_LIT9: .word 0x2aaaaaab
