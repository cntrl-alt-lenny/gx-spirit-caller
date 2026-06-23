; func_ov011_021cfb08 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020bee8c
        .extern data_ov011_021d3f20
        .extern data_ov011_021d3f5c
        .extern func_0202c06c
        .extern func_ov000_021ab40c
        .extern func_ov000_021ab440
        .extern func_ov000_021ab484
        .extern func_ov000_021ab4cc
        .extern func_ov000_021ab818
        .extern func_ov000_021acd6c
        .extern func_ov000_021ace18
        .extern func_ov000_021adc64
        .extern func_ov000_021af28c
        .extern func_ov011_021c9c80
        .extern func_ov011_021c9ca0
        .extern func_ov011_021ca520
        .extern func_ov011_021ca59c
        .extern func_ov011_021cb154
        .extern func_ov011_021cc734
        .extern func_ov011_021cd574
        .extern func_ov011_021cdad0
        .extern func_ov011_021ce260
        .extern func_ov011_021cef84
        .extern func_ov011_021cef9c
        .extern func_ov011_021cf218
        .extern func_ov011_021cfaac
        .global func_ov011_021cfb08
        .arm
func_ov011_021cfb08:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r0, _LIT0
    ldr r4, _LIT1
    ldr r0, [r0, #0x2b0]
    mov r0, r0, lsl #0xb
    mov r0, r0, lsr #0x18
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r3, r4, r5, pc}
    ldmia sp!, {r3, r4, r5, pc}
    b .L_3c
    b .L_7c
    b .L_148
    b .L_1c8
    b .L_2a0
.L_3c:
    bl func_ov011_021cef9c
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_ov011_021cef84
    bl func_ov011_021cc734
    bl func_ov011_021cdad0
    ldr r2, [r4, #0x274]
    ldr r0, _LIT2
    mov r1, r2, lsl #0xb
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    and r2, r2, r0
    mov r0, r1, lsl #0x18
    orr r0, r2, r0, lsr #0xb
    str r0, [r4, #0x274]
    ldmia sp!, {r3, r4, r5, pc}
.L_7c:
    ldr r5, [r4, #0x288]
    mov r0, #0x0
    mov r1, #0x3f
    bl func_ov000_021ab484
    mov r0, #0x0
    mov r1, #0x3f
    bl func_ov000_021ab440
    cmp r5, #0x0
    bne .L_a4
    bl func_ov011_021c9ca0
.L_a4:
    cmp r5, #0x100
    blt .L_e4
    sub r0, r5, #0x100
    cmp r0, #0x100
    movgt r0, #0x100
    mov r1, r0, lsl #0xe
    mov r0, r1, asr #0x7
    add r0, r1, r0, lsr #0x18
    mov r1, r0, asr #0xc
    ldr r0, _LIT3
    mov r1, r1, lsl #0x2
    ldrsh r1, [r0, r1]
    mov r0, #0x0
    mov r1, r1, lsl #0x4
    mov r1, r1, asr #0xc
    bl func_ov000_021ab4cc
.L_e4:
    add r0, r5, #0x14
    str r0, [r4, #0x288]
    cmp r0, #0x200
    ldmleia sp!, {r3, r4, r5, pc}
    ldr r2, [r4, #0x274]
    ldr r0, _LIT2
    mov r1, r2, lsl #0xb
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    and r2, r2, r0
    mov r0, r1, lsl #0x18
    orr r2, r2, r0, lsr #0xb
    mov r0, #0x0
    mov r1, #0x10
    str r0, [r4, #0x288]
    str r2, [r4, #0x274]
    bl func_ov000_021ab4cc
    bl func_ov000_021ab818
    mov r0, #0x1
    bl func_ov011_021ce260
    mov r0, #0x1
    bl func_ov000_021acd6c
    mov r0, #0x0
    bl func_ov000_021ace18
    ldmia sp!, {r3, r4, r5, pc}
.L_148:
    ldr r0, [r4, #0x288]
    mov r1, #0x8
    add r5, r0, #0x8
    cmp r5, #0xff
    movgt r5, #0xff
    mov r0, #0x0
    str r5, [r4, #0x288]
    bl func_ov000_021ab40c
    mov r1, r5, lsl #0xe
    ldr r2, _LIT4
    mov r0, r1, lsr #0x1f
    smull r1, r3, r2, r1
    add r3, r3, r5, lsl #0xe
    add r3, r0, r3, asr #0x7
    add r0, r3, #0x4000
    mov r1, r0, asr #0x4
    ldr r0, _LIT3
    mov r1, r1, lsl #0x2
    ldrsh r1, [r0, r1]
    mov r0, #0x0
    mov r1, r1, lsl #0x4
    mov r1, r1, asr #0xc
    bl func_ov000_021ab4cc
    cmp r5, #0xff
    bne .L_1c0
    bl func_ov011_021c9c80
    bl func_ov011_021cfaac
    mov r0, #0x0
    str r0, [r4, #0x288]
    bl func_ov011_021ca520
.L_1c0:
    bl func_ov011_021cd574
    ldmia sp!, {r3, r4, r5, pc}
.L_1c8:
    ldr r5, [r4, #0x288]
    cmp r5, #0x0
    bne .L_1d8
    bl func_ov011_021c9ca0
.L_1d8:
    add r5, r5, #0x10
    cmp r5, #0xff
    movgt r5, #0xff
    mov r0, #0x0
    mov r1, #0x1
    str r5, [r4, #0x288]
    bl func_ov000_021ab40c
    mov r1, r5, lsl #0xe
    ldr r2, _LIT4
    mov r0, r1, lsr #0x1f
    smull r1, r3, r2, r1
    add r3, r3, r5, lsl #0xe
    add r3, r0, r3, asr #0x7
    mov r1, r3, asr #0x4
    ldr r0, _LIT3
    mov r1, r1, lsl #0x2
    ldrsh r1, [r0, r1]
    mov r0, #0x0
    mov r1, r1, lsl #0x4
    mov r1, r1, asr #0xc
    bl func_ov000_021ab4cc
    cmp r5, #0xff
    bne .L_298
    bl func_ov000_021af28c
    cmp r0, #0x0
    bne .L_298
    ldr r2, [r4, #0x274]
    ldr r0, _LIT2
    mov r1, r2, lsl #0xb
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    and r2, r2, r0
    mov r0, r1, lsl #0x18
    orr r3, r2, r0, lsr #0xb
    mov r2, #0x200
    mov r0, #0x0
    mov r1, #0x10
    str r3, [r4, #0x274]
    str r2, [r4, #0x288]
    bl func_ov000_021ab4cc
    bl func_ov000_021ab818
    mov r0, #0x0
    bl func_ov011_021ce260
    mov r0, #0x0
    bl func_ov000_021acd6c
    mov r0, #0x0
    bl func_ov000_021ace18
    bl func_ov011_021c9c80
.L_298:
    bl func_ov011_021cd574
    ldmia sp!, {r3, r4, r5, pc}
.L_2a0:
    ldr r0, [r4, #0x288]
    mov r1, #0x3f
    subs r5, r0, #0x14
    movmi r5, #0x0
    mov r0, #0x0
    str r5, [r4, #0x288]
    bl func_ov000_021ab484
    mov r0, #0x0
    mov r1, #0x3f
    bl func_ov000_021ab440
    cmp r5, #0x100
    blt .L_308
    sub r0, r5, #0x100
    cmp r0, #0x100
    movgt r0, #0x100
    mov r1, r0, lsl #0xe
    mov r0, r1, asr #0x7
    add r0, r1, r0, lsr #0x18
    mov r1, r0, asr #0xc
    ldr r0, _LIT3
    mov r1, r1, lsl #0x2
    ldrsh r1, [r0, r1]
    mov r0, #0x0
    mov r1, r1, lsl #0x4
    mov r1, r1, asr #0xc
    bl func_ov000_021ab4cc
.L_308:
    cmp r5, #0x100
    ldmgeia sp!, {r3, r4, r5, pc}
    mov r0, #0x0
    mov r1, r0
    str r0, [r4, #0x288]
    bl func_ov000_021ab4cc
    bl func_ov011_021cf218
    cmp r0, #0x0
    beq .L_33c
    ldr r0, _LIT5
    bl func_0202c06c
    mov r1, #0x0
    bl func_ov000_021adc64
.L_33c:
    ldr r0, [r4, #0x280]
    orr r0, r0, #0x200
    str r0, [r4, #0x280]
    bl func_ov011_021cb154
    ldr r0, [r4, #0x270]
    orr r0, r0, #0x10000
    str r0, [r4, #0x270]
    bl func_ov011_021cfaac
    bl func_ov011_021ca59c
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov011_021d3f20
_LIT1: .word data_ov011_021d3f5c
_LIT2: .word 0xffe01fff
_LIT3: .word data_020bee8c
_LIT4: .word 0x80808081
_LIT5: .word 0x000004b3
