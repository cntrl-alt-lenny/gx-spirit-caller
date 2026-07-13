; func_ov019_021b42a8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020191dc
        .global func_ov019_021b42a8
        .arm
func_ov019_021b42a8:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r5, r1
    mov r7, r0
    mov r0, r5
    mov r6, r2
    bl func_020191dc
    mov r4, r0
    cmp r5, #0x3a
    bgt .L_34
    bge .L_4c
    cmp r5, #0x34
    beq .L_4c
    b .L_54
.L_34:
    cmp r5, #0x40
    bgt .L_44
    beq .L_4c
    b .L_54
.L_44:
    cmp r5, #0x5f
    bne .L_54
.L_4c:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_54:
    cmp r4, #0x43
    addls pc, pc, r4, lsl #0x2
    b .L_1b0
    b .L_1b0
    b .L_1a8
    b .L_170
    b .L_170
    b .L_1a8
    b .L_170
    b .L_1a8
    b .L_170
    b .L_1a8
    b .L_1a8
    b .L_1b0
    b .L_1b0
    b .L_1a8
    b .L_1a8
    b .L_1a8
    b .L_1a8
    b .L_1b0
    b .L_1a8
    b .L_1b0
    b .L_1a8
    b .L_1b0
    b .L_1b0
    b .L_1b0
    b .L_1b0
    b .L_1b0
    b .L_1a8
    b .L_1b0
    b .L_1a8
    b .L_1a8
    b .L_1b0
    b .L_1b0
    b .L_1b0
    b .L_1b0
    b .L_1b0
    b .L_1b0
    b .L_1b0
    b .L_1b0
    b .L_1a8
    b .L_1a8
    b .L_1b0
    b .L_1b0
    b .L_1a8
    b .L_1b0
    b .L_1b0
    b .L_1b0
    b .L_170
    b .L_1b0
    b .L_1b0
    b .L_1a8
    b .L_1a8
    b .L_1b0
    b .L_1b0
    b .L_1b0
    b .L_1a8
    b .L_1a8
    b .L_1a8
    b .L_1a8
    b .L_1a8
    b .L_1b0
    b .L_170
    b .L_1a8
    b .L_1a8
    b .L_1a8
    b .L_1a8
    b .L_1a8
    b .L_1a8
    b .L_1a8
    b .L_170
.L_170:
    cmp r6, #0x0
    mov r5, #0x0
    ble .L_1a0
.L_17c:
    ldrh r0, [r7, #0x14]
    bl func_020191dc
    cmp r4, r0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    add r5, r5, #0x1
    cmp r5, r6
    add r7, r7, #0xc
    blt .L_17c
.L_1a0:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_1a8:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_1b0:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
