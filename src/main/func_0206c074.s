; func_0206c074 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ecd8
        .extern data_0219ed1c
        .extern data_0219ed20
        .extern func_0206bf60
        .extern func_02092614
        .global func_0206c074
        .arm
func_0206c074:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    mov r0, #0x2c
    mul r1, r4, r0
    ldr r0, _LIT0
    mov r2, r4, lsl #0x2
    add r2, r2, #0x3
    ldr r0, [r0]
    add r1, r1, #0x3
    bic r5, r2, #0x3
    bic r2, r1, #0x3
    ldr r1, [r0, #0x18]
    add r0, r2, r5
    blx r1
    movs r6, r0
    mvneq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, lr}
    bxeq lr
    ldr r0, _LIT1
    mov r1, r6
    mov r2, r4
    bl func_02092614
    cmp r4, #0x0
    add r5, r6, r5
    ble .L_e0
.L_c8:
    mov r0, r5
    bl func_0206bf60
    sub r4, r4, #0x1
    cmp r4, #0x0
    add r5, r5, #0x2c
    bgt .L_c8
.L_e0:
    ldr r1, _LIT2
    mov r0, #0x0
    str r6, [r1]
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
_LIT0: .word data_0219ecd8
_LIT1: .word data_0219ed20
_LIT2: .word data_0219ed1c
