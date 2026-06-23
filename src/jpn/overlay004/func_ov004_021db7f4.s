; func_ov004_021db7f4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_InvokeLocked
        .extern Task_PostLocked
        .extern data_02103fcc
        .extern data_02104e6c
        .extern data_ov004_0220b2a0
        .extern data_ov004_0221133c
        .extern data_ov004_02291340
        .extern data_ov004_02291388
        .extern func_0200195c
        .extern func_02001d48
        .extern func_02005910
        .extern func_020062b0
        .extern func_020062f8
        .extern func_0200886c
        .extern func_0200a978
        .extern func_0200a9c0
        .extern func_0202ada4
        .extern func_0202c06c
        .extern func_02045570
        .extern func_02045830
        .extern func_0208c79c
        .extern func_0208c7c8
        .extern func_0208c858
        .extern func_0208cebc
        .extern func_0208cf48
        .extern func_0208cfd4
        .extern func_0208d050
        .extern func_0208e2f4
        .extern func_0209372c
        .extern func_02094410
        .extern func_02094500
        .extern func_ov004_021d855c
        .extern func_ov004_021d86ac
        .extern func_ov004_021d8be4
        .extern func_ov004_021e7c1c_unk
        .global func_ov004_021db7f4
        .arm
func_ov004_021db7f4:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r0, _LIT0
    ldr r2, _LIT1
    mov r1, #0x0
    bl func_02094500
    mov r3, #0x10
    ldr r2, _LIT0
    ldr r0, _LIT2
    rsb r1, r3, #0x0
    str r3, [r2, #0x5c]
    bl func_0208c79c
    ldr r1, _LIT0
    ldr r0, _LIT3
    ldr r1, [r1, #0x5c]
    rsb r1, r1, #0x0
    bl func_0208c79c
    ldr r1, _LIT4
    ldrh r0, [r1]
    orr r0, r0, #0x8000
    strh r0, [r1]
    bl func_02005910
    ldr r1, _LIT5
    mov r0, #0x0
    mov r2, #0x400
    bl func_02094410
    ldr r4, _LIT6
    ldr r1, _LIT7
    ldr r2, [r4]
    mov r0, #0x4
    bic r2, r2, #0x1f00
    str r2, [r4]
    ldr r3, [r4]
    mov r2, #0x80000
    bic r3, r3, #0xe000
    str r3, [r4]
    bl func_0200195c
    ldr r0, _LIT8
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d48
    ldr r0, _LIT9
    bl func_0202ada4
    mov r0, #0x4
    bl func_0208d050
    mov r0, #0x8
    bl func_0208cfd4
    mov r0, #0x80
    bl func_0208cf48
    mov r0, #0x100
    bl func_0208cebc
    mov r0, #0x0
    bl func_0208c7c8
    mov r2, r4
    ldr r1, [r2]
    ldr r0, _LIT10
    orr r1, r1, #0x10000
    str r1, [r2]
    bl func_ov004_021d855c
    mov r1, #0x1c
    add r0, r4, #0x50
    sub r2, r1, #0x2c
    bl func_0208e2f4
    add r0, r4, #0x6c
    mov r1, #0x0
    bl func_0208c79c
    mov r0, #0xe8
    bl func_0202c06c
    mov r1, r0
    ldr r0, _LIT10
    mov r2, #0x1
    bl func_ov004_021d86ac
    bl func_0200886c
    ldr r0, _LIT10
    bl func_ov004_021d8be4
    bl func_0200a9c0
    bl func_020062f8
    bl func_02045570
    mov r4, #0x1
    mov r0, #0x40000
    mov r1, #0x4
    mov r2, #0x0
    mov r5, r4
    bl Task_PostLocked
    mov r6, r0
    mov r0, #0x2
    bl func_02045830
    ldr r0, _LIT11
    ldr r0, [r0, #0x34]
    cmp r0, #0x0
    beq .L_180
    cmp r0, #0x1
    beq .L_188
    cmp r0, #0x2
    moveq r4, #0x0
    b .L_18c
.L_180:
    mov r4, #0x10
    b .L_18c
.L_188:
    mov r4, #0x20
.L_18c:
    ldr r0, _LIT8
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    b .L_1ec
    b .L_1c0
    b .L_1c8
    b .L_1d0
    b .L_1d8
    b .L_1e0
    b .L_1e8
.L_1c0:
    mov r5, #0x0
    b .L_1ec
.L_1c8:
    mov r5, #0x1
    b .L_1ec
.L_1d0:
    mov r5, #0x3
    b .L_1ec
.L_1d8:
    mov r5, #0x2
    b .L_1ec
.L_1e0:
    mov r5, #0x4
    b .L_1ec
.L_1e8:
    mov r5, #0x5
.L_1ec:
    cmp r5, #0x0
    moveq r4, #0x10
    beq .L_200
    cmp r4, #0x10
    moveq r4, #0x0
.L_200:
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_ov004_021e7c1c_unk
    mov r0, r6
    bl Task_InvokeLocked
    bl func_020062b0
    bl func_0200a978
    bl func_0209372c
    bl func_0208c858
    ldr r2, _LIT6
    mov r0, #0x1
    ldr r1, [r2]
    orr r1, r1, #0x10000
    str r1, [r2]
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov004_0220b2a0
_LIT1: .word 0x0000609c
_LIT2: .word 0x0400006c
_LIT3: .word 0x0400106c
_LIT4: .word 0x04000304
_LIT5: .word 0x05000400
_LIT6: .word 0x04001000
_LIT7: .word data_ov004_0221133c
_LIT8: .word data_02104e6c
_LIT9: .word data_ov004_02291340
_LIT10: .word data_ov004_02291388
_LIT11: .word data_02103fcc
