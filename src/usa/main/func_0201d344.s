; func_0201d344 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c5cd0
        .extern data_0218fdfc
        .extern data_0218fe14
        .extern func_02005820
        .extern func_0201c95c
        .extern func_0201ce40
        .extern func_0201cf00
        .extern func_0201d028
        .extern func_020203d8
        .extern func_020207c0
        .extern func_02020ad0
        .extern func_0209275c
        .extern func_0209e7dc
        .global func_0201d344
        .arm
func_0201d344:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    mov r1, #0x1
    str r1, [r0]
    bl func_020207c0
    ldr r0, _LIT1
    bl func_0209e7dc
    ldr r0, _LIT2
    bl func_02020ad0
    ldr r0, _LIT3
    bl func_02005820
    ldr r0, _LIT4
    bl func_020203d8
    ldr r0, _LIT5
    bl func_0209275c
    ldr r0, _LIT6
    bl func_0209275c
    bl func_0201d028
    ldmia sp!, {r3, pc}
_LIT0: .word data_020c5cd0
_LIT1: .word func_0201c95c
_LIT2: .word func_0201cf00
_LIT3: .word func_0201ce40
_LIT4: .word 0x00000306
_LIT5: .word data_0218fdfc
_LIT6: .word data_0218fe14
