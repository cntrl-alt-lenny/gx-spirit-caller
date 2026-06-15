; func_0208bfc4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0208bfc4
        .arm
func_0208bfc4:
    stmdb sp!, {r4, lr}
    ldr r3, [r0, #0x4]
    ldr r2, [r1, #0x4]
    ldr r4, [r0]
    sub r2, r3, r2
    smull ip, r3, r2, r2
    ldr lr, [r1]
    ldr r2, [r0, #0x8]
    sub r4, r4, lr
    ldr r0, [r1, #0x8]
    smlal ip, r3, r4, r4
    sub r0, r2, r0
    smlal ip, r3, r0, r0
    mov r1, r3, lsl #0x2
    ldr r3, _LIT0
    mov r2, #0x1
    ldr r0, _LIT1
    strh r2, [r3]
    mov r2, ip, lsl #0x2
    str r2, [r0]
    orr r1, r1, ip, lsr #0x1e
    str r1, [r0, #0x4]
.L_58:
    ldrh r0, [r3]
    ands r0, r0, #0x8000
    bne .L_58
    ldr r0, _LIT2
    ldr r0, [r0]
    add r0, r0, #0x1
    mov r0, r0, asr #0x1
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word 0x040002b0
_LIT1: .word 0x040002b8
_LIT2: .word 0x040002b4
