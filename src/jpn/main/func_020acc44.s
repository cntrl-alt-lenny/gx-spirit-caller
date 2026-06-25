; func_020acc44 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021aa380
        .extern func_020aaab8
        .extern func_020ac378
        .global func_020acc44
        .arm
func_020acc44:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x20
    mov r5, r0
    mov lr, #0x0
    mov r0, r2
    mov r4, r1
    add r2, sp, #0x1c
    str r5, [sp, #0xc]
    str lr, [sp, #0x10]
    str r2, [sp]
    add r1, sp, #0x18
    str r1, [sp, #0x4]
    add ip, sp, #0x14
    ldr r2, _LIT0
    add r3, sp, #0xc
    sub r1, lr, #-2147483647
    str ip, [sp, #0x8]
    bl func_020ac378
    cmp r4, #0x0
    ldrne r1, [sp, #0x1c]
    addne r1, r5, r1
    strne r1, [r4]
    ldr r1, [sp, #0x14]
    cmp r1, #0x0
    bne .L_8c
    ldr r2, [sp, #0x18]
    cmp r2, #0x0
    bne .L_7c
    mvn r1, #-2147483648
    cmp r0, r1
    bhi .L_8c
.L_7c:
    cmp r2, #0x0
    beq .L_b0
    cmp r0, #-2147483648
    bls .L_b0
.L_8c:
    ldr r0, [sp, #0x18]
    ldr r1, _LIT1
    mov r2, #0x22
    cmp r0, #0x0
    movne r0, #-2147483648
    str r2, [r1]
    add sp, sp, #0x20
    mvneq r0, #-2147483648
    ldmia sp!, {r3, r4, r5, pc}
.L_b0:
    cmp r2, #0x0
    rsbne r0, r0, #0x0
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word func_020aaab8
_LIT1: .word data_021aa380
