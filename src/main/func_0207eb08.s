; func_0207eb08 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0207e840
        .global func_0207eb08
        .arm
func_0207eb08:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x14]
    cmp r0, #0x0
    ldreq r0, [r4, #0x18]
    ldreq r0, [r0, #0x8]
    cmp r0, #0x3
    beq .L_4c
    cmp r0, #0x4
    bne .L_c8
.L_4c:
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
    bhi .L_114
    ldr r0, [r4, #0x1c]
    cmp r0, #0x1
    bne .L_94
    ldr r0, [r4, #0x20]
    ldr r1, [r4, #0xc]
    ldr r2, [r4, #0x24]
    blx r2
.L_94:
    ldr r0, [r4, #0x14]
    cmp r0, #0x0
    ldreq r0, [r4, #0x18]
    ldreq r0, [r0, #0x8]
    cmp r0, #0x2
    beq .L_bc
    cmp r0, #0x4
    movne r0, #0x0
    strne r0, [r4, #0x8]
    bne .L_114
.L_bc:
    mov r0, r4
    bl func_0207e840
    b .L_114
.L_c8:
    ldr r0, [r4, #0x1c]
    cmp r0, #0x1
    bne .L_e4
    ldr r0, [r4, #0x20]
    ldr r1, [r4, #0xc]
    ldr r2, [r4, #0x24]
    blx r2
.L_e4:
    ldr r0, [r4, #0x14]
    cmp r0, #0x0
    ldreq r0, [r4, #0x18]
    ldreq r0, [r0, #0x8]
    cmp r0, #0x2
    beq .L_10c
    cmp r0, #0x4
    movne r0, #0x0
    strne r0, [r4, #0x8]
    bne .L_114
.L_10c:
    mov r0, r4
    bl func_0207e840
.L_114:
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
