; func_ov002_021afb8c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd65c
        .extern data_ov002_022cdb98
        .extern data_ov002_022cdba8
        .extern data_ov002_022cdfa8
        .extern data_ov002_022ce1a8
        .extern data_ov002_022ce4a8
        .extern data_ov002_022cf814
        .extern func_0202e1e0
        .extern func_ov002_021b939c
        .extern func_ov002_021b98d4
        .extern func_ov002_021b9950
        .extern func_ov002_021c3304
        .extern func_ov002_021c3528
        .extern func_ov002_0223dda4
        .extern func_ov002_0223de04
        .global func_ov002_021afb8c
        .arm
func_ov002_021afb8c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov r4, r0
    ldr r0, _LIT0
    mov r1, r4, lsl #0x1
    ldrh r0, [r0, r1]
    ldr r5, _LIT1
    and r9, r0, #0xff
    sub r0, r9, #0xb
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    b .L_44
    b .L_4c
    b .L_64
    b .L_54
    b .L_5c
    b .L_6c
    b .L_74
.L_44:
    mov r8, #0x1
    b .L_78
.L_4c:
    mov r8, #0x2
    b .L_78
.L_54:
    mov r8, #0x4
    b .L_78
.L_5c:
    mov r8, #0x8
    b .L_78
.L_64:
    mov r8, #0x10
    b .L_78
.L_6c:
    mov r8, #0x20
    b .L_78
.L_74:
    mov r8, #0x0
.L_78:
    ldr r0, [r5, r4, lsl #0x2]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_150
    sub r0, r9, #0xe
    cmp r0, #0x1
    bhi .L_150
    cmp r9, #0xe
    bne .L_e4
    ldr r0, [r5, r4, lsl #0x2]
    mov r1, r0, lsl #0x2
    mov r2, r0, lsl #0x12
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x18
    add r1, r0, r1, lsl #0x1
    bl func_ov002_021b98d4
    ldr r3, [r5, r4, lsl #0x2]
    ldr r1, _LIT2
    mov r2, r0
    mov r3, r3, lsl #0x12
    ldr r0, [r1, #0x4]
    mov r1, r3, lsr #0x1f
    bl func_ov002_021c3304
    cmp r0, #0x0
    orreq r8, r8, #0x80
.L_e4:
    cmp r9, #0xf
    bne .L_12c
    ldr r0, [r5, r4, lsl #0x2]
    mov r1, r0, lsl #0x2
    mov r2, r0, lsl #0x12
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x18
    add r1, r0, r1, lsl #0x1
    bl func_ov002_021b9950
    ldr r3, [r5, r4, lsl #0x2]
    ldr r1, _LIT2
    mov r2, r0
    mov r3, r3, lsl #0x12
    ldr r0, [r1, #0x4]
    mov r1, r3, lsr #0x1f
    bl func_ov002_021c3528
    cmp r0, #0x0
    orreq r8, r8, #0x80
.L_12c:
    ldr r0, [r5, r4, lsl #0x2]
    mov r0, r0, lsl #0xf
    mov r0, r0, lsr #0x1e
    cmp r0, #0x1
    beq .L_14c
    cmp r0, #0x2
    orreq r8, r8, #0x100
    b .L_150
.L_14c:
    orr r8, r8, #0x200
.L_150:
    ldr r0, [r5, r4, lsl #0x2]
    mov r0, r0, lsl #0xa
    movs r0, r0, lsr #0x1f
    orrne r8, r8, #0x40
    cmp r9, #0xf
    bne .L_1e0
    ldr r1, [r5, r4, lsl #0x2]
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    bl func_ov002_021b939c
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    and r1, r1, #0xff
    cmp r1, #0xf
    bne .L_1e0
    and r3, r0, #0xff
    ldr r1, _LIT3
    ldr r2, _LIT4
    and r3, r3, #0x1
    mla r1, r3, r1, r2
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0xf
    ldrh r0, [r0, r1]
    and r0, r0, #0xff
    cmp r0, #0x40
    beq .L_1dc
    cmp r0, #0x80
    andeq r0, r8, #0x3f
    orreq r8, r0, #0x800
    b .L_1e0
.L_1dc:
    orr r8, r8, #0x400
.L_1e0:
    ldr r0, _LIT5
    ldr r0, [r0, #0x484]
    subs r6, r0, #0x1
    bmi .L_288
    ldr r1, _LIT6
    mov r0, #0x18
    mla sl, r6, r0, r1
    mov fp, #0x0
.L_200:
    ldrh r0, [sl, #0x6]
    mov r7, fp
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    cmp r0, #0x0
    ble .L_27c
.L_218:
    mov r0, sl
    mov r1, r7
    bl func_ov002_0223de04
    ldr r2, [r5, r4, lsl #0x2]
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    cmp r0, r1
    bne .L_268
    mov r0, sl
    mov r1, r7
    bl func_ov002_0223dda4
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    and r0, r0, #0xff
    cmp r9, r0
    orreq r8, r8, #0x1000
.L_268:
    ldrh r0, [sl, #0x6]
    add r7, r7, #0x1
    mov r0, r0, lsl #0x18
    cmp r7, r0, lsr #0x18
    blt .L_218
.L_27c:
    sub sl, sl, #0x18
    subs r6, r6, #0x1
    bpl .L_200
.L_288:
    ldr r0, _LIT7
    ldr r1, [r5, r4, lsl #0x2]
    ldr r0, [r0, #0x4]
    mov r1, r1, lsl #0x12
    cmp r0, #0x4a
    ldr r0, _LIT2
    andeq r8, r8, #0x3f
    ldr r0, [r0, #0x4]
    eor r0, r0, #0x1
    cmp r0, r1, lsr #0x1f
    orreq r8, r8, #0x8000
    bicne r8, r8, #0x8000
    mov r0, r8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cdfa8
_LIT1: .word data_ov002_022cdba8
_LIT2: .word data_ov002_022cd65c
_LIT3: .word 0x00000868
_LIT4: .word data_ov002_022cf814
_LIT5: .word data_ov002_022ce1a8
_LIT6: .word data_ov002_022ce4a8
_LIT7: .word data_ov002_022cdb98
