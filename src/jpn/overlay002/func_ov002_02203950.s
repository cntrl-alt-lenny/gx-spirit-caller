; func_ov002_02203950 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021b3dec
        .extern func_ov002_021bbe70
        .extern func_ov002_021ca5b8
        .extern func_ov002_021ff230
        .extern func_ov002_02253600
        .global func_ov002_02203950
        .arm
func_ov002_02203950:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldrh r0, [r5, #0x2]
    mov r4, r1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r1, r0
    bl func_ov002_021ca5b8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r5
    mov r1, r4
    bl func_ov002_021ff230
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r0, [r5, #0x2]
    ldr r2, _LIT0
    mov r1, #0xb
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021b3dec
    cmp r0, #0x0
    ldrh r0, [r5, #0x2]
    beq .L_84
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bbe70
    cmp r0, #0x1
    movgt r0, #0x1
    movle r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_84:
    ldrh r1, [r5]
    mov r0, r0, lsl #0x1f
    mov r2, #0x0
    mov r0, r0, lsr #0x1f
    bl func_ov002_02253600
    cmp r0, #0x0
    movgt r0, #0x1
    movle r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x000014a0
