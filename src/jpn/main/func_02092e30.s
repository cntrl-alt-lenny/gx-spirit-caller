; func_02092e30 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a655c
        .global func_02092e30
        .arm
func_02092e30:
    ldr r1, _LIT0
    mrs r2, CPSR
    str r2, [r1, #0x74]
    str r0, [r1, #0x6c]
    ldr r0, [ip]
    str r0, [r1, #0x4]
    ldr r0, [ip, #0x4]
    str r0, [r1, #0x8]
    ldr r0, [ip, #0x8]
    str r0, [r1, #0xc]
    ldr r0, [ip, #0xc]
    str r0, [r1, #0x10]
    ldr r2, [ip, #0x10]
    bic r2, r2, #0x1
    add r0, r1, #0x14
    stmia r0, {r4, r5, r6, r7, r8, r9, sl, fp}
    str ip, [r1, #0x70]
    ldr r0, [r2]
    str r0, [r1, #0x64]
    ldr r3, [r2, #0x4]
    str r3, [r1]
    ldr r0, [r2, #0x8]
    str r0, [r1, #0x34]
    ldr r0, [r2, #0xc]
    str r0, [r1, #0x40]
    mrs r0, CPSR
    orr r3, r3, #0x80
    bic r3, r3, #0x20
    msr CPSR_fsxc, r3
    str sp, [r1, #0x38]
    str lr, [r1, #0x3c]
    mrs r2, SPSR
    str r2, [r1, #0x7c]
    msr CPSR_fsxc, r0
    bx lr
_LIT0: .word data_021a655c
