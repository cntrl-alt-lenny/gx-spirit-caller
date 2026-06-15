; func_02049554 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219dc80
        .global func_02049554
        .arm
func_02049554:
    stmdb sp!, {r4, lr}
    ldr lr, _LIT0
    mov ip, #0x0
    str r0, [lr]
    str ip, [r0]
    ldr r4, [lr]
    ldr r0, [sp, #0x8]
    str r1, [r4, #0x4]
    ldr r1, [lr]
    str ip, [r1, #0x8]
    ldr r1, [lr]
    str ip, [r1, #0xc]
    str ip, [r1, #0x10]
    str r0, [r1, #0x14]
    ldr r0, [lr]
    str r3, [r0, #0x18]
    ldr r0, [lr]
    strb ip, [r0, #0x1c]
    ldr r0, [lr]
    strb ip, [r0, #0x1d]
    ldr r0, [lr]
    strb ip, [r0, #0x1e]
    ldr r0, [lr]
    strb ip, [r0, #0x1f]
    ldr r0, [lr]
    str ip, [r0, #0x20]
    ldr r0, [lr]
    str ip, [r0, #0x24]
    ldr r0, [lr]
    str r2, [r0, #0x28]
    ldr r0, [lr]
    str ip, [r0, #0x2c]
    ldr r0, [lr]
    str ip, [r0, #0x30]
    ldr r0, [lr]
    str ip, [r0, #0x34]
    ldr r0, [lr]
    str ip, [r0, #0x38]
    ldr r0, [lr]
    str ip, [r0, #0x3c]
    ldr r0, [lr]
    str ip, [r0, #0x40]
    ldr r0, [lr]
    str ip, [r0, #0x44]
    ldr r0, [lr]
    str ip, [r0, #0x48]
    ldr r0, [lr]
    str ip, [r0, #0x4c]
    ldr r0, [lr]
    str ip, [r0, #0x50]
    ldr r0, [lr]
    str ip, [r0, #0x54]
    ldr r0, [lr]
    str ip, [r0, #0x58]
    ldmia sp!, {r4, pc}
_LIT0: .word data_0219dc80
