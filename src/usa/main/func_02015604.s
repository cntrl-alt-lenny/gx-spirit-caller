; func_02015604 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_0200a250
        .extern func_02013990
        .extern func_020190b8
        .extern func_02019198
        .extern func_02019584
        .extern func_020195b8
        .extern func_0201960c
        .extern func_02019630
        .extern func_02019668
        .extern func_0201ab70
        .extern func_0201ab94
        .extern func_0201b774
        .global func_02015604
        .arm
func_02015604:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl GetSystemWork
    mov r4, r0
    ldr r0, [r4, #0x8d8]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x920]
    cmp r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x924]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r3, r4, r5, pc}
    ldmia sp!, {r3, r4, r5, pc}
    b .L_39c
    b .L_494
    b .L_43c
    b .L_3a4
.L_39c:
    mov r0, #0x4
    str r0, [r4, #0x924]
.L_3a4:
    bl func_02019198
    cmp r0, #0xb
    blt .L_400
    mov r0, #0xf
    mov r1, #0x0
    bl func_02019584
    cmp r0, #0x1
    blt .L_400
    bl func_020190b8
    cmp r0, #0x0
    beq .L_400
    bl func_02013990
    cmp r0, #0x5
    blt .L_400
    mov r0, #0x7
    bl func_0201ab70
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    bne .L_408
    mov r0, #0x8
    bl func_0200a250
    b .L_408
.L_400:
    mov r0, #0x7
    bl func_0201ab94
.L_408:
    bl func_02019630
    cmp r0, #0x65
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_02019668
    cmp r0, #0x7
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT0
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x8e0]
    ldmia sp!, {r3, r4, r5, pc}
.L_43c:
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_020195b8
    cmp r0, #0x0
    bne .L_488
    ldr r0, _LIT1
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    ldreq r0, [r4, #0x924]
    subeq r0, r0, #0x1
    streq r0, [r4, #0x924]
    bl func_0201b774
    mov r0, #0x7
    bl func_0201ab94
    ldmia sp!, {r3, r4, r5, pc}
.L_488:
    ldr r0, _LIT2
    str r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_494:
    ldr r0, _LIT3
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    bne .L_4bc
    mov r0, #0x1
    str r0, [r4, #0x920]
    mov r0, #0x5
    str r0, [r4, #0x924]
.L_4bc:
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, #0x0
    bl func_0201960c
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00120100
_LIT1: .word 0x00120104
_LIT2: .word 0x00120102
_LIT3: .word 0x00120103
