; func_ov002_02206780 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021bc6e8
        .extern func_ov002_021ca2b8
        .extern func_ov002_021ca2c8
        .extern func_ov002_021ca2d0
        .global func_ov002_02206780
        .arm
func_ov002_02206780:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc6e8
    cmp r0, #0x0
    movlt r0, #0x0
    ldmltia sp!, {r4, r5, r6, pc}
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca2b8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r2, [r6]
    ldr r1, _LIT0
    cmp r2, r1
    bgt .L_80
    bge .L_ac
    ldr r0, _LIT1
    cmp r2, r0
    bgt .L_6c
    moveq r4, #0x14
    moveq r5, #0x5
    b .L_b4
.L_6c:
    add r0, r0, #0x1c4
    cmp r2, r0
    moveq r4, #0xe
    moveq r5, #0x3
    b .L_b4
.L_80:
    add r0, r1, #0xda
    cmp r2, r0
    bgt .L_98
    moveq r4, #0x7
    moveq r5, #0x5
    b .L_b4
.L_98:
    ldr r0, _LIT2
    cmp r2, r0
    moveq r4, #0x7
    moveq r5, #0x5
    b .L_b4
.L_ac:
    mov r4, #0x2
    mov r5, r4
.L_b4:
    ldrh r0, [r6, #0x2]
    mov r1, r4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca2c8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r0, [r6, #0x2]
    mov r1, r5
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca2d0
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x0000172f
_LIT1: .word 0x00001472
_LIT2: .word 0x00001aca
