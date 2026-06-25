; func_0205c92c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02100a74
        .extern data_02100a84
        .extern data_02100b88
        .extern data_02100b8c
        .extern func_02053de4
        .extern func_0205405c
        .extern func_020540cc
        .extern func_02056bc0
        .extern func_0205ca40
        .extern func_02060430
        .extern func_020a6c60
        .global func_0205c92c
        .arm
func_0205c92c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    movs r4, r1
    ldr r6, [r5]
    bne .L_28
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r3, _LIT2
    mov r2, #0x0
    bl func_020a6c60
.L_28:
    ldr r1, [r6, #0x434]
    cmp r1, r4
    ldreq r0, [r4, #0x3c]
    streq r0, [r6, #0x434]
    beq .L_8c
    ldr r0, [r1, #0x3c]
    cmp r0, r4
    beq .L_84
.L_48:
    cmp r0, #0x0
    bne .L_74
    ldr r0, _LIT3
    ldr r1, _LIT1
    ldr r3, _LIT4
    mov r2, #0x0
    bl func_020a6c60
    ldr r1, _LIT5
    mov r0, r5
    bl func_02060430
    ldmia sp!, {r4, r5, r6, pc}
.L_74:
    mov r1, r0
    ldr r0, [r0, #0x3c]
    cmp r0, r4
    bne .L_48
.L_84:
    ldr r0, [r4, #0x3c]
    str r0, [r1, #0x3c]
.L_8c:
    ldr r0, [r4, #0x38]
    bl func_020540cc
    cmp r0, #0x0
    beq .L_ec
    mov r6, #0x0
.L_a0:
    ldr r0, [r4, #0x38]
    mov r1, r6
    bl func_0205405c
    ldr r2, [r0, #0x10]
    cmp r2, #0x64
    bge .L_d0
    ldr ip, [r0]
    ldr r3, [r0, #0x14]
    ldr r1, [r4, #0xc]
    mov r0, r5
    add r3, ip, r3
    bl func_02056bc0
.L_d0:
    ldr r0, [r4, #0x38]
    mov r1, r6
    bl func_02053de4
    ldr r0, [r4, #0x38]
    bl func_020540cc
    cmp r0, #0x0
    bne .L_a0
.L_ec:
    mov r0, r5
    mov r1, r4
    bl func_0205ca40
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_02100a74
_LIT1: .word data_02100a84
_LIT2: .word 0x00000213
_LIT3: .word data_02100b88
_LIT4: .word 0x00000225
_LIT5: .word data_02100b8c
