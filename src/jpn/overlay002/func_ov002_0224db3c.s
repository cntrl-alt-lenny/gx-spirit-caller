; func_ov002_0224db3c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern data_ov002_022cf09c
        .extern func_0202b824
        .extern func_0202b854
        .extern func_ov002_021b3ef8
        .extern func_ov002_021c37e4
        .extern func_ov002_021ca360
        .extern func_ov002_02253370
        .global func_ov002_0224db3c
        .arm
func_ov002_0224db3c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    ldr r0, _LIT0
    and r1, sl, #0x1
    mul r8, r1, r0
    ldr r0, _LIT1
    mov r9, r2
    ldr r0, [r0, r8]
    mov r4, #0x0
    cmp r0, #0x0
    bls .L_f0
    ldr r0, _LIT2
    mov fp, #0xb
    add r7, r0, r8
    add r6, r7, #0x120
.L_3c:
    ldr r0, [r6]
    mov r0, r0, lsl #0x13
    mov r5, r0, lsr #0x13
    mov r0, r5
    bl func_0202b824
    cmp r0, #0xa
    cmpne r0, #0xb
    cmpne r0, #0x10
    bne .L_dc
    ldr r2, [r6]
    mov r0, sl
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    bl func_ov002_021c37e4
    cmp r0, r9
    bhi .L_dc
    mov r0, sl
    mov r1, r5
    bl func_ov002_021ca360
    cmp r0, #0x0
    beq .L_dc
    ldr r2, [r6]
    mov r0, sl
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r5, r2, lsl #0x12
    mov r3, r1, lsl #0x1
    ldr r2, _LIT3
    mov r1, fp
    add r3, r3, r5, lsr #0x1f
    bl func_ov002_021b3ef8
    cmp r0, #0x0
    bne .L_dc
    mov r0, sl
    mov r1, #0xb
    mov r2, r4
    bl func_ov002_02253370
.L_dc:
    ldr r0, [r7, #0xc]
    add r4, r4, #0x1
    cmp r4, r0
    add r6, r6, #0x4
    bcc .L_3c
.L_f0:
    ldr r0, _LIT4
    mov r4, #0x0
    ldr r0, [r0, r8]
    cmp r0, #0x0
    ldmlsia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT2
    ldr fp, _LIT3
    add r8, r0, r8
    add r7, r8, #0x260
    mov r5, #0xb
.L_118:
    ldr r0, [r7]
    mov r0, r0, lsl #0x13
    mov r6, r0, lsr #0x13
    mov r0, r6
    bl func_0202b824
    cmp r0, #0xa
    cmpne r0, #0xb
    cmpne r0, #0x10
    bne .L_1a0
    mov r0, r6
    bl func_0202b854
    cmp r0, r9
    bhi .L_1a0
    mov r0, sl
    mov r1, r6
    bl func_ov002_021ca360
    cmp r0, #0x0
    beq .L_1a0
    ldr r2, [r7]
    mov r0, sl
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r6, r2, lsl #0x12
    mov r3, r1, lsl #0x1
    mov r1, r5
    mov r2, fp
    add r3, r3, r6, lsr #0x1f
    bl func_ov002_021b3ef8
    cmp r0, #0x0
    bne .L_1a0
    mov r0, sl
    mov r1, #0xd
    mov r2, r4
    bl func_ov002_02253370
.L_1a0:
    ldr r0, [r8, #0x10]
    add r4, r4, #0x1
    cmp r4, r0
    add r7, r7, #0x4
    bcc .L_118
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf098
_LIT2: .word data_ov002_022cf08c
_LIT3: .word 0x000012a1
_LIT4: .word data_ov002_022cf09c
