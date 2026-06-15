; func_0207c5b4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0207b538
        .global func_0207c5b4
        .arm
func_0207c5b4:
    stmdb sp!, {r4, lr}
    bl func_0207b538
    add r2, r0, #0x2000
    ldr r1, [r2, #0x270]
    mov r0, #0x0
    cmp r1, #0x0
    ldmeqia sp!, {r4, lr}
    bxeq lr
    ldr r3, [r2, #0x274]
    cmp r3, #0xc
    ldmlsia sp!, {r4, lr}
    bxls lr
    ldr r2, _LIT0
    sub r3, r3, #0xc
    umull r2, r4, r3, r2
    movs r4, r4, lsr #0x6
    ldmeqia sp!, {r4, lr}
    bxeq lr
    ldr r2, [r1]
    cmp r4, r2
    ldmlsia sp!, {r4, lr}
    bxls lr
    mov lr, r0
    cmp r4, #0x0
    bls .L_3c0
    add ip, r1, #0xc
    mov r2, #0xd0
.L_3a0:
    mul r0, lr, r2
    ldrb r3, [ip, r0]
    add r0, ip, r0
    cmp r3, #0x0
    beq .L_3c0
    add lr, lr, #0x1
    cmp lr, r4
    bcc .L_3a0
.L_3c0:
    cmp lr, r4
    ldmcsia sp!, {r4, lr}
    bxcs lr
    mov r2, #0x1
    strb r2, [r0]
    ldr r3, [r1]
    mov r2, #0x0
    str r3, [r0, #0x4]
    str r2, [r0, #0xc]
    ldr r2, [r1, #0x8]
    str r2, [r0, #0x8]
    str r0, [r1, #0x8]
    ldr r2, [r0, #0x8]
    cmp r2, #0x0
    strne r0, [r2, #0xc]
    streq r0, [r1, #0x4]
    ldr r2, [r1]
    add r2, r2, #0x1
    str r2, [r1]
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word 0x4ec4ec4f
