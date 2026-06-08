; func_ov002_021d81d4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021d479c
        .global func_ov002_021d81d4
        .arm
func_ov002_021d81d4:
    and r2, r0, #0x1
    orr r0, r2, #0x1e
    mov r1, r1, lsl #0x16
    orr r0, r0, r1, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
    ldr ip, _LIT0
    orr r2, r2, #0x5c
    mov r0, #0x3f
    mov r3, #0x0
    bx ip
_LIT0: .word func_ov002_021d479c
