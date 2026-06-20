; func_ov002_02290500 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd524
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf178
        .extern data_ov002_022d016c
        .extern func_0202b9b0
        .extern func_020b3a7c
        .extern func_ov002_021b00d0
        .extern func_ov002_021bb90c
        .extern func_ov002_021c3ae4
        .extern func_ov002_021c3b60
        .extern func_ov002_02259774
        .extern func_ov002_02259834
        .extern func_ov002_0227c678
        .extern func_ov002_022815a4
        .extern func_ov002_0228c864
        .extern func_ov002_0228c924
        .extern func_ov002_0228c9bc
        .extern func_ov002_0228cb48
        .extern func_ov002_0228cdc0
        .extern func_ov002_0228cf94
        .extern func_ov002_0228d0ac
        .extern func_ov002_0228d544
        .extern func_ov002_0228d95c
        .extern func_ov002_0228dabc
        .extern func_ov002_0228dd28
        .extern func_ov002_0228de34
        .extern func_ov002_0228deac
        .extern func_ov002_0228deec
        .extern func_ov002_0229049c
        .global func_ov002_02290500
        .arm
func_ov002_02290500:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr r3, _LIT0
    mov sl, r0
    mov r9, r2
    ldr r2, _LIT1
    str sl, [r3]
    mov r0, r9
    mov r4, r1
    str sl, [r2, #0xd6c]
    bl func_ov002_0229049c
    ldr r1, _LIT2
    str r0, [sp]
    cmp r4, r1
    bgt .L_134
    bge .L_270
    ldr r2, _LIT3
    cmp r4, r2
    bgt .L_c4
    bge .L_4b4
    sub r0, r1, #0x2b8
    cmp r4, r0
    bgt .L_94
    bge .L_4b4
    cmp r4, #0x3
    bgt .L_84
    cmp r4, #0x1
    blt .L_658
    beq .L_218
    cmp r4, #0x2
    beq .L_270
    cmp r4, #0x3
    beq .L_2a0
    b .L_658
.L_84:
    sub r0, r1, #0x300
    cmp r4, r0
    beq .L_3a4
    b .L_658
.L_94:
    sub r0, r2, #0xc6
    cmp r4, r0
    bgt .L_b4
    bge .L_2d0
    ldr r0, _LIT4
    cmp r4, r0
    beq .L_4b4
    b .L_658
.L_b4:
    sub r0, r2, #0x38
    cmp r4, r0
    beq .L_354
    b .L_658
.L_c4:
    add r0, r2, #0xab
    cmp r4, r0
    bgt .L_104
    bge .L_4b4
    add r0, r2, #0x86
    cmp r4, r0
    bgt .L_f4
    bge .L_4b4
    add r0, r2, #0x49
    cmp r4, r0
    beq .L_4b4
    b .L_658
.L_f4:
    add r0, r2, #0xa7
    cmp r4, r0
    beq .L_4b4
    b .L_658
.L_104:
    add r0, r2, #0xe4
    cmp r4, r0
    bgt .L_124
    bge .L_4b4
    add r0, r2, #0xe2
    cmp r4, r0
    beq .L_2fc
    b .L_658
.L_124:
    sub r0, r1, #0x64
    cmp r4, r0
    beq .L_400
    b .L_658
.L_134:
    add r0, r1, #0x2ac
    cmp r4, r0
    bgt .L_1a8
    bge .L_270
    add r0, r1, #0x9c
    cmp r4, r0
    bgt .L_178
    bge .L_484
    add r0, r1, #0xc
    cmp r4, r0
    bgt .L_168
    beq .L_458
    b .L_658
.L_168:
    add r0, r1, #0x17
    cmp r4, r0
    beq .L_2fc
    b .L_658
.L_178:
    ldr r0, _LIT5
    cmp r4, r0
    bgt .L_198
    bge .L_400
    sub r0, r0, #0xc
    cmp r4, r0
    beq .L_270
    b .L_658
.L_198:
    add r0, r0, #0x85
    cmp r4, r0
    beq .L_400
    b .L_658
.L_1a8:
    ldr r1, _LIT6
    cmp r4, r1
    bgt .L_1e8
    bge .L_4e4
    sub r0, r1, #0xb4
    cmp r4, r0
    bgt .L_1d8
    bge .L_458
    sub r0, r1, #0x104
    cmp r4, r0
    beq .L_484
    b .L_658
.L_1d8:
    sub r0, r1, #0x65
    cmp r4, r0
    beq .L_4b4
    b .L_658
.L_1e8:
    add r0, r1, #0xa4
    cmp r4, r0
    bgt .L_208
    bge .L_5c4
    add r0, r1, #0x1
    cmp r4, r0
    beq .L_598
    b .L_658
.L_208:
    add r0, r1, #0xe3
    cmp r4, r0
    beq .L_4b4
    b .L_658
.L_218:
    rsb r4, sl, #0x1
    ldr r1, [sp]
    mov r0, r4
    mov r2, #0x0
    bl func_ov002_0228cdc0
    movs r1, r0
    mov r2, #0x0
    bmi .L_248
    mov r0, r4
    mov r3, #0xb
    bl func_ov002_02259774
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_248:
    ldr r1, [sp]
    mov r0, sl
    bl func_ov002_0228d0ac
    movs r1, r0
    bmi .L_658
    mov r0, sl
    mov r2, #0x0
    mov r3, #0xb
    bl func_ov002_02259774
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_270:
    mov r0, sl
    mov r1, r9
    mov r2, #0x1
    mov r3, #0x0
    bl func_ov002_0228d544
    movs r2, r0
    bmi .L_658
    mov r1, #0xb
    mov r0, sl
    mov r3, r1
    bl func_ov002_02259774
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2a0:
    mov r2, #0x0
    mov r0, sl
    mov r1, r9
    mov r3, r2
    bl func_ov002_0228d544
    movs r2, r0
    bmi .L_658
    mov r1, #0xb
    mov r0, sl
    mov r3, r1
    bl func_ov002_02259774
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2d0:
    ldr r2, _LIT7
    ldr r1, [sp]
    mov r0, sl
    bl func_ov002_0228c864
    movs r1, r0
    bmi .L_658
    mov r0, sl
    mov r2, #0x0
    mov r3, #0xb
    bl func_ov002_02259774
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2fc:
    rsb r4, sl, #0x1
    ldr r1, [sp]
    mov r0, r4
    mov r2, #0x1
    bl func_ov002_0228cdc0
    movs r1, r0
    bmi .L_32c
    mov r0, r4
    mov r2, #0x0
    mov r3, #0xb
    bl func_ov002_02259774
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_32c:
    ldr r1, [sp]
    mov r0, sl
    bl func_ov002_0228cf94
    movs r1, r0
    bmi .L_658
    mov r0, sl
    mov r2, #0x0
    mov r3, #0xb
    bl func_ov002_02259774
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_354:
    ldr r2, _LIT8
    ldr r1, [sp]
    mov r0, sl
    bl func_ov002_0228c864
    movs r1, r0
    mov r0, sl
    bmi .L_380
    mov r2, #0x0
    mov r3, #0xb
    bl func_ov002_02259774
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_380:
    ldr r1, [sp]
    bl func_ov002_0228cf94
    movs r1, r0
    bmi .L_658
    mov r0, sl
    mov r2, #0x0
    mov r3, #0xb
    bl func_ov002_02259774
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_3a4:
    rsb r4, sl, #0x1
    ldr r1, [sp]
    mov r0, r4
    mov r2, #0x0
    bl func_ov002_0228cdc0
    movs r1, r0
    bmi .L_3d4
    mov r0, r4
    mov r2, #0x0
    mov r3, #0xb
    bl func_ov002_02259774
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_3d4:
    ldr r2, _LIT9
    ldr r1, [sp]
    mov r0, sl
    bl func_ov002_0228c864
    movs r1, r0
    bmi .L_658
    mov r0, sl
    mov r2, #0x0
    mov r3, #0xb
    bl func_ov002_02259774
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_400:
    rsb r4, sl, #0x1
    ldr r1, [sp]
    mov r0, r4
    mov r2, #0x0
    bl func_ov002_0228cdc0
    movs r1, r0
    bmi .L_430
    mov r0, r4
    mov r2, #0x0
    mov r3, #0xb
    bl func_ov002_02259774
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_430:
    ldr r1, [sp]
    mov r0, sl
    bl func_ov002_0228cf94
    movs r1, r0
    bmi .L_658
    mov r0, sl
    mov r2, #0x0
    mov r3, #0xb
    bl func_ov002_02259774
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_458:
    ldr r2, _LIT10
    mov r0, sl
    mov r1, r9
    bl func_ov002_0228c924
    movs r2, r0
    bmi .L_658
    mov r1, #0xb
    mov r0, sl
    mov r3, r1
    bl func_ov002_02259774
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_484:
    mov r2, #0x1
    mov r0, sl
    mov r1, r9
    mov r3, r2
    bl func_ov002_0228c9bc
    movs r2, r0
    bmi .L_658
    mov r1, #0xb
    mov r0, sl
    mov r3, r1
    bl func_ov002_02259774
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_4b4:
    rsb r4, sl, #0x1
    ldr r2, _LIT11
    mov r0, r4
    mov r1, r9
    bl func_ov002_0228c924
    movs r2, r0
    bmi .L_658
    mov r1, #0xb
    mov r0, r4
    mov r3, r1
    bl func_ov002_02259774
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_4e4:
    ldr r0, _LIT12
    and r2, sl, #0x1
    mul r1, r2, r0
    ldr r0, _LIT13
    mov r9, #0x0
    ldr r0, [r0, r1]
    cmp r0, #0x0
    bls .L_590
    ldr r0, _LIT14
    mov r4, r9
    add r8, r0, r1
    add r7, r8, #0x120
    mov r5, #0x1
.L_518:
    ldr r1, [r7]
    mov r0, sl
    mov r1, r1, lsl #0x13
    mov r6, r1, lsr #0x13
    mov r2, r6, lsl #0x10
    mov r1, r5
    mov r2, r2, lsr #0x10
    bl func_ov002_0227c678
    cmp r0, #0x0
    bne .L_57c
    mov r0, r6
    bl func_0202b9b0
    cmp r0, #0x3
    blt .L_57c
    mov r0, r6
    mov r1, r4
    bl func_ov002_022815a4
    cmp r0, #0x0
    bne .L_57c
    mov r1, #0xb
    mov r0, sl
    mov r2, r9
    mov r3, r1
    bl func_ov002_02259774
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_57c:
    ldr r0, [r8, #0xc]
    add r9, r9, #0x1
    cmp r9, r0
    add r7, r7, #0x4
    bcc .L_518
.L_590:
    bl func_ov002_02259834
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_598:
    ldr r2, _LIT15
    ldr r1, [sp]
    mov r0, sl
    bl func_ov002_0228c864
    movs r1, r0
    bmi .L_658
    mov r0, sl
    mov r2, #0x0
    mov r3, #0xb
    bl func_ov002_02259774
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_5c4:
    ldr r2, _LIT10
    mov r0, sl
    mov r1, r9
    bl func_ov002_0228c924
    mov r4, r0
    ldr r1, _LIT16
    mov r0, sl
    bl func_ov002_021bb90c
    cmp r0, #0x0
    beq .L_5fc
    ldr r1, _LIT17
    mov r0, sl
    bl func_ov002_021c3ae4
    mov r4, r0
.L_5fc:
    ldr r1, _LIT18
    mov r0, sl
    bl func_ov002_021bb90c
    cmp r0, #0x0
    beq .L_620
    ldr r1, _LIT19
    mov r0, sl
    bl func_ov002_021c3b60
    mov r4, r0
.L_620:
    cmp r4, #0x0
    blt .L_658
    mov r0, sl
    mov r2, r4
    mov r1, #0xb
    blx r9
    cmp r0, #0x0
    beq .L_658
    mov r1, #0xb
    mov r0, sl
    mov r2, r4
    mov r3, r1
    bl func_ov002_02259774
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_658:
    mov fp, #0x0
    mov r4, #0xb
.L_660:
    cmp fp, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    eor r7, sl, r0
    ldr r1, _LIT12
    ldr r0, _LIT14
    and r2, r7, #0x1
    mla r6, r2, r1, r0
    ldr r0, [r6, #0xc]
    bl func_ov002_021b00d0
    ldr r1, [r6, #0xc]
    mov r8, r0
    cmp r1, #0x0
    mov r5, #0x0
    bls .L_6ec
.L_69c:
    add r0, r8, #0x1
    ldr r1, [r6, #0xc]
    bl func_020b3a7c
    mov r8, r1
    mov r0, r7
    mov r1, r4
    mov r2, r8
    blx r9
    cmp r0, #0x0
    beq .L_6dc
    mov r1, #0xb
    mov r0, r7
    mov r2, r8
    mov r3, r1
    bl func_ov002_02259774
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_6dc:
    add r5, r5, #0x1
    ldr r0, [r6, #0xc]
    cmp r5, r0
    bcc .L_69c
.L_6ec:
    add fp, fp, #0x1
    cmp fp, #0x2
    blt .L_660
    rsb r4, sl, #0x1
    ldr r1, [sp]
    mov r0, r4
    bl func_ov002_0228cb48
    movs r1, r0
    bmi .L_724
    mov r0, r4
    mov r2, #0x0
    mov r3, #0xb
    bl func_ov002_02259774
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_724:
    ldr r1, [sp]
    mov r0, sl
    bl func_ov002_0228cb48
    movs r1, r0
    ldmmiia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, sl
    mov r2, #0x0
    mov r3, #0xb
    bl func_ov002_02259774
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cd524
_LIT1: .word data_ov002_022d016c
_LIT2: .word 0x000015dc
_LIT3: .word 0x00001462
_LIT4: .word 0x0000132b
_LIT5: .word 0x000016df
_LIT6: .word 0x0000198d
_LIT7: .word func_ov002_0228dabc
_LIT8: .word func_ov002_0228d95c
_LIT9: .word func_ov002_0228dd28
_LIT10: .word func_ov002_0228deac
_LIT11: .word func_ov002_0228deec
_LIT12: .word 0x00000868
_LIT13: .word data_ov002_022cf178
_LIT14: .word data_ov002_022cf16c
_LIT15: .word func_ov002_0228de34
_LIT16: .word 0x0000190b
_LIT17: .word 0x00001917
_LIT18: .word 0x0000160a
_LIT19: .word 0x00001620
