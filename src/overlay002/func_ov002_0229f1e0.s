; func_ov002_0229f1e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d016c
        .extern data_ov002_022d0f2c
        .extern data_ov002_022d11bc
        .extern func_02037208
        .global func_ov002_0229f1e0
        .arm
func_ov002_0229f1e0:
    stmdb sp!, {r3, lr}
    ldr r1, [r0, #0x8]
    cmp r1, #0x10
    blt .L_68
    ldr r1, _LIT0
    mov r2, #0xf
    str r2, [r0, #0x18]
    ldr r2, [r1, #0xd4]
    ldr r1, _LIT0
    cmp r2, #0x2
    movlt r2, #0x2
    str r2, [r1, #0xd4]
    ldr r0, _LIT1
    mov r2, #0x0
    ldr r0, [r0, #0x4]
    mov r3, #0x3
    cmp r0, #0x3
    bne .L_58
    mov r0, #0x56
    sub r1, r0, #0x57
    bl func_02037208
    ldmia sp!, {r3, pc}
.L_58:
    mov r0, #0x38
    sub r1, r0, #0x39
    bl func_02037208
    ldmia sp!, {r3, pc}
.L_68:
    ldr r1, _LIT0
    mov r2, #0x1
    str r2, [r0, #0x18]
    ldr r2, [r1, #0xd4]
    ldr r1, _LIT0
    cmp r2, #0x10
    movlt r2, #0x10
    str r2, [r1, #0xd4]
    ldr r1, [r0, #0x8]
    cmp r1, #0x1
    beq .L_a0
    cmp r1, #0xf
    beq .L_b8
    b .L_f4
.L_a0:
    mov r0, #0x42
    sub r1, r0, #0x43
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    ldmia sp!, {r3, pc}
.L_b8:
    ldr r1, _LIT2
    ldr r2, [r0, #0x1c]
    ldr r0, [r1, #0xcf8]
    mov r3, #0x1
    cmp r2, r0
    mov r2, #0x0
    bne .L_e4
    mov r0, #0x42
    sub r1, r0, #0x43
    bl func_02037208
    ldmia sp!, {r3, pc}
.L_e4:
    mov r0, #0x3a
    sub r1, r0, #0x3b
    bl func_02037208
    ldmia sp!, {r3, pc}
.L_f4:
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022d0f2c
_LIT1: .word data_ov002_022d11bc
_LIT2: .word data_ov002_022d016c
