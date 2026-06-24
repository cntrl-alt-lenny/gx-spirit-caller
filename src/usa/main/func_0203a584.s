; func_0203a584 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02039130
        .extern func_020394ec
        .extern func_02089178
        .extern func_020891dc
        .global func_0203a584
        .arm
func_0203a584:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r7, r1
    mov r8, r0
    mov r0, r7
    mov r6, r2
    bl func_020891dc
    movs r5, r0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r9, _LIT0
    mov r4, #0x0
    mov sl, #0x2
.L_30:
    add r0, r5, r4, lsl #0x1
    ldrh r0, [r0, #0x4]
    cmp r0, r9
    beq .L_a8
    bl func_02089178
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r0, [r0]
    mov r1, r0, lsr #0x18
    tst r1, #0x1
    beq .L_88
    add r0, r5, r4, lsl #0x1
    ldrh r2, [r0, #0x4]
    mov r0, r8
    mov r1, r7
    mov r3, r6
    bl func_02039130
    cmp r0, #0x0
    bne .L_a8
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_88:
    mov r0, r0, lsl #0x8
    mov r1, sl
    mov r2, r6
    mov r0, r0, lsr #0x8
    bl func_020394ec
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_a8:
    add r4, r4, #0x1
    cmp r4, #0x4
    blt .L_30
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0x0000ffff
