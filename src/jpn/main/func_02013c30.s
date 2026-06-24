; func_02013c30 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_02013980
        .extern func_02013990
        .extern func_020190b8
        .extern func_020190c8
        .extern func_02019198
        .extern func_020195b8
        .extern func_02019630
        .extern func_02019668
        .extern func_0201b7a0
        .global func_02013c30
        .arm
func_02013c30:
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
    b .L_bc
    b .L_dc
    b .L_174
    b .L_1a4
    b .L_1bc
.L_4c:
    ldr r0, [r4, #0x924]
    cmp r0, #0x1
    beq .L_6c
    cmp r0, #0x2
    beq .L_a4
    cmp r0, #0x3
    beq .L_74
    ldmia sp!, {r3, r4, r5, pc}
.L_6c:
    mov r0, #0x3
    str r0, [r4, #0x924]
.L_74:
    bl func_020190b8
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r5
    bl func_0201b7a0
    cmp r0, #0x4
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_02013990
    cmp r0, #0x0
    ldreq r0, _LIT0
    streq r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_a4:
    mov r0, r5
    bl func_0201b7a0
    cmp r0, #0x5
    ldreq r0, _LIT1
    streq r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_bc:
    bl func_02019630
    cmp r0, #0x6a
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_02019668
    cmp r0, #0x4
    ldreq r0, _LIT2
    streq r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_dc:
    ldr r0, [r4, #0x924]
    cmp r0, #0x1
    beq .L_fc
    cmp r0, #0x2
    beq .L_148
    cmp r0, #0x3
    beq .L_104
    ldmia sp!, {r3, r4, r5, pc}
.L_fc:
    mov r0, #0x3
    str r0, [r4, #0x924]
.L_104:
    bl func_02019198
    cmp r0, #0x4
    ldmltia sp!, {r3, r4, r5, pc}
    bl func_02013980
    cmp r0, #0x2
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r5
    bl func_0201b7a0
    cmp r0, #0x8
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT3
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x8e0]
    ldmia sp!, {r3, r4, r5, pc}
.L_148:
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_020195b8
    cmp r0, #0x0
    ldreq r0, _LIT4
    streq r0, [r5, #0x8]
    ldrne r0, _LIT5
    strne r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_174:
    mov r0, r5
    bl func_0201b7a0
    cmp r0, #0x4
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_02013990
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_020190c8
    cmp r0, #0x0
    movne r0, #0x30400
    strne r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_1a4:
    mov r0, r5
    bl func_0201b7a0
    cmp r0, #0x5
    ldreq r0, _LIT6
    streq r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_1bc:
    ldr r0, _LIT7
    str r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00030100
_LIT1: .word 0x00030101
_LIT2: .word 0x00030200
_LIT3: .word 0x00030300
_LIT4: .word 0x00030301
_LIT5: .word 0x00030302
_LIT6: .word 0x00030500
_LIT7: .word 0x00030600
