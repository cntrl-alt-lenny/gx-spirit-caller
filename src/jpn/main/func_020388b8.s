; func_020388b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219b200
        .global func_020388b8
        .arm
func_020388b8:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    ldr lr, [r0, #0x60]
    ldr ip, [r0, #0x5c]
    ldr r3, [r0, #0x60]
    ldr r2, [r0, #0x60]
    ldr r1, [r0, #0x5c]
    mov ip, ip, lsr #0x1
    and r1, r1, #0x1
    add r1, r2, r1
    add r1, r3, r1
    str r1, [r0, #0x60]
    ldr r1, [r0, #0x5c]
    orr r2, ip, lr, lsl #0x1f
    eor r1, r2, r1, lsl #0xc
    eor r1, r1, r1, lsr #0x14
    str r1, [r0, #0x5c]
    ldr r0, [r0, #0x5c]
    ldmia sp!, {r3, pc}
_LIT0: .word data_0219b200
