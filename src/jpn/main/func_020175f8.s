; func_020175f8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_02013980
        .extern func_02013990
        .extern func_02019000
        .extern func_020190b8
        .extern func_020195b8
        .extern func_0201960c
        .extern func_02019630
        .extern func_02019668
        .extern func_0201ab70
        .extern func_0201ab94
        .extern func_0201b774
        .extern func_0201b7a0
        .global func_020175f8
        .arm
func_020175f8:
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
    b .L_3d0
    b .L_448
    b .L_484
    b .L_58c
.L_3d0:
    ldr r0, [r4, #0x924]
    cmp r0, #0x1
    beq .L_3f0
    cmp r0, #0x2
    beq .L_43c
    cmp r0, #0x3
    beq .L_3f8
    ldmia sp!, {r3, r4, r5, pc}
.L_3f0:
    mov r0, #0x3
    str r0, [r4, #0x924]
.L_3f8:
    bl func_020190b8
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_02013990
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r5
    bl func_0201b7a0
    cmp r0, #0x4
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_02019000
    ldr r1, [r4, #0x8dc]
    add r1, r1, #0x1
    cmp r0, r1
    ldrcs r0, _LIT0
    strcs r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_43c:
    ldr r0, _LIT1
    str r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_448:
    mov r0, r5
    bl func_0201b7a0
    cmp r0, #0x4
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_02013980
    cmp r0, #0x2
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT2
    mov r0, #0x5
    str r1, [r5, #0x8]
    bl func_0201ab70
    ldr r0, [r4, #0x900]
    orr r0, r0, #0x1000000
    str r0, [r4, #0x900]
    ldmia sp!, {r3, r4, r5, pc}
.L_484:
    ldr r0, [r4, #0x924]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r3, r4, r5, pc}
    ldmia sp!, {r3, r4, r5, pc}
    b .L_4a8
    b .L_548
    b .L_4e4
    b .L_4b0
.L_4a8:
    mov r0, #0x4
    str r0, [r4, #0x924]
.L_4b0:
    bl func_02019630
    cmp r0, #0x65
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_02019668
    cmp r0, #0x5
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT3
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x8e0]
    ldmia sp!, {r3, r4, r5, pc}
.L_4e4:
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_020195b8
    cmp r0, #0x0
    bne .L_53c
    ldr r0, _LIT4
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    ldreq r0, [r4, #0x924]
    subeq r0, r0, #0x1
    streq r0, [r4, #0x924]
    bl func_0201b774
    mov r0, #0x5
    bl func_0201ab94
    ldr r0, [r4, #0x900]
    bic r0, r0, #0x1000000
    str r0, [r4, #0x900]
    ldmia sp!, {r3, r4, r5, pc}
.L_53c:
    ldr r0, _LIT5
    str r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_548:
    ldr r0, _LIT6
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    bne .L_570
    mov r0, #0x3
    str r0, [r4, #0x920]
    mov r0, #0x5
    str r0, [r4, #0x924]
.L_570:
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, #0x0
    bl func_0201960c
    ldmia sp!, {r3, r4, r5, pc}
.L_58c:
    bl func_020190b8
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_02013990
    cmp r0, #0x5
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_02019000
    ldr r1, [r4, #0x8dc]
    add r1, r1, #0x2
    cmp r0, r1
    ldmccia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT7
    str r0, [r5, #0x8]
    bl func_0201b774
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00220100
_LIT1: .word 0x00220101
_LIT2: .word 0x00220200
_LIT3: .word 0x00220300
_LIT4: .word 0x00220304
_LIT5: .word 0x00220302
_LIT6: .word 0x00220303
_LIT7: .word 0x00220400
