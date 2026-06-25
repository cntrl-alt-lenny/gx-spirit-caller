; func_02084b50 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021020d8
        .extern data_021020e4
        .extern data_021020f0
        .extern func_02084cd8
        .extern func_02094410
        .global func_02084b50
        .arm
func_02084b50:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    mov r4, r1
    mov r1, r5
    mov r0, #0x0
    mov r2, #0x188
    bl func_02094410
    mov r0, #0x1
    str r0, [r5, #0xc4]
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x30]
    ldr r2, _LIT0
    cmp r0, #0x0
    strne r0, [r5]
    ldreq r1, [r4, #0x4]
    ldreq r0, [r1, #0x4]
    addeq r0, r1, r0
    streq r0, [r5]
    str r4, [r5, #0x4]
    ldr r0, [r4, #0x4]
    ldr r1, _LIT1
    add r0, r0, #0x40
    str r0, [r5, #0xd4]
    ldr ip, [r4, #0x4]
    ldr r0, _LIT2
    ldr r3, [ip, #0x8]
    add r3, ip, r3
    str r3, [r5, #0xd8]
    ldr ip, [r4, #0x4]
    ldr r3, [ip, #0xc]
    add r3, ip, r3
    str r3, [r5, #0xdc]
    ldr r3, [r4, #0x4]
    ldrb r3, [r3, #0x15]
    ldr r2, [r2, r3, lsl #0x2]
    str r2, [r5, #0xe8]
    ldr r2, [r4, #0x4]
    ldrb r2, [r2, #0x15]
    ldr r1, [r1, r2, lsl #0x2]
    str r1, [r5, #0xec]
    ldr r1, [r4, #0x4]
    ldrb r1, [r1, #0x16]
    ldr r0, [r0, r1, lsl #0x2]
    str r0, [r5, #0xf0]
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x1c]
    str r0, [r5, #0xe0]
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x20]
    str r0, [r5, #0xe4]
    ldr r1, [r4, #0x20]
    cmp r1, #0x0
    beq .L_fc
    ldrb r0, [r4, #0x24]
    cmp r0, #0x20
    bcs .L_fc
    add r0, r5, r0, lsl #0x2
    str r1, [r0, #0xc]
    ldrb r0, [r4, #0x24]
    ldrb r1, [r4, #0x25]
    add r0, r5, r0
    strb r1, [r0, #0x8c]
.L_fc:
    ldr r0, [r4]
    ands r0, r0, #0x1
    ldrne r0, [r5, #0x8]
    orrne r0, r0, #0x80
    strne r0, [r5, #0x8]
    ldr r0, [r4]
    ands r0, r0, #0x2
    ldrne r0, [r5, #0x8]
    orrne r0, r0, #0x100
    strne r0, [r5, #0x8]
    ldr r0, [r4]
    ands r0, r0, #0x4
    ldrne r0, [r5, #0x8]
    orrne r0, r0, #0x200
    strne r0, [r5, #0x8]
    ldr r0, [r4]
    ands r0, r0, #0x8
    ldrne r0, [r5, #0x8]
    orrne r0, r0, #0x400
    strne r0, [r5, #0x8]
    ldr r1, [r4, #0x28]
    cmp r1, #0x0
    beq .L_160
    mov r0, r5
    blx r1
.L_160:
    mov r0, r5
    bl func_02084cd8
    ldr r0, [r4]
    bic r0, r0, #0x1
    str r0, [r4]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_021020e4
_LIT1: .word data_021020d8
_LIT2: .word data_021020f0
