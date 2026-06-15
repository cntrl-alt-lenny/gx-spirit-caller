; func_0208787c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0208b0a4
        .extern func_0208b0d0
        .global func_0208787c
        .arm
func_0208787c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r0, #0x0
    strb r0, [r4, #0x2e]
    strb r0, [r4, #0x2d]
    strb r0, [r4, #0x2f]
    strh r0, [r4, #0x34]
    strh r0, [r4, #0x3e]
    mov r1, #0x7f
    strb r1, [r4, #0x40]
    add r0, r4, #0x1c
    strb r1, [r4, #0x41]
    bl func_0208b0d0
    add r0, r4, #0x1c
    mov r1, #0x7f00
    mov r2, #0x1
    bl func_0208b0a4
    ldmia sp!, {r4, pc}
