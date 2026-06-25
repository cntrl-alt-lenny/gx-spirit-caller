; func_02016ca4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_02013990
        .extern func_02018a04
        .extern func_02018a30
        .extern func_02019000
        .extern func_020190b8
        .extern func_02019198
        .extern func_020195b8
        .extern func_02019630
        .extern func_0201aa7c
        .extern func_0201aab4
        .extern func_0201ab70
        .extern func_0201b6c8
        .extern func_0201b6f0
        .extern func_0201b774
        .extern func_0201b7a0
        .global func_02016ca4
        .arm
func_02016ca4:
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
    b .L_a8
    b .L_e8
    b .L_120
    b .L_160
    b .L_17c
    b .L_264
.L_50:
    bl func_020190b8
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_02019198
    cmp r0, #0x12
    ldmltia sp!, {r3, r4, r5, pc}
    bl func_02019000
    ldr r1, [r4, #0x8dc]
    add r1, r1, #0x1
    cmp r0, r1
    ldmccia sp!, {r3, r4, r5, pc}
    bl func_02013990
    cmp r0, #0x5
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT0
    mov r0, #0x78
    str r1, [r5, #0x8]
    bl func_0201aa7c
    ldr r0, [r4, #0x900]
    orr r0, r0, #0x1000000
    str r0, [r4, #0x900]
    ldmia sp!, {r3, r4, r5, pc}
.L_a8:
    mov r0, r5
    bl func_0201b7a0
    cmp r0, #0x3
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_02019630
    cmp r0, #0x78
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT1
    mov r0, #0x78
    str r1, [r5, #0x8]
    bl func_0201aab4
    bl func_0201b774
    ldr r0, [r4, #0x900]
    bic r0, r0, #0x1000000
    str r0, [r4, #0x900]
    ldmia sp!, {r3, r4, r5, pc}
.L_e8:
    mov r0, r5
    bl func_0201b7a0
    cmp r0, #0x4
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_02013990
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_02019000
    ldr r1, [r4, #0x8dc]
    add r1, r1, #0x1
    cmp r0, r1
    ldrcs r0, _LIT2
    strcs r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_120:
    bl func_020190b8
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_02013990
    cmp r0, #0x5
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT3
    mov r0, #0x13
    str r1, [r5, #0x8]
    ldr r1, [r4, #0x900]
    orr r1, r1, #0x1000000
    str r1, [r4, #0x900]
    bl func_02018a04
    mov r0, #0xc
    bl func_0201b6c8
    ldmia sp!, {r3, r4, r5, pc}
.L_160:
    bl func_02019630
    cmp r0, #0x71
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT4
    str r0, [r5, #0x8]
    bl func_02018a30
    ldmia sp!, {r3, r4, r5, pc}
.L_17c:
    ldr r0, [r4, #0x924]
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r3, r4, r5, pc}
    ldmia sp!, {r3, r4, r5, pc}
    b .L_1a8
    b .L_240
    b .L_214
    b .L_1f8
    b .L_1cc
    b .L_1b0
.L_1a8:
    mov r0, #0x6
    str r0, [r4, #0x924]
.L_1b0:
    ldr r0, _LIT5
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x8e0]
    ldmia sp!, {r3, r4, r5, pc}
.L_1cc:
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_020195b8
    cmp r0, #0x0
    ldreq r0, _LIT6
    streq r0, [r5, #0x8]
    ldrne r0, _LIT7
    strne r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_1f8:
    ldr r0, _LIT8
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x8e0]
    ldmia sp!, {r3, r4, r5, pc}
.L_214:
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_020195b8
    cmp r0, #0x0
    ldreq r0, _LIT9
    streq r0, [r5, #0x8]
    ldrne r0, _LIT10
    strne r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_240:
    ldr r0, _LIT11
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x900]
    bic r0, r0, #0x1000000
    str r0, [r4, #0x900]
    bl func_0201b774
    mov r0, #0xc
    bl func_0201b6f0
    ldmia sp!, {r3, r4, r5, pc}
.L_264:
    ldr r0, [r4, #0x924]
    cmp r0, #0x1
    beq .L_284
    cmp r0, #0x2
    beq .L_2c4
    cmp r0, #0x3
    beq .L_28c
    ldmia sp!, {r3, r4, r5, pc}
.L_284:
    mov r0, #0x3
    str r0, [r4, #0x924]
.L_28c:
    bl func_020190b8
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_02013990
    cmp r0, #0x5
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT12
    mov r0, #0x78
    str r1, [r5, #0x8]
    bl func_0201aa7c
    ldr r0, [r4, #0x900]
    orr r0, r0, #0x1000000
    str r0, [r4, #0x900]
    ldmia sp!, {r3, r4, r5, pc}
.L_2c4:
    mov r0, r5
    bl func_0201b7a0
    cmp r0, #0x3
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_02019630
    cmp r0, #0x78
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT13
    mov r0, #0x4
    str r1, [r5, #0x8]
    bl func_0201ab70
    mov r0, #0x78
    bl func_0201aab4
    ldr r0, [r4, #0x900]
    bic r0, r0, #0x1000000
    str r0, [r4, #0x900]
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x001f0100
_LIT1: .word 0x001f0200
_LIT2: .word 0x001f0300
_LIT3: .word 0x001f0400
_LIT4: .word 0x001f0500
_LIT5: .word 0x001f0600
_LIT6: .word 0x001f0601
_LIT7: .word 0x001f0602
_LIT8: .word 0x001f0603
_LIT9: .word 0x001f0604
_LIT10: .word 0x001f0605
_LIT11: .word 0x001f0606
_LIT12: .word 0x001f0700
_LIT13: .word 0x001f0701
