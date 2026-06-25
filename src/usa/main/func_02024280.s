; func_02024280 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020be638
        .global func_02024280
        .arm
func_02024280:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    ldr r1, _LIT0
    add ip, sp, #0x0
    mov r4, r0
    ldmia r1, {r0, r1, r2, r3}
    stmia ip, {r0, r1, r2, r3}
    add r2, r4, #0x68
    ldr r4, _LIT1
    ldr r3, _LIT2
    mov r1, #0x0
.L_244:
    ldrsh r0, [r2, #0x2]
    ldrsh r6, [r2, #0x4]
    ldrsh r5, [r2]
    mov lr, r0, asr #0x3
    mov r6, r6, asr #0x3
    ldr r0, [ip, r1, lsl #0x2]
    and r5, r3, r5, asr #0x3
    mov lr, lr, lsl #0x16
    mov r6, r6, lsl #0x16
    orr r5, r5, lr, lsr #0xc
    orr r5, r5, r6, lsr #0x2
    orr r5, r5, r0, lsl #0x1e
    str r5, [r4]
    ldrh lr, [r2, #0x6]
    add r1, r1, #0x1
    cmp r1, #0x4
    orr r0, lr, r0, lsl #0x1e
    str r0, [r4, #0x4]
    add r2, r2, #0x8
    blt .L_244
    mov r0, #0x1
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_020be638
_LIT1: .word 0x040004c8
_LIT2: .word 0x000003ff
