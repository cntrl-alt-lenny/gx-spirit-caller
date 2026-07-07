; func_ov002_0223b4dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022ce85c
        .extern func_02031594
        .extern func_ov002_0223b310
        .global func_ov002_0223b4dc
        .arm
func_ov002_0223b4dc:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr r3, _LIT0
    mov r6, #0x0
    ldr r4, [r3, #0x69c]
    ldr r2, _LIT1
    ldr r8, [r3, #0x6a4]
    cmp r4, r2
    mov sl, r0
    moveq r0, r1
    cmpeq r0, #0x2
    moveq r0, #0x7
    moveq r8, #0x2
    streq r0, [r3, #0x6b8]
    str r1, [sp]
    mov r7, r6
    mvn r5, #0x0
    cmp r8, #0x0
    mov r4, #0x0
    ble .L_ac
    ldr fp, _LIT0
.L_50:
    add r0, fp, r4, lsl #0x2
    ldr r9, [r0, #0x6b4]
    mov r1, sl
    mov r0, r9
    bl func_ov002_0223b310
    cmp r0, #0x0
    movne r5, r4
    addne r6, r6, #0x1
    bne .L_a0
    cmp r9, #0x14
    ble .L_a0
    ldr r0, [fp, #0x6b0]
    cmp r0, #0x0
    bne .L_a0
    mov r0, sl
    bl func_02031594
    cmp r0, #0x0
    movne r5, r4
    addne r6, r6, #0x1
    addne r7, r7, #0x1
.L_a0:
    add r4, r4, #0x1
    cmp r4, r8
    blt .L_50
.L_ac:
    cmp r6, #0x0
    beq .L_10c
    ldr r0, [sp]
    cmp r0, #0x0
    beq .L_104
    cmp r6, #0x1
    ble .L_e8
    ldr r0, _LIT0
    cmp r6, r7
    ldr r1, [r0, #0x6a8]
    add r1, r1, #0x1
    str r1, [r0, #0x6a8]
    moveq r1, #0x1
    streq r1, [r0, #0x6b0]
    b .L_104
.L_e8:
    ldr r0, _LIT2
    mov r1, #0x0
    str r1, [r0, r5, lsl #0x2]
    cmp r7, #0x0
    ldrne r0, _LIT0
    movne r1, #0x1
    strne r1, [r0, #0x6b0]
.L_104:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_10c:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x00001a4e
_LIT2: .word data_ov002_022ce85c
