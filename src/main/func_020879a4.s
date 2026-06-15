; func_020879a4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0208787c
        .extern func_020950d4
        .extern func_02095270
        .extern func_020955a8
        .global func_020879a4
        .arm
func_020879a4:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    ldrb r0, [r5, #0x3c]
    ldr r4, [r5, #0x4]
    bl func_02095270
    ldr r2, [r4, #0x1c]
    cmp r2, #0x0
    beq .L_3f4
    ldrb r0, [r5, #0x3c]
    ldr r1, _LIT0
    bl func_020950d4
.L_3f4:
    mov r0, r5
    bl func_0208787c
    bl func_020955a8
    str r0, [r5, #0x30]
    mov r0, #0x1
    strb r0, [r5, #0x2f]
    strb r0, [r5, #0x2c]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word 0x0000ffff
