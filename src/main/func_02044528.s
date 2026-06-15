; func_02044528 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219da78
        .extern data_0219da7c
        .extern func_02043a78
        .extern func_02043b70
        .extern func_02043bdc
        .extern func_02043c28
        .extern func_02043ca4
        .extern func_02093bfc
        .extern func_02094688
        .extern func_020a6720
        .extern func_020a6858
        .global func_02044528
        .arm
func_02044528:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x4
    ldr r2, _LIT0
    mov sl, r1
    ldr r8, [r2]
    bl func_02043a78
    ldr r1, _LIT1
    add r0, sl, #0x200
    bl func_020a6858
    mov r9, #0x0
    add r4, sl, #0x100
    add r6, sl, #0xf0
    mov r7, #0x100
    mov r5, #0xe
    mov fp, #0xfe
.L_80:
    mov r0, r8
    mov r1, r7
    mov r2, sl
    bl func_02043ca4
    cmp r0, #0x0
    bne .L_a8
    bl func_02093bfc
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_a8:
    ldr r0, _LIT2
    mov r1, r6
    mov r2, r5
    bl func_02094688
    mov r1, sl
    mov r2, fp
    add r0, sl, #0x200
    bl func_020a6720
    strh r0, [sl, #0xfe]
.L_cc:
    mov r0, r8
    mov r1, r7
    mov r2, sl
    bl func_02043c28
    mov r0, sl
    mov r1, r8
    mov r2, r7
    mov r3, r4
    bl func_02043bdc
    cmp r0, #0x0
    beq .L_cc
    add r9, r9, #0x1
    cmp r9, #0x2
    add r8, r8, #0x100
    blt .L_80
    bl func_02043b70
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_0219da78
_LIT1: .word 0x0000a001
_LIT2: .word data_0219da7c
