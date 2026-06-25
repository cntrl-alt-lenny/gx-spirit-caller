; func_ov002_021d8fd0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021d46ac
        .global func_ov002_021d8fd0
        .arm
func_ov002_021d8fd0:
    cmp r0, #0x0
    movne r0, #0x8000
    mov r3, r2, lsr #0x10
    moveq r0, #0x0
    orr r0, r0, #0x3a
    mov r0, r0, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r3, r3, lsl #0x10
    ldr ip, _LIT0
    and r1, r1, #0xff
    mov r0, r0, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r3, r3, lsr #0x10
    bx ip
_LIT0: .word func_ov002_021d46ac
