; func_020414d0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020414d0
        .arm
func_020414d0:
    ands r1, r0, #0x8000
    bicne r0, r0, #0x8000
    bx lr
