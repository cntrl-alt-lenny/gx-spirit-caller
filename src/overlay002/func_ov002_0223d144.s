; func_ov002_0223d144 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf17c
        .extern data_ov002_022cf184
        .extern func_ov002_021b4098
        .extern func_ov002_021bc618
        .global func_ov002_0223d144
        .arm
func_ov002_0223d144:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r1, [r4, #0x2]
    mov r0, r1, lsl #0x12
    movs r0, r0, lsr #0x1e
    bne .L_a8c
    mov r0, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc618
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r2, [r4, #0x2]
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    and r2, r2, #0x1
    mul r3, r2, r0
    ldr r0, [r1, r3]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, _LIT2
    ldr r0, [r0, r3]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, pc}
.L_a8c:
    ldrh r2, [r4]
    mov r0, r1, lsl #0x1f
    mov r1, r1, lsl #0x1a
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021b4098
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf184
_LIT2: .word data_ov002_022cf17c
