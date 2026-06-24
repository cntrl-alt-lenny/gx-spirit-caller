; func_02066950 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02066a14
        .global func_02066950
        .arm
func_02066950:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x14
    mov r4, #0x0
    cmp r3, #0x3
    addlt sp, sp, #0x14
    mov lr, r4
    mov ip, r4
    ldmltia sp!, {r4, r5, r6, r7, pc}
    ldrb r7, [r2], #0x1
    sub r3, r3, #0x1
    cmp r7, #0x0
    beq .L_21c
    cmp r7, #0xff
    movne r4, r2
    addne r2, r2, r7
    subne r3, r3, r7
.L_21c:
    cmp r3, #0x2
    addlt sp, sp, #0x14
    ldmltia sp!, {r4, r5, r6, r7, pc}
    ldrb r6, [r2], #0x1
    sub r3, r3, #0x1
    cmp r6, #0x0
    beq .L_248
    cmp r6, #0xff
    movne lr, r2
    addne r2, r2, r6
    subne r3, r3, r6
.L_248:
    cmp r3, #0x1
    addlt sp, sp, #0x14
    ldmltia sp!, {r4, r5, r6, r7, pc}
    ldrb r5, [r2]
    sub r3, r3, #0x1
    cmp r5, #0x0
    beq .L_270
    cmp r5, #0xff
    addne ip, r2, #0x1
    subne r3, r3, r5
.L_270:
    cmp r3, #0x0
    addlt sp, sp, #0x14
    ldmltia sp!, {r4, r5, r6, r7, pc}
    str r6, [sp]
    str lr, [sp, #0x4]
    str r5, [sp, #0x8]
    mov r2, r7
    mov r3, r4
    str ip, [sp, #0xc]
    bl func_02066a14
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, pc}
