; func_02073fdc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ee40
        .extern data_0219ee44
        .extern data_0219ee48
        .extern data_0219efd8
        .extern data_0219f098
        .extern func_0207404c
        .extern func_020743b0
        .extern func_02091a0c
        .extern func_02091a74
        .global func_02073fdc
        .arm
func_02073fdc:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    bl func_0207404c
    ldr r0, _LIT0
    bl func_02091a0c
    ldr r0, _LIT1
    bl func_02091a74
    ldr r1, _LIT2
    mov r0, #0x0
    str r0, [r1]
    bl func_020743b0
    ldr r1, _LIT3
    mov r2, #0x0
    ldr r0, _LIT4
    str r2, [r1]
    str r2, [r0]
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_0219efd8
_LIT1: .word data_0219f098
_LIT2: .word data_0219ee40
_LIT3: .word data_0219ee44
_LIT4: .word data_0219ee48
