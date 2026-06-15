; func_02091584 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02091584
        .arm
func_02091584:
    stmdb sp!, {r4, lr}
    cmp r2, #0x0
    ldmleia sp!, {r4, lr}
    bxle lr
    ldr lr, [r0]
    mov r4, #0x0
    cmp lr, r2
    movhi lr, r2
    cmp lr, #0x0
    bls .L_40
.L_28:
    ldrsb ip, [r1, r4]
    ldr r3, [r0, #0x4]
    strb ip, [r3, r4]
    add r4, r4, #0x1
    cmp r4, lr
    bcc .L_28
.L_40:
    ldr r1, [r0]
    sub r1, r1, lr
    str r1, [r0]
    ldr r1, [r0, #0x4]
    add r1, r1, r2
    str r1, [r0, #0x4]
    ldmia sp!, {r4, lr}
    bx lr
