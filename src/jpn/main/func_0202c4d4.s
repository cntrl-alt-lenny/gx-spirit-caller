; func_0202c4d4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern data_020c7a60
        .extern data_0219a85c
        .extern func_02005994
        .extern func_0202c4c4
        .global func_0202c4d4
        .arm
func_0202c4d4:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    mov r4, r0
    ldrsb r0, [r4, #0xa]
    ldrsb r3, [r4, #0x9]
    ldrsb ip, [r4, #0xb]
    sub r1, r0, #0x30
    mov r0, #0x64
    mul r2, r1, r0
    sub r1, r3, #0x30
    mov r0, #0x3e8
    mla r2, r1, r0, r2
    sub r1, ip, #0x30
    mov r0, #0xa
    mla r3, r1, r0, r2
    ldrsb lr, [r4, #0xc]
    add r1, sp, #0x4
    mov r0, #0x0
    sub ip, lr, #0x30
    mov r2, #0xc
    add r5, ip, r3
    bl Fill32
    ldr r0, _LIT0
    strh r5, [sp, #0x4]
    str r0, [sp]
    ldr r1, _LIT1
    ldr r0, _LIT2
    ldr r1, [r1, #0x8]
    ldr r0, [r0]
    ldr r1, [r1]
    mov r2, r0, lsl #0x10
    add r0, sp, #0x4
    mov r2, r2, lsr #0x10
    mov r3, #0xc
    bl func_02005994
    ldr r2, _LIT1
    cmp r0, #0x0
    ldr r2, [r2, #0x8]
    mov r1, #0xc
    ldr r2, [r2]
    addlt sp, sp, #0x10
    mla r1, r0, r1, r2
    movlt r0, #0x0
    ldmltia sp!, {r3, r4, r5, pc}
    ldrsb r0, [r4, #0xe]
    mov r2, #0x0
    cmp r0, #0x61
    movne r3, #0x1
    moveq r3, r2
    ldrsb r0, [r4, #0xf]
    orr r2, r2, r3, lsl #0x6
    cmp r0, #0x66
    moveq r3, #0x0
    beq .L_e4
    cmp r0, #0x62
    moveq r3, #0x1
    movne r3, #0x2
.L_e4:
    ldrsb r0, [r4, #0x10]
    orr r2, r2, r3, lsl #0x4
    cmp r0, #0x30
    moveq r3, #0x0
    beq .L_11c
    cmp r0, #0x31
    moveq r3, #0x1
    beq .L_11c
    cmp r0, #0x32
    moveq r3, #0x2
    beq .L_11c
    cmp r0, #0x33
    moveq r3, #0x3
    movne r3, #0x4
.L_11c:
    ldrsb r0, [r4, #0x11]
    ldrb r5, [r1, #0x4]
    orr r2, r2, r3, lsl #0x1
    cmp r0, #0x64
    moveq r0, #0x1
    movne r0, #0x0
    mov r4, #0x0
    mov r3, r4
    cmp r5, #0x0
    orr r2, r2, r0
    ble .L_168
.L_148:
    add r0, r1, r3
    ldrb r0, [r0, #0x6]
    cmp r2, r0
    moveq r4, r3
    beq .L_168
    add r3, r3, #0x1
    cmp r3, r5
    blt .L_148
.L_168:
    ldrh r0, [r1, #0x2]
    add r0, r0, r4
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word func_0202c4c4
_LIT1: .word data_0219a85c
_LIT2: .word data_020c7a60
