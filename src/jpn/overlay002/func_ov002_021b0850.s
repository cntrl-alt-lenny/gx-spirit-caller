; func_ov002_021b0850 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd65c
        .extern data_ov002_022cd664
        .extern data_ov002_022cd888
        .extern data_ov002_022d008c
        .extern func_ov002_021ae6c8
        .extern func_ov002_021b03e8
        .extern func_ov002_021b07c8
        .extern func_ov002_021b1174
        .extern func_ov002_021b133c
        .extern func_ov002_021e72b4
        .extern func_ov002_02269aa0
        .extern func_ov002_0226a838
        .extern func_ov002_02279a94
        .extern func_ov002_0229cc44
        .global func_ov002_021b0850
        .arm
func_ov002_021b0850:
    stmdb sp!, {r4, lr}
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r0, [r0, #0x8]
    ldr r4, [r1, #0xcec]
    cmp r0, #0x3
    bne .L_24
    bl func_ov002_0229cc44
    ldmia sp!, {r4, pc}
.L_24:
    ldr r0, [r1, #0xd0c]
    cmp r0, #0x0
    beq .L_44
    ldr r0, _LIT2
    ldr r0, [r0, #0x300]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    bne .L_54
.L_44:
    ldr r0, _LIT1
    ldr r0, [r0, #0xe0]
    cmp r0, #0x0
    beq .L_5c
.L_54:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_5c:
    bl func_ov002_021ae6c8
    cmp r0, #0x0
    bne .L_6c
    bl func_ov002_021b1174
.L_6c:
    cmp r0, #0x0
    bne .L_78
    bl func_ov002_0226a838
.L_78:
    cmp r0, #0x0
    bne .L_84
    bl func_ov002_02279a94
.L_84:
    cmp r0, #0x0
    bne .L_90
    bl func_ov002_021b133c
.L_90:
    cmp r0, #0x0
    bne .L_9c
    bl func_ov002_021e72b4
.L_9c:
    cmp r0, #0x0
    moveq r2, #0x1
    movne r2, #0x0
    ldr r1, _LIT1
    cmp r0, #0x0
    str r2, [r1, #0xd14]
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    bl func_ov002_021b03e8
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, pc}
    ldr r0, _LIT3
    ldr r0, [r0, r4, lsl #0x2]
    cmp r0, #0x2
    bne .L_e4
    bl func_ov002_02269aa0
    b .L_e8
.L_e4:
    bl func_ov002_021b07c8
.L_e8:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022cd65c
_LIT1: .word data_ov002_022d008c
_LIT2: .word data_ov002_022cd888
_LIT3: .word data_ov002_022cd664
