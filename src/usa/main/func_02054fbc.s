; func_02054fbc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0206e534
        .global func_02054fbc
        .arm
func_02054fbc:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    movs r6, r1
    mov r1, #0x0
    strh r1, [sp, #0x4]
    str r0, [sp]
    ldrnesh r0, [sp, #0x4]
    mov r5, r2
    mov r2, #0x0
    orrne r0, r0, #0x1
    strneh r0, [sp, #0x4]
    cmp r5, #0x0
    ldrnesh r0, [sp, #0x4]
    mov r4, r3
    mov r3, r2
    orrne r0, r0, #0x8
    strneh r0, [sp, #0x4]
    add r0, sp, #0x0
    mov r1, #0x1
    strh r2, [sp, #0x6]
    bl func_0206e534
    cmp r0, #0x0
    addlt sp, sp, #0x8
    mvnlt r0, #0x0
    ldmltia sp!, {r4, r5, r6, pc}
    cmp r6, #0x0
    beq .L_90
    cmp r0, #0x0
    ble .L_88
    ldrsh r1, [sp, #0x6]
    ands r1, r1, #0x41
    movne r1, #0x1
    strne r1, [r6]
    bne .L_90
.L_88:
    mov r1, #0x0
    str r1, [r6]
.L_90:
    cmp r5, #0x0
    beq .L_bc
    cmp r0, #0x0
    ble .L_b4
    ldrsh r1, [sp, #0x6]
    ands r1, r1, #0x8
    movne r1, #0x1
    strne r1, [r5]
    bne .L_bc
.L_b4:
    mov r1, #0x0
    str r1, [r5]
.L_bc:
    cmp r4, #0x0
    addeq sp, sp, #0x8
    ldmeqia sp!, {r4, r5, r6, pc}
    cmp r0, #0x0
    ble .L_e8
    ldrsh r1, [sp, #0x6]
    ands r1, r1, #0x20
    movne r1, #0x1
    addne sp, sp, #0x8
    strne r1, [r4]
    ldmneia sp!, {r4, r5, r6, pc}
.L_e8:
    mov r1, #0x0
    str r1, [r4]
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
