; func_02068120 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101c48
        .extern data_02101c58
        .extern func_02054c34
        .extern func_020552bc
        .extern func_020683d8
        .global func_02068120
        .arm
func_02068120:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x114
    mov r5, r0
    mov r4, r1
    add r0, r5, #0x8
    bl func_020683d8
    bl func_020552bc
    str r0, [r4, #0x1c]
    mov r0, #0x2
    strb r0, [sp, #0x9]
    ldrb r1, [r4, #0x14]
    ands r0, r1, #0x20
    addne sp, sp, #0x114
    ldmneia sp!, {r4, r5, pc}
    ldr r0, [r5]
    cmp r0, #0x1
    bne .L_108
    mov r2, #0xfe
    mov r1, #0xfd
    mov r0, #0x0
    strb r2, [sp, #0x10]
    strb r1, [sp, #0x11]
    strb r0, [sp, #0x12]
    add r3, r4, #0x1c
    ldrb r2, [r4, #0x1c]
    ldrb r1, [r3, #0x1]
    add ip, sp, #0x13
    strb r2, [ip]
    strb r1, [ip, #0x1]
    ldrb r2, [r3, #0x2]
    ldrb r1, [r3, #0x3]
    strb r2, [ip, #0x2]
    strb r1, [ip, #0x3]
    ldrb r1, [r4, #0x14]
    ands r1, r1, #0x4
    beq .L_f0
    ldr r1, [r5, #0x40]
    strb r1, [sp, #0x17]
    ldr r2, [r5, #0x40]
    cmp r2, #0x0
    ble .L_c8
    add r1, sp, #0x10
.L_a8:
    add r2, r5, r0
    ldrb r3, [r2, #0x2c]
    add r2, r0, #0x8
    add r0, r0, #0x1
    strb r3, [r1, r2]
    ldr r2, [r5, #0x40]
    cmp r0, r2
    blt .L_a8
.L_c8:
    add r0, r2, #0x8
    add r1, sp, #0x10
    mov r2, #0x0
    strb r2, [r1, r0]
    ldr r0, [r5, #0x40]
    add r0, r0, #0x9
    strb r2, [r1, r0]
    ldr r0, [r5, #0x40]
    add r2, r0, #0xa
    b .L_16c
.L_f0:
    mov r0, #0xff
    strb r0, [sp, #0x17]
    strb r0, [sp, #0x18]
    strb r0, [sp, #0x19]
    mov r2, #0xa
    b .L_16c
.L_108:
    ands r0, r1, #0x4
    beq .L_144
    ldr r3, _LIT0
    add ip, sp, #0x10
    mov r2, #0x6
.L_11c:
    ldrb r1, [r3], #0x1
    ldrb r0, [r3], #0x1
    subs r2, r2, #0x1
    strb r1, [ip], #0x1
    strb r0, [ip], #0x1
    bne .L_11c
    ldrb r0, [r3]
    mov r2, #0xd
    strb r0, [ip]
    b .L_16c
.L_144:
    ldr r3, _LIT1
    add ip, sp, #0x10
    mov r2, #0x4
.L_150:
    ldrb r1, [r3], #0x1
    ldrb r0, [r3], #0x1
    subs r2, r2, #0x1
    strb r1, [ip], #0x1
    strb r0, [ip], #0x1
    bne .L_150
    mov r2, #0x8
.L_16c:
    ldr r1, [r4]
    ldr r0, [r5, #0x28]
    cmp r1, r0
    bne .L_198
    ldrb r0, [r4, #0x15]
    ands r0, r0, #0x2
    ldrne r0, [r4, #0x8]
    strne r0, [sp, #0xc]
    ldrneh r0, [r4, #0xc]
    strneh r0, [sp, #0xa]
    bne .L_1a4
.L_198:
    str r1, [sp, #0xc]
    ldrh r0, [r4, #0x4]
    strh r0, [sp, #0xa]
.L_1a4:
    add r1, sp, #0x8
    str r1, [sp]
    mov r0, #0x8
    str r0, [sp, #0x4]
    ldr r0, [r5, #0x20]
    add r1, sp, #0x10
    mov r3, #0x0
    bl func_02054c34
    add sp, sp, #0x114
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_02101c48
_LIT1: .word data_02101c58
