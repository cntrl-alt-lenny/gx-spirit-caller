; func_0206b7a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ebf4
        .extern func_02053d68
        .extern func_0206b818
        .extern func_0206b888
        .extern func_0206b8f8
        .extern func_0206b9d8
        .global func_0206b7a0
        .arm
func_0206b7a0:
    cmp r3, #0x3
    addls pc, pc, r3, lsl #0x2
    b .L_3c
    b .L_1c
    b .L_24
    b .L_2c
    b .L_34
.L_1c:
    ldr r3, _LIT0
    b .L_40
.L_24:
    ldr r3, _LIT1
    b .L_40
.L_2c:
    ldr r3, _LIT2
    b .L_40
.L_34:
    ldr r3, _LIT3
    b .L_40
.L_3c:
    ldr r3, _LIT3
.L_40:
    str r2, [r0, #0x498]
    str r1, [r0, #0x49c]
    ldr r2, _LIT4
    ldr ip, _LIT5
    str r0, [r2]
    mov r1, r3
    ldr r0, [r0, #0x4]
    bx ip
_LIT0: .word func_0206b9d8
_LIT1: .word func_0206b8f8
_LIT2: .word func_0206b888
_LIT3: .word func_0206b818
_LIT4: .word data_0219ebf4
_LIT5: .word func_02053d68
