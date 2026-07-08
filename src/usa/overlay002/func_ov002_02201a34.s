; func_ov002_02201a34 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d0170
        .extern func_0202b824
        .extern func_0202e1e0
        .global func_ov002_02201a34
        .arm
func_ov002_02201a34:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    mov r1, r0, lsl #0x14
    mov r1, r1, lsr #0x1a
    cmp r1, #0x1b
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r1, [r4, #0x14]
    mov r2, r0, lsl #0x1f
    mov r0, r1, lsl #0xd
    mov r0, r0, lsr #0x1f
    cmp r0, r2, lsr #0x1f
    beq .L_150
    mov r0, r1, lsl #0x16
    mov r0, r0, lsr #0x1f
    cmp r0, r2, lsr #0x1f
    bne .L_150
    mov r2, r1, lsl #0x17
    ldr r0, _LIT0
    mov r2, r2, lsr #0x15
    ldrh r0, [r0, r2]
    ldrh ip, [r4]
    ldr r3, _LIT1
    mov r0, r0, lsl #0x13
    cmp ip, r3
    mov r0, r0, lsr #0x13
    beq .L_8c
    add r2, r3, #0x1
    cmp ip, r2
    beq .L_d0
    add r2, r3, #0xf
    cmp ip, r2
    beq .L_114
    b .L_150
.L_8c:
    mov r1, r1, lsl #0x12
    mov r1, r1, lsr #0x1c
    cmp r1, #0x5
    bcc .L_c8
    bl func_0202b824
    cmp r0, #0x17
    beq .L_c8
    ldr r0, [r4, #0x14]
    mov r1, r0, lsl #0x8
    movs r1, r1, lsr #0x1f
    moveq r0, r0, lsl #0x9
    moveq r0, r0, lsr #0x1c
    cmpeq r0, #0xe
    moveq r0, #0x1
    ldmeqia sp!, {r4, pc}
.L_c8:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_d0:
    mov r1, r1, lsl #0x12
    mov r1, r1, lsr #0x1c
    cmp r1, #0x5
    bcc .L_10c
    bl func_0202b824
    cmp r0, #0x17
    bne .L_10c
    ldr r0, [r4, #0x14]
    mov r1, r0, lsl #0x8
    movs r1, r1, lsr #0x1f
    moveq r0, r0, lsl #0x9
    moveq r0, r0, lsr #0x1c
    cmpeq r0, #0xe
    moveq r0, #0x1
    ldmeqia sp!, {r4, pc}
.L_10c:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_114:
    mov r1, r1, lsl #0x12
    mov r1, r1, lsr #0x1c
    cmp r1, #0x5
    bcs .L_148
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_148
    ldr r0, [r4, #0x14]
    mov r0, r0, lsl #0x9
    mov r0, r0, lsr #0x1c
    cmp r0, #0xb
    moveq r0, #0x1
    ldmeqia sp!, {r4, pc}
.L_148:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_150:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022d0170
_LIT1: .word 0x0000134c
