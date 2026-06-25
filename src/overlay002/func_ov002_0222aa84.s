; func_ov002_0222aa84 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf178
        .extern func_0202b8f0
        .extern func_0202e2f8
        .extern func_ov002_021c2f24
        .extern func_ov002_021c325c
        .extern func_ov002_021c8470
        .extern func_ov002_021c84a8
        .extern func_ov002_021d5a08
        .extern func_ov002_0223de94
        .extern func_ov002_0223df38
        .extern func_ov002_0225764c
        .global func_ov002_0222aa84
        .arm
func_ov002_0222aa84:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xc
    mov r1, #0x0
    mov r2, r1
    mov sl, r0
    bl func_ov002_0223df38
    cmp r0, #0x0
    beq .L_2a8
    mov r0, sl
    mov r1, #0x0
    bl func_ov002_0223de94
    mov r1, r0, lsl #0x10
    and r0, r0, #0xff
    str r0, [sp, #0x8]
    mov r0, r1, lsr #0x10
    mov r0, r0, asr #0x8
    and r6, r0, #0xff
    ldr r1, [sp, #0x8]
    mov r0, sl
    mov r2, r6
    bl func_ov002_0225764c
    cmp r0, #0x0
    beq .L_2a8
    ldrh r0, [sl]
    ldr r1, _LIT0
    mov r9, #0x0
    cmp r0, r1
    bgt .L_b8
    bge .L_154
    ldr r2, _LIT1
    cmp r0, r2
    bgt .L_94
    bge .L_118
    sub r1, r2, #0x2c
    cmp r0, r1
    beq .L_fc
    b .L_280
.L_94:
    add r1, r2, #0x53
    cmp r0, r1
    bgt .L_a8
    beq .L_120
    b .L_280
.L_a8:
    add r1, r2, #0x210
    cmp r0, r1
    beq .L_134
    b .L_280
.L_b8:
    ldr r2, _LIT2
    cmp r0, r2
    bgt .L_d8
    bge .L_22c
    sub r1, r2, #0x3a
    cmp r0, r1
    beq .L_184
    b .L_280
.L_d8:
    add r1, r2, #0xe1
    cmp r0, r1
    bgt .L_ec
    beq .L_24c
    b .L_280
.L_ec:
    add r1, r2, #0xea
    cmp r0, r1
    beq .L_264
    b .L_280
.L_fc:
    ldrh r0, [sl, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c325c
    mov r1, #0x64
    mul r9, r0, r1
    b .L_280
.L_118:
    ldrh r9, [sl, #0xc]
    b .L_280
.L_120:
    ldrh r0, [sl, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r9, r0, #0x1
    b .L_280
.L_134:
    ldr r0, [sp, #0x8]
    mov r1, r6
    bl func_ov002_021c84a8
    ldr r1, _LIT3
    mov r9, r0
    cmp r9, r1
    movge r9, r1
    b .L_280
.L_154:
    ldrh r2, [sl, #0x2]
    ldr r0, _LIT4
    ldr r1, _LIT5
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    rsb r2, r2, #0x1
    and r2, r2, #0x1
    mul r0, r2, r0
    ldr r1, [r1, r0]
    mov r0, #0xc8
    mul r9, r1, r0
    b .L_280
.L_184:
    ldr r5, _LIT6
    mov r7, r9
    mov r8, r9
    mov r4, #0x2
    mov fp, #0x1
.L_198:
    cmp r7, r6
    beq .L_20c
    ldrh r0, [sl, #0x2]
    ldr r1, _LIT4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r2, r0, #0x1
    mla r1, r2, r1, r5
    add r2, r1, r8
    ldr r1, [r2, #0x30]
    mov r1, r1, lsl #0x13
    movs r1, r1, lsr #0x13
    ldrneh r1, [r2, #0x38]
    cmpne r1, #0x0
    beq .L_20c
    ldrh r1, [r2, #0x36]
    cmp r1, #0x0
    bne .L_20c
    mov r1, r7
    bl func_ov002_021c8470
    stmia sp, {r4, fp}
    ldrh r1, [sl, #0x2]
    add r9, r9, r0
    ldrh r3, [sl]
    mov r1, r1, lsl #0x1f
    mov r0, sl
    mov r2, r7
    mov r1, r1, lsr #0x1f
    bl func_ov002_021d5a08
.L_20c:
    add r7, r7, #0x1
    cmp r7, #0x4
    add r8, r8, #0x14
    ble .L_198
    ldr r0, _LIT3
    cmp r9, r0
    movge r9, r0
    b .L_280
.L_22c:
    ldrh r0, [sl, #0xa]
    bl func_0202e2f8
    cmp r0, #0x0
    bne .L_280
    ldrh r0, [sl, #0xa]
    bl func_0202b8f0
    mov r9, r0
    b .L_280
.L_24c:
    ldr r0, [sp, #0x8]
    mov r1, r6
    bl func_ov002_021c8470
    add r0, r0, #0x1
    mov r9, r0, asr #0x1
    b .L_280
.L_264:
    ldrh r0, [sl, #0x2]
    add r1, r2, #0xdd
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c2f24
    mov r1, #0x190
    mul r9, r0, r1
.L_280:
    mov r0, r9, lsl #0x10
    mov r1, #0x2
    str r1, [sp]
    mov r0, r0, lsr #0x10
    str r0, [sp, #0x4]
    ldrh r3, [sl]
    ldr r1, [sp, #0x8]
    mov r0, sl
    mov r2, r6
    bl func_ov002_021d5a08
.L_2a8:
    mov r0, #0x0
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x000016e3
_LIT1: .word 0x000014be
_LIT2: .word 0x000018ca
_LIT3: .word 0x0000ffff
_LIT4: .word 0x00000868
_LIT5: .word data_ov002_022cf178
_LIT6: .word data_ov002_022cf16c
