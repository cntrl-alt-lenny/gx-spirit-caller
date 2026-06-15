; func_0207f420 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a08f4
        .extern data_021a09f4
        .extern data_021a0df4
        .extern data_021a0e34
        .extern data_021a0f34
        .extern data_021a1334
        .extern data_021a1374
        .extern data_021a1474
        .extern data_021a1874
        .extern func_0209448c
        .global func_0207f420
        .arm
func_0207f420:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    mov r0, #0xc0
    mov r2, #0x400
    bl func_0209448c
    ldr r1, _LIT1
    mov r0, #0xc0
    mov r2, #0x400
    bl func_0209448c
    ldr r1, _LIT2
    mov r0, #0xc0
    mov r2, #0x400
    bl func_0209448c
    ldr r0, _LIT3
    ldr r1, _LIT4
    mov r2, #0x100
    bl func_0209448c
    ldr r0, _LIT3
    ldr r1, _LIT5
    mov r2, #0x100
    bl func_0209448c
    ldr r0, _LIT3
    ldr r1, _LIT6
    mov r2, #0x100
    bl func_0209448c
    ldr r0, _LIT3
    ldr r1, _LIT7
    mov r2, #0x40
    bl func_0209448c
    ldr r0, _LIT3
    ldr r1, _LIT8
    mov r2, #0x40
    bl func_0209448c
    ldr r0, _LIT3
    ldr r1, _LIT9
    mov r2, #0x40
    bl func_0209448c
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_021a09f4
_LIT1: .word data_021a0f34
_LIT2: .word data_021a1474
_LIT3: .word 0x0000ffff
_LIT4: .word data_021a08f4
_LIT5: .word data_021a0e34
_LIT6: .word data_021a1374
_LIT7: .word data_021a0df4
_LIT8: .word data_021a1334
_LIT9: .word data_021a1874
