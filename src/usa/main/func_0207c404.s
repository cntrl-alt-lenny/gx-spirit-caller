; func_0207c404 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0207b450
        .extern func_0207ce90
        .global func_0207c404
        .arm
func_0207c404:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    bl func_0207b450
    add r0, r0, #0x2000
    cmp r5, #0x0
    mov r4, #0x0
    ldr r1, [r0, #0x270]
    addeq sp, sp, #0x4
    moveq r0, r4
    ldmeqia sp!, {r4, r5, lr}
    bxeq lr
    cmp r1, #0x0
    beq .L_74
    ldr r0, [r0, #0x274]
    cmp r0, #0xc
    bls .L_74
    ldr r4, [r1, #0x4]
    cmp r4, #0x0
    beq .L_74
.L_50:
    add r0, r4, #0x10
    mov r1, r5
    add r0, r0, #0x4
    bl func_0207ce90
    cmp r0, #0x0
    bne .L_74
    ldr r4, [r4, #0xc]
    cmp r4, #0x0
    bne .L_50
.L_74:
    mov r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
