; func_ov002_02291530 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_021bad9c
        .extern func_ov002_021baf88
        .extern func_ov002_021bce20
        .extern func_ov002_02259e8c
        .extern func_ov002_0227afc8
        .extern func_ov002_02280870
        .extern func_ov002_022816e4
        .global func_ov002_02291530
        .arm
func_ov002_02291530:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021bce20
    movs r4, r0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r0, [r5, #0x2]
    ldr r1, _LIT0
    mvn r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bad9c
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_022816e4
    ldrh r1, [r5, #0x2]
    mov r6, r0
    mov r0, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_022816e4
    cmp r6, r0
    movgt r0, #0x1
    ldmgtia sp!, {r4, r5, r6, pc}
    cmp r4, #0x2
    blt .L_27c
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bce20
    cmp r4, r0
    movgt r0, #0x1
    ldmgtia sp!, {r4, r5, r6, pc}
.L_27c:
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_02259e8c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT1
    bl func_ov002_021baf88
    cmp r0, #0x0
    bne .L_2b8
    ldr r0, _LIT2
    bl func_ov002_021baf88
    cmp r0, #0x0
    beq .L_314
.L_2b8:
    ldrh r0, [r5, #0x2]
    mvn r1, #0x0
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0227afc8
    ldrh r3, [r5, #0x2]
    ldr r1, _LIT3
    ldr r2, _LIT4
    mov r3, r3, lsl #0x1f
    mov r4, r3, lsr #0x1f
    rsb r3, r4, #0x1
    and r3, r3, #0x1
    mul r1, r3, r1
    ldr r1, [r2, r1]
    cmp r0, r1
    cmplt r0, #0x960
    blt .L_314
    mov r0, r4
    bl func_ov002_02280870
    cmp r0, #0x0
    movgt r0, #0x1
    ldmgtia sp!, {r4, r5, r6, pc}
.L_314:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00001a7e
_LIT1: .word 0x0000140e
_LIT2: .word 0x000017a6
_LIT3: .word 0x00000868
_LIT4: .word data_ov002_022cf08c
