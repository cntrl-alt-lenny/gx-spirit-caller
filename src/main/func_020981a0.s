; func_020981a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02097848
        .extern func_02097f20
        .global func_020981a0
        .arm
func_020981a0:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r7, r0
    ldr r4, [r7, #0x2c]
    ldr r0, [r7, #0x28]
    mov r6, r2
    str r1, [r7, #0x30]
    sub r0, r0, r4
    cmp r6, r0
    movgt r6, r0
    cmp r6, #0x0
    movlt r6, #0x0
    str r2, [r7, #0x34]
    mov r5, r3
    str r6, [r7, #0x38]
    cmp r5, #0x0
    ldreq r0, [r7, #0xc]
    mov r1, #0x0
    orreq r0, r0, #0x4
    streq r0, [r7, #0xc]
    mov r0, r7
    bl func_02097848
    cmp r5, #0x0
    bne .L_bc
    mov r0, r7
    bl func_02097f20
    cmp r0, #0x0
    ldrne r0, [r7, #0x2c]
    subne r6, r0, r4
    mvneq r6, #0x0
.L_bc:
    mov r0, r6
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
