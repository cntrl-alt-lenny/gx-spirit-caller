; func_0207ea20 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0207e758
        .global func_0207ea20
        .arm
func_0207ea20:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x14]
    cmp r0, #0x0
    ldreq r0, [r4, #0x18]
    ldreq r0, [r0, #0x8]
    cmp r0, #0x3
    beq .L_28
    cmp r0, #0x4
    bne .L_a4
.L_28:
    ldr r0, [r4, #0x4]
    eor r0, r0, #0x1
    str r0, [r4, #0x4]
    ldr r1, [r4, #0x18]
    ldr r2, [r4]
    ldrh r0, [r1, #0x2]
    ldr r1, [r1, #0xc]
    add r0, r1, r0, lsl #0x3
    sub r0, r0, #0x8
    cmp r2, r0
    bhi .L_f0
    ldr r0, [r4, #0x1c]
    cmp r0, #0x1
    bne .L_70
    ldr r0, [r4, #0x20]
    ldr r1, [r4, #0xc]
    ldr r2, [r4, #0x24]
    blx r2
.L_70:
    ldr r0, [r4, #0x14]
    cmp r0, #0x0
    ldreq r0, [r4, #0x18]
    ldreq r0, [r0, #0x8]
    cmp r0, #0x2
    beq .L_98
    cmp r0, #0x4
    movne r0, #0x0
    strne r0, [r4, #0x8]
    bne .L_f0
.L_98:
    mov r0, r4
    bl func_0207e758
    b .L_f0
.L_a4:
    ldr r0, [r4, #0x1c]
    cmp r0, #0x1
    bne .L_c0
    ldr r0, [r4, #0x20]
    ldr r1, [r4, #0xc]
    ldr r2, [r4, #0x24]
    blx r2
.L_c0:
    ldr r0, [r4, #0x14]
    cmp r0, #0x0
    ldreq r0, [r4, #0x18]
    ldreq r0, [r0, #0x8]
    cmp r0, #0x2
    beq .L_e8
    cmp r0, #0x4
    movne r0, #0x0
    strne r0, [r4, #0x8]
    bne .L_f0
.L_e8:
    mov r0, r4
    bl func_0207e758
.L_f0:
    ldr r1, [r4, #0x18]
    ldr r2, [r4]
    ldrh r0, [r1]
    ldr r1, [r1, #0xc]
    add r0, r1, r0, lsl #0x3
    sub r0, r0, #0x8
    cmp r2, r0
    strhi r0, [r4]
    ldmhiia sp!, {r4, pc}
    cmp r2, r1
    strcc r1, [r4]
    ldmia sp!, {r4, pc}
