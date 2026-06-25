; func_0206c4b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0206bde0
        .extern func_0206bf20
        .extern func_0206c43c
        .extern func_0206e430
        .global func_0206c4b8
        .arm
func_0206c4b8:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    mov r4, r2
    bl func_0206e430
    cmp r0, #0x0
    mvnne r0, #0x1b
    ldmneia sp!, {r4, r5, r6, lr}
    bxne lr
    cmp r6, #0x0
    mov r1, #0x0
    beq .L_3c
    ldrsh r0, [r6, #0x70]
    ands r0, r0, #0x1
    movne r1, #0x1
.L_3c:
    cmp r1, #0x0
    mvneq r0, #0x26
    ldmeqia sp!, {r4, r5, r6, lr}
    bxeq lr
    ldrsh r0, [r6, #0x70]
    ands r0, r0, #0x2
    mvnne r0, #0x1b
    ldmneia sp!, {r4, r5, r6, lr}
    bxne lr
    ldrsb r0, [r6, #0x73]
    mov r1, #0x1
    cmp r0, #0x0
    beq .L_78
    cmp r0, #0x4
    movne r1, #0x0
.L_78:
    cmp r1, #0x0
    mvneq r0, #0x1b
    ldmeqia sp!, {r4, r5, r6, lr}
    bxeq lr
    ldrsb r2, [r6, #0x72]
    cmp r2, #0x1
    mvnne r0, #0x5
    ldmneia sp!, {r4, r5, r6, lr}
    bxne lr
    ldrh r0, [r6, #0x74]
    cmp r0, #0x0
    mvneq r0, #0x1b
    ldmeqia sp!, {r4, r5, r6, lr}
    bxeq lr
    ldr r0, _LIT0
    mov r1, r6
    bl func_0206bf20
    mov r1, r0
    ldrh r2, [r6, #0x74]
    mov r0, r6
    strh r2, [r1, #0x10]
    str r5, [r1, #0x14]
    str r4, [r1, #0x18]
    ldrsh r2, [r6, #0x70]
    orr r2, r2, #0x2
    strh r2, [r6, #0x70]
    bl func_0206bde0
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
_LIT0: .word func_0206c43c
