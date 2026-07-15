; func_ov017_021b636c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov017_021b8794
        .extern data_ov017_021b8894
        .extern func_020371b8
        .extern func_ov017_021b60dc
        .global func_ov017_021b636c
        .arm
func_ov017_021b636c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x4]
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b .L_194
    b .L_28
    b .L_84
    b .L_e0
    b .L_13c
.L_28:
    ldr r1, [r4, #0xc]
    ldr r0, [r4, #0x10]
    add r2, r4, r1
    ldr r1, _LIT0
    add r0, r2, r0
    ldrb r2, [r0, #0x20]
    ldrb r0, [r1, #0x1ce]
    cmp r0, r2
    beq .L_194
    ldr r0, _LIT1
    strb r2, [r1, #0x1ce]
    mov r1, #0x4
    strh r1, [r0, #0xd8]
    mov r0, #0x38
    ldr r3, [r4, #0xc]
    ldr r2, [r4, #0x10]
    sub r1, r0, #0x39
    add ip, r3, r2
    mov r2, #0x0
    mov r3, #0x1
    str ip, [r4, #0x1c]
    bl func_020371b8
    b .L_194
.L_84:
    ldr r1, [r4, #0xc]
    ldr r0, [r4, #0x10]
    add r2, r4, r1
    ldr r1, _LIT0
    add r0, r2, r0
    ldrb r2, [r0, #0x20]
    ldrb r0, [r1, #0x1cf]
    cmp r0, r2
    beq .L_194
    ldr r0, _LIT1
    strb r2, [r1, #0x1cf]
    mov r1, #0x8
    strh r1, [r0, #0xd8]
    mov r0, #0x38
    ldr r3, [r4, #0xc]
    ldr r2, [r4, #0x10]
    sub r1, r0, #0x39
    add ip, r3, r2
    mov r2, #0x0
    mov r3, #0x1
    str ip, [r4, #0x1c]
    bl func_020371b8
    b .L_194
.L_e0:
    ldr r1, [r4, #0xc]
    ldr r2, [r4, #0x10]
    add r3, r4, r1
    ldr r1, _LIT1
    add r2, r3, r2
    ldrb r3, [r2, #0x20]
    ldrh r2, [r1, #0xd0]
    cmp r2, r3
    beq .L_194
    strh r3, [r1, #0xd0]
    mov r2, #0x10
    strh r2, [r1, #0xd8]
    bl func_ov017_021b60dc
    mov r0, #0x38
    ldr r3, [r4, #0xc]
    ldr r2, [r4, #0x10]
    sub r1, r0, #0x39
    add ip, r3, r2
    mov r2, #0x0
    mov r3, #0x1
    str ip, [r4, #0x1c]
    bl func_020371b8
    b .L_194
.L_13c:
    ldr r1, [r4, #0xc]
    ldr r0, [r4, #0x10]
    add r1, r4, r1
    add r0, r1, r0
    ldr r1, _LIT0
    ldrb r2, [r0, #0x20]
    ldr r0, [r1, #0x1d4]
    cmp r0, r2
    beq .L_194
    ldr r0, _LIT1
    str r2, [r1, #0x1d4]
    mov r1, #0x40
    strh r1, [r0, #0xd8]
    mov r0, #0x38
    ldr r3, [r4, #0xc]
    ldr r2, [r4, #0x10]
    sub r1, r0, #0x39
    add ip, r3, r2
    mov r2, #0x0
    mov r3, #0x1
    str ip, [r4, #0x1c]
    bl func_020371b8
.L_194:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov017_021b8794
_LIT1: .word data_ov017_021b8894
