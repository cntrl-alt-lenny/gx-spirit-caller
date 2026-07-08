; func_ov002_0228c474 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021afff0
        .extern func_ov002_0227afa0
        .global func_ov002_0228c474
        .arm
func_ov002_0228c474:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x5c
    mov fp, r0
    mvn r7, #0x0
    mov sl, r2
    mov r5, #0x0
    mov r9, r3
    str r7, [sp]
    mov r3, r5
    mov r4, fp, lsl #0x4
    add r0, sp, #0x30
    mov r2, #0x1
.L_30:
    tst r1, r2, lsl r4
    strne r3, [r0, r5, lsl #0x2]
    add r3, r3, #0x1
    addne r5, r5, #0x1
    cmp r3, #0x4
    add r4, r4, #0x1
    ble .L_30
    sub r6, r5, #0x1
    cmp r6, #0x0
    ble .L_80
    add r4, sp, #0x30
.L_5c:
    add r0, r6, #0x1
    bl func_ov002_021afff0
    ldr r2, [r4, r6, lsl #0x2]
    ldr r1, [r4, r0, lsl #0x2]
    str r1, [r4, r6, lsl #0x2]
    sub r6, r6, #0x1
    str r2, [r4, r0, lsl #0x2]
    cmp r6, #0x0
    bgt .L_5c
.L_80:
    cmp r5, #0x0
    mov r6, #0x0
    ble .L_170
.L_8c:
    add r0, sp, #0x30
    ldr r4, [r0, r6, lsl #0x2]
    mov r0, fp
    mov r1, r4
    add r2, sp, #0x4
    mov r8, #0x0
    bl func_ov002_0227afa0
    cmp sl, #0x0
    cmpne r9, #0x0
    beq .L_c8
    ldr r0, [sp, #0x1c]
    ldr r8, [sp, #0x18]
    cmp r8, r0
    movle r8, r0
    b .L_dc
.L_c8:
    cmp sl, #0x0
    ldrne r8, [sp, #0x18]
    bne .L_dc
    cmp r9, #0x0
    ldrne r8, [sp, #0x1c]
.L_dc:
    cmp r7, #0x0
    strlt r4, [sp]
    movlt r7, r8
    blt .L_164
    mov r0, #0x0
    cmp sl, #0x0
    cmpgt r8, r7
    movgt r0, #0x1
    cmp sl, #0x0
    cmplt r8, r7
    movlt r0, #0x1
    cmp r9, #0x0
    cmpgt r8, r7
    movgt r0, #0x1
    cmp r9, #0x0
    cmplt r8, r7
    movlt r0, #0x1
    cmp r0, #0x0
    beq .L_164
    cmp sl, #0x0
    cmpgt r8, r7
    movgt r7, r8
    cmp sl, #0x0
    cmplt r8, r7
    movlt r7, r8
    cmp r9, #0x0
    cmpgt r8, r7
    movgt r7, r8
    str r4, [sp]
    cmp r9, #0x0
    bge .L_164
    cmp r8, r7
    movge r8, r7
    mov r7, r8
.L_164:
    add r6, r6, #0x1
    cmp r6, r5
    blt .L_8c
.L_170:
    ldr r0, [sp]
    add sp, sp, #0x5c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
