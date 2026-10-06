; func_0207845c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021020b4
        .extern func_0207850c
        .extern func_02078d30
        .global func_0207845c
        .arm
func_0207845c:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r4, r1
    ldr r1, _LIT0
    mov r5, r0
    mov r2, #0x2c
    bl func_0207850c
    mov r0, r4
    mov r1, r5
    mov r2, #0x14
    bl func_02078d30
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word data_021020b4+0x1
