; func_0207e92c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0207eb08
        .extern func_020a6d48
        .global func_0207e92c
        .arm
func_0207e92c:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r8, r0
    ldr r0, [r8, #0x8]
    mov r7, #0x0
    cmp r0, #0x1
    movne r0, r7
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r2, [r8, #0x10]
    mov r0, #0x800
    smull r3, r1, r2, r1
    adds r0, r3, r0
    adc r1, r1, r7
    mov r0, r0, lsr #0xc
    orr r0, r0, r1, lsl #0x14
    bl func_020a6d48
    ldr r1, [r8, #0xc]
    add r6, r8, #0xc
    add r0, r1, r0
    str r0, [r8, #0xc]
    mov r4, r7
    mov r5, #0x1
    b .L_174
.L_58:
    ldr r0, [r8]
    ldr r1, [r6]
    ldrh r0, [r0, #0x4]
    mov r7, r5
    sub r0, r1, r0, lsl #0xc
    str r0, [r6]
    ldr r0, [r8, #0x10]
    cmp r0, #0x0
    movgt r1, r5
    ldr r0, [r8, #0x4]
    movle r1, r4
    eors r0, r1, r0
    ldrne r0, [r8]
    addne r0, r0, #0x8
    strne r0, [r8]
    ldreq r0, [r8]
    subeq r0, r0, #0x8
    streq r0, [r8]
    ldr r1, [r8, #0x10]
    ldr r0, [r8]
    cmp r1, #0x0
    movgt r2, r5
    ldr r1, [r8, #0x4]
    movle r2, r4
    eors r1, r2, r1
    beq .L_e0
    ldr r2, [r8, #0x18]
    ldrh r1, [r2]
    ldr r2, [r2, #0xc]
    add r1, r2, r1, lsl #0x3
    cmp r0, r1
    movcs r0, r5
    movcc r0, r4
    b .L_100
.L_e0:
    ldr r2, [r8, #0x18]
    ldrh r1, [r2, #0x2]
    ldr r2, [r2, #0xc]
    add r1, r2, r1, lsl #0x3
    sub r1, r1, #0x8
    cmp r0, r1
    movls r0, r5
    movhi r0, r4
.L_100:
    cmp r0, #0x0
    beq .L_110
    mov r0, r8
    bl func_0207eb08
.L_110:
    ldr r0, [r8, #0x1c]
    cmp r0, #0x0
    beq .L_174
    ldr r0, [r8, #0x18]
    ldr r2, [r8, #0x1c]
    ldr r1, [r8]
    ldr r0, [r0, #0xc]
    cmp r2, #0x2
    sub r0, r1, r0
    mov r0, r0, lsl #0xd
    mov r1, r0, lsr #0x10
    beq .L_14c
    cmp r2, #0x3
    beq .L_168
    b .L_174
.L_14c:
    ldrh r0, [r8, #0x28]
    cmp r1, r0
    bne .L_174
    ldr r0, [r8, #0x20]
    ldr r2, [r8, #0x24]
    blx r2
    b .L_174
.L_168:
    ldr r0, [r8, #0x20]
    ldr r2, [r8, #0x24]
    blx r2
.L_174:
    ldr r0, [r8, #0x8]
    cmp r0, #0x0
    beq .L_198
    ldr r0, [r8]
    ldr r1, [r8, #0xc]
    ldrh r0, [r0, #0x4]
    cmp r1, r0, lsl #0xc
    movge r0, r5
    bge .L_19c
.L_198:
    mov r0, r4
.L_19c:
    cmp r0, #0x0
    bne .L_58
    mov r0, r7
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
