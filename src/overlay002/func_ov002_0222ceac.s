; func_ov002_0222ceac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_022304d4
        .global func_ov002_0222ceac
        .arm
func_ov002_0222ceac:
    ldr r3, [r0, #0x14]
    sub r2, r3, #0x1
    str r2, [r0, #0x14]
    cmp r3, #0x0
    beq .L_2c
.L_14:
    ldr r2, [r0, #0x14]
    sub r1, r1, #0x18
    movs r3, r2
    sub r2, r2, #0x1
    str r2, [r0, #0x14]
    bne .L_14
.L_2c:
    ldr ip, _LIT0
    bx ip
_LIT0: .word func_ov002_022304d4
