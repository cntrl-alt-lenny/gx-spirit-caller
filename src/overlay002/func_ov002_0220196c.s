; func_ov002_0220196c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202b878
        .extern func_ov002_021b8ecc
        .extern func_ov002_021c1ef0
        .extern func_ov002_022018cc
        .global func_ov002_0220196c
        .arm
func_ov002_0220196c:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    movs r4, r1
    mov r5, r0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x12
    movs r0, r0, lsr #0x1e
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    mov r0, r4
    bl func_ov002_021b8ecc
    cmp r0, #0x0
    beq .L_cc
    ldrh r1, [r4, #0x2]
    ldrh r2, [r5, #0x2]
    mov r0, r1, lsl #0x11
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    mov r1, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r2, r2, #0x1
    eor r0, r0, r1, lsr #0x1f
    cmp r2, r0
    bne .L_cc
    ldrh r0, [r4]
    bl func_0202b878
    cmp r0, #0x16
    bne .L_cc
    mov r7, #0x0
    mov r6, r7
.L_7c:
    mov r8, r6
.L_80:
    mov r0, r5
    mov r1, r7
    mov r2, r8
    bl func_ov002_021c1ef0
    cmp r0, #0x0
    beq .L_b4
    mov r0, r4
    mov r1, r7
    mov r2, r8
    bl func_ov002_022018cc
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
.L_b4:
    add r8, r8, #0x1
    cmp r8, #0x5
    blt .L_80
    add r7, r7, #0x1
    cmp r7, #0x2
    blt .L_7c
.L_cc:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
