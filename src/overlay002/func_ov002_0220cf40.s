; func_ov002_0220cf40 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd3f4
        .extern data_ov002_022cf17c
        .extern func_ov002_021bbf50
        .extern func_ov002_022577dc
        .global func_ov002_0220cf40
        .arm
func_ov002_0220cf40:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldrh r2, [r4, #0x2]
    mov r0, r2, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x12
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x14]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT0
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r2, [r1]
    rsb r1, r0, #0x1
    cmp r2, r1
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT1
    and r2, r0, #0x1
    mul r3, r2, r1
    ldr r1, _LIT2
    ldr r1, [r1, r3]
    cmp r1, #0x2
    movcc r0, #0x0
    ldmccia sp!, {r3, r4, r5, pc}
    bl func_ov002_021bbf50
    cmp r0, #0x0
    beq .L_a4
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bbf50
    mov r5, r0
    mov r0, r4
    bl func_ov002_022577dc
    cmp r5, r0
    moveq r0, #0x2
    ldmeqia sp!, {r3, r4, r5, pc}
.L_a4:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022cd3f4
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf17c
