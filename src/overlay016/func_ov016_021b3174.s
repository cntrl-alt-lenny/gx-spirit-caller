; func_ov016_021b3174 - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104bac
        .extern data_ov016_021b9000
        .extern data_ov016_021b900a
        .extern data_ov016_021b9014
        .extern data_ov016_021babec
        .extern data_ov016_021bac64
        .extern func_02037208
        .extern func_ov016_021b28f4
        .extern func_ov016_021b32f0
        .extern func_ov016_021b35dc
        .extern func_ov016_021b3650
        .extern func_ov016_021b39e4
        .extern func_ov016_021b4204
        .extern func_ov016_021b47c8
        .extern func_ov016_021b6324
        .extern func_ov016_021b6688
        .global func_ov016_021b3174
        .arm
func_ov016_021b3174:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x4]
    cmp r1, #0x0
    beq .L_230
    cmp r1, #0x1
    beq .L_300
    cmp r1, #0x2
    beq .L_334
    b .L_364
.L_230:
    ldr r1, _LIT0
    ldrh r2, [r1, #0x52]
    cmp r2, #0x0
    beq .L_2a0
    ldrh r1, [r1, #0x54]
    tst r1, #0xc0
    beq .L_274
    ldr r1, [r4, #0xc]
    rsb r1, r1, #0x1
    str r1, [r4, #0xc]
    bl func_ov016_021b39e4
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    b .L_364
.L_274:
    tst r1, #0x1
    beq .L_28c
    ldr r1, [r4, #0xc]
    add r1, r1, #0x1
    bl func_ov016_021b32f0
    ldmia sp!, {r4, pc}
.L_28c:
    tst r1, #0x2
    beq .L_364
    mov r1, #0x0
    bl func_ov016_021b32f0
    ldmia sp!, {r4, pc}
.L_2a0:
    ldr r0, _LIT1
    bl func_ov016_021b28f4
    cmp r0, #0x0
    beq .L_2c0
    mov r0, r4
    mov r1, #0x0
    bl func_ov016_021b32f0
    ldmia sp!, {r4, pc}
.L_2c0:
    ldr r0, _LIT2
    bl func_ov016_021b28f4
    cmp r0, #0x0
    beq .L_2e0
    mov r0, r4
    mov r1, #0x1
    bl func_ov016_021b32f0
    ldmia sp!, {r4, pc}
.L_2e0:
    ldr r0, _LIT3
    bl func_ov016_021b28f4
    cmp r0, #0x0
    beq .L_364
    mov r0, r4
    mov r1, #0x2
    bl func_ov016_021b32f0
    ldmia sp!, {r4, pc}
.L_300:
    ldr r0, _LIT4
    bl func_ov016_021b47c8
    cmp r0, #0x0
    beq .L_364
    ldr r0, _LIT4
    bl func_ov016_021b4204
    mov r0, r4
    bl func_ov016_021b35dc
    mov r0, r4
    bl func_ov016_021b3650
    mov r0, #0x0
    str r0, [r4, #0x4]
    b .L_364
.L_334:
    ldr r0, _LIT5
    bl func_ov016_021b6688
    cmp r0, #0x0
    beq .L_364
    ldr r0, _LIT5
    bl func_ov016_021b6324
    mov r1, #0x0
    mov r0, r4
    str r1, [r4, #0x4]
    bl func_ov016_021b35dc
    mov r0, r4
    bl func_ov016_021b3650
.L_364:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_02104bac
_LIT1: .word data_ov016_021b9000
_LIT2: .word data_ov016_021b900a
_LIT3: .word data_ov016_021b9014
_LIT4: .word data_ov016_021babec
_LIT5: .word data_ov016_021bac64
