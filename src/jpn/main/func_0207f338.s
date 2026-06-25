; func_0207f338 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a0814
        .extern data_021a0914
        .extern data_021a0d14
        .extern data_021a0d54
        .extern data_021a0e54
        .extern data_021a1254
        .extern data_021a1294
        .extern data_021a1394
        .extern data_021a1794
        .extern func_02094398
        .global func_0207f338
        .arm
func_0207f338:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    mov r0, #0xc0
    mov r2, #0x400
    bl func_02094398
    ldr r1, _LIT1
    mov r0, #0xc0
    mov r2, #0x400
    bl func_02094398
    ldr r1, _LIT2
    mov r0, #0xc0
    mov r2, #0x400
    bl func_02094398
    ldr r0, _LIT3
    ldr r1, _LIT4
    mov r2, #0x100
    bl func_02094398
    ldr r0, _LIT3
    ldr r1, _LIT5
    mov r2, #0x100
    bl func_02094398
    ldr r0, _LIT3
    ldr r1, _LIT6
    mov r2, #0x100
    bl func_02094398
    ldr r0, _LIT3
    ldr r1, _LIT7
    mov r2, #0x40
    bl func_02094398
    ldr r0, _LIT3
    ldr r1, _LIT8
    mov r2, #0x40
    bl func_02094398
    ldr r0, _LIT3
    ldr r1, _LIT9
    mov r2, #0x40
    bl func_02094398
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_021a0914
_LIT1: .word data_021a0e54
_LIT2: .word data_021a1394
_LIT3: .word 0x0000ffff
_LIT4: .word data_021a0814
_LIT5: .word data_021a0d54
_LIT6: .word data_021a1294
_LIT7: .word data_021a0d14
_LIT8: .word data_021a1254
_LIT9: .word data_021a1794
