; func_ov002_0220919c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021bbf50
        .extern func_ov002_021bc618
        .extern func_ov002_021c23ac
        .extern func_ov002_021ca2b8
        .extern func_ov002_021ca3f0
        .global func_ov002_0220919c
        .arm
func_ov002_0220919c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    mov r1, r0, lsl #0x1a
    mov r2, r0, lsl #0x1f
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021c23ac
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca2b8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca3f0
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021bbf50
    cmp r0, #0x0
    beq .L_c0
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021bbf50
    ldrh r1, [r4, #0x2]
    mov r4, r0
    mov r0, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc618
    add r0, r0, #0x1
    cmp r4, r0
    movle r0, #0x1
    movgt r0, #0x0
    ldmia sp!, {r4, pc}
.L_c0:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00001815
