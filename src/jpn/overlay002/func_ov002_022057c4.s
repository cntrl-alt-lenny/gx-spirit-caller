; func_ov002_022057c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf098
        .extern func_0202b86c
        .extern func_0202e1e0
        .extern func_ov002_021b6520
        .global func_ov002_022057c4
        .arm
func_ov002_022057c4:
    stmdb sp!, {r3, r4, r5, lr}
    movs r4, r1
    mov r5, r0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r0, [r4]
    bl func_0202e1e0
    cmp r0, #0x0
    bne .L_4c
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x12
    movs r0, r0, lsr #0x1e
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldrh r0, [r4]
    bl func_0202b86c
    cmp r0, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
.L_4c:
    ldrh r1, [r5]
    ldr r0, _LIT0
    cmp r1, r0
    bne .L_8c
    ldrh r2, [r5, #0x2]
    ldr r0, _LIT1
    ldr r1, _LIT2
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    rsb r2, r2, #0x1
    and r2, r2, #0x1
    mul r0, r2, r0
    ldr r0, [r1, r0]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
.L_8c:
    ldrh r1, [r4, #0x2]
    ldrh r0, [r5, #0x2]
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    mov r0, r0, lsl #0x1f
    cmp r1, r0, lsr #0x1f
    mov r0, r4
    bne .L_c4
    bl func_ov002_021b6520
    and r0, r0, #0x1
    cmp r0, #0x0
    movgt r0, #0x1
    movle r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_c4:
    bl func_ov002_021b6520
    and r0, r0, #0x2
    cmp r0, #0x0
    movgt r0, #0x1
    movle r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x000015ab
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf098
