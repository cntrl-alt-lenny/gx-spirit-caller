; func_0200994c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021063d8
        .extern data_021063d9
        .extern data_021063ec
        .extern data_021063f1
        .extern func_020097d4
        .extern func_02009a94
        .extern func_02019000
        .extern func_020190f0
        .global func_0200994c
        .arm
func_0200994c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    bl func_02019000
    mov r5, r0
    bl func_020190f0
    bl func_020097d4
    cmp r4, #0x0
    ldmleia sp!, {r4, r5, r6, pc}
    sub r4, r4, #0x1
    mov r2, #0x1
    tst r0, r2, lsl r4
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r0, #0x1c
    mul r6, r4, r0
    ldr r0, _LIT0
    ldrb r1, [r0, r6]
    cmp r1, #0x4
    addls pc, pc, r1, lsl #0x2
    ldmia sp!, {r4, r5, r6, pc}
    b .L_1d8
    ldmia sp!, {r4, r5, r6, pc}
    b .L_250
    b .L_220
    b .L_214
.L_1d8:
    mov r1, #0x4
    strb r1, [r0, r6]
    ldr r2, _LIT1
    mov r0, #0x32
    strb r0, [r2, r6]
    ldr r1, _LIT2
    add r0, r4, #0x1
    str r5, [r1, r6]
    bl func_02009a94
    cmp r4, #0x4
    ldmltia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT3
    mov r1, #0x1
    strb r1, [r0, r6]
    ldmia sp!, {r4, r5, r6, pc}
.L_214:
    mov r1, #0x3
    strb r1, [r0, r6]
    ldmia sp!, {r4, r5, r6, pc}
.L_220:
    ldr r2, _LIT2
    ldr r1, [r2, r6]
    sub r1, r5, r1
    cmp r1, #0xe
    movcs r1, #0x2
    strcsb r1, [r0, r6]
    ldr r1, [r2, r6]
    sub r1, r5, r1
    cmp r1, #0x1c
    movcs r1, #0x1
    strcsb r1, [r0, r6]
    ldmia sp!, {r4, r5, r6, pc}
.L_250:
    ldr r1, _LIT2
    ldr r1, [r1, r6]
    sub r1, r5, r1
    cmp r1, #0x1c
    strcsb r2, [r0, r6]
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_021063d8
_LIT1: .word data_021063d9
_LIT2: .word data_021063ec
_LIT3: .word data_021063f1
