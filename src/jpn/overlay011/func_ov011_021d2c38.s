; func_ov011_021d2c38 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov000_021b4d4c
        .global func_ov011_021d2c38
        .arm
func_ov011_021d2c38:
    ldr ip, _LIT0
    mov r1, r0
    add r0, r1, #0x8
    bx ip
_LIT0: .word data_ov000_021b4d4c
