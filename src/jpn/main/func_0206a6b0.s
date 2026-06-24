; func_0206a6b0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0206a6b0
        .arm
func_0206a6b0:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    cmp r2, #0x5
    addlt sp, sp, #0x4
    ldmltia sp!, {r4, r5, pc}
    add r5, r1, #0x1
    ldrb ip, [r1]
    ldrb r4, [r1, #0x1]
    ldrb lr, [r5, #0x1]
    ands ip, ip, #0x10
    strb r4, [r3]
    strb lr, [r3, #0x1]
    ldrb lr, [r5, #0x2]
    ldrb ip, [r5, #0x3]
    strb lr, [r3, #0x2]
    strb ip, [r3, #0x3]
    beq .L_47c
    sub r0, r2, #0x5
    cmp r0, #0x2
    addlt sp, sp, #0x4
    ldmltia sp!, {r4, r5, pc}
    add r0, r1, #0x5
    ldrb r1, [r1, #0x5]
    ldr r2, [sp, #0x10]
    ldrb r0, [r0, #0x1]
    add sp, sp, #0x4
    strb r1, [r2]
    strb r0, [r2, #0x1]
    ldmia sp!, {r4, r5, pc}
.L_47c:
    add r0, r0, #0x400
    ldrh r1, [r0, #0xa8]
    ldr r0, [sp, #0x10]
    strh r1, [r0]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
