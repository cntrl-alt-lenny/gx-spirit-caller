; func_02078374 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101ed4
        .extern func_02078424
        .extern func_02078c48
        .global func_02078374
        .arm
func_02078374:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r4, r1
    ldr r1, _LIT0
    mov r5, r0
    mov r2, #0x2c
    bl func_02078424
    mov r0, r4
    mov r1, r5
    mov r2, #0x14
    bl func_02078c48
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word data_02101ed4+0x101
