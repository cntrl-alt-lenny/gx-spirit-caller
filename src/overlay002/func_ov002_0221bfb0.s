; func_ov002_0221bfb0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern data_ov002_022d0e6c
        .extern func_0202b100
        .extern func_0202e234
        .extern func_ov002_021ae400
        .extern func_ov002_021ae430
        .extern func_ov002_021b00d0
        .extern func_ov002_021b9b64
        .extern func_ov002_021d7c1c
        .extern func_ov002_021d87a4
        .extern func_ov002_022028c8
        .extern func_ov002_0221beac
        .extern func_ov002_022592ec
        .extern func_ov002_02259324
        .extern func_ov002_022593f4
        .extern func_ov002_0226b1b4
        .extern func_ov002_0227adb8
        .extern func_ov002_0229cf10
        .global func_ov002_0221bfb0
        .arm
func_ov002_0221bfb0:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x100
    mov r4, r0
    ldrh r2, [r4, #0x4]
    mov r2, r2, lsl #0x1d
    movs r2, r2, lsr #0x1f
    addne sp, sp, #0x100
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r2, _LIT0
    ldr r3, [r2, #0x5a8]
    sub r3, r3, #0x76
    cmp r3, #0xa
    addls pc, pc, r3, lsl #0x2
    b .L_564
    b .L_4fc
    b .L_454
    b .L_3f8
    b .L_344
    b .L_2e8
    b .L_244
    b .L_230
    b .L_18c
    b .L_154
    b .L_b0
    b .L_68
.L_68:
    bl func_ov002_022028c8
    cmp r0, #0x0
    addeq sp, sp, #0x100
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldrh r0, [r4, #0x6]
    mov r1, #0x49
    bic r0, r0, #0xff00
    strh r0, [r4, #0x6]
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    ldr r0, _LIT1
    bl func_ov002_022592ec
    add sp, sp, #0x100
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_b0:
    bl func_ov002_022593f4
    cmp r0, #0x0
    addeq sp, sp, #0x100
    moveq r0, #0x80
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldrh r0, [r4, #0x2]
    ldr r5, _LIT2
    ldr r1, _LIT3
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r3, r0, #0x1
    mla r1, r3, r1, r5
    ldr r2, _LIT4
    add r1, r1, #0x120
    ldr r5, [r2, #0xd78]
    ldr r3, [r1, r5, lsl #0x2]
    mov r1, #0xb
    mov r2, r3, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    add r2, r2, r3, lsr #0x1f
    bl func_ov002_021d87a4
    ldrh r1, [r4, #0x6]
    add sp, sp, #0x100
    mov r0, #0x7e
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x18
    add r1, r4, r1, lsl #0x1
    strh r5, [r1, #0x8]
    ldrh r2, [r4, #0x6]
    mov r1, r2, lsl #0x10
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    bic r2, r2, #0xff00
    mov r1, r1, lsl #0x18
    orr r1, r2, r1, lsr #0x10
    strh r1, [r4, #0x6]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_154:
    add r0, sp, #0x0
    mov r1, #0x4b
    mov r2, #0x2
    bl func_ov002_0229cf10
    ldrh r0, [r4, #0x2]
    add r1, sp, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    ldr r0, _LIT1
    bl func_ov002_022592ec
    add sp, sp, #0x100
    mov r0, #0x7d
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_18c:
    bl func_ov002_022593f4
    cmp r0, #0x0
    addeq sp, sp, #0x100
    moveq r0, #0x7e
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldrh r0, [r4, #0x2]
    ldr r5, _LIT2
    ldr r1, _LIT3
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r3, r0, #0x1
    mla r1, r3, r1, r5
    ldr r2, _LIT4
    add r1, r1, #0x120
    ldr r5, [r2, #0xd78]
    ldr r3, [r1, r5, lsl #0x2]
    mov r1, #0xb
    mov r2, r3, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    add r2, r2, r3, lsr #0x1f
    bl func_ov002_021d87a4
    ldrh r1, [r4, #0x6]
    add sp, sp, #0x100
    mov r0, #0x7c
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x18
    add r1, r4, r1, lsl #0x1
    strh r5, [r1, #0x8]
    ldrh r2, [r4, #0x6]
    mov r1, r2, lsl #0x10
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    bic r2, r2, #0xff00
    mov r1, r1, lsl #0x18
    orr r1, r2, r1, lsr #0x10
    strh r1, [r4, #0x6]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_230:
    ldr r0, _LIT1
    bl func_ov002_02259324
    add sp, sp, #0x100
    mov r0, #0x7b
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_244:
    bl func_ov002_022593f4
    cmp r0, #0x0
    addeq sp, sp, #0x100
    moveq r0, #0x7c
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldrh r0, [r4, #0x2]
    ldr r5, _LIT2
    ldr r1, _LIT3
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r3, r0, #0x1
    mla r1, r3, r1, r5
    ldr r2, _LIT4
    add r1, r1, #0x120
    ldr r5, [r2, #0xd78]
    ldr r3, [r1, r5, lsl #0x2]
    mov r1, #0xb
    mov r2, r3, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    add r2, r2, r3, lsr #0x1f
    bl func_ov002_021d87a4
    ldrh r1, [r4, #0x6]
    add sp, sp, #0x100
    mov r0, #0x7a
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x18
    add r1, r4, r1, lsl #0x1
    strh r5, [r1, #0x8]
    ldrh r2, [r4, #0x6]
    mov r1, r2, lsl #0x10
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    bic r2, r2, #0xff00
    mov r1, r1, lsl #0x18
    orr r1, r2, r1, lsr #0x10
    strh r1, [r4, #0x6]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_2e8:
    mov r5, #0x2
.L_2ec:
    add r0, r5, #0x1
    bl func_ov002_021b00d0
    add r1, r4, r5, lsl #0x1
    add r3, r4, r0, lsl #0x1
    sub r5, r5, #0x1
    ldrh r2, [r3, #0x8]
    ldrh r0, [r1, #0x8]
    cmp r5, #0x0
    strh r0, [r3, #0x8]
    strh r2, [r1, #0x8]
    bgt .L_2ec
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    add r2, r4, #0x8
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    mov r3, #0x3
    bl func_ov002_0226b1b4
    add sp, sp, #0x100
    mov r0, #0x79
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_344:
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT5
    ldr r3, _LIT2
    mov r0, r0, lsl #0x1f
    mov r2, r0, lsr #0x1f
    ldr r0, _LIT3
    and r2, r2, #0x1
    mla r3, r2, r0, r3
    ldrh r1, [r1, #0xb0]
    mov r2, #0x0
.L_36c:
    add r0, r4, r2, lsl #0x1
    ldrh r0, [r0, #0x8]
    add r0, r3, r0, lsl #0x2
    ldr r0, [r0, #0x120]
    mov r0, r0, lsl #0x13
    cmp r1, r0, lsr #0x13
    ldreq r0, _LIT0
    streq r2, [r0, #0x5ac]
    beq .L_39c
    add r2, r2, #0x1
    cmp r2, #0x3
    blt .L_36c
.L_39c:
    ldrh r0, [r4, #0x2]
    ldr r5, _LIT2
    ldr r1, _LIT3
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r3, r0, #0x1
    mla r5, r3, r1, r5
    ldr r2, _LIT0
    add r3, r5, #0x120
    ldr r1, [r2, #0x5ac]
    add r1, r4, r1, lsl #0x1
    ldrh r2, [r1, #0x8]
    mov r1, #0xb
    ldr r3, [r3, r2, lsl #0x2]
    mov r2, r3, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    add r2, r2, r3, lsr #0x1f
    bl func_ov002_021d87a4
    add sp, sp, #0x100
    mov r0, #0x78
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_3f8:
    ldrh r3, [r4, #0x2]
    ldr r1, [r2, #0x5ac]
    ldr r0, _LIT3
    mov r2, r3, lsl #0x1f
    mov r3, r2, lsr #0x1f
    ldr r2, _LIT2
    and r3, r3, #0x1
    mla r2, r3, r0, r2
    add r0, r4, r1, lsl #0x1
    ldrh r0, [r0, #0x8]
    add r0, r2, r0, lsl #0x2
    ldr r0, [r0, #0x120]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b100
    ldrh r2, [r4, #0x2]
    mov r1, r0
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae430
    add sp, sp, #0x100
    mov r0, #0x77
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_454:
    ldr r0, _LIT2
    ldr r2, _LIT3
    mov r1, #0x0
.L_460:
    ldrh r3, [r4, #0x2]
    add r6, r4, r1, lsl #0x1
    add r1, r1, #0x1
    mov r3, r3, lsl #0x1f
    mov r3, r3, lsr #0x1f
    and r3, r3, #0x1
    mla r5, r3, r2, r0
    ldrh r3, [r6, #0x8]
    add r5, r5, #0x120
    cmp r1, #0x3
    ldr r5, [r5, r3, lsl #0x2]
    mov r3, r5, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r5, r5, lsl #0x12
    mov r3, r3, lsl #0x1
    add r3, r3, r5, lsr #0x1f
    strh r3, [r6, #0x8]
    blt .L_460
    mov r5, #0x0
    ldr r6, _LIT0
    mov r7, r5
.L_4b4:
    ldr r0, [r6, #0x5ac]
    cmp r5, r0
    beq .L_4e4
    add r0, r4, r5, lsl #0x1
    ldrh r0, [r0, #0x8]
    bl func_ov002_021b9b64
    ldrh r3, [r4, #0x2]
    mov r1, r0
    mov r2, r7
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021d7c1c
.L_4e4:
    add r5, r5, #0x1
    cmp r5, #0x3
    blt .L_4b4
    add sp, sp, #0x100
    mov r0, #0x76
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_4fc:
    ldr r0, [r2, #0x5ac]
    add r0, r4, r0, lsl #0x1
    ldrh r0, [r0, #0x8]
    bl func_ov002_021b9b64
    mov r5, r0
    ldr r0, [r5]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e234
    cmp r0, #0x0
    ldrh r0, [r4, #0x2]
    mov r1, r5
    beq .L_548
    mov r0, r0, lsl #0x1f
    mov r2, #0x1
    mov r0, r0, lsr #0x1f
    mov r3, #0x0
    bl func_ov002_0227adb8
    b .L_558
.L_548:
    mov r0, r0, lsl #0x1f
    mov r2, #0x0
    mov r0, r0, lsr #0x1f
    bl func_ov002_021d7c1c
.L_558:
    add sp, sp, #0x100
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_564:
    mov r0, #0x0
    add sp, sp, #0x100
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word func_ov002_0221beac
_LIT2: .word data_ov002_022cf16c
_LIT3: .word 0x00000868
_LIT4: .word data_ov002_022d016c
_LIT5: .word data_ov002_022d0e6c
