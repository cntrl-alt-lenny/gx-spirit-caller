; func_02070950 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a62f0
        .extern func_020709d8
        .extern func_02070a64
        .extern func_02074aa8
        .global func_02070950
        .arm
func_02070950:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    ldr r1, [r1, #0x4]
    ldr r1, [r1, #0xa4]
    cmp r1, #0x0
    beq .L_124
    ldrb r2, [r1, #0x8]
    add r2, r2, #0xf6
    and r2, r2, #0xff
    cmp r2, #0x1
    bhi .L_f8
    bl func_02070a64
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
.L_f8:
    ldrb r2, [r1, #0x9]
    cmp r2, #0x0
    beq .L_114
    bl func_02074aa8
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
.L_114:
    bl func_020709d8
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
.L_124:
    mov r1, #0x0
    str r1, [r0]
    mov r0, r1
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a62f0
