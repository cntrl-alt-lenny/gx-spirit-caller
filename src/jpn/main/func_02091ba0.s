; func_02091ba0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a62d8
        .extern func_02091b5c
        .extern func_02092184
        .extern func_0209223c
        .global func_02091ba0
        .arm
func_02091ba0:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    ldr r2, _LIT0
    mov r5, r0
    ldr r2, [r2]
    mov r4, r1
    cmp r2, #0x0
    beq .L_54
    ldr r1, _LIT1
    bl func_02092184
    str r4, [r5, #0x4]
    ldr r1, [r5]
    mov r0, r5
    orr r1, r1, #0x80
    str r1, [r5]
    mov r1, #0x1
    str r1, [r5, #0x64]
    bl func_0209223c
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
.L_54:
    mov r0, r4
    bl func_02091b5c
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word data_021a62d8
_LIT1: .word func_02091b5c
