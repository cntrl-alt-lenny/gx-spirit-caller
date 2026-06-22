; func_02037ab4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219b200
        .extern data_0219b264
        .global func_02037ab4
        .arm
func_02037ab4:
    ldr r0, _LIT0
    ldrsh r1, [r0, #0x4]
    cmp r1, #0x0
    blt .L_20
    ldr r0, _LIT1
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x0
    bxne lr
.L_20:
    mov r0, #0x0
    bx lr
_LIT0: .word data_0219b200
_LIT1: .word data_0219b264
