; func_ov002_02223244 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf178
        .extern data_ov002_022d016c
        .extern data_ov002_022d0e6c
        .extern func_ov002_021b9aa8
        .extern func_ov002_021bbeac
        .extern func_ov002_021d7c1c
        .extern func_ov002_021decac
        .extern func_ov002_021e2b3c
        .extern func_ov002_021e2c5c
        .extern func_ov002_021f2ca8
        .extern func_ov002_02257878
        .extern func_ov002_0226b034
        .extern func_ov002_0226b094
        .global func_ov002_02223244
        .arm
func_ov002_02223244:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r1, _LIT0
    mov r5, r0
    ldr r0, [r1, #0x5a8]
    ldr r4, [r1, #0x5ac]
    sub r0, r0, #0x78
    cmp r0, #0x8
    addls pc, pc, r0, lsl #0x2
    b .L_1d8
    b .L_1ac
    b .L_1d8
    b .L_1d8
    b .L_1d8
    b .L_1d8
    b .L_148
    b .L_c0
    b .L_60
    b .L_48
.L_48:
    ldr r0, _LIT1
    ldr r0, [r0, #0xcec]
    str r0, [r1, #0x5ac]
    bl func_ov002_021e2b3c
    mov r0, #0x7f
    ldmia sp!, {r4, r5, r6, pc}
.L_60:
    ldr r0, _LIT2
    and r1, r4, #0x1
    mul r2, r1, r0
    ldr r1, _LIT3
    mov r0, r4
    ldr r6, [r1, r2]
    bl func_ov002_021bbeac
    add r0, r6, r0
    cmp r0, #0x5
    movls r0, #0x78
    ldmlsia sp!, {r4, r5, r6, pc}
    cmp r6, #0x0
    bne .L_ac
    ldr r1, _LIT4
    mov r0, r5
    bl func_ov002_02257878
    cmp r0, #0x0
    moveq r0, #0x78
    ldmeqia sp!, {r4, r5, r6, pc}
.L_ac:
    ldrh r1, [r5]
    mov r0, r4
    bl func_ov002_0226b094
    mov r0, #0x7e
    ldmia sp!, {r4, r5, r6, pc}
.L_c0:
    ldr r0, _LIT2
    and r1, r4, #0x1
    mul r2, r1, r0
    ldr r1, _LIT3
    mov r0, r4
    ldr r6, [r1, r2]
    bl func_ov002_021bbeac
    add r0, r6, r0
    cmp r0, #0x5
    movls r0, #0x78
    ldmlsia sp!, {r4, r5, r6, pc}
    cmp r6, #0x0
    bne .L_10c
    ldr r1, _LIT4
    mov r0, r5
    bl func_ov002_02257878
    cmp r0, #0x0
    moveq r0, #0x78
    ldmeqia sp!, {r4, r5, r6, pc}
.L_10c:
    ldrh r2, [r5, #0x2]
    ldrh r1, [r5]
    mov r0, r4
    mov r3, r2, lsl #0x1f
    mov r2, r2, lsl #0x1a
    mov r3, r3, lsr #0x1f
    mov r2, r2, lsr #0x1b
    and r3, r3, #0xff
    and r2, r2, #0xff
    orr r2, r3, r2, lsl #0x8
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_ov002_0226b034
    mov r0, #0x7d
    ldmia sp!, {r4, r5, r6, pc}
.L_148:
    ldr r1, _LIT5
    mov r0, r4
    ldrh r1, [r1, #0xb2]
    bl func_ov002_021b9aa8
    movs r3, r0
    bmi .L_188
    ldr r2, _LIT6
    ldr r0, _LIT2
    and r1, r4, #0x1
    mla r0, r1, r0, r2
    add r1, r0, #0x120
    mov r0, r4
    add r1, r1, r3, lsl #0x2
    mov r2, #0x0
    bl func_ov002_021d7c1c
    b .L_1a4
.L_188:
    ldr r1, _LIT5
    mov r0, r5
    ldrh r2, [r1, #0xb0]
    mov r1, r4
    mov r2, r2, asr #0x8
    and r2, r2, #0xff
    bl func_ov002_021decac
.L_1a4:
    mov r0, #0x7e
    ldmia sp!, {r4, r5, r6, pc}
.L_1ac:
    ldr r0, _LIT1
    ldr r0, [r0, #0xcec]
    cmp r4, r0
    bne .L_1cc
    eor r0, r4, #0x1
    str r0, [r1, #0x5ac]
    mov r0, #0x7f
    ldmia sp!, {r4, r5, r6, pc}
.L_1cc:
    bl func_ov002_021e2c5c
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_1d8:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022d016c
_LIT2: .word 0x00000868
_LIT3: .word data_ov002_022cf178
_LIT4: .word func_ov002_021f2ca8
_LIT5: .word data_ov002_022d0e6c
_LIT6: .word data_ov002_022cf16c
