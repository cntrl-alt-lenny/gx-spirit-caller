; func_0208002c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020800c4
        .global func_0208002c
        .arm
func_0208002c:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r0, [r0]
    ldr r0, [r0, #0x10]
    cmp r0, #0x0
    beq .L_270
.L_240:
    ldrh r2, [r0]
    cmp r2, r1
    bhi .L_264
    ldrh r2, [r0, #0x2]
    cmp r1, r2
    bhi .L_264
    bl func_020800c4
    add sp, sp, #0x4
    ldmfd sp!, {pc}
.L_264:
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    bne .L_240
.L_270:
    ldr r0, _LIT0
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word 0x0000ffff
