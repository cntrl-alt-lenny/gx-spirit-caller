; func_02030c7c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202b878
        .extern func_0202b8c0
        .global func_02030c7c
        .arm
func_02030c7c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    bl func_0202b878
    mov r5, r0
    mov r0, r4
    bl func_0202b8c0
    cmp r5, #0x16
    beq .L_6ac
    cmp r5, #0x17
    bne .L_6bc
    cmp r0, #0x1
    moveq r0, #0x3
    movne r0, #0x2
    ldmia sp!, {r3, r4, r5, pc}
.L_6ac:
    cmp r0, #0x5
    moveq r0, #0x2
    movne r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_6bc:
    ldr r2, _LIT0
    cmp r4, r2
    bgt .L_7b4
    bge .L_87c
    ldr r1, _LIT1
    cmp r4, r1
    bgt .L_750
    bge .L_87c
    sub r0, r1, #0x120
    cmp r4, r0
    bgt .L_72c
    bge .L_87c
    cmp r4, #0xfe0
    bgt .L_6fc
    beq .L_87c
    b .L_884
.L_6fc:
    sub r0, r1, #0x3ac
    cmp r4, r0
    bgt .L_884
    ldr r1, _LIT2
    cmp r4, r1
    blt .L_884
    addne r0, r1, #0x1
    cmpne r4, r0
    addne r0, r1, #0x2
    cmpne r4, r0
    beq .L_87c
    b .L_884
.L_72c:
    sub r0, r1, #0x3b
    cmp r4, r0
    bgt .L_740
    beq .L_87c
    b .L_884
.L_740:
    sub r0, r1, #0x11
    cmp r4, r0
    beq .L_87c
    b .L_884
.L_750:
    sub r0, r2, #0x178
    cmp r4, r0
    bgt .L_784
    bge .L_87c
    add r0, r1, #0xc3
    cmp r4, r0
    bgt .L_774
    beq .L_87c
    b .L_884
.L_774:
    add r0, r1, #0xcd
    cmp r4, r0
    beq .L_87c
    b .L_884
.L_784:
    rsb r0, r1, #0x2b80
    cmp r4, r0
    bgt .L_7a4
    bge .L_87c
    add r0, r1, #0x1c8
    cmp r4, r0
    beq .L_87c
    b .L_884
.L_7a4:
    sub r0, r2, #0x3
    cmp r4, r0
    beq .L_87c
    b .L_884
.L_7b4:
    ldr r1, _LIT3
    cmp r4, r1
    bgt .L_81c
    bge .L_87c
    add r0, r2, #0x60
    cmp r4, r0
    bgt .L_7f8
    bge .L_87c
    sub r0, r1, #0x174
    cmp r4, r0
    bgt .L_7e8
    beq .L_87c
    b .L_884
.L_7e8:
    sub r0, r1, #0x170
    cmp r4, r0
    beq .L_87c
    b .L_884
.L_7f8:
    sub r0, r1, #0xfc
    cmp r4, r0
    bgt .L_80c
    beq .L_87c
    b .L_884
.L_80c:
    sub r0, r1, #0x30
    cmp r4, r0
    beq .L_87c
    b .L_884
.L_81c:
    add r0, r2, #0x2ec
    cmp r4, r0
    bgt .L_850
    bge .L_87c
    add r0, r1, #0xee
    cmp r4, r0
    bgt .L_840
    beq .L_87c
    b .L_884
.L_840:
    add r0, r1, #0xef
    cmp r4, r0
    beq .L_87c
    b .L_884
.L_850:
    add r0, r2, #0x3b8
    cmp r4, r0
    bgt .L_870
    bge .L_87c
    add r0, r2, #0x338
    cmp r4, r0
    beq .L_87c
    b .L_884
.L_870:
    add r0, r2, #0x3d0
    cmp r4, r0
    bne .L_884
.L_87c:
    mov r0, #0x2
    ldmia sp!, {r3, r4, r5, pc}
.L_884:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00001774
_LIT1: .word 0x000014c7
_LIT2: .word 0x00001119
_LIT3: .word 0x00001936
