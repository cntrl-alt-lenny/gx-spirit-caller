; func_ov002_0228c754 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021afff0
        .global func_ov002_0228c754
        .arm
func_ov002_0228c754:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x2c
    mov sl, r0
    mov r7, #0x0
    mov r9, r2
    mov r3, r7
    mov r4, sl, lsl #0x4
    add r0, sp, #0x0
    mov r2, #0x1
.L_24:
    tst r1, r2, lsl r4
    strne r3, [r0, r7, lsl #0x2]
    add r3, r3, #0x1
    addne r7, r7, #0x1
    cmp r3, #0xa
    add r4, r4, #0x1
    ble .L_24
    sub r5, r7, #0x1
    cmp r5, #0x0
    ble .L_74
    add r4, sp, #0x0
.L_50:
    add r0, r5, #0x1
    bl func_ov002_021afff0
    ldr r2, [r4, r5, lsl #0x2]
    ldr r1, [r4, r0, lsl #0x2]
    str r1, [r4, r5, lsl #0x2]
    sub r5, r5, #0x1
    str r2, [r4, r0, lsl #0x2]
    cmp r5, #0x0
    bgt .L_50
.L_74:
    mov r5, #0x0
    mov r8, r5
    cmp r7, #0x0
    mvn r4, #0x0
    ble .L_b4
    add fp, sp, #0x0
.L_8c:
    ldr r6, [fp, r8, lsl #0x2]
    mov r0, sl
    mov r1, r6
    blx r9
    cmp r0, r5
    add r8, r8, #0x1
    movgt r5, r0
    movgt r4, r6
    cmp r8, r7
    blt .L_8c
.L_b4:
    mov r0, r4
    add sp, sp, #0x2c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
