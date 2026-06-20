; func_ov002_022bdb88 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd090
        .extern func_020211c8
        .extern func_0202147c
        .extern func_02021650
        .extern func_02021660
        .extern func_020216b0
        .extern func_ov002_022bdd44
        .global func_ov002_022bdb88
        .arm
func_ov002_022bdb88:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr r4, _LIT0
    mov r7, r1
    ldr r9, [sp, #0x28]
    mov r8, r0
    mov fp, r2
    mov sl, r3
    add r4, r4, r7, lsl #0x3
    mov r6, #0x0
.L_24:
    ldr r0, [r8, r6, lsl #0x3]
    cmp r0, #0x0
    beq .L_3c
    add r6, r6, #0x1
    cmp r6, #0x10
    blt .L_24
.L_3c:
    cmp r6, #0x10
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, [r4]
    add r5, r8, r6, lsl #0x3
    bl func_020211c8
    stmia r5, {r0, r7}
    ldr r0, [r8, r6, lsl #0x3]
    bl func_0202147c
    ldr r0, [r8, r6, lsl #0x3]
    ldr r1, _LIT1
    mov r2, r5
    bl func_02021650
    mov r1, fp, lsr #0x10
    mov r0, fp, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    ldr r2, [r4, #0x4]
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    cmp r2, #0x0
    mov fp, r0, asr #0x10
    mov r8, r1, asr #0x10
    mov r6, #0x0
    ble .L_1ac
.L_a4:
    ldr r0, [r5]
    mov r1, #0x3
    mov r2, r6
    bl func_02021660
    mov r7, r0
    mov r1, #0xd
    mov r2, fp
    bl func_020216b0
    mov r0, r7
    mov r1, #0xf
    mov r2, r8
    bl func_020216b0
    cmp sl, #0x0
    mov r0, r7
    mov r1, #0x3
    bne .L_110
    mov r2, #0x0
    bl func_020216b0
    mov r0, r7
    mov r1, #0x4
    mov r2, #0x0
    bl func_020216b0
    mov r0, r7
    mov r1, #0x5
    mov r2, #0x0
    bl func_020216b0
    b .L_138
.L_110:
    ldr r2, [sl]
    bl func_020216b0
    ldr r2, [sl, #0x4]
    mov r0, r7
    mov r1, #0x4
    bl func_020216b0
    ldr r2, [sl, #0x8]
    mov r0, r7
    mov r1, #0x5
    bl func_020216b0
.L_138:
    cmp r9, #0x0
    mov r0, r7
    mov r1, #0x6
    bne .L_174
    mov r2, #0x0
    bl func_020216b0
    mov r0, r7
    mov r1, #0x7
    mov r2, #0x0
    bl func_020216b0
    mov r0, r7
    mov r1, #0x8
    mov r2, #0x0
    bl func_020216b0
    b .L_19c
.L_174:
    ldr r2, [r9]
    bl func_020216b0
    ldr r2, [r9, #0x4]
    mov r0, r7
    mov r1, #0x7
    bl func_020216b0
    ldr r2, [r9, #0x8]
    mov r0, r7
    mov r1, #0x8
    bl func_020216b0
.L_19c:
    add r6, r6, #0x1
    ldr r0, [r4, #0x4]
    cmp r6, r0
    blt .L_a4
.L_1ac:
    ldr r0, [r5]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cd090
_LIT1: .word func_ov002_022bdd44
