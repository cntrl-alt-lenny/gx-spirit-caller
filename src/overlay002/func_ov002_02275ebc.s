; func_ov002_02275ebc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd300
        .extern data_ov002_022cd310
        .extern func_0202b878
        .extern func_0202eac8
        .extern func_0202f050
        .extern func_ov002_021bc288
        .extern func_ov002_021bc6c4
        .extern func_ov002_021e358c
        .extern func_ov002_02271ab4
        .extern func_ov002_02272414
        .extern func_ov002_022726b4
        .extern func_ov002_02272a24
        .extern func_ov002_02272b98
        .extern func_ov002_02272d30
        .extern func_ov002_02272e84
        .extern func_ov002_0227309c
        .extern func_ov002_02273218
        .extern func_ov002_0227332c
        .extern func_ov002_02273500
        .extern func_ov002_0227352c
        .extern func_ov002_022737dc
        .extern func_ov002_02273ad4
        .extern func_ov002_02273b1c
        .extern func_ov002_02273b54
        .extern func_ov002_02273b94
        .extern func_ov002_02273ca4
        .extern func_ov002_02273d74
        .extern func_ov002_022742dc
        .extern func_ov002_02274454
        .extern func_ov002_022745f0
        .extern func_ov002_02274880
        .extern func_ov002_02274bc0
        .extern func_ov002_022752b8
        .extern func_ov002_02275670
        .extern func_ov002_02275c28
        .extern func_ov002_0227aa80
        .extern func_ov002_0227adcc
        .extern func_ov002_0229ade0
        .global func_ov002_02275ebc
        .arm
func_ov002_02275ebc:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r0, _LIT0
    ldr r4, _LIT1
    ldr r0, [r0]
    mov r0, r0, lsl #0x9
    cmp r4, r0, lsr #0x11
    mov r0, r0, lsr #0x11
    bcc .L_26a4
    cmp r0, r4
    bcs .L_29d8
    ldr r3, _LIT2
    cmp r0, r3
    bhi .L_2530
    bcs .L_2a28
    ldr r1, _LIT3
    cmp r0, r1
    bhi .L_244c
    bcs .L_29f8
    ldr r3, _LIT4
    cmp r0, r3
    bhi .L_23e0
    bcs .L_29d8
    sub r2, r1, #0x400
    cmp r0, r2
    bhi .L_23bc
    sub r1, r1, #0x400
    cmp r0, r1
    bcs .L_29c8
    ldr r2, _LIT5
    cmp r0, r2
    bhi .L_2a80
    sub r1, r2, #0x1
    cmp r0, r1
    bcc .L_2a80
    cmpne r0, r2
    beq .L_29c8
    b .L_2a80
.L_23bc:
    sub r1, r3, #0x170
    cmp r0, r1
    bhi .L_23d0
    beq .L_29d0
    b .L_2a80
.L_23d0:
    ldr r1, _LIT6
    cmp r0, r1
    beq .L_29d8
    b .L_2a80
.L_23e0:
    add r2, r3, #0xfa
    cmp r0, r2
    bhi .L_2408
    mov r1, r2
    cmp r0, r1
    bcs .L_2a78
    add r1, r3, #0xd
    cmp r0, r1
    beq .L_29e0
    b .L_2a80
.L_2408:
    add r2, r3, #0xfe
    cmp r0, r2
    bhi .L_243c
    add r1, r3, #0xfb
    cmp r0, r1
    bcc .L_2a80
    addne r1, r3, #0xfc
    cmpne r0, r1
    beq .L_2a78
    mov r1, r2
    cmp r0, r1
    beq .L_29f0
    b .L_2a80
.L_243c:
    sub r1, r1, #0x34
    cmp r0, r1
    beq .L_2a30
    b .L_2a80
.L_244c:
    add r2, r1, #0x9e
    cmp r0, r2
    bhi .L_24c8
    add r2, r1, #0x9c
    cmp r0, r2
    bcc .L_247c
    addne r2, r1, #0x9d
    cmpne r0, r2
    addne r1, r1, #0x9e
    cmpne r0, r1
    beq .L_2a00
    b .L_2a80
.L_247c:
    add r2, r1, #0x92
    cmp r0, r2
    bhi .L_249c
    bcs .L_2a08
    add r1, r1, #0x7d
    cmp r0, r1
    beq .L_2a00
    b .L_2a80
.L_249c:
    add r2, r1, #0x9a
    cmp r0, r2
    bhi .L_24b8
    add r1, r1, #0x9a
    cmp r0, r1
    beq .L_2a00
    b .L_2a80
.L_24b8:
    add r1, r1, #0x9b
    cmp r0, r1
    beq .L_2a00
    b .L_2a80
.L_24c8:
    add r2, r1, #0x1c8
    cmp r0, r2
    bhi .L_2504
    add r1, r1, #0x1c8
    cmp r0, r1
    bcs .L_2a28
    sub r1, r3, #0xaf
    cmp r0, r1
    bhi .L_24f4
    beq .L_2a30
    b .L_2a80
.L_24f4:
    sub r1, r3, #0x82
    cmp r0, r1
    beq .L_2a18
    b .L_2a80
.L_2504:
    sub r2, r3, #0x46
    cmp r0, r2
    bhi .L_2520
    mov r1, r2
    cmp r0, r1
    beq .L_2a28
    b .L_2a80
.L_2520:
    add r1, r1, #0x210
    cmp r0, r1
    beq .L_2a28
    b .L_2a80
.L_2530:
    ldr r1, _LIT7
    cmp r0, r1
    bhi .L_25e8
    bcs .L_2a78
    sub r2, r1, #0x5d
    cmp r0, r2
    bhi .L_259c
    bcs .L_2a00
    sub r2, r1, #0x60
    cmp r0, r2
    bhi .L_2570
    bcs .L_2a00
    sub r1, r1, #0xd9
    cmp r0, r1
    beq .L_29e0
    b .L_2a80
.L_2570:
    sub r2, r1, #0x5f
    cmp r0, r2
    bhi .L_258c
    sub r1, r1, #0x5f
    cmp r0, r1
    beq .L_2a00
    b .L_2a80
.L_258c:
    sub r1, r1, #0x5e
    cmp r0, r1
    beq .L_2a00
    b .L_2a80
.L_259c:
    sub r2, r1, #0x5a
    cmp r0, r2
    bhi .L_25bc
    bcs .L_2a00
    sub r1, r1, #0x5c
    cmp r0, r1
    beq .L_2a00
    b .L_2a80
.L_25bc:
    sub r2, r1, #0x41
    cmp r0, r2
    bhi .L_25d8
    sub r1, r1, #0x41
    cmp r0, r1
    beq .L_2a00
    b .L_2a80
.L_25d8:
    sub r1, r1, #0x39
    cmp r0, r1
    beq .L_2a78
    b .L_2a80
.L_25e8:
    add r2, r1, #0xa1
    cmp r0, r2
    bhi .L_2644
    bcs .L_2a38
    add r2, r1, #0x33
    cmp r0, r2
    bhi .L_2618
    bcs .L_29d8
    add r1, r1, #0x4
    cmp r0, r1
    beq .L_2a78
    b .L_2a80
.L_2618:
    add r2, r1, #0x47
    cmp r0, r2
    bhi .L_2634
    add r1, r1, #0x47
    cmp r0, r1
    beq .L_29d8
    b .L_2a80
.L_2634:
    add r1, r1, #0x9d
    cmp r0, r1
    beq .L_29d8
    b .L_2a80
.L_2644:
    add r2, r1, #0xe1
    cmp r0, r2
    bhi .L_2680
    bcs .L_2a58
    add r2, r1, #0xa2
    cmp r0, r2
    bhi .L_2670
    add r1, r1, #0xa2
    cmp r0, r1
    beq .L_2a40
    b .L_2a80
.L_2670:
    add r1, r1, #0xa3
    cmp r0, r1
    beq .L_2a40
    b .L_2a80
.L_2680:
    sub r1, r4, #0x5c
    cmp r0, r1
    bhi .L_2694
    beq .L_2a08
    b .L_2a80
.L_2694:
    sub r1, r4, #0x30
    cmp r0, r1
    beq .L_2a10
    b .L_2a80
.L_26a4:
    ldr r1, _LIT8
    cmp r0, r1
    bhi .L_2830
    bcs .L_2a38
    sub r2, r1, #0x51
    cmp r0, r2
    bhi .L_276c
    bcs .L_2a28
    sub r2, r1, #0xaf
    cmp r0, r2
    bhi .L_2720
    bcs .L_29e0
    sub r2, r1, #0xf1
    cmp r0, r2
    bhi .L_26f4
    bcs .L_2a00
    sub r1, r1, #0x110
    cmp r0, r1
    beq .L_2a50
    b .L_2a80
.L_26f4:
    sub r2, r1, #0xec
    cmp r0, r2
    bhi .L_2710
    sub r1, r1, #0xec
    cmp r0, r1
    beq .L_29d8
    b .L_2a80
.L_2710:
    sub r1, r1, #0xbd
    cmp r0, r1
    beq .L_29d8
    b .L_2a80
.L_2720:
    sub r2, r1, #0xa0
    cmp r0, r2
    bhi .L_2740
    bcs .L_2a78
    sub r1, r1, #0xac
    cmp r0, r1
    beq .L_29e0
    b .L_2a80
.L_2740:
    sub r2, r1, #0x59
    cmp r0, r2
    bhi .L_275c
    sub r1, r1, #0x59
    cmp r0, r1
    beq .L_2a60
    b .L_2a80
.L_275c:
    sub r1, r1, #0x52
    cmp r0, r1
    beq .L_2a28
    b .L_2a80
.L_276c:
    sub r2, r1, #0x23
    cmp r0, r2
    bhi .L_27c8
    bcs .L_29d8
    sub r2, r1, #0x39
    cmp r0, r2
    bhi .L_279c
    bcs .L_2a68
    sub r1, r1, #0x3a
    cmp r0, r1
    beq .L_2a68
    b .L_2a80
.L_279c:
    sub r2, r1, #0x38
    cmp r0, r2
    bhi .L_27b8
    sub r1, r1, #0x38
    cmp r0, r1
    beq .L_2a68
    b .L_2a80
.L_27b8:
    sub r1, r1, #0x37
    cmp r0, r1
    beq .L_2a68
    b .L_2a80
.L_27c8:
    sub r2, r1, #0x19
    cmp r0, r2
    bhi .L_2804
    bcs .L_29d8
    sub r2, r1, #0x20
    cmp r0, r2
    bhi .L_27f4
    sub r1, r1, #0x20
    cmp r0, r1
    beq .L_2a78
    b .L_2a80
.L_27f4:
    sub r1, r1, #0x1f
    cmp r0, r1
    beq .L_2a78
    b .L_2a80
.L_2804:
    sub r2, r1, #0x2
    cmp r0, r2
    bhi .L_2820
    sub r1, r1, #0x2
    cmp r0, r1
    beq .L_2a70
    b .L_2a80
.L_2820:
    sub r1, r1, #0x1
    cmp r0, r1
    beq .L_2a70
    b .L_2a80
.L_2830:
    add r2, r1, #0xc8
    cmp r0, r2
    bhi .L_2904
    bcs .L_2a28
    add r2, r1, #0x4b
    cmp r0, r2
    bhi .L_289c
    bcs .L_29d8
    add r2, r1, #0x5
    cmp r0, r2
    bhi .L_2870
    bcs .L_29e8
    add r1, r1, #0x1
    cmp r0, r1
    beq .L_2a48
    b .L_2a80
.L_2870:
    add r2, r1, #0x23
    cmp r0, r2
    bhi .L_288c
    add r1, r1, #0x23
    cmp r0, r1
    beq .L_2a70
    b .L_2a80
.L_288c:
    add r1, r1, #0x25
    cmp r0, r1
    beq .L_2a00
    b .L_2a80
.L_289c:
    add r2, r1, #0x7b
    cmp r0, r2
    bhi .L_28d8
    bcs .L_2a08
    add r2, r1, #0x52
    cmp r0, r2
    bhi .L_28c8
    add r1, r1, #0x52
    cmp r0, r1
    beq .L_29d8
    b .L_2a80
.L_28c8:
    add r1, r1, #0x53
    cmp r0, r1
    beq .L_29d8
    b .L_2a80
.L_28d8:
    add r2, r1, #0x7c
    cmp r0, r2
    bhi .L_28f4
    add r1, r1, #0x7c
    cmp r0, r1
    beq .L_2a10
    b .L_2a80
.L_28f4:
    add r1, r1, #0xc0
    cmp r0, r1
    beq .L_2a38
    b .L_2a80
.L_2904:
    add r2, r1, #0x188
    cmp r0, r2
    bhi .L_2960
    bcs .L_2a10
    add r2, r1, #0xca
    cmp r0, r2
    bhi .L_2934
    bcs .L_2a28
    add r1, r1, #0xc9
    cmp r0, r1
    beq .L_2a28
    b .L_2a80
.L_2934:
    add r2, r1, #0xed
    cmp r0, r2
    bhi .L_2950
    add r1, r1, #0xed
    cmp r0, r1
    beq .L_2a20
    b .L_2a80
.L_2950:
    add r1, r1, #0xf1
    cmp r0, r1
    beq .L_2a10
    b .L_2a80
.L_2960:
    add r2, r4, #0x2b8
    cmp r0, r2
    bhi .L_299c
    mov r1, r2
    cmp r0, r1
    bcs .L_2a28
    ldr r1, _LIT9
    cmp r0, r1
    bhi .L_298c
    beq .L_2a78
    b .L_2a80
.L_298c:
    add r1, r1, #0x1
    cmp r0, r1
    beq .L_2a78
    b .L_2a80
.L_299c:
    add r2, r1, #0x1a8
    cmp r0, r2
    bhi .L_29b8
    add r1, r1, #0x1a8
    cmp r0, r1
    beq .L_2a28
    b .L_2a80
.L_29b8:
    ldr r1, _LIT10
    cmp r0, r1
    beq .L_2a28
    b .L_2a80
.L_29c8:
    bl func_ov002_02272b98
    b .L_2ae0
.L_29d0:
    bl func_ov002_0227332c
    b .L_2ae0
.L_29d8:
    bl func_ov002_02272d30
    b .L_2ae0
.L_29e0:
    bl func_ov002_02273ad4
    b .L_2ae0
.L_29e8:
    bl func_ov002_02273b1c
    b .L_2ae0
.L_29f0:
    bl func_ov002_0227352c
    b .L_2ae0
.L_29f8:
    bl func_ov002_022737dc
    b .L_2ae0
.L_2a00:
    bl func_ov002_02273d74
    b .L_2ae0
.L_2a08:
    bl func_ov002_022742dc
    b .L_2ae0
.L_2a10:
    bl func_ov002_02274454
    b .L_2ae0
.L_2a18:
    bl func_ov002_022745f0
    b .L_2ae0
.L_2a20:
    bl func_ov002_02274880
    b .L_2ae0
.L_2a28:
    bl func_ov002_02274bc0
    b .L_2ae0
.L_2a30:
    bl func_ov002_022752b8
    b .L_2ae0
.L_2a38:
    bl func_ov002_02272e84
    b .L_2ae0
.L_2a40:
    bl func_ov002_02273b54
    b .L_2ae0
.L_2a48:
    bl func_ov002_0227309c
    b .L_2ae0
.L_2a50:
    bl func_ov002_02273218
    b .L_2ae0
.L_2a58:
    bl func_ov002_02273b94
    b .L_2ae0
.L_2a60:
    bl func_ov002_02273ca4
    b .L_2ae0
.L_2a68:
    bl func_ov002_02275670
    b .L_2ae0
.L_2a70:
    bl func_ov002_02275c28
    b .L_2ae0
.L_2a78:
    bl func_ov002_02273500
    b .L_2ae0
.L_2a80:
    bl func_0202eac8
    cmp r0, #0x0
    beq .L_2a94
    bl func_ov002_02272414
    b .L_2ae0
.L_2a94:
    ldr r0, _LIT0
    ldr r0, [r0]
    mov r0, r0, lsl #0x9
    mov r0, r0, lsr #0x11
    bl func_0202f050
    cmp r0, #0x0
    beq .L_2ab8
    bl func_ov002_022726b4
    b .L_2ae0
.L_2ab8:
    ldr r0, _LIT0
    ldr r0, [r0]
    mov r0, r0, lsl #0x9
    mov r0, r0, lsr #0x11
    bl func_0202b878
    cmp r0, #0x9
    bne .L_2adc
    bl func_ov002_02272a24
    b .L_2ae0
.L_2adc:
    bl func_ov002_02271ab4
.L_2ae0:
    cmp r0, #0x0
    bge .L_2b14
    ldr r4, _LIT0
    mov r1, #0x0
    ldrh r0, [r4, #0x16]
    mov r2, r1
    mov r3, r1
    orr r5, r0, #0x8
    mov r0, #0x29
    strh r5, [r4, #0x16]
    bl func_ov002_0229ade0
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_2b14:
    cmp r0, #0x1
    bne .L_2cdc
    ldr r1, _LIT0
    ldr r0, _LIT11
    ldrh r1, [r1, #0x6]
    mov r2, #0x1
    cmp r1, r0
    ldrne r0, _LIT12
    cmpne r1, r0
    ldr r0, _LIT0
    movne r2, #0x0
    ldr r0, [r0]
    mov r0, r0, lsl #0x1f
    eor r6, r2, r0, lsr #0x1f
    mov r0, r6
    bl func_ov002_021bc6c4
    ldr r4, _LIT0
    mov r7, r0
    ldrb r0, [r4, #0x8]
    mov r5, #0x0
    cmp r0, #0x0
    ble .L_2bc0
.L_2b6c:
    add r0, r4, r5, lsl #0x1
    ldrh r1, [r0, #0x10]
    and r0, r1, #0xff
    cmp r6, r0
    bne .L_2bb0
    mov r1, r1, asr #0x8
    mov r0, r6
    and r1, r1, #0xff
    bl func_ov002_021bc288
    cmp r0, #0x0
    beq .L_2bb0
    ldr r0, _LIT13
    mov r1, r5, lsl #0x1
    ldrh r0, [r0, r1]
    mov r0, r0, asr #0x8
    and r7, r0, #0xff
    b .L_2bc0
.L_2bb0:
    ldrb r0, [r4, #0x8]
    add r5, r5, #0x1
    cmp r5, r0
    blt .L_2b6c
.L_2bc0:
    cmp r7, #0x0
    bge .L_2be0
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    mov r0, #0x29
    bl func_ov002_0229ade0
    b .L_2c58
.L_2be0:
    ldr r0, _LIT0
    ldrh r1, [r0, #0x16]
    mov r1, r1, lsl #0x1e
    movs r1, r1, lsr #0x1f
    beq .L_2c20
    ldrb r1, [r0, #0x8]
    mov r2, r7
    str r1, [sp]
    ldr r1, [r0]
    mov r0, r1, lsl #0x1f
    mov r3, r1, lsl #0x18
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x17
    mov r3, r3, lsr #0x1e
    bl func_ov002_0227adcc
    b .L_2c58
.L_2c20:
    ldr r0, [r0]
    mov r2, r7
    mov r0, r0, lsl #0x18
    movs r0, r0, lsr #0x1e
    moveq r1, #0x1
    movne r1, #0x0
    ldr r0, _LIT0
    str r1, [sp]
    ldr r1, [r0]
    ldrb r3, [r0, #0x8]
    mov r0, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x17
    bl func_ov002_0227aa80
.L_2c58:
    ldr r1, _LIT0
    ldr r0, _LIT14
    ldr r2, [r1]
    mov r3, r2, lsl #0x9
    cmp r0, r3, lsr #0x11
    bne .L_2cd4
    ldrh r0, [r1, #0x16]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    beq .L_2cd4
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc6c4
    ldr r1, _LIT0
    mov r0, r0, lsl #0x10
    ldr r1, [r1]
    and r2, r0, #0x1f0000
    mov r0, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r0, r0, lsl #0x1f
    mov r3, r1, lsl #0x9
    and r0, r0, #-2147483648
    mov r4, r3, lsr #0x11
    orr r3, r0, #0x200000
    mov r0, r1, lsr #0x17
    mov r1, r0, lsl #0x10
    mov r0, r4, lsl #0x10
    orr r2, r3, r2
    orr r0, r2, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021e358c
.L_2cd4:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_2cdc:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022cd300
_LIT1: .word 0x00001894
_LIT2: .word 0x000015fa
_LIT3: .word 0x000013e9
_LIT4: .word 0x0000128c
_LIT5: .word 0x00000fdf
_LIT6: .word 0x0000112e
_LIT7: .word 0x00001725
_LIT8: .word 0x000019a5
_LIT9: .word 0x00001b2e
_LIT10: .word 0x00001b4e
_LIT11: .word 0x00001578
_LIT12: .word 0x00001a92
_LIT13: .word data_ov002_022cd310
_LIT14: .word 0x00001488
