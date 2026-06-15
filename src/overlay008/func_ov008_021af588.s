; func_ov008_021af588 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov008_021b2790
        .extern func_0202b6b4
        .extern func_0202b6e4
        .extern func_0202bb20
        .global func_ov008_021af588
        .arm
func_ov008_021af588:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xf4
    mov r3, #0x34
    mul r3, r0, r3
    ldr r0, _LIT0
    mov r9, r1
    mov r4, r2
    ldrh r0, [r0, r3]
    add r1, sp, #0x4
    mov r2, #0x3c
    mov r5, #0x0
    bl func_0202b6e4
    and r0, r4, #0x2
    str r0, [sp]
    and r6, r4, #0x10
    and fp, r4, #0x4
    and sl, r4, #0x8
    and r7, r4, #0x1
    mov r8, r5
    add r4, sp, #0x4
.L_50:
    ldr r0, [r4, r8, lsl #0x2]
    cmp r0, #0x0
    beq .L_17c
    bl func_0202b6b4
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b .L_138
    b .L_138
    b .L_fc
    b .L_fc
    b .L_c0
    b .L_80
.L_80:
    ldr r0, [sp]
    cmp r0, #0x0
    beq .L_170
    cmp r6, #0x0
    ldr r0, [r4, r8, lsl #0x2]
    beq .L_b4
    bl func_0202bb20
    cmp r0, #0x0
    bne .L_170
    ldr r0, [r4, r8, lsl #0x2]
    str r0, [r9, r5, lsl #0x2]
    add r5, r5, #0x1
    b .L_170
.L_b4:
    str r0, [r9, r5, lsl #0x2]
    add r5, r5, #0x1
    b .L_170
.L_c0:
    cmp fp, #0x0
    beq .L_170
    cmp r6, #0x0
    ldr r0, [r4, r8, lsl #0x2]
    beq .L_f0
    bl func_0202bb20
    cmp r0, #0x0
    bne .L_170
    ldr r0, [r4, r8, lsl #0x2]
    str r0, [r9, r5, lsl #0x2]
    add r5, r5, #0x1
    b .L_170
.L_f0:
    str r0, [r9, r5, lsl #0x2]
    add r5, r5, #0x1
    b .L_170
.L_fc:
    cmp sl, #0x0
    beq .L_170
    cmp r6, #0x0
    ldr r0, [r4, r8, lsl #0x2]
    beq .L_12c
    bl func_0202bb20
    cmp r0, #0x0
    bne .L_170
    ldr r0, [r4, r8, lsl #0x2]
    str r0, [r9, r5, lsl #0x2]
    add r5, r5, #0x1
    b .L_170
.L_12c:
    str r0, [r9, r5, lsl #0x2]
    add r5, r5, #0x1
    b .L_170
.L_138:
    cmp r7, #0x0
    beq .L_170
    cmp r6, #0x0
    ldr r0, [r4, r8, lsl #0x2]
    beq .L_168
    bl func_0202bb20
    cmp r0, #0x0
    bne .L_170
    ldr r0, [r4, r8, lsl #0x2]
    str r0, [r9, r5, lsl #0x2]
    add r5, r5, #0x1
    b .L_170
.L_168:
    str r0, [r9, r5, lsl #0x2]
    add r5, r5, #0x1
.L_170:
    add r8, r8, #0x1
    cmp r8, #0x3c
    blt .L_50
.L_17c:
    mov r1, #0x0
    mov r0, r5
    str r1, [r9, r5, lsl #0x2]
    add sp, sp, #0xf4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov008_021b2790
