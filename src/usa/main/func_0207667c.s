; func_0207667c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101e48
        .extern data_02101e4c
        .extern data_02101e50
        .extern func_020766e0
        .extern func_02094688
        .global func_0207667c
        .arm
func_0207667c:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x30
    mov r4, r0
    ldr r1, _LIT0
    add r0, sp, #0x0
    mov r2, r4
    bl func_020766e0
    ldr r1, _LIT1
    add r0, sp, #0x10
    mov r2, r4
    bl func_020766e0
    ldr r1, _LIT2
    add r0, sp, #0x20
    mov r2, r4
    bl func_020766e0
    add r0, sp, #0x0
    mov r1, r4
    mov r2, #0x30
    bl func_02094688
    add sp, sp, #0x30
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word data_02101e48
_LIT1: .word data_02101e4c
_LIT2: .word data_02101e50
