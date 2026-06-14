; func_ov011_021d0f38 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov011_021d4660
        .global func_ov011_021d0f38
        .arm
func_ov011_021d0f38:
    ldr r3, _LIT0
    mov r2, #0x28
    mla r3, r0, r2, r3
    ldr r0, [r3, #0xc]
    mov r2, r0, lsl #0x18
    cmp r1, r2, lsr #0x18
    bxeq lr
    bic r2, r0, #0xff
    and r0, r1, #0xff
    orr r0, r2, r0
    str r0, [r3, #0xc]
    bx lr
_LIT0: .word data_ov011_021d4660
