; func_0207daa4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .global func_0207daa4
        .arm
func_0207daa4:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    ldr r3, [r5, #0x4]
    sub r0, r2, #0x1
    mvn r2, r0
    sub r1, r3, r1
    ldr r0, [r5]
    and r4, r2, r1
    cmp r4, r0
    addcc sp, sp, #0x4
    movcc r0, #0x0
    ldmccia sp!, {r4, r5, pc}
    ldr r0, [r5, #-4]
    sub r2, r3, r4
    and r0, r0, #0xff
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    ands r0, r0, #0x1
    beq .L_5c
    mov r1, r4
    mov r0, #0x0
    bl Fill32
.L_5c:
    mov r0, r4
    str r4, [r5, #0x4]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
