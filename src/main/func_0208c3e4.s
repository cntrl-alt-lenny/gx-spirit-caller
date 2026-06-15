; func_0208c3e4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0208c3e4
        .arm
func_0208c3e4:
    stmdb sp!, {r4, lr}
    ldr r3, [r0, #0x4]
    ldr r2, [r1, #0x4]
    ldr ip, [r0]
    smull r4, lr, r3, r2
    ldr r2, [r1]
    ldr r3, [r0, #0x8]
    smlal r4, lr, ip, r2
    ldr r1, [r1, #0x8]
    mov r0, #0x800
    smlal r4, lr, r3, r1
    adds r0, r4, r0
    adc r1, lr, #0x0
    mov r0, r0, lsr #0xc
    orr r0, r0, r1, lsl #0x14
    ldmia sp!, {r4, lr}
    bx lr
