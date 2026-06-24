; func_0206ad88 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02054c84
        .extern func_0206a9f4
        .extern func_0206ab14
        .extern func_0206b1e4
        .global func_0206ad88
        .arm
func_0206ad88:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x4
    mov sl, r0
    mov r9, r1
    mov r8, r2
    mov r6, #0x1
    mov r5, #0x0
    mov r4, #0x2
.L_294:
    ldr r0, [sl, #0x4b0]
    mov r1, r9
    mov r2, r8
    mov r3, r5
    sub r6, r6, #0x1
    bl func_02054c84
    mov r7, r0
    cmp r7, #0x0
    bgt .L_304
    cmp r6, #0x0
    blt .L_304
    mov r0, sl
    bl func_0206a9f4
    mov r0, sl
    mov r1, r5
    mov r2, r5
    mov r3, r4
    str r5, [sp]
    bl func_0206ab14
    movs fp, r0
    beq .L_2fc
    mov r0, sl
    bl func_0206b1e4
    add sp, sp, #0x4
    mov r0, fp
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2fc:
    cmp r6, #0x0
    bge .L_294
.L_304:
    cmp r7, #0x0
    movle r0, #0x3
    movgt r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
