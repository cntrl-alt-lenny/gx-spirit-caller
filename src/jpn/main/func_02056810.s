; func_02056810 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ffe84
        .extern data_020ffe98
        .extern data_020ffea4
        .extern data_020ffeb0
        .extern data_020ffec0
        .extern data_020ffec8
        .extern data_020ffed4
        .extern data_020ffee0
        .extern func_02045364
        .extern func_020569c0
        .extern func_02057fc4
        .extern func_02057ffc
        .extern func_0205d44c
        .extern func_0205d4ec
        .extern func_0205d600
        .extern func_0205d648
        .extern func_0205ff4c
        .extern func_020a6c60
        .global func_02056810
        .arm
func_02056810:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r6, r0
    add r2, sp, #0x0
    ldr r5, [r6]
    bl func_0205d648
    cmp r0, #0x0
    bne .L_38
    ldr r1, _LIT0
    mov r0, r6
    bl func_0205ff4c
    add sp, sp, #0x8
    mov r0, #0x2
    ldmia sp!, {r4, r5, r6, pc}
.L_38:
    ldr r2, _LIT1
    mov r0, r6
    add r1, r5, #0x1f4
    bl func_02057ffc
    ldr r2, _LIT2
    mov r0, r6
    add r1, r5, #0x1f4
    bl func_02057ffc
    ldr r2, [r5, #0x198]
    mov r0, r6
    add r1, r5, #0x1f4
    bl func_02057fc4
    ldr r2, _LIT3
    mov r0, r6
    add r1, r5, #0x1f4
    bl func_02057ffc
    mov r0, r6
    add r1, r5, #0x1f4
    ldr r2, [sp]
    ldr r2, [r2]
    bl func_02057fc4
    mov r0, r6
    add r1, r5, #0x1f4
    ldr r2, _LIT4
    bl func_02057ffc
    ldr r0, [sp]
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    beq .L_17c
    ldr r4, [r0]
    cmp r4, #0x0
    bge .L_cc
    ldr r0, _LIT5
    ldr r1, _LIT6
    ldr r3, _LIT7
    mov r2, #0x0
    bl func_020a6c60
.L_cc:
    ldr r0, [sp]
    ldr r0, [r0, #0x8]
    ldr r0, [r0, #0x8]
    bl func_02045364
    ldr r0, [sp]
    mov r1, #0x0
    ldr r0, [r0, #0x8]
    str r1, [r0, #0x8]
    ldr r0, [sp]
    ldr r0, [r0, #0x8]
    ldr r0, [r0, #0xc]
    bl func_02045364
    ldr r0, [sp]
    mov r1, #0x0
    ldr r0, [r0, #0x8]
    str r1, [r0, #0xc]
    ldr r0, [sp]
    ldr r0, [r0, #0x8]
    bl func_02045364
    ldr r0, [sp]
    mov r1, #0x0
    str r1, [r0, #0x8]
    ldr r0, [sp]
    bl func_0205d44c
    cmp r0, #0x0
    beq .L_140
    ldr r1, [sp]
    mov r0, r6
    bl func_0205d600
.L_140:
    ldr r0, [r5, #0x430]
    sub r0, r0, #0x1
    str r0, [r5, #0x430]
    ldr r0, [r5, #0x430]
    cmp r0, #0x0
    bge .L_16c
    ldr r0, _LIT8
    ldr r1, _LIT6
    mov r2, #0x0
    mov r3, #0x204
    bl func_020a6c60
.L_16c:
    ldr r1, _LIT9
    mov r0, r6
    mov r2, r4
    bl func_0205d4ec
.L_17c:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_020ffe84
_LIT1: .word data_020ffe98
_LIT2: .word data_020ffea4
_LIT3: .word data_020ffeb0
_LIT4: .word data_020ffec0
_LIT5: .word data_020ffec8
_LIT6: .word data_020ffed4
_LIT7: .word 0x000001fd
_LIT8: .word data_020ffee0
_LIT9: .word func_020569c0
