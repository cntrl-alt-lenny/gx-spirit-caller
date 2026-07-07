; func_ov002_022213ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021c83ac
        .extern func_ov002_021d58dc
        .extern func_ov002_0223dda4
        .extern func_ov002_0223de48
        .global func_ov002_022213ec
        .arm
func_ov002_022213ec:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r9, r0
    ldrh r1, [r9, #0x6]
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x18
    cmp r1, #0x2
    bne .L_58c
    mov r1, #0x0
    bl func_ov002_0223dda4
    mov r4, r0
    mov r0, r9
    mov r1, #0x1
    bl func_ov002_0223dda4
    mov r1, r4, lsl #0x10
    mov r2, r0, lsl #0x10
    mov r3, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r1, #0x0
    mov r5, r3, asr #0x8
    and r6, r0, #0xff
    mov r3, r2, asr #0x8
    mov r0, r9
    mov r2, r1
    and r4, r4, #0xff
    and r5, r5, #0xff
    and r7, r3, #0xff
    bl func_ov002_0223de48
    cmp r0, #0x0
    beq .L_58c
    mov r0, r9
    mov r1, #0x1
    mov r2, #0x0
    bl func_ov002_0223de48
    cmp r0, #0x0
    beq .L_58c
    mov r0, r4
    mov r1, r5
    bl func_ov002_021c83ac
    mov r8, r0
    mov r0, r6
    mov r1, r7
    bl func_ov002_021c83ac
    ldr r1, _LIT0
    mov r3, #0x2
    cmp r0, r1
    movgt r0, r1
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [sp]
    ldrh r2, [r9]
    mov r0, r4
    mov r1, r5
    bl func_ov002_021d58dc
    ldr r0, _LIT0
    mov r1, r7
    cmp r8, r0
    movgt r8, r0
    mov r0, r8, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [sp]
    ldrh r2, [r9]
    mov r0, r6
    mov r3, #0x2
    bl func_ov002_021d58dc
.L_58c:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x0000ffff
