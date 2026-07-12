; func_ov008_021abf8c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov008_021abf8c
        .arm
func_ov008_021abf8c:
    stmdb sp!, {r3, lr}
    cmp r0, #0x3a
    sub r3, r0, #0x3a
    movlt r0, #0x0
    strlt r0, [r1]
    ldmltia sp!, {r3, pc}
    cmp r0, #0x79
    strge r2, [r1]
    ldmgeia sp!, {r3, pc}
    add r0, r2, #0x1
    mul ip, r3, r0
    ldr r3, _LIT0
    mov r0, ip, lsr #0x1f
    smull r2, lr, r3, ip
    add lr, ip, lr
    add lr, r0, lr, asr #0x5
    str lr, [r1]
    ldmia sp!, {r3, pc}
_LIT0: .word 0x82082083
