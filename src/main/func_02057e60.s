; func_02057e60 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021000d0
        .extern data_021001cc
        .extern data_021001f0
        .extern func_02054140
        .extern func_02057f3c
        .extern func_020581a8
        .extern func_020a6d54
        .global func_02057e60
        .arm
func_02057e60:
    stmdb sp!, {r0, r1, r2, r3}
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x14
    mov r4, r1
    ldr r1, [r4, #0x28]
    mov r5, r0
    cmp r1, #0x0
    bne .L_138
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0xde
    bl func_020a6d54
.L_138:
    ldr r1, [r4, #0x30]
    ldr r0, [r4, #0x34]
    subs r0, r1, r0
    bne .L_1b4
    ldr r0, [r4, #0x38]
    bl func_02054140
    cmp r0, #0x0
    bne .L_1b4
    add r0, sp, #0xc
    str r0, [sp]
    add r1, sp, #0x10
    ldr r0, _LIT2
    str r1, [sp, #0x4]
    str r0, [sp, #0x8]
    ldr r1, [r4, #0x8]
    add r2, sp, #0x28
    mov r0, r5
    mov r3, #0x1
    bl func_02057f3c
    cmp r0, #0x0
    addne sp, sp, #0x14
    ldmneia sp!, {r4, r5, lr}
    addne sp, sp, #0x10
    bxne lr
    ldr r0, [sp, #0x10]
    cmp r0, #0x0
    addne sp, sp, #0x14
    movne r0, #0x0
    ldmneia sp!, {r4, r5, lr}
    addne sp, sp, #0x10
    bxne lr
.L_1b4:
    ldrsb r2, [sp, #0x28]
    mov r0, r5
    add r1, r4, #0x28
    bl func_020581a8
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, lr}
    add sp, sp, #0x10
    bx lr
_LIT0: .word data_021001cc
_LIT1: .word data_021000d0
_LIT2: .word data_021001f0
