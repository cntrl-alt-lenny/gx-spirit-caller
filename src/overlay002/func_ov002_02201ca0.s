; func_ov002_02201ca0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202b878
        .extern func_0202b8c0
        .global func_ov002_02201ca0
        .arm
func_ov002_02201ca0:
    stmdb sp!, {r4, lr}
    movs r4, r1
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r1, [r4, #0x2]
    mov r1, r1, lsl #0x12
    movs r1, r1, lsr #0x1e
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldrh r2, [r0]
    ldr r1, _LIT0
    cmp r2, r1
    beq .L_50
    add r0, r1, #0x1
    cmp r2, r0
    beq .L_7c
    add r0, r1, #0x2
    cmp r2, r0
    beq .L_a8
    b .L_d4
.L_50:
    ldrh r0, [r4]
    bl func_0202b878
    cmp r0, #0x16
    bne .L_74
    ldrh r0, [r4]
    bl func_0202b8c0
    cmp r0, #0x2
    moveq r0, #0x1
    ldmeqia sp!, {r4, pc}
.L_74:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_7c:
    ldrh r0, [r4]
    bl func_0202b878
    cmp r0, #0x16
    bne .L_a0
    ldrh r0, [r4]
    bl func_0202b8c0
    cmp r0, #0x4
    moveq r0, #0x1
    ldmeqia sp!, {r4, pc}
.L_a0:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_a8:
    ldrh r0, [r4]
    bl func_0202b878
    cmp r0, #0x17
    bne .L_cc
    ldrh r0, [r4]
    bl func_0202b8c0
    cmp r0, #0x4
    moveq r0, #0x1
    ldmeqia sp!, {r4, pc}
.L_cc:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_d4:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word 0x0000134f
