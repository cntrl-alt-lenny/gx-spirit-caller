; func_020115c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020115c4
        .arm
func_020115c4:
    stmdb sp!, {r3, lr}
    mov lr, #0x1000
    str lr, [r0]
    mov ip, #0x0
    str ip, [r0, #0x4]
    str ip, [r0, #0x8]
    str ip, [r0, #0xc]
    str lr, [r0, #0x10]
    str ip, [r0, #0x14]
    str ip, [r0, #0x18]
    str ip, [r0, #0x1c]
    str lr, [r0, #0x20]
    str r1, [r0, #0x24]
    str r2, [r0, #0x28]
    str r3, [r0, #0x2c]
    ldmia sp!, {r3, pc}
