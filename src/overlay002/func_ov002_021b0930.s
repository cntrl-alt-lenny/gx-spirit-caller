; func_ov002_021b0930 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd73c
        .extern data_ov002_022cd744
        .extern data_ov002_022cd968
        .extern data_ov002_022d016c
        .extern func_ov002_021ae7a8
        .extern func_ov002_021b04c8
        .extern func_ov002_021b08a8
        .extern func_ov002_021b1254
        .extern func_ov002_021b141c
        .extern func_ov002_021e73a4
        .extern func_ov002_02269b90
        .extern func_ov002_0226a928
        .extern func_ov002_02279b84
        .extern func_ov002_0229cd54
        .global func_ov002_021b0930
        .arm
func_ov002_021b0930:
    stmdb sp!, {r4, lr}
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r0, [r0, #0x8]
    ldr r4, [r1, #0xcec]
    cmp r0, #0x3
    bne .L_ac
    bl func_ov002_0229cd54
    ldmia sp!, {r4, pc}
.L_ac:
    ldr r0, [r1, #0xd0c]
    cmp r0, #0x0
    beq .L_cc
    ldr r0, _LIT2
    ldr r0, [r0, #0x300]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    bne .L_dc
.L_cc:
    ldr r0, _LIT1
    ldr r0, [r0, #0xe0]
    cmp r0, #0x0
    beq .L_e4
.L_dc:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_e4:
    bl func_ov002_021ae7a8
    cmp r0, #0x0
    bne .L_f4
    bl func_ov002_021b1254
.L_f4:
    cmp r0, #0x0
    bne .L_100
    bl func_ov002_0226a928
.L_100:
    cmp r0, #0x0
    bne .L_10c
    bl func_ov002_02279b84
.L_10c:
    cmp r0, #0x0
    bne .L_118
    bl func_ov002_021b141c
.L_118:
    cmp r0, #0x0
    bne .L_124
    bl func_ov002_021e73a4
.L_124:
    cmp r0, #0x0
    moveq r2, #0x1
    movne r2, #0x0
    ldr r1, _LIT1
    cmp r0, #0x0
    str r2, [r1, #0xd14]
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    bl func_ov002_021b04c8
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, pc}
    ldr r0, _LIT3
    ldr r0, [r0, r4, lsl #0x2]
    cmp r0, #0x2
    bne .L_16c
    bl func_ov002_02269b90
    b .L_170
.L_16c:
    bl func_ov002_021b08a8
.L_170:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022cd73c
_LIT1: .word data_ov002_022d016c
_LIT2: .word data_ov002_022cd968
_LIT3: .word data_ov002_022cd744
