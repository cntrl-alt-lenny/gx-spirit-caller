; func_ov019_021b4fdc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104f4c
        .extern data_ov019_021b5cb4
        .extern data_ov019_021b5ccc
        .extern data_ov019_021b5ce4
        .extern data_ov019_021b5cfc
        .extern data_ov019_021b5d14
        .extern data_ov019_021b5d2c
        .extern data_ov019_021b5d44
        .extern data_ov019_021b5d5c
        .extern data_ov019_021b5d74
        .extern data_ov019_021b5d8c
        .extern data_ov019_021b5da4
        .extern data_ov019_021b5dbc
        .extern data_ov019_021b6834
        .extern func_0201e7e0
        .extern func_0201ede4
        .extern func_0201ef3c
        .extern func_0201ef90
        .extern OS_SPrintf
        .extern func_ov019_021b4ed0
        .extern func_ov019_021b4f1c
        .global func_ov019_021b4fdc
        .arm
func_ov019_021b4fdc:
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
    bl func_ov019_021b4f1c
    mov r4, r0
    cmp r4, #0x37
    bne .L_198
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1d
    bne .L_154
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
    b .L_1d8
.L_154:
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
    b .L_1d8
.L_198:
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
.L_1d8:
    ldr r0, [r5, #0x54]
    cmp r0, #0x0
    beq .L_200
    ldr r0, [r5]
    add r1, r5, #0x8
    add r2, r5, #0x54
    bl func_0201ef3c
    mov r0, #0x0
    str r0, [r5, #0x58]
    str r0, [r5, #0x54]
.L_200:
    bl func_0201e7e0
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
    bl func_0201ef90
    ldr r1, [sp, #0x28]
    add r0, sp, #0x18
    bl func_0201ede4
    ldr r2, _LIT13
    mov r1, r4
    str r0, [r2]
    mov r2, #0x0
    mov r0, r5
    str r2, [r5, #0xbc]
    bl func_ov019_021b4ed0
    cmp r0, #0x0
    addeq sp, sp, #0x12c
    ldmeqia sp!, {r4, r5, pc}
    cmp r4, #0x1
    beq .L_28c
    cmp r4, #0x4b
    beq .L_2d0
    add sp, sp, #0x12c
    ldmia sp!, {r4, r5, pc}
.L_28c:
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
    b .L_310
.L_2d0:
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
.L_310:
    ldr r0, [r5, #0xb0]
    cmp r0, #0x0
    beq .L_338
    ldr r0, [r5, #0x5c]
    add r1, r5, #0x64
    add r2, r5, #0xb0
    bl func_0201ef3c
    mov r0, #0x0
    str r0, [r5, #0xb4]
    str r0, [r5, #0xb0]
.L_338:
    bl func_0201e7e0
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
    bl func_0201ef90
    ldr r1, [sp, #0x28]
    add r0, sp, #0x18
    bl func_0201ede4
    ldr r1, _LIT13
    str r0, [r1, #0x4]
    add sp, sp, #0x12c
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_02104f4c
_LIT1: .word data_ov019_021b5cb4
_LIT2: .word data_ov019_021b5ccc
_LIT3: .word data_ov019_021b5ce4
_LIT4: .word data_ov019_021b5cfc
_LIT5: .word data_ov019_021b5d14
_LIT6: .word data_ov019_021b5d2c
_LIT7: .word data_ov019_021b5d44
_LIT8: .word data_ov019_021b5d5c
_LIT9: .word data_ov019_021b5d74
_LIT10: .word data_ov019_021b5d8c
_LIT11: .word data_ov019_021b5da4
_LIT12: .word data_ov019_021b5dbc
_LIT13: .word data_ov019_021b6834
