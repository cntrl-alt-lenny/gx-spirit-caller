; func_02006a1c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c3da4
        .extern data_02104e3c
        .extern func_020067dc
        .extern func_020069d8
        .extern func_02092784
        .extern func_02098640
        .global func_02006a1c
        .arm
func_02006a1c:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r0, _LIT0
    ldr r4, _LIT1
    ldr r2, [r0, #0x10]
    ldr r1, [r0, #0x8]
    mov r2, r2, lsl #0x1f
    movs r2, r2, lsr #0x1f
    ldr r7, [r0, #0xc]
    ldmia r0, {r5, r6}
    beq .L_54
    mov r0, #0x0
    bl func_02098640
    mvn r0, #0x0
    cmp r7, r0
    beq .L_48
    mov r1, r7
    mov r0, #0x0
    bl func_02098640
.L_48:
    ldr r0, [r4, #0x10]
    bic r0, r0, #0x1
    str r0, [r4, #0x10]
.L_54:
    mov r0, r5
    bl func_020069d8
    cmp r0, #0x0
    moveq r7, #0x1
    mvn r0, #0x0
    movne r7, #0x0
    cmp r6, r0
    beq .L_8c
    mov r0, r6
    bl func_020069d8
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    orr r7, r7, r0
.L_8c:
    bl func_02092784
    cmp r7, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, [r4, #0x10]
    ldr r2, _LIT2
    bic r0, r0, #0x1
    orr r3, r0, #0x1
    mvn r0, #0x0
    ldr r1, [r2, r5, lsl #0x3]
    cmp r6, r0
    ldrne r0, [r2, r6, lsl #0x3]
    str r3, [r4, #0x10]
    str r1, [r4, #0x8]
    str r0, [r4, #0xc]
    bl func_020067dc
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_02104e3c
_LIT1: .word data_02104e3c
_LIT2: .word data_020c3da4
