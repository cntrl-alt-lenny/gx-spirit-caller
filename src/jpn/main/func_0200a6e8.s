; func_0200a6e8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Copy32
        .extern data_02104e5c
        .extern data_02104e6c
        .extern func_0200a46c
        .extern func_0202adc8
        .extern func_0202aeec
        .global func_0200a6e8
        .arm
func_0200a6e8:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x40
    ldr r0, _LIT0
    ldr r4, _LIT1
    ldr r0, [r0, #0x14]
    mov r5, #0x0
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_0202adc8
    add r0, sp, #0x20
    add r1, sp, #0x0
    bl func_0200a46c
    mov r3, r5
    add r2, sp, #0x20
.L_38:
    add r0, r4, r3, lsl #0x2
    add r0, r0, #0x1000
    ldr r1, [r2, r3, lsl #0x2]
    ldr r0, [r0, #0x868]
    teq r1, r0
    movne r5, #0x1
    bne .L_60
    add r3, r3, #0x1
    cmp r3, #0x8
    blt .L_38
.L_60:
    add r1, r4, #0x68
    add r0, sp, #0x20
    add r1, r1, #0x1800
    mov r2, #0x20
    bl Copy32
    add r1, r4, #0x88
    add r0, sp, #0x0
    add r1, r1, #0x1800
    mov r2, #0x20
    bl Copy32
    bl func_0202aeec
    mov r0, r5
    add sp, sp, #0x40
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_02104e5c
_LIT1: .word data_02104e6c
