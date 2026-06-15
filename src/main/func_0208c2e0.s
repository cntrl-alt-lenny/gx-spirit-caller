; func_0208c2e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0208c2e0
        .arm
func_0208c2e0:
    ldr r2, [r0, #0x4]
    ldr r3, [r0]
    smull ip, r1, r2, r2
    smlal ip, r1, r3, r3
    ldr r0, [r0, #0x8]
    ldr r3, _LIT0
    smlal ip, r1, r0, r0
    mov r2, #0x1
    mov r1, r1, lsl #0x2
    ldr r0, _LIT1
    strh r2, [r3]
    mov r2, ip, lsl #0x2
    str r2, [r0]
    orr r1, r1, ip, lsr #0x1e
    str r1, [r0, #0x4]
.L_358:
    ldrh r0, [r3]
    ands r0, r0, #0x8000
    bne .L_358
    ldr r0, _LIT2
    ldr r0, [r0]
    add r0, r0, #0x1
    mov r0, r0, asr #0x1
    bx lr
_LIT0: .word 0x040002b0
_LIT1: .word 0x040002b8
_LIT2: .word 0x040002b4
