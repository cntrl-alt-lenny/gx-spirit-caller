; func_02016fe4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_02018a04
        .extern func_020195b8
        .extern func_02019630
        .extern func_02019648
        .extern func_02019668
        .extern func_0201ab70
        .extern func_0201ab94
        .extern func_0201b6c8
        .extern func_0201b774
        .global func_02016fe4
        .arm
func_02016fe4:
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
    beq .L_380
    cmp r0, #0x2
    beq .L_3b4
    cmp r0, #0x3
    beq .L_4a4
    ldmia sp!, {r3, r4, r5, pc}
.L_380:
    bl func_02019630
    cmp r0, #0x65
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_02019668
    cmp r0, #0x4
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, #0x4
    bl func_0201ab94
    mov r0, #0x2
    bl func_0201ab70
    ldr r0, _LIT0
    str r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_3b4:
    ldr r0, [r4, #0x924]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r3, r4, r5, pc}
    ldmia sp!, {r3, r4, r5, pc}
    b .L_3d8
    b .L_470
    b .L_420
    b .L_3e0
.L_3d8:
    mov r0, #0x4
    str r0, [r4, #0x924]
.L_3e0:
    bl func_02019630
    cmp r0, #0x65
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_02019668
    cmp r0, #0x2
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT1
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x8e0]
    ldr r0, [r4, #0x900]
    orr r0, r0, #0x1000000
    str r0, [r4, #0x900]
    ldmia sp!, {r3, r4, r5, pc}
.L_420:
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_020195b8
    cmp r0, #0x0
    bne .L_464
    ldr r0, _LIT2
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    ldreq r0, [r4, #0x924]
    subeq r0, r0, #0x1
    streq r0, [r4, #0x924]
    bl func_0201b774
    ldmia sp!, {r3, r4, r5, pc}
.L_464:
    ldr r0, _LIT3
    str r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_470:
    ldr r0, _LIT4
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    bne .L_498
    mov r0, #0x2
    str r0, [r4, #0x920]
    mov r0, #0x5
    str r0, [r4, #0x924]
.L_498:
    mov r0, #0x0
    bl func_02019648
    ldmia sp!, {r3, r4, r5, pc}
.L_4a4:
    ldr r0, [r4, #0x924]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r3, r4, r5, pc}
    ldmia sp!, {r3, r4, r5, pc}
    b .L_4c8
    b .L_568
    b .L_504
    b .L_4d0
.L_4c8:
    mov r0, #0x4
    str r0, [r4, #0x924]
.L_4d0:
    bl func_02019630
    cmp r0, #0x65
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_02019668
    cmp r0, #0x2
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT5
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x8e0]
    ldmia sp!, {r3, r4, r5, pc}
.L_504:
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_020195b8
    cmp r0, #0x0
    bne .L_55c
    ldr r1, _LIT6
    mov r0, #0xb
    str r1, [r5, #0x8]
    bl func_0201b6c8
    mov r0, #0x2
    bl func_0201ab94
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    ldreq r0, [r4, #0x924]
    subeq r0, r0, #0x1
    streq r0, [r4, #0x924]
    mov r0, #0x14
    bl func_02018a04
    ldmia sp!, {r3, r4, r5, pc}
.L_55c:
    ldr r0, _LIT7
    str r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_568:
    ldr r0, _LIT8
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, #0x3
    str r0, [r4, #0x920]
    mov r0, #0x5
    str r0, [r4, #0x924]
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00200100
_LIT1: .word 0x00200200
_LIT2: .word 0x00200204
_LIT3: .word 0x00200202
_LIT4: .word 0x00200203
_LIT5: .word 0x00200300
_LIT6: .word 0x00200304
_LIT7: .word 0x00200302
_LIT8: .word 0x00200303
