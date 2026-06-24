; func_ov002_0222e9fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf17c
        .extern data_ov002_022cf180
        .extern data_ov002_022d016c
        .extern func_0202e234
        .extern func_ov002_021d8128
        .extern func_ov002_021e1920
        .extern func_ov002_021e286c
        .extern func_ov002_021e2b3c
        .extern func_ov002_021e2c5c
        .extern func_ov002_02257b48
        .extern func_ov002_0226b054
        .global func_ov002_0222e9fc
        .arm
func_ov002_0222e9fc:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    ldr r2, _LIT0
    mov r5, r0
    ldr r3, [r2, #0x5a8]
    ldr r4, [r2, #0x5ac]
    cmp r3, #0x7e
    bgt .L_50
    bge .L_124
    cmp r3, #0x64
    bgt .L_44
    subs r0, r3, #0x61
    addpl pc, pc, r0, lsl #0x2
    b .L_234
    b .L_21c
    b .L_208
    b .L_1f4
    b .L_1dc
.L_44:
    cmp r3, #0x78
    beq .L_1b0
    b .L_234
.L_50:
    cmp r3, #0x7f
    bgt .L_60
    beq .L_94
    b .L_234
.L_60:
    cmp r3, #0x80
    bne .L_234
    bl func_ov002_02257b48
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r1, _LIT1
    ldr r0, _LIT0
    ldr r1, [r1, #0xcec]
    str r1, [r0, #0x5ac]
    bl func_ov002_021e2b3c
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_94:
    ldr r0, _LIT2
    and r2, r4, #0x1
    mul r1, r2, r0
    ldr r0, _LIT3
    mov r6, #0x0
    ldr r0, [r0, r1]
    cmp r0, #0x0
    bls .L_11c
    ldr r0, _LIT4
    add r9, r0, r1
    add r8, r9, #0x260
.L_c0:
    ldr r0, [r8]
    mov r0, r0, lsl #0x13
    mov r7, r0, lsr #0x13
    mov r0, r7
    bl func_0202e234
    cmp r0, #0x0
    beq .L_108
    ldrh r0, [r5, #0x2]
    mov r1, r7
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    cmp r4, r0, lsr #0x1f
    movne r3, #0x1
    moveq r3, #0x0
    mov r0, r4
    bl func_ov002_021e1920
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_108:
    ldr r0, [r9, #0x10]
    add r6, r6, #0x1
    cmp r6, r0
    add r8, r8, #0x4
    bcc .L_c0
.L_11c:
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_124:
    ldr r0, _LIT2
    and r1, r4, #0x1
    mul r2, r1, r0
    ldr r0, _LIT5
    ldr r0, [r0, r2]
    subs r7, r0, #0x1
    bmi .L_1a8
    ldr r0, _LIT4
    add r6, r0, r2
    add r0, r6, #0x18
    add r0, r0, #0x400
    add r8, r0, r7, lsl #0x2
.L_154:
    ldr r0, [r8]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e234
    cmp r0, #0x0
    beq .L_19c
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    cmp r4, r0, lsr #0x1f
    add r0, r6, #0x18
    add r1, r0, #0x400
    movne r2, #0x1
    moveq r2, #0x0
    mov r0, r4
    add r1, r1, r7, lsl #0x2
    bl func_ov002_021d8128
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_19c:
    sub r8, r8, #0x4
    subs r7, r7, #0x1
    bpl .L_154
.L_1a8:
    mov r0, #0x78
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_1b0:
    ldr r1, _LIT0
    rsb r2, r4, #0x1
    ldr r0, _LIT1
    str r2, [r1, #0x5ac]
    ldr r0, [r0, #0xcec]
    cmp r2, r0
    movne r0, #0x7f
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    bl func_ov002_021e2c5c
    mov r0, #0x64
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_1dc:
    ldr r0, _LIT1
    ldr r0, [r0, #0xcec]
    rsb r0, r0, #0x1
    bl func_ov002_0226b054
    mov r0, #0x63
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_1f4:
    ldr r0, _LIT1
    ldr r0, [r0, #0xcec]
    bl func_ov002_0226b054
    mov r0, #0x62
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_208:
    ldr r0, _LIT1
    ldr r0, [r0, #0xcec]
    bl func_ov002_021e286c
    mov r0, #0x61
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_21c:
    ldr r0, _LIT1
    ldr r0, [r0, #0xcec]
    rsb r0, r0, #0x1
    bl func_ov002_021e286c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_234:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022d016c
_LIT2: .word 0x00000868
_LIT3: .word data_ov002_022cf17c
_LIT4: .word data_ov002_022cf16c
_LIT5: .word data_ov002_022cf180
