; func_02076764 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101f28
        .extern data_02101f2c
        .extern data_02101f30
        .extern func_020767c8
        .extern func_02094688
        .global func_02076764
        .arm
func_02076764:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x30
    mov r4, r0
    ldr r1, _LIT0
    add r0, sp, #0x0
    mov r2, r4
    bl func_020767c8
    ldr r1, _LIT1
    add r0, sp, #0x10
    mov r2, r4
    bl func_020767c8
    ldr r1, _LIT2
    add r0, sp, #0x20
    mov r2, r4
    bl func_020767c8
    add r0, sp, #0x0
    mov r1, r4
    mov r2, #0x30
    bl func_02094688
    add sp, sp, #0x30
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word data_02101f28
_LIT1: .word data_02101f2c
_LIT2: .word data_02101f30
