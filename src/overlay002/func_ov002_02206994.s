; func_ov002_02206994 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021c2f24
        .extern func_ov002_021c3ae4
        .extern func_ov002_021ff3bc
        .global func_ov002_02206994
        .arm
func_ov002_02206994:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov002_021ff3bc
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    mov r1, r0, lsl #0x14
    mov r1, r1, lsr #0x1a
    cmp r1, #0x23
    beq .L_c8
    mov r0, r0, lsl #0x1f
    ldr r1, _LIT0
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c2f24
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c2f24
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c2f24
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT3
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c2f24
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c2f24
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
.L_c8:
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT5
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c3ae4
    cmp r0, #0x0
    moveq r0, #0x0
    movne r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00000fb7
_LIT1: .word 0x00000fb8
_LIT2: .word 0x00000fb9
_LIT3: .word 0x00000fba
_LIT4: .word 0x00000fbb
_LIT5: .word 0x00001645
