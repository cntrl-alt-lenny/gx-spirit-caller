; func_ov002_022a8198 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d19bc
        .extern func_ov002_021b0e44
        .extern func_ov002_022591b4
        .extern func_ov002_02259338
        .extern func_ov002_022a5fb8
        .global func_ov002_022a8198
        .arm
func_ov002_022a8198:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    ldr r2, _LIT0
    mov sl, r0
    ldrh r0, [r2]
    str r1, [sp]
    cmp r0, #0x0
    addeq sp, sp, #0x8
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r6, r1
    bl func_ov002_022591b4
    cmp r0, #0x2
    cmpne r0, #0x3
    addeq sp, sp, #0x8
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    bl func_ov002_021b0e44
    mov r7, r0
    mov r0, #0x0
    str r0, [sp, #0x4]
.L_4c:
    ldr r0, [sp]
    cmp r0, #0x0
    beq .L_cc
    mov r9, #0x0
    add r0, sl, r7, lsl #0x2
    str r9, [r0, #0x588]
    add r4, r0, #0x188
    mov fp, r9
    mov r5, #0x1
    mov r8, r9
.L_74:
    cmp r9, #0xb
    beq .L_c0
    mov r0, r7
    mov r1, r9
    mov r2, r8
    bl func_ov002_02259338
    bics r0, r0, #0x2
    beq .L_c0
    ldr r0, [r4, #0x400]
    cmp r6, #0x0
    orr r0, r0, r5, lsl r9
    str r0, [r4, #0x400]
    beq .L_bc
    mov r0, sl
    mov r1, r7
    mov r2, r9
    mov r3, fp
    bl func_ov002_022a5fb8
.L_bc:
    mov r6, #0x0
.L_c0:
    add r9, r9, #0x1
    cmp r9, #0xf
    blt .L_74
.L_cc:
    mov r0, #0xcc
    mla r8, r7, r0, sl
    add r2, sl, r7, lsl #0x2
    ldr r1, [r2, #0x588]
    mov r0, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [r2, #0x588]
    ldr r0, [r8, #0x484]
    cmp r0, #0x8
    movge r0, #0x8
    subs r9, r0, #0x1
    bmi .L_15c
    add r0, sl, r7, lsl #0x2
    add r4, r0, #0x188
    mov fp, #0x1
.L_108:
    ldr r5, [r8, #0x488]
    mov r0, r7
    mov r1, #0xb
    add r2, r9, r5
    bl func_ov002_02259338
    cmp r0, #0x0
    beq .L_154
    ldr r1, [r4, #0x400]
    cmp r6, #0x0
    add r0, r9, #0x10
    orr r0, r1, fp, lsl r0
    str r0, [r4, #0x400]
    beq .L_150
    mov r0, sl
    mov r1, r7
    add r3, r9, r5
    mov r2, #0xb
    bl func_ov002_022a5fb8
.L_150:
    mov r6, #0x0
.L_154:
    subs r9, r9, #0x1
    bpl .L_108
.L_15c:
    ldr r0, [sp, #0x4]
    eor r7, r7, #0x1
    add r0, r0, #0x1
    str r0, [sp, #0x4]
    cmp r0, #0x2
    blt .L_4c
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022d19bc
