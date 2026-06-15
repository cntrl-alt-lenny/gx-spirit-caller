; func_0203a5d4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02039180
        .extern func_0203953c
        .extern func_02089260
        .extern func_020892c4
        .global func_0203a5d4
        .arm
func_0203a5d4:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r7, r1
    mov r8, r0
    mov r0, r7
    mov r6, r2
    bl func_020892c4
    movs r5, r0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r9, _LIT0
    mov r4, #0x0
    mov sl, #0x2
.L_196c:
    add r0, r5, r4, lsl #0x1
    ldrh r0, [r0, #0x4]
    cmp r0, r9
    beq .L_19e4
    bl func_02089260
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r0, [r0]
    mov r1, r0, lsr #0x18
    tst r1, #0x1
    beq .L_19c4
    add r0, r5, r4, lsl #0x1
    ldrh r2, [r0, #0x4]
    mov r0, r8
    mov r1, r7
    mov r3, r6
    bl func_02039180
    cmp r0, #0x0
    bne .L_19e4
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_19c4:
    mov r0, r0, lsl #0x8
    mov r1, sl
    mov r2, r6
    mov r0, r0, lsr #0x8
    bl func_0203953c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_19e4:
    add r4, r4, #0x1
    cmp r4, #0x4
    blt .L_196c
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0x0000ffff
