; func_020329c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020329c4
        .arm
func_020329c4:
    stmdb sp!, {r3, lr}
    ldr ip, [sp, #0x8]
    ldr ip, [ip, #0xed8]
    cmp ip, #0x0
    ldmeqia sp!, {r3, pc}
    blx ip
    ldmia sp!, {r3, pc}
