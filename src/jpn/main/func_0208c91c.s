; func_0208c91c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern data_021023bc
        .extern data_021a621c
        .extern func_0208caa0
        .extern func_02090780
        .extern func_02093b08
        .extern func_02093fb8
        .global func_0208c91c
        .arm
func_0208c91c:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r3, _LIT0
    ldr r0, _LIT1
    ldrh r2, [r3]
    ldr r1, _LIT2
    orr r2, r2, #0x8000
    strh r2, [r3]
    ldrh r2, [r3]
    and r0, r2, r0
    orr r0, r0, r1
    strh r0, [r3]
    ldrh r0, [r3]
    orr r0, r0, #0x1
    strh r0, [r3]
    bl func_0208caa0
    ldr r5, _LIT3
    ldrh r0, [r5]
    cmp r0, #0x0
    bne .L_74
    mvn r4, #0x2
.L_50:
    bl func_02090780
    mov r6, r0
    cmp r6, r4
    bne .L_64
    bl func_02093b08
.L_64:
    strh r6, [r5]
    ldrh r0, [r5]
    cmp r0, #0x0
    beq .L_50
.L_74:
    ldr r0, _LIT4
    mov r2, #0x0
    strh r2, [r0]
    mov r1, #0x4000000
    ldr r0, _LIT5
    str r2, [r1]
    ldr r0, [r0]
    mvn r1, #0x0
    cmp r0, r1
    beq .L_cc
    ldr r1, _LIT6
    mov r3, #0x60
    bl func_02093fb8
    ldr r1, _LIT7
    mov r2, #0x0
    ldr r0, _LIT5
    strh r2, [r1]
    ldr r0, [r0]
    ldr r1, _LIT8
    mov r3, #0x70
    bl func_02093fb8
    b .L_f4
.L_cc:
    ldr r1, _LIT6
    mov r0, r2
    mov r2, #0x60
    bl Fill32
    ldr r3, _LIT7
    mov r0, #0x0
    ldr r1, _LIT8
    mov r2, #0x70
    strh r0, [r3]
    bl Fill32
.L_f4:
    ldr r1, _LIT9
    mov r2, #0x100
    ldr r0, _LIT10
    strh r2, [r1]
    ldr r1, _LIT11
    strh r2, [r0]
    ldr r0, _LIT12
    strh r2, [r1]
    ldr r1, _LIT13
    strh r2, [r0]
    ldr r0, _LIT14
    strh r2, [r1]
    ldr r1, _LIT15
    strh r2, [r0]
    ldr r0, _LIT16
    strh r2, [r1]
    strh r2, [r0]
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
_LIT0: .word 0x04000304
_LIT1: .word 0xfffffdf1
_LIT2: .word 0x0000020e
_LIT3: .word data_021a621c
_LIT4: .word 0x04000004
_LIT5: .word data_021023bc
_LIT6: .word 0x04000008
_LIT7: .word 0x0400006c
_LIT8: .word 0x04001000
_LIT9: .word 0x04000020
_LIT10: .word 0x04000026
_LIT11: .word 0x04000030
_LIT12: .word 0x04000036
_LIT13: .word 0x04001020
_LIT14: .word 0x04001026
_LIT15: .word 0x04001030
_LIT16: .word 0x04001036
