; func_ov006_021b9ff0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103fcc
        .extern data_ov006_0225dfe0
        .extern func_020221e0
        .extern func_020221f8
        .extern func_ov006_021ba0f8
        .extern func_ov006_021ba264
        .global func_ov006_021b9ff0
        .arm
func_ov006_021b9ff0:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r0, #0x0
    bl func_020221f8
    ldr r1, [r5, #0x38]
    mov r4, r0
    cmp r1, #0x0
    beq .L_34
    cmp r1, #0x1
    beq .L_5c
    cmp r1, #0x2
    beq .L_94
    b .L_9c
.L_34:
    ldr r0, [r5, #0x3c]
    cmp r0, #0x3
    bne .L_9c
    mov r0, r5
    bl func_ov006_021ba0f8
    mov r0, #0x1
    str r0, [r5, #0x38]
    mov r0, #0x0
    str r0, [r5, #0x3c]
    b .L_9c
.L_5c:
    ldr r0, [r5, #0x3c]
    cmp r0, #0xf
    moveq r0, #0x1
    streq r0, [r5, #0x7c]
    mov r0, r5
    bl func_ov006_021ba264
    cmp r0, #0x0
    beq .L_9c
    mov r0, #0x2
    str r0, [r5, #0x38]
    mov r0, #0x0
    str r0, [r5, #0x3c]
    orr r4, r4, #0x1
    b .L_9c
.L_94:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_9c:
    ldr r0, _LIT0
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    orrne r4, r4, #0x2
    biceq r4, r4, #0x2
    mov r1, r4
    mov r0, #0x0
    bl func_020221e0
    ldr r0, [r5, #0x74]
    cmp r0, #0x0
    ldrne r0, [r5, #0x7c]
    cmpne r0, #0x0
    beq .L_e4
    ldr r0, _LIT1
    ldr r1, [r5, #0x68]
    ldr r0, [r0, #0x30]
    add r0, r1, r0
    str r0, [r5, #0x68]
.L_e4:
    ldr r1, [r5, #0x3c]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r5, #0x3c]
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov006_0225dfe0
_LIT1: .word data_02103fcc
