; func_02016cd8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_020139c4
        .extern func_02018a38
        .extern func_02018a64
        .extern func_02019034
        .extern func_020190ec
        .extern func_020191cc
        .extern func_020195ec
        .extern func_02019664
        .extern func_0201aabc
        .extern func_0201aaf4
        .extern func_0201abb0
        .extern func_0201b708
        .extern func_0201b730
        .extern func_0201b7b4
        .extern func_0201b7e0
        .global func_02016cd8
        .arm
func_02016cd8:
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
    b .L_32c4
    b .L_331c
    b .L_335c
    b .L_3394
    b .L_33d4
    b .L_33f0
    b .L_34d8
.L_32c4:
    bl func_020190ec
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_020191cc
    cmp r0, #0x12
    ldmltia sp!, {r3, r4, r5, pc}
    bl func_02019034
    ldr r1, [r4, #0x8dc]
    add r1, r1, #0x1
    cmp r0, r1
    ldmccia sp!, {r3, r4, r5, pc}
    bl func_020139c4
    cmp r0, #0x5
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT0
    mov r0, #0x78
    str r1, [r5, #0x8]
    bl func_0201aabc
    ldr r0, [r4, #0x900]
    orr r0, r0, #0x1000000
    str r0, [r4, #0x900]
    ldmia sp!, {r3, r4, r5, pc}
.L_331c:
    mov r0, r5
    bl func_0201b7e0
    cmp r0, #0x3
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_02019664
    cmp r0, #0x78
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT1
    mov r0, #0x78
    str r1, [r5, #0x8]
    bl func_0201aaf4
    bl func_0201b7b4
    ldr r0, [r4, #0x900]
    bic r0, r0, #0x1000000
    str r0, [r4, #0x900]
    ldmia sp!, {r3, r4, r5, pc}
.L_335c:
    mov r0, r5
    bl func_0201b7e0
    cmp r0, #0x4
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_020139c4
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_02019034
    ldr r1, [r4, #0x8dc]
    add r1, r1, #0x1
    cmp r0, r1
    ldrcs r0, _LIT2
    strcs r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_3394:
    bl func_020190ec
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_020139c4
    cmp r0, #0x5
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT3
    mov r0, #0x13
    str r1, [r5, #0x8]
    ldr r1, [r4, #0x900]
    orr r1, r1, #0x1000000
    str r1, [r4, #0x900]
    bl func_02018a38
    mov r0, #0xc
    bl func_0201b708
    ldmia sp!, {r3, r4, r5, pc}
.L_33d4:
    bl func_02019664
    cmp r0, #0x71
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT4
    str r0, [r5, #0x8]
    bl func_02018a64
    ldmia sp!, {r3, r4, r5, pc}
.L_33f0:
    ldr r0, [r4, #0x924]
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r3, r4, r5, pc}
    ldmia sp!, {r3, r4, r5, pc}
    b .L_341c
    b .L_34b4
    b .L_3488
    b .L_346c
    b .L_3440
    b .L_3424
.L_341c:
    mov r0, #0x6
    str r0, [r4, #0x924]
.L_3424:
    ldr r0, _LIT5
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x8e0]
    ldmia sp!, {r3, r4, r5, pc}
.L_3440:
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_020195ec
    cmp r0, #0x0
    ldreq r0, _LIT6
    streq r0, [r5, #0x8]
    ldrne r0, _LIT7
    strne r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_346c:
    ldr r0, _LIT8
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x8e0]
    ldmia sp!, {r3, r4, r5, pc}
.L_3488:
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_020195ec
    cmp r0, #0x0
    ldreq r0, _LIT9
    streq r0, [r5, #0x8]
    ldrne r0, _LIT10
    strne r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_34b4:
    ldr r0, _LIT11
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x900]
    bic r0, r0, #0x1000000
    str r0, [r4, #0x900]
    bl func_0201b7b4
    mov r0, #0xc
    bl func_0201b730
    ldmia sp!, {r3, r4, r5, pc}
.L_34d8:
    ldr r0, [r4, #0x924]
    cmp r0, #0x1
    beq .L_34f8
    cmp r0, #0x2
    beq .L_3538
    cmp r0, #0x3
    beq .L_3500
    ldmia sp!, {r3, r4, r5, pc}
.L_34f8:
    mov r0, #0x3
    str r0, [r4, #0x924]
.L_3500:
    bl func_020190ec
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_020139c4
    cmp r0, #0x5
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT12
    mov r0, #0x78
    str r1, [r5, #0x8]
    bl func_0201aabc
    ldr r0, [r4, #0x900]
    orr r0, r0, #0x1000000
    str r0, [r4, #0x900]
    ldmia sp!, {r3, r4, r5, pc}
.L_3538:
    mov r0, r5
    bl func_0201b7e0
    cmp r0, #0x3
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_02019664
    cmp r0, #0x78
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT13
    mov r0, #0x4
    str r1, [r5, #0x8]
    bl func_0201abb0
    mov r0, #0x78
    bl func_0201aaf4
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
