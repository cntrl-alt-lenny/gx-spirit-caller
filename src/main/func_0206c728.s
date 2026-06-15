; func_0206c728 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0206e4a4
        .global func_0206c728
        .arm
func_0206c728:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0206e4a4
    cmp r0, #0x0
    mvnne r0, #0x1b
    ldmneia sp!, {r4, lr}
    bxne lr
    cmp r4, #0x0
    mov r1, #0x0
    beq .L_468
    ldrsh r0, [r4, #0x70]
    ands r0, r0, #0x1
    movne r1, #0x1
.L_468:
    cmp r1, #0x0
    mvneq r0, #0x26
    ldmeqia sp!, {r4, lr}
    bxeq lr
    ldrsh r0, [r4, #0x70]
    ands r0, r0, #0x2
    mvnne r0, #0x1b
    ldmneia sp!, {r4, lr}
    bxne lr
    ldrsb r0, [r4, #0x73]
    mov r1, #0x1
    cmp r0, #0x0
    beq .L_4a4
    cmp r0, #0x4
    movne r1, #0x0
.L_4a4:
    cmp r1, #0x0
    mvneq r0, #0x1b
    ldmeqia sp!, {r4, lr}
    bxeq lr
    ldrsb r0, [r4, #0x72]
    cmp r0, #0x1
    moveq r0, #0x0
    mvnne r0, #0x5
    ldmia sp!, {r4, lr}
    bx lr
