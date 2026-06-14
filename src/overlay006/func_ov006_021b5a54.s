; func_ov006_021b5a54 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov006_0224f38c
        .extern data_ov006_0224f398
        .extern data_ov006_0225e068
        .extern func_ov006_021b596c
        .extern func_ov006_021b5994
        .extern func_ov006_021b5b70
        .extern func_ov006_021c9efc
        .extern func_ov006_021ca3a0
        .global func_ov006_021b5a54
        .arm
func_ov006_021b5a54:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r5, _LIT0
    ldr r4, _LIT1
    ldr r0, [r5]
    mov r6, #0x0
    cmp r0, #0x0
    beq .L_24
    bl func_ov006_021b5b70
    b .L_f0
.L_24:
    ldr r0, [r4]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, r6
    cmp r0, #0x0
    beq .L_ec
    mov r0, r4
    bl func_ov006_021c9efc
    cmp r0, #0x0
    beq .L_f0
    ldr r0, [r4, #0x4c]
    ldr r1, [r4, #0x48]
    sub r0, r0, #0x18
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b .L_e0
    b .L_78
    b .L_98
    b .L_bc
    b .L_bc
    b .L_c4
.L_78:
    cmp r1, #0x0
    movne r6, #0x1
    bne .L_e0
    mov r1, #0x1
    mov r0, #0x0
    str r1, [r5]
    str r0, [r5, #0x4]
    b .L_e0
.L_98:
    mov r1, #0x2
    ldr r0, _LIT2
    str r1, [r5]
    ldr r0, [r0, #0x14]
    cmp r0, #0x0
    movne r0, #0x1a
    moveq r0, #0x1c
    str r0, [r5, #0x4]
    b .L_e0
.L_bc:
    mov r6, #0x1
    b .L_e0
.L_c4:
    cmp r1, #0x0
    movne r6, #0x1
    bne .L_e0
    mov r1, #0x1
    mov r0, #0x0
    str r1, [r5]
    str r0, [r5, #0x4]
.L_e0:
    mov r0, r4
    bl func_ov006_021ca3a0
    b .L_f0
.L_ec:
    mov r6, #0x1
.L_f0:
    bl func_ov006_021b596c
    bl func_ov006_021b5994
    cmp r6, #0x0
    ldrne r0, _LIT2
    movne r1, #0x3
    strne r1, [r0]
    mov r0, r6
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov006_0224f398
_LIT1: .word data_ov006_0225e068
_LIT2: .word data_ov006_0224f38c
