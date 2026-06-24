; func_02069d70 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02054008
        .extern func_02054144
        .extern func_0206aa58
        .extern func_0206b3d8
        .extern func_0206b488
        .global func_02069d70
        .arm
func_02069d70:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xc
    mov sl, r0
    ldr r3, [sl, #0x8]
    mov r9, r1
    mov r8, r2
    cmp r3, #0x0
    sub r8, r8, #0x1
    ldrb r6, [r9], #0x1
    beq .L_38c
    bl func_0206aa58
.L_38c:
    mov r1, r6
    mov r0, #0x8
    mov r2, #0x0
    bl func_02054144
    str r0, [sl, #0x8]
    ldr r0, [sl, #0x8]
    cmp r0, #0x0
    addeq sp, sp, #0xc
    moveq r0, #0x5
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    cmp r6, #0x0
    mov r7, #0x0
    ble .L_434
    add fp, sp, #0x0
    mvn r4, #0x0
.L_3c8:
    cmp r8, #0x2
    addlt sp, sp, #0xc
    movlt r0, #0x4
    ldmltia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    add r0, r9, #0x1
    sub r1, r8, #0x1
    bl func_0206b3d8
    mov r5, r0
    cmp r5, r4
    addeq sp, sp, #0xc
    moveq r0, #0x4
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrb r2, [r9]
    mov r0, sl
    add r1, r9, #0x1
    str r2, [sp, #0x4]
    bl func_0206b488
    str r0, [sp]
    ldr r0, [sl, #0x8]
    mov r1, fp
    bl func_02054008
    add r0, r5, #0x1
    add r7, r7, #0x1
    cmp r7, r6
    add r9, r9, r0
    sub r8, r8, r0
    blt .L_3c8
.L_434:
    mov r0, #0x0
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
