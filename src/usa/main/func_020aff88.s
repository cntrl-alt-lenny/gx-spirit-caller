; func_020aff88 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020b1d94
        .global func_020aff88
        .arm
func_020aff88:
    stmdb sp!, {r0, r1, r2, r3}
    stmdb sp!, {r4, lr}
    ldr r1, [sp, #0xc]
    ldr r0, _LIT0
    mov r4, r2
    bic r3, r1, #-2147483648
    mov r2, #0x0
    str r2, [r4]
    cmp r3, r0
    ldr r0, [sp, #0x8]
    bge .L_34
    orrs r0, r3, r0
    bne .L_48
.L_34:
    ldr r0, [sp, #0x8]
    ldr r1, [sp, #0xc]
    ldmia sp!, {r4, lr}
    add sp, sp, #0x10
    bx lr
.L_48:
    cmp r3, #0x100000
    bge .L_74
    ldr r0, [sp, #0x8]
    ldr r1, [sp, #0xc]
    ldr r3, _LIT1
    bl func_020b1d94
    mvn r2, #0x35
    str r0, [sp, #0x8]
    str r1, [sp, #0xc]
    str r2, [r4]
    bic r3, r1, #-2147483648
.L_74:
    ldr r2, _LIT2
    ldr r0, _LIT3
    and r1, r1, r2
    orr r1, r1, #0xfe00000
    orr r1, r1, #0x30000000
    ldr r2, [r4]
    add r0, r0, r3, asr #0x14
    add r2, r2, r0
    ldr r0, [sp, #0x8]
    str r2, [r4]
    str r1, [sp, #0xc]
    ldmia sp!, {r4, lr}
    add sp, sp, #0x10
    bx lr
_LIT0: .word 0x7ff00000
_LIT1: .word 0x43500000
_LIT2: .word 0x800fffff
_LIT3: .word 0xfffffc02
