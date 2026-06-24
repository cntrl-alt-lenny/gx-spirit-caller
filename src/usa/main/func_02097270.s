; func_02097270 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02097164
        .extern func_020971e0
        .global func_02097270
        .arm
func_02097270:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    ldr r0, [r5, #0x1c]
    mov r4, #0x0
    ands r0, r0, #0x2
    movne r0, #0x1
    moveq r0, r4
    cmp r0, #0x0
    beq .L_88
    mov r0, r5
    bl func_020971e0
    ldr r1, [r5, #0x1c]
    ands r1, r1, #0x4
    movne r1, #0x1
    moveq r1, #0x0
    cmp r1, #0x0
    beq .L_78
    ldr r2, [r5, #0x1c]
    mov r1, #0x0
    bic r2, r2, #0x4
    str r2, [r5, #0x1c]
    ldr r4, [r5, #0x44]
    str r1, [r5, #0x44]
    ldr r1, [r5, #0x3c]
    str r1, [r5, #0x2c]
    ldr r1, [r5, #0x40]
    str r1, [r5, #0x34]
    ldr r1, [r5, #0x48]
    str r1, [r5, #0x50]
.L_78:
    cmp r0, #0x0
    beq .L_88
    mov r0, r5
    bl func_02097164
.L_88:
    mov r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
