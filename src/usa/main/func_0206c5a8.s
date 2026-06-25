; func_0206c5a8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101d84
        .extern func_0206c3f8
        .extern func_0206c4b8
        .extern func_0206c93c
        .extern func_0206e430
        .global func_0206c5a8
        .arm
func_0206c5a8:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r6, r0
    mov r5, r1
    mov r4, r2
    bl func_0206e430
    cmp r0, #0x0
    addne sp, sp, #0x4
    mvnne r0, #0x1b
    ldmneia sp!, {r4, r5, r6, r7, lr}
    bxne lr
    cmp r6, #0x0
    mov r1, #0x0
    beq .L_44
    ldrsh r0, [r6, #0x70]
    ands r0, r0, #0x1
    movne r1, #0x1
.L_44:
    cmp r1, #0x0
    addeq sp, sp, #0x4
    mvneq r0, #0x26
    ldmeqia sp!, {r4, r5, r6, r7, lr}
    bxeq lr
    ldrsh r0, [r6, #0x70]
    ands r0, r0, #0x2
    addne sp, sp, #0x4
    mvnne r0, #0x1b
    ldmneia sp!, {r4, r5, r6, r7, lr}
    bxne lr
    ldrsb r0, [r6, #0x73]
    mov r1, #0x1
    cmp r0, #0x0
    beq .L_88
    cmp r0, #0x4
    movne r1, #0x0
.L_88:
    cmp r1, #0x0
    addeq sp, sp, #0x4
    mvneq r0, #0x1b
    ldmeqia sp!, {r4, r5, r6, r7, lr}
    bxeq lr
    ldrsb r0, [r6, #0x72]
    cmp r0, #0x1
    addne sp, sp, #0x4
    mvnne r0, #0x5
    ldmneia sp!, {r4, r5, r6, r7, lr}
    bxne lr
    ldr r0, _LIT0
    bl func_0206c3f8
    movs r7, r0
    addmi sp, sp, #0x4
    ldmmiia sp!, {r4, r5, r6, r7, lr}
    bxmi lr
    ldrh r1, [r6, #0x74]
    bl func_0206c93c
    cmp r0, #0x0
    addlt sp, sp, #0x4
    ldmltia sp!, {r4, r5, r6, r7, lr}
    bxlt lr
    mov r0, r7
    mov r1, r5
    mov r2, r4
    bl func_0206c4b8
    cmp r0, #0x0
    movge r0, r7
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
_LIT0: .word data_02101d84
