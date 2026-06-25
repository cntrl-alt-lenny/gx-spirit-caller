; func_02076f30 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02076fac
        .global func_02076f30
        .arm
func_02076f30:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    b .L_324
.L_314:
    cmp r1, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, lr}
    bxeq lr
.L_324:
    ldrsb r0, [r5], #0x1
    ldrsb r1, [r6], #0x1
    cmp r1, r0
    beq .L_314
    cmp r0, #0x2a
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, lr}
    bxne lr
    sub r6, r6, #0x1
    mov r0, r6
    bl func_02076fac
    mov r4, r0
    mov r0, r5
    bl func_02076fac
    cmp r0, r4
    movgt r0, #0x1
    ldmgtia sp!, {r4, r5, r6, lr}
    bxgt lr
    sub r0, r4, r0
    add r6, r6, r0
    b .L_324
