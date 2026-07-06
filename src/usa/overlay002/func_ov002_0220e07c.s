; func_ov002_0220e07c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0a4
        .extern func_0202b86c
        .extern func_0202e1e0
        .extern func_ov002_021b6520
        .global func_ov002_0220e07c
        .arm
func_ov002_0220e07c:
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
    beq .L_6c
    add r0, r0, #0x1
    cmp r1, r0
    beq .L_94
    b .L_c0
.L_6c:
    ldr r0, _LIT1
    ldr r1, [r0, #0x10]
    cmp r1, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r0, #0x878]
    cmp r0, #0x0
    bne .L_c0
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_94:
    ldrh r2, [r5, #0x2]
    ldr r0, _LIT2
    ldr r1, _LIT3
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    and r2, r2, #0x1
    mul r0, r2, r0
    ldr r0, [r1, r0]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
.L_c0:
    mov r0, r4
    bl func_ov002_021b6520
    cmp r0, #0x0
    movgt r0, #0x1
    movle r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00001b23
_LIT1: .word data_ov002_022cf08c
_LIT2: .word 0x00000868
_LIT3: .word data_ov002_022cf0a4
