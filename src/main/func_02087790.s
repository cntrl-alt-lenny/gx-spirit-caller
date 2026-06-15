; func_02087790 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02087690
        .extern func_020951e8
        .extern func_020952a4
        .global func_02087790
        .arm
func_02087790:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrb r0, [r4, #0x2c]
    cmp r0, #0x2
    bne .L_1d0
    ldrb r0, [r4, #0x3c]
    ldr r1, _LIT0
    bl func_020951e8
.L_1d0:
    ldrb r0, [r4, #0x3c]
    bl func_020952a4
    mov r0, r4
    bl func_02087690
    ldmia sp!, {r4, pc}
_LIT0: .word 0xfffffd2d
