; func_02006b30 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c3d88
        .extern data_020c3d8c
        .extern data_02104e6c
        .extern func_020070e8
        .extern func_02097f44
        .extern func_02098294
        .extern func_020aad04
        .global func_02006b30
        .arm
func_02006b30:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r3, _LIT0
    mov r6, r1
    ldr r1, [r3]
    mov r7, r0
    mov r0, r6
    mov r5, r2
    bl func_020070e8
    mov r4, r0
    mvn r0, #0x0
    cmp r4, r0
    beq .L_60
    mov r0, r5
    mov r1, r6
    bl func_020aad04
    ldr r0, _LIT1
    ldr r1, _LIT2
    ldr r0, [r0, #0x4]
    mov r6, r5
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    ldr r0, [r1, r0, lsl #0x2]
    ldrsb r0, [r0]
    strb r0, [r5, r4]
.L_60:
    mov r0, r7
    bl func_02098294
    mov r0, r7
    mov r1, r6
    bl func_02097f44
    cmp r0, #0x0
    bne .L_a4
    mvn r1, #0x0
    cmp r4, r1
    beq .L_a4
    ldr r1, _LIT0
    mov r0, r7
    ldr r2, [r1, #0x8]
    mov r1, r6
    ldrsb r2, [r2]
    strb r2, [r5, r4]
    bl func_02097f44
.L_a4:
    cmp r0, #0x0
    moveq r6, #0x0
    mov r0, r6
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_020c3d88
_LIT1: .word data_02104e6c
_LIT2: .word data_020c3d8c
