; func_ov011_021d2c54 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov011_021d2c54
        .arm
func_ov011_021d2c54:
    stmdb sp!, {r3, lr}
    ldr ip, [r0, #0x20]
    mov lr, r1, lsl #0x2
    ldrsh ip, [ip, lr]
    str ip, [r2]
    ldr r0, [r0, #0x20]
    add r0, r0, r1, lsl #0x2
    ldrsh r0, [r0, #0x2]
    str r0, [r3]
    ldmia sp!, {r3, pc}
