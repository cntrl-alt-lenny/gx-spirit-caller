; func_02085e60 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02084d24
        .global func_02085e60
        .arm
func_02085e60:
    stmfd sp!, {lr}
    sub sp, sp, #0x3c
    ldr r1, [r0]
    mov r3, #0x0
    ands r1, r1, #0x8
    ldrne r1, _LIT0
    mov r2, #0x3
    strne r1, [sp]
    ldreq r1, _LIT1
    str r3, [sp, #0x34]
    streq r1, [sp]
    mov r1, #0x2
    str r1, [sp, #0x38]
    str r3, [sp, #0x28]
    str r3, [sp, #0x24]
    str r3, [sp, #0x20]
    str r3, [sp, #0x1c]
    str r3, [sp, #0x14]
    str r3, [sp, #0x10]
    str r3, [sp, #0xc]
    str r2, [sp, #0x4]
    ldr r2, [r0]
    ands r1, r2, #0x4
    beq .L_90
    str r3, [sp, #0x2c]
    str r3, [sp, #0x30]
    ldr r1, [r0]
    ands r1, r1, #0x1
    movne r1, #0x1000
    strne r1, [sp, #0x8]
    strne r1, [sp, #0x18]
    ldreq r1, [r0, #0x18]
    streq r1, [sp, #0x8]
    ldreq r1, [r0, #0x1c]
    streq r1, [sp, #0x18]
    b .L_130
.L_90:
    ands r1, r2, #0x1
    beq .L_d8
    ldr r2, [r0, #0x24]
    ldrh r1, [r0, #0x2c]
    mov r2, r2, lsl #0x4
    rsb r2, r2, #0x0
    mul r1, r2, r1
    str r1, [sp, #0x2c]
    ldr r2, [r0, #0x28]
    ldrh r1, [r0, #0x2e]
    mov r2, r2, lsl #0x4
    rsb r2, r2, #0x0
    mul r3, r2, r1
    mov r1, #0x1000
    str r3, [sp, #0x30]
    str r1, [sp, #0x8]
    str r1, [sp, #0x18]
    b .L_130
.L_d8:
    ldr r2, [r0, #0x18]
    ldr r1, [r0, #0x24]
    ldrh ip, [r0, #0x2c]
    smull r3, r1, r2, r1
    mov r2, r3, lsr #0x8
    orr r2, r2, r1, lsl #0x18
    rsb r1, r2, #0x0
    mul r1, ip, r1
    str r1, [sp, #0x2c]
    ldr r2, [r0, #0x1c]
    ldr r1, [r0, #0x28]
    ldrh ip, [r0, #0x2e]
    smull r3, r1, r2, r1
    mov r2, r3, lsr #0x8
    orr r2, r2, r1, lsl #0x18
    rsb r1, r2, #0x0
    mul r1, ip, r1
    str r1, [sp, #0x30]
    ldr r1, [r0, #0x18]
    str r1, [sp, #0x8]
    ldr r1, [r0, #0x1c]
    str r1, [sp, #0x18]
.L_130:
    ldr ip, [r0, #0x30]
    cmp ip, #0x1000
    beq .L_168
    ldr r2, [sp, #0x8]
    ldr r1, [sp, #0x2c]
    smull r3, r2, ip, r2
    mov r3, r3, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    str r3, [sp, #0x8]
    ldr r2, [r0, #0x30]
    smull r3, r1, r2, r1
    mov r2, r3, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    str r2, [sp, #0x2c]
.L_168:
    ldr ip, [r0, #0x34]
    cmp ip, #0x1000
    beq .L_1a0
    ldr r2, [sp, #0x18]
    ldr r1, [sp, #0x30]
    smull r3, r2, ip, r2
    mov r3, r3, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    str r3, [sp, #0x18]
    ldr r0, [r0, #0x34]
    smull r2, r1, r0, r1
    mov r0, r2, lsr #0xc
    orr r0, r0, r1, lsl #0x14
    str r0, [sp, #0x30]
.L_1a0:
    add r1, sp, #0x0
    ldr r0, [sp]
    add r1, r1, #0x4
    mov r2, #0xe
    bl func_02084d24
    add sp, sp, #0x3c
    ldmfd sp!, {pc}
_LIT0: .word 0x00101710
_LIT1: .word 0x00101910
