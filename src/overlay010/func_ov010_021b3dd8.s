; func_ov010_021b3dd8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov010_021b8d08
        .extern data_ov010_021b8d44
        .extern data_ov010_021b8d48
        .extern data_ov010_021b8db4
        .extern func_0207ec68
        .extern func_0207ed94
        .extern func_0207f05c
        .extern func_ov010_021b3168
        .extern func_ov010_021b5d88
        .extern func_ov010_021b7eac
        .global func_ov010_021b3dd8
        .arm
func_ov010_021b3dd8:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    mov r4, #0x0
    ldr r0, _LIT1
    mov r6, r4
    str r1, [sp]
    ldr r5, _LIT2
    bl func_0207ed94
    ldr r0, _LIT1
    bl func_0207ec68
    ldr r1, _LIT3
    add r0, sp, #0x0
    ldr r2, [r1, #0x9c]
    mov r1, r4
    bl func_ov010_021b3168
    ldr r1, _LIT3
    add r6, r6, r0
    ldr r0, [r1, #0x3c]
    cmp r0, #0x1
    beq .L_64
    cmp r0, #0x2
    beq .L_70
    cmp r0, #0x3
    b .L_78
.L_64:
    bl func_ov010_021b5d88
    mov r4, r0
    b .L_78
.L_70:
    bl func_ov010_021b7eac
    mov r4, r0
.L_78:
    cmp r6, #0x0
    ble .L_94
    mov r2, r6, lsl #0x10
    ldr r1, _LIT0
    add r0, r5, #0x4
    mov r2, r2, lsr #0x10
    bl func_0207f05c
.L_94:
    cmp r4, #0x1
    bne .L_ac
    ldr r0, _LIT3
    mov r1, #0x14000
    str r1, [r0, #0xa4]
    str r1, [r0, #0xa0]
.L_ac:
    mov r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
_LIT0: .word data_ov010_021b8db4
_LIT1: .word data_ov010_021b8d48
_LIT2: .word data_ov010_021b8d44
_LIT3: .word data_ov010_021b8d08
