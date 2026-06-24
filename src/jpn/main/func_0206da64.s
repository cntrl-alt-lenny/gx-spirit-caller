; func_0206da64 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0206bdd0
        .extern func_0206bf20
        .extern func_0206da24
        .extern func_0206e430
        .global func_0206da64
        .arm
func_0206da64:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r4, r0
    bl func_0206e430
    cmp r0, #0x0
    addne sp, sp, #0x4
    mvnne r0, #0x1b
    ldmneia sp!, {r4, r5, lr}
    bxne lr
    cmp r4, #0x0
    mov r1, #0x0
    beq .L_3c
    ldrsh r0, [r4, #0x70]
    ands r0, r0, #0x1
    movne r1, #0x1
.L_3c:
    cmp r1, #0x0
    addeq sp, sp, #0x4
    mvneq r0, #0x26
    ldmeqia sp!, {r4, r5, lr}
    bxeq lr
    ldrsh r0, [r4, #0x70]
    ands r0, r0, #0x4
    beq .L_68
    ldrsh r0, [r4, #0x70]
    ands r0, r0, #0x8
    beq .L_78
.L_68:
    add sp, sp, #0x4
    mvn r0, #0x37
    ldmia sp!, {r4, r5, lr}
    bx lr
.L_78:
    ldrsh r0, [r4, #0x70]
    orr r0, r0, #0x8
    strh r0, [r4, #0x70]
    ldr r5, [r4, #0x68]
    cmp r5, #0x0
    beq .L_d0
    ldr r1, [r5, #0x10c]
    cmp r1, #0x0
    beq .L_d0
    ldrsb r2, [r4, #0x72]
    ldr r0, _LIT0
    bl func_0206bf20
    movs r1, r0
    addeq sp, sp, #0x4
    mvneq r0, #0x20
    ldmeqia sp!, {r4, r5, lr}
    bxeq lr
    ldr r0, [r5, #0x10c]
    bl func_0206bdd0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
.L_d0:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word func_0206da24
