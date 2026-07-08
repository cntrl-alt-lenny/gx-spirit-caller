; func_ov002_02224924 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf098
        .extern data_ov002_022d0d8c
        .extern func_ov002_021ae320
        .extern func_ov002_021c3afc
        .extern func_ov002_021c9310
        .extern func_ov002_021d70f0
        .extern func_ov002_021e26d0
        .extern func_ov002_021e277c
        .extern func_ov002_0226aea4
        .global func_ov002_02224924
        .arm
func_ov002_02224924:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x5a8]
    cmp r0, #0x7f
    bgt .L_44
    bge .L_ac
    cmp r0, #0x64
    bgt .L_164
    cmp r0, #0x62
    blt .L_164
    beq .L_144
    cmp r0, #0x63
    beq .L_128
    cmp r0, #0x64
    beq .L_108
    b .L_164
.L_44:
    cmp r0, #0x80
    bne .L_164
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT1
    ldr r2, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    and r3, r0, #0x1
    mul r1, r3, r1
    ldr r1, [r2, r1]
    cmp r1, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_ov002_021c3afc
    cmp r0, #0x0
    moveq r0, #0x64
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r2, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0226aea4
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, pc}
.L_ac:
    ldr r0, _LIT3
    ldrh r2, [r4, #0x2]
    ldrh r5, [r0, #0xb0]
    mov r1, #0xb
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r2, r5
    rsb r0, r0, #0x1
    bl func_ov002_021c9310
    ldrh r2, [r4, #0x2]
    ldr r3, [r0]
    mov r1, r5
    mov r0, r2, lsl #0x1f
    mov r2, r3, lsl #0x12
    mov r0, r0, lsr #0x1f
    mov r4, r2, lsr #0x1f
    rsb r0, r0, #0x1
    mov r2, #0x1
    bl func_ov002_021d70f0
    mov r0, r4
    bl func_ov002_021e277c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_108:
    ldrh r0, [r4, #0x2]
    mov r1, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021e26d0
    mov r0, #0x63
    ldmia sp!, {r3, r4, r5, pc}
.L_128:
    ldrh r0, [r4, #0x2]
    mov r1, #0x11
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
    mov r0, #0x62
    ldmia sp!, {r3, r4, r5, pc}
.L_144:
    ldrh r0, [r4, #0x2]
    mov r1, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021e26d0
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_164:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf098
_LIT3: .word data_ov002_022d0d8c
