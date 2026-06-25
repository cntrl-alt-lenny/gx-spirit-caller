; func_ov002_02218068 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cdc78
        .extern data_ov002_022ce288
        .extern func_ov002_021ae400
        .extern func_ov002_021af9d0
        .extern func_ov002_021afb74
        .extern func_ov002_021bc618
        .extern func_ov002_021c9df0
        .extern func_ov002_021ca2b8
        .extern func_ov002_021e286c
        .extern func_ov002_0223f6c4
        .extern func_ov002_0225368c
        .extern func_ov002_0226b054
        .extern func_ov002_0227ac64
        .extern func_ov002_0227adb8
        .global func_ov002_02218068
        .arm
func_ov002_02218068:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldrh r3, [r5, #0x2]
    ldrh r1, [r5, #0x4]
    mov r2, r3, lsl #0x11
    mov r3, r3, lsl #0x1f
    mov r2, r2, lsr #0x1f
    mov r1, r1, lsl #0x1d
    movs r1, r1, lsr #0x1f
    eor r4, r2, r3, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT0
    ldr r1, [r1, #0x5a8]
    sub r1, r1, #0x78
    cmp r1, #0x8
    addls pc, pc, r1, lsl #0x2
    b .L_328
    b .L_318
    b .L_328
    b .L_328
    b .L_308
    b .L_19c
    b .L_328
    b .L_17c
    b .L_f0
    b .L_6c
.L_6c:
    mov r0, r4
    bl func_ov002_021bc618
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r4
    bl func_ov002_021ca2b8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r1, [r5]
    ldr r0, _LIT1
    cmp r1, r0
    bne .L_b8
    mov r0, r4
    bl func_ov002_021c9df0
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
.L_b8:
    mov r0, r5
    bl func_ov002_0223f6c4
    mov r2, r0
    ldrh r1, [r5]
    mov r0, r4
    bl func_ov002_0225368c
    cmp r0, #0x0
    movne r0, #0x7f
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r4
    mov r1, #0xd
    bl func_ov002_021ae400
    mov r0, #0x7b
    ldmia sp!, {r3, r4, r5, pc}
.L_f0:
    ldrh r2, [r5]
    ldr r1, _LIT2
    cmp r2, r1
    bgt .L_128
    bge .L_154
    ldr r0, _LIT3
    cmp r2, r0
    bgt .L_118
    beq .L_154
    b .L_168
.L_118:
    add r0, r0, #0x288
    cmp r2, r0
    beq .L_154
    b .L_168
.L_128:
    ldr r0, _LIT4
    cmp r2, r0
    bgt .L_148
    bge .L_154
    add r0, r1, #0xd9
    cmp r2, r0
    beq .L_154
    b .L_168
.L_148:
    ldr r0, _LIT5
    cmp r2, r0
    bne .L_168
.L_154:
    ldr r0, _LIT6
    mov r1, #0x0
    str r1, [r0, #0x8]
    mov r0, #0x7c
    ldmia sp!, {r3, r4, r5, pc}
.L_168:
    mov r0, r4
    mov r1, #0x30
    bl func_ov002_021ae400
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, pc}
.L_17c:
    bl func_ov002_0223f6c4
    mov r3, r0
    ldrh r2, [r5]
    mov r0, r4
    mov r1, #0x6
    bl func_ov002_021af9d0
    mov r0, #0x7c
    ldmia sp!, {r3, r4, r5, pc}
.L_19c:
    ldrh r5, [r5]
    ldr r2, _LIT1
    cmp r5, r2
    bgt .L_214
    bge .L_2c4
    ldr r1, _LIT2
    cmp r5, r1
    bgt .L_1e4
    bge .L_2a8
    sub r0, r2, #0x3e0
    cmp r5, r0
    bgt .L_1d4
    beq .L_288
    b .L_2e4
.L_1d4:
    sub r0, r1, #0x23
    cmp r5, r0
    beq .L_2a8
    b .L_2e4
.L_1e4:
    add r0, r1, #0xa8
    cmp r5, r0
    bgt .L_204
    bge .L_2a8
    add r0, r1, #0x52
    cmp r5, r0
    beq .L_2a8
    b .L_2e4
.L_204:
    add r0, r1, #0xd9
    cmp r5, r0
    beq .L_2a8
    b .L_2e4
.L_214:
    ldr r1, _LIT4
    cmp r5, r1
    bgt .L_258
    bge .L_2a8
    add r0, r2, #0x1d4
    cmp r5, r0
    bgt .L_24c
    ldr r0, _LIT7
    cmp r5, r0
    blt .L_2e4
    addne r0, r0, #0x1
    cmpne r5, r0
    beq .L_2a8
    b .L_2e4
.L_24c:
    cmp r5, #0x1900
    beq .L_2a8
    b .L_2e4
.L_258:
    add r0, r1, #0x140
    cmp r5, r0
    bgt .L_278
    bge .L_2a8
    add r0, r1, #0xc4
    cmp r5, r0
    beq .L_2a8
    b .L_2e4
.L_278:
    ldr r0, _LIT5
    cmp r5, r0
    beq .L_2a8
    b .L_2e4
.L_288:
    bl func_ov002_021afb74
    mov r2, r5, lsl #0x10
    mov r1, r0
    mov r0, r4
    orr r3, r2, #0x1
    mov r2, #0x1
    bl func_ov002_0227adb8
    b .L_300
.L_2a8:
    bl func_ov002_021afb74
    mov r1, r0
    mov r0, r4
    mov r3, r5, lsl #0x10
    mov r2, #0x1
    bl func_ov002_0227adb8
    b .L_300
.L_2c4:
    bl func_ov002_021afb74
    mov r1, r0
    mov r2, #0x0
    mov r0, r4
    mov r3, #0x1
    str r2, [sp]
    bl func_ov002_0227ac64
    b .L_300
.L_2e4:
    bl func_ov002_021afb74
    mov r1, r0
    mov r3, #0x0
    mov r0, r4
    mov r2, #0x1
    str r3, [sp]
    bl func_ov002_0227ac64
.L_300:
    mov r0, #0x78
    ldmia sp!, {r3, r4, r5, pc}
.L_308:
    rsb r0, r4, #0x1
    bl func_ov002_0226b054
    mov r0, #0x78
    ldmia sp!, {r3, r4, r5, pc}
.L_318:
    mov r0, r4
    bl func_ov002_021e286c
    mov r0, #0x64
    ldmia sp!, {r3, r4, r5, pc}
.L_328:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x00001612
_LIT2: .word 0x000014dd
_LIT3: .word 0x00001232
_LIT4: .word 0x0000194f
_LIT5: .word 0x00001b25
_LIT6: .word data_ov002_022cdc78
_LIT7: .word 0x000017e5
