; func_02084a04 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern data_021a1a3c
        .extern func_02084ae0
        .extern func_02084b50
        .global func_02084a04
        .arm
func_02084a04:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x188
    mov r4, r0
    ldr r0, [r4]
    and r0, r0, #0x10
    cmp r0, #0x10
    bne .L_94
    add r1, r4, #0x3c
    mov r0, #0x0
    mov r2, #0x8
    bl Fill32
    add r1, r4, #0x44
    mov r0, #0x0
    mov r2, #0x8
    bl Fill32
    add r1, r4, #0x4c
    mov r0, #0x0
    mov r2, #0x8
    bl Fill32
    ldr r1, [r4, #0x8]
    cmp r1, #0x0
    beq .L_60
    add r0, r4, #0x3c
    bl func_02084ae0
.L_60:
    ldr r1, [r4, #0x10]
    cmp r1, #0x0
    beq .L_74
    add r0, r4, #0x44
    bl func_02084ae0
.L_74:
    ldr r1, [r4, #0x18]
    cmp r1, #0x0
    beq .L_88
    add r0, r4, #0x4c
    bl func_02084ae0
.L_88:
    ldr r0, [r4]
    bic r0, r0, #0x10
    str r0, [r4]
.L_94:
    ldr r2, _LIT0
    ldr r0, [r2]
    cmp r0, #0x0
    beq .L_b4
    mov r1, r4
    bl func_02084b50
    add sp, sp, #0x188
    ldmia sp!, {r4, pc}
.L_b4:
    add r0, sp, #0x0
    mov r1, r4
    str r0, [r2]
    bl func_02084b50
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0]
    add sp, sp, #0x188
    ldmia sp!, {r4, pc}
_LIT0: .word data_021a1a3c
