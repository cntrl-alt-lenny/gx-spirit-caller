; func_02061018 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021013f8
        .extern func_02061290
        .extern func_020a6d48
        .extern func_020a991c
        .extern func_020aaddc
        .extern func_020b3870
        .global func_02061018
        .arm
func_02061018:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x4
    mov r5, r0
    ldr r0, _LIT0
    mov r4, r1
    bl func_020aaddc
    mov r8, r0
    mov r0, r4
    bl func_02061290
    mov sl, #0x0
    mov fp, r0
    mov r7, sl
.L_f8:
    cmp fp, #0x0
    beq .L_110
    cmp sl, #0x0
    beq .L_110
    cmp sl, #0xd
    bne .L_140
.L_110:
    bl func_020a991c
    ldr r1, _LIT1
    smull r2, r3, r1, r0
    mov r3, r3, asr #0x4
    mov r1, r0, lsr #0x1f
    add r3, r1, r3
    ldr r1, _LIT2
    smull r2, r3, r1, r3
    sub r3, r0, r2
    add r0, r3, #0x21
    strb r0, [r5, sl]
    b .L_1d0
.L_140:
    cmp sl, #0x1
    beq .L_150
    cmp sl, #0xe
    bne .L_158
.L_150:
    ldrsb r9, [r4, sl]
    b .L_160
.L_158:
    sub r0, sl, #0x1
    ldrsb r9, [r4, r0]
.L_160:
    ldrb r6, [r4, sl]
    mov r1, r8
    add r0, sl, r6
    bl func_020b3870
    mul r0, r9, r7
    mov r9, r1
    mov r1, r8
    bl func_020b3870
    ldr r0, _LIT0
    ldrsb r3, [r0, r9]
    ldrsb r2, [r0, r1]
    mla r0, sl, r6, r3
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x1b
    add r0, r1, r0, ror #0x1b
    ldrb r0, [r4, r0]
    eor r0, r0, r2
    bl func_020a6d48
    ldr r1, _LIT1
    smull r2, r3, r1, r0
    mov r3, r3, asr #0x4
    mov r1, r0, lsr #0x1f
    add r3, r1, r3
    ldr r1, _LIT2
    smull r2, r3, r1, r3
    sub r3, r0, r2
    add r0, r3, #0x21
    strb r0, [r5, sl]
.L_1d0:
    ldr r0, _LIT3
    add sl, sl, #0x1
    cmp sl, #0x20
    add r7, r7, r0
    blt .L_f8
    mov r0, r5
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_021013f8
_LIT1: .word 0x2c0b02c1
_LIT2: .word 0x0000005d
_LIT3: .word 0x00004647
