; func_0201406c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_020139b4
        .extern func_02018a38
        .extern func_02018a64
        .extern func_02019034
        .extern func_020195b8
        .extern func_020195ec
        .extern func_02019640
        .extern func_02019664
        .extern func_0201969c
        .extern func_0201abb0
        .extern func_0201abd4
        .extern func_0201b7b4
        .extern func_0201b7e0
        .global func_0201406c
        .arm
func_0201406c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl GetSystemWork
    mov r4, r0
    ldr r0, [r4, #0x8d8]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x920]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r3, r4, r5, pc}
    ldmia sp!, {r3, r4, r5, pc}
    b .L_64c
    b .L_6cc
    b .L_7e0
    b .L_7ec
.L_64c:
    bl func_02019034
    ldr r1, [r4, #0x8dc]
    add r1, r1, #0x3
    cmp r0, r1
    ldmccia sp!, {r3, r4, r5, pc}
    mov r0, #0x42
    mov r1, #0x0
    bl func_020195b8
    cmp r0, #0x2
    ldmltia sp!, {r3, r4, r5, pc}
    mov r0, #0x41
    mov r1, #0x0
    bl func_020195b8
    cmp r0, #0x2
    ldmltia sp!, {r3, r4, r5, pc}
    mov r0, r5
    bl func_0201b7e0
    cmp r0, #0x4
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_020139b4
    cmp r0, #0x2
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, #0x1
    bl func_0201abb0
    ldr r1, _LIT0
    mov r0, #0x13
    str r1, [r5, #0x8]
    ldr r1, [r4, #0x900]
    orr r1, r1, #0x1000000
    str r1, [r4, #0x900]
    bl func_02018a38
    ldmia sp!, {r3, r4, r5, pc}
.L_6cc:
    ldr r0, [r4, #0x924]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r3, r4, r5, pc}
    ldmia sp!, {r3, r4, r5, pc}
    b .L_6f0
    b .L_794
    b .L_730
    b .L_6f8
.L_6f0:
    mov r0, #0x4
    str r0, [r4, #0x924]
.L_6f8:
    bl func_02019664
    cmp r0, #0x65
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_0201969c
    cmp r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT1
    str r0, [r5, #0x8]
    bl func_02018a64
    ldr r0, [r4, #0x8e0]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x8e0]
    ldmia sp!, {r3, r4, r5, pc}
.L_730:
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_020195ec
    cmp r0, #0x0
    bne .L_788
    ldr r0, _LIT2
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    ldreq r0, [r4, #0x924]
    subeq r0, r0, #0x1
    streq r0, [r4, #0x924]
    bl func_0201b7b4
    ldr r1, [r4, #0x900]
    mov r0, #0x1
    bic r1, r1, #0x1000000
    str r1, [r4, #0x900]
    bl func_0201abd4
    ldmia sp!, {r3, r4, r5, pc}
.L_788:
    ldr r0, _LIT3
    str r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_794:
    ldr r0, _LIT4
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    bne .L_7bc
    mov r0, #0x2
    str r0, [r4, #0x920]
    mov r0, #0x5
    str r0, [r4, #0x924]
.L_7bc:
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    bne .L_7d4
    mov r0, #0x0
    bl func_02019640
.L_7d4:
    mov r0, #0x13
    bl func_02018a38
    ldmia sp!, {r3, r4, r5, pc}
.L_7e0:
    ldr r0, _LIT5
    str r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_7ec:
    mov r0, #0x8
    mov r1, #0x0
    bl func_020195b8
    cmp r0, #0x2
    ldmltia sp!, {r3, r4, r5, pc}
    mov r0, #0x9
    mov r1, #0x0
    bl func_020195b8
    cmp r0, #0x2
    ldmltia sp!, {r3, r4, r5, pc}
    mov r0, r5
    bl func_0201b7e0
    cmp r0, #0x4
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT6
    str r0, [r5, #0x8]
    bl func_0201b7b4
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00050100
_LIT1: .word 0x00050200
_LIT2: .word 0x00050204
_LIT3: .word 0x00050202
_LIT4: .word 0x00050203
_LIT5: .word 0x00050300
_LIT6: .word 0x00050400
