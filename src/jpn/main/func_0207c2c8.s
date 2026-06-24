; func_0207c2c8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0207b450
        .global func_0207c2c8
        .arm
func_0207c2c8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0207b450
    add r1, r0, #0x2000
    cmp r4, #0x0
    ldr r0, [r1, #0x270]
    ldmeqia sp!, {r4, lr}
    bxeq lr
    cmp r0, #0x0
    ldmeqia sp!, {r4, lr}
    bxeq lr
    ldr r1, [r1, #0x274]
    cmp r1, #0xc
    ldmlsia sp!, {r4, lr}
    bxls lr
    ldr r3, [r0, #0x4]
    cmp r3, #0x0
    beq .L_1c0
.L_178:
    cmp r3, r4
    bne .L_1b4
    ldr r2, [r3, #0x8]
    cmp r2, #0x0
    ldrne r1, [r3, #0xc]
    strne r1, [r2, #0xc]
    ldreq r1, [r3, #0xc]
    streq r1, [r0, #0x4]
    ldr r2, [r3, #0xc]
    cmp r2, #0x0
    ldrne r1, [r3, #0x8]
    strne r1, [r2, #0x8]
    ldreq r1, [r3, #0x8]
    streq r1, [r0, #0x8]
    b .L_1c0
.L_1b4:
    ldr r3, [r3, #0xc]
    cmp r3, #0x0
    bne .L_178
.L_1c0:
    mov r1, #0x0
    str r1, [r4, #0xc]
    ldr r1, [r0, #0x8]
    str r1, [r4, #0x8]
    str r4, [r0, #0x8]
    ldr r1, [r4, #0x8]
    cmp r1, #0x0
    strne r4, [r1, #0xc]
    streq r4, [r0, #0x4]
    cmp r3, #0x0
    ldreq r1, [r0]
    streq r1, [r4, #0x4]
    ldreq r1, [r0]
    addeq r1, r1, #0x1
    streq r1, [r0]
    ldmia sp!, {r4, lr}
    bx lr
