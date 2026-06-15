; func_0206b814 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ecd4
        .extern func_02053ddc
        .extern func_0206b88c
        .extern func_0206b8fc
        .extern func_0206b96c
        .extern func_0206ba4c
        .global func_0206b814
        .arm
func_0206b814:
    cmp r3, #0x3
    addls pc, pc, r3, lsl #0x2
    b .L_1e0
    b .L_1c0
    b .L_1c8
    b .L_1d0
    b .L_1d8
.L_1c0:
    ldr r3, _LIT0
    b .L_1e4
.L_1c8:
    ldr r3, _LIT1
    b .L_1e4
.L_1d0:
    ldr r3, _LIT2
    b .L_1e4
.L_1d8:
    ldr r3, _LIT3
    b .L_1e4
.L_1e0:
    ldr r3, _LIT3
.L_1e4:
    str r2, [r0, #0x498]
    str r1, [r0, #0x49c]
    ldr r2, _LIT4
    ldr ip, _LIT5
    str r0, [r2]
    mov r1, r3
    ldr r0, [r0, #0x4]
    bx ip
_LIT0: .word func_0206ba4c
_LIT1: .word func_0206b96c
_LIT2: .word func_0206b8fc
_LIT3: .word func_0206b88c
_LIT4: .word data_0219ecd4
_LIT5: .word func_02053ddc
