; func_020876a8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020875a8
        .extern func_020950f4
        .extern func_020951b0
        .global func_020876a8
        .arm
func_020876a8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrb r0, [r4, #0x2c]
    cmp r0, #0x2
    bne .L_1d0
    ldrb r0, [r4, #0x3c]
    ldr r1, _LIT0
    bl func_020950f4
.L_1d0:
    ldrb r0, [r4, #0x3c]
    bl func_020951b0
    mov r0, r4
    bl func_020875a8
    ldmia sp!, {r4, pc}
_LIT0: .word 0xfffffd2d
