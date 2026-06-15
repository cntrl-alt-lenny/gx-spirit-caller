; func_0207e594 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0207e638
        .extern func_0207e6ac
        .extern func_0207e6bc
        .global func_0207e594
        .arm
func_0207e594:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    ldr r1, [r5, #0x4]
    add r1, r1, r5
    str r1, [r5, #0x4]
    bl func_0207e6bc
    ldrh r1, [r5]
    mov r4, r0
    mov r6, #0x0
    cmp r1, #0x0
    bls .L_a4
.L_74:
    mov r0, r5
    mov r1, r6
    bl func_0207e638
    ldr r2, [r0, #0x4]
    add r1, r6, #0x1
    add r2, r2, r4
    str r2, [r0, #0x4]
    mov r0, r1, lsl #0x10
    ldrh r1, [r5]
    mov r6, r0, lsr #0x10
    cmp r6, r1
    bcc .L_74
.L_a4:
    ldr r0, [r5, #0xc]
    cmp r0, #0x0
    beq .L_cc
    add r0, r0, r5
    str r0, [r5, #0xc]
    ldr r1, [r5, #0xc]
    ldr r0, [r1, #0x4]
    add r0, r0, r1
    str r0, [r1, #0x4]
    str r1, [r5, #0xc]
.L_cc:
    ldr r0, [r5, #0x14]
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    add r0, r0, r5
    str r0, [r5, #0x14]
    ldr r0, [r5, #0x14]
    bl func_0207e6ac
    ldmia sp!, {r4, r5, r6, pc}
