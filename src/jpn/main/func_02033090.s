; func_02033090 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020fe388
        .extern func_020325d0
        .extern func_02032628
        .extern func_02032648
        .extern func_02032668
        .extern func_02032680
        .extern func_02033000
        .extern func_020454a0
        .extern func_02094500
        .global func_02033090
        .arm
func_02033090:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    movs r7, r0
    mov r4, r1
    mov r6, r2
    mov r5, r3
    bne .L_78
    ldr r0, _LIT0
    mov r1, #0x4
    blx r6
    movs r7, r0
    mvneq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r2, _LIT0
    mov r1, #0x0
    bl func_02094500
    str r6, [r7, #0xeb4]
    cmp r4, #0x40
    movgt r4, #0x40
    ldr r0, _LIT1
    str r5, [r7, #0xeb8]
    str r0, [r7, #0xea8]
    mov r0, r7
    mov r1, r4
    str r4, [r7, #0xea4]
    bl func_02032680
    cmp r0, #0x0
    mvnlt r0, #0x0
    ldmltia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r7
    bl func_02032628
.L_78:
    mov r0, #0x2
    bl func_020325d0
    ldr r0, _LIT2
    ldr r4, [r0]
    cmp r4, #0x0
    bge .L_a4
    mov r0, r6
    mov r1, r5
    mov r2, #0x0
    bl func_02033000
    mov r4, r0
.L_a4:
    ldr r0, _LIT3
    ldr r1, _LIT4
    bl func_020454a0
    mov r0, r4
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x00000f9c
_LIT1: .word 0x00007530
_LIT2: .word data_020fe388
_LIT3: .word func_02032648
_LIT4: .word func_02032668
