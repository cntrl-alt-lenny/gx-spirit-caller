; func_ov006_021be5b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov006_0224f448
        .extern func_020945f4
        .extern func_020b3870
        .extern func_ov006_021b6d00
        .extern func_ov006_021b6d1c
        .extern func_ov006_021b8e4c
        .extern func_ov006_021b8f7c
        .global func_ov006_021be5b8
        .arm
func_ov006_021be5b8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov sl, r0
    ldr r1, [sl, #0x50]
    add r2, sl, #0xa0
    mov r0, #0x24
    mla r7, r1, r0, r2
    cmp r1, #0x0
    ldrne r0, [r7, #0x20]
    ldr r6, _LIT0
    moveq r2, #0x0
    movne r0, r0, lsl #0x1f
    movne r2, r0, lsr #0x1f
    mov r0, r6
    bl func_ov006_021b6d00
    str r0, [r7, #0xc]
    ldr r0, [r7, #0x20]
    mov r0, r0, lsl #0x1f
    movs r2, r0, lsr #0x1f
    movne r1, #0xa
    ldr r0, [sl, #0x50]
    moveq r1, #0x1
    cmp r0, #0x4
    moveq r9, #0x3
    movne r9, #0x4
    cmp r2, #0x0
    ldr r0, [r7, #0xc]
    beq .L_78
    add r0, r0, r1
    sub r0, r0, #0x1
    bl func_020b3870
.L_78:
    str r0, [r7, #0x10]
    cmp r0, r9
    movgt r0, #0x1
    ldr r1, [r7, #0x20]
    movle r0, #0x0
    mov r0, r0, lsl #0x1f
    bic r1, r1, #0x2
    orr r0, r1, r0, lsr #0x1e
    str r0, [r7, #0x20]
    ldr r0, [sl, #0x40]
    cmp r0, #0x0
    bne .L_130
    ldr r0, [r7, #0x20]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    beq .L_cc
    add r0, r7, #0x1c
    mov r1, #0x0
    mov r2, #0x4
    bl func_020945f4
    b .L_130
.L_cc:
    cmp r9, #0x0
    mov r8, #0x0
    ble .L_130
    mov r5, #0x1
    mov r4, r8
.L_e0:
    ldr r0, [r7, #0x20]
    ldr r2, [r7, #0x8]
    mov r3, r0, lsl #0x1f
    ldr r1, [sl, #0x50]
    mov r0, r6
    add r2, r2, r8
    mov r3, r3, lsr #0x1f
    bl func_ov006_021b6d1c
    mov r1, r0
    mov r0, r6
    mov r2, r5
    mov r3, r4
    bl func_ov006_021b8e4c
    mov r0, r6
    bl func_ov006_021b8f7c
    add r1, r7, r8
    strb r0, [r1, #0x1c]
    add r8, r8, #0x1
    cmp r8, r9
    blt .L_e0
.L_130:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov006_0224f448
