; func_02096f80 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020964b8
        .global func_02096f80
        .arm
func_02096f80:
    ldr r3, [r0, #0xc]
    mov r2, #0x0
    orr r3, r3, #0x4
    str r3, [r0, #0xc]
    ldr r3, [r0, #0x8]
    ldr ip, _LIT0
    str r3, [r0, #0x30]
    str r2, [r0, #0x38]
    strh r2, [r0, #0x36]
    strh r1, [r0, #0x34]
    mov r1, #0x2
    bx ip
_LIT0: .word func_020964b8
