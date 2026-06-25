; func_02014e38 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_02013990
        .extern func_02019000
        .extern func_020190b8
        .extern func_020190c8
        .extern func_020195b8
        .extern func_0201960c
        .extern func_02019630
        .extern func_0201aa7c
        .extern func_0201aab4
        .extern func_0201b774
        .extern func_0201b7a0
        .extern func_ov000_021ae3a0
        .global func_02014e38
        .arm
func_02014e38:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl GetSystemWork
    mov r4, r0
    ldr r0, [r4, #0x8d8]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x920]
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r3, r4, r5, pc}
    ldmia sp!, {r3, r4, r5, pc}
    b .L_4c
    b .L_6c
    b .L_7c
    b .L_e4
    b .L_104
    b .L_1f4
.L_4c:
    bl func_020190c8
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_02013990
    cmp r0, #0x5
    ldreq r0, _LIT0
    streq r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_6c:
    ldr r0, _LIT1
    str r0, [r5, #0x8]
    bl func_0201b774
    ldmia sp!, {r3, r4, r5, pc}
.L_7c:
    ldr r0, [r4, #0x924]
    cmp r0, #0x1
    beq .L_9c
    cmp r0, #0x2
    beq .L_d8
    cmp r0, #0x3
    beq .L_a4
    ldmia sp!, {r3, r4, r5, pc}
.L_9c:
    mov r0, #0x3
    str r0, [r4, #0x924]
.L_a4:
    bl func_020190b8
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_02019000
    ldr r1, [r4, #0x8dc]
    add r1, r1, #0x1
    cmp r0, r1
    ldmccia sp!, {r3, r4, r5, pc}
    bl func_02013990
    cmp r0, #0x5
    ldreq r0, _LIT2
    streq r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_d8:
    ldr r0, _LIT3
    str r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_e4:
    ldr r1, _LIT4
    mov r0, #0x7b
    str r1, [r5, #0x8]
    bl func_0201aa7c
    ldr r0, [r4, #0x900]
    orr r0, r0, #0x1000000
    str r0, [r4, #0x900]
    ldmia sp!, {r3, r4, r5, pc}
.L_104:
    ldr r0, [r4, #0x924]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r3, r4, r5, pc}
    ldmia sp!, {r3, r4, r5, pc}
    b .L_128
    b .L_19c
    b .L_14c
    b .L_130
.L_128:
    mov r0, #0x4
    str r0, [r4, #0x924]
.L_130:
    ldr r0, _LIT5
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x8e0]
    ldmia sp!, {r3, r4, r5, pc}
.L_14c:
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_020195b8
    cmp r0, #0x0
    bne .L_190
    ldr r0, _LIT6
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x924]
    sub r0, r0, #0x1
    str r0, [r4, #0x924]
    ldmia sp!, {r3, r4, r5, pc}
.L_190:
    ldr r0, _LIT7
    str r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_19c:
    ldr r0, _LIT8
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    bne .L_1d8
    mov r0, #0xe
    str r0, [r4, #0x91c]
    mov r0, #0x3
    str r0, [r4, #0x920]
    mov r0, #0x4
    str r0, [r4, #0x924]
    ldr r0, [r4, #0x8e0]
    orr r0, r0, #0x4
    str r0, [r4, #0x8e0]
.L_1d8:
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, #0x0
    bl func_0201960c
    ldmia sp!, {r3, r4, r5, pc}
.L_1f4:
    ldr r0, [r4, #0x924]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r3, r4, r5, pc}
    ldmia sp!, {r3, r4, r5, pc}
    b .L_218
    b .L_2cc
    b .L_258
    b .L_220
.L_218:
    mov r0, #0x4
    str r0, [r4, #0x924]
.L_220:
    mov r0, r5
    bl func_0201b7a0
    cmp r0, #0x3
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_02019630
    cmp r0, #0x7b
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT9
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x8e0]
    ldmia sp!, {r3, r4, r5, pc}
.L_258:
    bl func_ov000_021ae3a0
    cmp r0, #0x2
    bne .L_2a0
    mov r0, #0xe
    str r0, [r4, #0x91c]
    mov r0, #0x6
    str r0, [r4, #0x920]
    mov r0, #0x4
    str r0, [r4, #0x924]
    ldr r1, [r4, #0x8e0]
    mov r0, #0x0
    orr r1, r1, #0x4
    str r1, [r4, #0x8e0]
    bl func_0201960c
    ldr r0, [r4, #0x8e0]
    orr r0, r0, #0x4
    str r0, [r4, #0x8e0]
    ldmia sp!, {r3, r4, r5, pc}
.L_2a0:
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_020195b8
    cmp r0, #0x0
    ldreq r0, _LIT10
    streq r0, [r5, #0x8]
    ldrne r0, _LIT11
    strne r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_2cc:
    ldr r0, _LIT12
    str r0, [r5, #0x8]
    bl func_0201b774
    mov r0, #0x7b
    bl func_0201aab4
    ldr r0, [r4, #0x900]
    bic r0, r0, #0x1000000
    str r0, [r4, #0x900]
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x000e0100
_LIT1: .word 0x000e0200
_LIT2: .word 0x000e0300
_LIT3: .word 0x000e0301
_LIT4: .word 0x000e0400
_LIT5: .word 0x000e0500
_LIT6: .word 0x000e0504
_LIT7: .word 0x000e0502
_LIT8: .word 0x000e0503
_LIT9: .word 0x000e0600
_LIT10: .word 0x000e0601
_LIT11: .word 0x000e0602
_LIT12: .word 0x000e0603
