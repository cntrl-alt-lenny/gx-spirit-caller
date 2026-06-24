; func_020a6420 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a9a28
        .extern data_021a9a2c
        .extern func_020919a4
        .extern func_02091c10
        .extern func_02094500
        .global func_020a6420
        .arm
func_020a6420:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x28
    ldr r6, _LIT0
    ldr r5, _LIT1
    mov r4, r0
    add r9, sp, #0x0
    mov r8, #0x0
    mov r7, #0x24
.L_20:
    mov r0, r9
    mov r1, r8
    mov r2, r7
    bl func_02094500
    bl OS_DisableIrq
    ldr r1, [r4, #0xc0]
    mov sl, r0
    cmp r1, #0x0
    bne .L_58
.L_44:
    mov r0, r8
    bl func_020919a4
    ldr r0, [r4, #0xc0]
    cmp r0, #0x0
    beq .L_44
.L_58:
    ldr lr, [r4, #0xc0]
    add ip, sp, #0x0
    ldmia lr!, {r0, r1, r2, r3}
    stmia ip!, {r0, r1, r2, r3}
    ldmia lr!, {r0, r1, r2, r3}
    stmia ip!, {r0, r1, r2, r3}
    ldr r1, [lr]
    mov r0, sl
    str r1, [ip]
    bl OS_RestoreIrq
    ldr r1, [sp]
    cmp r1, #0x0
    beq .L_98
    mov r0, r9
    blx r1
    str r0, [sp, #0x8]
.L_98:
    bl OS_DisableIrq
    ldr r1, [sp, #0x4]
    mov sl, r0
    strb r8, [r6, #0x22]
    cmp r1, #0x0
    beq .L_b8
    mov r0, r9
    blx r1
.L_b8:
    ldr r0, [r5]
    cmp r0, #0x0
    beq .L_d4
    mov r0, sl
    str r8, [r4, #0xc0]
    bl OS_RestoreIrq
    b .L_20
.L_d4:
    bl func_02091c10
    add sp, sp, #0x28
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    bx lr
_LIT0: .word data_021a9a2c
_LIT1: .word data_021a9a28
