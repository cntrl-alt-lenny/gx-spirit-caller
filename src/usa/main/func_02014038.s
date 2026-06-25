; func_02014038 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_02013980
        .extern func_02018a04
        .extern func_02018a30
        .extern func_02019000
        .extern func_02019584
        .extern func_020195b8
        .extern func_0201960c
        .extern func_02019630
        .extern func_02019668
        .extern func_0201ab70
        .extern func_0201ab94
        .extern func_0201b774
        .extern func_0201b7a0
        .global func_02014038
        .arm
func_02014038:
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
    b .L_264
    b .L_2e4
    b .L_3f8
    b .L_404
.L_264:
    bl func_02019000
    ldr r1, [r4, #0x8dc]
    add r1, r1, #0x3
    cmp r0, r1
    ldmccia sp!, {r3, r4, r5, pc}
    mov r0, #0x42
    mov r1, #0x0
    bl func_02019584
    cmp r0, #0x2
    ldmltia sp!, {r3, r4, r5, pc}
    mov r0, #0x41
    mov r1, #0x0
    bl func_02019584
    cmp r0, #0x2
    ldmltia sp!, {r3, r4, r5, pc}
    mov r0, r5
    bl func_0201b7a0
    cmp r0, #0x4
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_02013980
    cmp r0, #0x2
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, #0x1
    bl func_0201ab70
    ldr r1, _LIT0
    mov r0, #0x13
    str r1, [r5, #0x8]
    ldr r1, [r4, #0x900]
    orr r1, r1, #0x1000000
    str r1, [r4, #0x900]
    bl func_02018a04
    ldmia sp!, {r3, r4, r5, pc}
.L_2e4:
    ldr r0, [r4, #0x924]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r3, r4, r5, pc}
    ldmia sp!, {r3, r4, r5, pc}
    b .L_308
    b .L_3ac
    b .L_348
    b .L_310
.L_308:
    mov r0, #0x4
    str r0, [r4, #0x924]
.L_310:
    bl func_02019630
    cmp r0, #0x65
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_02019668
    cmp r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT1
    str r0, [r5, #0x8]
    bl func_02018a30
    ldr r0, [r4, #0x8e0]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x8e0]
    ldmia sp!, {r3, r4, r5, pc}
.L_348:
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_020195b8
    cmp r0, #0x0
    bne .L_3a0
    ldr r0, _LIT2
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    ldreq r0, [r4, #0x924]
    subeq r0, r0, #0x1
    streq r0, [r4, #0x924]
    bl func_0201b774
    ldr r1, [r4, #0x900]
    mov r0, #0x1
    bic r1, r1, #0x1000000
    str r1, [r4, #0x900]
    bl func_0201ab94
    ldmia sp!, {r3, r4, r5, pc}
.L_3a0:
    ldr r0, _LIT3
    str r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_3ac:
    ldr r0, _LIT4
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    bne .L_3d4
    mov r0, #0x2
    str r0, [r4, #0x920]
    mov r0, #0x5
    str r0, [r4, #0x924]
.L_3d4:
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    bne .L_3ec
    mov r0, #0x0
    bl func_0201960c
.L_3ec:
    mov r0, #0x13
    bl func_02018a04
    ldmia sp!, {r3, r4, r5, pc}
.L_3f8:
    ldr r0, _LIT5
    str r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_404:
    mov r0, #0x8
    mov r1, #0x0
    bl func_02019584
    cmp r0, #0x2
    ldmltia sp!, {r3, r4, r5, pc}
    mov r0, #0x9
    mov r1, #0x0
    bl func_02019584
    cmp r0, #0x2
    ldmltia sp!, {r3, r4, r5, pc}
    mov r0, r5
    bl func_0201b7a0
    cmp r0, #0x4
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT6
    str r0, [r5, #0x8]
    bl func_0201b774
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00050100
_LIT1: .word 0x00050200
_LIT2: .word 0x00050204
_LIT3: .word 0x00050202
_LIT4: .word 0x00050203
_LIT5: .word 0x00050300
_LIT6: .word 0x00050400
