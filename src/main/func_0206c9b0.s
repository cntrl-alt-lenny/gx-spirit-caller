; func_0206c9b0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0206c84c
        .extern func_0206e4a4
        .global func_0206c9b0
        .arm
func_0206c9b0:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r4, r0
    mov r5, r1
    bl func_0206e4a4
    cmp r0, #0x0
    addne sp, sp, #0x4
    mvnne r0, #0x1b
    ldmneia sp!, {r4, r5, lr}
    bxne lr
    cmp r4, #0x0
    mov r1, #0x0
    beq .L_6fc
    ldrsh r0, [r4, #0x70]
    ands r0, r0, #0x1
    movne r1, #0x1
.L_6fc:
    cmp r1, #0x0
    addeq sp, sp, #0x4
    mvneq r0, #0x26
    ldmeqia sp!, {r4, r5, lr}
    bxeq lr
    ldrsh r0, [r4, #0x70]
    ands r0, r0, #0x2
    addne sp, sp, #0x4
    mvnne r0, #0x6
    ldmneia sp!, {r4, r5, lr}
    bxne lr
    strh r5, [r4, #0x74]
    ldrsb r0, [r4, #0x73]
    cmp r0, #0x1
    addne sp, sp, #0x4
    movne r0, #0x0
    ldmneia sp!, {r4, r5, lr}
    bxne lr
    mov r0, r4
    bl func_0206c84c
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
