; func_02017e74 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_0200a250
        .extern func_02013980
        .extern func_02013990
        .extern func_02018a04
        .extern func_02018a30
        .extern func_02019000
        .extern func_020190b8
        .extern func_020195b8
        .extern func_02019630
        .extern func_02019668
        .extern func_0201a3b8
        .extern func_0201ab70
        .extern func_0201ab94
        .extern func_0201b774
        .extern func_0201b7a0
        .global func_02017e74
        .arm
func_02017e74:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl GetSystemWork
    mov r4, r0
    ldr r0, [r4, #0x8d8]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x920]
    cmp r0, #0x7
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r3, r4, r5, pc}
    ldmia sp!, {r3, r4, r5, pc}
    b .L_50
    b .L_a0
    b .L_c0
    b .L_104
    b .L_130
    b .L_168
    b .L_1a0
.L_50:
    bl func_0201a3b8
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_02019000
    ldr r1, [r4, #0x8dc]
    add r1, r1, #0x1
    cmp r0, r1
    ldmccia sp!, {r3, r4, r5, pc}
    bl func_02013990
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT0
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, #0x6
    bl func_0200a250
    ldmia sp!, {r3, r4, r5, pc}
.L_a0:
    mov r0, r5
    bl func_0201b7a0
    cmp r0, #0x5
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT1
    str r0, [r5, #0x8]
    bl func_0201b774
    ldmia sp!, {r3, r4, r5, pc}
.L_c0:
    bl func_020190b8
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_02013990
    cmp r0, #0x5
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_02019000
    ldr r1, [r4, #0x8dc]
    add r1, r1, #0x1
    cmp r0, r1
    ldmccia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT2
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x900]
    orr r0, r0, #0x1000000
    str r0, [r4, #0x900]
    ldmia sp!, {r3, r4, r5, pc}
.L_104:
    mov r0, r5
    bl func_0201b7a0
    cmp r0, #0x4
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT3
    mov r0, #0x3
    str r1, [r5, #0x8]
    bl func_0201ab70
    mov r0, #0x14
    bl func_02018a04
    ldmia sp!, {r3, r4, r5, pc}
.L_130:
    bl func_02019630
    cmp r0, #0x65
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_02019668
    cmp r0, #0x3
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT4
    mov r0, #0x3
    str r1, [r5, #0x8]
    bl func_0201ab94
    mov r0, #0x2
    bl func_0201ab70
    bl func_02018a30
    ldmia sp!, {r3, r4, r5, pc}
.L_168:
    bl func_02019630
    cmp r0, #0x65
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_02019668
    cmp r0, #0x2
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_02013980
    cmp r0, #0x2
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT5
    mov r0, #0x2
    str r1, [r5, #0x8]
    bl func_0201ab94
    ldmia sp!, {r3, r4, r5, pc}
.L_1a0:
    ldr r0, [r4, #0x924]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r3, r4, r5, pc}
    ldmia sp!, {r3, r4, r5, pc}
    b .L_1c4
    b .L_268
    b .L_23c
    b .L_1cc
.L_1c4:
    mov r0, #0x4
    str r0, [r4, #0x924]
.L_1cc:
    bl func_02013980
    cmp r0, #0x2
    bne .L_1f0
    mov r0, #0x6
    bl func_0201ab70
    bl GetSystemWork
    ldr r1, [r0, #0x8f8]
    orr r1, r1, #0x1000
    str r1, [r0, #0x8f8]
.L_1f0:
    bl func_02013980
    cmp r0, #0x2
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_02019630
    cmp r0, #0x65
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_02019668
    cmp r0, #0x6
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT6
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x8e0]
    ldr r0, [r4, #0x900]
    orr r0, r0, #0x1000000
    str r0, [r4, #0x900]
    ldmia sp!, {r3, r4, r5, pc}
.L_23c:
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_020195b8
    cmp r0, #0x0
    ldreq r0, _LIT7
    streq r0, [r5, #0x8]
    ldrne r0, _LIT8
    strne r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_268:
    ldr r0, _LIT9
    str r0, [r5, #0x8]
    bl func_0201b774
    mov r0, #0x6
    bl func_0201ab94
    bl GetSystemWork
    ldr r1, [r0, #0x8f8]
    bic r1, r1, #0x1000
    str r1, [r0, #0x8f8]
    ldr r0, [r4, #0x900]
    bic r0, r0, #0x1000000
    str r0, [r4, #0x900]
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00290100
_LIT1: .word 0x00290200
_LIT2: .word 0x00290300
_LIT3: .word 0x00290400
_LIT4: .word 0x00290500
_LIT5: .word 0x00290600
_LIT6: .word 0x00290700
_LIT7: .word 0x00290701
_LIT8: .word 0x00290702
_LIT9: .word 0x00290703
