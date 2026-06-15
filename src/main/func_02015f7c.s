; func_02015f7c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_020139c4
        .extern func_02019034
        .extern func_020190ec
        .extern func_020190fc
        .extern func_020191cc
        .extern func_020195ec
        .extern func_02019664
        .extern func_0201a430
        .extern func_0201aabc
        .extern func_0201aaf4
        .extern func_0201ab5c
        .extern func_0201b75c
        .extern func_0201b7b4
        .extern func_0201b7e0
        .global func_02015f7c
        .arm
func_02015f7c:
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
    b .L_2564
    b .L_2590
    b .L_25a0
    b .L_25f0
    b .L_2608
    b .L_2704
.L_2564:
    bl func_020190fc
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_020139c4
    cmp r0, #0x5
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_020191cc
    cmp r0, #0xf
    ldrge r0, _LIT0
    strge r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_2590:
    ldr r0, _LIT1
    str r0, [r5, #0x8]
    bl func_0201b7b4
    ldmia sp!, {r3, r4, r5, pc}
.L_25a0:
    bl func_02019034
    ldr r1, [r4, #0x8dc]
    add r1, r1, #0x1
    cmp r0, r1
    ldmccia sp!, {r3, r4, r5, pc}
    bl func_020190ec
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_020139c4
    cmp r0, #0x5
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT2
    mov r0, #0x7b
    str r1, [r5, #0x8]
    bl func_0201aabc
    bl func_0201b75c
    ldr r1, [r0]
    orr r1, r1, #0x2000
    str r1, [r0]
    ldmia sp!, {r3, r4, r5, pc}
.L_25f0:
    ldr r0, _LIT3
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x900]
    orr r0, r0, #0x1000000
    str r0, [r4, #0x900]
    ldmia sp!, {r3, r4, r5, pc}
.L_2608:
    ldr r0, [r4, #0x924]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r3, r4, r5, pc}
    ldmia sp!, {r3, r4, r5, pc}
    b .L_262c
    b .L_26dc
    b .L_267c
    b .L_2634
.L_262c:
    mov r0, #0x4
    str r0, [r4, #0x924]
.L_2634:
    mov r0, r5
    bl func_0201b7e0
    cmp r0, #0x3
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_02019664
    cmp r0, #0x7b
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT4
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x8e0]
    bl func_0201b75c
    ldr r1, [r0]
    bic r1, r1, #0x2000
    str r1, [r0]
    ldmia sp!, {r3, r4, r5, pc}
.L_267c:
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_020195ec
    cmp r0, #0x0
    bne .L_26d0
    ldr r0, _LIT5
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    ldreq r0, [r4, #0x924]
    subeq r0, r0, #0x1
    streq r0, [r4, #0x924]
    ldr r1, [r4, #0x900]
    mov r0, #0x7b
    bic r1, r1, #0x1000000
    str r1, [r4, #0x900]
    bl func_0201aaf4
    ldmia sp!, {r3, r4, r5, pc}
.L_26d0:
    ldr r0, _LIT6
    str r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_26dc:
    ldr r0, _LIT7
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, #0x5
    str r0, [r4, #0x920]
    str r0, [r4, #0x924]
    ldmia sp!, {r3, r4, r5, pc}
.L_2704:
    ldr r0, _LIT8
    str r0, [r5, #0x8]
    bl func_0201b7b4
    mov r0, #0x1
    bl func_0201ab5c
    mov r0, #0x1
    bl func_0201a430
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00170100
_LIT1: .word 0x00170200
_LIT2: .word 0x00170300
_LIT3: .word 0x00170400
_LIT4: .word 0x00170500
_LIT5: .word 0x00170504
_LIT6: .word 0x00170502
_LIT7: .word 0x00170503
_LIT8: .word 0x00170600
