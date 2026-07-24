; func_ov014_021b4194 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov014_021b4d34
        .extern data_ov014_021b4d54
        .extern data_ov014_021b4d74
        .extern data_ov014_021b4d94
        .extern data_ov014_02234fe0
        .extern func_0201e78c
        .extern func_0201ed90
        .extern func_0201eee8
        .extern func_0201ef3c
        .extern OS_SPrintf
        .global func_ov014_021b4194
        .arm
func_ov014_021b4194:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x12c
    mov r4, r0
    ldrh r2, [r4, #0x54]
    ldr r1, _LIT0
    add r0, sp, #0x2c
    mov r2, r2, lsl #0x18
    mov r2, r2, lsr #0x18
    bl OS_SPrintf
    ldrh r2, [r4, #0x54]
    ldr r1, _LIT1
    add r0, sp, #0x6c
    mov r2, r2, lsl #0x18
    mov r2, r2, lsr #0x18
    bl OS_SPrintf
    ldrh r2, [r4, #0x54]
    ldr r1, _LIT2
    add r0, sp, #0xac
    mov r2, r2, lsl #0x18
    mov r2, r2, lsr #0x18
    bl OS_SPrintf
    ldrh r2, [r4, #0x54]
    ldr r1, _LIT3
    add r0, sp, #0xec
    mov r2, r2, lsl #0x18
    mov r2, r2, lsr #0x18
    bl OS_SPrintf
    add r2, sp, #0x2c
    mov r1, #0x0
    add r0, sp, #0x1c
.L_da4:
    str r2, [r0, r1, lsl #0x2]
    add r1, r1, #0x1
    cmp r1, #0x4
    add r2, r2, #0x40
    blt .L_da4
    ldr r0, [r4, #0x10]
    cmp r0, #0x0
    beq .L_de0
    ldr r0, [r4, #0x4]
    add r1, r4, #0xc
    add r2, r4, #0x10
    bl func_0201eee8
    mov r0, #0x0
    str r0, [r4, #0x14]
    str r0, [r4, #0x10]
.L_de0:
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
    add r0, r4, #0x10
    str r0, [sp, #0x14]
    add r0, r4, #0x4
    add r1, r4, #0x8
    add r2, r4, #0xc
    bl func_0201ef3c
    ldr r1, [sp, #0x28]
    add r0, sp, #0x18
    bl func_0201ed90
    ldr r1, _LIT4
    str r0, [r1]
    add sp, sp, #0x12c
    ldmia sp!, {r3, r4, pc}
_LIT0: .word data_ov014_021b4d34
_LIT1: .word data_ov014_021b4d54
_LIT2: .word data_ov014_021b4d74
_LIT3: .word data_ov014_021b4d94
_LIT4: .word data_ov014_02234fe0
