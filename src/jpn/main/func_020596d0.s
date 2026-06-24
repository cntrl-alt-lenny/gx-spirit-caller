; func_020596d0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02100424
        .extern data_021004dc
        .extern data_021004f0
        .extern func_02045398
        .extern func_02055224
        .extern func_02056034
        .extern func_02056520
        .extern func_02058654
        .extern func_02059928
        .extern func_0205bdec
        .extern func_0205bea4
        .extern func_0205ff4c
        .extern func_0206043c
        .extern func_020a72e0
        .global func_020596d0
        .arm
func_020596d0:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x10
    mov r8, r0
    ldr r4, [r8]
    mov r7, r1
    ldr r1, [r4, #0x1d8]
    mov r6, r2
    mov r5, r3
    cmp r1, #0x4
    bne .L_d74
    bl func_02056520
    cmp r0, #0x0
    addne sp, sp, #0x10
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
.L_d74:
    ldr r0, [r4, #0x1d8]
    cmp r0, #0x0
    beq .L_d98
    ldr r1, _LIT0
    mov r0, r8
    bl func_0205ff4c
    add sp, sp, #0x10
    mov r0, #0x2
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_d98:
    ldr r0, [sp, #0x38]
    cmp r0, #0x0
    beq .L_db8
    cmp r0, #0x1
    bne .L_dc4
    mov r0, #0x1
    str r0, [r4, #0x10c]
    b .L_ddc
.L_db8:
    mov r0, #0x0
    str r0, [r4, #0x10c]
    b .L_ddc
.L_dc4:
    ldr r1, _LIT1
    mov r0, r8
    bl func_0205ff4c
    add sp, sp, #0x10
    mov r0, #0x2
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_ddc:
    mov r3, #0x1
    mov r1, r7
    add r0, r4, #0x110
    mov r2, #0x1f
    str r3, [r4, #0x10c]
    bl func_0206043c
    ldr r0, _LIT2
    mov r1, r6
    add r0, r4, r0
    mov r2, #0x15
    bl func_0206043c
    mov r1, r5
    add r0, r4, #0x144
    mov r2, #0x33
    bl func_0206043c
    ldr r0, _LIT3
    ldr r1, [sp, #0x28]
    add r0, r4, r0
    mov r2, #0x1f
    bl func_0206043c
    add r0, r4, #0x144
    bl func_02055224
    mov r0, #0x308
    bl func_02045398
    movs r4, r0
    bne .L_e5c
    ldr r1, _LIT4
    mov r0, r8
    bl func_0205ff4c
    add sp, sp, #0x10
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_e5c:
    mov r1, #0x0
    mov r2, #0x308
    bl func_020a72e0
    ldr r0, [sp, #0x3c]
    ldr r1, [sp, #0x2c]
    str r0, [r4, #0x304]
    ldrsb r0, [r1]
    cmp r0, #0x0
    beq .L_eb0
    ldr r0, [sp, #0x30]
    ldrsb r0, [r0]
    cmp r0, #0x0
    beq .L_eb0
    add r0, r4, #0xc2
    mov r2, #0x100
    bl func_0206043c
    ldr r0, _LIT5
    ldr r1, [sp, #0x30]
    add r0, r4, r0
    mov r2, #0x100
    bl func_0206043c
.L_eb0:
    ldr r1, [sp, #0x34]
    cmp r1, #0x0
    beq .L_ecc
    ldr r0, _LIT6
    mov r2, #0x41
    add r0, r4, r0
    bl func_0206043c
.L_ecc:
    ldr r1, [sp, #0x40]
    ldr r0, [sp, #0x44]
    str r1, [sp]
    str r0, [sp, #0x4]
    ldr r5, [sp, #0x48]
    add r3, sp, #0xc
    mov r0, r8
    mov r2, r4
    mov r1, #0x0
    str r5, [sp, #0x8]
    bl func_0205bdec
    cmp r0, #0x0
    addne sp, sp, #0x10
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r1, [sp, #0xc]
    mov r0, r8
    bl func_02059928
    movs r4, r0
    beq .L_f44
    ldr r1, [sp, #0xc]
    mov r0, r8
    str r4, [r1, #0x1c]
    ldr r1, [sp, #0xc]
    bl func_0205bea4
    mov r0, r8
    mov r1, #0x0
    bl func_02058654
    add sp, sp, #0x10
    mov r0, r4
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_f44:
    ldr r1, [sp, #0xc]
    ldr r0, [r1, #0x8]
    cmp r0, #0x0
    beq .L_f6c
    ldr r1, [r1, #0x18]
    mov r0, r8
    bl func_02056034
    cmp r0, #0x0
    addne sp, sp, #0x10
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
.L_f6c:
    mov r0, #0x0
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_021004dc
_LIT1: .word data_021004f0
_LIT2: .word 0x0000012f
_LIT3: .word 0x00000177
_LIT4: .word data_02100424
_LIT5: .word 0x000001c2
_LIT6: .word 0x000002c2
