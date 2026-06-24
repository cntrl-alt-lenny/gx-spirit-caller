; func_020444d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219d998
        .extern data_0219d99c
        .extern func_02043a28
        .extern func_02043b20
        .extern func_02043b8c
        .extern func_02043bd8
        .extern func_02043c54
        .extern func_02093b08
        .extern func_02094688
        .extern func_020a662c
        .extern func_020a6764
        .global func_020444d8
        .arm
func_020444d8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x4
    ldr r2, _LIT0
    mov sl, r1
    ldr r8, [r2]
    bl func_02043a28
    ldr r1, _LIT1
    add r0, sl, #0x200
    bl func_020a6764
    mov r9, #0x0
    add r4, sl, #0x100
    add r6, sl, #0xf0
    mov r7, #0x100
    mov r5, #0xe
    mov fp, #0xfe
.L_3c:
    mov r0, r8
    mov r1, r7
    mov r2, sl
    bl func_02043c54
    cmp r0, #0x0
    bne .L_64
    bl func_02093b08
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_64:
    ldr r0, _LIT2
    mov r1, r6
    mov r2, r5
    bl func_02094688
    mov r1, sl
    mov r2, fp
    add r0, sl, #0x200
    bl func_020a662c
    strh r0, [sl, #0xfe]
.L_88:
    mov r0, r8
    mov r1, r7
    mov r2, sl
    bl func_02043bd8
    mov r0, sl
    mov r1, r8
    mov r2, r7
    mov r3, r4
    bl func_02043b8c
    cmp r0, #0x0
    beq .L_88
    add r9, r9, #0x1
    cmp r9, #0x2
    add r8, r8, #0x100
    blt .L_3c
    bl func_02043b20
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_0219d998
_LIT1: .word 0x0000a001
_LIT2: .word data_0219d99c
