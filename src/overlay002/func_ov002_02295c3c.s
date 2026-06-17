; func_ov002_02295c3c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_022575c8
        .extern func_ov002_02259f74
        .extern func_ov002_0228de04
        .extern func_ov002_02291248
        .global func_ov002_02295c3c
        .arm
func_ov002_02295c3c:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    bl func_ov002_02291248
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldrh r0, [r7, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_02259f74
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    mov r5, #0x0
    mov r4, r5
.L_3c:
    mov r6, r4
.L_40:
    mov r0, r7
    mov r1, r5
    mov r2, r6
    bl func_ov002_022575c8
    cmp r0, #0x0
    beq .L_70
    mov r0, r5
    mov r1, r6
    bl func_ov002_0228de04
    cmp r0, #0x1f4
    movge r0, #0x1
    ldmgeia sp!, {r3, r4, r5, r6, r7, pc}
.L_70:
    add r6, r6, #0x1
    cmp r6, #0x5
    blt .L_40
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_3c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
