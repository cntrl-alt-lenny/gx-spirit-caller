; func_0209bdc8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0209bdc8
        .arm
func_0209bdc8:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r1, [r0, #0x4]
    ldr r2, [r0]
    sub r3, r1, #0x2
    cmp r3, #0x1
    add lr, r2, #0x7d0
    ldr r4, _LIT0
    sublt lr, lr, #0x1
    ldr ip, [r0, #0x8]
    smull r0, r2, r4, lr
    addlt r3, r3, #0xc
    mov r1, #0x1a
    mul r0, r3, r1
    smull r1, r3, r4, lr
    ldr r5, _LIT1
    sub r0, r0, #0x2
    smull r4, r1, r5, r0
    mov r4, lr, lsr #0x1f
    mov r2, r2, asr #0x5
    mov r3, r3, asr #0x5
    add r3, r4, r3
    ldr r5, _LIT2
    add r2, r4, r2
    smull r2, r4, r5, r2
    sub r2, lr, r2
    mov r1, r1, asr #0x2
    mov r0, r0, lsr #0x1f
    add r1, r0, r1
    mov r4, r2, asr #0x1
    add r0, ip, r1
    add r1, r2, r4, lsr #0x1e
    add r2, r2, r0
    mov r6, r3, asr #0x1
    add r0, r3, r6, lsr #0x1e
    add r1, r2, r1, asr #0x2
    add r1, r1, r0, asr #0x2
    mov r0, #0x5
    mla r4, r3, r0, r1
    ldr r3, _LIT3
    mov r1, r4, lsr #0x1f
    smull r2, r0, r3, r4
    add r0, r4, r0
    mov r0, r0, asr #0x2
    ldr r2, _LIT4
    add r0, r1, r0
    smull r0, r1, r2, r0
    sub r0, r4, r0
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
_LIT0: .word 0x51eb851f
_LIT1: .word 0x66666667
_LIT2: .word 0x00000064
_LIT3: .word 0x92492493
_LIT4: .word 0x00000007
