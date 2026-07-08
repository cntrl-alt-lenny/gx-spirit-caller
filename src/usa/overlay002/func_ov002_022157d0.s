; func_ov002_022157d0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022be02c
        .extern data_ov002_022be034
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf1a8
        .extern func_ov002_021bc538
        .extern func_ov002_021c9ff4
        .extern func_ov002_021ca310
        .extern func_ov002_021e2a4c
        .extern func_ov002_021e2b6c
        .extern func_ov002_0227ab74
        .global func_ov002_022157d0
        .arm
func_ov002_022157d0:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r6, r0
    ldrh r1, [r6]
    ldr r0, _LIT0
    mov r4, #0x0
    mov r5, r4
    cmp r1, r0
    beq .L_38
    ldr r0, _LIT1
    cmp r1, r0
    ldreq r5, _LIT2
    moveq r4, #0x2
    b .L_40
.L_38:
    ldr r5, _LIT3
    mov r4, #0x4
.L_40:
    ldr r0, _LIT4
    ldr r1, [r0, #0x5a8]
    cmp r1, #0x7e
    beq .L_1bc
    cmp r1, #0x7f
    beq .L_128
    cmp r1, #0x80
    bne .L_1c0
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc538
    cmp r0, r4
    addlt sp, sp, #0x8
    movlt r0, #0x0
    ldmltia sp!, {r4, r5, r6, pc}
    ldrh r0, [r6, #0x2]
    ldrh r1, [r6]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c9ff4
    cmp r0, #0x0
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r0, [r6, #0x2]
    ldr r1, [r5]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca310
    cmp r0, #0x0
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r0, [r6, #0x2]
    mov r1, r0, lsl #0x14
    mov r1, r1, lsr #0x1a
    cmp r1, #0x23
    beq .L_10c
    mov r0, r0, lsl #0x1f
    mov r1, r0, lsr #0x1f
    ldr r0, _LIT5
    and r1, r1, #0x1
    mul r2, r1, r0
    ldr r0, _LIT6
    ldr r0, [r0, r2]
    mov r0, r0, lsr #0x10
    tst r0, #0x1
    addne sp, sp, #0x8
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
.L_10c:
    bl func_ov002_021e2a4c
    ldr r0, _LIT4
    mov r1, #0x0
    str r1, [r0, #0x5ac]
    add sp, sp, #0x8
    mov r0, #0x7f
    ldmia sp!, {r4, r5, r6, pc}
.L_128:
    ldr r1, [r0, #0x5ac]
    cmp r1, r4
    addge sp, sp, #0x8
    movge r0, #0x7e
    ldmgeia sp!, {r4, r5, r6, pc}
    add r1, sp, #0x4
    mov r3, #0x0
    str r3, [r1]
    ldr r2, [r0, #0x5ac]
    sub r0, r3, #0x2000
    ldr r3, [r5, r2, lsl #0x2]
    ldr r2, _LIT7
    and r4, r0, #0x0
    and r0, r3, r2
    orr r3, r4, r0
    str r3, [sp, #0x4]
    ldrh r0, [r6, #0x2]
    bic r3, r3, #0x2000
    mov r2, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r0, r0, lsl #0x1f
    orr r0, r3, r0, lsr #0x12
    str r0, [sp, #0x4]
    str r2, [sp]
    ldrh r0, [r6, #0x2]
    mov r3, r2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0227ab74
    ldr r1, _LIT4
    add sp, sp, #0x8
    ldr r2, [r1, #0x5ac]
    mov r0, #0x7f
    add r2, r2, #0x1
    str r2, [r1, #0x5ac]
    ldmia sp!, {r4, r5, r6, pc}
.L_1bc:
    bl func_ov002_021e2b6c
.L_1c0:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x000012d2
_LIT1: .word 0x00001710
_LIT2: .word data_ov002_022be02c
_LIT3: .word data_ov002_022be034
_LIT4: .word data_ov002_022ce1a8
_LIT5: .word 0x00000868
_LIT6: .word data_ov002_022cf1a8
_LIT7: .word 0x00001fff
