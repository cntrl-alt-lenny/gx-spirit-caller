; func_ov002_0226ad40 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_0226ad60
        .global func_ov002_0226ad40
        .arm
func_ov002_0226ad40:
    cmp r2, #0x0
    mov r2, #0x0
    movne r2, #0x1
    cmp r3, #0x0
    ldr ip, _LIT0
    movne r2, #0x7
    bx ip
_LIT0: .word func_ov002_0226ad60
