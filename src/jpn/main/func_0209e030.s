; func_0209e030 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021025fc
        .extern func_0209ba6c
        .extern func_0209bbe8
        .global func_0209e030
        .arm
func_0209e030:
    stmfd sp!, {lr}
    sub sp, sp, #0xc
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r0, #0x10000
    bne .L_48
    bl func_0209bbe8
    add r0, sp, #0x0
    bl func_0209ba6c
    cmp r0, #0x0
    bne .L_48
    ldr r2, [sp, #0x8]
    ldr r0, [sp, #0x4]
    ldr r1, _LIT0
    add r0, r2, r0, lsl #0x8
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [r1]
.L_48:
    ldr r1, _LIT0
    ldr r0, [r1]
    add r0, r0, #0x1
    mov r0, r0, lsl #0x10
    mov r2, r0, lsr #0x10
    mov r0, r2, lsl #0x10
    str r2, [r1]
    mov r0, r0, lsr #0x10
    add sp, sp, #0xc
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021025fc
