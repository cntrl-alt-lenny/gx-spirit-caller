; func_ov019_021b4938 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103fcc
        .extern data_ov019_021b5954
        .extern func_0201e910
        .extern func_ov019_021b4dbc
        .extern func_ov019_021b4e08
        .global func_ov019_021b4938
        .arm
func_ov019_021b4938:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x48
    mov r5, r0
    ldr r0, [r5, #0xbc]
    cmp r0, #0x0
    bne .L_1d0
    ldr r0, [r5, #0xc0]
    cmp r0, #0x0
    ble .L_1d0
    ldr r1, [r5, #0xc4]
    mov r0, #0x60000
    mov r1, r1, lsl #0xc
    str r0, [sp, #0x24]
    str r1, [sp, #0x20]
    mov r3, #0x0
    str r3, [sp]
    str r3, [sp, #0x4]
    mov r0, #0x6
    str r0, [sp, #0x8]
    mov r0, #0x3
    str r0, [sp, #0xc]
    mov r0, #0x1e00
    str r0, [sp, #0x10]
    mov r0, #0x200
    str r0, [sp, #0x14]
    str r3, [sp, #0x18]
    str r3, [sp, #0x1c]
    ldr r0, [r5, #0x8]
    add r2, sp, #0x20
    ldr r1, [r0, #0x2c]
    mov r0, #0x1
    bl func_0201e910
    mov r3, #0x0
    str r3, [sp]
    str r3, [sp, #0x4]
    mov r0, #0x5
    str r0, [sp, #0x8]
    mov r0, #0x3
    str r0, [sp, #0xc]
    mov r0, #0x1e00
    str r0, [sp, #0x10]
    mov r0, #0x200
    str r0, [sp, #0x14]
    str r3, [sp, #0x18]
    str r3, [sp, #0x1c]
    ldr r0, [r5, #0xc]
    add r2, sp, #0x20
    ldr r1, [r0, #0x2c]
    mov r0, #0x1
    bl func_0201e910
    mov r3, #0x0
    str r3, [sp]
    str r3, [sp, #0x4]
    mov r0, #0x4
    str r0, [sp, #0x8]
    mov r0, #0x3
    str r0, [sp, #0xc]
    mov r0, #0x1e00
    str r0, [sp, #0x10]
    mov r0, #0x200
    str r0, [sp, #0x14]
    str r3, [sp, #0x18]
    str r3, [sp, #0x1c]
    ldr r0, [r5, #0x10]
    add r2, sp, #0x20
    ldr r1, [r0, #0x2c]
    mov r0, #0x1
    bl func_0201e910
    mov r0, r5
    bl func_ov019_021b4e08
    mov r1, r0
    mov r0, r5
    bl func_ov019_021b4dbc
    cmp r0, #0x0
    beq .L_1d0
    ldr ip, _LIT0
    add r4, sp, #0x28
    ldmia ip!, {r0, r1, r2, r3}
    stmia r4!, {r0, r1, r2, r3}
    ldmia ip, {r0, r1, r2, r3}
    stmia r4, {r0, r1, r2, r3}
    mov r0, r5
    mov r4, #0x0
    bl func_ov019_021b4e08
    cmp r0, #0x4b
    ldr r0, _LIT1
    ldr r1, [r5, #0xc4]
    ldr r0, [r0, #0x38]
    sub r2, r1, #0x38
    mov r1, r0, asr #0x3
    add r0, sp, #0x28
    and r1, r1, #0x7
    moveq r4, #0x20
    ldr r0, [r0, r1, lsl #0x2]
    add r1, r4, #0x40
    add r0, r1, r0
    mov r1, r2, lsl #0xc
    mov r0, r0, lsl #0xc
    str r0, [sp, #0x24]
    str r1, [sp, #0x20]
    mov r3, #0x0
    str r3, [sp]
    str r3, [sp, #0x4]
    mov r0, #0x7
    str r0, [sp, #0x8]
    mov r0, #0x3
    str r0, [sp, #0xc]
    str r3, [sp, #0x10]
    str r3, [sp, #0x14]
    str r3, [sp, #0x18]
    str r3, [sp, #0x1c]
    ldr r0, [r5, #0x64]
    add r2, sp, #0x20
    ldr r1, [r0, #0x2c]
    mov r0, #0x1
    bl func_0201e910
.L_1d0:
    mov r0, #0x1
    add sp, sp, #0x48
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov019_021b5954
_LIT1: .word data_02103fcc
