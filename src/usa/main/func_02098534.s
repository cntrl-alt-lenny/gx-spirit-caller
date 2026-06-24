; func_02098534 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a823c
        .extern func_0209bf00
        .extern func_0209bf20
        .global func_02098534
        .arm
func_02098534:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    cmp r1, #0x1
    beq .L_6c
    cmp r1, #0x9
    beq .L_24
    cmp r1, #0xa
    beq .L_48
    b .L_7c
.L_24:
    ldr r0, _LIT0
    ldr r0, [r0]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bl func_0209bf20
    add sp, sp, #0x4
    mov r0, #0x0
    ldmfd sp!, {lr}
    bx lr
.L_48:
    ldr r0, _LIT0
    ldr r0, [r0]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bl func_0209bf00
    add sp, sp, #0x4
    mov r0, #0x0
    ldmfd sp!, {lr}
    bx lr
.L_6c:
    add sp, sp, #0x4
    mov r0, #0x4
    ldmfd sp!, {lr}
    bx lr
.L_7c:
    mov r0, #0x8
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a823c
