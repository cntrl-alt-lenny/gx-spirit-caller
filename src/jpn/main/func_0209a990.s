; func_0209a990 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a82fc
        .extern func_0209af20
        .extern func_0209af5c
        .global func_0209a990
        .arm
func_0209a990:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    cmp r0, #0x0
    beq .L_88
    cmp r0, #0x1
    bne .L_d4
    cmp r2, #0x0
    bne .L_48
    ldr r2, _LIT0
    ldr r0, _LIT1
    ldr r2, [r2]
    ldr r0, [r0]
    sub r0, r2, r0
    cmp r0, #0x7
    addls sp, sp, #0x4
    movls r0, #0x0
    ldmlsfd sp!, {lr}
    bxls lr
.L_48:
    cmp r1, #0x0
    beq .L_74
    cmp r3, #0x0
    beq .L_64
    mov r0, r1
    bl func_0209af20
    b .L_74
.L_64:
    mov r0, r1
    mov r1, #0x0
    mov r2, r1
    bl func_0209af5c
.L_74:
    ldr r1, _LIT2
    ldrh r0, [r1]
    orr r0, r0, #0x1
    strh r0, [r1]
    b .L_d4
.L_88:
    ldr lr, _LIT2
    ldr r2, _LIT0
    ldrh ip, [lr]
    ldr r0, _LIT1
    cmp r1, #0x0
    bic ip, ip, #0x1
    strh ip, [lr]
    ldr r2, [r2]
    str r2, [r0]
    beq .L_d4
    cmp r3, #0x0
    beq .L_c4
    mov r0, r1
    bl func_0209af20
    b .L_d4
.L_c4:
    mov r0, r1
    mov r1, #0x0
    mov r2, r1
    bl func_0209af5c
.L_d4:
    mov r0, #0x1
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word 0x027ffc3c
_LIT1: .word data_021a82fc
_LIT2: .word 0x04000304
