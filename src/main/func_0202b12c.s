; func_0202b12c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020be77c
        .extern data_02104f4c
        .extern func_02098038
        .global func_0202b12c
        .arm
func_0202b12c:
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x20
    ldrsb r3, [r1]
    mov r2, #0x0
    cmp r3, #0x0
    beq .L_5c
    ldr r3, _LIT0
    add lr, sp, #0x0
    ldr r3, [r3, #0x4]
    mov r3, r3, lsl #0x1d
    mov ip, r3, lsr #0x1d
    ldr r3, _LIT1
    ldr ip, [r3, ip, lsl #0x2]
.L_34:
    ldrsb r3, [r1, r2]
    add r2, r2, #0x1
    strb r3, [lr]
    cmp r3, #0x23
    ldreqsb r3, [ip]
    streqb r3, [lr]
    ldrsb r3, [r1, r2]
    add lr, lr, #0x1
    cmp r3, #0x0
    bne .L_34
.L_5c:
    add r1, sp, #0x0
    mov r3, #0x0
    strb r3, [r1, r2]
    bl func_02098038
    add sp, sp, #0x20
    ldmia sp!, {r3, pc}
_LIT0: .word data_02104f4c
_LIT1: .word data_020be77c
