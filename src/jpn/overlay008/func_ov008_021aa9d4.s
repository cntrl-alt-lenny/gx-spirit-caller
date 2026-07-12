; func_ov008_021aa9d4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov008_021b2660
        .extern data_ov008_021b2b60
        .extern data_ov008_021b2d8c
        .extern func_0200dda8
        .extern func_0200e9a8
        .extern func_020210c8
        .extern func_02021104
        .extern func_020221e0
        .extern func_020221f8
        .extern func_0208c79c
        .extern func_0208e038
        .extern func_0208e0e4
        .extern func_02094410
        .extern func_ov008_021aa42c
        .extern func_ov008_021aa820
        .extern func_ov008_021ab428
        .extern func_ov008_021abbfc
        .extern func_ov008_021ac1cc
        .extern func_ov008_021ac27c
        .extern func_ov008_021aca9c
        .extern func_ov008_021ad44c
        .extern func_ov008_021ad984
        .extern func_ov008_021ae550
        .extern func_ov008_021ae5e8
        .extern func_ov008_021b00b4
        .extern func_ov008_021b08f0
        .extern func_ov008_021b0aa0
        .extern func_ov008_021b15d4
        .extern func_ov008_021b1780
        .extern func_ov008_021b1f04
        .extern func_ov008_021b2120
        .global func_ov008_021aa9d4
        .arm
func_ov008_021aa9d4:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r4, #0x0
    mov r5, r4
    bl func_ov008_021aa42c
    ldr r0, _LIT0
    ldrh r1, [r0]
    cmp r1, #0xa
    addls pc, pc, r1, lsl #0x2
    b .L_2c8
    b .L_50
    b .L_8c
    b .L_f4
    b .L_158
    b .L_174
    b .L_1a8
    b .L_1b8
    b .L_1d8
    b .L_1f4
    b .L_248
    b .L_2a0
.L_50:
    ldrh r1, [r0, #0x2]
    add r1, r1, #0x2
    strh r1, [r0, #0x2]
    ldrh r0, [r0, #0x2]
    cmp r0, #0x4
    bne .L_2c8
    mov r0, #0x1
    bl func_ov008_021b1780
    bl func_ov008_021ab428
    ldr r0, _LIT0
    mov r1, r4
    strh r1, [r0, #0x2]
    mov r1, #0x1
    strh r1, [r0]
    b .L_2c8
.L_8c:
    ldrh r1, [r0, #0x2]
    ldr r5, _LIT1
    cmp r1, #0x10
    movcs r1, #0x2
    strcsh r1, [r0]
    ldr r0, _LIT0
    ldrh r0, [r0, #0x2]
    cmp r0, #0x2
    bne .L_d8
    mov r2, #0x4000000
    ldr r0, [r2]
    add r1, r2, #0x1000
    bic r0, r0, #0x1f00
    orr r0, r0, #0xf00
    str r0, [r2]
    ldr r0, [r1]
    bic r0, r0, #0x1f00
    orr r0, r0, #0x1c00
    str r0, [r1]
.L_d8:
    ldr r1, _LIT0
    mov r0, #0x0
    ldrh r2, [r1, #0x2]
    add r2, r2, #0x2
    strh r2, [r1, #0x2]
    bl func_ov008_021b1f04
    b .L_2c8
.L_f4:
    bl func_ov008_021ad44c
    cmp r0, #0x1
    beq .L_11c
    cmp r0, #0x2
    beq .L_12c
    cmp r0, #0x3
    ldreq r0, _LIT0
    moveq r1, #0x6
    streqh r1, [r0]
    b .L_150
.L_11c:
    ldr r0, _LIT0
    mov r1, #0x3
    strh r1, [r0]
    b .L_150
.L_12c:
    ldr r1, _LIT0
    mov r0, r4
    strh r0, [r1, #0x2]
    mov r2, #0xa
    strh r2, [r1]
    bl func_020221f8
    orr r1, r0, #0x1
    mov r0, r4
    bl func_020221e0
.L_150:
    ldr r5, _LIT1
    b .L_2c8
.L_158:
    mov r0, r4
    bl func_ov008_021ad984
    ldr r0, _LIT0
    mov r1, #0x4
    strh r1, [r0]
    ldr r5, _LIT2
    b .L_2c8
.L_174:
    bl func_ov008_021ae5e8
    cmp r0, #0x4
    beq .L_194
    cmp r0, #0x5
    ldreq r0, _LIT0
    moveq r1, #0x6
    streqh r1, [r0]
    b .L_1a0
.L_194:
    ldr r0, _LIT0
    mov r1, #0x5
    strh r1, [r0]
.L_1a0:
    ldr r5, _LIT3
    b .L_2c8
.L_1a8:
    mov r1, #0x2
    strh r1, [r0]
    ldr r5, _LIT2
    b .L_2c8
.L_1b8:
    bl func_ov008_021b00b4
    mov r0, r4
    bl func_ov008_021b1780
    ldr r0, _LIT0
    mov r1, #0x7
    strh r1, [r0]
    ldr r5, _LIT4
    b .L_2c8
.L_1d8:
    bl func_ov008_021b0aa0
    cmp r0, #0x1
    ldreq r0, _LIT0
    moveq r1, #0x8
    streqh r1, [r0]
    ldr r5, _LIT4
    b .L_2c8
.L_1f4:
    bl func_ov008_021b15d4
    ldr r1, _LIT0
    ldr r0, _LIT5
    ldrh r3, [r1, #0x10]
    mov r2, #0x9
    ldr r5, _LIT2
    str r3, [r0, #0x10]
    strh r2, [r1]
    bl func_0208e0e4
    mov r1, r0
    mov r0, r4
    mov r2, #0x600
    bl func_02094410
    bl func_0208e038
    mov r1, r0
    mov r0, r4
    mov r2, #0x600
    bl func_02094410
    mov r0, #0x1
    bl func_ov008_021b1780
    b .L_2c8
.L_248:
    mov r7, r4
    mov r6, #0x7
    ldr r5, _LIT6
    b .L_268
.L_258:
    mov r0, r7
    mov r1, r7
    bl func_ov008_021ac27c
    add r7, r7, #0x1
.L_268:
    ldrh r0, [r5, #0x5a]
    cmp r0, #0x6
    movhi r0, r6
    cmp r7, r0
    blt .L_258
    bl func_ov008_021ac1cc
    mov r0, #0x1
    bl func_ov008_021ad984
    bl func_ov008_021aa820
    ldr r0, _LIT0
    mov r1, #0x2
    strh r1, [r0]
    ldr r5, _LIT2
    b .L_2c8
.L_2a0:
    ldrh r1, [r0, #0x2]
    ldr r5, _LIT1
    cmp r1, #0x10
    movhi r1, #0x2
    strhih r1, [r0]
    ldr r0, _LIT0
    movhi r4, #0x1
    ldrh r1, [r0, #0x2]
    add r1, r1, #0x1
    strh r1, [r0, #0x2]
.L_2c8:
    bl func_020210c8
    bl func_0200dda8
    cmp r5, #0x0
    beq .L_2dc
    blx r5
.L_2dc:
    bl func_ov008_021b2120
    bl func_02021104
    bl func_0200e9a8
    ldr r1, _LIT7
    mov r2, #0x1
    ldr r0, _LIT0
    str r2, [r1]
    mov r1, #0x0
    str r1, [r0, #0x634]
    cmp r4, #0x0
    beq .L_320
    ldr r0, _LIT8
    sub r1, r1, #0x10
    bl func_0208c79c
    ldr r0, _LIT9
    mvn r1, #0xf
    bl func_0208c79c
.L_320:
    mov r0, r4
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov008_021b2660
_LIT1: .word func_ov008_021aca9c
_LIT2: .word func_ov008_021abbfc
_LIT3: .word func_ov008_021ae550
_LIT4: .word func_ov008_021b08f0
_LIT5: .word data_ov008_021b2d8c
_LIT6: .word data_ov008_021b2b60
_LIT7: .word 0x04000540
_LIT8: .word 0x0400006c
_LIT9: .word 0x0400106c
