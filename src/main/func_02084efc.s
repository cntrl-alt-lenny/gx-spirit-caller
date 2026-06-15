; func_02084efc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0210249c
        .extern data_021a4824
        .extern data_021a4828
        .extern func_02084e0c
        .extern func_02084fbc
        .extern func_02084fe0
        .extern func_0209417c
        .extern func_02094378
        .global func_02084efc
        .arm
func_02084efc:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r4, r1
    mov r5, r0
    cmp r4, #0x100
    bcc .L_43c
    ldr r1, _LIT0
    mvn r0, #0x0
    ldr r1, [r1]
    cmp r1, r0
    bne .L_458
.L_43c:
    mov r2, r4, lsr #0x2
    ldr r0, [r5]
    add r1, r5, #0x4
    sub r2, r2, #0x1
    bl func_02084e0c
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
.L_458:
    bl func_02084fe0
    ldr r0, _LIT1
    ldr r1, _LIT2
    ldr r0, [r0]
    mov r2, #0x1
    str r2, [r1]
    cmp r0, #0x0
    beq .L_49c
    ldr r0, _LIT0
    str r1, [sp]
    ldr r0, [r0]
    ldr r3, _LIT3
    mov r1, r5
    mov r2, r4
    bl func_0209417c
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
.L_49c:
    ldr r0, _LIT0
    str r1, [sp]
    ldr r0, [r0]
    ldr r3, _LIT3
    mov r1, r5
    mov r2, r4
    bl func_02094378
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_0210249c
_LIT1: .word data_021a4828
_LIT2: .word data_021a4824
_LIT3: .word func_02084fbc
