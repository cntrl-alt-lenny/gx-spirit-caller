; func_ov019_021b4ec8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104e6c
        .extern data_ov019_021b5bb4
        .extern data_ov019_021b5bcc
        .extern data_ov019_021b5be4
        .extern data_ov019_021b5bfc
        .extern data_ov019_021b5c14
        .extern data_ov019_021b5c2c
        .extern data_ov019_021b5c44
        .extern data_ov019_021b5c5c
        .extern data_ov019_021b5c74
        .extern data_ov019_021b5c8c
        .extern data_ov019_021b5ca4
        .extern data_ov019_021b5cbc
        .extern data_ov019_021b6734
        .extern func_0201e78c
        .extern func_0201ed90
        .extern func_0201eee8
        .extern func_0201ef3c
        .extern OS_SPrintf
        .extern func_ov019_021b4dbc
        .extern func_ov019_021b4e08
        .global func_ov019_021b4ec8
        .arm
func_ov019_021b4ec8:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x12c
    add r4, sp, #0x2c
    add r3, sp, #0x6c
    add r2, sp, #0xac
    add r1, sp, #0xec
    mov r5, r0
    str r4, [sp, #0x1c]
    str r3, [sp, #0x20]
    str r2, [sp, #0x24]
    str r1, [sp, #0x28]
    bl func_ov019_021b4e08
    mov r4, r0
    cmp r4, #0x37
    bne .L_d8
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1d
    bne .L_94
    ldr r0, [sp, #0x1c]
    ldr r1, _LIT1
    mov r2, r4
    bl OS_SPrintf
    ldr r0, [sp, #0x20]
    ldr r1, _LIT2
    mov r2, r4
    bl OS_SPrintf
    ldr r0, [sp, #0x24]
    ldr r1, _LIT3
    mov r2, r4
    bl OS_SPrintf
    ldr r0, [sp, #0x28]
    ldr r1, _LIT4
    mov r2, r4
    bl OS_SPrintf
    b .L_118
.L_94:
    ldr r0, [sp, #0x1c]
    ldr r1, _LIT5
    mov r2, r4
    bl OS_SPrintf
    ldr r0, [sp, #0x20]
    ldr r1, _LIT6
    mov r2, r4
    bl OS_SPrintf
    ldr r0, [sp, #0x24]
    ldr r1, _LIT7
    mov r2, r4
    bl OS_SPrintf
    ldr r0, [sp, #0x28]
    ldr r1, _LIT8
    mov r2, r4
    bl OS_SPrintf
    b .L_118
.L_d8:
    ldr r0, [sp, #0x1c]
    ldr r1, _LIT9
    mov r2, r4
    bl OS_SPrintf
    ldr r0, [sp, #0x20]
    ldr r1, _LIT10
    mov r2, r4
    bl OS_SPrintf
    ldr r0, [sp, #0x24]
    ldr r1, _LIT11
    mov r2, r4
    bl OS_SPrintf
    ldr r0, [sp, #0x28]
    ldr r1, _LIT12
    mov r2, r4
    bl OS_SPrintf
.L_118:
    ldr r0, [r5, #0x54]
    cmp r0, #0x0
    beq .L_140
    ldr r0, [r5]
    add r1, r5, #0x8
    add r2, r5, #0x54
    bl func_0201eee8
    mov r0, #0x0
    str r0, [r5, #0x58]
    str r0, [r5, #0x54]
.L_140:
    bl func_0201e78c
    mov r1, #0x1
    str r1, [sp]
    add r0, sp, #0x1c
    str r1, [sp, #0x4]
    str r0, [sp, #0x8]
    str r1, [sp, #0xc]
    sub r0, r1, #0x2
    str r0, [sp, #0x10]
    add r1, r5, #0x54
    str r1, [sp, #0x14]
    mov r0, r5
    add r1, r5, #0x4
    add r2, r5, #0x8
    mov r3, #0x1e00
    bl func_0201ef3c
    ldr r1, [sp, #0x28]
    add r0, sp, #0x18
    bl func_0201ed90
    ldr r2, _LIT13
    mov r1, r4
    str r0, [r2]
    mov r2, #0x0
    mov r0, r5
    str r2, [r5, #0xbc]
    bl func_ov019_021b4dbc
    cmp r0, #0x0
    addeq sp, sp, #0x12c
    ldmeqia sp!, {r4, r5, pc}
    cmp r4, #0x1
    beq .L_1cc
    cmp r4, #0x4b
    beq .L_210
    add sp, sp, #0x12c
    ldmia sp!, {r4, r5, pc}
.L_1cc:
    ldr r0, [sp, #0x1c]
    ldr r1, _LIT9
    mov r2, #0x5c
    bl OS_SPrintf
    ldr r0, [sp, #0x20]
    ldr r1, _LIT10
    mov r2, #0x5c
    bl OS_SPrintf
    ldr r0, [sp, #0x24]
    ldr r1, _LIT11
    mov r2, #0x5c
    bl OS_SPrintf
    ldr r0, [sp, #0x28]
    ldr r1, _LIT12
    mov r2, #0x5c
    bl OS_SPrintf
    b .L_250
.L_210:
    ldr r0, [sp, #0x1c]
    ldr r1, _LIT9
    mov r2, #0x5d
    bl OS_SPrintf
    ldr r0, [sp, #0x20]
    ldr r1, _LIT10
    mov r2, #0x5d
    bl OS_SPrintf
    ldr r0, [sp, #0x24]
    ldr r1, _LIT11
    mov r2, #0x5d
    bl OS_SPrintf
    ldr r0, [sp, #0x28]
    ldr r1, _LIT12
    mov r2, #0x5d
    bl OS_SPrintf
.L_250:
    ldr r0, [r5, #0xb0]
    cmp r0, #0x0
    beq .L_278
    ldr r0, [r5, #0x5c]
    add r1, r5, #0x64
    add r2, r5, #0xb0
    bl func_0201eee8
    mov r0, #0x0
    str r0, [r5, #0xb4]
    str r0, [r5, #0xb0]
.L_278:
    bl func_0201e78c
    mov r3, #0x0
    mov r1, #0x1
    str r3, [sp]
    add r0, sp, #0x1c
    str r1, [sp, #0x4]
    str r0, [sp, #0x8]
    str r1, [sp, #0xc]
    sub r0, r1, #0x2
    str r0, [sp, #0x10]
    add r0, r5, #0xb0
    str r0, [sp, #0x14]
    add r0, r5, #0x5c
    add r1, r5, #0x60
    add r2, r5, #0x64
    bl func_0201ef3c
    ldr r1, [sp, #0x28]
    add r0, sp, #0x18
    bl func_0201ed90
    ldr r1, _LIT13
    str r0, [r1, #0x4]
    add sp, sp, #0x12c
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_02104e6c
_LIT1: .word data_ov019_021b5bb4
_LIT2: .word data_ov019_021b5bcc
_LIT3: .word data_ov019_021b5be4
_LIT4: .word data_ov019_021b5bfc
_LIT5: .word data_ov019_021b5c14
_LIT6: .word data_ov019_021b5c2c
_LIT7: .word data_ov019_021b5c44
_LIT8: .word data_ov019_021b5c5c
_LIT9: .word data_ov019_021b5c74
_LIT10: .word data_ov019_021b5c8c
_LIT11: .word data_ov019_021b5ca4
_LIT12: .word data_ov019_021b5cbc
_LIT13: .word data_ov019_021b6734
