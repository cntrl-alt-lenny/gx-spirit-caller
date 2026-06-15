; func_0205a18c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c36d4
        .extern data_021007c8
        .extern data_021007e4
        .extern data_021007f4
        .extern data_021007fc
        .extern data_0210080c
        .extern data_02100814
        .extern data_02100820
        .extern data_0210082c
        .extern data_02100838
        .extern data_02100844
        .extern data_02100850
        .extern data_02100868
        .extern data_02100878
        .extern data_0210087c
        .extern data_02100880
        .extern data_02100884
        .extern data_0210088c
        .extern data_02100898
        .extern data_021008ac
        .extern data_021008c0
        .extern data_021008cc
        .extern data_021008d4
        .extern data_021008dc
        .extern data_021008e4
        .extern data_021008ec
        .extern data_021008f4
        .extern data_021008fc
        .extern data_02100904
        .extern func_02055298
        .extern func_0205a974
        .extern func_0205ae4c
        .extern func_0205ae8c
        .extern func_0205ffc0
        .extern func_020604b0
        .extern func_020aaddc
        .extern func_020ace00
        .global func_0205a18c
        .arm
func_0205a18c:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x100
    mov r6, r0
    movs r5, r2
    ldr r4, [r6]
    bne .L_2118
    ldr r1, _LIT0
    bl func_0205ffc0
    add sp, sp, #0x100
    mov r0, #0x2
    ldmia sp!, {r4, r5, r6, pc}
.L_2118:
    sub r1, r1, #0x700
    cmp r1, #0x1e
    addls pc, pc, r1, lsl #0x2
    b .L_2820
    b .L_21a4
    b .L_2204
    b .L_2268
    b .L_22d0
    b .L_2334
    b .L_2364
    b .L_24f0
    b .L_2394
    b .L_23c4
    b .L_23f4
    b .L_2820
    b .L_244c
    b .L_2820
    b .L_2520
    b .L_2548
    b .L_2570
    b .L_25a0
    b .L_25c8
    b .L_25f8
    b .L_2820
    b .L_2620
    b .L_2648
    b .L_2670
    b .L_26a0
    b .L_26d0
    b .L_2700
    b .L_2730
    b .L_2760
    b .L_2790
    b .L_27c0
    b .L_27f0
.L_21a4:
    ldrsb r1, [r5]
    cmp r1, #0x0
    bne .L_21c4
    ldr r1, _LIT0
    bl func_0205ffc0
    add sp, sp, #0x100
    mov r0, #0x2
    ldmia sp!, {r4, r5, r6, pc}
.L_21c4:
    add r0, sp, #0x0
    mov r1, r5
    mov r2, #0x1f
    bl func_020604b0
    add r1, sp, #0x0
    add r0, r4, #0x110
    mov r2, #0x1f
    bl func_020604b0
    ldr r1, _LIT1
    add r2, sp, #0x0
    mov r0, r6
    bl func_0205ae8c
    cmp r0, #0x0
    beq .L_2838
    add sp, sp, #0x100
    ldmia sp!, {r4, r5, r6, pc}
.L_2204:
    ldrsb r1, [r5]
    cmp r1, #0x0
    bne .L_2224
    ldr r1, _LIT0
    bl func_0205ffc0
    add sp, sp, #0x100
    mov r0, #0x2
    ldmia sp!, {r4, r5, r6, pc}
.L_2224:
    add r0, sp, #0x0
    mov r1, r5
    mov r2, #0x15
    bl func_020604b0
    ldr r0, _LIT2
    add r1, sp, #0x0
    add r0, r4, r0
    mov r2, #0x15
    bl func_020604b0
    ldr r1, _LIT3
    add r2, sp, #0x0
    mov r0, r6
    bl func_0205ae8c
    cmp r0, #0x0
    beq .L_2838
    add sp, sp, #0x100
    ldmia sp!, {r4, r5, r6, pc}
.L_2268:
    ldrsb r1, [r5]
    cmp r1, #0x0
    bne .L_2288
    ldr r1, _LIT0
    bl func_0205ffc0
    add sp, sp, #0x100
    mov r0, #0x2
    ldmia sp!, {r4, r5, r6, pc}
.L_2288:
    add r0, sp, #0x0
    mov r1, r5
    mov r2, #0x33
    bl func_020604b0
    add r0, sp, #0x0
    bl func_02055298
    add r1, sp, #0x0
    add r0, r4, #0x144
    mov r2, #0x33
    bl func_020604b0
    ldr r1, _LIT4
    add r2, sp, #0x0
    mov r0, r6
    bl func_0205ae4c
    cmp r0, #0x0
    beq .L_2838
    add sp, sp, #0x100
    ldmia sp!, {r4, r5, r6, pc}
.L_22d0:
    ldrsb r1, [r5]
    cmp r1, #0x0
    bne .L_22f0
    ldr r1, _LIT0
    bl func_0205ffc0
    add sp, sp, #0x100
    mov r0, #0x2
    ldmia sp!, {r4, r5, r6, pc}
.L_22f0:
    add r0, sp, #0x0
    mov r1, r5
    mov r2, #0x1f
    bl func_020604b0
    ldr r0, _LIT5
    add r1, sp, #0x0
    add r0, r4, r0
    mov r2, #0x1f
    bl func_020604b0
    ldr r1, _LIT6
    add r2, sp, #0x0
    mov r0, r6
    bl func_0205ae4c
    cmp r0, #0x0
    beq .L_2838
    add sp, sp, #0x100
    ldmia sp!, {r4, r5, r6, pc}
.L_2334:
    add r0, sp, #0x0
    mov r1, r5
    mov r2, #0x1f
    bl func_020604b0
    ldr r1, _LIT7
    add r2, sp, #0x0
    mov r0, r6
    bl func_0205ae8c
    cmp r0, #0x0
    beq .L_2838
    add sp, sp, #0x100
    ldmia sp!, {r4, r5, r6, pc}
.L_2364:
    add r0, sp, #0x0
    mov r1, r5
    mov r2, #0x1f
    bl func_020604b0
    ldr r1, _LIT8
    add r2, sp, #0x0
    mov r0, r6
    bl func_0205ae8c
    cmp r0, #0x0
    beq .L_2838
    add sp, sp, #0x100
    ldmia sp!, {r4, r5, r6, pc}
.L_2394:
    add r0, sp, #0x0
    mov r1, r5
    mov r2, #0x4c
    bl func_020604b0
    ldr r1, _LIT9
    add r2, sp, #0x0
    mov r0, r6
    bl func_0205ae8c
    cmp r0, #0x0
    beq .L_2838
    add sp, sp, #0x100
    ldmia sp!, {r4, r5, r6, pc}
.L_23c4:
    add r0, sp, #0x0
    mov r1, r5
    mov r2, #0xb
    bl func_020604b0
    ldr r1, _LIT10
    add r2, sp, #0x0
    mov r0, r6
    bl func_0205ae8c
    cmp r0, #0x0
    beq .L_2838
    add sp, sp, #0x100
    ldmia sp!, {r4, r5, r6, pc}
.L_23f4:
    mov r0, r5
    bl func_020aaddc
    cmp r0, #0x2
    beq .L_241c
    ldr r1, _LIT11
    mov r0, r6
    bl func_0205ffc0
    add sp, sp, #0x100
    mov r0, #0x2
    ldmia sp!, {r4, r5, r6, pc}
.L_241c:
    add r0, sp, #0x0
    mov r1, r5
    mov r2, #0x3
    bl func_020604b0
    ldr r1, _LIT12
    add r2, sp, #0x0
    mov r0, r6
    bl func_0205ae8c
    cmp r0, #0x0
    beq .L_2838
    add sp, sp, #0x100
    ldmia sp!, {r4, r5, r6, pc}
.L_244c:
    ldrsb r1, [r5]
    cmp r1, #0x0
    blt .L_2468
    cmp r1, #0x80
    bge .L_2468
    ldr r0, _LIT13
    ldrb r1, [r0, r1]
.L_2468:
    mov r0, r1, lsl #0x18
    mov r0, r0, asr #0x18
    cmp r0, #0x4d
    bne .L_2494
    ldr r0, _LIT14
    add r2, sp, #0x0
    ldrb r1, [r0]
    ldrb r0, [r0, #0x1]
    strb r1, [r2]
    strb r0, [r2, #0x1]
    b .L_24d0
.L_2494:
    cmp r0, #0x46
    bne .L_24b8
    ldr r0, _LIT15
    add r2, sp, #0x0
    ldrb r1, [r0]
    ldrb r0, [r0, #0x1]
    strb r1, [r2]
    strb r0, [r2, #0x1]
    b .L_24d0
.L_24b8:
    ldr r0, _LIT16
    add r2, sp, #0x0
    ldrb r1, [r0]
    ldrb r0, [r0, #0x1]
    strb r1, [r2]
    strb r0, [r2, #0x1]
.L_24d0:
    ldr r1, _LIT17
    add r2, sp, #0x0
    mov r0, r6
    bl func_0205ae8c
    cmp r0, #0x0
    beq .L_2838
    add sp, sp, #0x100
    ldmia sp!, {r4, r5, r6, pc}
.L_24f0:
    add r0, sp, #0x0
    mov r1, r5
    mov r2, #0x100
    bl func_020604b0
    ldr r1, _LIT18
    add r2, sp, #0x0
    mov r0, r6
    bl func_0205ae8c
    cmp r0, #0x0
    beq .L_2838
    add sp, sp, #0x100
    ldmia sp!, {r4, r5, r6, pc}
.L_2520:
    mov r0, r5
    bl func_020ace00
    mov r2, r0
    ldr r1, _LIT19
    mov r0, r6
    bl func_0205a974
    cmp r0, #0x0
    beq .L_2838
    add sp, sp, #0x100
    ldmia sp!, {r4, r5, r6, pc}
.L_2548:
    mov r0, r5
    bl func_020ace00
    mov r2, r0
    ldr r1, _LIT20
    mov r0, r6
    bl func_0205a974
    cmp r0, #0x0
    beq .L_2838
    add sp, sp, #0x100
    ldmia sp!, {r4, r5, r6, pc}
.L_2570:
    add r0, sp, #0x0
    mov r1, r5
    mov r2, #0x100
    bl func_020604b0
    ldr r1, _LIT21
    add r2, sp, #0x0
    mov r0, r6
    bl func_0205ae8c
    cmp r0, #0x0
    beq .L_2838
    add sp, sp, #0x100
    ldmia sp!, {r4, r5, r6, pc}
.L_25a0:
    mov r0, r5
    bl func_020ace00
    mov r2, r0
    mov r0, r6
    mov r1, #0x710
    bl func_0205a974
    cmp r0, #0x0
    beq .L_2838
    add sp, sp, #0x100
    ldmia sp!, {r4, r5, r6, pc}
.L_25c8:
    add r0, sp, #0x0
    mov r1, r5
    mov r2, #0x100
    bl func_020604b0
    ldr r1, _LIT22
    add r2, sp, #0x0
    mov r0, r6
    bl func_0205ae8c
    cmp r0, #0x0
    beq .L_2838
    add sp, sp, #0x100
    ldmia sp!, {r4, r5, r6, pc}
.L_25f8:
    mov r0, r5
    bl func_020ace00
    mov r2, r0
    ldr r1, _LIT23
    mov r0, r6
    bl func_0205a974
    cmp r0, #0x0
    beq .L_2838
    add sp, sp, #0x100
    ldmia sp!, {r4, r5, r6, pc}
.L_2620:
    mov r0, r5
    bl func_020ace00
    mov r2, r0
    ldr r1, _LIT24
    mov r0, r6
    bl func_0205a974
    cmp r0, #0x0
    beq .L_2838
    add sp, sp, #0x100
    ldmia sp!, {r4, r5, r6, pc}
.L_2648:
    mov r0, r5
    bl func_020ace00
    mov r2, r0
    ldr r1, _LIT25
    mov r0, r6
    bl func_0205a974
    cmp r0, #0x0
    beq .L_2838
    add sp, sp, #0x100
    ldmia sp!, {r4, r5, r6, pc}
.L_2670:
    add r0, sp, #0x0
    mov r1, r5
    mov r2, #0x100
    bl func_020604b0
    ldr r1, _LIT26
    add r2, sp, #0x0
    mov r0, r6
    bl func_0205ae8c
    cmp r0, #0x0
    beq .L_2838
    add sp, sp, #0x100
    ldmia sp!, {r4, r5, r6, pc}
.L_26a0:
    add r0, sp, #0x0
    mov r1, r5
    mov r2, #0x33
    bl func_020604b0
    ldr r1, _LIT27
    add r2, sp, #0x0
    mov r0, r6
    bl func_0205ae8c
    cmp r0, #0x0
    beq .L_2838
    add sp, sp, #0x100
    ldmia sp!, {r4, r5, r6, pc}
.L_26d0:
    add r0, sp, #0x0
    mov r1, r5
    mov r2, #0x100
    bl func_020604b0
    ldr r1, _LIT28
    add r2, sp, #0x0
    mov r0, r6
    bl func_0205ae8c
    cmp r0, #0x0
    beq .L_2838
    add sp, sp, #0x100
    ldmia sp!, {r4, r5, r6, pc}
.L_2700:
    add r0, sp, #0x0
    mov r1, r5
    mov r2, #0x100
    bl func_020604b0
    ldr r1, _LIT29
    add r2, sp, #0x0
    mov r0, r6
    bl func_0205ae8c
    cmp r0, #0x0
    beq .L_2838
    add sp, sp, #0x100
    ldmia sp!, {r4, r5, r6, pc}
.L_2730:
    add r0, sp, #0x0
    mov r1, r5
    mov r2, #0x100
    bl func_020604b0
    ldr r1, _LIT30
    add r2, sp, #0x0
    mov r0, r6
    bl func_0205ae8c
    cmp r0, #0x0
    beq .L_2838
    add sp, sp, #0x100
    ldmia sp!, {r4, r5, r6, pc}
.L_2760:
    add r0, sp, #0x0
    mov r1, r5
    mov r2, #0x100
    bl func_020604b0
    ldr r1, _LIT31
    add r2, sp, #0x0
    mov r0, r6
    bl func_0205ae8c
    cmp r0, #0x0
    beq .L_2838
    add sp, sp, #0x100
    ldmia sp!, {r4, r5, r6, pc}
.L_2790:
    add r0, sp, #0x0
    mov r1, r5
    mov r2, #0x100
    bl func_020604b0
    ldr r1, _LIT32
    add r2, sp, #0x0
    mov r0, r6
    bl func_0205ae8c
    cmp r0, #0x0
    beq .L_2838
    add sp, sp, #0x100
    ldmia sp!, {r4, r5, r6, pc}
.L_27c0:
    add r0, sp, #0x0
    mov r1, r5
    mov r2, #0x100
    bl func_020604b0
    ldr r1, _LIT33
    add r2, sp, #0x0
    mov r0, r6
    bl func_0205ae8c
    cmp r0, #0x0
    beq .L_2838
    add sp, sp, #0x100
    ldmia sp!, {r4, r5, r6, pc}
.L_27f0:
    add r0, sp, #0x0
    mov r1, r5
    mov r2, #0x100
    bl func_020604b0
    ldr r1, _LIT34
    add r2, sp, #0x0
    mov r0, r6
    bl func_0205ae8c
    cmp r0, #0x0
    beq .L_2838
    add sp, sp, #0x100
    ldmia sp!, {r4, r5, r6, pc}
.L_2820:
    ldr r1, _LIT35
    mov r0, r6
    bl func_0205ffc0
    add sp, sp, #0x100
    mov r0, #0x2
    ldmia sp!, {r4, r5, r6, pc}
.L_2838:
    mov r0, #0x0
    add sp, sp, #0x100
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_021007e4
_LIT1: .word data_021007f4
_LIT2: .word 0x0000012f
_LIT3: .word data_021007fc
_LIT4: .word data_0210080c
_LIT5: .word 0x00000177
_LIT6: .word data_02100814
_LIT7: .word data_02100820
_LIT8: .word data_0210082c
_LIT9: .word data_02100838
_LIT10: .word data_02100844
_LIT11: .word data_02100850
_LIT12: .word data_02100868
_LIT13: .word data_020c36d4
_LIT14: .word data_02100878
_LIT15: .word data_0210087c
_LIT16: .word data_02100880
_LIT17: .word data_02100884
_LIT18: .word data_0210088c
_LIT19: .word 0x0000070d
_LIT20: .word 0x0000070e
_LIT21: .word data_02100898
_LIT22: .word data_021008ac
_LIT23: .word 0x00000712
_LIT24: .word 0x00000714
_LIT25: .word 0x00000715
_LIT26: .word data_021008c0
_LIT27: .word data_021008cc
_LIT28: .word data_021008d4
_LIT29: .word data_021008dc
_LIT30: .word data_021008e4
_LIT31: .word data_021008ec
_LIT32: .word data_021008f4
_LIT33: .word data_021008fc
_LIT34: .word data_02100904
_LIT35: .word data_021007c8
