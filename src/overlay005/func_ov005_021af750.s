; func_ov005_021af750 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov005_021b15b4
        .extern data_ov005_021b1abc
        .global func_ov005_021af750
        .arm
func_ov005_021af750:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r5, _LIT0
    mov r2, #0x0
    ldr r3, [r5, r1, lsl #0x2]
    ldrsb r3, [r3]
    cmp r3, #0x0
    beq .L_58
    mov ip, r2
.L_20:
    ldr r3, [r5, r1, lsl #0x2]
    add r4, r0, ip
    ldrsb r3, [r3, ip]
    add r2, r2, #0x1
    strb r3, [r4, #0x8c]
    ldr r3, [r5, r1, lsl #0x2]
    add r3, r3, ip
    ldrsb r3, [r3, #0x1]
    add ip, ip, #0x2
    strb r3, [r4, #0x8d]
    ldr r3, [r5, r1, lsl #0x2]
    ldrsb r3, [r3, ip]
    cmp r3, #0x0
    bne .L_20
.L_58:
    ldr r5, _LIT1
    mov r3, r1, lsl #0x1
    add r3, r3, #0x2
    add lr, r5, r1, lsl #0x1
    add ip, r5, r3
    ldrb r4, [r5, r1, lsl #0x1]
    ldrb lr, [lr, #0x1]
    ldrb r3, [r5, r3]
    ldrb r1, [ip, #0x1]
    add r4, lr, r4, lsl #0x8
    add r5, r1, r3, lsl #0x8
    cmp r4, r5
    bge .L_e4
    mov lr, r2, lsl #0x1
.L_90:
    and ip, r4, #0xff
    cmp ip, #0x7f
    beq .L_d8
    cmp ip, #0x40
    blt .L_ac
    cmp ip, #0xfd
    blt .L_c0
.L_ac:
    rsb r1, ip, #0x40
    and r1, r1, #0xff
    sub r1, r1, #0x1
    add r4, r4, r1
    b .L_d8
.L_c0:
    add r3, r0, lr
    mov r1, r4, asr #0x8
    strb r1, [r3, #0x8c]
    strb ip, [r3, #0x8d]
    add lr, lr, #0x2
    add r2, r2, #0x1
.L_d8:
    add r4, r4, #0x1
    cmp r4, r5
    blt .L_90
.L_e4:
    mov r4, r2
    cmp r2, #0x1a0
    bge .L_114
    mov r5, r2, lsl #0x1
    mov r1, #0x0
.L_f8:
    add r3, r0, r5
    strb r1, [r3, #0x8c]
    add r2, r2, #0x1
    strb r1, [r3, #0x8d]
    cmp r2, #0x1a0
    add r5, r5, #0x2
    blt .L_f8
.L_114:
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov005_021b1abc
_LIT1: .word data_ov005_021b15b4
