; func_ov002_0223bbc4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022d0170
        .extern func_02030b30
        .extern func_02031630
        .extern func_ov002_0223b494
        .extern func_ov002_0223b4dc
        .global func_ov002_0223bbc4
        .arm
func_ov002_0223bbc4:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r6, r0
    mov r4, r1
    mov r5, r2
    bl func_02030b30
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r1, _LIT0
    mov r0, r6
    str r6, [r1, #0x69c]
    str r4, [r1, #0x6a4]
    bl func_02031630
    cmp r0, #0x0
    moveq r2, #0x1
    ldr r0, _LIT0
    movne r2, #0x0
    mov r1, #0x0
    str r2, [r0, #0x6b0]
    str r1, [r0, #0x6a8]
    bl func_ov002_0223b494
    ldr r6, _LIT0
    mov r4, #0x0
    ldr r0, [r6, #0x6a4]
    cmp r0, #0x0
    ble .L_24c
    ldr r8, _LIT1
    mov r7, #0x2
.L_1fc:
    ldr r2, [r5]
    mov r1, r7
    mov r0, r2, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r2, lsr #0x1f
    mov r0, r0, lsl #0x2
    ldrh r0, [r8, r0]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_ov002_0223b4dc
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r0, [r6, #0x6a4]
    add r4, r4, #0x1
    cmp r4, r0
    add r5, r5, #0x4
    blt .L_1fc
.L_24c:
    ldr r1, _LIT0
    ldr r0, _LIT2
    ldr r2, [r1, #0x69c]
    cmp r2, r0
    bne .L_27c
    ldr r0, [r1, #0x6b4]
    cmp r0, #0x0
    beq .L_27c
    ldr r0, [r1, #0x6a8]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
.L_27c:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022d0170
_LIT2: .word 0x00001a4e
