; func_02055744 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ffbf0
        .extern data_020ffc00
        .extern data_020ffc10
        .extern data_020ffc1c
        .extern func_0205d490
        .extern func_0205ff4c
        .extern func_0206043c
        .extern func_020a6c60
        .extern func_020a72e0
        .global func_02055744
        .arm
func_02055744:
    stmdb sp!, {r4, r5, r6, lr}
    movs r5, r0
    mov r4, r2
    beq .L_1c
    ldr r3, [r5]
    cmp r3, #0x0
    bne .L_24
.L_1c:
    mov r0, #0x2
    ldmia sp!, {r4, r5, r6, pc}
.L_24:
    ldr r2, [r3, #0x108]
    cmp r2, #0x0
    beq .L_48
    mov r0, r4
    mov r1, #0x0
    mov r2, #0x210
    bl func_020a72e0
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_48:
    cmp r4, #0x0
    bne .L_60
    ldr r1, _LIT0
    bl func_0205ff4c
    mov r0, #0x2
    ldmia sp!, {r4, r5, r6, pc}
.L_60:
    cmp r1, #0x0
    ldr r2, [r3, #0x430]
    blt .L_74
    cmp r1, r2
    blt .L_88
.L_74:
    ldr r1, _LIT1
    mov r0, r5
    bl func_0205ff4c
    mov r0, #0x2
    ldmia sp!, {r4, r5, r6, pc}
.L_88:
    bl func_0205d490
    movs r6, r0
    bne .L_a8
    ldr r1, _LIT1
    mov r0, r5
    bl func_0205ff4c
    mov r0, #0x2
    ldmia sp!, {r4, r5, r6, pc}
.L_a8:
    ldr r5, [r6, #0x8]
    cmp r5, #0x0
    bne .L_c8
    ldr r0, _LIT2
    ldr r1, _LIT3
    ldr r3, _LIT4
    mov r2, #0x0
    bl func_020a6c60
.L_c8:
    ldr r0, [r6]
    str r0, [r4]
    ldr r0, [r5, #0x4]
    str r0, [r4, #0x4]
    ldr r1, [r5, #0x8]
    cmp r1, #0x0
    moveq r0, #0x0
    streqb r0, [r1]
    beq .L_f8
    add r0, r4, #0x8
    mov r2, #0x100
    bl func_0206043c
.L_f8:
    ldr r1, [r5, #0xc]
    cmp r1, #0x0
    moveq r0, #0x0
    streqb r0, [r1]
    beq .L_118
    add r0, r4, #0x108
    mov r2, #0x100
    bl func_0206043c
.L_118:
    ldr r1, [r5, #0x10]
    mov r0, #0x0
    str r1, [r4, #0x208]
    ldr r1, [r5, #0x14]
    str r1, [r4, #0x20c]
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_020ffbf0
_LIT1: .word data_020ffc00
_LIT2: .word data_020ffc10
_LIT3: .word data_020ffc1c
_LIT4: .word 0x000005cf
