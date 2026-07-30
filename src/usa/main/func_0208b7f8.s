; func_0208b7f8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0208b0f8
        .global func_0208b7f8
        .arm
func_0208b7f8:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    ldr ip, [sp, #0x10]
    mov r5, r0
    str ip, [sp]
    mov r4, r1
    bl func_0208b0f8
    ldr r0, [r5, #0x24]
    str r0, [r4, #0x24]
    ldr r0, [r5, #0x28]
    str r0, [r4, #0x28]
    ldr r0, [r5, #0x2c]
    str r0, [r4, #0x2c]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
