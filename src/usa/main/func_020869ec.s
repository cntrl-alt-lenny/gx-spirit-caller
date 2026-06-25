; func_020869ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021022c0
        .extern func_02084d24
        .global func_020869ec
        .arm
func_020869ec:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x50
    mov r4, r0
    ldr r0, [r4]
    mov r3, #0x3
    ands r0, r0, #0x8
    ldrne r0, _LIT0
    mov r2, #0x2
    strne r0, [sp]
    ldreq r0, _LIT1
    mov r1, #0x1000
    streq r0, [sp]
    mov r0, #0x0
    str r3, [sp, #0x4]
    str r2, [sp, #0x48]
    str r1, [sp, #0x44]
    str r0, [sp, #0x40]
    str r0, [sp, #0x34]
    str r0, [sp, #0x30]
    str r0, [sp, #0x2c]
    str r0, [sp, #0x28]
    str r0, [sp, #0x24]
    str r0, [sp, #0x20]
    str r0, [sp, #0x14]
    str r0, [sp, #0x10]
    ldr r0, [r4]
    ands r0, r0, #0x1
    strne r1, [r4, #0x1c]
    ldrne r0, [r4, #0x1c]
    strne r0, [r4, #0x18]
    ldr r0, [r4]
    ands r0, r0, #0x2
    movne r0, #0x1000
    strneh r0, [r4, #0x22]
    movne r0, #0x0
    strneh r0, [r4, #0x20]
    ldr r0, [r4]
    ands r0, r0, #0x4
    movne r0, #0x0
    strne r0, [r4, #0x28]
    ldrne r0, [r4, #0x28]
    strne r0, [r4, #0x24]
    ldr r1, [r4]
    ldr r0, _LIT2
    and r1, r1, #0x7
    ldr r2, [r0, r1, lsl #0x2]
    add r0, sp, #0x8
    mov r1, r4
    blx r2
    ldr r3, [r4, #0x30]
    cmp r3, #0x1000
    beq .L_114
    ldr r0, [sp, #0x8]
    ldr r1, [sp, #0xc]
    smull r2, r0, r3, r0
    mov r2, r2, lsr #0xc
    orr r2, r2, r0, lsl #0x14
    str r2, [sp, #0x8]
    ldr r2, [r4, #0x30]
    ldr r0, [sp, #0x38]
    smull r3, r1, r2, r1
    mov r2, r3, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    str r2, [sp, #0xc]
    ldr r1, [r4, #0x30]
    smull r2, r0, r1, r0
    mov r1, r2, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    str r1, [sp, #0x38]
.L_114:
    ldr r3, [r4, #0x34]
    cmp r3, #0x1000
    beq .L_164
    ldr r0, [sp, #0x18]
    ldr r1, [sp, #0x1c]
    smull r2, r0, r3, r0
    mov r2, r2, lsr #0xc
    orr r2, r2, r0, lsl #0x14
    str r2, [sp, #0x18]
    ldr r2, [r4, #0x34]
    ldr r0, [sp, #0x3c]
    smull r3, r1, r2, r1
    mov r2, r3, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    str r2, [sp, #0x1c]
    ldr r1, [r4, #0x34]
    smull r2, r0, r1, r0
    mov r1, r2, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    str r1, [sp, #0x3c]
.L_164:
    add r1, sp, #0x0
    ldr r0, [sp]
    add r1, r1, #0x4
    mov r2, #0x12
    bl func_02084d24
    add sp, sp, #0x50
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00101610
_LIT1: .word 0x00101810
_LIT2: .word data_021022c0
