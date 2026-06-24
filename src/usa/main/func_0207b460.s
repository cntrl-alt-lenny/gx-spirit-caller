; func_0207b460 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a07ac
        .global func_0207b460
        .arm
func_0207b460:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    bl OS_DisableIrq
    ldr r1, _LIT0
    mov r2, #0x0
    ldr r1, [r1]
    add r3, r1, #0x2000
    cmp r1, #0x0
    ldr r4, [r3, #0x264]
    bne .L_40
    bl OS_RestoreIrq
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r4, r5, lr}
    bx lr
.L_40:
    ands r3, r5, #0x8000
    beq .L_5c
    ldr r3, _LIT1
    orr r2, r2, r3
    ands r3, r5, r3
    ldreq r3, _LIT2
    orreq r5, r5, r3
.L_5c:
    ands r3, r5, #0x20000
    orrne r2, r2, #0x10000
    ands r3, r5, #0x80000
    orrne r2, r2, #0x40000
    ands r3, r5, #0x200000
    orrne r2, r2, #0x100000
    ands r3, r5, #0x800000
    orrne r2, r2, #0x400000
    mvn r2, r2
    and r2, r4, r2
    orr r2, r5, r2
    add r1, r1, #0x2000
    str r2, [r1, #0x264]
    bl OS_RestoreIrq
    mov r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word data_021a07ac
_LIT1: .word 0x00003ffe
_LIT2: .word 0x0000a082
