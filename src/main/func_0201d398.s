; func_0201d398 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c5db0
        .extern data_0218fedc
        .extern data_0218fef4
        .extern func_0200583c
        .extern func_0201c9b0
        .extern func_0201ce94
        .extern func_0201cf54
        .extern func_0201d07c
        .extern func_0202042c
        .extern func_02020814
        .extern func_02020b24
        .extern func_02092844
        .extern func_0209e8d0
        .global func_0201d398
        .arm
func_0201d398:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    mov r1, #0x1
    str r1, [r0]
    bl func_02020814
    ldr r0, _LIT1
    bl func_0209e8d0
    ldr r0, _LIT2
    bl func_02020b24
    ldr r0, _LIT3
    bl func_0200583c
    ldr r0, _LIT4
    bl func_0202042c
    ldr r0, _LIT5
    bl func_02092844
    ldr r0, _LIT6
    bl func_02092844
    bl func_0201d07c
    ldmia sp!, {r3, pc}
_LIT0: .word data_020c5db0
_LIT1: .word func_0201c9b0
_LIT2: .word func_0201cf54
_LIT3: .word func_0201ce94
_LIT4: .word 0x00000306
_LIT5: .word data_0218fedc
_LIT6: .word data_0218fef4
