; func_02036590 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219b2e0
        .extern data_0219b760
        .extern func_02036298
        .extern func_020364c4
        .extern func_02036584
        .global func_02036590
        .arm
func_02036590:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov r4, r1
    cmp r0, #0x8f00000
    bcc .L_1c
    ldr r1, _LIT0
    cmp r0, r1
    bls .L_2c
.L_1c:
    ldr r1, _LIT1
    mov r2, r4
    bl func_020364c4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2c:
    sub r0, r0, #0x8f00000
    mov r8, #0x0
    mov r9, r8
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    b .L_84
    b .L_5c
    b .L_64
    b .L_74
    b .L_70
    b .L_7c
    b .L_6c
.L_5c:
    mov sl, r8
    b .L_8c
.L_64:
    mov sl, #0x1000000
    b .L_8c
.L_6c:
    mov r9, #0x1
.L_70:
    mov r8, #0x1000000
.L_74:
    mov sl, #0x3000000
    b .L_8c
.L_7c:
    sub sl, r8, #0x1
    b .L_8c
.L_84:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_8c:
    ldr r6, _LIT2
    ldr r5, _LIT3
    mov r7, #0x0
    mov fp, #0xc
.L_9c:
    ldrsb r0, [r6, #0x6a]
    cmp r0, #0x0
    blt .L_f8
    ldr r1, [r6, #0x34]
    cmp sl, #0x0
    and r0, r1, #0x3000000
    blt .L_c8
    cmp r0, sl
    beq .L_c8
    tst r0, r8
    beq .L_f8
.L_c8:
    cmp r9, #0x0
    beq .L_ec
    mov r0, r1, lsl #0x10
    ldr r2, [r5, #0x34]
    mov r1, r0, lsr #0x10
    mla r0, r1, fp, r2
    ldrb r0, [r0, #0x7]
    tst r0, #0x10
    bne .L_f8
.L_ec:
    mov r0, r6
    mov r1, r4
    bl func_02036298
.L_f8:
    add r7, r7, #0x1
    cmp r7, #0x1c
    add r6, r6, #0x78
    blt .L_9c
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x08f0000f
_LIT1: .word func_02036584
_LIT2: .word data_0219b760
_LIT3: .word data_0219b2e0
