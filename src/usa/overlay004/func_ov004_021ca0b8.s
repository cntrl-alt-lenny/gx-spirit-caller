; func_ov004_021ca0b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov004_0220b2a0
        .extern func_02005d90
        .extern func_020347c0
        .extern func_0208e038
        .global func_ov004_021ca0b8
        .arm
func_ov004_021ca0b8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x20
    bl func_020347c0
    mov r2, r0, lsl #0x8
    mov r0, r2, asr #0x6
    ldr r1, _LIT0
    add r0, r2, r0, lsr #0x19
    mov r2, r0, asr #0x7
    str r1, [sp, #0x18]
    mov r0, #0x1
    mov r1, #0x0
    strh r2, [sp, #0x1c]
    bl func_02005d90
    ldr r1, [sp, #0x18]
    ldr r2, [sp, #0x1c]
    str r1, [r0]
    ldr r1, _LIT1
    str r2, [r0, #0x4]
    ldr r0, [r1, #0x40]
    cmp r0, #0x0
    beq .L_22c
    ldr r0, _LIT2
    mov r7, #0x0
    ldr r4, [r0]
    ldr r0, _LIT3
    ldr r6, _LIT4
    smull r1, r2, r0, r4
    mov r3, r4, lsr #0x1f
    add r2, r3, r2, asr #0x3
    smull r3, r1, r6, r4
    smull r5, r3, r6, r2
    add r1, r1, r4, lsr #0x1f
    mov r4, r2, lsr #0x1f
    add r3, r4, r3, asr #0x1
    mov r5, #0xc
    smull r3, r4, r5, r3
    sub r3, r2, r3
    smull r4, r6, r0, r1
    mov r2, r1, lsr #0x1f
    add r6, r2, r6, asr #0x4
    mov r4, #0x28
    smull r0, r2, r4, r6
    mov fp, r7
    cmp r3, #0x3
    sub r6, r1, r0
    blt .L_c0
    cmp r3, #0x6
    sublt r7, r3, #0x2
.L_c0:
    cmp r3, #0x9
    blt .L_d0
    cmp r3, #0xc
    sublt fp, r3, #0x8
.L_d0:
    sub r0, r7, #0x1
    mov r0, r0, lsl #0x2
    mov r8, #0x0
    sub r1, fp, #0x1
    str r0, [sp, #0x4]
    mov r0, r1, lsl #0x2
    str r8, [sp, #0x14]
    str r0, [sp]
.L_f0:
    ldr r1, _LIT2
    ldr r0, [sp, #0x4]
    mov r9, #0x0
    add r2, r1, r0, lsl #0x1
    ldr r0, [sp]
    add r5, r2, r8, lsl #0x1
    add r0, r1, r0, lsl #0x1
    add r4, r0, r8, lsl #0x1
.L_110:
    cmp r7, #0x0
    moveq sl, #0x0
    beq .L_128
    add r0, r5, r9, lsl #0x1
    add r0, r0, #0x5c00
    ldrh sl, [r0, #0xd8]
.L_128:
    bl func_0208e038
    add r0, r0, r8, lsl #0x1
    add r0, r0, r9, lsl #0x1
    add r0, r0, #0x200
    strh sl, [r0, #0xc]
    cmp fp, #0x0
    moveq sl, #0x0
    beq .L_154
    add r0, r4, r9, lsl #0x1
    add r0, r0, #0x5d00
    ldrh sl, [r0, #0xd8]
.L_154:
    bl func_0208e038
    add r0, r0, r8, lsl #0x1
    add r0, r0, r9, lsl #0x1
    add r0, r0, #0x200
    strh sl, [r0, #0x2c]
    add r9, r9, #0x1
    cmp r9, #0x4
    blt .L_110
    ldr r0, [sp, #0x14]
    add r8, r8, #0x20
    add r0, r0, #0x1
    str r0, [sp, #0x14]
    cmp r0, #0x4
    blt .L_f0
    ldr r3, _LIT5
    mov r8, #0x0
    smull r0, r4, r3, r6
    add r4, r4, r6, lsr #0x1f
    mov r2, #0x3
    smull r1, r0, r2, r4
    smull r0, r2, r3, r6
    sub r4, r6, r1
    mov r1, #0xa
    mul r1, r4, r1
    add r2, r2, r6, lsr #0x1f
    add r0, r2, r2, lsl #0x2
    mov r2, r0, lsl #0x6
    ldr r0, _LIT2
    mov r7, r8
    add r0, r0, r2, lsl #0x1
    add fp, r0, r1, lsl #0x1
    mov r4, r8
.L_1d4:
    mov r9, #0x0
    add r5, fp, r7, lsl #0x1
.L_1dc:
    cmp r6, #0x9
    movge sl, r4
    bge .L_1f4
    add r0, r5, r9, lsl #0x1
    add r0, r0, #0x5400
    ldrh sl, [r0, #0xd8]
.L_1f4:
    bl func_0208e038
    add r0, r0, r7, lsl #0x1
    add r0, r0, r9, lsl #0x1
    add r0, r0, #0x100
    add r9, r9, #0x1
    strh sl, [r0, #0x16]
    cmp r9, #0xa
    blt .L_1dc
    add r8, r8, #0x1
    cmp r8, #0xa
    add r7, r7, #0x20
    blt .L_1d4
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_22c:
    ldr r0, _LIT2
    mov r6, #0x0
    ldr r1, [r0]
    ldr r2, _LIT3
    mov r0, r1, lsr #0x1f
    smull r1, r3, r2, r1
    add r3, r0, r3, asr #0x3
    ldr r2, _LIT4
    mov r0, r3, lsr #0x1f
    smull r1, r4, r2, r3
    add r4, r0, r4, asr #0x1
    mov r2, #0xc
    smull r0, r1, r2, r4
    sub r4, r3, r0
    mov r7, r6
    cmp r4, #0x3
    blt .L_278
    cmp r4, #0x6
    sublt r6, r4, #0x2
.L_278:
    cmp r4, #0x9
    blt .L_288
    cmp r4, #0xc
    sublt r7, r4, #0x8
.L_288:
    sub r0, r6, #0x1
    mov r0, r0, lsl #0x2
    mov r8, #0x0
    sub r1, r7, #0x1
    str r0, [sp, #0xc]
    mov r0, r1, lsl #0x2
    str r8, [sp, #0x10]
    str r0, [sp, #0x8]
.L_2a8:
    ldr r1, _LIT2
    ldr r0, [sp, #0xc]
    mov r9, #0x0
    add r2, r1, r0, lsl #0x1
    ldr r0, [sp, #0x8]
    add r5, r2, r8, lsl #0x1
    add r0, r1, r0, lsl #0x1
    add r4, r0, r8, lsl #0x1
    mov fp, r9
.L_2cc:
    cmp r6, #0x0
    moveq sl, fp
    beq .L_2e4
    add r0, r5, r9, lsl #0x1
    add r0, r0, #0x5400
    ldrh sl, [r0, #0xd8]
.L_2e4:
    bl func_0208e038
    add r0, r0, r8, lsl #0x1
    add r0, r0, r9, lsl #0x1
    strh sl, [r0, #0xd6]
    cmp r7, #0x0
    moveq sl, #0x0
    beq .L_30c
    add r0, r4, r9, lsl #0x1
    add r0, r0, #0x5800
    ldrh sl, [r0, #0xd8]
.L_30c:
    bl func_0208e038
    add r0, r0, r8, lsl #0x1
    add r0, r0, r9, lsl #0x1
    strh sl, [r0, #0xe2]
    add r9, r9, #0x1
    cmp r9, #0x4
    blt .L_2cc
    ldr r0, [sp, #0x10]
    add r8, r8, #0x20
    add r0, r0, #0x1
    str r0, [sp, #0x10]
    cmp r0, #0x4
    blt .L_2a8
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x40f02000
_LIT1: .word data_ov004_0220b2a0
_LIT2: .word data_ov004_0220b2a0
_LIT3: .word 0x66666667
_LIT4: .word 0x2aaaaaab
_LIT5: .word 0x55555556
