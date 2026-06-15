; func_0207b13c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a088c
        .extern func_0207b0e0
        .global func_0207b13c
        .arm
func_0207b13c:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    ldr ip, _LIT0
    mov r5, r0
    ldr r0, [ip]
    mov r4, r1
    add r1, r0, #0x2200
    ldrsh r0, [r1, #0x80]
    mov ip, #0x0
    mov lr, r2
    strh ip, [r1, #0x80]
    str r3, [sp]
    mov r1, r5
    mov r2, r4
    mov r3, lr
    bl func_0207b0e0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word data_021a088c
