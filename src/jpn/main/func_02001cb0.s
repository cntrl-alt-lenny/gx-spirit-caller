; func_02001cb0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102b9c
        .global func_02001cb0
        .arm
func_02001cb0:
    stmdb sp!, {r3, lr}
    ldr ip, [r0, #0x24]
    mov r3, r1, lsl #0x1c
    bic ip, ip, #0x1e0000
    orr lr, ip, r3, lsr #0xb
    bic ip, lr, #0x1e00000
    mov r3, r2, lsl #0x1c
    orr ip, ip, r3, lsr #0x7
    str lr, [r0, #0x24]
    ldr r3, _LIT0
    str ip, [r0, #0x24]
    str r1, [r3, #0x8]
    str r2, [r3, #0x4]
    ldmia sp!, {r3, pc}
_LIT0: .word data_02102b9c
