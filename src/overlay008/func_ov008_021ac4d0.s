; func_ov008_021ac4d0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov008_021b2dc0
        .extern func_ov008_021ac35c
        .global func_ov008_021ac4d0
        .arm
func_ov008_021ac4d0:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    cmp r1, #0x0
    beq .L_1d4
    subs r5, r5, #0x1
    ldmmiia sp!, {r4, r5, r6, pc}
    ldr r4, _LIT0
.L_190:
    ldrh r0, [r4, #0x4]
    rsb r2, r5, #0x6
    mov r0, r0, lsl #0x18
    mov r3, r0, lsr #0x18
    mov r1, r3, lsr #0x1f
    rsb r0, r1, r3, lsl #0x1d
    add r0, r1, r0, ror #0x1d
    add r1, r0, r2
    cmp r1, #0x8
    add r0, r3, r2
    subge r1, r1, #0x8
    cmp r0, #0x1a
    bge .L_1c8
    bl func_ov008_021ac35c
.L_1c8:
    subs r5, r5, #0x1
    bpl .L_190
    ldmia sp!, {r4, r5, r6, pc}
.L_1d4:
    mov r4, #0x0
    cmp r5, #0x0
    ldmleia sp!, {r4, r5, r6, pc}
    ldr r6, _LIT0
.L_1e4:
    ldrh r0, [r6, #0x4]
    mov r0, r0, lsl #0x18
    mov r2, r0, lsr #0x18
    mov r1, r2, lsr #0x1f
    rsb r0, r1, r2, lsl #0x1d
    add r0, r1, r0, ror #0x1d
    sub r0, r0, #0x1
    adds r1, r0, r4
    addmi r1, r1, #0x8
    cmp r1, #0x8
    sub r0, r2, #0x1
    subge r1, r1, #0x8
    adds r0, r0, r4
    bmi .L_220
    bl func_ov008_021ac35c
.L_220:
    add r4, r4, #0x1
    cmp r4, r5
    blt .L_1e4
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov008_021b2dc0
