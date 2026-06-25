; func_02033c24 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02033b10
        .global func_02033c24
        .arm
func_02033c24:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x4
    mov sl, r0
    ldrb r0, [sl]
    mov r9, r1
    mov r8, r2
    cmp r0, #0x0
    mov r7, r3
    addeq sp, sp, #0x4
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r0, [sl, #0x4]
    cmp r0, #0x0
    bne .L_a4
    ldrsb r0, [sl, #0x2]
    ldrsb r6, [sl, #0x1]
    mov r5, #0x0
    cmp r0, #0x0
    ble .L_98
    mov r4, r5
.L_4c:
    mov r0, sl
    mov r1, r9
    mov r2, r8
    mov r3, r6
    str r7, [sp]
    bl func_02033b10
    add r0, r6, #0x1
    mov r0, r0, lsl #0x18
    cmp r8, r0, asr #0x18
    mov r6, r0, asr #0x18
    ldrle r0, [sl, #0x8]
    movle r6, r4
    strle r0, [sl, #0x4]
    add r0, r5, #0x1
    mov r0, r0, lsl #0x18
    ldrsb r1, [sl, #0x2]
    mov r5, r0, asr #0x18
    cmp r1, r0, asr #0x18
    bgt .L_4c
.L_98:
    add sp, sp, #0x4
    strb r6, [sl, #0x1]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_a4:
    sub r0, r0, #0x1
    str r0, [sl, #0x4]
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
