; func_0209223c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02099af4
        .global func_0209223c
        .arm
func_0209223c:
    stmdb sp!, {r0, lr}
    add r0, r0, #0x48
    ldr r1, _LIT0
    blx r1
    ldmia sp!, {r0, lr}
    mrs r1, CPSR
    bic r1, r1, #0x1f
    orr r1, r1, #0xd3
    msr CPSR_c, r1
    ldr r1, [r0], #0x4
    msr SPSR_fsxc, r1
    ldr sp, [r0, #0x40]
    ldr lr, [r0, #0x3c]
    ldmia r0, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
    nop
    subs pc, lr, #0x4
_LIT0: .word func_02099af4
