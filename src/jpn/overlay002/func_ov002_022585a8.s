; func_ov002_022585a8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd65c
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf1a8
        .extern data_ov002_022d008c
        .extern func_0202b824
        .extern func_0202b86c
        .extern func_0202e1e0
        .extern func_02030538
        .extern func_0203141c
        .extern func_0203176c
        .extern func_ov002_021b3dec
        .extern func_ov002_021b8ea0
        .extern func_ov002_021bd030
        .extern func_ov002_021bd77c
        .extern func_ov002_021c9b08
        .extern func_ov002_021c9b68
        .extern func_ov002_021fd65c
        .extern func_ov002_0226ea58
        .extern func_ov002_0226f3ec
        .global func_ov002_022585a8
        .arm
func_ov002_022585a8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r8, r1
    ldr r1, _LIT0
    and r3, r8, #0x1
    mul r6, r3, r1
    ldr r3, _LIT1
    mov r7, r2
    add r3, r3, r6
    add r2, r3, #0x120
    ldr r3, [r2, r7, lsl #0x2]
    ldr r1, _LIT2
    mov r2, r3, lsl #0x2
    ldr r1, [r1, #0x4]
    mov r2, r2, lsr #0x18
    eor r1, r1, #0x1
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    mov r9, r0
    add r5, r2, r3, lsr #0x1f
    mov r4, #0x0
    cmp r8, r1
    moveq r0, r4
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    sub r1, r4, #0x1
    bl func_ov002_021bd77c
    cmp r0, #0x0
    beq .L_8c
    ldr r0, _LIT2
    ldr r0, [r0, #0x4]
    cmp r8, r0
    ldreq r0, _LIT3
    moveq r1, #0x10
    streq r1, [r0, #0xd80]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_8c:
    mov r0, r8
    mov r1, r9
    bl func_ov002_021c9b08
    cmp r0, #0x0
    bne .L_c0
    ldr r0, _LIT2
    ldr r0, [r0, #0x4]
    cmp r8, r0
    ldreq r0, _LIT3
    moveq r1, #0x17
    streq r1, [r0, #0xd80]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_c0:
    ldr r0, _LIT3
    ldr r0, [r0, #0xcf8]
    cmp r0, #0x2
    beq .L_e0
    cmp r0, #0x3
    beq .L_238
    cmp r0, #0x4
    bne .L_2e8
.L_e0:
    mov r0, r9
    bl func_0202b824
    cmp r0, #0x16
    cmpne r0, #0x17
    bne .L_154
    mov r0, r8
    mov r1, r9
    bl func_ov002_021bd030
    cmp r0, #0x0
    beq .L_144
    mov r0, r8
    mov r1, r7
    mov r2, r9
    bl func_ov002_021fd65c
    cmp r0, #0x0
    mov r0, r8
    orrne r4, r4, #0x8
    bl func_ov002_021c9b68
    cmp r0, #0x0
    beq .L_2e8
    mov r0, r9
    bl func_ov002_021b8ea0
    cmp r0, #0x0
    orreq r4, r4, #0x80
    b .L_2e8
.L_144:
    ldr r0, _LIT3
    mov r1, #0xc
    str r1, [r0, #0xd80]
    b .L_2e8
.L_154:
    mov r0, r9
    bl func_02030538
    cmp r0, #0x0
    beq .L_184
    ldr r2, _LIT3
    mov r3, #0xd
    mov r0, r8
    mov r1, r5
    str r3, [r2, #0xd80]
    bl func_ov002_0226f3ec
    orr r4, r4, r0
    b .L_1d8
.L_184:
    ldr r0, _LIT4
    ldr r0, [r0, r6]
    mov r0, r0, lsr #0x11
    tst r0, #0x1
    bne .L_1bc
    mov r0, r8
    mov r1, r5
    bl func_ov002_0226ea58
    orr r4, r4, r0
    mov r0, r8
    mov r1, r5
    bl func_ov002_0226f3ec
    orr r4, r4, r0
    b .L_1d8
.L_1bc:
    ldr r2, _LIT3
    mov r3, #0x2
    mov r0, r8
    mov r1, r5
    str r3, [r2, #0xd80]
    bl func_ov002_0226f3ec
    orr r4, r4, r0
.L_1d8:
    mov r0, r9
    bl func_0203176c
    cmp r0, #0x0
    beq .L_20c
    mov r0, r8
    mov r1, r9
    bl func_ov002_021bd030
    cmp r0, #0x0
    beq .L_20c
    mov r0, r8
    bl func_ov002_021c9b68
    cmp r0, #0x0
    orrne r4, r4, #0x80
.L_20c:
    mov r0, r9
    bl func_0203141c
    cmp r0, #0x0
    beq .L_2e8
    mov r0, r8
    mov r1, r7
    mov r2, r9
    bl func_ov002_021fd65c
    cmp r0, #0x0
    orrne r4, r4, #0x8
    b .L_2e8
.L_238:
    mov r0, r9
    bl func_0202b824
    cmp r0, #0x16
    beq .L_254
    cmp r0, #0x17
    beq .L_2b4
    b .L_2dc
.L_254:
    mov r0, r9
    bl func_0202b86c
    cmp r0, #0x5
    beq .L_274
    ldr r0, _LIT3
    mov r1, #0x5
    str r1, [r0, #0xd80]
    b .L_2e8
.L_274:
    mov r0, r8
    mov r1, r9
    bl func_ov002_021bd030
    cmp r0, #0x0
    beq .L_2a4
    mov r0, r8
    mov r1, r7
    mov r2, r9
    bl func_ov002_021fd65c
    cmp r0, #0x0
    orrne r4, r4, #0x8
    b .L_2e8
.L_2a4:
    ldr r0, _LIT3
    mov r1, #0xc
    str r1, [r0, #0xd80]
    b .L_2e8
.L_2b4:
    ldr r3, _LIT3
    mov r5, #0xf
    mov r0, r8
    mov r1, r7
    mov r2, r9
    str r5, [r3, #0xd80]
    bl func_ov002_021fd65c
    cmp r0, #0x0
    orrne r4, r4, #0x8
    b .L_2e8
.L_2dc:
    ldr r0, _LIT3
    mov r1, #0x6
    str r1, [r0, #0xd80]
.L_2e8:
    mov r0, r9
    bl func_0202e1e0
    cmp r0, #0x0
    bne .L_310
    ldr r2, _LIT5
    mov r0, #0x0
    mov r1, #0xb
    bl func_ov002_021b3dec
    cmp r0, #0x0
    bicne r4, r4, #0x88
.L_310:
    mov r0, r4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022cd65c
_LIT3: .word data_ov002_022d008c
_LIT4: .word data_ov002_022cf1a8
_LIT5: .word 0x00001407
