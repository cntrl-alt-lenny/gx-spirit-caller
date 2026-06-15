; func_020922d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02099ba8
        .global func_020922d8
        .arm
func_020922d8:
    stmdb sp!, {r0, lr}
    add r0, r0, #0x48
    ldr r1, _LIT0
    blx r1
    ldmia sp!, {r0, lr}
    add r1, r0, #0x0
    mrs r2, CPSR
    str r2, [r1], #0x4
    mov r0, #0xd3
    msr CPSR_c, r0
    str sp, [r1, #0x40]
    msr CPSR_c, r2
    mov r0, #0x1
    stmia r1, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}
    add r0, pc, #0x8
    str r0, [r1, #0x3c]
    mov r0, #0x0
    bx lr
_LIT0: .word func_02099ba8
