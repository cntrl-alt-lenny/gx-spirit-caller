; func_ov002_021aff4c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce088
        .global func_ov002_021aff4c
        .arm
func_ov002_021aff4c:
    cmp r0, #0x100
    bxge lr
    ldr r2, _LIT0
    mov r3, r0, lsl #0x1
    ldrh r0, [r2, r3]
    and r1, r1, #0xff
    and r0, r0, #0xff
    orr r0, r0, r1, lsl #0x8
    strh r0, [r2, r3]
    bx lr
_LIT0: .word data_ov002_022ce088
