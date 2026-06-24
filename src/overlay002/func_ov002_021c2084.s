; func_ov002_021c2084 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf1a4
        .extern data_ov002_022cf1ac
        .extern func_0202e234
        .extern func_0202ed90
        .extern func_ov002_021b314c
        .extern func_ov002_021b3618
        .extern func_ov002_021b3ecc
        .extern func_ov002_021b59b0
        .extern func_ov002_021b8fcc
        .extern func_ov002_021b9ecc
        .extern func_ov002_021bb5a8
        .global func_ov002_021c2084
        .arm
func_ov002_021c2084:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    ldrh r0, [sl, #0x2]
    mov r9, r1
    mov r8, r2
    mov r0, r0, lsl #0x1a
    mov r0, r0, lsr #0x1b
    mov fp, r3
    cmp r0, #0x5
    mov r5, #0x1
    mov r1, #0x0
    bcc .L_38
    cmp r0, #0xa
    movls r1, r5
.L_38:
    cmp r1, #0x0
    bne .L_50
    ldrh r0, [sl]
    bl func_0202e234
    cmp r0, #0x0
    movne r5, #0x0
.L_50:
    ldrh r0, [sl]
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT0
    and r2, r9, #0x1
    mov r0, #0x14
    mul r7, r2, r1
    ldr r1, _LIT1
    mul r6, r8, r0
    add r0, r1, r7
    ldrh r0, [r6, r0]
    cmp r0, #0x0
    beq .L_1c4
    mov r0, r9
    mov r1, r8
    bl func_ov002_021b9ecc
    ldr r1, _LIT2
    mov r4, r0
    cmp r4, r1
    beq .L_b4
    ldr r0, _LIT3
    cmp r4, r0
    beq .L_f4
    b .L_120
.L_b4:
    ldr r0, _LIT4
    add r0, r0, r7
    ldr r0, [r6, r0]
    mov r0, r0, lsr #0x6
    tst r0, #0x1
    bne .L_120
    cmp r8, #0x5
    blt .L_120
    mov r0, r9
    mov r1, r8
    bl func_ov002_021b3618
    ldr r1, _LIT5
    cmp r0, r1
    beq .L_120
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_f4:
    ldr r0, _LIT4
    add r0, r0, r7
    ldr r0, [r6, r0]
    mov r0, r0, lsr #0x6
    tst r0, #0x1
    bne .L_120
    cmp r8, #0x4
    bgt .L_120
    cmp r5, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_120:
    ldr r2, _LIT6
    mov r0, r9
    mov r1, r8
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    cmp fp, #0x0
    beq .L_198
    cmp r8, #0x4
    bgt .L_198
    ldr r2, _LIT7
    mov r0, r9
    mov r1, r8
    bl func_ov002_021b314c
    cmp r0, #0x0
    beq .L_198
    mov r0, sl
    bl func_ov002_021b59b0
    mov r5, r0
    mov r0, r9
    mov r1, r8
    bl func_ov002_021b8fcc
    cmp r0, #0x0
    cmpne r5, #0x0
    beq .L_190
    tst r5, #0x2
    beq .L_198
.L_190:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_198:
    mov r0, r4
    bl func_0202ed90
    cmp r0, #0x0
    beq .L_1e8
    ldr r1, _LIT8
    mov r0, r9
    bl func_ov002_021bb5a8
    cmp r0, #0x0
    beq .L_1e8
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1c4:
    cmp r8, #0x5
    blt .L_1e8
    ldr r2, _LIT9
    mov r0, #0x0
    mov r1, #0xb
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1e8:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf1a4
_LIT2: .word 0x0000150c
_LIT3: .word 0x00001645
_LIT4: .word data_ov002_022cf1ac
_LIT5: .word 0x0000ffff
_LIT6: .word 0x00001a5c
_LIT7: .word 0x0000150a
_LIT8: .word 0x00001a05
_LIT9: .word 0x0000153c
