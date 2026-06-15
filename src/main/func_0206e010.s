; func_0206e010 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_0219ece8
        .extern data_0219ed48
        .extern data_0219ed4c
        .extern func_0206de68
        .global func_0206e010
        .arm
func_0206e010:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r4, _LIT0
    ldr r5, _LIT1
.L_85c:
    bl OS_DisableIrq
    ldr r6, [r5]
    cmp r6, #0x0
    beq .L_890
    ldr r2, [r4]
.L_870:
    cmp r6, r2
    beq .L_884
    ldrsh r1, [r6, #0x70]
    ands r1, r1, #0x10
    beq .L_890
.L_884:
    ldr r6, [r6, #0x7c]
    cmp r6, #0x0
    bne .L_870
.L_890:
    bl OS_RestoreIrq
    cmp r6, #0x0
    beq .L_8a8
    mov r0, r6
    bl func_0206de68
    b .L_85c
.L_8a8:
    ldr r0, _LIT1
    ldr r1, [r0]
    cmp r1, #0x0
    beq .L_8d4
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r1, r0
    bne .L_8ec
    ldr r0, [r1, #0x7c]
    cmp r0, #0x0
    bne .L_8ec
.L_8d4:
    ldr r0, _LIT2
    ldr r0, [r0]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, lr}
    bxeq lr
.L_8ec:
    mvn r0, #0x19
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
_LIT0: .word data_0219ece8
_LIT1: .word data_0219ed48
_LIT2: .word data_0219ed4c
