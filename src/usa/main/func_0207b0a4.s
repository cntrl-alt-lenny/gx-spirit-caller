; func_0207b0a4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a07ac
        .global func_0207b0a4
        .arm
func_0207b0a4:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r1, _LIT0
    mov r2, r0
    ldr r1, [r1]
    mov r3, #0x0
    add r1, r1, #0x2000
    ldr r1, [r1, #0x264]
    mov r6, #0x1
    ldr r5, _LIT1
    ldr r4, _LIT2
.L_28:
    smull ip, lr, r5, r2
    mov lr, lr, asr #0x2
    mov ip, r2, lsr #0x1f
    add lr, ip, lr
    smull ip, lr, r4, lr
    sub lr, r2, ip
    add ip, lr, #0x1
    mov ip, r6, lsl ip
    ands ip, r1, ip
    bne .L_60
    add r3, r3, #0x1
    cmp r3, #0xd
    add r2, r2, #0x1
    blt .L_28
.L_60:
    ldr r1, _LIT1
    add r3, r0, r3
    smull r0, r4, r1, r3
    mov r4, r4, asr #0x2
    mov r0, r3, lsr #0x1f
    ldr r2, _LIT2
    add r4, r0, r4
    smull r0, r1, r2, r4
    sub r4, r3, r0
    add r0, r4, #0x1
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
_LIT0: .word data_021a07ac
_LIT1: .word 0x4ec4ec4f
_LIT2: .word 0x0000000d
