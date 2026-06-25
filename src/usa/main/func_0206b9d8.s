; func_0206b9d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ebf4
        .extern func_020689ac
        .global func_0206b9d8
        .arm
func_0206b9d8:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    ldr r2, _LIT0
    ldr r0, [r0]
    ldr r2, [r2]
    ldr r5, [r1]
    ldr r1, [r2, #0x498]
    mov r2, #0x0
    bl func_020689ac
    ldr r1, _LIT0
    mov r4, r0
    ldr r1, [r1]
    mov r0, r5
    ldr r1, [r1, #0x498]
    mov r2, #0x0
    bl func_020689ac
    ldr r1, _LIT0
    sub r0, r4, r0
    ldr r1, [r1]
    ldr r1, [r1, #0x49c]
    cmp r1, #0x0
    rsbeq r0, r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_0219ebf4
