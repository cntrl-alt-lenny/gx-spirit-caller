; func_02070bac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ef14
        .extern data_021a63d0
        .extern func_0207445c
        .extern func_02074720
        .extern func_020930b0
        .global func_02070bac
        .arm
func_02070bac:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0xa4]
    cmp r4, #0x0
    ldmeqia sp!, {r4, r5, r6, lr}
    bxeq lr
    ldrb r0, [r4, #0x9]
    cmp r0, #0x0
    beq .L_f70
    mov r0, r4
    bl func_02074720
.L_f70:
    bl func_020930b0
    mov r6, r0, lsr #0x10
    orr r6, r6, r1, lsl #0x10
    ldr r5, _LIT1
    b .L_f88
.L_f84:
    bl func_0207445c
.L_f88:
    ldr r0, [r5]
    blx r0
    cmp r0, #0x0
    beq .L_fbc
    ldrb r0, [r4, #0x8]
    cmp r0, #0x0
    beq .L_fbc
    bl func_020930b0
    mov r0, r0, lsr #0x10
    orr r0, r0, r1, lsl #0x10
    sub r0, r0, r6
    cmp r0, #0x27
    blt .L_f84
.L_fbc:
    mov r0, #0x0
    strb r0, [r4, #0x8]
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
_LIT0: .word data_021a63d0
_LIT1: .word data_0219ef14
