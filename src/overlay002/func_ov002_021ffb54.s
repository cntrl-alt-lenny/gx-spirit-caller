; func_ov002_021ffb54 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf288
        .extern func_ov002_021ca2b8
        .extern func_ov002_021ca3f0
        .extern func_ov002_021ff2b8
        .global func_ov002_021ffb54
        .arm
func_ov002_021ffb54:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldrh r1, [r6]
    ldr r0, _LIT0
    mov r4, #0x0
    cmp r1, r0
    beq .L_30
    ldr r0, _LIT1
    cmp r1, r0
    addeq r5, r0, #0x20
    moveq r4, #0x2
    b .L_38
.L_30:
    ldr r5, _LIT2
    mov r4, #0x4
.L_38:
    ldrh r0, [r6, #0x2]
    mov r1, r0, lsl #0x14
    mov r1, r1, lsr #0x1a
    cmp r1, #0x23
    beq .L_78
    mov r0, r0, lsl #0x1f
    mov r1, r0, lsr #0x1f
    ldr r0, _LIT3
    and r1, r1, #0x1
    mul r2, r1, r0
    ldr r0, _LIT4
    ldr r0, [r0, r2]
    mov r0, r0, lsr #0x10
    tst r0, #0x1
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
.L_78:
    ldrh r1, [r6, #0x2]
    mov r0, r6
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_021ff2b8
    cmp r0, r4
    movlt r0, #0x0
    ldmltia sp!, {r4, r5, r6, pc}
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca2b8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r0, [r6, #0x2]
    mov r1, r5
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca3f0
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x000012d2
_LIT1: .word 0x00001710
_LIT2: .word 0x000014f9
_LIT3: .word 0x00000868
_LIT4: .word data_ov002_022cf288
