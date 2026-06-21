; func_0203c7c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0203c7c4
        .arm
func_0203c7c4:
    cmp r0, #0x2
    subhi r0, r0, #0x3
    andhi r0, r0, #0xff
    bx lr
