; func_0206656c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0206656c
        .arm
func_0206656c:
    stmdb sp!, {r4, lr}
    mov r3, #0x0
.L_36c:
    add r2, r0, r3, lsl #0x2
    ldr r2, [r2, #0xd8]
    cmp r1, r2
    moveq r0, #0x1
    ldmeqia sp!, {r4, pc}
    add r3, r3, #0x1
    cmp r3, #0xa
    blt .L_36c
    ldr r2, [r0, #0x100]
    ldr r3, _LIT0
    add lr, r2, #0x1
    smull r2, r4, r3, lr
    mov r4, r4, asr #0x2
    mov r2, lr, lsr #0x1f
    ldr ip, _LIT1
    add r4, r2, r4
    smull r2, r3, ip, r4
    sub r4, lr, r2
    str r4, [r0, #0x100]
    ldr r2, [r0, #0x100]
    add r0, r0, r2, lsl #0x2
    str r1, [r0, #0xd8]
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word 0x66666667
_LIT1: .word 0x0000000a
