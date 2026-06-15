; func_02068194 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101d28
        .extern data_02101d38
        .extern func_02054ca8
        .extern func_02055330
        .extern func_0206844c
        .global func_02068194
        .arm
func_02068194:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x114
    mov r5, r0
    mov r4, r1
    add r0, r5, #0x8
    bl func_0206844c
    bl func_02055330
    str r0, [r4, #0x1c]
    mov r0, #0x2
    strb r0, [sp, #0x9]
    ldrb r1, [r4, #0x14]
    ands r0, r1, #0x20
    addne sp, sp, #0x114
    ldmneia sp!, {r4, r5, pc}
    ldr r0, [r5]
    cmp r0, #0x1
    bne .L_180
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
    beq .L_168
    ldr r1, [r5, #0x40]
    strb r1, [sp, #0x17]
    ldr r2, [r5, #0x40]
    cmp r2, #0x0
    ble .L_140
    add r1, sp, #0x10
.L_120:
    add r2, r5, r0
    ldrb r3, [r2, #0x2c]
    add r2, r0, #0x8
    add r0, r0, #0x1
    strb r3, [r1, r2]
    ldr r2, [r5, #0x40]
    cmp r0, r2
    blt .L_120
.L_140:
    add r0, r2, #0x8
    add r1, sp, #0x10
    mov r2, #0x0
    strb r2, [r1, r0]
    ldr r0, [r5, #0x40]
    add r0, r0, #0x9
    strb r2, [r1, r0]
    ldr r0, [r5, #0x40]
    add r2, r0, #0xa
    b .L_1e4
.L_168:
    mov r0, #0xff
    strb r0, [sp, #0x17]
    strb r0, [sp, #0x18]
    strb r0, [sp, #0x19]
    mov r2, #0xa
    b .L_1e4
.L_180:
    ands r0, r1, #0x4
    beq .L_1bc
    ldr r3, _LIT0
    add ip, sp, #0x10
    mov r2, #0x6
.L_194:
    ldrb r1, [r3], #0x1
    ldrb r0, [r3], #0x1
    subs r2, r2, #0x1
    strb r1, [ip], #0x1
    strb r0, [ip], #0x1
    bne .L_194
    ldrb r0, [r3]
    mov r2, #0xd
    strb r0, [ip]
    b .L_1e4
.L_1bc:
    ldr r3, _LIT1
    add ip, sp, #0x10
    mov r2, #0x4
.L_1c8:
    ldrb r1, [r3], #0x1
    ldrb r0, [r3], #0x1
    subs r2, r2, #0x1
    strb r1, [ip], #0x1
    strb r0, [ip], #0x1
    bne .L_1c8
    mov r2, #0x8
.L_1e4:
    ldr r1, [r4]
    ldr r0, [r5, #0x28]
    cmp r1, r0
    bne .L_210
    ldrb r0, [r4, #0x15]
    ands r0, r0, #0x2
    ldrne r0, [r4, #0x8]
    strne r0, [sp, #0xc]
    ldrneh r0, [r4, #0xc]
    strneh r0, [sp, #0xa]
    bne .L_21c
.L_210:
    str r1, [sp, #0xc]
    ldrh r0, [r4, #0x4]
    strh r0, [sp, #0xa]
.L_21c:
    add r1, sp, #0x8
    str r1, [sp]
    mov r0, #0x8
    str r0, [sp, #0x4]
    ldr r0, [r5, #0x20]
    add r1, sp, #0x10
    mov r3, #0x0
    bl func_02054ca8
    add sp, sp, #0x114
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_02101d28
_LIT1: .word data_02101d38
