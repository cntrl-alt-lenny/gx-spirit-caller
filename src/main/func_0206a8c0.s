; func_0206a8c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0206b44c
        .global func_0206a8c0
        .arm
func_0206a8c0:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    mov r4, r1
    b .L_600
.L_5b8:
    mov r0, r5
    mov r1, r4
    bl func_0206b44c
    cmp r0, #0x0
    addlt sp, sp, #0x4
    movlt r0, #0x0
    ldmltia sp!, {r4, r5, pc}
    sub r4, r4, r0
    add r5, r5, r0
    mov r0, r5
    mov r1, r4
    bl func_0206b44c
    cmp r0, #0x0
    addlt sp, sp, #0x4
    movlt r0, #0x0
    ldmltia sp!, {r4, r5, pc}
    add r5, r5, r0
    sub r4, r4, r0
.L_600:
    cmp r4, #0x0
    ble .L_614
    ldrsb r0, [r5]
    cmp r0, #0x0
    bne .L_5b8
.L_614:
    cmp r4, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, pc}
    ldrsb r0, [r5]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
