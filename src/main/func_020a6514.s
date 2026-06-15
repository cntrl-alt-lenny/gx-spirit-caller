; func_020a6514 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a9b08
        .extern data_021a9b0c
        .extern func_02091a8c
        .extern func_02091cf8
        .extern func_020945f4
        .global func_020a6514
        .arm
func_020a6514:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x28
    ldr r6, _LIT0
    ldr r5, _LIT1
    mov r4, r0
    add r9, sp, #0x0
    mov r8, #0x0
    mov r7, #0x24
.L_3c4:
    mov r0, r9
    mov r1, r8
    mov r2, r7
    bl func_020945f4
    bl OS_DisableIrq
    ldr r1, [r4, #0xc0]
    mov sl, r0
    cmp r1, #0x0
    bne .L_3fc
.L_3e8:
    mov r0, r8
    bl func_02091a8c
    ldr r0, [r4, #0xc0]
    cmp r0, #0x0
    beq .L_3e8
.L_3fc:
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
    beq .L_43c
    mov r0, r9
    blx r1
    str r0, [sp, #0x8]
.L_43c:
    bl OS_DisableIrq
    ldr r1, [sp, #0x4]
    mov sl, r0
    strb r8, [r6, #0x22]
    cmp r1, #0x0
    beq .L_45c
    mov r0, r9
    blx r1
.L_45c:
    ldr r0, [r5]
    cmp r0, #0x0
    beq .L_478
    mov r0, sl
    str r8, [r4, #0xc0]
    bl OS_RestoreIrq
    b .L_3c4
.L_478:
    bl func_02091cf8
    add sp, sp, #0x28
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    bx lr
_LIT0: .word data_021a9b0c
_LIT1: .word data_021a9b08
