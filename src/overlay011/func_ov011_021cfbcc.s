; func_ov011_021cfbcc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020bef80
        .extern data_ov011_021d4000
        .extern data_ov011_021d403c
        .extern func_0202c0c0
        .extern func_ov000_021ab4ec
        .extern func_ov000_021ab520
        .extern func_ov000_021ab564
        .extern func_ov000_021ab5ac
        .extern func_ov000_021ab8f8
        .extern func_ov000_021ace4c
        .extern func_ov000_021acef8
        .extern func_ov000_021add44
        .extern func_ov000_021af378
        .extern func_ov011_021c9d60
        .extern func_ov011_021c9d80
        .extern func_ov011_021ca600
        .extern func_ov011_021ca67c
        .extern func_ov011_021cb218
        .extern func_ov011_021cc7f8
        .extern func_ov011_021cd638
        .extern func_ov011_021cdb94
        .extern func_ov011_021ce324
        .extern func_ov011_021cf048
        .extern func_ov011_021cf060
        .extern func_ov011_021cf2dc
        .extern func_ov011_021cfb70
        .global func_ov011_021cfbcc
        .arm
func_ov011_021cfbcc:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r0, _LIT0
    ldr r4, _LIT1
    ldr r0, [r0, #0x2b0]
    mov r0, r0, lsl #0xb
    mov r0, r0, lsr #0x18
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r3, r4, r5, pc}
    ldmia sp!, {r3, r4, r5, pc}
    b .L_98
    b .L_d8
    b .L_1a4
    b .L_224
    b .L_2fc
.L_98:
    bl func_ov011_021cf060
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_ov011_021cf048
    bl func_ov011_021cc7f8
    bl func_ov011_021cdb94
    ldr r2, [r4, #0x274]
    ldr r0, _LIT2
    mov r1, r2, lsl #0xb
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    and r2, r2, r0
    mov r0, r1, lsl #0x18
    orr r0, r2, r0, lsr #0xb
    str r0, [r4, #0x274]
    ldmia sp!, {r3, r4, r5, pc}
.L_d8:
    ldr r5, [r4, #0x288]
    mov r0, #0x0
    mov r1, #0x3f
    bl func_ov000_021ab564
    mov r0, #0x0
    mov r1, #0x3f
    bl func_ov000_021ab520
    cmp r5, #0x0
    bne .L_100
    bl func_ov011_021c9d80
.L_100:
    cmp r5, #0x100
    blt .L_140
    sub r0, r5, #0x100
    cmp r0, #0x100
    movgt r0, #0x100
    mov r1, r0, lsl #0xe
    mov r0, r1, asr #0x7
    add r0, r1, r0, lsr #0x18
    mov r1, r0, asr #0xc
    ldr r0, _LIT3
    mov r1, r1, lsl #0x2
    ldrsh r1, [r0, r1]
    mov r0, #0x0
    mov r1, r1, lsl #0x4
    mov r1, r1, asr #0xc
    bl func_ov000_021ab5ac
.L_140:
    add r0, r5, #0x14
    str r0, [r4, #0x288]
    cmp r0, #0x200
    ldmleia sp!, {r3, r4, r5, pc}
    ldr r2, [r4, #0x274]
    ldr r0, _LIT2
    mov r1, r2, lsl #0xb
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    and r2, r2, r0
    mov r0, r1, lsl #0x18
    orr r2, r2, r0, lsr #0xb
    mov r0, #0x0
    mov r1, #0x10
    str r0, [r4, #0x288]
    str r2, [r4, #0x274]
    bl func_ov000_021ab5ac
    bl func_ov000_021ab8f8
    mov r0, #0x1
    bl func_ov011_021ce324
    mov r0, #0x1
    bl func_ov000_021ace4c
    mov r0, #0x0
    bl func_ov000_021acef8
    ldmia sp!, {r3, r4, r5, pc}
.L_1a4:
    ldr r0, [r4, #0x288]
    mov r1, #0x8
    add r5, r0, #0x8
    cmp r5, #0xff
    movgt r5, #0xff
    mov r0, #0x0
    str r5, [r4, #0x288]
    bl func_ov000_021ab4ec
    mov r1, r5, lsl #0xe
    ldr r2, _LIT4
    mov r0, r1, lsr #0x1f
    smull r1, r3, r2, r1
    add r3, r3, r5, lsl #0xe
    add r3, r0, r3, asr #0x7
    add r0, r3, #0x4000
    mov r1, r0, asr #0x4
    ldr r0, _LIT3
    mov r1, r1, lsl #0x2
    ldrsh r1, [r0, r1]
    mov r0, #0x0
    mov r1, r1, lsl #0x4
    mov r1, r1, asr #0xc
    bl func_ov000_021ab5ac
    cmp r5, #0xff
    bne .L_21c
    bl func_ov011_021c9d60
    bl func_ov011_021cfb70
    mov r0, #0x0
    str r0, [r4, #0x288]
    bl func_ov011_021ca600
.L_21c:
    bl func_ov011_021cd638
    ldmia sp!, {r3, r4, r5, pc}
.L_224:
    ldr r5, [r4, #0x288]
    cmp r5, #0x0
    bne .L_234
    bl func_ov011_021c9d80
.L_234:
    add r5, r5, #0x10
    cmp r5, #0xff
    movgt r5, #0xff
    mov r0, #0x0
    mov r1, #0x1
    str r5, [r4, #0x288]
    bl func_ov000_021ab4ec
    mov r1, r5, lsl #0xe
    ldr r2, _LIT4
    mov r0, r1, lsr #0x1f
    smull r1, r3, r2, r1
    add r3, r3, r5, lsl #0xe
    add r3, r0, r3, asr #0x7
    mov r1, r3, asr #0x4
    ldr r0, _LIT3
    mov r1, r1, lsl #0x2
    ldrsh r1, [r0, r1]
    mov r0, #0x0
    mov r1, r1, lsl #0x4
    mov r1, r1, asr #0xc
    bl func_ov000_021ab5ac
    cmp r5, #0xff
    bne .L_2f4
    bl func_ov000_021af378
    cmp r0, #0x0
    bne .L_2f4
    ldr r2, [r4, #0x274]
    ldr r0, _LIT2
    mov r1, r2, lsl #0xb
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    and r2, r2, r0
    mov r0, r1, lsl #0x18
    orr r3, r2, r0, lsr #0xb
    mov r2, #0x200
    mov r0, #0x0
    mov r1, #0x10
    str r3, [r4, #0x274]
    str r2, [r4, #0x288]
    bl func_ov000_021ab5ac
    bl func_ov000_021ab8f8
    mov r0, #0x0
    bl func_ov011_021ce324
    mov r0, #0x0
    bl func_ov000_021ace4c
    mov r0, #0x0
    bl func_ov000_021acef8
    bl func_ov011_021c9d60
.L_2f4:
    bl func_ov011_021cd638
    ldmia sp!, {r3, r4, r5, pc}
.L_2fc:
    ldr r0, [r4, #0x288]
    mov r1, #0x3f
    subs r5, r0, #0x14
    movmi r5, #0x0
    mov r0, #0x0
    str r5, [r4, #0x288]
    bl func_ov000_021ab564
    mov r0, #0x0
    mov r1, #0x3f
    bl func_ov000_021ab520
    cmp r5, #0x100
    blt .L_364
    sub r0, r5, #0x100
    cmp r0, #0x100
    movgt r0, #0x100
    mov r1, r0, lsl #0xe
    mov r0, r1, asr #0x7
    add r0, r1, r0, lsr #0x18
    mov r1, r0, asr #0xc
    ldr r0, _LIT3
    mov r1, r1, lsl #0x2
    ldrsh r1, [r0, r1]
    mov r0, #0x0
    mov r1, r1, lsl #0x4
    mov r1, r1, asr #0xc
    bl func_ov000_021ab5ac
.L_364:
    cmp r5, #0x100
    ldmgeia sp!, {r3, r4, r5, pc}
    mov r0, #0x0
    mov r1, r0
    str r0, [r4, #0x288]
    bl func_ov000_021ab5ac
    bl func_ov011_021cf2dc
    cmp r0, #0x0
    beq .L_398
    ldr r0, _LIT5
    bl func_0202c0c0
    mov r1, #0x0
    bl func_ov000_021add44
.L_398:
    ldr r0, [r4, #0x280]
    orr r0, r0, #0x200
    str r0, [r4, #0x280]
    bl func_ov011_021cb218
    ldr r0, [r4, #0x270]
    orr r0, r0, #0x10000
    str r0, [r4, #0x270]
    bl func_ov011_021cfb70
    bl func_ov011_021ca67c
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov011_021d4000
_LIT1: .word data_ov011_021d403c
_LIT2: .word 0xffe01fff
_LIT3: .word data_020bef80
_LIT4: .word 0x80808081
_LIT5: .word 0x000004b3
