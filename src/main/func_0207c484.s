; func_0207c484 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0207b538
        .global func_0207c484
        .arm
func_0207c484:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0207b538
    add r1, r0, #0x2000
    ldr r2, [r1, #0x270]
    mov r0, #0x0
    cmp r2, #0x0
    ldmeqia sp!, {r4, lr}
    bxeq lr
    ldr r1, [r1, #0x274]
    cmp r1, #0xc
    ldmlsia sp!, {r4, lr}
    bxls lr
    ldr r0, [r2, #0x4]
    cmp r0, #0x0
    ldmeqia sp!, {r4, lr}
    bxeq lr
.L_248:
    ldr r1, [r0, #0x4]
    cmp r1, r4
    ldmeqia sp!, {r4, lr}
    bxeq lr
    ldr r0, [r0, #0xc]
    cmp r0, #0x0
    bne .L_248
    ldmia sp!, {r4, lr}
    bx lr
